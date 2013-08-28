#line 1 "src\\main.c"

















#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"
 
 
 





 






 













#line 38 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"


  
  typedef unsigned int size_t;    








 
 

 
  typedef struct __va_list __va_list;





   




 




typedef struct __fpos_t_struct {
    unsigned __int64 __pos;
    



 
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
   


 


   

 

typedef struct __FILE FILE;
   






 

extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;

#line 129 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"
    

    

    





     



   


 


   


 

   



 

   


 




   


 





    


 






extern __declspec(__nothrow) int remove(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int rename(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) FILE *tmpfile(void);
   




 
extern __declspec(__nothrow) char *tmpnam(char *  );
   











 

extern __declspec(__nothrow) int fclose(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) int fflush(FILE *  );
   







 
extern __declspec(__nothrow) FILE *fopen(const char * __restrict  ,
                           const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   








































 
extern __declspec(__nothrow) FILE *freopen(const char * __restrict  ,
                    const char * __restrict  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(2,3)));
   








 
extern __declspec(__nothrow) void setbuf(FILE * __restrict  ,
                    char * __restrict  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) int setvbuf(FILE * __restrict  ,
                   char * __restrict  ,
                   int  , size_t  ) __attribute__((__nonnull__(1)));
   















 
#pragma __printf_args
extern __declspec(__nothrow) int fprintf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   


















 
#pragma __printf_args
extern __declspec(__nothrow) int _fprintf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   




 
#pragma __printf_args
extern __declspec(__nothrow) int _printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






 
#pragma __printf_args
extern __declspec(__nothrow) int _sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   















 

#pragma __printf_args
extern __declspec(__nothrow) int _snprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int fscanf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






























 
#pragma __scanf_args
extern __declspec(__nothrow) int _fscanf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   






 
#pragma __scanf_args
extern __declspec(__nothrow) int _scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int sscanf(const char * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   








 
#pragma __scanf_args
extern __declspec(__nothrow) int _sscanf(const char * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

 
extern __declspec(__nothrow) int vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int _vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int _vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int _vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int _vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int vfprintf(FILE * __restrict  ,
                    const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int vsprintf(char * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 

extern __declspec(__nothrow) int vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   







 

extern __declspec(__nothrow) int _vsprintf(char * __restrict  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vfprintf(FILE * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vsnprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   



 
extern __declspec(__nothrow) int fgetc(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) char *fgets(char * __restrict  , int  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   










 
extern __declspec(__nothrow) int fputc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   







 
extern __declspec(__nothrow) int fputs(const char * __restrict  , FILE * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int getc(FILE *  ) __attribute__((__nonnull__(1)));
   







 




    extern __declspec(__nothrow) int (getchar)(void);

   





 
extern __declspec(__nothrow) char *gets(char *  ) __attribute__((__nonnull__(1)));
   









 
extern __declspec(__nothrow) int putc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   





 




    extern __declspec(__nothrow) int (putchar)(int  );

   



 
extern __declspec(__nothrow) int puts(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int ungetc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   






















 

extern __declspec(__nothrow) size_t fread(void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   











 

extern __declspec(__nothrow) size_t __fread_bytes_avail(void * __restrict  ,
                    size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   











 

extern __declspec(__nothrow) size_t fwrite(const void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   







 

extern __declspec(__nothrow) int fgetpos(FILE * __restrict  , fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) int fseek(FILE *  , long int  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) int fsetpos(FILE * __restrict  , const fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   










 
extern __declspec(__nothrow) long int ftell(FILE *  ) __attribute__((__nonnull__(1)));
   











 
extern __declspec(__nothrow) void rewind(FILE *  ) __attribute__((__nonnull__(1)));
   





 

extern __declspec(__nothrow) void clearerr(FILE *  ) __attribute__((__nonnull__(1)));
   




 

extern __declspec(__nothrow) int feof(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) int ferror(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) void perror(const char *  );
   









 

extern __declspec(__nothrow) int _fisatty(FILE *   ) __attribute__((__nonnull__(1)));
    
 

extern __declspec(__nothrow) void __use_no_semihosting_swi(void);
extern __declspec(__nothrow) void __use_no_semihosting(void);
    





 











#line 948 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"



 

#line 19 "src\\main.c"
#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"
 
 
 
 




 








 












#line 38 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"


  
  typedef unsigned int size_t;








extern __declspec(__nothrow) void *memcpy(void * __restrict  ,
                    const void * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) void *memmove(void *  ,
                    const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   







 
extern __declspec(__nothrow) char *strcpy(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncpy(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 

extern __declspec(__nothrow) char *strcat(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncat(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 






 

extern __declspec(__nothrow) int memcmp(const void *  , const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strcmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int strncmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcasecmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strncasecmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcoll(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   







 

extern __declspec(__nothrow) size_t strxfrm(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   













 


#line 185 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) void *memchr(const void *  , int  , size_t  ) __attribute__((__nonnull__(1)));

   





 

#line 201 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   




 

extern __declspec(__nothrow) size_t strcspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 

#line 224 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strpbrk(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   




 

#line 239 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strrchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   





 

extern __declspec(__nothrow) size_t strspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   



 

#line 262 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strstr(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   





 

extern __declspec(__nothrow) char *strtok(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) char *_strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

extern __declspec(__nothrow) char *strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

   

































 

extern __declspec(__nothrow) void *memset(void *  , int  , size_t  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) char *strerror(int  );
   





 
extern __declspec(__nothrow) size_t strlen(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) size_t strlcpy(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   
















 

extern __declspec(__nothrow) size_t strlcat(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






















 

extern __declspec(__nothrow) void _membitcpybl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpybb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
    














































 







#line 494 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"



 

#line 20 "src\\main.c"
#line 1 ".\\library\\inc\\stm32f10x_lib.h"














 

 



 
#line 1 ".\\library\\inc\\stm32f10x_map.h"














 

 







 
#line 1 ".\\library\\inc\\stm32f10x_conf.h"













 

 



 
#line 1 ".\\library\\inc\\stm32f10x_type.h"














 

 



 
 
typedef signed long  s32;
typedef signed short s16;
typedef signed char  s8;

typedef signed long  const sc32;   
typedef signed short const sc16;   
typedef signed char  const sc8;    

typedef volatile signed long  vs32;
typedef volatile signed short vs16;
typedef volatile signed char  vs8;

typedef volatile signed long  const vsc32;   
typedef volatile signed short const vsc16;   
typedef volatile signed char  const vsc8;    

typedef unsigned long  u32;
typedef unsigned short u16;
typedef unsigned char  u8;

typedef unsigned long  const uc32;   
typedef unsigned short const uc16;   
typedef unsigned char  const uc8;    

typedef volatile unsigned long  vu32;
typedef volatile unsigned short vu16;
typedef volatile unsigned char  vu8;

typedef volatile unsigned long  const vuc32;   
typedef volatile unsigned short const vuc16;   
typedef volatile unsigned char  const vuc8;    

typedef enum {FALSE = 0, TRUE = !FALSE} bool;

typedef enum {RESET = 0, SET = !RESET} FlagStatus, ITStatus;

typedef enum {DISABLE = 0, ENABLE = !DISABLE} FunctionalState;


typedef enum {ERROR = 0, SUCCESS = !ERROR} ErrorStatus;

#line 73 ".\\library\\inc\\stm32f10x_type.h"

 
 
 



 
#line 22 ".\\library\\inc\\stm32f10x_conf.h"

 
 


 


 
 





 


 


 


 


 


 
#line 66 ".\\library\\inc\\stm32f10x_conf.h"

 


 



 
 

 


 
#line 90 ".\\library\\inc\\stm32f10x_conf.h"

 




 


 


 


 


 


 


 





 


 
#line 133 ".\\library\\inc\\stm32f10x_conf.h"

 
#line 141 ".\\library\\inc\\stm32f10x_conf.h"

 



 



 


 
#line 171 ".\\library\\inc\\stm32f10x_conf.h"



 
#line 27 ".\\library\\inc\\stm32f10x_map.h"
#line 28 ".\\library\\inc\\stm32f10x_map.h"
#line 1 ".\\library\\inc\\cortexm3_macro.h"













 

 



 
#line 22 ".\\library\\inc\\cortexm3_macro.h"

 
 
 
 
void __WFI(void);
void __WFE(void);
void __SEV(void);
void __ISB(void);
void __DSB(void);
void __DMB(void);
void __SVC(void);
u32 __MRS_CONTROL(void);
void __MSR_CONTROL(u32 Control);
u32 __MRS_PSP(void);
void __MSR_PSP(u32 TopOfProcessStack);
u32 __MRS_MSP(void);
void __MSR_MSP(u32 TopOfMainStack);
void __RESETPRIMASK(void);
void __SETPRIMASK(void);
u32 __READ_PRIMASK(void);
void __RESETFAULTMASK(void);
void __SETFAULTMASK(void);
u32 __READ_FAULTMASK(void);
void __BASEPRICONFIG(u32 NewPriority);
u32 __GetBASEPRI(void);
u16 __REV_HalfWord(u16 Data);
u32 __REV_Word(u32 Data);



 
#line 29 ".\\library\\inc\\stm32f10x_map.h"

 
 
 
 

 
typedef struct
{
  vu32 SR;
  vu32 CR1;
  vu32 CR2;
  vu32 SMPR1;
  vu32 SMPR2;
  vu32 JOFR1;
  vu32 JOFR2;
  vu32 JOFR3;
  vu32 JOFR4;
  vu32 HTR;
  vu32 LTR;
  vu32 SQR1;
  vu32 SQR2;
  vu32 SQR3;
  vu32 JSQR;
  vu32 JDR1;
  vu32 JDR2;
  vu32 JDR3;
  vu32 JDR4;
  vu32 DR;
} ADC_TypeDef;

 
typedef struct
{
  u32  RESERVED0;
  vu16 DR1;
  u16  RESERVED1;
  vu16 DR2;
  u16  RESERVED2;
  vu16 DR3;
  u16  RESERVED3;
  vu16 DR4;
  u16  RESERVED4;
  vu16 DR5;
  u16  RESERVED5;
  vu16 DR6;
  u16  RESERVED6;
  vu16 DR7;
  u16  RESERVED7;
  vu16 DR8;
  u16  RESERVED8;
  vu16 DR9;
  u16  RESERVED9;
  vu16 DR10;
  u16  RESERVED10; 
  vu16 RTCCR;
  u16  RESERVED11;
  vu16 CR;
  u16  RESERVED12;
  vu16 CSR;
  u16  RESERVED13[5];
  vu16 DR11;
  u16  RESERVED14;
  vu16 DR12;
  u16  RESERVED15;
  vu16 DR13;
  u16  RESERVED16;
  vu16 DR14;
  u16  RESERVED17;
  vu16 DR15;
  u16  RESERVED18;
  vu16 DR16;
  u16  RESERVED19;
  vu16 DR17;
  u16  RESERVED20;
  vu16 DR18;
  u16  RESERVED21;
  vu16 DR19;
  u16  RESERVED22;
  vu16 DR20;
  u16  RESERVED23;
  vu16 DR21;
  u16  RESERVED24;
  vu16 DR22;
  u16  RESERVED25;
  vu16 DR23;
  u16  RESERVED26;
  vu16 DR24;
  u16  RESERVED27;
  vu16 DR25;
  u16  RESERVED28;
  vu16 DR26;
  u16  RESERVED29;
  vu16 DR27;
  u16  RESERVED30;
  vu16 DR28;
  u16  RESERVED31;
  vu16 DR29;
  u16  RESERVED32;
  vu16 DR30;
  u16  RESERVED33; 
  vu16 DR31;
  u16  RESERVED34;
  vu16 DR32;
  u16  RESERVED35;
  vu16 DR33;
  u16  RESERVED36;
  vu16 DR34;
  u16  RESERVED37;
  vu16 DR35;
  u16  RESERVED38;
  vu16 DR36;
  u16  RESERVED39;
  vu16 DR37;
  u16  RESERVED40;
  vu16 DR38;
  u16  RESERVED41;
  vu16 DR39;
  u16  RESERVED42;
  vu16 DR40;
  u16  RESERVED43;
  vu16 DR41;
  u16  RESERVED44;
  vu16 DR42;
  u16  RESERVED45;    
} BKP_TypeDef;

 
typedef struct
{
  vu32 TIR;
  vu32 TDTR;
  vu32 TDLR;
  vu32 TDHR;
} CAN_TxMailBox_TypeDef;

typedef struct
{
  vu32 RIR;
  vu32 RDTR;
  vu32 RDLR;
  vu32 RDHR;
} CAN_FIFOMailBox_TypeDef;

typedef struct
{
  vu32 FR1;
  vu32 FR2;
} CAN_FilterRegister_TypeDef;

typedef struct
{
  vu32 MCR;
  vu32 MSR;
  vu32 TSR;
  vu32 RF0R;
  vu32 RF1R;
  vu32 IER;
  vu32 ESR;
  vu32 BTR;
  u32  RESERVED0[88];
  CAN_TxMailBox_TypeDef sTxMailBox[3];
  CAN_FIFOMailBox_TypeDef sFIFOMailBox[2];
  u32  RESERVED1[12];
  vu32 FMR;
  vu32 FM1R;
  u32  RESERVED2;
  vu32 FS1R;
  u32  RESERVED3;
  vu32 FFA1R;
  u32  RESERVED4;
  vu32 FA1R;
  u32  RESERVED5[8];
  CAN_FilterRegister_TypeDef sFilterRegister[14];
} CAN_TypeDef;

 
typedef struct
{
  vu32 DR;
  vu8  IDR;
  u8   RESERVED0;
  u16  RESERVED1;
  vu32 CR;
} CRC_TypeDef;


 
typedef struct
{
  vu32 CR;
  vu32 SWTRIGR;
  vu32 DHR12R1;
  vu32 DHR12L1;
  vu32 DHR8R1;
  vu32 DHR12R2;
  vu32 DHR12L2;
  vu32 DHR8R2;
  vu32 DHR12RD;
  vu32 DHR12LD;
  vu32 DHR8RD;
  vu32 DOR1;
  vu32 DOR2;
} DAC_TypeDef;

 
typedef struct
{
  vu32 IDCODE;
  vu32 CR;	
}DBGMCU_TypeDef;

 
typedef struct
{
  vu32 CCR;
  vu32 CNDTR;
  vu32 CPAR;
  vu32 CMAR;
} DMA_Channel_TypeDef;

typedef struct
{
  vu32 ISR;
  vu32 IFCR;
} DMA_TypeDef;

 
typedef struct
{
  vu32 IMR;
  vu32 EMR;
  vu32 RTSR;
  vu32 FTSR;
  vu32 SWIER;
  vu32 PR;
} EXTI_TypeDef;

 
typedef struct
{
  vu32 ACR;
  vu32 KEYR;
  vu32 OPTKEYR;
  vu32 SR;
  vu32 CR;
  vu32 AR;
  vu32 RESERVED;
  vu32 OBR;
  vu32 WRPR;
} FLASH_TypeDef;

typedef struct
{
  vu16 RDP;
  vu16 USER;
  vu16 Data0;
  vu16 Data1;
  vu16 WRP0;
  vu16 WRP1;
  vu16 WRP2;
  vu16 WRP3;
} OB_TypeDef;

 
typedef struct
{
  vu32 BTCR[8];   
} FSMC_Bank1_TypeDef; 

typedef struct
{
  vu32 BWTR[7];
} FSMC_Bank1E_TypeDef;

typedef struct
{
  vu32 PCR2;
  vu32 SR2;
  vu32 PMEM2;
  vu32 PATT2;
  u32  RESERVED0;   
  vu32 ECCR2; 
} FSMC_Bank2_TypeDef;  

typedef struct
{
  vu32 PCR3;
  vu32 SR3;
  vu32 PMEM3;
  vu32 PATT3;
  u32  RESERVED0;   
  vu32 ECCR3; 
} FSMC_Bank3_TypeDef; 

typedef struct
{
  vu32 PCR4;
  vu32 SR4;
  vu32 PMEM4;
  vu32 PATT4;
  vu32 PIO4; 
} FSMC_Bank4_TypeDef; 

 
typedef struct
{
  vu32 CRL;
  vu32 CRH;
  vu32 IDR;
  vu32 ODR;
  vu32 BSRR;
  vu32 BRR;
  vu32 LCKR;
} GPIO_TypeDef;

typedef struct
{
  vu32 EVCR;
  vu32 MAPR;
  vu32 EXTICR[4];
} AFIO_TypeDef;

 
typedef struct
{
  vu16 CR1;
  u16  RESERVED0;
  vu16 CR2;
  u16  RESERVED1;
  vu16 OAR1;
  u16  RESERVED2;
  vu16 OAR2;
  u16  RESERVED3;
  vu16 DR;
  u16  RESERVED4;
  vu16 SR1;
  u16  RESERVED5;
  vu16 SR2;
  u16  RESERVED6;
  vu16 CCR;
  u16  RESERVED7;
  vu16 TRISE;
  u16  RESERVED8;
} I2C_TypeDef;

 
typedef struct
{
  vu32 KR;
  vu32 PR;
  vu32 RLR;
  vu32 SR;
} IWDG_TypeDef;

 
typedef struct
{
  vu32 ISER[2];
  u32  RESERVED0[30];
  vu32 ICER[2];
  u32  RSERVED1[30];
  vu32 ISPR[2];
  u32  RESERVED2[30];
  vu32 ICPR[2];
  u32  RESERVED3[30];
  vu32 IABR[2];
  u32  RESERVED4[62];
  vu32 IPR[15];
} NVIC_TypeDef;

typedef struct
{
  vuc32 CPUID;
  vu32 ICSR;
  vu32 VTOR;
  vu32 AIRCR;
  vu32 SCR;
  vu32 CCR;
  vu32 SHPR[3];
  vu32 SHCSR;
  vu32 CFSR;
  vu32 HFSR;
  vu32 DFSR;
  vu32 MMFAR;
  vu32 BFAR;
  vu32 AFSR;
} SCB_TypeDef;

 
typedef struct
{
  vu32 CR;
  vu32 CSR;
} PWR_TypeDef;

 
typedef struct
{
  vu32 CR;
  vu32 CFGR;
  vu32 CIR;
  vu32 APB2RSTR;
  vu32 APB1RSTR;
  vu32 AHBENR;
  vu32 APB2ENR;
  vu32 APB1ENR;
  vu32 BDCR;
  vu32 CSR;
} RCC_TypeDef;

 
typedef struct
{
  vu16 CRH;
  u16  RESERVED0;
  vu16 CRL;
  u16  RESERVED1;
  vu16 PRLH;
  u16  RESERVED2;
  vu16 PRLL;
  u16  RESERVED3;
  vu16 DIVH;
  u16  RESERVED4;
  vu16 DIVL;
  u16  RESERVED5;
  vu16 CNTH;
  u16  RESERVED6;
  vu16 CNTL;
  u16  RESERVED7;
  vu16 ALRH;
  u16  RESERVED8;
  vu16 ALRL;
  u16  RESERVED9;
} RTC_TypeDef;

 
typedef struct
{
  vu32 POWER;
  vu32 CLKCR;
  vu32 ARG;
  vu32 CMD;
  vuc32 RESPCMD;
  vuc32 RESP1;
  vuc32 RESP2;
  vuc32 RESP3;
  vuc32 RESP4;
  vu32 DTIMER;
  vu32 DLEN;
  vu32 DCTRL;
  vuc32 DCOUNT;
  vuc32 STA;
  vu32 ICR;
  vu32 MASK;
  u32  RESERVED0[2];
  vuc32 FIFOCNT;
  u32  RESERVED1[13];
  vu32 FIFO;
} SDIO_TypeDef;

 
typedef struct
{
  vu16 CR1;
  u16  RESERVED0;
  vu16 CR2;
  u16  RESERVED1;
  vu16 SR;
  u16  RESERVED2;
  vu16 DR;
  u16  RESERVED3;
  vu16 CRCPR;
  u16  RESERVED4;
  vu16 RXCRCR;
  u16  RESERVED5;
  vu16 TXCRCR;
  u16  RESERVED6;
  vu16 I2SCFGR;
  u16  RESERVED7;
  vu16 I2SPR;
  u16  RESERVED8;  
} SPI_TypeDef;

 
typedef struct
{
  vu32 CTRL;
  vu32 LOAD;
  vu32 VAL;
  vuc32 CALIB;
} SysTick_TypeDef;

 
typedef struct
{
  vu16 CR1;
  u16  RESERVED0;
  vu16 CR2;
  u16  RESERVED1;
  vu16 SMCR;
  u16  RESERVED2;
  vu16 DIER;
  u16  RESERVED3;
  vu16 SR;
  u16  RESERVED4;
  vu16 EGR;
  u16  RESERVED5;
  vu16 CCMR1;
  u16  RESERVED6;
  vu16 CCMR2;
  u16  RESERVED7;
  vu16 CCER;
  u16  RESERVED8;
  vu16 CNT;
  u16  RESERVED9;
  vu16 PSC;
  u16  RESERVED10;
  vu16 ARR;
  u16  RESERVED11;
  vu16 RCR;
  u16  RESERVED12;
  vu16 CCR1;
  u16  RESERVED13;
  vu16 CCR2;
  u16  RESERVED14;
  vu16 CCR3;
  u16  RESERVED15;
  vu16 CCR4;
  u16  RESERVED16;
  vu16 BDTR;
  u16  RESERVED17;
  vu16 DCR;
  u16  RESERVED18;
  vu16 DMAR;
  u16  RESERVED19;
} TIM_TypeDef;

 
typedef struct
{
  vu16 SR;
  u16  RESERVED0;
  vu16 DR;
  u16  RESERVED1;
  vu16 BRR;
  u16  RESERVED2;
  vu16 CR1;
  u16  RESERVED3;
  vu16 CR2;
  u16  RESERVED4;
  vu16 CR3;
  u16  RESERVED5;
  vu16 GTPR;
  u16  RESERVED6;
} USART_TypeDef;

 
typedef struct
{
  vu32 CR;
  vu32 CFR;
  vu32 SR;
} WWDG_TypeDef;

 
 
 
 



 



 


 




#line 634 ".\\library\\inc\\stm32f10x_map.h"

#line 651 ".\\library\\inc\\stm32f10x_map.h"



#line 670 ".\\library\\inc\\stm32f10x_map.h"

 

 


 






 


 






 
 
 

 



























































































































































































































#line 924 ".\\library\\inc\\stm32f10x_map.h"














 
#line 1180 ".\\library\\inc\\stm32f10x_map.h"

 
 
 
 
 
 

 



 



 




 
 
 
 
 

 











 
#line 1228 ".\\library\\inc\\stm32f10x_map.h"




 







 
 
 
 
 

 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 






 




 








 
 
 
 
 


 
#line 1453 ".\\library\\inc\\stm32f10x_map.h"


 




 








 










 
#line 1490 ".\\library\\inc\\stm32f10x_map.h"






 











 










 














 
#line 1550 ".\\library\\inc\\stm32f10x_map.h"








 







 
#line 1584 ".\\library\\inc\\stm32f10x_map.h"


 
#line 1602 ".\\library\\inc\\stm32f10x_map.h"


 
#line 1625 ".\\library\\inc\\stm32f10x_map.h"


 
#line 1635 ".\\library\\inc\\stm32f10x_map.h"


 
#line 1653 ".\\library\\inc\\stm32f10x_map.h"


 
#line 1676 ".\\library\\inc\\stm32f10x_map.h"


 







 









   
#line 1706 ".\\library\\inc\\stm32f10x_map.h"



 
 
 
 
 

 






































































 






































































 
#line 1874 ".\\library\\inc\\stm32f10x_map.h"


 
#line 1893 ".\\library\\inc\\stm32f10x_map.h"


 
#line 1912 ".\\library\\inc\\stm32f10x_map.h"

#line 1929 ".\\library\\inc\\stm32f10x_map.h"


 
#line 1948 ".\\library\\inc\\stm32f10x_map.h"


 
#line 1968 ".\\library\\inc\\stm32f10x_map.h"


 


 






 
#line 1997 ".\\library\\inc\\stm32f10x_map.h"






 









 









 








 








 









 










 




#line 2073 ".\\library\\inc\\stm32f10x_map.h"






 






 





 
#line 2100 ".\\library\\inc\\stm32f10x_map.h"

 
#line 2109 ".\\library\\inc\\stm32f10x_map.h"

   
#line 2118 ".\\library\\inc\\stm32f10x_map.h"

 
#line 2127 ".\\library\\inc\\stm32f10x_map.h"


 





 
#line 2143 ".\\library\\inc\\stm32f10x_map.h"

 
#line 2152 ".\\library\\inc\\stm32f10x_map.h"

   
#line 2161 ".\\library\\inc\\stm32f10x_map.h"

 
#line 2170 ".\\library\\inc\\stm32f10x_map.h"


 





 
#line 2186 ".\\library\\inc\\stm32f10x_map.h"

 
#line 2195 ".\\library\\inc\\stm32f10x_map.h"

   
#line 2204 ".\\library\\inc\\stm32f10x_map.h"

 
#line 2213 ".\\library\\inc\\stm32f10x_map.h"


 





 
#line 2229 ".\\library\\inc\\stm32f10x_map.h"

 
#line 2238 ".\\library\\inc\\stm32f10x_map.h"

   
#line 2247 ".\\library\\inc\\stm32f10x_map.h"

 
#line 2256 ".\\library\\inc\\stm32f10x_map.h"



 
 
 
 
 

 






 



 



 






 
 
 
 
 

 
#line 2327 ".\\library\\inc\\stm32f10x_map.h"



 
#line 2364 ".\\library\\inc\\stm32f10x_map.h"


 
#line 2400 ".\\library\\inc\\stm32f10x_map.h"


 
#line 2436 ".\\library\\inc\\stm32f10x_map.h"


 
#line 2472 ".\\library\\inc\\stm32f10x_map.h"


 






 






 






 






 






 






 






 






 







 
#line 2549 ".\\library\\inc\\stm32f10x_map.h"


 




 









 
#line 2575 ".\\library\\inc\\stm32f10x_map.h"





 





 
#line 2593 ".\\library\\inc\\stm32f10x_map.h"


 






 
#line 2617 ".\\library\\inc\\stm32f10x_map.h"


 
 





 
#line 2633 ".\\library\\inc\\stm32f10x_map.h"
 
#line 2640 ".\\library\\inc\\stm32f10x_map.h"


 





 







 



 



 




 
 
 
 
 

 
#line 2695 ".\\library\\inc\\stm32f10x_map.h"


 
#line 2717 ".\\library\\inc\\stm32f10x_map.h"


 
#line 2739 ".\\library\\inc\\stm32f10x_map.h"


 
#line 2761 ".\\library\\inc\\stm32f10x_map.h"


 
#line 2783 ".\\library\\inc\\stm32f10x_map.h"


 
#line 2805 ".\\library\\inc\\stm32f10x_map.h"



 
 
 
 
 

 
#line 2843 ".\\library\\inc\\stm32f10x_map.h"


 
#line 2874 ".\\library\\inc\\stm32f10x_map.h"


 
#line 2885 ".\\library\\inc\\stm32f10x_map.h"
















 
#line 2910 ".\\library\\inc\\stm32f10x_map.h"
















 
#line 2935 ".\\library\\inc\\stm32f10x_map.h"
















 
#line 2960 ".\\library\\inc\\stm32f10x_map.h"
















 
#line 2985 ".\\library\\inc\\stm32f10x_map.h"
















 
#line 3010 ".\\library\\inc\\stm32f10x_map.h"
















 
#line 3035 ".\\library\\inc\\stm32f10x_map.h"
















 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 



 




 
 
 
 
 

 







 
#line 3157 ".\\library\\inc\\stm32f10x_map.h"

#line 3166 ".\\library\\inc\\stm32f10x_map.h"















  
 
#line 3189 ".\\library\\inc\\stm32f10x_map.h"



















 









































 



















































 



 



 



 



 



 



 
#line 3333 ".\\library\\inc\\stm32f10x_map.h"

#line 3340 ".\\library\\inc\\stm32f10x_map.h"

#line 3347 ".\\library\\inc\\stm32f10x_map.h"

#line 3354 ".\\library\\inc\\stm32f10x_map.h"








 
#line 3369 ".\\library\\inc\\stm32f10x_map.h"

#line 3376 ".\\library\\inc\\stm32f10x_map.h"

#line 3383 ".\\library\\inc\\stm32f10x_map.h"

#line 3390 ".\\library\\inc\\stm32f10x_map.h"

#line 3397 ".\\library\\inc\\stm32f10x_map.h"

#line 3404 ".\\library\\inc\\stm32f10x_map.h"


 
#line 3413 ".\\library\\inc\\stm32f10x_map.h"

#line 3420 ".\\library\\inc\\stm32f10x_map.h"

#line 3427 ".\\library\\inc\\stm32f10x_map.h"

#line 3434 ".\\library\\inc\\stm32f10x_map.h"

#line 3441 ".\\library\\inc\\stm32f10x_map.h"

#line 3448 ".\\library\\inc\\stm32f10x_map.h"


 
#line 3457 ".\\library\\inc\\stm32f10x_map.h"

#line 3464 ".\\library\\inc\\stm32f10x_map.h"

#line 3471 ".\\library\\inc\\stm32f10x_map.h"

#line 3478 ".\\library\\inc\\stm32f10x_map.h"






 



 



 



 



 





 
 
 
 
 

 










































 




 



 



 



 



 



 



 




 




 




 



 




 
 
 
 
 

 

















 









#line 3650 ".\\library\\inc\\stm32f10x_map.h"


 


























 
#line 3695 ".\\library\\inc\\stm32f10x_map.h"


 
#line 3710 ".\\library\\inc\\stm32f10x_map.h"


 
#line 3721 ".\\library\\inc\\stm32f10x_map.h"


 




























 






















 




























 






















 
#line 3842 ".\\library\\inc\\stm32f10x_map.h"


 



 



 



 



 



 



 



 



 
#line 3886 ".\\library\\inc\\stm32f10x_map.h"





#line 3897 ".\\library\\inc\\stm32f10x_map.h"


 
#line 3906 ".\\library\\inc\\stm32f10x_map.h"

#line 3913 ".\\library\\inc\\stm32f10x_map.h"


 




 
 
 
 
 

 





 
#line 3939 ".\\library\\inc\\stm32f10x_map.h"


 



 



 



 



 



 



 



 




 
 
 
 
 

 



 






 



 





 
 
 
 
 

 
#line 4016 ".\\library\\inc\\stm32f10x_map.h"




 
#line 4029 ".\\library\\inc\\stm32f10x_map.h"








 




 
 
 
 
 

 











#line 4069 ".\\library\\inc\\stm32f10x_map.h"


 











#line 4092 ".\\library\\inc\\stm32f10x_map.h"


 











#line 4115 ".\\library\\inc\\stm32f10x_map.h"


 











#line 4138 ".\\library\\inc\\stm32f10x_map.h"


 









































 









































 









































 









































 









































 









































 









































 









































 





























 





























 





























 
#line 4574 ".\\library\\inc\\stm32f10x_map.h"


 
#line 4584 ".\\library\\inc\\stm32f10x_map.h"


 
#line 4594 ".\\library\\inc\\stm32f10x_map.h"


 
#line 4606 ".\\library\\inc\\stm32f10x_map.h"

#line 4616 ".\\library\\inc\\stm32f10x_map.h"

#line 4626 ".\\library\\inc\\stm32f10x_map.h"

#line 4636 ".\\library\\inc\\stm32f10x_map.h"


 
#line 4648 ".\\library\\inc\\stm32f10x_map.h"

#line 4658 ".\\library\\inc\\stm32f10x_map.h"

#line 4668 ".\\library\\inc\\stm32f10x_map.h"

#line 4678 ".\\library\\inc\\stm32f10x_map.h"


 
#line 4690 ".\\library\\inc\\stm32f10x_map.h"

#line 4700 ".\\library\\inc\\stm32f10x_map.h"

#line 4710 ".\\library\\inc\\stm32f10x_map.h"

#line 4720 ".\\library\\inc\\stm32f10x_map.h"


 
#line 4732 ".\\library\\inc\\stm32f10x_map.h"

#line 4742 ".\\library\\inc\\stm32f10x_map.h"

#line 4752 ".\\library\\inc\\stm32f10x_map.h"

#line 4762 ".\\library\\inc\\stm32f10x_map.h"


 
#line 4774 ".\\library\\inc\\stm32f10x_map.h"

#line 4784 ".\\library\\inc\\stm32f10x_map.h"

#line 4794 ".\\library\\inc\\stm32f10x_map.h"

#line 4804 ".\\library\\inc\\stm32f10x_map.h"


 
#line 4816 ".\\library\\inc\\stm32f10x_map.h"

#line 4826 ".\\library\\inc\\stm32f10x_map.h"

#line 4836 ".\\library\\inc\\stm32f10x_map.h"

#line 4846 ".\\library\\inc\\stm32f10x_map.h"


 
#line 4858 ".\\library\\inc\\stm32f10x_map.h"

#line 4868 ".\\library\\inc\\stm32f10x_map.h"

#line 4878 ".\\library\\inc\\stm32f10x_map.h"

#line 4888 ".\\library\\inc\\stm32f10x_map.h"


 


 




 
 
 
 
 

 





 













 



 






#line 4942 ".\\library\\inc\\stm32f10x_map.h"


 



 



 



 



 



 



 



 



 

















 



 
#line 5023 ".\\library\\inc\\stm32f10x_map.h"


 
#line 5039 ".\\library\\inc\\stm32f10x_map.h"


 
#line 5066 ".\\library\\inc\\stm32f10x_map.h"


 



 




 
 
 
 
 

 
 
























 
























 
























 
























 
























 
























 
























 
























 
 
#line 5299 ".\\library\\inc\\stm32f10x_map.h"


 
#line 5312 ".\\library\\inc\\stm32f10x_map.h"


 







 
#line 5331 ".\\library\\inc\\stm32f10x_map.h"




     



 
 



 



 



 



 



 



 



 



 


 



 



 



 



 


 



 



 



 


 


 




 


 




 


 




 


 




 


 




 


 




 


 




 


 



 


 



 



 



 



 



 



 



 



 


 


#line 5519 ".\\library\\inc\\stm32f10x_map.h"




 


#line 5532 ".\\library\\inc\\stm32f10x_map.h"




 


#line 5545 ".\\library\\inc\\stm32f10x_map.h"




 


#line 5558 ".\\library\\inc\\stm32f10x_map.h"




 


#line 5571 ".\\library\\inc\\stm32f10x_map.h"




 


#line 5584 ".\\library\\inc\\stm32f10x_map.h"



 


#line 5596 ".\\library\\inc\\stm32f10x_map.h"




 


#line 5609 ".\\library\\inc\\stm32f10x_map.h"




 


 


#line 5625 ".\\library\\inc\\stm32f10x_map.h"



 


#line 5637 ".\\library\\inc\\stm32f10x_map.h"





 


#line 5651 ".\\library\\inc\\stm32f10x_map.h"



 


#line 5663 ".\\library\\inc\\stm32f10x_map.h"





 


#line 5677 ".\\library\\inc\\stm32f10x_map.h"



 


#line 5689 ".\\library\\inc\\stm32f10x_map.h"





 


#line 5703 ".\\library\\inc\\stm32f10x_map.h"



 


#line 5715 ".\\library\\inc\\stm32f10x_map.h"





 


#line 5729 ".\\library\\inc\\stm32f10x_map.h"



 


#line 5741 ".\\library\\inc\\stm32f10x_map.h"





 


#line 5755 ".\\library\\inc\\stm32f10x_map.h"



 


#line 5767 ".\\library\\inc\\stm32f10x_map.h"





 


#line 5781 ".\\library\\inc\\stm32f10x_map.h"



 


#line 5793 ".\\library\\inc\\stm32f10x_map.h"





 


#line 5807 ".\\library\\inc\\stm32f10x_map.h"



 


#line 5819 ".\\library\\inc\\stm32f10x_map.h"





 
 
 
 
 

 
 
#line 5841 ".\\library\\inc\\stm32f10x_map.h"


 
#line 5853 ".\\library\\inc\\stm32f10x_map.h"


 
#line 5872 ".\\library\\inc\\stm32f10x_map.h"












 






 






 
#line 5913 ".\\library\\inc\\stm32f10x_map.h"


 













 
#line 5936 ".\\library\\inc\\stm32f10x_map.h"


 
 







 





 






 






 







 





 






 






 







   





 






 






 






 





 






 






 






 





 






 





 
 



 
#line 6097 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6115 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6133 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6151 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6186 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6221 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6256 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6291 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6326 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6361 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6396 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6431 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6466 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6501 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6536 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6571 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6606 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6641 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6676 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6711 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6746 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6781 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6816 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6851 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6886 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6921 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6956 ".\\library\\inc\\stm32f10x_map.h"


 
#line 6991 ".\\library\\inc\\stm32f10x_map.h"


 
#line 7026 ".\\library\\inc\\stm32f10x_map.h"


 
#line 7061 ".\\library\\inc\\stm32f10x_map.h"


 
#line 7096 ".\\library\\inc\\stm32f10x_map.h"


 
#line 7131 ".\\library\\inc\\stm32f10x_map.h"



 
 
 
 
 

 









#line 7160 ".\\library\\inc\\stm32f10x_map.h"


 
#line 7169 ".\\library\\inc\\stm32f10x_map.h"


 
#line 7180 ".\\library\\inc\\stm32f10x_map.h"


 



 



 



 



 






















 






 
 
 
 
 

 
#line 7249 ".\\library\\inc\\stm32f10x_map.h"


 
#line 7259 ".\\library\\inc\\stm32f10x_map.h"








 



#line 7281 ".\\library\\inc\\stm32f10x_map.h"




 




 



 
#line 7309 ".\\library\\inc\\stm32f10x_map.h"


 
#line 7320 ".\\library\\inc\\stm32f10x_map.h"


 





 




 
 
 
 
 

 
#line 7350 ".\\library\\inc\\stm32f10x_map.h"


 



 




 
#line 7376 ".\\library\\inc\\stm32f10x_map.h"


 
#line 7386 ".\\library\\inc\\stm32f10x_map.h"








 
#line 7406 ".\\library\\inc\\stm32f10x_map.h"


 
#line 7418 ".\\library\\inc\\stm32f10x_map.h"





 
 
 
 
 

 


#line 7449 ".\\library\\inc\\stm32f10x_map.h"


 









#line 7474 ".\\library\\inc\\stm32f10x_map.h"



 
 
 
 
 

 




  





 



 



 






 
#line 7520 ".\\library\\inc\\stm32f10x_map.h"


 



 










 



 


 




 




 




 




 




 




 




 




 














 



 
#line 23 ".\\library\\inc\\stm32f10x_lib.h"

#line 1 ".\\library\\inc\\stm32f10x_adc.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_adc.h"

 
 
typedef struct
{
  u32 ADC_Mode;
  FunctionalState ADC_ScanConvMode; 
  FunctionalState ADC_ContinuousConvMode;
  u32 ADC_ExternalTrigConv;
  u32 ADC_DataAlign;
  u8 ADC_NbrOfChannel;
}ADC_InitTypeDef;

 



                                 



 
#line 55 ".\\library\\inc\\stm32f10x_adc.h"

#line 66 ".\\library\\inc\\stm32f10x_adc.h"

 
 
#line 75 ".\\library\\inc\\stm32f10x_adc.h"
 


 
#line 85 ".\\library\\inc\\stm32f10x_adc.h"

#line 100 ".\\library\\inc\\stm32f10x_adc.h"

 






 
#line 127 ".\\library\\inc\\stm32f10x_adc.h"

#line 137 ".\\library\\inc\\stm32f10x_adc.h"

 
#line 147 ".\\library\\inc\\stm32f10x_adc.h"

#line 156 ".\\library\\inc\\stm32f10x_adc.h"

 
 





 



 






#line 188 ".\\library\\inc\\stm32f10x_adc.h"

 










 
#line 208 ".\\library\\inc\\stm32f10x_adc.h"

#line 216 ".\\library\\inc\\stm32f10x_adc.h"

 








 











 


 


 


 


 


 


 


 
 
void ADC_DeInit(ADC_TypeDef* ADCx);
void ADC_Init(ADC_TypeDef* ADCx, ADC_InitTypeDef* ADC_InitStruct);
void ADC_StructInit(ADC_InitTypeDef* ADC_InitStruct);
void ADC_Cmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_ITConfig(ADC_TypeDef* ADCx, u16 ADC_IT, FunctionalState NewState);
void ADC_ResetCalibration(ADC_TypeDef* ADCx);
FlagStatus ADC_GetResetCalibrationStatus(ADC_TypeDef* ADCx);
void ADC_StartCalibration(ADC_TypeDef* ADCx);
FlagStatus ADC_GetCalibrationStatus(ADC_TypeDef* ADCx);
void ADC_SoftwareStartConvCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
FlagStatus ADC_GetSoftwareStartConvStatus(ADC_TypeDef* ADCx);
void ADC_DiscModeChannelCountConfig(ADC_TypeDef* ADCx, u8 Number);
void ADC_DiscModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_RegularChannelConfig(ADC_TypeDef* ADCx, u8 ADC_Channel, u8 Rank, u8 ADC_SampleTime);
void ADC_ExternalTrigConvCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
u16 ADC_GetConversionValue(ADC_TypeDef* ADCx);
u32 ADC_GetDualModeConversionValue(void);
void ADC_AutoInjectedConvCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_InjectedDiscModeCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_ExternalTrigInjectedConvConfig(ADC_TypeDef* ADCx, u32 ADC_ExternalTrigInjecConv);
void ADC_ExternalTrigInjectedConvCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
void ADC_SoftwareStartInjectedConvCmd(ADC_TypeDef* ADCx, FunctionalState NewState);
FlagStatus ADC_GetSoftwareStartInjectedConvCmdStatus(ADC_TypeDef* ADCx);
void ADC_InjectedChannelConfig(ADC_TypeDef* ADCx, u8 ADC_Channel, u8 Rank, u8 ADC_SampleTime);
void ADC_InjectedSequencerLengthConfig(ADC_TypeDef* ADCx, u8 Length);
void ADC_SetInjectedOffset(ADC_TypeDef* ADCx, u8 ADC_InjectedChannel, u16 Offset);
u16 ADC_GetInjectedConversionValue(ADC_TypeDef* ADCx, u8 ADC_InjectedChannel);
void ADC_AnalogWatchdogCmd(ADC_TypeDef* ADCx, u32 ADC_AnalogWatchdog);
void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, u16 HighThreshold, u16 LowThreshold);
void ADC_AnalogWatchdogSingleChannelConfig(ADC_TypeDef* ADCx, u8 ADC_Channel);
void ADC_TempSensorVrefintCmd(FunctionalState NewState);
FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, u8 ADC_FLAG);
void ADC_ClearFlag(ADC_TypeDef* ADCx, u8 ADC_FLAG);
ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx, u16 ADC_IT);
void ADC_ClearITPendingBit(ADC_TypeDef* ADCx, u16 ADC_IT);



 
#line 26 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_bkp.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_bkp.h"

 
 
 






 










 
#line 87 ".\\library\\inc\\stm32f10x_bkp.h"

#line 102 ".\\library\\inc\\stm32f10x_bkp.h"



 
 
void BKP_DeInit(void);
void BKP_TamperPinLevelConfig(u16 BKP_TamperPinLevel);
void BKP_TamperPinCmd(FunctionalState NewState);
void BKP_ITConfig(FunctionalState NewState);
void BKP_RTCOutputConfig(u16 BKP_RTCOutputSource);
void BKP_SetRTCCalibrationValue(u8 CalibrationValue);
void BKP_WriteBackupRegister(u16 BKP_DR, u16 Data);
u16 BKP_ReadBackupRegister(u16 BKP_DR);
FlagStatus BKP_GetFlagStatus(void);
void BKP_ClearFlag(void);
ITStatus BKP_GetITStatus(void);
void BKP_ClearITPendingBit(void);



 
#line 30 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_can.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_can.h"

 
 
typedef struct
{
  FunctionalState CAN_TTCM;
  FunctionalState CAN_ABOM;
  FunctionalState CAN_AWUM;
  FunctionalState CAN_NART;
  FunctionalState CAN_RFLM;
  FunctionalState CAN_TXFP;
  u8 CAN_Mode;
  u8 CAN_SJW;
  u8 CAN_BS1;
  u8 CAN_BS2;
  u16 CAN_Prescaler;
} CAN_InitTypeDef;

 
typedef struct
{
  u8 CAN_FilterNumber;
  u8 CAN_FilterMode;
  u8 CAN_FilterScale;
  u16 CAN_FilterIdHigh;
  u16 CAN_FilterIdLow;
  u16 CAN_FilterMaskIdHigh;
  u16 CAN_FilterMaskIdLow;
  u16 CAN_FilterFIFOAssignment;
  FunctionalState CAN_FilterActivation;
} CAN_FilterInitTypeDef;

 
typedef struct
{
  u32 StdId;
  u32 ExtId;
  u8 IDE;
  u8 RTR;
  u8 DLC;
  u8 Data[8];
} CanTxMsg;

 
typedef struct
{
  u32 StdId;
  u32 ExtId;
  u8 IDE;
  u8 RTR;
  u8 DLC;
  u8 Data[8];
  u8 FMI;
} CanRxMsg;

 

 



 








 








 
#line 119 ".\\library\\inc\\stm32f10x_can.h"



 
#line 131 ".\\library\\inc\\stm32f10x_can.h"



 


 


 






 






 






 





 





 





 





 





 



 



 







 
#line 225 ".\\library\\inc\\stm32f10x_can.h"

#line 233 ".\\library\\inc\\stm32f10x_can.h"

#line 240 ".\\library\\inc\\stm32f10x_can.h"

 
 
void CAN_DeInit(void);
u8 CAN_Init(CAN_InitTypeDef* CAN_InitStruct);
void CAN_FilterInit(CAN_FilterInitTypeDef* CAN_FilterInitStruct);
void CAN_StructInit(CAN_InitTypeDef* CAN_InitStruct);
void CAN_ITConfig(u32 CAN_IT, FunctionalState NewState);
u8 CAN_Transmit(CanTxMsg* TxMessage);
u8 CAN_TransmitStatus(u8 TransmitMailbox);
void CAN_CancelTransmit(u8 Mailbox);
void CAN_FIFORelease(u8 FIFONumber);
u8 CAN_MessagePending(u8 FIFONumber);
void CAN_Receive(u8 FIFONumber, CanRxMsg* RxMessage);
u8 CAN_Sleep(void);
u8 CAN_WakeUp(void);
FlagStatus CAN_GetFlagStatus(u32 CAN_FLAG);
void CAN_ClearFlag(u32 CAN_FLAG);
ITStatus CAN_GetITStatus(u32 CAN_IT);
void CAN_ClearITPendingBit(u32 CAN_IT);



 
#line 34 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_crc.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_crc.h"

 
 
 
 
void CRC_ResetDR(void);
u32 CRC_CalcCRC(u32 Data);
u32 CRC_CalcBlockCRC(u32 pBuffer[], u32 BufferLength);
u32 CRC_GetCRC(void);
void CRC_SetIDRegister(u8 IDValue);
u8 CRC_GetIDRegister(void);



 
#line 38 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_dac.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_dac.h"

 
 
typedef struct
{
  u32 DAC_Trigger;
  u32 DAC_WaveGeneration;
  u32 DAC_LFSRUnmask_TriangleAmplitude;
  u32 DAC_OutputBuffer; 
}DAC_InitTypeDef;

 
 
#line 45 ".\\library\\inc\\stm32f10x_dac.h"

#line 55 ".\\library\\inc\\stm32f10x_dac.h"

 








 
#line 78 ".\\library\\inc\\stm32f10x_dac.h"

#line 91 ".\\library\\inc\\stm32f10x_dac.h"

#line 116 ".\\library\\inc\\stm32f10x_dac.h"

 






 






 








 






 


 
 
void DAC_DeInit(void);
void DAC_Init(u32 DAC_Channel, DAC_InitTypeDef* DAC_InitStruct);
void DAC_StructInit(DAC_InitTypeDef* DAC_InitStruct);
void DAC_Cmd(u32 DAC_Channel, FunctionalState NewState);
void DAC_DMACmd(u32 DAC_Channel, FunctionalState NewState);
void DAC_SoftwareTriggerCmd(u32 DAC_Channel, FunctionalState NewState);
void DAC_DualSoftwareTriggerCmd(FunctionalState NewState);
void DAC_WaveGenerationCmd(u32 DAC_Channel, u32 DAC_Wave, FunctionalState NewState);
void DAC_SetChannel1Data(u32 DAC_Align, u16 Data);
void DAC_SetChannel2Data(u32 DAC_Align, u16 Data);
void DAC_SetDualChannelData(u32 DAC_Align, u16 Data2, u16 Data1);
u16 DAC_GetDataOutputValue(u32 DAC_Channel);



 
#line 42 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_dbgmcu.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_dbgmcu.h"

 
 
#line 42 ".\\library\\inc\\stm32f10x_dbgmcu.h"
                                           


 
 
u32 DBGMCU_GetREVID(void);
u32 DBGMCU_GetDEVID(void);
void DBGMCU_Config(u32 DBGMCU_Periph, FunctionalState NewState);



 


#line 46 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_dma.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_dma.h"

 
 
typedef struct
{
  u32 DMA_PeripheralBaseAddr;
  u32 DMA_MemoryBaseAddr;
  u32 DMA_DIR;
  u32 DMA_BufferSize;
  u32 DMA_PeripheralInc;
  u32 DMA_MemoryInc;
  u32 DMA_PeripheralDataSize;
  u32 DMA_MemoryDataSize;
  u32 DMA_Mode;
  u32 DMA_Priority;
  u32 DMA_M2M;
}DMA_InitTypeDef;

 
#line 54 ".\\library\\inc\\stm32f10x_dma.h"

 






 






 






 








 








 





 










 





 






 
#line 153 ".\\library\\inc\\stm32f10x_dma.h"
 
#line 174 ".\\library\\inc\\stm32f10x_dma.h"

#line 200 ".\\library\\inc\\stm32f10x_dma.h"

 
 
#line 231 ".\\library\\inc\\stm32f10x_dma.h"
 
#line 252 ".\\library\\inc\\stm32f10x_dma.h"

#line 278 ".\\library\\inc\\stm32f10x_dma.h"

 


 
 
void DMA_DeInit(DMA_Channel_TypeDef* DMAy_Channelx);
void DMA_Init(DMA_Channel_TypeDef* DMAy_Channelx, DMA_InitTypeDef* DMA_InitStruct);
void DMA_StructInit(DMA_InitTypeDef* DMA_InitStruct);
void DMA_Cmd(DMA_Channel_TypeDef* DMAy_Channelx, FunctionalState NewState);
void DMA_ITConfig(DMA_Channel_TypeDef* DMAy_Channelx, u32 DMA_IT, FunctionalState NewState);
u16 DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMAy_Channelx);
FlagStatus DMA_GetFlagStatus(u32 DMA_FLAG);
void DMA_ClearFlag(u32 DMA_FLAG);
ITStatus DMA_GetITStatus(u32 DMA_IT);
void DMA_ClearITPendingBit(u32 DMA_IT);



 
#line 50 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_exti.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_exti.h"

 
 
typedef enum
{
  EXTI_Mode_Interrupt = 0x00,
  EXTI_Mode_Event = 0x04
}EXTIMode_TypeDef;


                            
 
typedef enum
{
  EXTI_Trigger_Rising = 0x08,
  EXTI_Trigger_Falling = 0x0C,  
  EXTI_Trigger_Rising_Falling = 0x10
}EXTITrigger_TypeDef;





 
typedef struct
{
  u32 EXTI_Line;
  EXTIMode_TypeDef EXTI_Mode;
  EXTITrigger_TypeDef EXTI_Trigger;
  FunctionalState EXTI_LineCmd;
}EXTI_InitTypeDef;

 
 
#line 80 ".\\library\\inc\\stm32f10x_exti.h"



#line 93 ".\\library\\inc\\stm32f10x_exti.h"
                                 
 
 
void EXTI_DeInit(void);
void EXTI_Init(EXTI_InitTypeDef* EXTI_InitStruct);
void EXTI_StructInit(EXTI_InitTypeDef* EXTI_InitStruct);
void EXTI_GenerateSWInterrupt(u32 EXTI_Line);
FlagStatus EXTI_GetFlagStatus(u32 EXTI_Line);
void EXTI_ClearFlag(u32 EXTI_Line);
ITStatus EXTI_GetITStatus(u32 EXTI_Line);
void EXTI_ClearITPendingBit(u32 EXTI_Line);



 
#line 54 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_flash.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_flash.h"

 
#line 36 ".\\library\\inc\\stm32f10x_flash.h"

 








 







 






#line 175 ".\\library\\inc\\stm32f10x_flash.h"
								 
 
 
 
void FLASH_SetLatency(u32 FLASH_Latency);
void FLASH_HalfCycleAccessCmd(u32 FLASH_HalfCycleAccess);
void FLASH_PrefetchBufferCmd(u32 FLASH_PrefetchBuffer);

#line 205 ".\\library\\inc\\stm32f10x_flash.h"



 
#line 58 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_fsmc.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_fsmc.h"

 
 
typedef struct
{
  u32 FSMC_AddressSetupTime;
  u32 FSMC_AddressHoldTime;
  u32 FSMC_DataSetupTime;
  u32 FSMC_BusTurnAroundDuration;
  u32 FSMC_CLKDivision;
  u32 FSMC_DataLatency;
  u32 FSMC_AccessMode;
}FSMC_NORSRAMTimingInitTypeDef;

 
typedef struct
{
  u32 FSMC_Bank;
  u32 FSMC_DataAddressMux;
  u32 FSMC_MemoryType;
  u32 FSMC_MemoryDataWidth;
  u32 FSMC_BurstAccessMode;
  u32 FSMC_WaitSignalPolarity;
  u32 FSMC_WrapMode;
  u32 FSMC_WaitSignalActive;
  u32 FSMC_WriteOperation;
  u32 FSMC_WaitSignal;
  u32 FSMC_ExtendedMode;
  u32 FSMC_WriteBurst;
   
  FSMC_NORSRAMTimingInitTypeDef* FSMC_ReadWriteTimingStruct;
   
  FSMC_NORSRAMTimingInitTypeDef* FSMC_WriteTimingStruct;
}FSMC_NORSRAMInitTypeDef;

 
typedef struct
{
  u32 FSMC_SetupTime;
  u32 FSMC_WaitSetupTime;
  u32 FSMC_HoldSetupTime;
  u32 FSMC_HiZSetupTime;
}FSMC_NAND_PCCARDTimingInitTypeDef;

 
typedef struct
{
  u32 FSMC_Bank;
  u32 FSMC_Waitfeature;
  u32 FSMC_MemoryDataWidth;
  u32 FSMC_ECC;
  u32 FSMC_ECCPageSize;
  u32 FSMC_AddressLowMapping;
  u32 FSMC_TCLRSetupTime;
  u32 FSMC_TARSetupTime;
   
  FSMC_NAND_PCCARDTimingInitTypeDef*  FSMC_CommonSpaceTimingStruct;
   
  FSMC_NAND_PCCARDTimingInitTypeDef*  FSMC_AttributeSpaceTimingStruct;
}FSMC_NANDInitTypeDef;

 
typedef struct
{
  u32 FSMC_Waitfeature;
  u32 FSMC_AddressLowMapping;
  u32 FSMC_TCLRSetupTime;
  u32 FSMC_TARSetupTime;
   
  FSMC_NAND_PCCARDTimingInitTypeDef*  FSMC_CommonSpaceTimingStruct;
   
  FSMC_NAND_PCCARDTimingInitTypeDef*  FSMC_AttributeSpaceTimingStruct;
   
  FSMC_NAND_PCCARDTimingInitTypeDef*  FSMC_IOSpaceTimingStruct;
}FSMC_PCCARDInitTypeDef;

 
 
#line 108 ".\\library\\inc\\stm32f10x_fsmc.h"













                                    





 
 






 







                                     
 





                                      
                               
 






                                   





                                        
  





                                 
                                  





                                    
 





                              
 






 





                                                                 
                                   






 


 


 


 


 


 


 









                                  
 
 





                                    
 





                                    
 





                                            
 
#line 266 ".\\library\\inc\\stm32f10x_fsmc.h"

#line 273 ".\\library\\inc\\stm32f10x_fsmc.h"
                                                              
 





 


 


 


 


 


 


 










 











 
 
void FSMC_NORSRAMDeInit(u32 FSMC_Bank);
void FSMC_NANDDeInit(u32 FSMC_Bank);
void FSMC_PCCARDDeInit(void);
void FSMC_NORSRAMInit(FSMC_NORSRAMInitTypeDef* FSMC_NORSRAMInitStruct);
void FSMC_NANDInit(FSMC_NANDInitTypeDef* FSMC_NANDInitStruct);
void FSMC_PCCARDInit(FSMC_PCCARDInitTypeDef* FSMC_PCCARDInitStruct);
void FSMC_NORSRAMStructInit(FSMC_NORSRAMInitTypeDef* FSMC_NORSRAMInitStruct);
void FSMC_NANDStructInit(FSMC_NANDInitTypeDef* FSMC_NANDInitStruct);
void FSMC_PCCARDStructInit(FSMC_PCCARDInitTypeDef* FSMC_PCCARDInitStruct);
void FSMC_NORSRAMCmd(u32 FSMC_Bank, FunctionalState NewState);
void FSMC_NANDCmd(u32 FSMC_Bank, FunctionalState NewState);
void FSMC_PCCARDCmd(FunctionalState NewState);
void FSMC_NANDECCCmd(u32 FSMC_Bank, FunctionalState NewState);
u32 FSMC_GetECC(u32 FSMC_Bank);
void FSMC_ITConfig(u32 FSMC_Bank, u32 FSMC_IT, FunctionalState NewState);
FlagStatus FSMC_GetFlagStatus(u32 FSMC_Bank, u32 FSMC_FLAG);
void FSMC_ClearFlag(u32 FSMC_Bank, u32 FSMC_FLAG);
ITStatus FSMC_GetITStatus(u32 FSMC_Bank, u32 FSMC_IT);
void FSMC_ClearITPendingBit(u32 FSMC_Bank, u32 FSMC_IT);



 
#line 62 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_gpio.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_gpio.h"

 
#line 32 ".\\library\\inc\\stm32f10x_gpio.h"
                                     
 
typedef enum
{ 
  GPIO_Speed_10MHz = 1,
  GPIO_Speed_2MHz, 
  GPIO_Speed_50MHz
}GPIOSpeed_TypeDef;



                                         
 
typedef enum
{ GPIO_Mode_AIN = 0x0,
  GPIO_Mode_IN_FLOATING = 0x04,
  GPIO_Mode_IPD = 0x28,
  GPIO_Mode_IPU = 0x48,
  GPIO_Mode_Out_OD = 0x14,
  GPIO_Mode_Out_PP = 0x10,
  GPIO_Mode_AF_OD = 0x1C,
  GPIO_Mode_AF_PP = 0x18
}GPIOMode_TypeDef;





                              
 
typedef struct
{
  u16 GPIO_Pin;
  GPIOSpeed_TypeDef GPIO_Speed;
  GPIOMode_TypeDef GPIO_Mode;
}GPIO_InitTypeDef;

 
typedef enum
{ Bit_RESET = 0,
  Bit_SET
}BitAction;


 
 
#line 95 ".\\library\\inc\\stm32f10x_gpio.h"



#line 114 ".\\library\\inc\\stm32f10x_gpio.h"
                            
 
#line 141 ".\\library\\inc\\stm32f10x_gpio.h"


#line 156 ".\\library\\inc\\stm32f10x_gpio.h"
                              
 
#line 165 ".\\library\\inc\\stm32f10x_gpio.h"






                                         
#line 179 ".\\library\\inc\\stm32f10x_gpio.h"
                                       
 
#line 197 ".\\library\\inc\\stm32f10x_gpio.h"

#line 214 ".\\library\\inc\\stm32f10x_gpio.h"
                          
 
 
void GPIO_DeInit(GPIO_TypeDef* GPIOx);
void GPIO_AFIODeInit(void);
void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_InitTypeDef* GPIO_InitStruct);
void GPIO_StructInit(GPIO_InitTypeDef* GPIO_InitStruct);
u8 GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, u16 GPIO_Pin);
u16 GPIO_ReadInputData(GPIO_TypeDef* GPIOx);
u8 GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, u16 GPIO_Pin);
u16 GPIO_ReadOutputData(GPIO_TypeDef* GPIOx);
void GPIO_SetBits(GPIO_TypeDef* GPIOx, u16 GPIO_Pin);
void GPIO_ResetBits(GPIO_TypeDef* GPIOx, u16 GPIO_Pin);
void GPIO_WriteBit(GPIO_TypeDef* GPIOx, u16 GPIO_Pin, BitAction BitVal);
void GPIO_Write(GPIO_TypeDef* GPIOx, u16 PortVal);
void GPIO_PinLockConfig(GPIO_TypeDef* GPIOx, u16 GPIO_Pin);
void GPIO_EventOutputConfig(u8 GPIO_PortSource, u8 GPIO_PinSource);
void GPIO_EventOutputCmd(FunctionalState NewState);
void GPIO_PinRemapConfig(u32 GPIO_Remap, FunctionalState NewState);
void GPIO_EXTILineConfig(u8 GPIO_PortSource, u8 GPIO_PinSource);



 
#line 66 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_i2c.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_i2c.h"

 
 
typedef struct
{
  u16 I2C_Mode;
  u16 I2C_DutyCycle;
  u16 I2C_OwnAddress1;
  u16 I2C_Ack;
  u16 I2C_AcknowledgedAddress;
  u32 I2C_ClockSpeed;
}I2C_InitTypeDef;

 



 







 






 






 






 






 
#line 86 ".\\library\\inc\\stm32f10x_i2c.h"

#line 96 ".\\library\\inc\\stm32f10x_i2c.h"

 






 






 






 
#line 133 ".\\library\\inc\\stm32f10x_i2c.h"



#line 143 ".\\library\\inc\\stm32f10x_i2c.h"

 
 
#line 153 ".\\library\\inc\\stm32f10x_i2c.h"
 
#line 168 ".\\library\\inc\\stm32f10x_i2c.h"
                               


#line 182 ".\\library\\inc\\stm32f10x_i2c.h"

 
 






 

     
 


 


 


 



 


 


 

      
 

                                          
 


#line 241 ".\\library\\inc\\stm32f10x_i2c.h"

 

 


 
 
void I2C_DeInit(I2C_TypeDef* I2Cx);
void I2C_Init(I2C_TypeDef* I2Cx, I2C_InitTypeDef* I2C_InitStruct);
void I2C_StructInit(I2C_InitTypeDef* I2C_InitStruct);
void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, u8 Address);
void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_ITConfig(I2C_TypeDef* I2Cx, u16 I2C_IT, FunctionalState NewState);
void I2C_SendData(I2C_TypeDef* I2Cx, u8 Data);
u8 I2C_ReceiveData(I2C_TypeDef* I2Cx);
void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, u8 Address, u8 I2C_Direction);
u16 I2C_ReadRegister(I2C_TypeDef* I2Cx, u8 I2C_Register);
void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, u16 I2C_SMBusAlert);
void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, u16 I2C_PECPosition);
void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState);
u8 I2C_GetPEC(I2C_TypeDef* I2Cx);
void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, u16 I2C_DutyCycle);
u32 I2C_GetLastEvent(I2C_TypeDef* I2Cx);
ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, u32 I2C_EVENT);
FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, u32 I2C_FLAG);
void I2C_ClearFlag(I2C_TypeDef* I2Cx, u32 I2C_FLAG);
ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, u32 I2C_IT);
void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, u32 I2C_IT);



 
#line 70 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_iwdg.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_iwdg.h"

 
 
 






 
#line 41 ".\\library\\inc\\stm32f10x_iwdg.h"

#line 49 ".\\library\\inc\\stm32f10x_iwdg.h"

 







 
 
void IWDG_WriteAccessCmd(u16 IWDG_WriteAccess);
void IWDG_SetPrescaler(u8 IWDG_Prescaler);
void IWDG_SetReload(u16 Reload);
void IWDG_ReloadCounter(void);
void IWDG_Enable(void);
FlagStatus IWDG_GetFlagStatus(u16 IWDG_FLAG);



 
#line 74 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_nvic.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_nvic.h"

 
 
typedef struct
{
  u8 NVIC_IRQChannel;
  u8 NVIC_IRQChannelPreemptionPriority;
  u8 NVIC_IRQChannelSubPriority;
  FunctionalState NVIC_IRQChannelCmd;
} NVIC_InitTypeDef;

 
 
#line 96 ".\\library\\inc\\stm32f10x_nvic.h"


#line 158 ".\\library\\inc\\stm32f10x_nvic.h"


 
#line 170 ".\\library\\inc\\stm32f10x_nvic.h"





#line 182 ".\\library\\inc\\stm32f10x_nvic.h"












#line 201 ".\\library\\inc\\stm32f10x_nvic.h"











 






 








 
#line 239 ".\\library\\inc\\stm32f10x_nvic.h"












 
 
void NVIC_DeInit(void);
void NVIC_SCBDeInit(void);
void NVIC_PriorityGroupConfig(u32 NVIC_PriorityGroup);
void NVIC_Init(NVIC_InitTypeDef* NVIC_InitStruct);
void NVIC_StructInit(NVIC_InitTypeDef* NVIC_InitStruct);
void NVIC_SETPRIMASK(void);
void NVIC_RESETPRIMASK(void);
void NVIC_SETFAULTMASK(void);
void NVIC_RESETFAULTMASK(void);
void NVIC_BASEPRICONFIG(u32 NewPriority);
u32 NVIC_GetBASEPRI(void);
u16 NVIC_GetCurrentPendingIRQChannel(void);
ITStatus NVIC_GetIRQChannelPendingBitStatus(u8 NVIC_IRQChannel);
void NVIC_SetIRQChannelPendingBit(u8 NVIC_IRQChannel);
void NVIC_ClearIRQChannelPendingBit(u8 NVIC_IRQChannel);
u16 NVIC_GetCurrentActiveHandler(void);
ITStatus NVIC_GetIRQChannelActiveBitStatus(u8 NVIC_IRQChannel);
u32 NVIC_GetCPUID(void);
void NVIC_SetVectorTable(u32 NVIC_VectTab, u32 Offset);
void NVIC_GenerateSystemReset(void);
void NVIC_GenerateCoreReset(void);
void NVIC_SystemLPConfig(u8 LowPowerMode, FunctionalState NewState);
void NVIC_SystemHandlerConfig(u32 SystemHandler, FunctionalState NewState);
void NVIC_SystemHandlerPriorityConfig(u32 SystemHandler, u8 SystemHandlerPreemptionPriority,
                                      u8 SystemHandlerSubPriority);
ITStatus NVIC_GetSystemHandlerPendingBitStatus(u32 SystemHandler);
void NVIC_SetSystemHandlerPendingBit(u32 SystemHandler);
void NVIC_ClearSystemHandlerPendingBit(u32 SystemHandler);
ITStatus NVIC_GetSystemHandlerActiveBitStatus(u32 SystemHandler);
u32 NVIC_GetFaultHandlerSources(u32 SystemHandler);
u32 NVIC_GetFaultAddress(u32 SystemHandler);



 
#line 78 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_pwr.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_pwr.h"

 
 
 
#line 35 ".\\library\\inc\\stm32f10x_pwr.h"






 






 




 
 








 
 
void PWR_DeInit(void);
void PWR_BackupAccessCmd(FunctionalState NewState);
void PWR_PVDCmd(FunctionalState NewState);
void PWR_PVDLevelConfig(u32 PWR_PVDLevel);
void PWR_WakeUpPinCmd(FunctionalState NewState);
void PWR_EnterSTOPMode(u32 PWR_Regulator, u8 PWR_STOPEntry);
void PWR_EnterSTANDBYMode(void);
FlagStatus PWR_GetFlagStatus(u32 PWR_FLAG);
void PWR_ClearFlag(u32 PWR_FLAG);



 
#line 82 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_rcc.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_rcc.h"

 
typedef struct
{
  u32 SYSCLK_Frequency;
  u32 HCLK_Frequency;
  u32 PCLK1_Frequency;
  u32 PCLK2_Frequency;
  u32 ADCCLK_Frequency;
}RCC_ClocksTypeDef;

 
 







 








 
#line 68 ".\\library\\inc\\stm32f10x_rcc.h"

#line 77 ".\\library\\inc\\stm32f10x_rcc.h"

 








 
#line 97 ".\\library\\inc\\stm32f10x_rcc.h"







 










 
#line 122 ".\\library\\inc\\stm32f10x_rcc.h"







 






 








 







 








 
#line 170 ".\\library\\inc\\stm32f10x_rcc.h"



 
#line 190 ".\\library\\inc\\stm32f10x_rcc.h"



 
#line 215 ".\\library\\inc\\stm32f10x_rcc.h"



 










 
#line 241 ".\\library\\inc\\stm32f10x_rcc.h"

#line 248 ".\\library\\inc\\stm32f10x_rcc.h"



 
 
void RCC_DeInit(void);
void RCC_HSEConfig(u32 RCC_HSE);
ErrorStatus RCC_WaitForHSEStartUp(void);
void RCC_AdjustHSICalibrationValue(u8 HSICalibrationValue);
void RCC_HSICmd(FunctionalState NewState);
void RCC_PLLConfig(u32 RCC_PLLSource, u32 RCC_PLLMul);
void RCC_PLLCmd(FunctionalState NewState);
void RCC_SYSCLKConfig(u32 RCC_SYSCLKSource);
u8 RCC_GetSYSCLKSource(void);
void RCC_HCLKConfig(u32 RCC_SYSCLK);
void RCC_PCLK1Config(u32 RCC_HCLK);
void RCC_PCLK2Config(u32 RCC_HCLK);
void RCC_ITConfig(u8 RCC_IT, FunctionalState NewState);
void RCC_USBCLKConfig(u32 RCC_USBCLKSource);
void RCC_ADCCLKConfig(u32 RCC_PCLK2);
void RCC_LSEConfig(u8 RCC_LSE);
void RCC_LSICmd(FunctionalState NewState);
void RCC_RTCCLKConfig(u32 RCC_RTCCLKSource);
void RCC_RTCCLKCmd(FunctionalState NewState);
void RCC_GetClocksFreq(RCC_ClocksTypeDef* RCC_Clocks);
void RCC_AHBPeriphClockCmd(u32 RCC_AHBPeriph, FunctionalState NewState);
void RCC_APB2PeriphClockCmd(u32 RCC_APB2Periph, FunctionalState NewState);
void RCC_APB1PeriphClockCmd(u32 RCC_APB1Periph, FunctionalState NewState);
void RCC_APB2PeriphResetCmd(u32 RCC_APB2Periph, FunctionalState NewState);
void RCC_APB1PeriphResetCmd(u32 RCC_APB1Periph, FunctionalState NewState);
void RCC_BackupResetCmd(FunctionalState NewState);
void RCC_ClockSecuritySystemCmd(FunctionalState NewState);
void RCC_MCOConfig(u8 RCC_MCO);
FlagStatus RCC_GetFlagStatus(u8 RCC_FLAG);
void RCC_ClearFlag(void);
ITStatus RCC_GetITStatus(u8 RCC_IT);
void RCC_ClearITPendingBit(u8 RCC_IT);



 
#line 86 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_rtc.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_rtc.h"

 
 
 








                                                                     
 













                           
 
 
void RTC_ITConfig(u16 RTC_IT, FunctionalState NewState);
void RTC_EnterConfigMode(void);
void RTC_ExitConfigMode(void);
u32  RTC_GetCounter(void);
void RTC_SetCounter(u32 CounterValue);
void RTC_SetPrescaler(u32 PrescalerValue);
void RTC_SetAlarm(u32 AlarmValue);
u32  RTC_GetDivider(void);
void RTC_WaitForLastTask(void);
void RTC_WaitForSynchro(void);
FlagStatus RTC_GetFlagStatus(u16 RTC_FLAG);
void RTC_ClearFlag(u16 RTC_FLAG);
ITStatus RTC_GetITStatus(u16 RTC_IT);
void RTC_ClearITPendingBit(u16 RTC_IT);



 
#line 90 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_sdio.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_sdio.h"

 
typedef struct
{
  u8 SDIO_ClockDiv;
  u32 SDIO_ClockEdge;
  u32 SDIO_ClockBypass;
  u32 SDIO_ClockPowerSave;
  u32 SDIO_BusWide;
  u32 SDIO_HardwareFlowControl;
} SDIO_InitTypeDef;

typedef struct
{
  u32 SDIO_Argument;
  u32 SDIO_CmdIndex;
  u32 SDIO_Response;
  u32 SDIO_Wait;
  u32 SDIO_CPSM;
} SDIO_CmdInitTypeDef;

typedef struct
{
  u32 SDIO_DataTimeOut;
  u32 SDIO_DataLength;
  u32 SDIO_DataBlockSize;
  u32 SDIO_TransferDir;
  u32 SDIO_TransferMode;
  u32 SDIO_DPSM;
} SDIO_DataInitTypeDef;

 
 





                                   






  






 






                                
  





                                  
 





 
#line 121 ".\\library\\inc\\stm32f10x_sdio.h"



 


 








 







 





 








 


 
#line 178 ".\\library\\inc\\stm32f10x_sdio.h"

#line 194 ".\\library\\inc\\stm32f10x_sdio.h"

 






 






 





 
#line 240 ".\\library\\inc\\stm32f10x_sdio.h"

#line 265 ".\\library\\inc\\stm32f10x_sdio.h"



#line 292 ".\\library\\inc\\stm32f10x_sdio.h"


                                                        
 






 
 
void SDIO_DeInit(void);
void SDIO_Init(SDIO_InitTypeDef* SDIO_InitStruct);
void SDIO_StructInit(SDIO_InitTypeDef* SDIO_InitStruct);
void SDIO_ClockCmd(FunctionalState NewState);
void SDIO_SetPowerState(u32 SDIO_PowerState);
u32 SDIO_GetPowerState(void);
void SDIO_ITConfig(u32 SDIO_IT, FunctionalState NewState);
void SDIO_DMACmd(FunctionalState NewState);
void SDIO_SendCommand(SDIO_CmdInitTypeDef *SDIO_CmdInitStruct);
void SDIO_CmdStructInit(SDIO_CmdInitTypeDef* SDIO_CmdInitStruct);
u8 SDIO_GetCommandResponse(void);
u32 SDIO_GetResponse(u32 SDIO_RESP);
void SDIO_DataConfig(SDIO_DataInitTypeDef* SDIO_DataInitStruct);
void SDIO_DataStructInit(SDIO_DataInitTypeDef* SDIO_DataInitStruct);
u32 SDIO_GetDataCounter(void);
u32 SDIO_ReadData(void);
void SDIO_WriteData(u32 Data);
u32 SDIO_GetFIFOCount(void);
void SDIO_StartSDIOReadWait(FunctionalState NewState);
void SDIO_StopSDIOReadWait(FunctionalState NewState);
void SDIO_SetSDIOReadWaitMode(u32 SDIO_ReadWaitMode);
void SDIO_SetSDIOOperation(FunctionalState NewState);
void SDIO_SendSDIOSuspendCmd(FunctionalState NewState);
void SDIO_CommandCompletionCmd(FunctionalState NewState);
void SDIO_CEATAITCmd(FunctionalState NewState);
void SDIO_SendCEATACmd(FunctionalState NewState);
FlagStatus SDIO_GetFlagStatus(u32 SDIO_FLAG);
void SDIO_ClearFlag(u32 SDIO_FLAG);
ITStatus SDIO_GetITStatus(u32 SDIO_IT);
void SDIO_ClearITPendingBit(u32 SDIO_IT);



 
#line 94 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_spi.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_spi.h"

 
 
typedef struct
{
  u16 SPI_Direction;
  u16 SPI_Mode;
  u16 SPI_DataSize;
  u16 SPI_CPOL;
  u16 SPI_CPHA;
  u16 SPI_NSS;
  u16 SPI_BaudRatePrescaler;
  u16 SPI_FirstBit;
  u16 SPI_CRCPolynomial;
}SPI_InitTypeDef;

 
typedef struct
{
  u16 I2S_Mode;
  u16 I2S_Standard;
  u16 I2S_DataFormat;
  u16 I2S_MCLKOutput;
  u16 I2S_AudioFreq;
  u16 I2S_CPOL;
}I2S_InitTypeDef;

 








 










 






 






 






 






 






 
#line 114 ".\\library\\inc\\stm32f10x_spi.h"

#line 123 ".\\library\\inc\\stm32f10x_spi.h"

 






 










 












 










  






 
#line 180 ".\\library\\inc\\stm32f10x_spi.h"

#line 187 ".\\library\\inc\\stm32f10x_spi.h"

 






 





 






 





 






 



















 
#line 250 ".\\library\\inc\\stm32f10x_spi.h"








 


 
 
void SPI_I2S_DeInit(SPI_TypeDef* SPIx);
void SPI_Init(SPI_TypeDef* SPIx, SPI_InitTypeDef* SPI_InitStruct);
void I2S_Init(SPI_TypeDef* SPIx, I2S_InitTypeDef* I2S_InitStruct);
void SPI_StructInit(SPI_InitTypeDef* SPI_InitStruct);
void I2S_StructInit(I2S_InitTypeDef* I2S_InitStruct);
void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState);
void I2S_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState);
void SPI_I2S_ITConfig(SPI_TypeDef* SPIx, u8 SPI_I2S_IT, FunctionalState NewState);
void SPI_I2S_DMACmd(SPI_TypeDef* SPIx, u16 SPI_I2S_DMAReq, FunctionalState NewState);
void SPI_I2S_SendData(SPI_TypeDef* SPIx, u16 Data);
u16 SPI_I2S_ReceiveData(SPI_TypeDef* SPIx);
void SPI_NSSInternalSoftwareConfig(SPI_TypeDef* SPIx, u16 SPI_NSSInternalSoft);
void SPI_SSOutputCmd(SPI_TypeDef* SPIx, FunctionalState NewState);
void SPI_DataSizeConfig(SPI_TypeDef* SPIx, u16 SPI_DataSize);
void SPI_TransmitCRC(SPI_TypeDef* SPIx);
void SPI_CalculateCRC(SPI_TypeDef* SPIx, FunctionalState NewState);
u16 SPI_GetCRC(SPI_TypeDef* SPIx, u8 SPI_CRC);
u16 SPI_GetCRCPolynomial(SPI_TypeDef* SPIx);
void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, u16 SPI_Direction);
FlagStatus SPI_I2S_GetFlagStatus(SPI_TypeDef* SPIx, u16 SPI_I2S_FLAG);
void SPI_I2S_ClearFlag(SPI_TypeDef* SPIx, u16 SPI_I2S_FLAG);
ITStatus SPI_I2S_GetITStatus(SPI_TypeDef* SPIx, u8 SPI_I2S_IT);
void SPI_I2S_ClearITPendingBit(SPI_TypeDef* SPIx, u8 SPI_I2S_IT);



 
#line 98 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_systick.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_systick.h"

 
 
 






 








 










 
 
void SysTick_CLKSourceConfig(u32 SysTick_CLKSource);
void SysTick_SetReload(u32 Reload);
void SysTick_CounterCmd(u32 SysTick_Counter);
void SysTick_ITConfig(FunctionalState NewState);
u32 SysTick_GetCounter(void);
FlagStatus SysTick_GetFlagStatus(u8 SysTick_FLAG);



 
#line 102 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_tim.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_tim.h"

 

 
typedef struct
{
  u16 TIM_Prescaler;
  u16 TIM_CounterMode;
  u16 TIM_Period;
  u16 TIM_ClockDivision;
  u8 TIM_RepetitionCounter;
} TIM_TimeBaseInitTypeDef;

 
typedef struct
{
  u16 TIM_OCMode;
  u16 TIM_OutputState;
  u16 TIM_OutputNState;
  u16 TIM_Pulse;
  u16 TIM_OCPolarity;
  u16 TIM_OCNPolarity;
  u16 TIM_OCIdleState;
  u16 TIM_OCNIdleState;
} TIM_OCInitTypeDef;

 
typedef struct
{
  u16 TIM_Channel;
  u16 TIM_ICPolarity;
  u16 TIM_ICSelection;
  u16 TIM_ICPrescaler;
  u16 TIM_ICFilter;
} TIM_ICInitTypeDef;

 
typedef struct
{
  u16 TIM_OSSRState;
  u16 TIM_OSSIState;
  u16 TIM_LOCKLevel; 
  u16 TIM_DeadTime;
  u16 TIM_Break;
  u16 TIM_BreakPolarity;
  u16 TIM_AutomaticOutput;
} TIM_BDTRInitTypeDef;

                              

#line 81 ".\\library\\inc\\stm32f10x_tim.h"




#line 91 ".\\library\\inc\\stm32f10x_tim.h"

 
#line 99 ".\\library\\inc\\stm32f10x_tim.h"

#line 106 ".\\library\\inc\\stm32f10x_tim.h"

#line 115 ".\\library\\inc\\stm32f10x_tim.h"
 






 
















 








 












 






 






 






 






 






 






 






 






 





 










 






 






 






 






 






 








 










 
#line 298 ".\\library\\inc\\stm32f10x_tim.h"



#line 308 ".\\library\\inc\\stm32f10x_tim.h"

#line 317 ".\\library\\inc\\stm32f10x_tim.h"

 
#line 338 ".\\library\\inc\\stm32f10x_tim.h"

#line 358 ".\\library\\inc\\stm32f10x_tim.h"

 
#line 378 ".\\library\\inc\\stm32f10x_tim.h"

#line 397 ".\\library\\inc\\stm32f10x_tim.h"

 
#line 406 ".\\library\\inc\\stm32f10x_tim.h"



#line 416 ".\\library\\inc\\stm32f10x_tim.h"

 










 
#line 437 ".\\library\\inc\\stm32f10x_tim.h"

#line 446 ".\\library\\inc\\stm32f10x_tim.h"






 








 






 






 






  








 
#line 500 ".\\library\\inc\\stm32f10x_tim.h"



#line 510 ".\\library\\inc\\stm32f10x_tim.h"

 






 






 





                                     
 






  
#line 548 ".\\library\\inc\\stm32f10x_tim.h"

#line 557 ".\\library\\inc\\stm32f10x_tim.h"

#line 593 ".\\library\\inc\\stm32f10x_tim.h"

 










 






 
#line 625 ".\\library\\inc\\stm32f10x_tim.h"

#line 638 ".\\library\\inc\\stm32f10x_tim.h"

#line 646 ".\\library\\inc\\stm32f10x_tim.h"

#line 665 ".\\library\\inc\\stm32f10x_tim.h"
                                                                                            
 


 


 
 

void TIM_DeInit(TIM_TypeDef* TIMx);
void TIM_TimeBaseInit(TIM_TypeDef* TIMx, TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct);
void TIM_OC1Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OC2Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OC3Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OC4Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_ICInit(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct);
void TIM_PWMIConfig(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct);
void TIM_BDTRConfig(TIM_TypeDef* TIMx, TIM_BDTRInitTypeDef *TIM_BDTRInitStruct);
void TIM_TimeBaseStructInit(TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct);
void TIM_OCStructInit(TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_ICStructInit(TIM_ICInitTypeDef* TIM_ICInitStruct);
void TIM_BDTRStructInit(TIM_BDTRInitTypeDef* TIM_BDTRInitStruct);
void TIM_Cmd(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_CtrlPWMOutputs(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_ITConfig(TIM_TypeDef* TIMx, u16 TIM_IT, FunctionalState NewState);
void TIM_GenerateEvent(TIM_TypeDef* TIMx, u16 TIM_EventSource);
void TIM_DMAConfig(TIM_TypeDef* TIMx, u16 TIM_DMABase, u16 TIM_DMABurstLength);
void TIM_DMACmd(TIM_TypeDef* TIMx, u16 TIM_DMASource, FunctionalState NewState);
void TIM_InternalClockConfig(TIM_TypeDef* TIMx);
void TIM_ITRxExternalClockConfig(TIM_TypeDef* TIMx, u16 TIM_InputTriggerSource);
void TIM_TIxExternalClockConfig(TIM_TypeDef* TIMx, u16 TIM_TIxExternalCLKSource,
                                u16 TIM_ICPolarity, u16 ICFilter);                                
void TIM_ETRClockMode1Config(TIM_TypeDef* TIMx, u16 TIM_ExtTRGPrescaler, u16 TIM_ExtTRGPolarity,
                             u16 ExtTRGFilter);
void TIM_ETRClockMode2Config(TIM_TypeDef* TIMx, u16 TIM_ExtTRGPrescaler, 
                             u16 TIM_ExtTRGPolarity, u16 ExtTRGFilter);
void TIM_ETRConfig(TIM_TypeDef* TIMx, u16 TIM_ExtTRGPrescaler, u16 TIM_ExtTRGPolarity,
                   u16 ExtTRGFilter);
void TIM_PrescalerConfig(TIM_TypeDef* TIMx, u16 Prescaler, u16 TIM_PSCReloadMode);
void TIM_CounterModeConfig(TIM_TypeDef* TIMx, u16 TIM_CounterMode);
void TIM_SelectInputTrigger(TIM_TypeDef* TIMx, u16 TIM_InputTriggerSource);
void TIM_EncoderInterfaceConfig(TIM_TypeDef* TIMx, u16 TIM_EncoderMode,
                                u16 TIM_IC1Polarity, u16 TIM_IC2Polarity);
void TIM_ForcedOC1Config(TIM_TypeDef* TIMx, u16 TIM_ForcedAction);
void TIM_ForcedOC2Config(TIM_TypeDef* TIMx, u16 TIM_ForcedAction);
void TIM_ForcedOC3Config(TIM_TypeDef* TIMx, u16 TIM_ForcedAction);
void TIM_ForcedOC4Config(TIM_TypeDef* TIMx, u16 TIM_ForcedAction);
void TIM_ARRPreloadConfig(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_SelectCOM(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_SelectCCDMA(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_CCPreloadControl(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_OC1PreloadConfig(TIM_TypeDef* TIMx, u16 TIM_OCPreload);
void TIM_OC2PreloadConfig(TIM_TypeDef* TIMx, u16 TIM_OCPreload);
void TIM_OC3PreloadConfig(TIM_TypeDef* TIMx, u16 TIM_OCPreload);
void TIM_OC4PreloadConfig(TIM_TypeDef* TIMx, u16 TIM_OCPreload);
void TIM_OC1FastConfig(TIM_TypeDef* TIMx, u16 TIM_OCFast);
void TIM_OC2FastConfig(TIM_TypeDef* TIMx, u16 TIM_OCFast);
void TIM_OC3FastConfig(TIM_TypeDef* TIMx, u16 TIM_OCFast);
void TIM_OC4FastConfig(TIM_TypeDef* TIMx, u16 TIM_OCFast);
void TIM_ClearOC1Ref(TIM_TypeDef* TIMx, u16 TIM_OCClear);
void TIM_ClearOC2Ref(TIM_TypeDef* TIMx, u16 TIM_OCClear);
void TIM_ClearOC3Ref(TIM_TypeDef* TIMx, u16 TIM_OCClear);
void TIM_ClearOC4Ref(TIM_TypeDef* TIMx, u16 TIM_OCClear);
void TIM_OC1PolarityConfig(TIM_TypeDef* TIMx, u16 TIM_OCPolarity);
void TIM_OC1NPolarityConfig(TIM_TypeDef* TIMx, u16 TIM_OCNPolarity);
void TIM_OC2PolarityConfig(TIM_TypeDef* TIMx, u16 TIM_OCPolarity);
void TIM_OC2NPolarityConfig(TIM_TypeDef* TIMx, u16 TIM_OCNPolarity);
void TIM_OC3PolarityConfig(TIM_TypeDef* TIMx, u16 TIM_OCPolarity);
void TIM_OC3NPolarityConfig(TIM_TypeDef* TIMx, u16 TIM_OCNPolarity);
void TIM_OC4PolarityConfig(TIM_TypeDef* TIMx, u16 TIM_OCPolarity);
void TIM_CCxCmd(TIM_TypeDef* TIMx, u16 TIM_Channel, u16 TIM_CCx);
void TIM_CCxNCmd(TIM_TypeDef* TIMx, u16 TIM_Channel, u16 TIM_CCxN);
void TIM_SelectOCxM(TIM_TypeDef* TIMx, u16 TIM_Channel, u16 TIM_OCMode);
void TIM_UpdateDisableConfig(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_UpdateRequestConfig(TIM_TypeDef* TIMx, u16 TIM_UpdateSource);
void TIM_SelectHallSensor(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_SelectOnePulseMode(TIM_TypeDef* TIMx, u16 TIM_OPMode);
void TIM_SelectOutputTrigger(TIM_TypeDef* TIMx, u16 TIM_TRGOSource);
void TIM_SelectSlaveMode(TIM_TypeDef* TIMx, u16 TIM_SlaveMode);
void TIM_SelectMasterSlaveMode(TIM_TypeDef* TIMx, u16 TIM_MasterSlaveMode);
void TIM_SetCounter(TIM_TypeDef* TIMx, u16 Counter);
void TIM_SetAutoreload(TIM_TypeDef* TIMx, u16 Autoreload);
void TIM_SetCompare1(TIM_TypeDef* TIMx, u16 Compare1);
void TIM_SetCompare2(TIM_TypeDef* TIMx, u16 Compare2);
void TIM_SetCompare3(TIM_TypeDef* TIMx, u16 Compare3);
void TIM_SetCompare4(TIM_TypeDef* TIMx, u16 Compare4);
void TIM_SetIC1Prescaler(TIM_TypeDef* TIMx, u16 TIM_ICPSC);
void TIM_SetIC2Prescaler(TIM_TypeDef* TIMx, u16 TIM_ICPSC);
void TIM_SetIC3Prescaler(TIM_TypeDef* TIMx, u16 TIM_ICPSC);
void TIM_SetIC4Prescaler(TIM_TypeDef* TIMx, u16 TIM_ICPSC);
void TIM_SetClockDivision(TIM_TypeDef* TIMx, u16 TIM_CKD);
u16 TIM_GetCapture1(TIM_TypeDef* TIMx);
u16 TIM_GetCapture2(TIM_TypeDef* TIMx);
u16 TIM_GetCapture3(TIM_TypeDef* TIMx);
u16 TIM_GetCapture4(TIM_TypeDef* TIMx);
u16 TIM_GetCounter(TIM_TypeDef* TIMx);
u16 TIM_GetPrescaler(TIM_TypeDef* TIMx);
FlagStatus TIM_GetFlagStatus(TIM_TypeDef* TIMx, u16 TIM_FLAG);
void TIM_ClearFlag(TIM_TypeDef* TIMx, u16 TIM_FLAG);
ITStatus TIM_GetITStatus(TIM_TypeDef* TIMx, u16 TIM_IT);
void TIM_ClearITPendingBit(TIM_TypeDef* TIMx, u16 TIM_IT);
                                                                                                             


 








#line 106 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_usart.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_usart.h"

 
 
typedef struct
{
  u32 USART_BaudRate;
  u16 USART_WordLength;
  u16 USART_StopBits;
  u16 USART_Parity;
  u16 USART_Mode;
  u16 USART_HardwareFlowControl;  
} USART_InitTypeDef;

 
typedef struct
{
  u16 USART_Clock;
  u16 USART_CPOL;
  u16 USART_CPHA;
  u16 USART_LastBit;
} USART_ClockInitTypeDef;

 















 


                                    



 









 








 





 















 






 




                               
 




 






 
#line 146 ".\\library\\inc\\stm32f10x_usart.h"



















 





 






 







 






 
#line 204 ".\\library\\inc\\stm32f10x_usart.h"






                              










 
 
void USART_DeInit(USART_TypeDef* USARTx);
void USART_Init(USART_TypeDef* USARTx, USART_InitTypeDef* USART_InitStruct);
void USART_StructInit(USART_InitTypeDef* USART_InitStruct);
void USART_ClockInit(USART_TypeDef* USARTx, USART_ClockInitTypeDef* USART_ClockInitStruct);
void USART_ClockStructInit(USART_ClockInitTypeDef* USART_ClockInitStruct);
void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_ITConfig(USART_TypeDef* USARTx, u16 USART_IT, FunctionalState NewState);
void USART_DMACmd(USART_TypeDef* USARTx, u16 USART_DMAReq, FunctionalState NewState);
void USART_SetAddress(USART_TypeDef* USARTx, u8 USART_Address);
void USART_WakeUpConfig(USART_TypeDef* USARTx, u16 USART_WakeUp);
void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_LINBreakDetectLengthConfig(USART_TypeDef* USARTx, u16 USART_LINBreakDetectLength);
void USART_LINCmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_SendData(USART_TypeDef* USARTx, u16 Data);
u16 USART_ReceiveData(USART_TypeDef* USARTx);
void USART_SendBreak(USART_TypeDef* USARTx);
void USART_SetGuardTime(USART_TypeDef* USARTx, u8 USART_GuardTime);
void USART_SetPrescaler(USART_TypeDef* USARTx, u8 USART_Prescaler);
void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_IrDAConfig(USART_TypeDef* USARTx, u16 USART_IrDAMode);
void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState);
FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, u16 USART_FLAG);
void USART_ClearFlag(USART_TypeDef* USARTx, u16 USART_FLAG);
ITStatus USART_GetITStatus(USART_TypeDef* USARTx, u16 USART_IT);
void USART_ClearITPendingBit(USART_TypeDef* USARTx, u16 USART_IT);



 
#line 110 ".\\library\\inc\\stm32f10x_lib.h"


#line 1 ".\\library\\inc\\stm32f10x_wwdg.h"














 

 



 
#line 23 ".\\library\\inc\\stm32f10x_wwdg.h"

 
 
 














 
 
void WWDG_DeInit(void);
void WWDG_SetPrescaler(u32 WWDG_Prescaler);
void WWDG_SetWindowValue(u8 WindowValue);
void WWDG_EnableIT(void);
void WWDG_SetCounter(u8 Counter);
void WWDG_Enable(u8 Counter);
FlagStatus WWDG_GetFlagStatus(void);
void WWDG_ClearFlag(void);



 
#line 114 ".\\library\\inc\\stm32f10x_lib.h"


 
 
 
 
void debug(void);



 
#line 21 "src\\main.c"



#line 1 ".\\library\\inc\\config.h"









 








#line 20 ".\\library\\inc\\config.h"
#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\ctype.h"
 
 
 
 





 






 








#line 33 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\ctype.h"






#line 47 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\ctype.h"

 
#line 57 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\ctype.h"

 
 









 
#line 79 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\ctype.h"





#line 131 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\ctype.h"

extern __declspec(__nothrow) __pure unsigned char **__rt_ctype_table(void);







    extern int (isalnum)(int  );

     





    extern int (isalpha)(int  );

     





    extern int (iscntrl)(int  );

     
     

 




    extern int (isdigit)(int  );

     

    extern int (isblank)(int  );
     
     
     





    extern int (isgraph)(int  );

     





    extern int (islower)(int  );

     





    extern int (isprint)(int  );

     
     





    extern int (ispunct)(int  );

     





    extern int (isspace)(int  );

     





    extern int (isupper)(int  );

     

 
 

__inline int __isxdigit_helper(int __t) { return (__t ^ (__t << 2)); }




    extern int (isxdigit)(int  );

     



extern int tolower(int  );
     
     

extern int toupper(int  );
     
     







#line 270 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\ctype.h"



 

#line 21 ".\\library\\inc\\config.h"
#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"
 
 
 




 
 



 













  


 








#line 46 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"


  
  typedef unsigned int size_t;










    



    typedef unsigned short wchar_t;  
#line 75 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"

typedef struct div_t { int quot, rem; } div_t;
    
typedef struct ldiv_t { long int quot, rem; } ldiv_t;
    

typedef struct lldiv_t { __int64 quot, rem; } lldiv_t;
    


#line 96 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"
   



 

   




 
#line 115 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"
   


 
extern __declspec(__nothrow) int __aeabi_MB_CUR_MAX(void);

   




 

   




 




extern __declspec(__nothrow) double atof(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int atoi(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) long int atol(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) __int64 atoll(const char *  ) __attribute__((__nonnull__(1)));
   



 


extern __declspec(__nothrow) double strtod(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

















 

extern __declspec(__nothrow) float strtof(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) long double strtold(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

 

extern __declspec(__nothrow) long int strtol(const char * __restrict  ,
                        char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   



























 
extern __declspec(__nothrow) unsigned long int strtoul(const char * __restrict  ,
                                       char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   


























 

 
extern __declspec(__nothrow) __int64 strtoll(const char * __restrict  ,
                               char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) unsigned __int64 strtoull(const char * __restrict  ,
                                         char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) int rand(void);
   







 
extern __declspec(__nothrow) void srand(unsigned int  );
   






 

struct _rand_state { int __x[57]; };
extern __declspec(__nothrow) int _rand_r(struct _rand_state *);
extern __declspec(__nothrow) void _srand_r(struct _rand_state *, unsigned int);
struct _ANSI_rand_state { int __x[1]; };
extern __declspec(__nothrow) int _ANSI_rand_r(struct _ANSI_rand_state *);
extern __declspec(__nothrow) void _ANSI_srand_r(struct _ANSI_rand_state *, unsigned int);
   


 

extern __declspec(__nothrow) void *calloc(size_t  , size_t  );
   



 
extern __declspec(__nothrow) void free(void *  );
   





 
extern __declspec(__nothrow) void *malloc(size_t  );
   



 
extern __declspec(__nothrow) void *realloc(void *  , size_t  );
   













 

extern __declspec(__nothrow) int posix_memalign(void **  , size_t  , size_t  );
   









 

typedef int (*__heapprt)(void *, char const *, ...);
extern __declspec(__nothrow) void __heapstats(int (*  )(void *  ,
                                           char const *  , ...),
                        void *  ) __attribute__((__nonnull__(1)));
   










 
extern __declspec(__nothrow) int __heapvalid(int (*  )(void *  ,
                                           char const *  , ...),
                       void *  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) __declspec(__noreturn) void abort(void);
   







 

extern __declspec(__nothrow) int atexit(void (*  )(void)) __attribute__((__nonnull__(1)));
   




 
#line 415 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"


extern __declspec(__nothrow) __declspec(__noreturn) void exit(int  );
   












 

extern __declspec(__nothrow) __declspec(__noreturn) void _Exit(int  );
   







      

extern __declspec(__nothrow) char *getenv(const char *  ) __attribute__((__nonnull__(1)));
   









 

extern __declspec(__nothrow) int  system(const char *  );
   









 

extern  void *bsearch(const void *  , const void *  ,
              size_t  , size_t  ,
              int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,2,5)));
   












 
#line 503 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"


extern  void qsort(void *  , size_t  , size_t  ,
           int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,4)));
   









 

#line 532 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"

extern __declspec(__nothrow) __pure int abs(int  );
   



 

extern __declspec(__nothrow) __pure div_t div(int  , int  );
   









 
extern __declspec(__nothrow) __pure long int labs(long int  );
   



 




extern __declspec(__nothrow) __pure ldiv_t ldiv(long int  , long int  );
   











 







extern __declspec(__nothrow) __pure __int64 llabs(__int64  );
   



 




extern __declspec(__nothrow) __pure lldiv_t lldiv(__int64  , __int64  );
   











 
#line 613 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"



 
typedef struct __sdiv32by16 { int quot, rem; } __sdiv32by16;
typedef struct __udiv32by16 { unsigned int quot, rem; } __udiv32by16;
    
typedef struct __sdiv64by32 { int rem, quot; } __sdiv64by32;

__value_in_regs extern __declspec(__nothrow) __pure __sdiv32by16 __rt_sdiv32by16(
     int  ,
     short int  );
   

 
__value_in_regs extern __declspec(__nothrow) __pure __udiv32by16 __rt_udiv32by16(
     unsigned int  ,
     unsigned short  );
   

 
__value_in_regs extern __declspec(__nothrow) __pure __sdiv64by32 __rt_sdiv64by32(
     int  , unsigned int  ,
     int  );
   

 



 
extern __declspec(__nothrow) unsigned int __fp_status(unsigned int  , unsigned int  );
   







 























 
extern __declspec(__nothrow) int mblen(const char *  , size_t  );
   












 
extern __declspec(__nothrow) int mbtowc(wchar_t * __restrict  ,
                   const char * __restrict  , size_t  );
   















 
extern __declspec(__nothrow) int wctomb(char *  , wchar_t  );
   













 





 
extern __declspec(__nothrow) size_t mbstowcs(wchar_t * __restrict  ,
                      const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 
extern __declspec(__nothrow) size_t wcstombs(char * __restrict  ,
                      const wchar_t * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 

extern __declspec(__nothrow) void __use_realtime_heap(void);
extern __declspec(__nothrow) void __use_realtime_division(void);
extern __declspec(__nothrow) void __use_two_region_memory(void);
extern __declspec(__nothrow) void __use_no_heap(void);
extern __declspec(__nothrow) void __use_no_heap_region(void);

extern __declspec(__nothrow) char const *__C_library_version_string(void);
extern __declspec(__nothrow) int __C_library_version_number(void);











#line 867 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"


 

#line 22 ".\\library\\inc\\config.h"
#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\setjmp.h"
 






 

 
 






 













#line 39 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\setjmp.h"




typedef __int64 jmp_buf[48];     
                             
                             

extern const int __aeabi_JMP_BUF_SIZE;
              
 
 
 
 

extern __declspec(__nothrow) int setjmp(jmp_buf  ) __attribute__((__nonnull__(1)));
   




 


extern __declspec(__nothrow) __declspec(__noreturn) void longjmp(jmp_buf  , int  ) __attribute__((__nonnull__(1)));
   


















 











#line 103 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\setjmp.h"



 

#line 23 ".\\library\\inc\\config.h"
#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\rt_misc.h"







 











 
extern void _getenv_init(void);




 
extern void _clock_init(void);





 

extern void *__user_libspace(void);









 
struct __argc_argv {
    int argc;
    char **argv;
    int r2, r3;
};
extern __value_in_regs struct __argc_argv
__rt_lib_init(unsigned  , unsigned  );









 
__value_in_regs struct __argc_argv __ARM_get_argv(void * );




 
extern void __rt_lib_shutdown(void);






 
extern void __rt_exit(int  );    













 
struct __initial_stackheap {
    unsigned heap_base;                 
    unsigned stack_base;                
    unsigned heap_limit;                
    unsigned stack_limit;               
};
extern __value_in_regs struct __initial_stackheap
__user_initial_stackheap(unsigned  , unsigned  ,
                         unsigned  , unsigned  );




 
struct __heap_extent {
    unsigned base, range;
};
extern __value_in_regs struct __heap_extent
__user_heap_extent(unsigned  , unsigned  );










 
struct __stack_slop {
    unsigned always, cleanup;
};
extern __value_in_regs struct __stack_slop
__user_stack_slop(unsigned  , unsigned  );








 
extern unsigned __user_heap_extend(int  ,
                                   void **  ,
                                   unsigned  );






 
int __raise(int  , int  );






 
int __default_signal_handler(int  , int  );





 
void __rt_raise(int  , int  );







#line 24 ".\\library\\inc\\config.h"
#line 25 ".\\library\\inc\\config.h"

#line 27 ".\\library\\inc\\config.h"

#line 1 ".\\library\\inc\\msd.h"









 

 



 
#line 18 ".\\library\\inc\\msd.h"

 
 


 




extern u32 Mass_Memory_Size;
extern u32 Mass_Block_Size;
extern u32 Mass_Block_Count;
 
 
 

 
u8 MSD_Init(void);
u8 MSD_EarseBlock(u32 startaddr, u32 blocknum);
u8 MSD_WriteBlock(u8* pBuffer, u32 WriteAddr, u16 NumByteToWrite);
u8 MSD_ReadBlock(u8* pBuffer, u32 ReadAddr, u16 NumByteToRead);
u8 MSD_WriteBuffer(u8* pBuffer, u32 WriteAddr, u32 NumByteToWrite);
u8 MSD_ReadBuffer(u8* pBuffer, u32 ReadAddr, u32 NumByteToRead);

u32 MSD_GetMediumCharacteristics(void);





 


#line 29 ".\\library\\inc\\config.h"





 

#line 25 "src\\main.c"

 
 





SPI_InitTypeDef SPI_InitStructure;
int flag;
int i;
u8 get;
int SD_BLOCK=3; 
extern int Timedisplay;



static char Responce[]="Wireless data transmition test completed@";
static char Responce2[]="GPS test completed@";
static char Responce3[]="clock test completed@";
static char Responce4[]="ALL test completed,wait for launching signal@";
static char Responce5[]="Go! Good Luck!@";

static char errorDatatransmition[]="Wireless transmistion test failed@";
static char errorGPS[]="GPS test failed@";
static char errorclock[]="clock test failed@";

void RCC_Configuration(void)
{
  ErrorStatus HSEStartUpStatus;
 
  RCC_DeInit();                                                      
  RCC_HSEConfig(((u32)0x00010000));                    
  HSEStartUpStatus = RCC_WaitForHSEStartUp(); 
  if(HSEStartUpStatus == SUCCESS)                      
    {
      FLASH_PrefetchBufferCmd(ENABLE);          
      FLASH_SetLatency(((u32)0x00000002));         
      RCC_HCLKConfig(((u32)0x00000000));        
      RCC_PCLK2Config(((u32)0x00000000));
      RCC_PCLK1Config(((u32)0x00000400));
      RCC_PLLConfig(((u32)0x00010000),((u32)0x001C0000));
      RCC_PLLCmd(ENABLE);                              
      while(RCC_GetFlagStatus(((u8)0x39))==RESET);                                                              
      RCC_SYSCLKConfig(((u32)0x00000002));  
      while(RCC_GetSYSCLKSource() !=0x80);
			
			
			
			
			RCC_APB2PeriphClockCmd(((u32)0x00001000),ENABLE);
			RCC_APB2PeriphClockCmd(((u32)0x00000004),ENABLE);
			RCC_APB2PeriphClockCmd(((u32)0x00000008),ENABLE);
			
			
			RCC_APB1PeriphClockCmd(((u32)0x00040000), ENABLE);
      
			
			RCC_APB2PeriphClockCmd(((u32)0x00004000), ENABLE);
			
			
			RCC_APB1PeriphClockCmd(((u32)0x00020000), ENABLE);
			
			
			RCC_APB2PeriphClockCmd(((u32)0x00000010),ENABLE);
			
			
			RCC_APB2PeriphClockCmd(((u32)0x00000010),ENABLE);
			
			SysTick_ITConfig(ENABLE);
   }
}


void GPIO_Configuration(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;
	
	GPIO_InitStructure.GPIO_Pin=((u16)0x0020)|((u16)0x0040)|((u16)0x0080);
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_AF_PP;
	GPIO_Init(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0800)),&GPIO_InitStructure);
	
	   
  GPIO_InitStructure.GPIO_Pin = ((u16)0x0010);
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_Init(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0800)), &GPIO_InitStructure);
	
	
	GPIO_InitStructure.GPIO_Pin=((u16)0x0200);
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_AF_PP;
	GPIO_Init(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0800)),&GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = ((u16)0x0400);			 
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
  GPIO_Init(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0800)), &GPIO_InitStructure);
	
  
	GPIO_InitStructure.GPIO_Pin=((u16)0x0004);
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_AF_PP;
	GPIO_Init(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0800)),&GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = ((u16)0x0008);			 
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
  GPIO_Init(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0800)), &GPIO_InitStructure);
	
	
	GPIO_InitStructure.GPIO_Pin=((u16)0x0400);
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_AF_PP;
	GPIO_Init(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0800)),&GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = ((u16)0x0800);			 
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
  GPIO_Init(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0C00)), &GPIO_InitStructure);
	
	
	GPIO_InitStructure.GPIO_Pin = ((u16)0x4000);		
  GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;	
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_Init(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x1000)), &GPIO_InitStructure);
	
	
	GPIO_InitStructure.GPIO_Pin = ((u16)0x8000);		
  GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;	
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_Init(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x1000)), &GPIO_InitStructure);
	
	
	GPIO_InitStructure.GPIO_Pin = ((u16)0x0040);		
  GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;	
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_Init(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x1000)), &GPIO_InitStructure);
}

