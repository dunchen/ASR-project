/****************************************Copyright (c)**************************************************
**                                 Co.,LTD.
**                                     
**                                 http://
**
**--------------File Info-------------------------------------------------------------------------------
** File name:			sdcmd.h
** Last modified Date:	2007-10-15
** Last Version:		V1.0
** Descriptions:		SD/MMC ��дģ��: ����� ---- SD/MMC ��SPIģʽ֧�ֵ�����(ͷ�ļ�) 
**						Soft Packet of SD/MMC Card : commands that SD/MMC card supported 
**						in spi mode(header file)
**------------------------------------------------------------------------------------------------------
** Created by:			lhlzjut@hotmail.com
** Created date:		2007-10-15
** Version:				V1.0
** Descriptions:		SD/MMC ��дģ��: ����� ---- SD��SPIģʽ֧�ֵ����� 
**
**------------------------------------------------------------------------------------------------------
********************************************************************************************************/

#ifndef __SDCMD_H__
#define __SDCMD_H__

#include "sdconfig.h"
/*
 *******************************************************
	
		SD/MMC ���������������Ӧ�궨��
	
 *******************************************************
*/

/* ������Ӧ���� define command's response */
#define R1 1
#define R1B 2
#define R2 3
#define R3 4

/* R1��R2���ֽڴ����� R1 and upper byte of R2 error code */
#define MSK_IDLE          		  0x01
#define MSK_ERASE_RST     		  0x02
#define MSK_ILL_CMD       		  0x04
#define MSK_CRC_ERR       		  0x08
#define MSK_ERASE_SEQ_ERR 		  0x10
#define MSK_ADDR_ERR      		  0x20
#define MSK_PARAM_ERR     		  0x40

/* R2���ֽڴ����� lower byte of R2 error code */
#define MSK_TOK_ERROR             0x01
#define MSK_TOK_CC_ERROR          0x02
#define MSK_TOK_ECC_FAILED        0x04
#define MSK_TOK_CC_OUTOFRANGE     0x08
#define MSK_TOK_CC_LOCKED         0x10



/* �������� Data Tokens */
#define SD_TOK_READ_STARTBLOCK    0xFE
#define SD_TOK_WRITE_STARTBLOCK   0xFE
#define SD_TOK_READ_STARTBLOCK_M  0xFE
#define SD_TOK_WRITE_STARTBLOCK_M 0xFC
#define SD_TOK_STOP_MULTI         0xFD

/* ������Ӧ���� Data Response Tokens */
#define SD_RESP_DATA_MSK		  0x0F		//������Ӧ����
#define SD_RESP_DATA_ACCETPTED	  0x05		//���ݱ�����
#define SD_RESP_DATA_REJECT_CRC	  0x0B      //����CRC��������ܾ�
#define SD_RESP_DATA_REJECT_WRITE 0x0D		//����д��������ܾ�

/* �ȴ����� Wait Type */
#define SD_WAIT_READ			  0x00		//���ȴ�
#define SD_WAIT_WRITE			  0x01		//д�ȴ�
#define SD_WAIT_ERASE		 	  0x02		//�����ȴ�


/*
*********************************************

     SD��SPIģʽ�����

*********************************************
*/

/******************************** ������� Basic command set **************************/
/* ��λSD �� Reset cards to idle state */
#define CMD0 0
#define CMD0_R R1

/* ��OCR�Ĵ��� Read the OCR (MMC mode, do not use for SD cards) */
#define CMD1 1
#define CMD1_R R1

/* ��CSD�Ĵ��� Card sends the CSD */
#define CMD9 9
#define CMD9_R R1

/* ��CID�Ĵ��� Card sends CID */
#define CMD10 10
#define CMD10_R R1

/* ֹͣ�����ʱ�����ݴ��� Stop a multiple block (stream) read/write operation */
#define CMD12 12
#define CMD12_R R1B

/* �� Card_Status �Ĵ��� Get the addressed card's status register */
#define CMD13 13
#define CMD13_R R2

/***************************** ������ Block read commands **************************/

/* ���ÿ�ĳ��� Set the block length */
#define CMD16 16
#define CMD16_R R1

/* ������ Read a single block */
#define CMD17 17
#define CMD17_R R1

/* �����,ֱ����������CMD12Ϊֹ Read multiple blocks until a CMD12 */
#define CMD18 18
#define CMD18_R R1

/***************************** ��д��� Block write commands *************************/
/* д���� Write a block of the size selected with CMD16 */
#define CMD24 24
#define CMD24_R R1

/* д��� Multiple block write until a CMD12 */
#define CMD25 25
#define CMD25_R R1

/* дCSD�Ĵ��� Program the programmable bits of the CSD */
#define CMD27 27
#define CMD27_R R1

/***************************** д���� Write protection *****************************/
/* Set the write protection bit of the addressed group */
#define CMD28 28
#define CMD28_R R1B

/* Clear the write protection bit of the addressed group */
#define CMD29 29
#define CMD29_R R1B

/* Ask the card for the status of the write protection bits */
#define CMD30 30
#define CMD30_R R1

/***************************** �������� Erase commands *******************************/
/* ���ò��������ʼ��ַ(ֻ����SD��) Set the address of the first write block to be erased(only for SD) */
#define CMD32 32
#define CMD32_R R1

/* ���ò��������ֹ��ַ(ֻ����SD��) Set the address of the last write block to be erased(only for SD) */
#define CMD33 33
#define CMD33_R R1

