/****************************************Copyright (c)**************************************************
**                                 Co.,LTD.
**                                     
**                                 http://
**
**--------------File Info-------------------------------------------------------------------------------
** File name:			sdconfig.h
** Last modified Date:	2005-3-11
** Last Version:		V2.0
** Descriptions:		SD/MMC 卡读写模块: 配置文件
**						Soft Packet of SD/MMC Card: configuration header file
**
**------------------------------------------------------------------------------------------------------
** Created by:			lhlzjut@hotmail.com
** Created date:		2007-10-21
** Version:				V1.0
** Descriptions:		The original version
**
**------------------------------------------------------------------------------------------------------
********************************************************************************************************/

#ifndef __SDCONFIG_H__
#define __SDCONFIG_H__

typedef unsigned char  INT8U;                   /* 无符号8位整型变量                        */
typedef signed   char  INT8;                    /* 有符号8位整型变量                        */
typedef unsigned short INT16U;                  /* 无符号16位整型变量                       */
typedef signed   short INT16;                   /* 有符号16位整型变量                       */
typedef unsigned int   INT32U;                  /* 无符号32位整型变量                       */
typedef signed   int   INT32;                   /* 有符号32位整型变量                       */
typedef float          FP32;                    /* 单精度浮点数（32位长度）                 */
typedef double         FP64;                    /* 双精度浮点数（64位长度）                 */

#define SD_UCOSII_EN			0			/* 是否在UCOS-II上运行本模块 */

#define SD_CRC_EN		   		1			/* 设置数据传输时是否使用CRC */

#define SPI_CLOCK				9000000		/* 正常通信时,SPI时钟频率 frequency (Hz) */

#define SD_BLOCKSIZE 			512			/* SD卡块的长度 */

#define SD_BLOCKSIZE_NBITS		9  

/* 下面函数不常用,如果用户不需要,可置为 0 裁剪指定函数 */

#define SD_ReadMultiBlock_EN    1			/* 是否使能读多块函数 */

#define SD_WriteMultiBlock_EN   1			/* 是否使能写多块函数 */

#define SD_EraseBlock_EN		1			/* 是否使能擦卡函数 */

#define SD_ProgramCSD_EN   		0			/* 是否使能写CSD寄存器函数 */
	
#define SD_ReadCID_EN	   		0			/* 是否使能读CID寄存器函数 */
	
#define	SD_ReadSD_Status_EN		0			/* 是否使能读SD_Status寄存器函数 */

#define	SD_ReadSCR_EN			0			/* 是否使能读SCR寄存器函数 */

/* STR71X_EN 硬件配置 */
 

															
/* 卡完全插入卡座检测引脚 */	
#define  SD_INSERT_STATUS()  	0			/* 读取 INSERT 口的状态 */

/* 卡写保护检测引脚 */
#define  SD_WP_STATUS()  		0				/* 读取 WP 口的状态 */

#endif