void SPI_Configuration(void)
{
	SPI_InitStructure.SPI_Direction=((u16)0x0000);
  SPI_InitStructure.SPI_DataSize=((u16)0x0000);
  SPI_InitStructure.SPI_CPOL=((u16)0x0002); 
  SPI_InitStructure.SPI_CPHA=((u16)0x0001);
  SPI_InitStructure.SPI_NSS=((u16)0x0200);
  SPI_InitStructure.SPI_BaudRatePrescaler=((u16)0x0000);
  SPI_InitStructure.SPI_FirstBit=((u16)0x0000);
  SPI_InitStructure.SPI_CRCPolynomial=7;
	SPI_InitStructure.SPI_Mode=((u16)0x0104);
  SPI_Init(((SPI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x3000)),&SPI_InitStructure);
  SPI_Cmd(((SPI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x3000)),ENABLE);
}

void USART_Configuration(void)
{
  USART_InitTypeDef USART_InitStructure;       
	
  





 

  USART_InitStructure.USART_BaudRate = 9600;
  USART_InitStructure.USART_WordLength = ((u16)0x0000);
  USART_InitStructure.USART_StopBits = ((u16)0x0000);  
  USART_InitStructure.USART_Parity = ((u16)0x0000) ;	  
  USART_InitStructure.USART_HardwareFlowControl =  ((u16)0x0000);
  USART_InitStructure.USART_Mode = ((u16)0x0004) | ((u16)0x0008);
  USART_Init(((USART_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x3800)), &USART_InitStructure);
	USART_Init(((USART_TypeDef *) (((u32)0x40000000) + 0x4400)), &USART_InitStructure);
	USART_Init(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), &USART_InitStructure);
	
  USART_Cmd(((USART_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x3800)), ENABLE);
	USART_Cmd(((USART_TypeDef *) (((u32)0x40000000) + 0x4400)), ENABLE);
	USART_Cmd(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ENABLE);
}



