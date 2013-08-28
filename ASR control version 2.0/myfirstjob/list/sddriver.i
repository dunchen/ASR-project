#line 1 "library\\src\\sddriver.c"


















 
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



#line 21 "library\\src\\sddriver.c"
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
















#line 22 "library\\src\\sddriver.c"
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


	    





 
	    	    	    

 


 
 


 
 

	
 
 


 
 



 

















 








































                    
#line 23 "library\\src\\sddriver.c"





 
sd_struct sds;			

 
const INT32U time_unit[8] = {1000000000,100000000,10000000,
							 1000000,100000,10000,1000,100};

 							 
const INT8U time_value[16] = {0,10,12,13,15,20,25,30,
                              35,40,45,50,55,60,70,80};
 
                               
const INT8U r2w_fator[8] = {1,2,4,8,16,32,64,128};                           
 

void SD_Sleep(INT32U cpt_loop)
{
  while (cpt_loop -- != 0);
}   
	





 
				





 
INT8U SD_Initialize(void)
{
	INT8U recbuf[4],ret;
	
#line 73 "library\\src\\sddriver.c"
   
    SD_StartSD();
    SD_HardWareInit();					    		 
    
    if (SD_ChkCard() != 1)							 
    {	
    	ret = 0x01;   
    	goto SD_ERR;
    }
        
    SPI_CS_Assert();								   
	
	SD_SPIDelay(200);								 
    
	SPI_CS_Deassert();								 
    SD_SPIDelay(4);									 
     
    SD_Sleep(1000000);
    
    ret = SD_ResetSD();								 
   	
    if (ret != 0x00)
        goto SD_ERR;									
 	
 	ret = SD_ActiveInit();							 
 	if (ret != 0x00)
 		goto SD_ERR;
    
   	ret = SD_ReadOCR(4, recbuf);  					 
    if (ret != 0x00)
        goto SD_ERR;
    
    if ((recbuf[1] & 0x30) != 0x30)
    { 	 
        ret = 0x04;					 
    	goto SD_ERR;
    }
          

    ret = SD_EnableCRC(1);							 
	if (ret != 0x00)  
	  	goto SD_ERR;


    ret = SD_SetBlockLen(512);				 
    if (ret != 0x00)  
        goto SD_ERR;
        
    ret = SD_GetCardInfo();							     
	if (ret != 0x00)
		goto SD_ERR;

	SD_EndSD();	

	SPI_ClkToMax();									 		

	return 0x00;								 

SD_ERR:	
	SD_EndSD();	
	return ret;
}







 
INT8U SD_ReadBlock(INT32U blockaddr,INT32U len, INT8U *recbuf)
{
	INT8U ret; 
	
	SD_StartSD();									 
    if (SD_ChkCard() != 1)							
    {
    	SD_EndSD();	
    	return 0x01;   					 
	}
		
	if (blockaddr > sds.block_num)	
	{
		SD_EndSD();	
		return 0x05;				 
	}
	
 	ret = SD_ReadSingleBlock(blockaddr);			 						
 	if (ret != 0x00)
 	{
 		SD_EndSD();									
 		return ret;
 	}
 	
  	ret = SD_ReadBlockData(len, recbuf);			 	
	SD_EndSD();										 
	
	return ret;
}








 

INT8U SD_ReadMultiBlock(INT32U blockaddr, INT32U blocknum, INT8U *recbuf)
{
    INT32U i;
    INT8U ret;
       
	SD_StartSD();									 
    if (SD_ChkCard() != 1)							
    {
    	SD_EndSD();	
    	return 0x01;   					 
	}
		
	if ((blockaddr + blocknum) > sds.block_num)	
	{
		SD_EndSD();	
		return 0x05;				 
	}       
    
	ret = SD_ReadMultipleBlock(blockaddr);			 
	if (ret != 0x00)
	{	
		SD_EndSD();									 						
		return ret;
    }
    
    for (i = 0; i < blocknum; i++)
    {												 
    	ret = SD_ReadBlockData(512, recbuf);
    	if (ret == 0x00)
       		recbuf = recbuf + 512;
    	else
    	{
    		SD_EndSD();
    		return ret;
    	}
    }
 	 
 	ret = SD_StopTransmission();				      
 	
 	SD_EndSD();
	return ret; 
}









 
INT8U SD_WriteBlock(INT32U blockaddr, INT32U len, INT8U *sendbuf)
{
	INT8U ret,tmp[2];
	
	SD_StartSD();												 
    if (SD_ChkCard() != 1)							
    {
    	SD_EndSD();	
    	return 0x01;   								 
	}	
	
	if (blockaddr > sds.block_num)	
	{
		SD_EndSD();	
		return 0x05;							 
	}
	
	if (SD_ChkCardWP() == 1)
	{
		SD_EndSD();
		return 0x42;							 
	}
	
	ret = SD_WriteSingleBlock(blockaddr);						 
	if (ret != 0x00)
	{	
		SD_EndSD();
		return ret;
	}
	
	ret = SD_WriteBlockData(0, len, sendbuf);			 
 	
	if (ret == 0x00)										 
 	{															 
 		ret = SD_ReadCard_Status(2, tmp);
 		if (ret != 0x00)
 		{
 			SD_EndSD();
 			return ret;											 
		}

 		if((tmp[0] != 0) || (tmp[1] != 0))
 		{
 			SD_EndSD();
			ret = 0x40; 			     			 
 		}
 	}
  
    SD_EndSD();
 	return ret;													 									
}








 