/* ���ò��������ʼ��ַ(ֻ����MMC��) Set the address of the first write block to be erased(only for MMC) */
#define CMD35 35
#define CMD35_R R1

/* ���ò��������ֹ��ַ(ֻ����MMC��) Set the address of the last write block to be erased(only for MMC) */
#define CMD36 36
#define CMD36_R R1

/* ������ѡ��Ŀ� Erase the selected write blocks */
#define CMD38 38
#define CMD38_R R1B

/***************************** �������� Lock Card commands ***************************/
/* ����/��λ���������/������ Set/reset the password or lock/unlock the card */
#define CMD42 42
#define CMD42_R	R1B
/* Commands from 42 to 54, not defined here */

/***************************** Ӧ������ Application-specific commands ****************/
/* ��ֹ��һ������ΪӦ������  Flag that the next command is application-specific */
#define CMD55 55
#define CMD55_R R1

/* Ӧ�������ͨ��I/O  General purpose I/O for application-specific commands */
#define CMD56 56
#define CMD56_R R1

/* ��OCR�Ĵ���  Read the OCR (SPI mode only) */
#define CMD58 58
#define CMD58_R R3

/* ʹ�ܻ��ֹ CRC Turn CRC on or off */
#define CMD59 59
#define CMD59_R R1

/***************************** Ӧ������ Application-specific commands ***************/
/* ��ȡ SD Status�Ĵ��� Get the SD card's status */
#define ACMD13 13
#define ACMD13_R R2

/* �õ���д�뿨�еĿ�ĸ��� Get the number of written write blocks (Minus errors ) */
#define ACMD22 22
#define ACMD22_R R1

/* ��д֮ǰ,����Ԥ�Ȳ����Ŀ�ĸ��� Set the number of write blocks to be pre-erased before writing */
#define ACMD23 23
#define ACMD23_R R1

/* ��ȡOCR�Ĵ��� Get the card's OCR (SD mode) */
#define ACMD41 41
#define ACMD41_R R1

/* ����/�Ͽ�CD/DATA[3]�����ϵ��������� Connect or disconnect the 50kOhm internal pull-up on CD/DAT[3] */
#define ACMD42 42
#define ACMD42_R R1

/* ��ȡSCR�Ĵ��� Get the SD configuration register */
#define ACMD51 51
#define ACMD51_R R1



extern INT8U SD_SendCmd(INT8U cmd, INT8U *param, INT8U resptype, INT8U *resp);  // һ��SPI����   a SPI command
extern void SD_PackParam(INT8U *parameter, INT32U value);						// ��װ����	  	 pack the parameter
extern INT8U SD_BlockCommand(INT8U cmd, INT8U resptype, INT32U parameter);		// ������ 		 block command 

	
extern INT8U SD_ResetSD(void);											// ��λSD��			reset SD Card

extern INT8U SD_ReadCSD(INT8U csdlen, INT8U *recbuf);					// ��CSD 			read CSD register
extern INT8U SD_ReadCID(INT8U cidlen, INT8U *recbuf);					// ��CID			read CID register
extern INT8U SD_StopTransmission(void);									// ֹͣ����			stop transmission

extern INT8U SD_ReadCard_Status(INT8U len, INT8U *buffer);				// ��Card Status	read Card Status register
extern INT8U SD_SetBlockLen(INT32U length);								// ���ÿ鳤��		set block length

extern INT8U SD_ReadSingleBlock(INT32U blockaddr);						// ������			read a single block
extern INT8U SD_ReadMultipleBlock(INT32U blockaddr);					// �����			read multiple block

extern INT8U SD_WriteSingleBlock(INT32U blockaddr);						// д����			write a single block
extern INT8U SD_WriteMultipleBlock(INT32U blockaddr);					// д��� 			write multiple block


extern INT8U SD_ProgramCSD(INT8U len, INT8U *buff);						// дCSD�Ĵ���  	write CSD register 

extern INT8U SD_EraseStartBlock(INT32U startblock);						// ������ʼ��ַ		erase start address
extern INT8U SD_EraseEndBlock(INT32U endblock);							// ������ֹ��ַ		erase end address
extern INT8U SD_EraseSelectedBlock(void);								// ������ѡ�Ŀ�		erase selected address


extern INT8U SD_ReadOCR(INT8U ocrlen,INT8U *recbuf);					// ��OCR			read OCR register
extern INT8U SD_EnableCRC(INT8U bEnable);								// ʹ��CRCУ��		enable CRC


// ����Ӧ������
extern INT8U SD_ReadSD_Status(INT8U sdslen, INT8U *recbuf);				// ��SD_Status		read SD_Status 
extern INT8U SD_GetNumWRBlcoks(INT32U *blocknum);						// �õ���ȷд����� get block numbers that writed well
extern INT8U SD_ReadSCR(INT8U scrlen, INT8U *recbuf);					// ��SCR 			read SCR register


// ����������
extern INT8U SD_ReadRegister(INT32U len, INT8U *recbuf);						// ���Ĵ���  read register 
extern INT8U SD_ReadBlockData(INT32U len, INT8U *recbuf);						// ��������	 read block data 
extern INT8U SD_WriteBlockData(INT8U bmulti, INT32U len, INT8U *sendbuf);		// д������	 write block data

// ��������
extern void SD_StopMultiToken(void);									// ֹͣ���д����	 stop token when write multiple block
extern INT8U SD_WaitBusy(INT8U waittype);								// æ				 busy
extern void SD_SPIDelay(INT8U value);									// ����SPIʱ��		 send SPI clock


#endif













