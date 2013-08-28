#line 1 "library\\src\\sdcmd.c"

















 
#line 1 ".\\library\\inc\\sdhal.h"



















 




#line 1 ".\\library\\inc\\sdconfig.h"



















 




typedef unsigned char  INT8U;                    
typedef signed   char  INT8;                     
typedef unsigned short INT16U;                   
typedef signed   short INT16;                    
typedef unsigned int   INT32U;                   
typedef signed   int   INT32;                    
typedef float          FP32;                     
typedef double         FP64;                     











 








	

	




 
 

															
 	


 







#line 26 ".\\library\\inc\\sdhal.h"

 
extern INT8U SD_ChkCard(void);

 
extern INT8U SD_ChkCardWP(void);

 
extern void SD_HardWareInit(void);

 
extern void SPI_Clk400k(void);

 
extern void SPI_ClkToMax(void);

 
extern void SPI_SendByte(INT8U byte);

 
extern INT8U SPI_RecByte(void);

 
extern void SPI_CS_Assert(void);

 
extern void SPI_CS_Deassert(void);



#line 20 "library\\src\\sdcmd.c"
#line 1 ".\\library\\inc\\sdcrc.h"



















 




#line 26 ".\\library\\inc\\sdcrc.h"

extern INT16U SD_GetCRC16(INT8U *pSource,INT16U len);	

extern INT8U SD_GetCmdByte6(INT8U cmd,INT8U *param);	

extern INT8U SD_GetCRC7(INT8U *pSource,INT16U len);		



#line 21 "library\\src\\sdcmd.c"
#line 1 ".\\library\\inc\\sdcmd.h"



















 




#line 26 ".\\library\\inc\\sdcmd.h"






 

 





 
#line 48 ".\\library\\inc\\sdcmd.h"

 








 






 





 











 

 
 



 



 



 



 



 



 

 



 



 



 
 



 



 



 
 



 



 



 
 



 



 



 



 



 
 


 

 
 



 



 



 



 
 



 



 



 



 



 





extern INT8U SD_SendCmd(INT8U cmd, INT8U *param, INT8U resptype, INT8U *resp);  
extern void SD_PackParam(INT8U *parameter, INT32U value);						
extern INT8U SD_BlockCommand(INT8U cmd, INT8U resptype, INT32U parameter);		

	
extern INT8U SD_ResetSD(void);											

extern INT8U SD_ReadCSD(INT8U csdlen, INT8U *recbuf);					
extern INT8U SD_ReadCID(INT8U cidlen, INT8U *recbuf);					
extern INT8U SD_StopTransmission(void);									

extern INT8U SD_ReadCard_Status(INT8U len, INT8U *buffer);				
extern INT8U SD_SetBlockLen(INT32U length);								

extern INT8U SD_ReadSingleBlock(INT32U blockaddr);						
extern INT8U SD_ReadMultipleBlock(INT32U blockaddr);					

extern INT8U SD_WriteSingleBlock(INT32U blockaddr);						
extern INT8U SD_WriteMultipleBlock(INT32U blockaddr);					


extern INT8U SD_ProgramCSD(INT8U len, INT8U *buff);						

extern INT8U SD_EraseStartBlock(INT32U startblock);						
extern INT8U SD_EraseEndBlock(INT32U endblock);							
extern INT8U SD_EraseSelectedBlock(void);								


extern INT8U SD_ReadOCR(INT8U ocrlen,INT8U *recbuf);					
extern INT8U SD_EnableCRC(INT8U bEnable);								



extern INT8U SD_ReadSD_Status(INT8U sdslen, INT8U *recbuf);				
extern INT8U SD_GetNumWRBlcoks(INT32U *blocknum);						
extern INT8U SD_ReadSCR(INT8U scrlen, INT8U *recbuf);					



extern INT8U SD_ReadRegister(INT32U len, INT8U *recbuf);						
extern INT8U SD_ReadBlockData(INT32U len, INT8U *recbuf);						
extern INT8U SD_WriteBlockData(INT8U bmulti, INT32U len, INT8U *sendbuf);		


extern void SD_StopMultiToken(void);									
extern INT8U SD_WaitBusy(INT8U waittype);								
extern void SD_SPIDelay(INT8U value);									
















