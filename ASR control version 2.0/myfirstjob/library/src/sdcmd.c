/****************************************Copyright (c)**************************************************
**                               Hangzhou yh software  Co.,LTD.
**                                     
**                                 http://www.armgcc.com
**
**--------------File Info-------------------------------------------------------------------------------
** File name:			sdcmd.c
** Last modified Date:	2007-10-15
** Last Version:		V1.0
** Descriptions:		SD/MMC ��дģ��: ����� ---- SD/MMC��SPIģʽ֧�ֵ����� 						
**------------------------------------------------------------------------------------------------------
** Created by:			lhlzjut@hotmail.com
** Created date:		2007-10-15
** Version:				V1.0
** Descriptions:		The original version
**
**------------------------------------------------------------------------------------------------------
********************************************************************************************************/
#include "sdhal.h"
#include "sdcrc.h"
#include "sdcmd.h"
#include "sddriver.h"

/********************************************************************************************************************
** ��������: INT8U SD_SendCmd()						Name:	  INT8U SD_SendCmd()
** ��������: �򿨷�������,��ȡ����Ӧ				Function: send command to the card,and get a response
** �䡡  ��: INT8U cmd	    : ������				Input:	  INT8U cmd	    : command byte	
			 INT8U *param	: �������,����Ϊ4�ֽ�			  INT8U *param	: command parameter,length is 4 bytes  
			 INT8U resptype : ��Ӧ����						  INT8U resptype: response type
			 INT8U *resp	: ��Ӧ,����Ϊ1-5�ֽ�			  INT8U *resp	: response,length is 1-5 bytes
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
********************************************************************************************************************/
INT8U SD_SendCmd(INT8U cmd, INT8U *param, INT8U resptype, INT8U *resp)
{
	INT32 i,rlen;
	INT8U tmp;
    
	SPI_CS_Assert();
   
    SPI_SendByte((cmd & 0x3F) | 0x40);				 /* ��������ͷ�������� send command header and word */
    
    for (i = 3; i >= 0; i--)
        SPI_SendByte(param[i]);						 /* ���Ͳ��� send parameters */

#if SD_CRC_EN
	tmp = SD_GetCmdByte6((cmd & 0x3F) | 0x40, param);
	SPI_SendByte(tmp);
#else
    SPI_SendByte(0x95);							 	 /* CRCУ����,ֻ���ڵ�1������ CRC,only used for the first command */
#endif 
    
    rlen = 0;
    switch (resptype)								 /* ���ݲ�ͬ������,�õ���ͬ����Ӧ���� */
    {												 /* according various command,get the various response length */
  		case R1:  rlen = 1;  break;
   	 	case R1B: rlen = 1;  break;
       		 
    	case R2:  rlen = 2;	 break;
       		 
   		case R3:  rlen = 5;	 break;
       		 
    	default:  
			 SPI_SendByte(0xFF);	
      		 SPI_CS_Deassert();						 
        	 return SD_ERR_CMD_RESPTYPE;		 /* ����������Ӧ���ʹ��� return error of command response type */
    		 break;
    }
    
    i = 0;				
    do 												 /* �ȴ���Ӧ,��Ӧ�Ŀ�ʼλΪ0 */
    {												 /* Wait for a response,a response is a start bit(zero) */ 
        tmp = SPI_RecByte();
        i++;
    }while (((tmp & 0x80) != 0) && (i < SD_CMD_TIMEOUT));
    
    if (i >= SD_CMD_TIMEOUT)
    {												 
        SPI_CS_Deassert();
        return SD_ERR_CMD_TIMEOUT;					 /* �������ʱ return response timeout of command */
    }
    
    for (i = rlen - 1; i >= 0; i--)
    {
        resp[i] = tmp;
        tmp = SPI_RecByte();					 	 /* ѭ���������8clock  at the last recycle,clock out 8 clock */
    }
      
    SPI_CS_Deassert();
    return SD_NO_ERR;								 /* ����ִ�гɹ� return perform sucessfully */
}

/********************************************************************************************************************
** ��������: void SD_PackParam()					Name:	  void SD_PackParam()
** ��������: ��32λ�Ĳ���תΪ�ֽ���ʽ				Function: change 32bit parameter to bytes form 
** �䡡  ��: INT8U *parameter: �ֽڲ���������		Input:	  INT8U *parameter: the buffer of bytes parameter
			 INT32U value    : 32λ����						  INT32U value    : 32bit parameter
** �� �� ��: ��										Output:	  NULL
*********************************************************************************************************************/
void SD_PackParam(INT8U *parameter, INT32U value)
{
    parameter[3] = (INT8U)(value >> 24);
    parameter[2] = (INT8U)(value >> 16);
    parameter[1] = (INT8U)(value >> 8);
    parameter[0] = (INT8U)(value);
}

