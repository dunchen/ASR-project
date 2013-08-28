#include <stm32f10x_lib.h>
#include "sys.h"
#include "usart.h"		
#include "delay.h"	
#include "led.h" 
#include "key.h"
#include "exti.h"
#include "wdg.h"
#include "timer.h"
#include "lcd.h"	  

#include "usmart.h" 
//LED状态设置函数
void led_set(u8 sta)
{
	LED1=sta;
} 
//函数参数调用测试函数
void test_fun(void(*ledset)(u8),u8 sta)
{
	ledset(sta);
}  
//Mini STM32开发板扩展实验9
//USMART应用 实验
//正点原子@ALIENTEK
//技术论坛:www.openedv.com		
int main(void)
{			   
  	Stm32_Clock_Init(9);//系统时钟设置
	delay_init(72);		//延时初始化
	uart_init(72,9600); //串口1初始化  
	LED_Init();
 	LCD_Init();
	usmart_dev.init();	//初始化USMART				 	
	POINT_COLOR=RED;
	LCD_ShowString(30,50,"Mini STM32 ^_^");	
	LCD_ShowString(30,70,"USMART TEST");	
	LCD_ShowString(30,90,"ATOM@ALIENTEK");
	LCD_ShowString(30,110,"2011/6/18");	  
  	while(1) 
	{		 	  
		LED0=!LED0;					 
		delay_ms(500);	
	}											    
}

