INT8U SD_WriteMultiBlock(INT32U blockaddr, INT32U blocknum, INT8U *sendbuf)
{
	INT32U i;
	INT8U ret,tmp[2];
	
	SD_StartSD();												 
    if (SD_ChkCard() != 1)							
    {
    	SD_EndSD();	
    	return 0x01;   								 
	}
		
	if ((blockaddr + blocknum) > sds.block_num)	
	{
		SD_EndSD();	
		return 0x05;							 
	}
		
	if (SD_ChkCardWP() == 1)
	{
		SD_EndSD();
		return 0x42;							 
	}
	
	ret = SD_WriteMultipleBlock(blockaddr);						 
	if (ret != 0x00)
	{
		SD_EndSD();
		return ret;
	}
	
    for (i = 0; i < blocknum; i++)
    {															
 		ret = SD_WriteBlockData(1, 512, sendbuf);		 
 		if (ret == 0x00)	
 			sendbuf = sendbuf + 512;
 		else
 		{														 
			SD_StopTransmission();								 	
			SD_WaitBusy(0x01);							 
			SD_EndSD();
			return ret;
		}
	}
   
    SD_StopMultiToken();										 
      
    ret = SD_WaitBusy(0x01);							 
    if (ret != 0x00)
    {
    	SD_EndSD();
    	return 0x32;
    }
    
    if (sds.card_type == 0x00)
    {
   		ret = SD_GetNumWRBlcoks(&i);							 
   		if (ret != 0x00)
   		{
   			SD_EndSD();
   		  	return ret;
   		}
   		if(i != blocknum)
			ret =  0x41;						 
   	}
   	else
   	{
   	 	ret = SD_ReadCard_Status(2, tmp);
 		if (ret != 0x00)
 		{
 			SD_EndSD();
 			return ret;											 
		}
 		if((tmp[0] != 0) || (tmp[1] != 0))
			ret = 0x40; 			     			 
   	}
   	 	
   	SD_EndSD();   	     
	return ret;													 			
}









 