/********************************************************************************************************************
** ��������: INT8U SD_BlockCommand()				Name:	  INT8U SD_BlockCommand()
** ��������: ������									Function: command about block operation
** �䡡  ��: INT8U cmd	     : ������				Input:	  INT8U cmd	      : command byte 
			 INT8U resptype  : ��Ӧ����						  INT8U resptype  : response type
			 INT32U parameter: ���������			 		  INT32U parameter: parameter of block operation
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
*********************************************************************************************************************/
INT8U SD_BlockCommand(INT8U cmd, INT8U resptype, INT32U parameter)
{
	INT8U param[4],resp,ret;
	
	parameter <<= SD_BLOCKSIZE_NBITS;					 /* ������ַ:����9λ adjust address: move 9 bits left */

	SD_PackParam(param, parameter);						 /* ������ת��Ϊ�ֽ���ʽ change the parameter to bytes form */	

	ret = SD_SendCmd(cmd, param, resptype, &resp);
	if (ret != SD_NO_ERR)
	   	 return ret;							 		 /* �������ݴ���ʧ�� stop transmission operation fail */
	
	if (resp != 0)
		 return SD_ERR_CMD_RESP;		 				 /* ��Ӧ���� response is error */
		 
	return SD_NO_ERR;
}

	/*
	************************************************
	
	 	����ΪSD��SPI����

	************************************************
	*/
	
/********************************************************************************************************************
** ��������: INT8U SD_ResetSD()						Name:	  INT8U SD_ResetSD()
** ��������: ��λSD/MMC��							Function: reset SD/MMC card
** �䡡  ��: ��										Input:	  NULL
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
*********************************************************************************************************************/
INT8U SD_ResetSD(void)
{
	INT8U param[4] = {0,0,0,0},resp;
	
    return (SD_SendCmd(CMD0, param, CMD0_R, &resp));	/* ��λ���� command that reset card */
}

/********************************************************************************************************************
** ��������: INT8U SD_ReadCSD()						Name:	  INT8U SD_ReadCSD()
** ��������: ��SD/MMC����CSD�Ĵ���					Function: read CSD register of SD/MMC card 
** �䡡  ��: INT8U csdlen  : �Ĵ�������(�̶�Ϊ16)			  INT8U csdlen  : len of register (fixed,is 16)
			 INT8U *recbuf : ���ջ�����					      INT8U *recbuf : recbuffer	
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
*********************************************************************************************************************/
INT8U SD_ReadCSD(INT8U csdlen, INT8U *recbuf)
{
    INT8U param[4] = {0,0,0,0},resp,ret;
  	
    ret = SD_SendCmd(CMD9, param, CMD9_R, &resp);		/* ��CSD�Ĵ������� command that read CSD register */
    if (ret != SD_NO_ERR) 									
        return ret;									
  	
    if (resp != 0)
        return SD_ERR_CMD_RESP;							/* ��Ӧ���� response is error */
     
	return (SD_ReadRegister(csdlen, recbuf));
}

/*******************************************************************************************************************
** ��������: INT8U SD_ReadCID()						Name:	  INT8U SD_ReadCID()
** ��������: ��SD����CID�Ĵ���						Function: read CID register of sd card
** �䡡  ��: INT8U cidlen  : �Ĵ�������(�̶�Ϊ16)			  INT8U cidlen  : len of register (fixed,is 16)
			 INT8U *recbuf : ���ջ�����					      INT8U *recbuf : recbuffer	
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
********************************************************************************************************************/
#if SD_ReadCID_EN
INT8U SD_ReadCID(INT8U cidlen, INT8U *recbuf)
{
    INT8U param[4] = {0,0,0,0},resp,ret;
 
    ret = SD_SendCmd(CMD10, param, CMD10_R, &resp);		/* ��CID�Ĵ������� command that read CID register */
    if ( ret != SD_NO_ERR)
   		return ret;			  									
   
    if (resp != 0)
        return SD_ERR_CMD_RESP;							/* ��Ӧ���� response is error */
      
  	return (SD_ReadRegister(cidlen, recbuf));
}
#endif

/********************************************************************************************************************
** ��������: INT8U SD_StopTransmission()			Name:	  INT8U SD_StopTransmission()
** ��������: ֹͣ���ݴ���							Function: stop data transmission 
** �䡡  ��: ��								 		Input:    NULL
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
*********************************************************************************************************************/
INT8U SD_StopTransmission(void)
{
	INT8U param[4] = {0,0,0,0},resp;
	
 	return (SD_SendCmd(CMD12, param, CMD12_R, &resp));	/* �������ݴ�������ʧ�� stop transmission command fail */
}

