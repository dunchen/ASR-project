//					                                                       //
//					project name:  ASR rocket flying control(on ground)    //
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

//for sd reading mode
#include "config.h"
//////////////////////////

int i;
SPI_InitTypeDef SPI_InitStructure;
u8 get;

static char Responce0[]="System starts....wait for the rocket prepared";
static char Responce[]="Wireless data transmition test failed";
static char Responce2[]="Wait for permission...enter [Y]es or n[O]";
static char Responce3[]="Enter flying mode...";
static char Responce4[]="SD reading mode or flying mode......enter [S]D or [F]lying";
static char Responce4_2[]="Entering SD reading mode....sensor data or flying error data......enter [S]esor or [F]lying";


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
      while(RCC_GetSYSCLKSource() !=0x08);
			
			// the following is the selected part of the clock inicialization, according to your connecting devices
			
			//SPI1 clock open
			RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1,ENABLE);
			RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA,ENABLE);
			RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB,ENABLE);
			
			//note: USART2 and USART3 are in APB1 while USART1 is on APB2  
			//USART-XTend (wireless data transmittion) clock open
			RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);
			
			//USART-XTend-GPS (GPS data transmittion) clock open
			RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
			
			//USART-XTend-terminal (other data transmittion) clock open
			RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3, ENABLE);
   }
}

