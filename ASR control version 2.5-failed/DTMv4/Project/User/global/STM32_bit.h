#ifndef _STM32_BIT__
#define _STM32_BIT__


#define setb(ADDR,BIT) ((ADDR)|= (1<<(BIT)))
#define clr(ADDR,BIT)  ((ADDR)&=~(1<<(BIT)))
#define get(ADDR,BIT)  ((ADDR)&  (1<<(BIT)))

#endif