/*********************************************************************************************************************
** ��������: INT8U SD_ReadCard_Status()				Name:	  INT8U SD_ReadCard_Status()
** ��������: ��SD/MMC���� Card Status �Ĵ���		Function: read Card Status register of SD/MMC card 
** �䡡  ��: INT8U len: 	 �Ĵ�������(�̶�Ϊ2)			  INT8U len:      len of register (fixed,is 2)
			 INT8U *recbuf : ���ջ�����					      INT8U *recbuf : recbuffer
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
**********************************************************************************************************************/
INT8U SD_ReadCard_Status(INT8U len, INT8U *buffer)
{
    INT8U param[4] = {0,0,0,0};

    return (SD_SendCmd(CMD13, param, CMD13_R, buffer)); /* �� Card Status �Ĵ��� */
    									 	 			/* read register of Card Status */
}


/********************************************************************************************************************
** ��������: INT8U SD_SetBlockLen()					Name:	  INT8U SD_SetBlockLen()
** ��������: ����һ����ĳ���						Function: set a block len of card 
** �䡡  ��: INT32U length	: ��ĳ���ֵ			Input:	  INT32U length	: the length of a block
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
*********************************************************************************************************************/
INT8U SD_SetBlockLen(INT32U length)
{
	INT8U param[4],resp,ret;
  
    SD_PackParam(param, length);					/* ������ת��Ϊ�ֽ���ʽ change the parameter to bytes form */
          												
    ret = SD_SendCmd(CMD16, param, CMD16_R, &resp);
    if (ret != SD_NO_ERR)
 		return ret;									/* ���ÿ�ĳ���Ϊlengthʧ�� set the length of block to length fail */
	
	if (resp != 0)
    	return SD_ERR_CMD_RESP;			   			/* ��Ӧ���� response is error */
    
    return SD_NO_ERR; 								/* ����ִ�гɹ� return perform sucessfully */			
}

/********************************************************************************************************************
** ��������: INT8U SD_ReadSingleBlock()				Name:	  INT8U SD_ReadSingleBlock()
** ��������: ����������								Function: read single block command
** �䡡  ��: INT32U blockaddr: ���ַ				Input:	  INT32U blockaddr: block address
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right	>0:  error code
*********************************************************************************************************************/
INT8U SD_ReadSingleBlock(INT32U blockaddr)
{
	return (SD_BlockCommand(CMD17, CMD17_R, blockaddr)); /* ���������� command that read single block */
}

/********************************************************************************************************************
** ��������: INT8U SD_ReadMultipleBlock()			Name:	  INT8U SD_ReadMultipleBlock()
** ��������: ���������								Function: read multiple block command 
** �䡡  ��: INT32U blockaddr: ���ַ				Input:	  INT32U blockaddr: block address
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
*********************************************************************************************************************/
INT8U SD_ReadMultipleBlock(INT32U blockaddr)
{
	return (SD_BlockCommand(CMD18, CMD18_R, blockaddr)); /* ��������� command that read multiple block */
}

/********************************************************************************************************************
** ��������: INT8U SD_WriteSingleBlock()			Name:	  INT8U SD_WriteSingleBlock()
** ��������: д��������								Function: write single block command
** �䡡  ��: INT32U blockaddr: block address		Input:	  INT32U blockaddr: block address
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
*********************************************************************************************************************/
INT8U SD_WriteSingleBlock(INT32U blockaddr)
{
	return (SD_BlockCommand(CMD24, CMD24_R, blockaddr)); /* д�������� command that write single block */
}

/********************************************************************************************************************
** ��������: INT8U SD_WriteMultipleBlock()			Name:	  INT8U SD_WriteMultipleBlock()
** ��������: д�������								Function: write multiple block command
** �䡡  ��: INT32U blockaddr: ���ַ				Input:	  INT32U blockaddr: block address
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right	>0:  error code
*********************************************************************************************************************/
INT8U SD_WriteMultipleBlock(INT32U blockaddr)
{
	return (SD_BlockCommand(CMD25, CMD25_R, blockaddr)); /* д������� command that write multiple block */
}

/********************************************************************************************************************
** ��������: INT8U SD_ProgramCSD()						Name:	  INT8U SD_ProgramCSD()
** ��������: дCSD�Ĵ���								Function: write CSD register
** �䡡  ��: INT8U *buff   		 : CSD�Ĵ�������		Input:	  INT8U *buff   	  : the content of CSD register	
			 INT8U len	  		 : CSD�Ĵ�������			  	  INT8U len			  : the length of CSD register
** �� �� ��: 0:   ��ȷ    >0:   ������		  			Output:	  0:  right		>0:  error code
********************************************************************************************************************/
#if SD_ProgramCSD_EN
INT8U SD_ProgramCSD(INT8U len, INT8U *buff)
{
	INT8U param[4] = {0,0,0,0},resp,ret;
	
	if (len != 16) return SD_ERR_USER_PARAM;

	ret = SD_SendCmd(CMD27, param, CMD27_R, &resp); 	/* ����дCSD�Ĵ������� send command that write CSD */
	if (ret != SD_NO_ERR)
		return ret;
		        
    if (resp != 0)    
        return SD_ERR_CMD_RESP;
		
	buff[15] = (SD_GetCRC7(buff, 15) << 1) + 0x01;  	/* ����CSD�е�crc λ�� calculate crc field in CSD */
		
	return(SD_WriteBlockData(0, 16, buff));
}

