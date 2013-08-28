/****************************************Copyright (c)**************************************************
**                                 Co.,LTD.
**                                     
**                                 http://
**
**--------------File Info-------------------------------------------------------------------------------
** File name:			sdcrc.h
** Last modified Date:	2007-10-15
** Last Version:		V1.0
** Descriptions:		SD/MMC����дģ��: ��ع��ߺ��� ---- CRCУ��ͷ�ļ�
**						Soft Packet of SD/MMC Card: tool funcitons  ---- crc check header file
**
**------------------------------------------------------------------------------------------------------
** Created by:			lhlzjut@hotmail.com
** Created date:		2007-10-15
** Version:				V1.0
** Descriptions:		The original version
**
**------------------------------------------------------------------------------------------------------
********************************************************************************************************/

#ifndef __SDCRC_H__
#define __SDCRC_H__

#include "sdconfig.h"

extern INT16U SD_GetCRC16(INT8U *pSource,INT16U len);	//�õ�len���ֽڵ�CRC16

extern INT8U SD_GetCmdByte6(INT8U cmd,INT8U *param);	//�õ�SD����ĵ�6���ֽ�: CRC7 + ֹͣλ1

extern INT8U SD_GetCRC7(INT8U *pSource,INT16U len);		//�õ�len���ֽڵ�CRC7

#endif