INT8U SD_EraseBlock(INT32U startaddr, INT32U blocknum)
{
	INT32 tmp;
	INT8U ret;
	
	SD_StartSD();												 
    if (SD_ChkCard() != 1)							
    {
    	SD_EndSD();	
    	return 0x01;   								 
	}
	
	if ((startaddr + blocknum) > sds.block_num)	
	{
		SD_EndSD();	
		return 0x05;							 
	}
		
	if (SD_ChkCardWP() == 1)
	{
		SD_EndSD();
		return 0x42;							 
	}	

	tmp = blocknum - sds.erase_unit;	
	while(tmp >= 0) 												 
	{	
		ret = SD_EraseStartBlock(startaddr);					 
		if (ret != 0x00)
		{
			SD_EndSD();
			return ret;
		}
		
		ret = SD_EraseEndBlock(startaddr + sds.erase_unit - 1);		 
		if (ret != 0x00)
		{
			SD_EndSD();
			return ret;
		}
			
		ret = SD_EraseSelectedBlock();							 
		if (ret != 0x00)
		{
			SD_EndSD();
			return ret;
		}

		startaddr += sds.erase_unit;								 
		blocknum  -= sds.erase_unit;
		tmp = blocknum - sds.erase_unit;
	};		
	
	if (blocknum > 0)											 
	{															 
		ret = SD_EraseStartBlock(startaddr);
		if (ret != 0x00)
		{
			SD_EndSD();
			return ret;
		}
		
		ret = SD_EraseEndBlock(startaddr + blocknum - 1);
		if (ret != 0x00)
		{
			SD_EndSD();
			return ret;
		}
			
		ret = SD_EraseSelectedBlock();
		if (ret != 0x00)
		{
			SD_EndSD();
			return ret;
		}
	}

	SD_EndSD();
	return 0x00;											 
}



	



 





 
INT8U SD_GetCardInfo()
{
	INT32U tmp;
	INT8U csdbuf[16],ret;

	ret = SD_ReadCSD(16, csdbuf);	 								    		 
	if (ret != 0x00)	
		return ret;	
		
	SD_CalTimeout(csdbuf);														 
		
	 														 
	sds.block_len = 1 << (csdbuf[5] & 0x0F);  			 
	
	 														 
	sds.block_num = ((csdbuf[6] & 0x03) << 10) +
	      			 (csdbuf[7] << 2) +
	 	 			((csdbuf[8] & 0xC0) >> 6) + 1;				 
		 	  															
	tmp = ((csdbuf[9] & 0x03) << 1) +   
	      ((csdbuf[10] & 0x80) >> 7) + 2;				 
    	
     														 
	sds.block_num = sds.block_num * (1 << tmp);									 
																			
	 	
	if (sds.card_type == 0x01)
	{					    
		tmp  = ((csdbuf[10] & 0x7C) >> 2) + 1;  	  
		
		 
		tmp *= ((csdbuf[10] & 0x03) << 3) +
		       ((csdbuf[11] & 0xE0) >> 5) + 1;	
	}
	else																		 
		tmp = ((csdbuf[10] & 0x3F) << 1) +  			
	          ((csdbuf[11] & 0x80) >> 7) + 1;			 
	
	sds.erase_unit = tmp;	    												  
	
	return 0x00;															 
}







 
INT8U SD_CalTimeout(INT8U *csdbuf)
{
	INT32U tmp;
	INT8U time_u,time_v,fator;
	
	sds.timeout_read = 100 * 9000000 / 1000 / 8;								 
	sds.timeout_write = 250 * 9000000 / 1000 / 8;							 
	sds.timeout_erase = 250 * 9000000 / 1000 / 8;
		
	time_u = (csdbuf[1] & 0x07);								 
	time_v = (csdbuf[1] & 0x78) >> 3;						 
	fator = (csdbuf[12] & 0x1C) >> 2;				 
	
	if(time_v == 0)	return 0x03;							 
	
	tmp = 9000000 * time_value[time_v] / 10 / time_unit[time_u];		 
	tmp = tmp + csdbuf[2] * 100;									 
	
	 
	sds.timeout_read = tmp;
	sds.timeout_write = tmp * r2w_fator[fator];							 
	
	if (sds.card_type == 0x00)
	{
		sds.timeout_read  = sds.timeout_read * 100 / 8;					 
		sds.timeout_write = sds.timeout_write * 100 / 8;
		if (sds.timeout_read > 100 * 9000000 / 1000 / 8)						 
			sds.timeout_read = 100 * 9000000 / 1000 / 8;
		
		if (sds.timeout_write > 250 * 9000000 / 1000 / 8)
			sds.timeout_write = 250 * 9000000 / 1000 / 8;
	}
	else
	{
		sds.timeout_read  = sds.timeout_read * 10 / 8;					 
		sds.timeout_write = sds.timeout_write * 10 / 8;
	}
	
	sds.timeout_erase = sds.timeout_write;
	





	
	return 0x00;	
}









 
INT8U SD_ActiveInit(void)
{
	INT8U param[4] = {0,0,0,0},resp[5],ret;
	INT32U i = 0;
	
 	do 
    {														 
        ret = SD_SendCmd(1, param, 1, resp);
        if (ret != 0x00)
       		return ret;
        i ++;
    }while (((resp[0] & 0x01) == 0x01) && (i <= 1000));
    														 
    														     
    if (i >= 1000)
        return 0x34;						 	
	
    ret = SD_SendCmd(55, param, 1, resp);
    if (ret != 0x00)
       	return ret;
       	
    ret = SD_SendCmd(41, param, 1, resp);		 
    if (ret != 0x00)	
    	return 0x06;
    
    if ((resp[0] & 0xFE) == 0)
      	sds.card_type = 0x00;						 	
    else	
    	sds.card_type = 0x01;						 

	return 0x00;
}






 
void SD_StartSD(void)
{





}






 
void SD_EndSD(void)
{



}	











 
INT16U SD_GetZLGSDVer(void)
{
	return 0x0200;						 
}










