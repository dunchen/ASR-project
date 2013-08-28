#line 1 "library\\src\\sdcrc.c"



















 
#line 1 ".\\library\\inc\\sdcrc.h"



















 




#line 1 ".\\library\\inc\\sdconfig.h"



















 




typedef unsigned char  INT8U;                    
typedef signed   char  INT8;                     
typedef unsigned short INT16U;                   
typedef signed   short INT16;                    
typedef unsigned int   INT32U;                   
typedef signed   int   INT32;                    
typedef float          FP32;                     
typedef double         FP64;                     











 








	

	




 
 

															
 	


 







#line 26 ".\\library\\inc\\sdcrc.h"

extern INT16U SD_GetCRC16(INT8U *pSource,INT16U len);	

extern INT8U SD_GetCmdByte6(INT8U cmd,INT8U *param);	

extern INT8U SD_GetCRC7(INT8U *pSource,INT16U len);		



#line 22 "library\\src\\sdcrc.c"

