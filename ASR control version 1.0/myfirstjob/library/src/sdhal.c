/****************************************Copyright (c)**************************************************
**                                 Co.,LTD.
**                                     
**                                 http://
**
**--------------File Info-------------------------------------------------------------------------------
** File name:			sdhal.c
** Last modified Date:	2007-10-15
** Last Version:		V2.0
** Descriptions:		SD/MMC����дģ��: Ӳ������� ---- SPI��������
**						Soft Packet of SD/MMC Card: hard abstrast layer ---- function of SPI operation
**
**------------------------------------------------------------------------------------------------------
** Created by:			lhlzjut@hotmail.com
** Created date:		2007-10-15
** Version:				V1.0
** Descriptions:		The original version
**
**------------------------------------------------------------------------------------------------------
********************************************************************************************************/

#include "config.h"
#include "sdhal.h"

/* Select MSD Card: ChipSelect pin low  */
#define MSD_CS_LOW()     GPIO_ResetBits(GPIOA, GPIO_Pin_4)
/* Deselect MSD Card: ChipSelect pin high */
#define MSD_CS_HIGH()    GPIO_SetBits(GPIOA, GPIO_Pin_4)

/* Private function prototypes -----------------------------------------------*/
static void SPI_Config(void);
	/**************************************************************
		
		��дSD����SPI�ӿں���: SPI�ӿ�����,����/�����ֽں���	
	
	**************************************************************/


/*******************************************************************************************************************
** ��������: void SD_HardWareInit()				Name:	  void SD_HardWareInit()
** ��������: ��ʼ������SD����Ӳ������			Function: initialize the hardware condiction that access sd card
** �䡡  ��: ��									Input:	  NULL
** �� �� ��: ��									Output:	  NULL
********************************************************************************************************************/
void SD_HardWareInit(void)
{ 
	SPI_Config();							/* ����,��ʼ��,SPI�ӿں�SDƬѡ       	*/	
    
	MSD_CS_HIGH();

//	SPI_Clk400k();							/* ����BSPI������Ϊ400k       			*/	
}

/*******************************************************************************************************************
** ��������: void SPI_Clk400k()					Name:	  void SPI_Clk400k()
** ��������: ����SPI��ʱ��С��400kHZ			Function: set the clock of SPI less than 400kHZ
** �䡡  ��: ��									Input:	  NULL
** �� �� ��: ��									Output:	  NULL
********************************************************************************************************************/
void SPI_Clk400k(void)
{
	SPI_InitTypeDef   SPI_InitStructure;

  	/* SPI1 Config */
  	SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
  	SPI_InitStructure.SPI_Mode = SPI_Mode_Master;
  	SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
  	SPI_InitStructure.SPI_CPOL = SPI_CPOL_High;
  	SPI_InitStructure.SPI_CPHA = SPI_CPHA_2Edge;
  	SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
  	SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_128;
  	SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
  	SPI_InitStructure.SPI_CRCPolynomial = 7;
  	SPI_Init(SPI1, &SPI_InitStructure);

  	/* SPI1 enable */
  	SPI_Cmd(SPI1, ENABLE);
}


/*******************************************************************************************************************
** ��������: void SPI_ClkToMax()				Name:	  void SPI_ClkToMax()
** ��������: ����SPI��clock�����ֵ				Function: set the clock of SPI to maximum
** �䡡  ��: ��									Input:	  NULL
** �� �� ��: ��									Output:	  NULL
********************************************************************************************************************/
void SPI_ClkToMax(void)
{
	SPI_InitTypeDef   SPI_InitStructure;

  	/* SPI1 Config */
  	SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
  	SPI_InitStructure.SPI_Mode = SPI_Mode_Master;
  	SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
  	SPI_InitStructure.SPI_CPOL = SPI_CPOL_High;
  	SPI_InitStructure.SPI_CPHA = SPI_CPHA_2Edge;
  	SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
  	SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_4;
  	SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
  	SPI_InitStructure.SPI_CRCPolynomial = 7;
  	SPI_Init(SPI1, &SPI_InitStructure);

  	/* SPI1 enable */
  	SPI_Cmd(SPI1, ENABLE);
}


/*******************************************************************************************************************
** ��������: void SPI_SendByte()				Name:	  void SPI_SendByte()
** ��������: ͨ��SPI�ӿڷ���һ���ֽ�			Function: send a byte by SPI interface
** �䡡  ��: INT8U byte: ���͵��ֽ�				Input:	  INT8U byte: the byte that will be send
** �� �� ��: ��									Output:	  NULL
********************************************************************************************************************/
void SPI_SendByte(INT8U byte)
{
	/* Wait until the transmit buffer is empty */
  while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE) == RESET);
  /* Send the byte */
  SPI_I2S_SendData(SPI1, byte);
}