void NVIC_Configuration(void)
{
	NVIC_InitTypeDef NVIC_InitStructure;
	NVIC_PriorityGroupConfig(((u32)0x600));
	NVIC_InitStructure.NVIC_IRQChannel =((u8)0x03);
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority =1;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority =0;
	NVIC_InitStructure.NVIC_IRQChannelCmd =ENABLE;
	NVIC_Init(&NVIC_InitStructure);
}

void RTC_Configuration(void)
{
	RCC_APB1PeriphClockCmd(((u32)0x10000000) | ((u32)0x08000000), ENABLE);
	PWR_BackupAccessCmd(ENABLE);
	BKP_DeInit();
	RCC_LSEConfig(((u8)0x01));
	while(RCC_GetFlagStatus(((u8)0x41)) == RESET);
	RCC_RTCCLKConfig(((u32)0x00000100));
	RCC_RTCCLKCmd(ENABLE);
	RTC_WaitForSynchro();
	RTC_WaitForLastTask();
	RTC_ITConfig(((u16)0x0001), ENABLE);
	RTC_WaitForLastTask();
	RTC_SetPrescaler(32767); 
	RTC_WaitForLastTask();	
}










 

void Systick_Configuration(void)
{
	SysTick_CounterCmd(((u32)0xFFFFFFFE));
	SysTick_CLKSourceConfig(((u32)0xFFFFFFFB));
	SysTick_CounterCmd(((u32)0x00000000));
	SysTick_SetReload(9000*1000*10); 
}

