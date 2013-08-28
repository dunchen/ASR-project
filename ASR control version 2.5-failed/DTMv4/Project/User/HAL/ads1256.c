#include "../platform.h"
#include "../hardware.h"
#include "ads1256.h"

//fs = 72M / 10 / 256 = 28125sps
//fclk = 7.2M

//fs = 72M / 15 / 256 = 18750sps
//fclk = 4.8M

#define DELAY(N) delay_nus(N>>2) 
//delay time(us) = N/fCLK(MHz)

void io_config();
void spi_config();
void INT_config();
void clk_config();
uint8 spi_rw(uint8 data);

//Commands
#define WAKEUP      0xff
#define RDATA       0x01
#define RDATAC      0x03
#define SDATAC      0x0f
#define RREG        0x10
#define WREG        0x50
#define SELFCAL     0xf0
#define SELFOCAL    0xf1
#define SELFGCAL    0xf2
#define SYSOCAL     0xf3
#define SYSGCAL     0xf4
#define SYNC        0xfc
#define STANDBY     0xfd
#define RESET       0xfe

//Registers address
#define STATUS      0x00
#define MUX         0x01
#define ADCON       0x02
#define DRATE       0x03
#define IO          0x04
#define OFC_BASE    0x05
#define FSC_BASE    0x08

#define ADS1256_MUX(POS,NEG) ((POS<<4)|(NEG&0x0f))
#define ADS1256_CH_AINCOM -1

volatile uint8 recv_count;
volatile int32 recv_data;
void (*forward)(int32);

#define NDRDY_GET   GPIO_ReadInputDataBit (GPIOA,GPIO_Pin_12)

//#define CS_LOW();      GPIOB->BSRR = 0x1000;//GPIO_ResetBits(GPIOB,GPIO_Pin_12);//CS LOW
//#define CS_HIGH();     GPIOB->BSRR = 0x0010;//GPIO_SetBits(GPIOB,GPIO_Pin_12);//CS HIGH

#define CS_LOW();      GPIO_ResetBits(GPIOB,GPIO_Pin_12);//CS LOW
#define CS_HIGH();     GPIO_SetBits(GPIOB,GPIO_Pin_12);//CS HIGH

#define TIME_FACTOR 8 // =50/Fclk （转换为us数）

static void io_config(void)
{
    GPIO_InitTypeDef p;
    
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA|
                           RCC_APB2Periph_GPIOB|
                           RCC_APB2Periph_AFIO  ,ENABLE);
    
    p.GPIO_Mode = GPIO_Mode_IPU;
    p.GPIO_Pin = GPIO_Pin_14;
    p.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB,&p);

    p.GPIO_Mode = GPIO_Mode_IPU;
    p.GPIO_Pin = GPIO_Pin_12;
    p.GPIO_Speed = GPIO_Speed_10MHz;
    GPIO_Init(GPIOA,&p);

    p.GPIO_Mode = GPIO_Mode_AF_PP;
    p.GPIO_Pin = GPIO_Pin_13|GPIO_Pin_15;
    p.GPIO_Speed = GPIO_Speed_10MHz;
    GPIO_Init(GPIOB,&p);
    
    p.GPIO_Mode = GPIO_Mode_Out_PP;
    p.GPIO_Pin = GPIO_Pin_12;
    p.GPIO_Speed = GPIO_Speed_10MHz;
    GPIO_Init(GPIOB,&p);
    
    p.GPIO_Mode = GPIO_Mode_AF_PP;
    p.GPIO_Pin = GPIO_Pin_8;
    p.GPIO_Speed = GPIO_Speed_10MHz;
    GPIO_Init(GPIOA,&p);
}

static void spi_config(void)
{
    SPI_InitTypeDef p;
    
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2,ENABLE);
    
    /* SPI2 configuration */
    p.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
    p.SPI_Mode = SPI_Mode_Master;
    p.SPI_DataSize = SPI_DataSize_8b;
    p.SPI_CPOL = SPI_CPOL_Low;
    p.SPI_CPHA = SPI_CPHA_2Edge;
    p.SPI_NSS = SPI_NSS_Soft;
    p.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_64;
    // f_spi < fclk / 4 
    // f_spi = f_bus(36M max) / PRSC
    p.SPI_FirstBit = SPI_FirstBit_MSB;
    p.SPI_CRCPolynomial = 7;
    SPI_Init(SPI2, &p);

    SPI_Cmd(SPI2,ENABLE);
} 

