//					                                                       //
//					project name:  ASR rocket flying control(on board)     //
//        	author:        Tom                                     //
//          department:    NSFZIB  ASR team                        //
//          hardware:      ASR microelectronics  "Nebula"          //
//                             STM32F103RET6                       //
//                             U-box GPS                           //
//                             X-Tend wireless data transmision    //
//                             micro-SD                            //
//                             ATmega328                           //
//          date:          2013/6/10                               //
//                                                                 //  
//          ALL COPY RIGHT RESERVE                                 //
//                                                                 //
/////////////////////////////////////////////////////////////////////


#include "stdio.h"
#include "string.h"
#include "stm32f10x_lib.h"


//sd part--only for testing
#include "config.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define SD_TEST_BLOCK_ADDR	0
//sd part



SPI_InitTypeDef SPI_InitStructure;
int flag;
int i;
u8 get;
int SD_BLOCK=3; 
extern int Timedisplay;
#define OPEN_Parachute 10


static char Responce[]="Wireless data transmition test completed@";
static char Responce2[]="GPS test completed@";
static char Responce3[]="clock test completed@";
static char Responce4[]="ALL test completed,wait for launching signal@";
static char Responce5[]="Go! Good Luck!@";

static char errorDatatransmition[]="Wireless transmistion test failed@";
static char errorGPS[]="GPS test failed@";
static char errorclock[]="clock test failed@";

void RCC_Configuration(void)
{
  ErrorStatus HSEStartUpStatus;
 
  RCC_DeInit();                                                      
  RCC_HSEConfig(RCC_HSE_ON);                    
  HSEStartUpStatus = RCC_WaitForHSEStartUp(); 
  if(HSEStartUpStatus == SUCCESS)                      
    {
      FLASH_PrefetchBufferCmd(ENABLE);          
      FLASH_SetLatency(FLASH_Latency_2);         
      RCC_HCLKConfig(RCC_SYSCLK_Div1);        
      RCC_PCLK2Config(RCC_HCLK_Div1);
      RCC_PCLK1Config(RCC_HCLK_Div2);
      RCC_PLLConfig(RCC_PLLSource_HSE_Div1,RCC_PLLMul_9);
      RCC_PLLCmd(ENABLE);                              
      while(RCC_GetFlagStatus(RCC_FLAG_PLLRDY)==RESET);                                                              
      RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);  
      while(RCC_GetSYSCLKSource() !=0x80);
			
			// the following is the selected part of the clock inicialization, according to your connecting devices
			
			//SPI1 clock open
			RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1,ENABLE);
			RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA,ENABLE);
			RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB,ENABLE);
			
			//USART-XTend (wireless data transmittion) clock open
			RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3, ENABLE);
      
			//USART-GPS clock open
			RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
			
			//USART-sensor clock open
			RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);
			
			//GPIO LED clock open
			RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC,ENABLE);
			
			//GPIO Launching clock open
			RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC,ENABLE);
			
			SysTick_ITConfig(ENABLE);
   }
}