void delay(void)  
{
	SysTick_CounterCmd(((u32)0x00000001));
	while(SysTick_GetFlagStatus(((u32)0x00000010))==0);
	SysTick_CounterCmd(((u32)0xFFFFFFFE));
	SysTick_CounterCmd(((u32)0x00000000));
}


int main(void)
{
	
	
	u8 sd_recv_buf[512];
	u8 sd_send_buf[512];
	u8 ret = 1;
	
	
	RCC_Configuration();
	GPIO_Configuration();
	SPI_Configuration();
	USART_Configuration();
	
	
	ret = MSD_Init();
	ret = MSD_GetMediumCharacteristics();
	MSD_EarseBlock(0,Mass_Block_Count);
	
	
	
	GPIO_SetBits(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x1000)),((u16)0x4000));
	
	
	for (i=0;i<6*5;i++) {delay();} 

  
  
	
	
	Timedisplay=0;
	while (Timedisplay<10)
	{
		USART_SendData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), 'A'); 
	  while(USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0080)) == RESET);
		
	  if ((USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0020)) == SET)
			   && (USART_ReceiveData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)))==65)) 
		  {
				
				for (i=0;i<strlen(Responce);i++)
				{
				  USART_SendData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), Responce[i]); 
	        while(USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0080)) == RESET);
				}
				break;
			}
		USART_ClearFlag(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0020));
	}
	
	if (Timedisplay==10)
	{
		GPIO_ResetBits(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x1000)),((u16)0x4000));
		
		
		
		for (i=0;i<strlen(errorDatatransmition);i++)
			{
				sd_send_buf[i]=errorDatatransmition[i];
			}
		ret = MSD_WriteBlock(sd_send_buf,0,512);
		
		
		return(0);
	}
	
	
	while (1)
	{
		if ((USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0020)) == SET)
			   && (USART_ReceiveData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)))==78)) 
		  {
				break;
			}
		USART_ClearFlag(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0020));
	}
	
	
  Timedisplay=0;
	flag=0;
	while ((Timedisplay<60*5) &&
		     (!((USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0020)) == SET)
			      && (USART_ReceiveData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)))==70))))  
	{
	  if ((USART_GetFlagStatus(((USART_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x3800)), ((u16)0x0020)) == SET))
		  {
				flag=1;
				USART_SendData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), USART_ReceiveData(((USART_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x3800)))); 
	      while(USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0080)) == RESET);
			}
		USART_ClearFlag(((USART_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x3800)), ((u16)0x0020));
	}
	
	if (flag==0)
	{
		GPIO_ResetBits(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x1000)),((u16)0x4000));
		for (i=0;i<strlen(errorGPS);i++)
		{
			USART_SendData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), errorGPS[i]); 
	    while(USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0080)) == RESET);
		}
		
		for (i=0;i<strlen(errorGPS);i++)
			{
				sd_send_buf[i]=errorGPS[i];
			}
		ret = MSD_WriteBlock(sd_send_buf,1,512);
		return(0);
	}
	
	for (i=0;i<strlen(Responce2);i++)
		{
			USART_SendData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), Responce2[i]); 
	    while(USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0080)) == RESET);
		}
		
	
	
	while (1)
	{
		if ((USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0020)) == SET)
			   && (USART_ReceiveData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)))==78)) 
		  {
				break;
			}
		USART_ClearFlag(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0020));
	}
	
	
	USART_SendData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), 'C'); 
	while(USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0080)) == RESET);
	Timedisplay=0;
	flag=0;
	while ((Timedisplay<20) &&
		     (!((USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0020)) == SET)
			      && (USART_ReceiveData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)))==68))));  
	
	if ((abs(Timedisplay-10)<2) &&
		    (USART_ReceiveData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)))==68))
	{
		GPIO_ResetBits(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x1000)),((u16)0x4000));
		for (i=0;i<strlen(errorclock);i++)
		{
			USART_SendData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), errorclock[i]); 
	    while(USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0080)) == RESET);
		}
		
		
		for (i=0;i<strlen(errorclock);i++)
			{
				sd_send_buf[i]=errorclock[i];
			}
		ret = MSD_WriteBlock(sd_send_buf,2,512);
		
			
		return(0);
	}
  SysTick_CounterCmd(((u32)0xFFFFFFFE));
	SysTick_CounterCmd(((u32)0x00000000));
	
	
	for (i=0;i<strlen(Responce3);i++)
		{
			USART_SendData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), Responce3[i]); 
	    while(USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0080)) == RESET);
		}
	
	
	for (i=0;i<strlen(Responce4);i++)
		{
			USART_SendData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), Responce4[i]); 
	    while(USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0080)) == RESET);
		}
	
	while (!((USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0020)) == SET)
			      && (USART_ReceiveData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)))==75))); 
	
	delay();
  
	
	for (i=0;i<strlen(Responce5);i++)
		{
			USART_SendData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), Responce5[i]); 
	    while(USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0080)) == RESET);
		}
	
	
	GPIO_SetBits(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x1000)),((u16)0x8000));
	
	
	i=0;
	Timedisplay=0;
	while(1)
	{
		if (Timedisplay>=10) 
		{
			GPIO_SetBits(((GPIO_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x1000)),((u16)0x0040));
		}
		if ((USART_GetFlagStatus(((USART_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x3800)), ((u16)0x0020)) == SET))
		  {
				get=USART_ReceiveData(((USART_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x3800)));
				USART_SendData(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), get); 
	      while(USART_GetFlagStatus(((USART_TypeDef *) (((u32)0x40000000) + 0x4800)), ((u16)0x0080)) == RESET);
				
				
				sd_send_buf[i]=get;
				i++;
				if (i==512) 
				{
					ret = MSD_WriteBlock(sd_send_buf,SD_BLOCK,512);
					SD_BLOCK++;
					i=0;
				}
			  
				
    }
		USART_ClearFlag(((USART_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x3800)), ((u16)0x0020));
	}
	return(0);
}