static void NDRDY_INT_enable(void)
{
    EXTI_InitTypeDef EXTI_InitStructure;
  
    EXTI_InitStructure.EXTI_Line = EXTI_Line12;
    EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
    EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;
    EXTI_InitStructure.EXTI_LineCmd = ENABLE;
    EXTI_Init(&EXTI_InitStructure);
}

static void NDRDY_INT_disable(void)
{
    EXTI_InitTypeDef EXTI_InitStructure;
    
    EXTI_InitStructure.EXTI_Line = EXTI_Line12;
    EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
    EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;
    EXTI_InitStructure.EXTI_LineCmd = DISABLE;
    EXTI_Init(&EXTI_InitStructure);
}
                            

static void INT_config(void)//#DRDY -> PA12 -> EXTI15_10 , SPI2 RX
{
    NVIC_InitTypeDef NVIC_InitStructure;
    
    GPIO_EXTILineConfig(GPIO_PortSourceGPIOA,GPIO_PinSource12);
//独占这个IRQ 

    //在NDRDY_INT_enable()中设定
    NDRDY_INT_disable();
    /* Configure one bit for preemption priority */
    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_4);
  
    /* Enable the EXTI1 Interrupt */
    NVIC_InitStructure.NVIC_IRQChannel = EXTI15_10_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);
    
    /* Configure and enable SPI2 interrupt -------------------------------------*/
    NVIC_InitStructure.NVIC_IRQChannel = SPI2_IRQn; 
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
    NVIC_Init(&NVIC_InitStructure);

}

static void clk_config(void)
//provide clock 
{
    TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;   
    TIM_OCInitTypeDef        TIM_OCInitStructure;
  
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM1,ENABLE);
  
    TIM_DeInit(TIM1);
  
    //APB2时钟为72MHz 
    
    TIM_TimeBaseStructure.TIM_Prescaler = 1 - 1;//APB2时钟分频系数 
    TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
    TIM_TimeBaseStructure.TIM_Period = 15 - 1; 
    TIM_TimeBaseStructure.TIM_ClockDivision = TIM_CKD_DIV1;
    TIM_TimeBaseStructure.TIM_RepetitionCounter = 0;
    TIM_TimeBaseInit(TIM1,&TIM_TimeBaseStructure);
  
    TIM_ARRPreloadConfig(TIM1, ENABLE);
  
    //TIM1 CH1 in Toggle mode
    TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM1;
    TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
    TIM_OCInitStructure.TIM_OutputNState = TIM_OutputNState_Disable;
    TIM_OCInitStructure.TIM_Pulse = (15 - 1)/2;
    TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_Low;
    TIM_OCInitStructure.TIM_OCNPolarity = TIM_OCNPolarity_Low;
    TIM_OCInitStructure.TIM_OCIdleState = TIM_OCIdleState_Set;
    TIM_OCInitStructure.TIM_OCNIdleState = TIM_OCIdleState_Reset;
    TIM_OC1Init(TIM1,&TIM_OCInitStructure);
    
    TIM_OC1PreloadConfig(TIM1, TIM_OCPreload_Enable);
    
    /* TIM1 counter enable */
    TIM_Cmd(TIM1, ENABLE);
    /* TIM1 main Output Enable */
    TIM_CtrlPWMOutputs(TIM1, ENABLE); 
}

void timer_config(void)
//control channel cycling 
{
;
}

/*
void spi_recv_INT_enable(void)
{
    // Enable SPI2 RXNE interrupt 
    //SPI_I2S_ITConfig(SPI2, SPI_I2S_IT_RXNE, ENABLE);
}
*/

#define spi_recv_INT_enable() {SPI2->CR2 = SPI_I2S_IT_RXNE;}

/*
void spi_recv_INT_disable(void)
{
//   Disable SPI2 RXNE interrupt 
    SPI_I2S_ITConfig(SPI2, SPI_I2S_IT_RXNE, DISABLE);
}
*/
#define spi_recv_INT_disable() {SPI2->CR2 = 0x0000;}

