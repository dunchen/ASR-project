#include "stm32f10x_flash.h"
typedef unsigned short u_short;
typedef unsigned long u_long;
typedef unsigned char u_char;
typedef unsigned long u_int;

#define FLASH_PAGE_SIZE    ((u_short)0x800) /*page size is 2048 byte*/
#define BANK_WRITE_START_ADDR  (u_long)(0x08000000 + 382*1024)
#define BANK_WRITE_END_ADDR    (u_long)(0x08000000 + 384*1024)
extern int eeReadHalfWord(u_long);
extern int eeReadWord(u_long);
extern int eeCheckBlockFlash(u_long, u_short);
extern int eeWriteHalfWord(u_long, u_short);
extern int eeWriteWord(u_long, u_long);
extern int eeWriteMultiHalfWord(u_long, const u_short *, u_short);
extern int eeWriteMultiWord(u_long, const u_long *, u_short);
extern int eeReadMultiHalfWord(u_short *, u_long, u_short);
extern int eeReadMultiWord(u_long *, u_long, u_short);