/********************************************************************************************************************
** ��������: INT8U SD_GetCRC7()						Name:	  INT8U SD_GetCRC7()
** ��������: ����CRC7								Function: calculate crc7
** �䡡  ��: INT8U *pSource: ����					Input:    INT8U *pSource: data
			 INT16U len    : ���ݳ���						  INT16U len   : data length
** �� �� ��: CRC7��									Output:	  CRC7 code
*********************************************************************************************************************/
INT8U SD_GetCRC7(INT8U *pSource, INT16U len)
{
	INT8U i = 0, j;
	INT8U reg = 0;
	
	do
	{
	    for (j = 0; j < 8; j++)
	    {
			reg <<= 1;
			reg ^= ((((pSource[i] << j) ^ reg) & 0x80) ? 0x9 : 0);
	    }
	    
	    i++;
	    
	}while(i < len);
	
	return reg;
}	
#endif	

#if SD_EraseBlock_EN
/********************************************************************************************************************
** ��������: INT8U SD_EraseStartBlock()				Name:	  INT8U SD_EraseStartBlock()
** ��������: ���ÿ������ʼ��ַ						Function: select the start block address of erasing operation 
** �䡡  ��: INT32U startblock: ���ַ				Input: 	  INT32U startblock	: block address
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right	   >0:  error code
*********************************************************************************************************************/
INT8U SD_EraseStartBlock(INT32U startblock)
{
	if (sds.card_type == CARDTYPE_SD)
		return (SD_BlockCommand(CMD32, CMD32_R, startblock));	/* ���Ͳ�����ʼ���ַ send the start block address of erasing operation */
	else
		return (SD_BlockCommand(CMD35, CMD35_R, startblock));	/* ���Ͳ�����ʼ���ַ send the start block address of erasing operation */
}

/********************************************************************************************************************
** ��������: INT8U SD_EraseEndBlock()				Name:	  INT8U SD_EraseEndBlock()
** ��������: ���ÿ������ֹ��ַ						Function: select the end block address of erasing operation  
** �䡡  ��: INT32U endblock: ���ַ				Input:	  INT32U Length	: block address
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right	   >0:  error code
*********************************************************************************************************************/
INT8U SD_EraseEndBlock(INT32U endblock)
{
	if (sds.card_type == CARDTYPE_SD)
		return (SD_BlockCommand(CMD33, CMD33_R, endblock));     /* ���Ͳ�����ֹ���ַ send the end block address of erasing operation */
	else
		return (SD_BlockCommand(CMD36, CMD36_R, endblock));     /* ���Ͳ�����ֹ���ַ send the end block address of erasing operation */
}

/********************************************************************************************************************
** ��������: INT8U SD_EraseSelectedBlock()			Name:	  INT8U SD_EraseSelectedBlock()
** ��������: ������ѡ�еĿ�							Function: erase block selected
** �䡡  ��: ��										Input:	  NULL
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
*********************************************************************************************************************/
INT8U SD_EraseSelectedBlock(void)
{
	INT8U param[4],resp,tmp;
	
	SD_PackParam(param, 0);
	
	tmp = SD_SendCmd(CMD38, param, CMD38_R, &resp);	 	    /* ������ѡ��Ŀ�  erase blocks selected */
	if (tmp != SD_NO_ERR)
		return tmp;							 	
	
	if (SD_WaitBusy(SD_WAIT_ERASE) != SD_NO_ERR)			/* �ȴ�������� wait for finishing erasing */
		return SD_ERR_TIMEOUT_ERASE;
	else
		return SD_NO_ERR;									
}	
#endif

