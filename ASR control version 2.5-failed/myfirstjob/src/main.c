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
//          ALL RIGHT RESERVED                                     //
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
u8 get;
extern int SD_BLOCK; 
extern int Timedisplay;

#define GPSDataLength 12
#define MaximeCach 5
extern u8 RxGPSBuffer[MaximeCach][GPSDataLength];
extern int GPSCachCounter;
extern int GPSRxCounter;

#define SensorDataLength 12
#define MaximeCach 5
extern u8 RxSensorBuffer[MaximeCach][SensorDataLength];
extern int SensorCachCounter;
extern int SensorRxCounter;

#define OPEN_Parachute 10

extern u32 Mass_Memory_Size;
extern u32 Mass_Block_Size;
extern u32 Mass_Block_Count;

static char Responce[]="Wireless data transmition test completed@";
static char Responce2[]="GPS test completed@";
static char Responce3[]="clock test completed@";
static char Responce4[]="ALL test completed,wait for launching signal@";
static char Responce5[]="Go! Good Luck!@";
static char Responce6[]="The parachute is open@";

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
      RCC_HCLKConfig(RCC_SYSCLK_Div1);        
      RCC_PCLK2Config(RCC_HCLK_Div1);
      RCC_PCLK1Config(RCC_HCLK_Div2);
      FLASH_SetLatency(FLASH_Latency_2);
			FLASH_PrefetchBufferCmd(ENABLE);
			RCC_PLLConfig(RCC_PLLSource_HSE_Div1,RCC_PLLMul_9);
      RCC_PLLCmd(ENABLE);                              
      while(RCC_GetFlagStatus(RCC_FLAG_PLLRDY)==RESET);                                                              
      RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);  
      while(RCC_GetSYSCLKSource() !=0x08);
			
			// the following is the selected part of the clock inicialization, according to your connecting devices
			
			//SPI1 clock open
			RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1,ENABLE);
			RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2,ENABLE);
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
	//setting SPI2
	GPIO_InitStructure.GPIO_Pin=GPIO_Pin_13|GPIO_Pin_14|GPIO_Pin_15;
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_AF_PP;
	GPIO_Init(GPIOB,&GPIO_InitStructure);
	
	GPIO_InitStructure.GPIO_Pin=GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7;
	GPIO_Init(GPIOA,&GPIO_InitStructure);
	/*//Configure PC12 pin: CS pin 
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_Init(GPIOA, &GPIO_InitStructure);
	*/
	
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
	GPIO_Init(GPIOB,&GPIO_InitStructure);
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
	
	//setting FAKE exitline
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1;		
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
  GPIO_Init(GPIOC, &GPIO_InitStructure);
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2;		
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
  GPIO_Init(GPIOC, &GPIO_InitStructure);
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_3;		
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
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
	SPI_InitStructure.SPI_Mode=SPI_Mode_Slave;
  SPI_Init(SPI2,&SPI_InitStructure);
  SPI_Cmd(SPI2,ENABLE);
	
	
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
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_3);

	
	/*# ifdef VECT_TAB_RAM
	   NVIC_SetVectorTable(NVIC_VecTab_RAM,0x0);
	# else
	   NVIC_SetVectorTable(NVIC_VecTab_FLASH,0x0);
	#endif*/
	
	//rtc interrupt setting
	NVIC_InitStructure.NVIC_IRQChannel =RTC_IRQChannel;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority =0;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelCmd =ENABLE;
	NVIC_Init(&NVIC_InitStructure);

	
	//usart1(GPS) reading interrupt setting	
	NVIC_InitStructure.NVIC_IRQChannel =USART1_IRQChannel;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority =1;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelCmd =ENABLE;
	NVIC_Init(&NVIC_InitStructure);
	
	//usart2(Sensor) reading interrupt setting	
	NVIC_InitStructure.NVIC_IRQChannel =USART2_IRQChannel;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority =1;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelCmd =ENABLE;
	NVIC_Init(&NVIC_InitStructure);
	
	//GPS data transmission interrupt setting(exit0)
	NVIC_InitStructure.NVIC_IRQChannel = EXTI0_IRQChannel;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 3;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;                                   //????
  NVIC_Init(&NVIC_InitStructure);
	
	//Sensor data transmission interrupt setting(exit1)
	NVIC_InitStructure.NVIC_IRQChannel = EXTI1_IRQChannel;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 3;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;                                   //????
  NVIC_Init(&NVIC_InitStructure);
	
	//Sensor Data recoeding interrupt setting(exit2)
	NVIC_InitStructure.NVIC_IRQChannel = EXTI2_IRQChannel;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 2;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;                                   //????
  NVIC_Init(&NVIC_InitStructure);
}