void spi_sendbyte(vu8 va)
{
  while(!SPI_I2S_GetFlagStatus(SPI2,SPI_I2S_FLAG_TXE));
  SPI_I2S_SendData(SPI2, (uint16)va );
  while(!SPI_I2S_GetFlagStatus(SPI2,SPI_I2S_FLAG_RXNE));
  SPI_I2S_ReceiveData(SPI2);
}

u8 spi_recvbyte(void)
{
  u16 data;
  while(!SPI_I2S_GetFlagStatus(SPI2,SPI_I2S_FLAG_TXE));
  SPI_I2S_SendData(SPI2, 0x0000 );
  while(!SPI_I2S_GetFlagStatus(SPI2,SPI_I2S_FLAG_RXNE));
  data = SPI_I2S_ReceiveData(SPI2);
  
  return (data&0x00ff);
}

void spi_wait(void)
{
    while(SPI_I2S_GetFlagStatus(SPI2,SPI_I2S_FLAG_BSY));
}

uint8 ads1256_init(void (*f)(int32))
{
    uint8 id;
    
    io_config();
    spi_config();
    INT_config();
    clk_config();
  
    if(f == NULL) return -1;
    forward = f;
    
    CS_HIGH();
    delay_1ms();
    CS_LOW();
    spi_sendbyte(RESET);
    spi_wait();
    CS_HIGH();
    delay_1ms();
    
    CS_LOW();
    spi_sendbyte(WREG|STATUS);//write reg: start from STATUS
    spi_sendbyte(5-1);//write 5 regs, end at IO
    spi_sendbyte(0x02);//STATUS: MSB First, AutoCal off, Buffer Enabled
    spi_sendbyte(ADS1256_MUX(1,0));//MUX: pos = 1, neg = 0
    spi_sendbyte((0<<3)|(7));//ADCON: Sensor off, PGA = 64
//    spi_sendbyte(0xf0);//DRATE: 30ksps
    spi_sendbyte(0xb0);//DRATE: 2ksps -> 1875sps
    //spi_sendbyte(0xa1);
    spi_sendbyte(0xf0);//IO: All input
    spi_wait();
    DELAY(8);//8 tCLK
    CS_HIGH();
    DELAY(4);
    
    CS_LOW();
    spi_sendbyte(RREG|STATUS);
    spi_sendbyte(1-1);
    spi_wait();
    DELAY(50);
    id = spi_recvbyte()>>4;    
    spi_wait();
    DELAY(8);//8 tCLK
    CS_HIGH();
    DELAY(4);
   
    CS_LOW();
    spi_sendbyte(SELFCAL);
    spi_wait();
    DELAY(8);
    CS_HIGH();
    DELAY(50);
    while(NDRDY_GET);//等待校准完成 
   
    CS_LOW();
    spi_sendbyte(RDATAC);
    spi_wait();
    CS_HIGH();
    while(!NDRDY_GET);
    while(NDRDY_GET);
    
    NDRDY_INT_enable();
    return id;
}

void ads1256_deinit(void)
{
    ;
}

void ads1256_NDRDY_ISR(void)
{
    
    recv_count = 3;
    recv_data = 0;
    
    CS_LOW();
    while(!(SPI2->SR&SPI_I2S_FLAG_TXE));
    //SPI_I2S_SendData(SPI2,0x00);
    SPI2->DR = 0x00;
    
    spi_recv_INT_enable();
}

void ads1256_spi_recv_ISR(void)
{
    uint8 val;
    
    //LD3_1;
        
    recv_data <<= 8;
    //SPI_I2S_GetFlagStatus(SPI2,SPI_I2S_FLAG_OVR);
    val = SPI2->SR;
//    val = SPI_I2S_ReceiveData(SPI2);
//    val = 
//    uart1_putc(val);
    val = SPI2->DR;
    recv_data |= val;
    recv_count--;
    
    if(recv_count == 0)
    {
        spi_recv_INT_disable();
        if(recv_data&0x00800000)
        {
            recv_data |= 0xff000000;
        }
        (*forward)(recv_data);
        
    //uart1_senddata((uint8 *)&recv_data,4);

        CS_HIGH();
    }
//    else SPI_I2S_SendData(SPI2,0x00);
    else SPI2->DR=0x00;
    
  //      LD3_0;
}