void GPIO_Configuration(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;
	//setting SPI1
	GPIO_InitStructure.GPIO_Pin=GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7;
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_AF_PP;
	GPIO_Init(GPIOA,&GPIO_InitStructure);
	
	  /* Configure PC12 pin: CS pin */
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_Init(GPIOA, &GPIO_InitStructure);
	
	//setting USART1
	GPIO_InitStructure.GPIO_Pin=GPIO_Pin_9;
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_AF_PP;
	GPIO_Init(GPIOA,&GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;			 
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
  GPIO_Init(GPIOA, &GPIO_InitStructure);
	
  //setting USART2
	GPIO_InitStructure.GPIO_Pin=GPIO_Pin_2;
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_AF_PP;
	GPIO_Init(GPIOA,&GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_3;			 
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
  GPIO_Init(GPIOA, &GPIO_InitStructure);
	
	//setting USART3
	GPIO_InitStructure.GPIO_Pin=GPIO_Pin_10;
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_AF_PP;
	GPIO_Init(GPIOA,&GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11;			 
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
  GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	//setting LED: the system working indicator
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_14;		
  GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;	
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_Init(GPIOC, &GPIO_InitStructure);
	
	//setting Lunching
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_15;		
  GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;	
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_Init(GPIOC, &GPIO_InitStructure);
	
	//setting OPEN Parachute
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6;		
  GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;	
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_Init(GPIOC, &GPIO_InitStructure);
}

void SPI_Configuration(void)
{
	SPI_InitStructure.SPI_Direction=SPI_Direction_2Lines_FullDuplex;
  SPI_InitStructure.SPI_DataSize=SPI_DataSize_8b;
  SPI_InitStructure.SPI_CPOL=SPI_CPOL_High; 
  SPI_InitStructure.SPI_CPHA=SPI_CPHA_2Edge;
  SPI_InitStructure.SPI_NSS=SPI_NSS_Soft;
  SPI_InitStructure.SPI_BaudRatePrescaler=SPI_BaudRatePrescaler_2;
  SPI_InitStructure.SPI_FirstBit=SPI_FirstBit_MSB;
  SPI_InitStructure.SPI_CRCPolynomial=7;
	SPI_InitStructure.SPI_Mode=SPI_Mode_Master;
  SPI_Init(SPI1,&SPI_InitStructure);
  SPI_Cmd(SPI1,ENABLE);
}

void USART_Configuration(void)
{
  USART_InitTypeDef USART_InitStructure;       
	
  /*USART_ClockInitTypeDef  USART_ClockInitStructure;
  
  USART_ClockInitStructure.USART_Clock = USART_Clock_Enable;
  USART_ClockInitStructure.USART_CPOL = USART_CPOL_Low;
  USART_ClockInitStructure.USART_CPHA = USART_CPHA_2Edge;
  USART_ClockInitStructure.USART_LastBit = USART_LastBit_Disable;
  USART_ClockInit(USART1,&USART_ClockInitStructure); */

  USART_InitStructure.USART_BaudRate = 9600;
  USART_InitStructure.USART_WordLength = USART_WordLength_8b;
  USART_InitStructure.USART_StopBits = USART_StopBits_1;  
  USART_InitStructure.USART_Parity = USART_Parity_No ;	  
  USART_InitStructure.USART_HardwareFlowControl =  USART_HardwareFlowControl_None;
  USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
  USART_Init(USART1, &USART_InitStructure);
	USART_Init(USART2, &USART_InitStructure);
	USART_Init(USART3, &USART_InitStructure);
	
  USART_Cmd(USART1, ENABLE);
	USART_Cmd(USART2, ENABLE);
	USART_Cmd(USART3, ENABLE);
}



void NVIC_Configuration(void)
{
	NVIC_InitTypeDef NVIC_InitStructure;
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_1);
	NVIC_InitStructure.NVIC_IRQChannel =RTC_IRQChannel;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority =1;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority =0;
	NVIC_InitStructure.NVIC_IRQChannelCmd =ENABLE;
	NVIC_Init(&NVIC_InitStructure);
}

void RTC_Configuration(void)
{
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR | RCC_APB1Periph_BKP, ENABLE);
	PWR_BackupAccessCmd(ENABLE);
	BKP_DeInit();
	RCC_LSEConfig(RCC_LSE_ON);
	while(RCC_GetFlagStatus(RCC_FLAG_LSERDY) == RESET);
	RCC_RTCCLKConfig(RCC_RTCCLKSource_LSE);
	RCC_RTCCLKCmd(ENABLE);
	RTC_WaitForSynchro();
	RTC_WaitForLastTask();
	RTC_ITConfig(RTC_IT_SEC, ENABLE);
	RTC_WaitForLastTask();
	RTC_SetPrescaler(32767); 
	RTC_WaitForLastTask();	
}

//time interrupt: one second-----prototype in stm32f10x_it.c
//                               declare extern int variable Timedisplay
/*void RTC_IRQHandler(void)
{
  if (RTC_GetITStatus(RTC_IT_SEC) != RESET)
	{
		RTC_ClearITPendingBit(RTC_IT_SEC);
		Timedisplay++;
	}
}*/

void Systick_Configuration(void)
{
	SysTick_CounterCmd(SysTick_Counter_Disable);
	SysTick_CLKSourceConfig(SysTick_CLKSource_HCLK_Div8);
	SysTick_CounterCmd(SysTick_Counter_Clear);
	SysTick_SetReload(9000*1000*10); //delay for 10 seconds   
}

void delay(void)  //delay for 10 second
{
	SysTick_CounterCmd(SysTick_Counter_Enable);
	while(SysTick_GetFlagStatus(SysTick_FLAG_COUNT)==0);
	SysTick_CounterCmd(SysTick_Counter_Disable);
	SysTick_CounterCmd(SysTick_Counter_Clear);
}


int main(void)
{
	
	//only for sd testing
	u8 sd_recv_buf[512];
	u8 sd_send_buf[512];
	u8 ret = 1;
	// only for sd testing
	
	RCC_Configuration();
	GPIO_Configuration();
	SPI_Configuration();
	USART_Configuration();
	
	//only for sd testing
	ret = MSD_Init();
	ret = MSD_GetMediumCharacteristics();
	MSD_EarseBlock(0,Mass_Block_Count);
	//only for sd testing
	
	//system start working
	GPIO_SetBits(GPIOC,GPIO_Pin_14);
	
	//wait for the moment that the device has been fxed into the rocket
	for (i=0;i<6*5;i++) {delay();} //delay 10 minutes

  //self-testing
  
	//first, test wireless data transmition
	
	Timedisplay=0;
	while (Timedisplay<10)
	{
		USART_SendData(USART3, 'A'); 
	  while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
		
	  if ((USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			   && (USART_ReceiveData(USART3)==65)) //except "B"
		  {
				//static char Responce[]="Wireless data transmition test completed";
				for (i=0;i<strlen(Responce);i++)
				{
				  USART_SendData(USART3, Responce[i]); 
	        while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
				}
				break;
			}
		USART_ClearFlag(USART3, USART_FLAG_RXNE);
	}
	
	if (Timedisplay==10)
	{
		GPIO_ResetBits(GPIOC,GPIO_Pin_14);
		//Write into SD:ERROR in data transmition
		
		//only for testing
		for (i=0;i<strlen(errorDatatransmition);i++)
			{
				sd_send_buf[i]=errorDatatransmition[i];
			}
		ret = MSD_WriteBlock(sd_send_buf,0,512);
		//only for testing
		
		return(0);
	}
	
	//waiting for the continue order
	while (1)
	{
		if ((USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			   && (USART_ReceiveData(USART3)==78)) //except "N"
		  {
				break;
			}
		USART_ClearFlag(USART3, USART_FLAG_RXNE);
	}
	
	//second,test GPS
  Timedisplay=0;
	flag=0;
	while ((Timedisplay<60*5) &&
		     (!((USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			      && (USART_ReceiveData(USART3)==70))))  //except "G"
	{
	  if ((USART_GetFlagStatus(USART1, USART_FLAG_RXNE) == SET))
		  {
				flag=1;
				USART_SendData(USART3, USART_ReceiveData(USART1)); 
	      while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
			}
		USART_ClearFlag(USART1, USART_FLAG_RXNE);
	}
	
	if (flag==0)
	{
		GPIO_ResetBits(GPIOC,GPIO_Pin_14);
		for (i=0;i<strlen(errorGPS);i++)
		{
			USART_SendData(USART3, errorGPS[i]); 
	    while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
		}
		//Write into SD:ERROR in GPS
		for (i=0;i<strlen(errorGPS);i++)
			{
				sd_send_buf[i]=errorGPS[i];
			}
		ret = MSD_WriteBlock(sd_send_buf,1,512);
		return(0);
	}
	//static char Responce2[]="GPS test completed";
	for (i=0;i<strlen(Responce2);i++)
		{
			USART_SendData(USART3, Responce2[i]); 
	    while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
		}
		
	
	//waiting for the continue order
	while (1)
	{
		if ((USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			   && (USART_ReceiveData(USART3)==78)) //except "N"
		  {
				break;
			}
		USART_ClearFlag(USART3, USART_FLAG_RXNE);
	}
	
	//third, test clock
	USART_SendData(USART3, 'C'); 
	while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
	Timedisplay=0;
	flag=0;
	while ((Timedisplay<20) &&
		     (!((USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			      && (USART_ReceiveData(USART3)==68))));  //except "E"
	
	if ((abs(Timedisplay-10)<2) &&
		    (USART_ReceiveData(USART3)==68))
	{
		GPIO_ResetBits(GPIOC,GPIO_Pin_14);
		for (i=0;i<strlen(errorclock);i++)
		{
			USART_SendData(USART3, errorclock[i]); 
	    while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
		}
		//Write into SD:ERROR in timing
		//only for testing
		for (i=0;i<strlen(errorclock);i++)
			{
				sd_send_buf[i]=errorclock[i];
			}
		ret = MSD_WriteBlock(sd_send_buf,2,512);
		//only for testing
			
		return(0);
	}
  SysTick_CounterCmd(SysTick_Counter_Disable);
	SysTick_CounterCmd(SysTick_Counter_Clear);
	
	//static char Responce3[]="clock test completed";
	for (i=0;i<strlen(Responce3);i++)
		{
			USART_SendData(USART3, Responce3[i]); 
	    while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
		}
	
	//static char Responce4[]="ALL test completed,wait for launching signal";
	for (i=0;i<strlen(Responce4);i++)
		{
			USART_SendData(USART3, Responce4[i]); 
	    while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
		}
	
	while (!((USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			      && (USART_ReceiveData(USART3)==75))); //except for "L"
	
	delay();
  
	//static char Responce5[]="Go! Good Luck!";
	for (i=0;i<strlen(Responce5);i++)
		{
			USART_SendData(USART3, Responce5[i]); 
	    while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
		}
	
	//lunching
	GPIO_SetBits(GPIOC,GPIO_Pin_15);
	
	//flying, keep sending GPS signal
	i=0;
	Timedisplay=0;
	while(1)
	{
		if (Timedisplay>=OPEN_Parachute) 
		{
			GPIO_SetBits(GPIOC,GPIO_Pin_6);
		}
		if ((USART_GetFlagStatus(USART1, USART_FLAG_RXNE) == SET))
		  {
				get=USART_ReceiveData(USART1);
				USART_SendData(USART3, get); 
	      while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
				
				//writing GPS data in the SD
				sd_send_buf[i]=get;
				i++;
				if (i==512) 
				{
					ret = MSD_WriteBlock(sd_send_buf,SD_BLOCK,512);
					SD_BLOCK++;
					i=0;
				}
			  //only for testing
				
    }
		USART_ClearFlag(USART1, USART_FLAG_RXNE);
	}
	return(0);
}


