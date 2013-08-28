/******************** (C) COPYRIGHT 2007 YH software **************************
* File Name          : msd.c
* Author             : lhlzjut@hotmail.com
* Date First Issued  : 10/21/2007
* Description        : MSD card driver source file.
*                      Pin assignment:
*             ----------------------------------------------
*             |  STM32F10x    |     MSD          Pin        |
*             ----------------------------------------------
*             | P0.4          |   ChipSelect      1         |
*             | P0.1 / MOSI   |   DataIn          2         |
*             |               |   GND             3 (0 V)   |
*             |               |   VDD             4 (3.3 V) |
*             | P0.2 / SCLK   |   Clock           5         |
*             |               |   GND             6 (0 V)   |
*             | P0.0 / MISO   |   DataOut         7         |
*             ----------------------------------------------
********************************************************************************
* History	: 10/21/2007
* Version   : V1.0
-------------------------------------------------------------------------------
*******************************************************************************/

/* Includes ------------------------------------------------------------------*/
#include "msd.h"
#include "sdmmc/sddriver.h"
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
u32 Mass_Memory_Size;
u32 Mass_Block_Size;
u32 Mass_Block_Count;
/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/
 
/*******************************************************************************
* Function Name  : MSD_Init
* Description    : Initializes the MSD/SD communication.
* Input          : None
* Output         : None
* Return         : The MSD Response: - MSD_RESPONSE_FAILURE: Sequence failed
*                                    - MSD_RESPONSE_NO_ERROR: Sequence succeed 
*******************************************************************************/
u8 MSD_Init(void)
{
  u8 ret = MSD_RESPONSE_FAILURE;

  /* MSD initialized and set to SPI mode properly */
  ret = SD_Initialize();
  
  return (ret);
}

/*******************************************************************************
* Function Name  : MSD_EarseBlock
* Description    : Earse the MSD/SD .
* Input          : None
* Output         : None
* Return         : The MSD Response: - MSD_RESPONSE_FAILURE: Sequence failed
*                                    - MSD_RESPONSE_NO_ERROR: Sequence succeed 
*******************************************************************************/
u8 MSD_EarseBlock(u32 startaddr, u32 blocknum)
{
	u8 ret = MSD_RESPONSE_FAILURE;

	ret = SD_EraseBlock(startaddr, blocknum);

	return (ret);
}
/*******************************************************************************
* Function Name  : MSD_WriteBlock
* Description    : Writes a block on the MSD
* Input          : - pBuffer : pointer to the buffer containing the data to be
*                    written on the MSD.
*                  - WriteAddr : address to write on.
*                  - NumByteToWrite: number of data to write
* Output         : None
* Return         : The MSD Response: - MSD_RESPONSE_FAILURE: Sequence failed
*                                    - MSD_RESPONSE_NO_ERROR: Sequence succeed 
*******************************************************************************/
u8 MSD_WriteBlock(u8* pBuffer, u32 WriteAddr, u16 NumByteToWrite)
{
  u8 ret = MSD_RESPONSE_FAILURE;

  ret = SD_WriteBlock(WriteAddr, NumByteToWrite, pBuffer);
 
  /* Returns the reponse */
  return ret;
}

/*******************************************************************************
* Function Name  : MSD_ReadBlock
* Description    : Reads a block of data from the MSD.
* Input          : - pBuffer : pointer to the buffer that receives the data read
*                    from the MSD.
*                  - ReadAddr : MSD's internal address to read from.
*                  - NumByteToRead : number of bytes to read from the MSD.
* Output         : None
* Return         : The MSD Response: - MSD_RESPONSE_FAILURE: Sequence failed
*                                    - MSD_RESPONSE_NO_ERROR: Sequence succeed 
*******************************************************************************/
u8 MSD_ReadBlock(u8* pBuffer, u32 ReadAddr, u16 NumByteToRead)
{
  u8 ret = MSD_RESPONSE_FAILURE;

  ret = SD_ReadBlock(ReadAddr,NumByteToRead, pBuffer);
     
  return ret;
}

/*******************************************************************************
* Function Name  : MSD_WriteBuffer
* Description    : Writes many blocks on the MSD
* Input          : - pBuffer : pointer to the buffer containing the data to be
*                    written on the MSD.
*                  - WriteAddr : address to write on.
*                  - NumByteToWrite: number of data to write
* Output         : None
* Return         : The MSD Response: - MSD_RESPONSE_FAILURE: Sequence failed
*                                    - MSD_RESPONSE_NO_ERROR: Sequence succeed 
*******************************************************************************/
u8 MSD_WriteBuffer(u8* pBuffer, u32 WriteAddr, u32 NumByteToWrite)
{
  u32 NbrOfBlock = 0;
  u8 ret = MSD_RESPONSE_FAILURE;

  /* Calculate number of blocks to write */
  NbrOfBlock = NumByteToWrite / BLOCK_SIZE;

  ret = SD_WriteMultiBlock(WriteAddr, NbrOfBlock, pBuffer);
  
  return ret;
}

/*******************************************************************************
* Function Name  : MSD_ReadBuffer
* Description    : Reads multiple block of data from the MSD.
* Input          : - pBuffer : pointer to the buffer that receives the data read
*                    from the MSD.
*                  - ReadAddr : MSD's internal address to read from.
*                  - NumByteToRead : number of bytes to read from the MSD.
* Output         : None
* Return         : The MSD Response: - MSD_RESPONSE_FAILURE: Sequence failed
*                                    - MSD_RESPONSE_NO_ERROR: Sequence succeed 
*******************************************************************************/
u8 MSD_ReadBuffer(u8* pBuffer, u32 ReadAddr, u32 NumByteToRead)
{
  u32 NbrOfBlock = 0;

  u8 ret = MSD_RESPONSE_FAILURE;

  /* Calculate number of blocks to write */
  NbrOfBlock = NumByteToRead / BLOCK_SIZE;

  ret = SD_ReadMultiBlock(ReadAddr, NbrOfBlock, pBuffer);
  
  return ret;
}
/*******************************************************************************
* Function Name  : MSD_GetMediumCharacteristics.
* Description    : Get the microSD card size.
* Input          : None.
* Output         : None.
* Return         : card type.
*******************************************************************************/
u32 MSD_GetMediumCharacteristics(void)
{
  u32 temp1 = 0;

  temp1 = sds.card_type;
  Mass_Block_Size = sds.block_len;
  Mass_Block_Count = sds.block_num;
  Mass_Memory_Size = Mass_Block_Size *  Mass_Block_Count;
 
   return temp1;
}

/******************************END OF FILE*************************************/