#line 22 "library\\src\\sdcmd.c"
#line 1 ".\\library\\inc\\sddriver.h"



















 




#line 26 ".\\library\\inc\\sddriver.h"

  
 
typedef struct SD_STRUCT
{	
	INT8U card_type;
	INT32U block_num;				 
	INT32U block_len;				 
	INT32U erase_unit;				 
	
	INT32U timeout_read;			 
	INT32U timeout_write;			 
	INT32U timeout_erase;			 
	
}sd_struct;

extern sd_struct sds;				  

		





 
		
 
#line 60 ".\\library\\inc\\sddriver.h"

 



			
 




 






 




 








 





	
		
 
extern INT8U SD_Initialize(void);	
							
 
extern INT8U SD_ReadBlock(INT32U blockaddr,INT32U len, INT8U *recbuf);  

 																	
extern INT8U SD_ReadMultiBlock(INT32U blockaddr, INT32U blocknum, INT8U *recbuf); 
 
                
extern INT8U SD_WriteBlock(INT32U blockaddr, INT32U len, INT8U *sendbuf);  

   
extern INT8U SD_WriteMultiBlock(INT32U blockaddr, INT32U blocknum, INT8U *recbuf); 

 
extern INT8U SD_EraseBlock(INT32U startaddr, INT32U blocknum); 

 
extern INT8U SD_GetCardInfo(void);

 
extern INT8U SD_CalTimeout(INT8U *csdbuf);

 
extern INT8U SD_ActiveInit(void);

 
extern void SD_StartSD(void);

 
extern void SD_EndSD(void);


	    





 
	    	    	    

 


 
 


 
 

	
 
 


 
 



 

















 








































                    
#line 23 "library\\src\\sdcmd.c"









 
INT8U SD_SendCmd(INT8U cmd, INT8U *param, INT8U resptype, INT8U *resp)
{
	INT32 i,rlen;
	INT8U tmp;
    
	SPI_CS_Assert();
   
    SPI_SendByte((cmd & 0x3F) | 0x40);				  
    
    for (i = 3; i >= 0; i--)
        SPI_SendByte(param[i]);						  





    SPI_SendByte(0x95);							 	  

    
    rlen = 0;
    switch (resptype)								  
    {												  
  		case 1:  rlen = 1;  break;
   	 	case 2: rlen = 1;  break;
       		 
    	case 3:  rlen = 2;	 break;
       		 
   		case 4:  rlen = 5;	 break;
       		 
    	default:  
			 SPI_SendByte(0xFF);	
      		 SPI_CS_Deassert();						 
        	 return 0x10;		  
    		 break;
    }
    
    i = 0;				
    do 												  
    {												   
        tmp = SPI_RecByte();
        i++;
    }while (((tmp & 0x80) != 0) && (i < 100));
    
    if (i >= 100)
    {												 
        SPI_CS_Deassert();
        return 0x11;					  
    }
    
    for (i = rlen - 1; i >= 0; i--)
    {
        resp[i] = tmp;
        tmp = SPI_RecByte();					 	  
    }
      
    SPI_CS_Deassert();
    return 0x00;								  
}







 
void SD_PackParam(INT8U *parameter, INT32U value)
{
    parameter[3] = (INT8U)(value >> 24);
    parameter[2] = (INT8U)(value >> 16);
    parameter[1] = (INT8U)(value >> 8);
    parameter[0] = (INT8U)(value);
}








 
INT8U SD_BlockCommand(INT8U cmd, INT8U resptype, INT32U parameter)
{
	INT8U param[4],resp,ret;
	
	parameter <<= 9;					  

	SD_PackParam(param, parameter);						  	

	ret = SD_SendCmd(cmd, param, resptype, &resp);
	if (ret != 0x00)
	   	 return ret;							 		  
	
	if (resp != 0)
		 return 0x12;		 				  
		 
	return 0x00;
}

	





 
	





 
INT8U SD_ResetSD(void)
{
	INT8U param[4] = {0,0,0,0},resp;
	
    return (SD_SendCmd(0, param, 1, &resp));	 
}







 
INT8U SD_ReadCSD(INT8U csdlen, INT8U *recbuf)
{
    INT8U param[4] = {0,0,0,0},resp,ret;
  	
    ret = SD_SendCmd(9, param, 1, &resp);		 
    if (ret != 0x00) 									
        return ret;									
  	
    if (resp != 0)
        return 0x12;							 
     
	return (SD_ReadRegister(csdlen, recbuf));
}







 
#line 197 "library\\src\\sdcmd.c"






 
INT8U SD_StopTransmission(void)
{
	INT8U param[4] = {0,0,0,0},resp;
	
 	return (SD_SendCmd(12, param, 2, &resp));	 
}







 
INT8U SD_ReadCard_Status(INT8U len, INT8U *buffer)
{
    INT8U param[4] = {0,0,0,0};

    return (SD_SendCmd(13, param, 3, buffer));  
    									 	 			 
}







 
INT8U SD_SetBlockLen(INT32U length)
{
	INT8U param[4],resp,ret;
  
    SD_PackParam(param, length);					 
          												
    ret = SD_SendCmd(16, param, 1, &resp);
    if (ret != 0x00)
 		return ret;									 
	
	if (resp != 0)
    	return 0x12;			   			 
    
    return 0x00; 								 			
}






 
INT8U SD_ReadSingleBlock(INT32U blockaddr)
{
	return (SD_BlockCommand(17, 1, blockaddr));  
}






 
INT8U SD_ReadMultipleBlock(INT32U blockaddr)
{
	return (SD_BlockCommand(18, 1, blockaddr));  
}






 
INT8U SD_WriteSingleBlock(INT32U blockaddr)
{
	return (SD_BlockCommand(24, 1, blockaddr));  
}






 
INT8U SD_WriteMultipleBlock(INT32U blockaddr)
{
	return (SD_BlockCommand(25, 1, blockaddr));  
}







 
#line 346 "library\\src\\sdcmd.c"







 
INT8U SD_EraseStartBlock(INT32U startblock)
{
	if (sds.card_type == 0x00)
		return (SD_BlockCommand(32, 1, startblock));	 
	else
		return (SD_BlockCommand(35, 1, startblock));	 
}






 
INT8U SD_EraseEndBlock(INT32U endblock)
{
	if (sds.card_type == 0x00)
		return (SD_BlockCommand(33, 1, endblock));      
	else
		return (SD_BlockCommand(36, 1, endblock));      
}






 
INT8U SD_EraseSelectedBlock(void)
{
	INT8U param[4],resp,tmp;
	
	SD_PackParam(param, 0);
	
	tmp = SD_SendCmd(38, param, 2, &resp);	 	     
	if (tmp != 0x00)
		return tmp;							 	
	
	if (SD_WaitBusy(0x02) != 0x00)			 
		return 0x33;
	else
		return 0x00;									
}	








 
INT8U SD_ReadOCR(INT8U ocrlen, INT8U *recbuf)
{
    INT8U param[4] = {0,0,0,0},resp[5],tmp;

    tmp = SD_SendCmd(58, param, 4, resp);		 
    if (tmp != 0x00)								 
    	return tmp;		 										
    												
    if (resp[0] != 0)
        return 0x12;			 				 
    
    for (tmp = 0; tmp < 4; tmp++)
    	recbuf[tmp] = resp[tmp + 1];					 
    
    return 0x00;
}






 
#line 450 "library\\src\\sdcmd.c"








 
#line 481 "library\\src\\sdcmd.c"








 
#line 512 "library\\src\\sdcmd.c"







 