/*********************************************************************************************************************
** ��������: INT8U SD_ReadOCR()						Name:	  INT8U SD_ReadOCR()
** ��������: �����������Ĵ���OCR					Function: read OCR register of card
** �䡡  ��: INT8U ocrlen  : �Ĵ�������(�̶�Ϊ4)	Input:	  INT8U ocrlen  : len of register (fixed,is 4)
			 INT8U *recbuf : ���ջ�����					      INT8U *recbuf : recbuffer	
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
**********************************************************************************************************************/
INT8U SD_ReadOCR(INT8U ocrlen, INT8U *recbuf)
{
    INT8U param[4] = {0,0,0,0},resp[5],tmp;

    tmp = SD_SendCmd(CMD58, param, CMD58_R, resp);		/* �� OCR �Ĵ������� */
    if (tmp != SD_NO_ERR)								/* read OCR register command */
    	return tmp;		 										
    												
    if (resp[0] != 0)
        return SD_ERR_CMD_RESP;			 				/* ��Ӧ���� response is error */
    
    for (tmp = 0; tmp < 4; tmp++)
    	recbuf[tmp] = resp[tmp + 1];					/* ����OCR�Ĵ������ݵ����ջ����� */
    
    return SD_NO_ERR;
}

/********************************************************************************************************************
** ��������: INT8U SD_EnableCRC()					Name:	  INT8U SD_EnableCRC()
** ��������: ʹ��SD����CRCУ�鹦��					Function: enable crc check of SD Card 
** �䡡  ��: INT8U bEnable : 1:ʹ�� 0:��ֹ			Input:	  INT8U bEnable : 1:enable  0: disable
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
*********************************************************************************************************************/
#if SD_CRC_EN
INT8U SD_EnableCRC(INT8U bEnable)
{
	INT8U param[4],resp,ret;
		
	if (bEnable == 1)
		param[0] = 1;											/* ʹ��crc enable crc */
	else
		param[1] = 0; 											/* ��ֹcrc disalbe crc */

	ret = SD_SendCmd(CMD59, param, CMD59_R, &resp);				/* "ʹ��/��ֹCRC"���� enable/disable crc command */
	if (ret != SD_NO_ERR)
        return ret;							 
    
    if (resp != 0)    
       	return SD_ERR_CMD_RESP;									/* ��Ӧ���� response is error */		
 	
	return SD_NO_ERR;

}
#endif

/*********************************************************************************************************************
** ��������: INT8U SD_ReadSD_Status()				     Name:	   INT8U SD_ReadSD_Status()
** ��������: ��SD���� SD_Status �Ĵ���				     Function: read SD_Status register of sd card 
** �䡡  ��: INT8U sdslen  		: �Ĵ�������(�̶�Ϊ64)	 Input:    INT8U sdslen: len of register (fixed,is 64)
			 INT8U *recbuf 		: ���ջ�����				       INT8U *recbuf: recbuffer	
** �� �� ��: 0:   ��ȷ    >0:   ������		  			 Output:	  0:  right		>0:  error code
** ע    ��: ֻ��SD������SD Status �Ĵ���				 Note:     only SD card have SD Status Register
**********************************************************************************************************************/
#if SD_ReadSD_Status_EN
INT8U SD_ReadSD_Status(INT8U sdslen, INT8U *recbuf)
{
    INT8U param[4] = {0,0,0,0},resp[2],ret;
    
    ret = SD_SendCmd(CMD55, param, CMD55_R, resp);			/* ��������Ϊһ��Ӧ������ */
    if (ret != SD_NO_ERR)
    	return ret;											/* command that the followed commnad is a specific application */
    												 
    if (resp[0] != 0)
        return SD_ERR_CMD_RESP;								/* ��Ӧ���� response is error */
    
    ret = SD_SendCmd(ACMD13, param, ACMD13_R, resp);		/* �� SD_Status ���� */
    if (ret != SD_NO_ERR)
    	return ret;											/* command that read SD_Status register */
   												
    if ((resp[0] != 0) || (resp[1] != 0))
        return SD_ERR_CMD_RESP;								/* ��Ӧ���� response is error */
        
	return (SD_ReadBlockData(sdslen, recbuf));				/* �����Ĵ������� read the content of the register */
}
#endif

/*******************************************************************************************************************
** ��������: INT8U SD_ReadSCR()							Name:	  INT8U SD_ReadSCR()
** ��������: ��SD���� SCR �Ĵ���						Function: read SCR register of SD card 
** �䡡  ��: INT8U scrlen  		: �Ĵ�������(�̶�Ϊ8) 	Input:    INT8U scrlen		 : len of register (fixed,is 8)
			 INT8U *recbuf 		: ���ջ�����					  INT8U *recbuf		 : recieve buffer	
** �� �� ��: 0:   ��ȷ    >0:   ������		  			Output:	  0:  right		>0:  error code
** ��	 ע: MMC��û�иüĴ���							Note:	  MMC Card have not this register
********************************************************************************************************************/
#if SD_ReadSCR_EN
INT8U SD_ReadSCR(INT8U scrlen, INT8U *recbuf)
{
    INT8U param[4] = {0,0,0,0},resp,ret;
    
    ret = SD_SendCmd(CMD55, param, CMD55_R, &resp);		/* ��������Ϊһ��Ӧ������ */
    if (ret != SD_NO_ERR)								/* command that the followed commnad is a specific application */
    	return ret;													
    												 
    if (resp != 0)
        return SD_ERR_CMD_RESP;							/* ��Ӧ���� response is error */
    
    ret = SD_SendCmd(ACMD51, param, ACMD51_R, &resp);   /* ���Ͷ� SD Status ����*/
    if (ret != SD_NO_ERR)								/* command that read SD Status register */
   		return ret;													
				    															
    if (resp != 0)
        return SD_ERR_CMD_RESP;						 	/* ��Ӧ���� response is error */
        
	return (SD_ReadBlockData(scrlen, recbuf));	 		/* �����Ĵ������� read the content of the register */
}
#endif

