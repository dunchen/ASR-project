//Delay functions for STM32
//YOU MUST USE THIS DELAY.H ONLY WITH STM32 CPU

#ifndef _DELAY_H__
#define _DELAY_H__

void delay_1us(void);

void delay_nus(vu32 n);

void delay_1ms(void);

void delay_nms(vu32 n);

#endif
