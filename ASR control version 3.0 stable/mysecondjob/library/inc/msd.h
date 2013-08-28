/******************** (C) COPYRIGHT 2007 **************************************
* File Name          : msd.h
* Author             : lhlzjut@hotmail.com
* Date First Issued  : 0/21/2007
* Description        : Header for msd.c file.
********************************************************************************
* History:
* 10/21/2007: V1.0
********************************************************************************
*******************************************************************************/

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MSD_H
#define __MSD_H

/* Includes ------------------------------------------------------------------*/
#include "stm32f10x_lib.h"

/* Private define ------------------------------------------------------------*/
/* Block Size */
#define BLOCK_SIZE    512

/* MSD reponses and error flags */
#define MSD_RESPONSE_NO_ERROR      0x00

#define MSD_RESPONSE_FAILURE       0xFF

extern u32 Mass_Memory_Size;
extern u32 Mass_Block_Size;
extern u32 Mass_Block_Count;
/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/
/* Exported functions ------------------------------------------------------- */

/*----- High layer function -----*/
u8 MSD_Init(void);
u8 MSD_EarseBlock(u32 startaddr, u32 blocknum);
u8 MSD_WriteBlock(u8* pBuffer, u32 WriteAddr, u16 NumByteToWrite);
u8 MSD_ReadBlock(u8* pBuffer, u32 ReadAddr, u16 NumByteToRead);
u8 MSD_WriteBuffer(u8* pBuffer, u32 WriteAddr, u32 NumByteToWrite);
u8 MSD_ReadBuffer(u8* pBuffer, u32 ReadAddr, u32 NumByteToRead);

u32 MSD_GetMediumCharacteristics(void);



#endif /* __MSD_H */

/************************END OF FILE*******************************************/