/********************************************************************************************************************
** ��������: INT8U SD_GetNumWRBlcoks()				Name:	  INT8U SD_GetNumWRBlcoks()
** ��������: �õ���ȷд��Ŀ���						Function: get the block numbers that written correctly
** �䡡  ��: INT32U *blocknum: ���صĿ���			Input:	  INT32U blocknum	: the block numbers returned
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
** ע	 ��: MMC��û�и�����						Note:     MMC Card have no this command
*********************************************************************************************************************/
#if SD_WriteMultiBlock_EN
INT8U SD_GetNumWRBlcoks(INT32U *blocknum)
{
    INT8U tmp[4] = {0,0,0,0},resp,ret;
  
    ret = SD_SendCmd(CMD55, tmp, CMD55_R, &resp);	  	 /* ��������Ϊһ��Ӧ������ */
    if (ret != SD_NO_ERR) 								 /* command that the followed commnad is a specific application */
    	return ret;
    	 
    if (resp != 0)
    	return SD_ERR_CMD_RESP;    	
 											
   	ret = SD_SendCmd(ACMD22, tmp, ACMD22_R, &resp);  	 /* ��ȡ��ȷд��Ŀ������� */
   	if (ret != SD_NO_ERR)								 /* command that read the numbers of block written correctly */
   		return ret;											    
   		 														
	if (resp != 0)
    	return SD_ERR_CMD_RESP;							 /* ��Ӧ���� response is error */
    		
    ret = SD_ReadBlockData(4, tmp);						 /* ������ read the numbvers of block */
    if (ret != SD_NO_ERR)
    	return ret;
    	
    *blocknum = (tmp[0] << 24) + (tmp[1] << 16) + (tmp[2] << 8) + tmp[3];	
    													 /* ת��Ϊ32λ change to 32 bits */

	return SD_NO_ERR;    								 /* ����ִ�гɹ� return perform sucessfully */		
}
#endif

		/*********************************************************
		
		    			����ΪһЩ���ݴ��亯��
		
		**********************************************************/

/********************************************************************************************************************
** ��������: INT8U SD_ReadRegister()				Name:	  INT8U SD_ReadRegister()
** ��������: ��SD����ȡ����							Function: read data from SD card
** �䡡  ��: INT32U len	  : ����					Input:	  INT32U len   : length
			 INT8U *recbuf: ���ջ�����					 	  INT8U *recbuf: receive buffer
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
*********************************************************************************************************************/
INT8U SD_ReadRegister(INT32U len, INT8U *recbuf)
{	
	INT32U i = 0;
	INT8U resp;

    SPI_CS_Assert();
    do{    											/* �ȴ�������ʼ���� wait for data start token */
        resp = SPI_RecByte();
    	i++;
    }while((resp == 0xFF) && (i < SD_READREG_TIMEOUT));    
    
    if (i >= SD_READREG_TIMEOUT)
    {
    	SPI_CS_Deassert();
    	return SD_ERR_TIMEOUT_READ;					/* ��ʱ, ���ش��� timeout, return error */
  	}
  	
   	if (resp != SD_TOK_READ_STARTBLOCK)				
   	{												/* �����յ�������ʼ���� not receive data start token */
		recbuf[0] = resp;							
		i = 1;										/* ����len - 1���ֽ�Ҫ���� still len - 1 bytes will be received */
   	}
   	else
   		i = 0;										/* �յ�������ʼ����,����len���ֽ�Ҫ���� received data start token,still len bytes will be received */
   	  	
    for (; i < len; i++)
   		recbuf[i] = SPI_RecByte();					/* �������� receive data */
   		
    i = SPI_RecByte();								
    i = (i << 8) + SPI_RecByte();    				/* ��ȡ16λCRC get 16-bit CRC */	

#if SD_CRC_EN 
   	if (i != SD_GetCRC16(recbuf, len))
   	{												/* CRCУ����� CRC check is error */
   		SPI_SendByte(0xFF);
   		SPI_CS_Deassert();		
  		return SD_ERR_DATA_CRC16;					/* ����RCR16����  return error of CRC16 */				
  	}    
#endif   
  
    SPI_SendByte(0xFF);								/* ����֮ǰ����8��clock  clock out 8 clk before return */
    SPI_CS_Deassert();	
    	
	return SD_NO_ERR;
}	

