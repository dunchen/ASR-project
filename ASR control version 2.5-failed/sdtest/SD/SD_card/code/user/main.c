/******************** (C) COPYRIGHT 2007 STMicroelectronics ********************
* File Name          : main.c
* Author             : lhlzjut@hotmail.com, armgcc@foxmail.com
* Date First Issued  : 10/19/2007
* Description        : SD demo main file
********************************************************************************
* History:
* 05/21/2007: V0.3
**------------------------------------------------------------------------------
********************************************************************************/

/* Includes ------------------------------------------------------------------*/
#include "config.h"
extern void SetupUART1(void);
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define SD_TEST_BLOCK_ADDR	0
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
ErrorStatus HSEStartUpStatus;
/* Extern variables ----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
void SetupClock(void)
{
  /* RCC system reset(for debug purpose) */
  RCC_DeInit();

  /* Enable HSE */
  RCC_HSEConfig(RCC_HSE_ON);

  /* Wait till HSE is ready */
  HSEStartUpStatus = RCC_WaitForHSEStartUp();

  if(HSEStartUpStatus == SUCCESS)
  {
    /* HCLK = SYSCLK */
    RCC_HCLKConfig(RCC_SYSCLK_Div1); 
  
    /* PCLK2 = HCLK/2 */
    RCC_PCLK2Config(RCC_HCLK_Div2); 

    /* PCLK1 = HCLK/2 */
    RCC_PCLK1Config(RCC_HCLK_Div2);

	/* Flash 2 wait state */
    FLASH_SetLatency(FLASH_Latency_2);
 
   /* PLLCLK = 8MHz * 9 = 72 MHz */
    RCC_PLLConfig(RCC_PLLSource_HSE_Div1, RCC_PLLMul_9);

    /* Enable PLL */ 
    RCC_PLLCmd(ENABLE);

    /* Wait till PLL is ready */
    while(RCC_GetFlagStatus(RCC_FLAG_PLLRDY) == RESET);

    /* Select PLL as system clock source */
    RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);

    /* Wait till PLL is used as system clock source */
    while(RCC_GetSYSCLKSource() != 0x08);
    
  }

/* Enable peripheral clocks --------------------------------------------------*/
  /* GPIOA, GPIOB and SPI1 clock enable */
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOB | RCC_APB2Periph_GPIOC|RCC_APB2Periph_GPIOE|
                         RCC_APB2Periph_USART1 |RCC_APB2Periph_SPI1, ENABLE);
  
  /* SysTick event each 10 ms with input clock equal to 9MHz (HCLK/8)         */
  SysTick_SetReload(90000);

  SysTick_ITConfig(ENABLE);             /* Enable SysTick interrupt           */
}

void Sleep(u32 cpt_loop)
{
  cpt_loop = cpt_loop * 10000;
  while (cpt_loop -- != 0);
}   

/*******************************************************************************
* Function Name  : main.
* Description    : Main routine.
* Input          : None.
* Output         : None.
* Return         : None.
*******************************************************************************/
int main(void)
{	
	u8 sd_recv_buf[512];
	u8 sd_send_buf[512];
	u32 i = 0,j = 0;
	u8 ret = 1;

	SetupClock ();
	SetupUART1 ();
  	 printf("\r\nHello STM32F10X Starting, This is sample of SD for SPI mode!\n");

	 ret = MSD_Init();
	 printf("MSD_Init result: %d\n",ret);

	 ret = MSD_GetMediumCharacteristics();

	 if(ret == 0)
	 	printf("CardType: SD\n");
	 else	
	 	printf("CardType: MMC\n");

	 printf("MsdBlockCount: %d\n",Mass_Block_Count);
	 printf("MsdBlockSize: %d Byte\n",Mass_Block_Size);
	 printf("MsdMemorySize: %d Byte\n",Mass_Memory_Size);

	/* 擦除卡 */
	 printf("Full earse, please waiting about 15 seconds......\n");
	// i = MSD_EarseBlock(0,Mass_Block_Count);
	 printf("MSD_EarseBlock result: %d\n",i);

	/* 生成写入卡中的数据 */
	 for(j=0; j<512; j++)
	 	{
	 		if(j<256)
	 			sd_send_buf[j] = j;
	 		else
	 			sd_send_buf[j] = 512-j-1;
		   /* 清空接收缓冲区 */
			sd_recv_buf[j] = 0;
	 	}
	 	
	/* 向卡指定的扇区写数据 */
	j = MSD_WriteBlock(sd_send_buf,SD_TEST_BLOCK_ADDR,512);
	printf("MSD_WriteBlock result: %d\n",j);
	
	j =MSD_ReadBlock(sd_recv_buf,SD_TEST_BLOCK_ADDR,512);
	printf("MSD_ReadBlock result: %d\n",j);

  	while (1)
  	{
		for(i = 0; i < 512; i++)
		{
	   		printf("\r\nRead data from SD_Card result[%d]: %d\n",i,sd_recv_buf[i]);
			Sleep(1000);
		}
  	}
}


#ifdef  DEBUG
/*******************************************************************************
* Function Name  : assert_failed
* Description    : Reports the name of the source file and the source line number
*                  where the assert error has occurred.
* Input          : - file: pointer to the source file name
*                  - line: assert error line source number
* Output         : None
* Return         : None
*******************************************************************************/
void assert_failed(u8* file, u32 line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while(1)
  {
  }
}
#endif
/******************* (C) COPYRIGHT 2007 STMicroelectronics *****END OF FILE****/
