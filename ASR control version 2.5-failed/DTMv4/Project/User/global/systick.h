//系统节拍,1ms一次,使用定时器1完成 
//systick.h
#ifndef _SYSTICK_H__
#define _SYSTICK_H__

extern volatile uint32 systick;//系统节拍数 
void systick_init(void);//初始化系统节拍器 
void systick_service(void);//系统节拍中断 

#endif 