/*******************************************************************************************************************
** ��������: INT8U SD_ReadBlockData()			Name:	  INT8U SD_ReadBlockData()
** ��������: �ӿ��ж�ȡ���ݿ�					Function: read block data from card
** �䡡  ��: INT32U len    : ����				Input:	  INT32U len    : length
			 INT8U *recbuf : ���ջ�����					  INT8U *recbuf : the buffer of receive
** �� �� ��: 0:   ��ȷ    >0:   ������		  	Output:	  0:  right		>0:  error code
*******************************************************************************************************************/
INT8U SD_ReadBlockData(INT32U len, INT8U *recbuf)
{
    INT8U tmp;
    INT32U i = 0,timeout;
    
#if SD_UCOSII_EN    
    timeout = SD_UCOSII_SMALLWAIT;						/* ���ٵĵȴ�ʱ�� small wait time */
#else
	timeout = sds.timeout_read;							/* �ȴ��������ݿ�ʼ�����ʱ�� wait time that receive data start token */
#endif  
    
    SPI_CS_Assert();    
    do
    { 											    	/* �ȴ��������ݿ�ʼ����0xFE  wait for receiving data start token 0xFE */
        tmp = SPI_RecByte();
        i++;
    }while((tmp == 0xFF) && (i < timeout));
	
#if SD_UCOSII_EN    
    if (i >= timeout)
   	{													/* �����ȴ�(��������) continue to wait(suspend task) */
   		timeout = sds.timeout_read;
   		i = 0;
	    do
    	{
        	OSTimeDly(1);								/* ���������1 tick(suspend task 1 tick) */
        	tmp = SPI_RecByte();
       	 	i++;
   		}while((tmp == 0xFF) && (i < timeout));
	}
#endif

	if (i >= timeout)
	{
		SPI_CS_Deassert();
       	return SD_ERR_TIMEOUT_READ;						/* ���ض���ʱ������  return error timeout error code of reading */
	}
	
	if (tmp != SD_TOK_READ_STARTBLOCK)					/* �����ʼ���ƴ��� read start block token is error */
	{
		SPI_SendByte(0xFF);
		SPI_CS_Deassert();
		return SD_ERR_DATA_START_TOK;
	}
	
	for (i = 0; i < len; i++)
   		recbuf[i] = SPI_RecByte();						/* �������� receive data */
   		
    i = SPI_RecByte();								
    i = (i << 8) + SPI_RecByte();    					/* ��ȡ16λCRC get 16-bit CRC */	

#if SD_CRC_EN 
   	if (i != SD_GetCRC16(recbuf, len))
   	{	
   		SPI_SendByte(0xFF); 							/* CRCУ����� CRC check is error */
   		SPI_CS_Deassert();		
  		return SD_ERR_DATA_CRC16;						/* ����RCR16����  return error of CRC16 */				
  	}    
#endif   

	SPI_SendByte(0xFF); 
	SPI_CS_Deassert();

  	return SD_NO_ERR;									/* ���غ���ִ�гɹ� return function perform sucessfully */
}

/*******************************************************************************************************************
** ��������: INT8U SD_WriteBlockData()				Name:	  INT8U SD_WriteBlockData()
** ��������: ��д���ݿ�							Function: write block data to card
** �䡡  ��: INT8U bmulti  : �Ƿ�Ϊ������1:��0:�� Input:	  INT8U bmulti   : multi blocks operate 1:Y 0:N 
			 INT32U len    : ����						  	  INT32U len     : length
			 INT8U *sendbuf: ���ͻ�����					 	  INT8U *sendbuf : the buffer of send
** �� �� ��: 0:   ��ȷ    >0:   ������		  		Output:	  0:  right		>0:  error code
********************************************************************************************************************/
INT8U SD_WriteBlockData(INT8U bmulti, INT32U len, INT8U *sendbuf)
{
	INT16U i;
	INT8U tmp;

	SPI_CS_Assert();
		
    SPI_SendByte(0xFF);								/* ��ʼ��������֮ǰ����8��clock clock out 8 clk before start */
    
    if (bmulti == 1)
        SPI_SendByte(SD_TOK_WRITE_STARTBLOCK_M);	/* д��鿪ʼ���� start token of write multi blocks */
	else
		SPI_SendByte(SD_TOK_WRITE_STARTBLOCK);		/* д���鿪ʼ���� start token of write single block */

	for (i = 0; i < len; i++)
        SPI_SendByte(sendbuf[i]);					/* �������� send data */

#if SD_CRC_EN	
	i = SD_GetCRC16(sendbuf,len);					/* ����CRC16 calculate CRC16 */
#endif
	
	SPI_SendByte((i >> 8) & 0xFF);
	SPI_SendByte(i & 0xFF); 						/* ����CRC16У���� send CRC16 check code */
			    
	tmp = SPI_RecByte();

	#if 0
  	if ((tmp & SD_RESP_DATA_MSK) != SD_RESP_DATA_ACCETPTED)	
  	{		
   		SPI_SendByte(0xFF);							/* ����֮ǰ����8��clock  clock out 8 clk before return */
   		SPI_CS_Deassert();
   		return SD_ERR_DATA_RESP;					/* ������Ӧ���� data response error */
    }
    #endif   

    SPI_CS_Deassert();
     		
    if (SD_WaitBusy(SD_WAIT_WRITE) != SD_NO_ERR)			
    	return SD_ERR_TIMEOUT_WRITE;				/* д�볬ʱ write time out */
    else
    	return SD_NO_ERR; 							/* д����ȷ write right */
 }

