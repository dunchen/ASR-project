/****************************************Copyright (c)**************************************************
**                                 Co.,LTD.
**                                     
**                                 http://
**
**--------------File Info-------------------------------------------------------------------------------
** File name:			sdconfig.h
** Last modified Date:	2005-3-11
** Last Version:		V2.0
** Descriptions:		SD/MMC ����дģ��: �����ļ�
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

typedef unsigned char  INT8U;                   /* �޷���8λ���ͱ���                        */
typedef signed   char  INT8;                    /* �з���8λ���ͱ���                        */
typedef unsigned short INT16U;                  /* �޷���16λ���ͱ���                       */
typedef signed   short INT16;                   /* �з���16λ���ͱ���                       */
typedef unsigned int   INT32U;                  /* �޷���32λ���ͱ���                       */
typedef signed   int   INT32;                   /* �з���32λ���ͱ���                       */
typedef float          FP32;                    /* �����ȸ�������32λ���ȣ�                 */
typedef double         FP64;                    /* ˫���ȸ�������64λ���ȣ�                 */

#define SD_UCOSII_EN			0			/* �Ƿ���UCOS-II�����б�ģ�� */

#define SD_CRC_EN		   		1			/* �������ݴ���ʱ�Ƿ�ʹ��CRC */

#define SPI_CLOCK				9000000		/* ����ͨ��ʱ,SPIʱ��Ƶ�� frequency (Hz) */

#define SD_BLOCKSIZE 			512			/* SD����ĳ��� */

#define SD_BLOCKSIZE_NBITS		9  

/* ���溯��������,����û�����Ҫ,����Ϊ 0 �ü�ָ������ */

#define SD_ReadMultiBlock_EN    1			/* �Ƿ�ʹ�ܶ���麯�� */

#define SD_WriteMultiBlock_EN   1			/* �Ƿ�ʹ��д��麯�� */

#define SD_EraseBlock_EN		1			/* �Ƿ�ʹ�ܲ������� */

#define SD_ProgramCSD_EN   		0			/* �Ƿ�ʹ��дCSD�Ĵ������� */
	
#define SD_ReadCID_EN	   		0			/* �Ƿ�ʹ�ܶ�CID�Ĵ������� */
	
#define	SD_ReadSD_Status_EN		0			/* �Ƿ�ʹ�ܶ�SD_Status�Ĵ������� */

#define	SD_ReadSCR_EN			0			/* �Ƿ�ʹ�ܶ�SCR�Ĵ������� */

/* STR71X_EN Ӳ������ */
 

															
/* ����ȫ���뿨��������� */	
#define  SD_INSERT_STATUS()  	0			/* ��ȡ INSERT �ڵ�״̬ */

/* ��д����������� */
#define  SD_WP_STATUS()  		0				/* ��ȡ WP �ڵ�״̬ */

#endif