void EXTI_cfg()
{
       EXTI_InitTypeDef EXTI_InitStructure;

       EXTI_ClearITPendingBit(EXTI_Line0);
       EXTI_ClearITPendingBit(EXTI_Line1);
       EXTI_ClearITPendingBit(EXTI_Line2);
 

       GPIO_EXTILineConfig(GPIO_PortSourceGPIOC, GPIO_PinSource1);
       GPIO_EXTILineConfig(GPIO_PortSourceGPIOC, GPIO_PinSource2);
       GPIO_EXTILineConfig(GPIO_PortSourceGPIOC, GPIO_PinSource3);
 
       EXTI_InitStructure.EXTI_Line = EXTI_Line0 | EXTI_Line1 | EXTI_Line2;
       EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
       EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;
       EXTI_InitStructure.EXTI_LineCmd = ENABLE;                                          //??????
      EXTI_Init(&EXTI_InitStructure);
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

int main(void)
{
	
	int flag;
  int i;
	
	//only for sd testing
	extern u8 sd_recv_buf[512];
	extern u8 sd_send_buf[512];
	u8 ret = 1;
	// only for sd testing
	
	RCC_Configuration();
//	RTC_Configuration();
	GPIO_Configuration();
	SPI_Configuration();
	NVIC_Configuration();
	USART_Configuration();
	EXTI_cfg();
	
	
	/*/only for SPI testing
	while (1)
	{
	  SPI_I2S_SendData(SPI1,'A');
		while (SPI_I2S_GetFlagStatus(SPI1,SPI_I2S_FLAG_TXE)==RESET);
		while (SPI_I2S_GetFlagStatus(SPI2,SPI_I2S_FLAG_RXNE)==RESET);
		USART_SendData(USART3, SPI_I2S_ReceiveData(SPI2));
		while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
	}
	//end SPI testing*/
	
	
	//only for sd testing
	ret = MSD_Init();
	USART_SendData(USART3, ret); 
	while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
	USART_SendData(USART3, '*'); 
	while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
	ret = MSD_GetMediumCharacteristics();
	USART_SendData(USART3, Mass_Block_Count); 
	while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
	USART_SendData(USART3, '*'); 
	while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
	USART_SendData(USART3, Mass_Block_Size); 
	while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
	USART_SendData(USART3, '*'); 
	while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
	USART_SendData(USART3, Mass_Memory_Size); 
	while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
	MSD_EarseBlock(0,Mass_Block_Count);
	//only for sd testing
	
	//system start working
	GPIO_SetBits(GPIOC,GPIO_Pin_14);
	
	//wait for the moment that the device has been fxed into the rocket
//	for (i=0;i<6*5;i++) {delay();} //delay 10 minutes

  //self-testing
  
	//first, test wireless data transmition
	
	Timedisplay=0;
	while (Timedisplay<10)
	{
		USART_SendData(USART3, 'A'); 
	  while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
		
	  if ((USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			   && (USART_ReceiveData(USART3)==66)) //except "B"
		  {
				//static char Responce[]="Wireless data transmition test completed";
				for (i=0;i<strlen(Responce);i++)
				{
				  USART_SendData(USART3, Responce[i]); 
	        while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
				}
				break;
			}
		//USART_ClearFlag(USART3, USART_FLAG_RXNE);
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
	for (i=0;i<4000;i++);
	while (1)
	{
		if ((USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			   && (USART_ReceiveData(USART3)==78)) //except "N"
		  {
				break;
			}
		//USART_ClearFlag(USART3, USART_FLAG_RXNE);
	}
	
	//second,test GPS
  Timedisplay=0;
	flag=1;
	while ((Timedisplay<60*5) &&
		     (!((USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			      && (USART_ReceiveData(USART3)==71))))  //except "G"
	{
	  if ((USART_GetFlagStatus(USART1, USART_FLAG_RXNE) == SET))
		  {
				flag=1;
				USART_SendData(USART3, USART_ReceiveData(USART1)); 
	      while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
			}
		//USART_ClearFlag(USART1, USART_FLAG_RXNE);
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
	for (i=0;i<4000;i++);
	while (1)
	{
		if ((USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			   && (USART_ReceiveData(USART3)==78)) //except "N"
		  {
				break;
			}
		//USART_ClearFlag(USART3, USART_FLAG_RXNE);
	}
	
	//third, test clock
	USART_SendData(USART3, 'C'); 
	while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
	Timedisplay=0;
	flag=0;
	while ((Timedisplay<20) &&
		     (!((USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			      && (USART_ReceiveData(USART3)==69))));  //except "E"
	
	if ((abs(Timedisplay-10)>2) &&
		    (USART_ReceiveData(USART3)==69))
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
			      && (USART_ReceiveData(USART3)==76))); //except for "L"
	
	//delay();
  
	//static char Responce5[]="Go! Good Luck!";
	for (i=0;i<strlen(Responce5);i++)
		{
			USART_SendData(USART3, Responce5[i]); 
	    while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
		}

	
	/* Enable the USART Receive interrupt: this interrupt is generated when the
     USART1 receive data register is not empty */
  USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
  USART_ITConfig(USART2, USART_IT_RXNE, ENABLE);
  //USART_ITConfig(USART3, USART_IT_RXNE, ENABLE);
	Timedisplay=0;
	while(1)
	{
		if (Timedisplay>=OPEN_Parachute) 
		{
			GPIO_SetBits(GPIOC,GPIO_Pin_6);
			//static char Responce6[]="The parachute is open@";
	    for (i=0;i<strlen(Responce6);i++)
	    	{
	     		USART_SendData(USART3, Responce6[i]); 
	        while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
		    }
		}
	}
	return(0);
}


