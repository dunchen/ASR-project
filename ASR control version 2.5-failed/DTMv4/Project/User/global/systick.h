//ϵͳ����,1msһ��,ʹ�ö�ʱ��1��� 
//systick.h
#ifndef _SYSTICK_H__
#define _SYSTICK_H__

extern volatile uint32 systick;//ϵͳ������ 
void systick_init(void);//��ʼ��ϵͳ������ 
void systick_service(void);//ϵͳ�����ж� 

#endif 