INT8U SD_GetNumWRBlcoks(INT32U *blocknum)
{
    INT8U tmp[4] = {0,0,0,0},resp,ret;
  
    ret = SD_SendCmd(55, tmp, 1, &resp);	  	  
    if (ret != 0x00) 								  
    	return ret;
    	 
    if (resp != 0)
    	return 0x12;    	
 											
   	ret = SD_SendCmd(22, tmp, 1, &resp);  	  
   	if (ret != 0x00)								  
   		return ret;											    
   		 														
	if (resp != 0)
    	return 0x12;							  
    		
    ret = SD_ReadBlockData(4, tmp);						  
    if (ret != 0x00)
    	return ret;
    	
    *blocknum = (tmp[0] << 24) + (tmp[1] << 16) + (tmp[2] << 8) + tmp[3];	
    													  

	return 0x00;    								  		
}


		



 







 
INT8U SD_ReadRegister(INT32U len, INT8U *recbuf)
{	
	INT32U i = 0;
	INT8U resp;

    SPI_CS_Assert();
    do{    											 
        resp = SPI_RecByte();
    	i++;
    }while((resp == 0xFF) && (i < 8));    
    
    if (i >= 8)
    {
    	SPI_CS_Deassert();
    	return 0x31;					 
  	}
  	
   	if (resp != 0xFE)				
   	{												 
		recbuf[0] = resp;							
		i = 1;										 
   	}
   	else
   		i = 0;										 
   	  	
    for (; i < len; i++)
   		recbuf[i] = SPI_RecByte();					 
   		
    i = SPI_RecByte();								
    i = (i << 8) + SPI_RecByte();    				 	

#line 602 "library\\src\\sdcmd.c"
  
    SPI_SendByte(0xFF);								 
    SPI_CS_Deassert();	
    	
	return 0x00;
}	







 
INT8U SD_ReadBlockData(INT32U len, INT8U *recbuf)
{
    INT8U tmp;
    INT32U i = 0,timeout;
    



	timeout = sds.timeout_read;							 

    
    SPI_CS_Assert();    
    do
    { 											    	 
        tmp = SPI_RecByte();
        i++;
    }while((tmp == 0xFF) && (i < timeout));
	
#line 647 "library\\src\\sdcmd.c"

	if (i >= timeout)
	{
		SPI_CS_Deassert();
       	return 0x31;						 
	}
	
	if (tmp != 0xFE)					 
	{
		SPI_SendByte(0xFF);
		SPI_CS_Deassert();
		return 0x21;
	}
	
	for (i = 0; i < len; i++)
   		recbuf[i] = SPI_RecByte();						 
   		
    i = SPI_RecByte();								
    i = (i << 8) + SPI_RecByte();    					 	

#line 675 "library\\src\\sdcmd.c"

	SPI_SendByte(0xFF); 
	SPI_CS_Deassert();

  	return 0x00;									 
}








 
INT8U SD_WriteBlockData(INT8U bmulti, INT32U len, INT8U *sendbuf)
{
	INT16U i;
	INT8U tmp;

	SPI_CS_Assert();
		
    SPI_SendByte(0xFF);								 
    
    if (bmulti == 1)
        SPI_SendByte(0xFC);	 
	else
		SPI_SendByte(0xFE);		 

	for (i = 0; i < len; i++)
        SPI_SendByte(sendbuf[i]);					 




	
	SPI_SendByte((i >> 8) & 0xFF);
	SPI_SendByte(i & 0xFF); 						 
			    
	tmp = SPI_RecByte();

#line 724 "library\\src\\sdcmd.c"

    SPI_CS_Deassert();
     		
    if (SD_WaitBusy(0x01) != 0x00)			
    	return 0x32;				 
    else
    	return 0x00; 							 
 }






 
void SD_StopMultiToken(void)
{
	SPI_CS_Assert();
	
	SPI_SendByte(0xFF);								 
	SPI_SendByte(0xFD);				 
	SPI_RecByte();
	
    SPI_CS_Deassert();
}







 
INT8U SD_WaitBusy(INT8U waittype)
{
    INT32U timeout, i = 0;
    INT8U tmp;
    
  	if (waittype == 0x01)
  		timeout = sds.timeout_write;				 
  	else
  		timeout = sds.timeout_erase;   				 
    	



   
	SPI_CS_Assert();
   	do
   	{ 												 
        tmp = SPI_RecByte();
        i++;
    }while ((tmp != 0xFF) && (i < timeout));		     

#line 795 "library\\src\\sdcmd.c"

	if(i < timeout) 
		tmp = 0x00;							 
	else 
		tmp = 0x30;					 

	SPI_SendByte(0xFF);
	SPI_CS_Deassert();								
	return tmp;										 
}






 
void SD_SPIDelay(INT8U value)
{
    INT8U i;

    for (i = 0; i < value; i++)
        SPI_SendByte(0xFF);						 	 
}