/*******************************************************************************************************************
** ��������: INT8U SPI_RecByte()				Name:	  INT8U SPI_RecByte()
** ��������: ��SPI�ӿڽ���һ���ֽ�				Function: receive a byte from SPI interface
** �䡡  ��: ��									Input:	  NULL
** �� �� ��: �յ����ֽ�							Output:	  the byte that be received
********************************************************************************************************************/
INT8U SPI_RecByte(void)
{
  INT8U Data = 0;

  /* Wait until the transmit buffer is empty */
  while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE) == RESET);
  /* Send the byte */
  SPI_I2S_SendData(SPI1, 0xFF);

  /* Wait until a data is received */
  while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_RXNE) == RESET);
  /* Get the received data */
  Data = SPI_I2S_ReceiveData(SPI1);

  /* Return the shifted data */
  return Data;
}


/*******************************************************************************************************************
** ��������: void SPI_CS_Assert()				Name:	  void SPI_CS_Assert()
** ��������: ƬѡSPI�ӻ�						Function: select the SPI slave 
** �䡡  ��: ��									Input:	  NULL
** �� �� ��: ��									Output:	  NULL
********************************************************************************************************************/
void SPI_CS_Assert(void)
{
	MSD_CS_LOW();			   					/* ƬѡSPI�ӻ�  select the SPI slave */  
}


/*******************************************************************************************************************
** ��������: void SPI_CS_Deassert()				Name:	  void SPI_CS_Deassert()
** ��������: ��ƬѡSPI�ӻ�						Function: not select the SPI slave 
** �䡡  ��: ��									Input:	  NULL
** �� �� ��: ��									Output:	  NULL
********************************************************************************************************************/
void SPI_CS_Deassert(void)
{
	MSD_CS_HIGH();			    				/* ��ƬѡSPI�ӻ�  not select the SPI slave */
}

/*******************************************************************************************************************
** ��������: void SD_ChkCard()					Name:	  void SD_ChkCard()
** ��������: ��⿨�Ƿ���ȫ����					Function: check weather card is insert entirely
** �䡡  ��: ��									Input:	  NULL
** �� �� ��: 1: ����ȫ����	0: ��û����ȫ����   Output:	  1: insert entirely	0: not insert entirely
********************************************************************************************************************/
INT8U SD_ChkCard(void)
{
	if (SD_INSERT_STATUS() != 0)
		return 0;								/* δ��ȫ���� not insert entirely */
	else
		return 1;								/* ��ȫ���� insert entirely */
}

/*******************************************************************************************************************
** ��������: void SD_ChkCardWP()				Name:	  void SD_ChkCardWP()
** ��������: ��⿨д����						Function: check weather card is write protect
** �䡡  ��: ��									Input:	  NULL
** �� �� ��: 1: ����д����	0: ��δд����	    Output:	  1: insert write protect	0: not write protect
********************************************************************************************************************/
INT8U SD_ChkCardWP(void)
{
	if (SD_WP_STATUS() != 0)
		return 1;								/* ��д���� */
	else
		return 0;								/* ��δд���� */
}

/*******************************************************************************
* Function Name  : SPI_Config
* Description    : Initializes the SPI1 and CS pins.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void SPI_Config(void)
{
   GPIO_InitTypeDef  GPIO_InitStructure;
  SPI_InitTypeDef   SPI_InitStructure;

  /* GPIOA and GPIOC Periph clock enable */
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOC |RCC_APB2Periph_GPIOE, ENABLE);
  /* SPI1 Periph clock enable */
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1, ENABLE);

  /* Configure SPI1 pins: SCK, MISO and MOSI */
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  /* Configure PC12 pin: CS pin */
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  /* SPI1 Config */
  SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
  SPI_InitStructure.SPI_Mode = SPI_Mode_Master;
  SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
  SPI_InitStructure.SPI_CPOL = SPI_CPOL_High;
  SPI_InitStructure.SPI_CPHA = SPI_CPHA_2Edge;
  SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
  SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_128;
  SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
  SPI_InitStructure.SPI_CRCPolynomial = 7;
  SPI_Init(SPI1, &SPI_InitStructure);

  /* SPI1 enable */
  SPI_Cmd(SPI1, ENABLE);
}








