#line 1 "library\\src\\stm32f10x_tim.c"













 

 
#line 1 ".\\library\\inc\\stm32f10x_tim.h"














 

 



 
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
                                                                                                             


 








#line 18 "library\\src\\stm32f10x_tim.c"
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



 
#line 19 "library\\src\\stm32f10x_tim.c"

 
 
 
#line 34 "library\\src\\stm32f10x_tim.c"

#line 51 "library\\src\\stm32f10x_tim.c"







#line 68 "library\\src\\stm32f10x_tim.c"











































 
 
 
static void TI1_Config(TIM_TypeDef* TIMx, u16 TIM_ICPolarity, u16 TIM_ICSelection,
                       u16 TIM_ICFilter);
static void TI2_Config(TIM_TypeDef* TIMx, u16 TIM_ICPolarity, u16 TIM_ICSelection,
                       u16 TIM_ICFilter);
static void TI3_Config(TIM_TypeDef* TIMx, u16 TIM_ICPolarity, u16 TIM_ICSelection,
                       u16 TIM_ICFilter);
static void TI4_Config(TIM_TypeDef* TIMx, u16 TIM_ICPolarity, u16 TIM_ICSelection,
                       u16 TIM_ICFilter);
 
 
 
 







 
void TIM_DeInit(TIM_TypeDef* TIMx)
{
   
  ((void)0); 
 
  switch (*(u32*)&TIMx)
  {
    case ((((u32)0x40000000) + 0x10000) + 0x2C00):
      RCC_APB2PeriphResetCmd(((u32)0x00000800), ENABLE);
      RCC_APB2PeriphResetCmd(((u32)0x00000800), DISABLE);  
      break; 
      
    case (((u32)0x40000000) + 0x0000):
      RCC_APB1PeriphResetCmd(((u32)0x00000001), ENABLE);
      RCC_APB1PeriphResetCmd(((u32)0x00000001), DISABLE);
      break;
 
    case (((u32)0x40000000) + 0x0400):
      RCC_APB1PeriphResetCmd(((u32)0x00000002), ENABLE);
      RCC_APB1PeriphResetCmd(((u32)0x00000002), DISABLE);
      break;
 
    case (((u32)0x40000000) + 0x0800):
      RCC_APB1PeriphResetCmd(((u32)0x00000004), ENABLE);
      RCC_APB1PeriphResetCmd(((u32)0x00000004), DISABLE);
      break;
      
    case (((u32)0x40000000) + 0x0C00):
      RCC_APB1PeriphResetCmd(((u32)0x00000008), ENABLE);
      RCC_APB1PeriphResetCmd(((u32)0x00000008), DISABLE);
      break;
      
    case (((u32)0x40000000) + 0x1000):
      RCC_APB1PeriphResetCmd(((u32)0x00000010), ENABLE);
      RCC_APB1PeriphResetCmd(((u32)0x00000010), DISABLE);
      break;
      
    case (((u32)0x40000000) + 0x1400):
      RCC_APB1PeriphResetCmd(((u32)0x00000020), ENABLE);
      RCC_APB1PeriphResetCmd(((u32)0x00000020), DISABLE);
      break;
      
    case ((((u32)0x40000000) + 0x10000) + 0x3400):
      RCC_APB2PeriphResetCmd(((u32)0x00002000), ENABLE);
      RCC_APB2PeriphResetCmd(((u32)0x00002000), DISABLE);  
      break; 
      
    default:
      break;
  }
}












 
void TIM_TimeBaseInit(TIM_TypeDef* TIMx, TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)
{
   
  ((void)0); 
  ((void)0);
  ((void)0);

   
  TIMx->CR1 &= ((u16)0x00FF) & ((u16)0x038F);
  TIMx->CR1 |= (u32)TIM_TimeBaseInitStruct->TIM_ClockDivision |
                TIM_TimeBaseInitStruct->TIM_CounterMode;
   
  TIMx->ARR = TIM_TimeBaseInitStruct->TIM_Period ;

   
  TIMx->PSC = TIM_TimeBaseInitStruct->TIM_Prescaler;

   
  TIMx->EGR = ((u16)0x0001);
    
  if (((*(u32*)&TIMx) == ((((u32)0x40000000) + 0x10000) + 0x2C00)) || ((*(u32*)&TIMx) == ((((u32)0x40000000) + 0x10000) + 0x3400)))  
  {
     
    TIMx->RCR = TIM_TimeBaseInitStruct->TIM_RepetitionCounter;
  }        
}












 
void TIM_OC1Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
  u16 tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
   
   
  ((void)0); 
  ((void)0);
  ((void)0);
  ((void)0);   

   
  TIMx->CCER &= ((u16)0xFFFE);
  
   
  tmpccer = TIMx->CCER;

   
  tmpcr2 =  TIMx->CR2;
  
   
  tmpccmrx = TIMx->CCMR1;
    
   
  tmpccmrx &= ((u16)0xFF8F);
  
   
  tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;
  
   
  tmpccer &= ((u16)0xFFFD);

   
  tmpccer |= TIM_OCInitStruct->TIM_OCPolarity;
  
   
  tmpccer |= TIM_OCInitStruct->TIM_OutputState;
  
   
  TIMx->CCR1 = TIM_OCInitStruct->TIM_Pulse;
  
  if((*(u32*)&TIMx == ((((u32)0x40000000) + 0x10000) + 0x2C00)) || (*(u32*)&TIMx == ((((u32)0x40000000) + 0x10000) + 0x3400)))
  {
    ((void)0);
    ((void)0);
    ((void)0);
    ((void)0);
    
     
    tmpccer &= ((u16)0xFFF7);

     
    tmpccer |= TIM_OCInitStruct->TIM_OCNPolarity;

     
    tmpccer &= ((u16)0xFFFB);
    
     
    tmpccer |= TIM_OCInitStruct->TIM_OutputNState;

     
    tmpcr2 &= ((u16)0x7EFF);
    tmpcr2 &= ((u16)0x7DFF);

     
    tmpcr2 |= TIM_OCInitStruct->TIM_OCIdleState;

     
    tmpcr2 |= TIM_OCInitStruct->TIM_OCNIdleState;
  }
   
  TIMx->CR2 = tmpcr2;
  
   
  TIMx->CCMR1 = tmpccmrx;
  
   
  TIMx->CCER = tmpccer;
}












 
void TIM_OC2Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
  u16 tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
   
   
  ((void)0); 
  ((void)0);
  ((void)0);
  ((void)0);   

   
  TIMx->CCER &= ((u16)0xFFEF);
  
     
  tmpccer = TIMx->CCER;

   
  tmpcr2 =  TIMx->CR2;
  
   
  tmpccmrx = TIMx->CCMR1;
    
   
  tmpccmrx &= ((u16)0x8FFF);
  
   
  tmpccmrx |= (u16)(TIM_OCInitStruct->TIM_OCMode << 8);
  
   
  tmpccer &= ((u16)0xFFDF);

   
  tmpccer |= (u16)(TIM_OCInitStruct->TIM_OCPolarity << 4);
  
   
  tmpccer |= (u16)(TIM_OCInitStruct->TIM_OutputState << 4);
  
   
  TIMx->CCR2 = TIM_OCInitStruct->TIM_Pulse;
  
  if((*(u32*)&TIMx == ((((u32)0x40000000) + 0x10000) + 0x2C00)) || (*(u32*)&TIMx == ((((u32)0x40000000) + 0x10000) + 0x3400)))
  {
    ((void)0);
    ((void)0);
    ((void)0);
    ((void)0);
    
     
    tmpccer &= ((u16)0xFF7F);

     
    tmpccer |= (u16)(TIM_OCInitStruct->TIM_OCNPolarity << 4);

     
    tmpccer &= ((u16)0xFFBF);
    
     
    tmpccer |= (u16)(TIM_OCInitStruct->TIM_OutputNState << 4);

     
    tmpcr2 &= ((u16)0x7BFF);
    tmpcr2 &= ((u16)0x77FF);

     
    tmpcr2 |= (u16)(TIM_OCInitStruct->TIM_OCIdleState << 2);

     
    tmpcr2 |= (u16)(TIM_OCInitStruct->TIM_OCNIdleState << 2);
  }

   
  TIMx->CR2 = tmpcr2;
  
   
  TIMx->CCMR1 = tmpccmrx;
  
   
  TIMx->CCER = tmpccer;
}












 
void TIM_OC3Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
  u16 tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
   
   
  ((void)0); 
  ((void)0);
  ((void)0);
  ((void)0);   

   
  TIMx->CCER &= ((u16)0xFEFF);
  
   
  tmpccer = TIMx->CCER;

   
  tmpcr2 =  TIMx->CR2;
  
   
  tmpccmrx = TIMx->CCMR2;
    
   
  tmpccmrx &= ((u16)0xFF8F);
  
   
  tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;
  
   
  tmpccer &= ((u16)0xFDFF);

   
  tmpccer |= (u16)(TIM_OCInitStruct->TIM_OCPolarity << 8);
  
   
  tmpccer |= (u16)(TIM_OCInitStruct->TIM_OutputState << 8);
  
   
  TIMx->CCR3 = TIM_OCInitStruct->TIM_Pulse;
  
  if((*(u32*)&TIMx == ((((u32)0x40000000) + 0x10000) + 0x2C00)) || (*(u32*)&TIMx == ((((u32)0x40000000) + 0x10000) + 0x3400)))
  {
    ((void)0);
    ((void)0);
    ((void)0);
    ((void)0);
    
     
    tmpccer &= ((u16)0xF7FF);

     
    tmpccer |= (u16)(TIM_OCInitStruct->TIM_OCNPolarity << 8);

     
    tmpccer &= ((u16)0xFBFF);
    
     
    tmpccer |= (u16)(TIM_OCInitStruct->TIM_OutputNState << 8);

     
    tmpcr2 &= ((u16)0x6FFF);
    tmpcr2 &= ((u16)0x5FFF);

     
    tmpcr2 |= (u16)(TIM_OCInitStruct->TIM_OCIdleState << 4);

     
    tmpcr2 |= (u16)(TIM_OCInitStruct->TIM_OCNIdleState << 4);
  }

   
  TIMx->CR2 = tmpcr2;
  
   
  TIMx->CCMR2 = tmpccmrx;
  
   
  TIMx->CCER = tmpccer;
}












 
void TIM_OC4Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
  u16 tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
   
   
  ((void)0); 
  ((void)0);
  ((void)0);
  ((void)0);   

   
  TIMx->CCER &= ((u16)0xEFFF);
  
   
  tmpccer = TIMx->CCER;

   
  tmpcr2 =  TIMx->CR2;
  
   
  tmpccmrx = TIMx->CCMR2;
    
   
  tmpccmrx &= ((u16)0x8FFF);
  
   
  tmpccmrx |= (u16)(TIM_OCInitStruct->TIM_OCMode << 8);
  
   
  tmpccer &= ((u16)0xDFFF);

   
  tmpccer |= (u16)(TIM_OCInitStruct->TIM_OCPolarity << 12);
  
   
  tmpccer |= (u16)(TIM_OCInitStruct->TIM_OutputState << 12);
  
   
  TIMx->CCR4 = TIM_OCInitStruct->TIM_Pulse;
  
  if((*(u32*)&TIMx == ((((u32)0x40000000) + 0x10000) + 0x2C00)) || (*(u32*)&TIMx == ((((u32)0x40000000) + 0x10000) + 0x3400)))
  {
    ((void)0);

     
    tmpcr2 &= ((u16)0x3FFF);

     
    tmpcr2 |= (u16)(TIM_OCInitStruct->TIM_OCIdleState << 6);
  }

   
  TIMx->CR2 = tmpcr2;
  
     
  TIMx->CCMR2 = tmpccmrx;
  
   
  TIMx->CCER = tmpccer;
}












 
void TIM_ICInit(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct)
{
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  
  if (TIM_ICInitStruct->TIM_Channel == ((u16)0x0000))
  {
     
    TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
               TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);

     
    TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
  else if (TIM_ICInitStruct->TIM_Channel == ((u16)0x0004))
  {
     
    TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
               TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);

     
    TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
  else if (TIM_ICInitStruct->TIM_Channel == ((u16)0x0008))
  {
     
    TI3_Config(TIMx,  TIM_ICInitStruct->TIM_ICPolarity,
               TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);

     
    TIM_SetIC3Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
  else
  {
     
    TI4_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
               TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);

     
    TIM_SetIC4Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
}













 
void TIM_PWMIConfig(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct)
{
  u16 icoppositepolarity = ((u16)0x0000);
  u16 icoppositeselection = ((u16)0x0001);

   
  ((void)0);

   
  if (TIM_ICInitStruct->TIM_ICPolarity == ((u16)0x0000))
  {
    icoppositepolarity = ((u16)0x0002);
  }
  else
  {
    icoppositepolarity = ((u16)0x0000);
  }

   
  if (TIM_ICInitStruct->TIM_ICSelection == ((u16)0x0001))
  {
    icoppositeselection = ((u16)0x0002);
  }
  else
  {
    icoppositeselection = ((u16)0x0001);
  }

  if (TIM_ICInitStruct->TIM_Channel == ((u16)0x0000))
  {
     
    TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);

     
    TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);

     
    TI2_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);

     
    TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
  else
  { 
     
    TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);

     
    TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);

     
    TI1_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);

     
    TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
}











 
void TIM_BDTRConfig(TIM_TypeDef* TIMx, TIM_BDTRInitTypeDef *TIM_BDTRInitStruct)
{
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);

  
 

  TIMx->BDTR = (u32)TIM_BDTRInitStruct->TIM_OSSRState | TIM_BDTRInitStruct->TIM_OSSIState |
             TIM_BDTRInitStruct->TIM_LOCKLevel | TIM_BDTRInitStruct->TIM_DeadTime |
             TIM_BDTRInitStruct->TIM_Break | TIM_BDTRInitStruct->TIM_BreakPolarity |
             TIM_BDTRInitStruct->TIM_AutomaticOutput;

}








 
void TIM_TimeBaseStructInit(TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)
{
   
  TIM_TimeBaseInitStruct->TIM_Period = 0xFFFF;
  TIM_TimeBaseInitStruct->TIM_Prescaler = 0x0000;
  TIM_TimeBaseInitStruct->TIM_ClockDivision = ((u16)0x0000);
  TIM_TimeBaseInitStruct->TIM_CounterMode = ((u16)0x0000);
  TIM_TimeBaseInitStruct->TIM_RepetitionCounter = 0x0000;
}








 
void TIM_OCStructInit(TIM_OCInitTypeDef* TIM_OCInitStruct)
{
   
  TIM_OCInitStruct->TIM_OCMode = ((u16)0x0000);
  TIM_OCInitStruct->TIM_OutputState = ((u16)0x0000);
  TIM_OCInitStruct->TIM_OutputNState = ((u16)0x0000);
  TIM_OCInitStruct->TIM_Pulse = 0x0000;
  TIM_OCInitStruct->TIM_OCPolarity = ((u16)0x0000);
  TIM_OCInitStruct->TIM_OCNPolarity = ((u16)0x0000);
  TIM_OCInitStruct->TIM_OCIdleState = ((u16)0x0000);
  TIM_OCInitStruct->TIM_OCNIdleState = ((u16)0x0000);
}








 
void TIM_ICStructInit(TIM_ICInitTypeDef* TIM_ICInitStruct)
{
   
  TIM_ICInitStruct->TIM_Channel = ((u16)0x0000);
  TIM_ICInitStruct->TIM_ICPolarity = ((u16)0x0000);
  TIM_ICInitStruct->TIM_ICSelection = ((u16)0x0001);
  TIM_ICInitStruct->TIM_ICPrescaler = ((u16)0x0000);
  TIM_ICInitStruct->TIM_ICFilter = 0x00;
}








 
void TIM_BDTRStructInit(TIM_BDTRInitTypeDef* TIM_BDTRInitStruct)
{
   
  TIM_BDTRInitStruct->TIM_OSSRState = ((u16)0x0000);
  TIM_BDTRInitStruct->TIM_OSSIState = ((u16)0x0000);
  TIM_BDTRInitStruct->TIM_LOCKLevel = ((u16)0x0000);
  TIM_BDTRInitStruct->TIM_DeadTime = 0x00;
  TIM_BDTRInitStruct->TIM_Break = ((u16)0x0000);
  TIM_BDTRInitStruct->TIM_BreakPolarity = ((u16)0x0000);
  TIM_BDTRInitStruct->TIM_AutomaticOutput = ((u16)0x0000);
}









 
void TIM_Cmd(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    TIMx->CR1 |= ((u16)0x0001);
  }
  else
  {
     
    TIMx->CR1 &= ((u16)0x03FE);
  }
}









 
void TIM_CtrlPWMOutputs(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);

  if (NewState != DISABLE)
  {
     
    TIMx->BDTR |= ((u16)0x8000);
  }
  else
  {
     
    TIMx->BDTR &= ((u16)0x7FFF);
  }  
}




















 
void TIM_ITConfig(TIM_TypeDef* TIMx, u16 TIM_IT, FunctionalState NewState)
{  
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    TIMx->DIER |= TIM_IT;
  }
  else
  {
     
    TIMx->DIER &= (u16)~TIM_IT;
  }
}















 
void TIM_GenerateEvent(TIM_TypeDef* TIMx, u16 TIM_EventSource)
{ 
   
  ((void)0);
  ((void)0);
  ((void)0);

   
  TIMx->EGR = TIM_EventSource;
}




















 
void TIM_DMAConfig(TIM_TypeDef* TIMx, u16 TIM_DMABase, u16 TIM_DMABurstLength)
{
   
  ((void)0);
  ((void)0);
  ((void)0);

   
  TIMx->DCR = TIM_DMABase | TIM_DMABurstLength;
}


















 
void TIM_DMACmd(TIM_TypeDef* TIMx, u16 TIM_DMASource, FunctionalState NewState)
{ 
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    TIMx->DIER |= TIM_DMASource; 
  }
  else
  {
     
    TIMx->DIER &= (u16)~TIM_DMASource;
  }
}








 
void TIM_InternalClockConfig(TIM_TypeDef* TIMx)
{
   
  ((void)0);

   
  TIMx->SMCR &=  ((u16)0xFFF8);
}













 
void TIM_ITRxExternalClockConfig(TIM_TypeDef* TIMx, u16 TIM_InputTriggerSource)
{
   
  ((void)0);
  ((void)0);

   
  TIM_SelectInputTrigger(TIMx, TIM_InputTriggerSource);

   
  TIMx->SMCR |= ((u16)0x0007);
}


















 
void TIM_TIxExternalClockConfig(TIM_TypeDef* TIMx, u16 TIM_TIxExternalCLKSource,
                                u16 TIM_ICPolarity, u16 ICFilter)
{
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);

   
  if (TIM_TIxExternalCLKSource == ((u16)0x0060))
  {
    TI2_Config(TIMx, TIM_ICPolarity, ((u16)0x0001), ICFilter);
  }
  else
  {
    TI1_Config(TIMx, TIM_ICPolarity, ((u16)0x0001), ICFilter);
  }

   
  TIM_SelectInputTrigger(TIMx, TIM_TIxExternalCLKSource);

   
  TIMx->SMCR |= ((u16)0x0007);
}




















 
void TIM_ETRClockMode1Config(TIM_TypeDef* TIMx, u16 TIM_ExtTRGPrescaler, u16 TIM_ExtTRGPolarity,
                             u16 ExtTRGFilter)
{
  u16 tmpsmcr = 0;

   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);

   
  TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);
  
   
  tmpsmcr = TIMx->SMCR;

   
  tmpsmcr &= ((u16)0xFFF8);
   
  tmpsmcr |= ((u16)0x0007);

   
  tmpsmcr &= ((u16)0xFF8F);
  tmpsmcr |= ((u16)0x0070);

   
  TIMx->SMCR = tmpsmcr;
}




















 
void TIM_ETRClockMode2Config(TIM_TypeDef* TIMx, u16 TIM_ExtTRGPrescaler, 
                             u16 TIM_ExtTRGPolarity, u16 ExtTRGFilter)
{
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);

   
  TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);

   
  TIMx->SMCR |= ((u16)0x4000);
}




















 
void TIM_ETRConfig(TIM_TypeDef* TIMx, u16 TIM_ExtTRGPrescaler, u16 TIM_ExtTRGPolarity,
                   u16 ExtTRGFilter)
{
  u16 tmpsmcr = 0;

   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);

  tmpsmcr = TIMx->SMCR;

   
  tmpsmcr &= ((u16)0x00FF);

   
  tmpsmcr |= TIM_ExtTRGPrescaler | TIM_ExtTRGPolarity | (u16)(ExtTRGFilter << 8);

   
  TIMx->SMCR = tmpsmcr;
}














 
void TIM_PrescalerConfig(TIM_TypeDef* TIMx, u16 Prescaler, u16 TIM_PSCReloadMode)
{
   
  ((void)0);
  ((void)0);

   
  TIMx->PSC = Prescaler;

   
  TIMx->EGR = TIM_PSCReloadMode;
}















 
void TIM_CounterModeConfig(TIM_TypeDef* TIMx, u16 TIM_CounterMode)
{
  u16 tmpcr1 = 0;

   
  ((void)0);
  ((void)0);

  tmpcr1 = TIMx->CR1;

   
  tmpcr1 &= ((u16)0x038F);

   
  tmpcr1 |= TIM_CounterMode;

   
  TIMx->CR1 = tmpcr1;
}


















 
void TIM_SelectInputTrigger(TIM_TypeDef* TIMx, u16 TIM_InputTriggerSource)
{
  u16 tmpsmcr = 0;

   
  ((void)0);
  ((void)0);

   
  tmpsmcr = TIMx->SMCR;

   
  tmpsmcr &= ((u16)0xFF8F);

   
  tmpsmcr |= TIM_InputTriggerSource;

   
  TIMx->SMCR = tmpsmcr;
}
























 
void TIM_EncoderInterfaceConfig(TIM_TypeDef* TIMx, u16 TIM_EncoderMode,
                                u16 TIM_IC1Polarity, u16 TIM_IC2Polarity)
{
  u16 tmpsmcr = 0;
  u16 tmpccmr1 = 0;
  u16 tmpccer = 0;
    
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);

   
  tmpsmcr = TIMx->SMCR;

   
  tmpccmr1 = TIMx->CCMR1;

   
  tmpccer = TIMx->CCER;

   
  tmpsmcr &= ((u16)0xFFF8);
  tmpsmcr |= TIM_EncoderMode;

   
  tmpccmr1 &= ((u16)0xFFFC) & ((u16)0xFCFF);
  tmpccmr1 |= ((u16)0x0001) | ((u16)0x0100);

   
  tmpccer &= ((u16)0xFFFD) & ((u16)0xFFDF);
  tmpccer |= (TIM_IC1Polarity | (u16)(TIM_IC2Polarity << 4));

   
  TIMx->SMCR = tmpsmcr;

   
  TIMx->CCMR1 = tmpccmr1;

   
  TIMx->CCER = tmpccer;
}














 
void TIM_ForcedOC1Config(TIM_TypeDef* TIMx, u16 TIM_ForcedAction)
{
  u16 tmpccmr1 = 0;

   
  ((void)0);
  ((void)0);

  tmpccmr1 = TIMx->CCMR1;

   
  tmpccmr1 &= ((u16)0xFF8F);

   
  tmpccmr1 |= TIM_ForcedAction;

   
  TIMx->CCMR1 = tmpccmr1;
}














 
void TIM_ForcedOC2Config(TIM_TypeDef* TIMx, u16 TIM_ForcedAction)
{
  u16 tmpccmr1 = 0;

   
  ((void)0);
  ((void)0);

  tmpccmr1 = TIMx->CCMR1;

   
  tmpccmr1 &= ((u16)0x8FFF);

   
  tmpccmr1 |= (u16)(TIM_ForcedAction << 8);

   
  TIMx->CCMR1 = tmpccmr1;
}














 
void TIM_ForcedOC3Config(TIM_TypeDef* TIMx, u16 TIM_ForcedAction)
{
  u16 tmpccmr2 = 0;

   
  ((void)0);
  ((void)0);

  tmpccmr2 = TIMx->CCMR2;

   
  tmpccmr2 &= ((u16)0xFF8F);

   
  tmpccmr2 |= TIM_ForcedAction;

   
  TIMx->CCMR2 = tmpccmr2;
}














 
void TIM_ForcedOC4Config(TIM_TypeDef* TIMx, u16 TIM_ForcedAction)
{
  u16 tmpccmr2 = 0;

   
  ((void)0);
  ((void)0);
  tmpccmr2 = TIMx->CCMR2;

   
  tmpccmr2 &= ((u16)0x8FFF);

   
  tmpccmr2 |= (u16)(TIM_ForcedAction << 8);

   
  TIMx->CCMR2 = tmpccmr2;
}










 
void TIM_ARRPreloadConfig(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);

  if (NewState != DISABLE)
  {
     
    TIMx->CR1 |= ((u16)0x0080);
  }
  else
  {
     
    TIMx->CR1 &= ((u16)0x037F);
  }
}









 
void TIM_SelectCOM(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);

  if (NewState != DISABLE)
  {
     
    TIMx->CR2 |= ((u16)0x0004);
  }
  else
  {
     
    TIMx->CR2 &= ((u16)0xFFFB);
  }
}










 
void TIM_SelectCCDMA(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);

  if (NewState != DISABLE)
  {
     
    TIMx->CR2 |= ((u16)0x0008);
  }
  else
  {
     
    TIMx->CR2 &= ((u16)0xFFF7);
  }
}










 
void TIM_CCPreloadControl(TIM_TypeDef* TIMx, FunctionalState NewState)
{ 
   
  ((void)0);
  ((void)0);

  if (NewState != DISABLE)
  {
     
    TIMx->CR2 |= ((u16)0x0001);
  }
  else
  {
     
    TIMx->CR2 &= ((u16)0xFFFE);
  }
}













 
void TIM_OC1PreloadConfig(TIM_TypeDef* TIMx, u16 TIM_OCPreload)
{
  u16 tmpccmr1 = 0;

   
  ((void)0);
  ((void)0);

  tmpccmr1 = TIMx->CCMR1;

   
  tmpccmr1 &= ((u16)0xFFF7);

   
  tmpccmr1 |= TIM_OCPreload;

   
  TIMx->CCMR1 = tmpccmr1;
}













 
void TIM_OC2PreloadConfig(TIM_TypeDef* TIMx, u16 TIM_OCPreload)
{
  u16 tmpccmr1 = 0;

   
  ((void)0);
  ((void)0);

  tmpccmr1 = TIMx->CCMR1;

   
  tmpccmr1 &= ((u16)0xF7FF);

   
  tmpccmr1 |= (u16)(TIM_OCPreload << 8);

   
  TIMx->CCMR1 = tmpccmr1;
}













 
void TIM_OC3PreloadConfig(TIM_TypeDef* TIMx, u16 TIM_OCPreload)
{
  u16 tmpccmr2 = 0;

   
  ((void)0);
  ((void)0);

  tmpccmr2 = TIMx->CCMR2;

   
  tmpccmr2 &= ((u16)0xFFF7);

   
  tmpccmr2 |= TIM_OCPreload;

   
  TIMx->CCMR2 = tmpccmr2;
}













 
void TIM_OC4PreloadConfig(TIM_TypeDef* TIMx, u16 TIM_OCPreload)
{
  u16 tmpccmr2 = 0;

   
  ((void)0);
  ((void)0);

  tmpccmr2 = TIMx->CCMR2;

   
  tmpccmr2 &= ((u16)0xF7FF);

   
  tmpccmr2 |= (u16)(TIM_OCPreload << 8);

   
  TIMx->CCMR2 = tmpccmr2;
}












 
void TIM_OC1FastConfig(TIM_TypeDef* TIMx, u16 TIM_OCFast)
{
  u16 tmpccmr1 = 0;

   
  ((void)0);
  ((void)0);

   
  tmpccmr1 = TIMx->CCMR1;

   
  tmpccmr1 &= ((u16)0xFFFB);

   
  tmpccmr1 |= TIM_OCFast;

   
  TIMx->CCMR1 = tmpccmr1;
}












 
void TIM_OC2FastConfig(TIM_TypeDef* TIMx, u16 TIM_OCFast)
{
  u16 tmpccmr1 = 0;

   
  ((void)0);
  ((void)0);

   
  tmpccmr1 = TIMx->CCMR1;

   
  tmpccmr1 &= ((u16)0xFBFF);

   
  tmpccmr1 |= (u16)(TIM_OCFast << 8);

   
  TIMx->CCMR1 = tmpccmr1;
}












 
void TIM_OC3FastConfig(TIM_TypeDef* TIMx, u16 TIM_OCFast)
{
  u16 tmpccmr2 = 0;

   
  ((void)0);
  ((void)0);

   
  tmpccmr2 = TIMx->CCMR2;

   
  tmpccmr2 &= ((u16)0xFFFB);

   
  tmpccmr2 |= TIM_OCFast;

   
  TIMx->CCMR2 = tmpccmr2;
}












 
void TIM_OC4FastConfig(TIM_TypeDef* TIMx, u16 TIM_OCFast)
{
  u16 tmpccmr2 = 0;

   
  ((void)0);
  ((void)0);

   
  tmpccmr2 = TIMx->CCMR2;

   
  tmpccmr2 &= ((u16)0xFBFF);

   
  tmpccmr2 |= (u16)(TIM_OCFast << 8);

   
  TIMx->CCMR2 = tmpccmr2;
}












 
void TIM_ClearOC1Ref(TIM_TypeDef* TIMx, u16 TIM_OCClear)
{
  u16 tmpccmr1 = 0;

   
  ((void)0);
  ((void)0);

  tmpccmr1 = TIMx->CCMR1;

   
  tmpccmr1 &= ((u16)0xFF7F);

   
  tmpccmr1 |= TIM_OCClear;

   
  TIMx->CCMR1 = tmpccmr1;
}












 
void TIM_ClearOC2Ref(TIM_TypeDef* TIMx, u16 TIM_OCClear)
{
  u16 tmpccmr1 = 0;

   
  ((void)0);
  ((void)0);

  tmpccmr1 = TIMx->CCMR1;

   
  tmpccmr1 &= ((u16)0x7FFF);

   
  tmpccmr1 |= (u16)(TIM_OCClear << 8);

   
  TIMx->CCMR1 = tmpccmr1;
}












 
void TIM_ClearOC3Ref(TIM_TypeDef* TIMx, u16 TIM_OCClear)
{
  u16 tmpccmr2 = 0;

   
  ((void)0);
  ((void)0);

  tmpccmr2 = TIMx->CCMR2;

   
  tmpccmr2 &= ((u16)0xFF7F);

   
  tmpccmr2 |= TIM_OCClear;

   
  TIMx->CCMR2 = tmpccmr2;
}












 
void TIM_ClearOC4Ref(TIM_TypeDef* TIMx, u16 TIM_OCClear)
{
  u16 tmpccmr2 = 0;

   
  ((void)0);
  ((void)0);

  tmpccmr2 = TIMx->CCMR2;

   
  tmpccmr2 &= ((u16)0x7FFF);

   
  tmpccmr2 |= (u16)(TIM_OCClear << 8);

   
  TIMx->CCMR2 = tmpccmr2;
}












 
void TIM_OC1PolarityConfig(TIM_TypeDef* TIMx, u16 TIM_OCPolarity)
{
  u16 tmpccer = 0;

   
  ((void)0);
  ((void)0);

  tmpccer = TIMx->CCER;

   
  tmpccer &= ((u16)0xFFFD);
  tmpccer |= TIM_OCPolarity;

   
  TIMx->CCER = tmpccer;
}











 
void TIM_OC1NPolarityConfig(TIM_TypeDef* TIMx, u16 TIM_OCNPolarity)
{
  u16 tmpccer = 0;

   
  ((void)0);
  ((void)0);
   
  tmpccer = TIMx->CCER;

   
  tmpccer &= ((u16)0xFFF7);
  tmpccer |= TIM_OCNPolarity;

   
  TIMx->CCER = tmpccer;
}












 
void TIM_OC2PolarityConfig(TIM_TypeDef* TIMx, u16 TIM_OCPolarity)
{
  u16 tmpccer = 0;

   
  ((void)0);
  ((void)0);

  tmpccer = TIMx->CCER;

   
  tmpccer &= ((u16)0xFFDF);
  tmpccer |= (u16)(TIM_OCPolarity << 4);

   
  TIMx->CCER = tmpccer;
}











 
void TIM_OC2NPolarityConfig(TIM_TypeDef* TIMx, u16 TIM_OCNPolarity)
{
  u16 tmpccer = 0;

   
  ((void)0);
  ((void)0);
  
  tmpccer = TIMx->CCER;

   
  tmpccer &= ((u16)0xFF7F);
  tmpccer |= (u16)(TIM_OCNPolarity << 4);

   
  TIMx->CCER = tmpccer;
}












 
void TIM_OC3PolarityConfig(TIM_TypeDef* TIMx, u16 TIM_OCPolarity)
{
  u16 tmpccer = 0;

   
  ((void)0);
  ((void)0);

  tmpccer = TIMx->CCER;

   
  tmpccer &= ((u16)0xFDFF);
  tmpccer |= (u16)(TIM_OCPolarity << 8);

   
  TIMx->CCER = tmpccer;
}











 
void TIM_OC3NPolarityConfig(TIM_TypeDef* TIMx, u16 TIM_OCNPolarity)
{
  u16 tmpccer = 0;
 
   
  ((void)0);
  ((void)0);
    
  tmpccer = TIMx->CCER;

   
  tmpccer &= ((u16)0xF7FF);
  tmpccer |= (u16)(TIM_OCNPolarity << 8);

   
  TIMx->CCER = tmpccer;
}












 
void TIM_OC4PolarityConfig(TIM_TypeDef* TIMx, u16 TIM_OCPolarity)
{
  u16 tmpccer = 0;

   
  ((void)0);
  ((void)0);

  tmpccer = TIMx->CCER;

   
  tmpccer &= ((u16)0xDFFF);
  tmpccer |= (u16)(TIM_OCPolarity << 12);

   
  TIMx->CCER = tmpccer;
}
















 
void TIM_CCxCmd(TIM_TypeDef* TIMx, u16 TIM_Channel, u16 TIM_CCx)
{
   
  ((void)0);
  ((void)0);
  ((void)0);

   
  TIMx->CCER &= (u16)(~((u16)(((u16)0x0001) << TIM_Channel)));

    
  TIMx->CCER |=  (u16)(TIM_CCx << TIM_Channel);
}














 
void TIM_CCxNCmd(TIM_TypeDef* TIMx, u16 TIM_Channel, u16 TIM_CCxN)
{
   
  ((void)0);
  ((void)0);
  ((void)0);

   
  TIMx->CCER &= (u16)(~((u16)(((u16)0x0004) << TIM_Channel)));

    
  TIMx->CCER |=  (u16)(TIM_CCxN << TIM_Channel);
}


























 
void TIM_SelectOCxM(TIM_TypeDef* TIMx, u16 TIM_Channel, u16 TIM_OCMode)
{
   
  ((void)0);
  ((void)0);
  ((void)0);
  
   
  TIMx->CCER &= (u16)(~((u16)(((u16)0x0001) << TIM_Channel)));

  if((TIM_Channel == ((u16)0x0000)) ||(TIM_Channel == ((u16)0x0008)))
  {
     
    *((vu32 *)((*(u32*)&TIMx) + ((u16)0x0018) + (TIM_Channel>>1))) &= ((u16)0xFF8F);
   
     
    *((vu32 *)((*(u32*)&TIMx) + ((u16)0x0018) + (TIM_Channel>>1))) |= TIM_OCMode;

  }
  else
  {
     
    *((vu32 *)((*(u32*)&TIMx) + ((u16)0x0018) + ((u16)(TIM_Channel - 4)>> 1))) &= ((u16)0x8FFF);
    
     
    *((vu32 *)((*(u32*)&TIMx) + ((u16)0x0018) + ((u16)(TIM_Channel - 4)>> 1))) |= (u16)(TIM_OCMode << 8);
  }
}









 
void TIM_UpdateDisableConfig(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);

  if (NewState != DISABLE)
  {
     
    TIMx->CR1 |= ((u16)0x0002);
  }
  else
  {
     
    TIMx->CR1 &= ((u16)0x03FD);
  }
}











 
void TIM_UpdateRequestConfig(TIM_TypeDef* TIMx, u16 TIM_UpdateSource)
{
   
  ((void)0);
  ((void)0);

  if (TIM_UpdateSource != ((u16)0x0000))
  {
     
    TIMx->CR1 |= ((u16)0x0004);
  }
  else
  {
     
    TIMx->CR1 &= ((u16)0x03FB);
  }
}









 
void TIM_SelectHallSensor(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);

  if (NewState != DISABLE)
  {
     
    TIMx->CR2 |= ((u16)0x0080);
  }
  else
  {
     
    TIMx->CR2 &= ((u16)0xFF7F);
  }
}











 
void TIM_SelectOnePulseMode(TIM_TypeDef* TIMx, u16 TIM_OPMode)
{
   
  ((void)0);
  ((void)0);

   
  TIMx->CR1 &= ((u16)0x03F7);

   
  TIMx->CR1 |= TIM_OPMode;
}




















 
void TIM_SelectOutputTrigger(TIM_TypeDef* TIMx, u16 TIM_TRGOSource)
{
   
  ((void)0);
  ((void)0);
  ((void)0);

   
  TIMx->CR2 &= ((u16)0xFF8F);

   
  TIMx->CR2 |=  TIM_TRGOSource;
}














 
void TIM_SelectSlaveMode(TIM_TypeDef* TIMx, u16 TIM_SlaveMode)
{
   
  ((void)0);
  ((void)0);

   
  TIMx->SMCR &= ((u16)0xFFF8);

   
  TIMx->SMCR |= TIM_SlaveMode;
}













 
void TIM_SelectMasterSlaveMode(TIM_TypeDef* TIMx, u16 TIM_MasterSlaveMode)
{
   
  ((void)0);
  ((void)0);

   
  TIMx->SMCR &= ((u16)0xFF7F);
  
   
  TIMx->SMCR |= TIM_MasterSlaveMode;
}








 
void TIM_SetCounter(TIM_TypeDef* TIMx, u16 Counter)
{
   
  ((void)0);

   
  TIMx->CNT = Counter;
}








 
void TIM_SetAutoreload(TIM_TypeDef* TIMx, u16 Autoreload)
{
   
  ((void)0);

   
  TIMx->ARR = Autoreload;
}









 
void TIM_SetCompare1(TIM_TypeDef* TIMx, u16 Compare1)
{
   
  ((void)0);

   
  TIMx->CCR1 = Compare1;
}









 
void TIM_SetCompare2(TIM_TypeDef* TIMx, u16 Compare2)
{
   
  ((void)0);

   
  TIMx->CCR2 = Compare2;
}









 
void TIM_SetCompare3(TIM_TypeDef* TIMx, u16 Compare3)
{
   
  ((void)0);

   
  TIMx->CCR3 = Compare3;
}









 
void TIM_SetCompare4(TIM_TypeDef* TIMx, u16 Compare4)
{
   
  ((void)0);

   
  TIMx->CCR4 = Compare4;
}















 
void TIM_SetIC1Prescaler(TIM_TypeDef* TIMx, u16 TIM_ICPSC)
{
   
  ((void)0);
  ((void)0);

   
  TIMx->CCMR1 &= ((u16)0xFFF3);

   
  TIMx->CCMR1 |= TIM_ICPSC;
}















 
void TIM_SetIC2Prescaler(TIM_TypeDef* TIMx, u16 TIM_ICPSC)
{
   
  ((void)0);
  ((void)0);

   
  TIMx->CCMR1 &= ((u16)0xF3FF);

   
  TIMx->CCMR1 |= (u16)(TIM_ICPSC << 8);
}















 
void TIM_SetIC3Prescaler(TIM_TypeDef* TIMx, u16 TIM_ICPSC)
{
   
  ((void)0);
  ((void)0);

   
  TIMx->CCMR2 &= ((u16)0xFFF3);

   
  TIMx->CCMR2 |= TIM_ICPSC;
}















 
void TIM_SetIC4Prescaler(TIM_TypeDef* TIMx, u16 TIM_ICPSC)
{  
   
  ((void)0);
  ((void)0);

   
  TIMx->CCMR2 &= ((u16)0xF3FF);

   
  TIMx->CCMR2 |= (u16)(TIM_ICPSC << 8);
}













 
void TIM_SetClockDivision(TIM_TypeDef* TIMx, u16 TIM_CKD)
{
   
  ((void)0);
  ((void)0);

   
  TIMx->CR1 &= ((u16)0x00FF);

   
  TIMx->CR1 |= TIM_CKD;
}







 
u16 TIM_GetCapture1(TIM_TypeDef* TIMx)
{
   
  ((void)0);

   
  return TIMx->CCR1;
}








 
u16 TIM_GetCapture2(TIM_TypeDef* TIMx)
{
   
  ((void)0);

   
  return TIMx->CCR2;
}








 
u16 TIM_GetCapture3(TIM_TypeDef* TIMx)
{
   
  ((void)0); 

   
  return TIMx->CCR3;
}








 
u16 TIM_GetCapture4(TIM_TypeDef* TIMx)
{
   
  ((void)0);

   
  return TIMx->CCR4;
}







 
u16 TIM_GetCounter(TIM_TypeDef* TIMx)
{
   
  ((void)0);

   
  return TIMx->CNT;
}







 
u16 TIM_GetPrescaler(TIM_TypeDef* TIMx)
{
   
  ((void)0);

   
  return TIMx->PSC;
}





















 
FlagStatus TIM_GetFlagStatus(TIM_TypeDef* TIMx, u16 TIM_FLAG)
{ 
  ITStatus bitstatus = RESET;  

   
  ((void)0);
  ((void)0);
  ((void)0);
  
  if ((TIMx->SR & TIM_FLAG) != (u16)RESET)
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }
  return bitstatus;
}





















 
void TIM_ClearFlag(TIM_TypeDef* TIMx, u16 TIM_FLAG)
{  
   
  ((void)0);
  ((void)0);
   
   
  TIMx->SR = (u16)~TIM_FLAG;
}


















 
ITStatus TIM_GetITStatus(TIM_TypeDef* TIMx, u16 TIM_IT)
{
  ITStatus bitstatus = RESET;  
  u16 itstatus = 0x0, itenable = 0x0;

   
  ((void)0);
  ((void)0);
  ((void)0);
   
  itstatus = TIMx->SR & TIM_IT;
  
  itenable = TIMx->DIER & TIM_IT;

  if ((itstatus != (u16)RESET) && (itenable != (u16)RESET))
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }
  return bitstatus;
}


















 
void TIM_ClearITPendingBit(TIM_TypeDef* TIMx, u16 TIM_IT)
{
   
  ((void)0);
  ((void)0);

   
  TIMx->SR = (u16)~TIM_IT;
}






















 
static void TI1_Config(TIM_TypeDef* TIMx, u16 TIM_ICPolarity, u16 TIM_ICSelection,
                       u16 TIM_ICFilter)
{
  u16 tmpccmr1 = 0, tmpccer = 0;

   
  TIMx->CCER &= ((u16)0xFFFE);

  tmpccmr1 = TIMx->CCMR1;
  tmpccer = TIMx->CCER;

   
  tmpccmr1 &= ((u16)0xFFFC) & ((u16)0xFF0F);
  tmpccmr1 |= TIM_ICSelection | (u16)(TIM_ICFilter << 4);

   
  tmpccer &= ((u16)0xFFFD);
  tmpccer |= TIM_ICPolarity | ((u16)0x0001);

   
  TIMx->CCMR1 = tmpccmr1;
  TIMx->CCER = tmpccer;
}






















 
static void TI2_Config(TIM_TypeDef* TIMx, u16 TIM_ICPolarity, u16 TIM_ICSelection,
                       u16 TIM_ICFilter)
{
  u16 tmpccmr1 = 0, tmpccer = 0, tmp = 0;

   
  TIMx->CCER &= ((u16)0xFFEF);

  tmpccmr1 = TIMx->CCMR1;
  tmpccer = TIMx->CCER;
  tmp = (u16)(TIM_ICPolarity << 4);

   
  tmpccmr1 &= ((u16)0xFCFF) & ((u16)0x0FFF);
  tmpccmr1 |= (u16)(TIM_ICFilter << 12);
  tmpccmr1 |= (u16)(TIM_ICSelection << 8);

   
  tmpccer &= ((u16)0xFFDF);
  tmpccer |=  tmp | ((u16)0x0010);

   
  TIMx->CCMR1 = tmpccmr1 ;
  TIMx->CCER = tmpccer;
}






















 
static void TI3_Config(TIM_TypeDef* TIMx, u16 TIM_ICPolarity, u16 TIM_ICSelection,
                       u16 TIM_ICFilter)
{
  u16 tmpccmr2 = 0, tmpccer = 0, tmp = 0;

   
  TIMx->CCER &= ((u16)0xFEFF);

  tmpccmr2 = TIMx->CCMR2;
  tmpccer = TIMx->CCER;
  tmp = (u16)(TIM_ICPolarity << 8);

   
  tmpccmr2 &= ((u16)0xFFFC) & ((u16)0xFF0F);
  tmpccmr2 |= TIM_ICSelection | (u16)(TIM_ICFilter << 4);

   
  tmpccer &= ((u16)0xFDFF);
  tmpccer |= tmp | ((u16)0x0100);

   
  TIMx->CCMR2 = tmpccmr2;
  TIMx->CCER = tmpccer;
}






















 
static void TI4_Config(TIM_TypeDef* TIMx, u16 TIM_ICPolarity, u16 TIM_ICSelection,
                       u16 TIM_ICFilter)
{
  u16 tmpccmr2 = 0, tmpccer = 0, tmp = 0;

   
  TIMx->CCER &= ((u16)0xEFFF);

  tmpccmr2 = TIMx->CCMR2;
  tmpccer = TIMx->CCER;
  tmp = (u16)(TIM_ICPolarity << 12);

   
  tmpccmr2 &= ((u16)0xFCFF) & ((u16)0x0FFF);
  tmpccmr2 |= (u16)(TIM_ICSelection << 8) | (u16)(TIM_ICFilter << 12);

   
  tmpccer &= ((u16)0xDFFF);
  tmpccer |= tmp | ((u16)0x1000);

   
  TIMx->CCMR2 = tmpccmr2;
  TIMx->CCER = tmpccer ;
}

 
