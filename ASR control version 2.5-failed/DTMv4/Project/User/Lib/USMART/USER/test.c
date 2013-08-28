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
//LED״̬���ú���
void led_set(u8 sta)
{
	LED1=sta;
} 
//�����������ò��Ժ���
void test_fun(void(*ledset)(u8),u8 sta)
{
	ledset(sta);
}  
//Mini STM32��������չʵ��9
//USMARTӦ�� ʵ��
//����ԭ��@ALIENTEK
//������̳:www.openedv.com		
int main(void)
{			   
  	Stm32_Clock_Init(9);//ϵͳʱ������
	delay_init(72);		//��ʱ��ʼ��
	uart_init(72,9600); //����1��ʼ��  
	LED_Init();
 	LCD_Init();
	usmart_dev.init();	//��ʼ��USMART				 	
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

