/*******************************************************************************************************************
** ��������: void SD_StopMultiToken()				Name:	  void SD_StopMultiToken(void)
** ��������: ���Ͷ��дֹͣ����						Function: send the token that stop multiple block write
** �䡡  ��: ��									    Input:	  NULL
** �� �� ��: ��										Output:	  NULL
********************************************************************************************************************/
void SD_StopMultiToken(void)
{
	SPI_CS_Assert();
	
	SPI_SendByte(0xFF);								/* �ȷ���8��clock send 8 clock first */
	SPI_SendByte(SD_TOK_STOP_MULTI);				/* ����ֹͣ���ݴ������� send stop transmission token */
	SPI_RecByte();
	
    SPI_CS_Deassert();
}


/********************************************************************************************************************
** ��������: void SD_WaitBusy()						Name:	  void SD_WaitBusy()
** ��������: ��ѯSD���Ƿ���æ״̬					Function: poll SD Card wheather it is busy
** �䡡  ��: INT32U waittype: ��ʱ����				Input:	  INT32U timeout: time out type
** �� �� ��: 0: δ��ʱ  >0: ������					Output:	  0: not time out   > 0: error code
*********************************************************************************************************************/
INT8U SD_WaitBusy(INT8U waittype)
{
    INT32U timeout, i = 0;
    INT8U tmp;
    
  	if (waittype == SD_WAIT_WRITE)
  		timeout = sds.timeout_write;				/* �ȴ�����Ϊд���� wait type is write operation */
  	else
  		timeout = sds.timeout_erase;   				/* �ȴ�����Ϊ�������� wait type is erase operation */
    	
#if SD_UCOSII_EN
        timeout = SD_UCOSII_SMALLWAIT;				/* ���ٵĵȴ�ʱ�� small wait time */
#endif
   
	SPI_CS_Assert();
   	do
   	{ 												/* �ȴ�æ���� wait for being busy end */
        tmp = SPI_RecByte();
        i++;
    }while ((tmp != 0xFF) && (i < timeout));		/* æʱ�յ���ֵΪ0 always receive 0 when card is busy */    

#if SD_UCOSII_EN
	if (i >= timeout)
	{												/* ���ٵȴ�����æ, after small wait, card is still busy */
  		if (waittype == SD_WAIT_WRITE)
  			timeout = sds.timeout_write;
  		else
  			timeout = sds.timeout_erase;   
			
		i = 0;
   		do
   		{ 	
   			OSTimeDly(1);							/* ����ϵͳ����1 tick  OS suspend 1 tick */
       		tmp = SPI_RecByte();
       		i++;
    	}while ((tmp != 0xFF) && (i < timeout));	/* æʱ�յ���ֵΪ0 always receive 0 when card is busy */    
	}
#endif	

	if(i < timeout) 
		tmp = SD_NO_ERR;							/* ����0,��ʾû��ʱ return 0 indicate that operation is not time out */
	else 
		tmp = SD_ERR_TIMEOUT_WAIT;					/* ���ش�����,��ʾ��ʱ return error code indicate that operation is time out */

	SPI_SendByte(0xFF);
	SPI_CS_Deassert();								
	return tmp;										/* ����ִ�н�� */
}

/********************************************************************************************************************
** ��������: void SD_SPIDelay()						Name:	  void SD_SPIDelay()
** ��������: SPI������ʱ							Function: SPI Bus delay 
** �䡡  ��: INT8U value: ��ʱֵ,������255		    Input:	  INT8U value : delay value,do not beyond 255
** �� �� ��: ��										Output:	  NULL
*********************************************************************************************************************/
void SD_SPIDelay(INT8U value)
{
    INT8U i;

    for (i = 0; i < value; i++)
        SPI_SendByte(0xFF);						 	/* ����0xFF clock out 0xFF */
}








