/****************************************Copyright (c)**************************************************
**                                 Co.,LTD.
**                                     
**                                 http://
**
**--------------File Info-------------------------------------------------------------------------------
** File name:			sdhal.h
** Last modified Date:	2007-10-15
** Last Version:		V2.0
** Descriptions:		SD/MMC卡读写模块 ---- SPI操作函数头文件
**						Soft Packet of SD/MMC Card: hard abstrast layer ---- function of SPI operation 
**																			 header file
**------------------------------------------------------------------------------------------------------
** Created by:			lhlzjut@hotmail.com
** Created date:		2007-10-15
** Version:				V1.0
** Descriptions:		The original version
**
**------------------------------------------------------------------------------------------------------
********************************************************************************************************/

#ifndef __SDHAL_H__
#define __SDHAL_H__

#include "sdconfig.h"

/* 检测卡是否完全插入  check weather card is insert entirely */
extern INT8U SD_ChkCard(void);

/* 检测卡是否写保护  check weather card is write protect */
extern INT8U SD_ChkCardWP(void);

/* 初始化访问SD卡的硬件初始化 initialize the hardware that access sd card */
extern void SD_HardWareInit(void);

/* 设置SPI的时钟小于400kHZ set the clock of SPI less than 400kHZ */
extern void SPI_Clk400k(void);

/* 设置SPI的clock到最大值 set the clock of SPI to maximum */
extern void SPI_ClkToMax(void);

/* 通过SPI接口发送一个字节 send a byte by SPI interface */
extern void SPI_SendByte(INT8U byte);

/* 从SPI接口接收一个字节 receive a byte from SPI interface */
extern INT8U SPI_RecByte(void);

/* 片选SPI从机 select the SPI slave */
extern void SPI_CS_Assert(void);

/* 不片选SPI从机 not select the SPI slave */
extern void SPI_CS_Deassert(void);

#endif