void GPIO_Configuration(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;
	//setting SPI1
	GPIO_InitStructure.GPIO_Pin=GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7;
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_AF_PP;
	GPIO_Init(GPIOA,&GPIO_InitStructure);
	
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

  USART_InitStructure.USART_BaudRate = 115200;
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

void Systick_Configuration(void)
{
	SysTick_CounterCmd(SysTick_Counter_Disable);
	SysTick_CLKSourceConfig(SysTick_CLKSource_HCLK_Div8);
	SysTick_CounterCmd(SysTick_Counter_Clear);
	SysTick_SetReload(9000*1000); //delay for 10 seconds   
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
	/////////////////////////////////
	//for sd reading mode 
	int blockcount=3;
	unsigned char sd_recv_buf[512];
	///////////////////////////////////
	unsigned char tt;
	
	RCC_Configuration();
	GPIO_Configuration();
	Systick_Configuration();
	//SPI_Configuration();
	USART_Configuration();
	
	//system start working
	for (i=0;i<strlen(Responce0);i++)
		{
		  USART_SendData(USART3, Responce0[i]); 
	    while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
		}
	
	
	//choosing mode
	for (i=0;i<strlen(Responce4);i++)
				{
				  USART_SendData(USART3, Responce4[i]); 
	        while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
				}
	
	
	get=0;
	while (1)
	{
		if (USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			{
				get= USART_ReceiveData(USART3);
				break;
		  }			
	}
	if (get==83)
	{
		for (i=0;i<strlen(Responce4_2);i++)
		{
		  USART_SendData(USART3, Responce4_2[i]); 
	    while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
		}
		while (1)
	  {
		  if (USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
		  	{
		  		get= USART_ReceiveData(USART3);
	  			break;
	  	  }			
	  }
		if (get==83)
			{
				i = MSD_Init();
				i=MSD_ReadBlock(sd_recv_buf,blockcount,512);
				while (sd_recv_buf[511]!=0x00)
				{
					for (i=0;i<512;i++)
						{
							USART_SendData(USART3, sd_recv_buf[i]); 
							while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
						}
					blockcount++;
					i=MSD_ReadBlock(sd_recv_buf,blockcount,512);
				}
			}
		else
		{
			i = MSD_Init();
			i=MSD_ReadBlock(sd_recv_buf,0,512);
			for (i=0;i<512;i++)
						{
							USART_SendData(USART3, sd_recv_buf[i]); 
							while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
						}
		}
		while(1);
	}
	
	//self-testing
	//first, test wireless data transmition
	while (1)
	{
	  if ((USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == SET)
			   && (USART_ReceiveData(USART2)==65)) //except "A"
		  {
				USART_SendData(USART2, 'B'); 
	      while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET);
				USART_SendData(USART2, 'B'); 
	      while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET);
				USART_SendData(USART2, 'B'); 
	      while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET);
				//USART_ClearFlag(USART2, USART_FLAG_RXNE);
				break;
			}
	}
	
	
	//short delay in order to avoid missing data
	//for (i=0;i<1000000;i++);
	
  //testing string transmition
	while (1)
	{
		if ((USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == SET))
		  {
				//USART_ClearFlag(USART2, USART_FLAG_RXNE);
				get=USART_ReceiveData(USART2);
				if (get==64) break;  
				USART_SendData(USART3, get);
				while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
				//for (i=0;i<100;i++);
			}
	}
	
	//wait for the reponce of the terminal
	for (i=0;i<strlen(Responce2);i++)
				{
				  USART_SendData(USART3, Responce2[i]); 
	        while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
				}
	while (1)
	{
		if ((USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			   && (USART_ReceiveData(USART3)==89)) //except "Y"
		  {
				break;
			}
	}
	//continue the program
	USART_SendData(USART2, 'N'); 
	while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET);
	
	//testing GPS
	while (!((USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			      && (USART_ReceiveData(USART3)==71))) //except "G"
	{
		if ((USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == SET))
		  {
				get=USART_ReceiveData(USART2); 
				USART_SendData(USART1, get);
			}
	}
	
	USART_SendData(USART2, 'G'); 
	while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET);
	
	//short delay in order to avoid missing data
	//for (i=0;i<1000000;i++);
	
  //showing the success or error signal to the terminal
	while (1)
	{
		if ((USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == SET))
		  {
				get=USART_ReceiveData(USART2);
				if (get==64) break;  
				USART_SendData(USART3, get);
				//for (i=0;i<100;i++);
			}
	}
	
	//wait for the permission
	for (i=0;i<strlen(Responce2);i++)
				{
				  USART_SendData(USART3, Responce2[i]); 
	        while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
				}
	while (1)
	{
		if ((USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			   && (USART_ReceiveData(USART3)==89)) //except "Y"
		  {
				break;
			}
	}
  //continue the program
	USART_SendData(USART2, 'N'); 
	while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET);
	
	//tesing the clock
	while (1)
	{
		if ((USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == SET)
			   && (USART_ReceiveData(USART2)==67)) //except "C"
		  {
				break;
			}
		//USART_ClearFlag(USART2, USART_FLAG_RXNE);
	}
	for (i=0;i<10;i++) delay();
	USART_SendData(USART2, 'E'); 
	while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET);
	
	//short delay in order to avoid missing data
	//for (i=0;i<1000000;i++);
	
  //showing the success or error signal to the terminal
	while (1)
	{
		if ((USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == SET))
		  {
				get=USART_ReceiveData(USART2);
				if (get==64) break;  
				USART_SendData(USART3, get);
				//for (i=0;i<100;i++);
			}
	}
	
	//showing the success or error signal to the terminal
	while (1)
	{
		if ((USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == SET))
		  {
				get=USART_ReceiveData(USART2);
				if (get==64) break;  
				USART_SendData(USART3, get);
				//for (i=0;i<100;i++);
			}
	}
	
	//wait for the permission
	for (i=0;i<strlen(Responce2);i++)
				{
				  USART_SendData(USART3, Responce2[i]); 
	        while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
				}
	while (1)
	{
		if ((USART_GetFlagStatus(USART3, USART_FLAG_RXNE) == SET)
			   && (USART_ReceiveData(USART3)==89)) //except "Y"
		  {
				break;
			}
	}
	
	//lauching
	USART_SendData(USART2, 'L'); 
	while(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET);
	
	while (1)
	{
		if ((USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == SET))
		  {
				get=USART_ReceiveData(USART2);
				if (get==64) break;  
				USART_SendData(USART3, get);
				//for (i=0;i<100;i++);
			}
	}
	
	//change to the flying monitor mode
	for (i=0;i<strlen(Responce3);i++)
				{
				  USART_SendData(USART3, Responce3[i]); 
	        while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
				}
	
	//keep receiving GPS signal
	
	tt=0xFF;
	while (1)
	{
	  if (USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == SET) 
		{
			tt=USART_ReceiveData(USART2);
			if ((tt==36) || (tt==38))
			{
				break;
			}				
		}
	}
	while(1)
	{
		if (tt==36)
		{
			while (1)
			{
				while (!(USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == SET));
				tt=USART_ReceiveData(USART2);
				if ((tt==36) || (tt==38))
				{
					break;
        }
				USART_SendData(USART1, tt); 
			  while(USART_GetFlagStatus(USART1, USART_FLAG_TXE) == RESET);
			}
		}
		if (tt==38)
		{
			while (1)
			{
				
				while (!(USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == SET));
				tt=USART_ReceiveData(USART2);
				if ((tt==36) || (tt==38))
				{
					break;
        }
				USART_SendData(USART3, tt); 
	      while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
			}
		}
	}
	while(1);
}
