//systick.c

#include "../platform.h" 
#include "../hardware.h"

#include "systick.h"

volatile uint32 systick; 

//1ms����һ�� 
void systick_service(void)
{
  static uint8 div1 = 0;
  
  systick++;
  
  //�������
  vtimer_service();
  div1++;
  if( div1 >= 10 )
  {
    div1 = 0;
    disk_timerproc();
  }
//  ADC_process();
 // beep_service();
  //key_service();
  //backlight_service(); 

} 

//Ӳ����غ��� 
void systick_init(void)
{
    systick = 0;
    
    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_4);//no subpriority
//Configure Systick   
    SysTick_Config(9000);
    SysTick_CLKSourceConfig(SysTick_CLKSource_HCLK_Div8);
    NVIC_SetPriority(SysTick_IRQn,3);
}



