#line 1 "library\\src\\stm32f10x_exti.c"













 

 
#line 1 ".\\library\\inc\\stm32f10x_exti.h"














 

 



 
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



 
#line 18 "library\\src\\stm32f10x_exti.c"

 
 


 
 
 
 








 
void EXTI_DeInit(void)
{
  ((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->IMR = 0x00000000;
  ((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->EMR = 0x00000000;
  ((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->RTSR = 0x00000000; 
  ((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->FTSR = 0x00000000; 
  ((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->PR = 0x0007FFFF;
}










 
void EXTI_Init(EXTI_InitTypeDef* EXTI_InitStruct)
{
   
  ((void)0);
  ((void)0);
  ((void)0);  
  ((void)0);
     
  if (EXTI_InitStruct->EXTI_LineCmd != DISABLE)
  {
     
    ((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->IMR &= ~EXTI_InitStruct->EXTI_Line;
    ((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->EMR &= ~EXTI_InitStruct->EXTI_Line;
    
    *(vu32 *)(((((u32)0x40000000) + 0x10000) + 0x0400) + (u32)EXTI_InitStruct->EXTI_Mode)|= EXTI_InitStruct->EXTI_Line;

     
    ((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->RTSR &= ~EXTI_InitStruct->EXTI_Line;
    ((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->FTSR &= ~EXTI_InitStruct->EXTI_Line;
    
     
    if (EXTI_InitStruct->EXTI_Trigger == EXTI_Trigger_Rising_Falling)
    {
       
      ((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->RTSR |= EXTI_InitStruct->EXTI_Line;
      ((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->FTSR |= EXTI_InitStruct->EXTI_Line;
    }
    else
    {
      *(vu32 *)(((((u32)0x40000000) + 0x10000) + 0x0400) + (u32)EXTI_InitStruct->EXTI_Trigger)|= EXTI_InitStruct->EXTI_Line;
    }
  }
  else
  {
     
    *(vu32 *)(((((u32)0x40000000) + 0x10000) + 0x0400) + (u32)EXTI_InitStruct->EXTI_Mode)&= ~EXTI_InitStruct->EXTI_Line;
  }
}








 
void EXTI_StructInit(EXTI_InitTypeDef* EXTI_InitStruct)
{
  EXTI_InitStruct->EXTI_Line = ((u32)0x00000);
  EXTI_InitStruct->EXTI_Mode = EXTI_Mode_Interrupt;
  EXTI_InitStruct->EXTI_Trigger = EXTI_Trigger_Falling;
  EXTI_InitStruct->EXTI_LineCmd = DISABLE;
}










 
void EXTI_GenerateSWInterrupt(u32 EXTI_Line)
{
   
  ((void)0);
  
  ((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->SWIER |= EXTI_Line;
}









 
FlagStatus EXTI_GetFlagStatus(u32 EXTI_Line)
{
  FlagStatus bitstatus = RESET;

   
  ((void)0);
  
  if ((((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->PR & EXTI_Line) != (u32)RESET)
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }
  return bitstatus;
}









 
void EXTI_ClearFlag(u32 EXTI_Line)
{
   
  ((void)0);
  
  ((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->PR = EXTI_Line;
}









 
ITStatus EXTI_GetITStatus(u32 EXTI_Line)
{
  ITStatus bitstatus = RESET;
  u32 enablestatus = 0;

   
  ((void)0);
  
  enablestatus =  ((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->IMR & EXTI_Line;

  if (((((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->PR & EXTI_Line) != (u32)RESET) && (enablestatus != (u32)RESET))
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }
  return bitstatus;
}









 
void EXTI_ClearITPendingBit(u32 EXTI_Line)
{
   
  ((void)0);
  
  ((EXTI_TypeDef *) ((((u32)0x40000000) + 0x10000) + 0x0400))->PR = EXTI_Line;
}

 
