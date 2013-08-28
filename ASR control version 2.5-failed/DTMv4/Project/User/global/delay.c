//Delay functions for STM32
//YOU MUST USE THIS DELAY.C ONLY WITH STM32 CPU

#include "../platform.h"
#include "delay.h"

//Adjust x in "n = x" to fit cpu frequency
void delay_1us(void)
{
vu8 n = 8;
while(n--) asm("NOP");
}

void delay_nus(vu32 n)
{
  while(n--)
    delay_1us();
}

void delay_1ms(void)
{
delay_nus(1000);
}

void delay_nms(vu32 n)
{
while(n--) delay_1ms();
}
