//���ⶨʱ��
#ifndef _VTIMER_H__
#define _VTIMER_H__

#define VTIMER_NULL       255           //��Ч��ʱ���� 

bool vtimer_ovf(uint8 n);               //�Ƿ�ʱ�䵽 
void vtimer_service(void);              //������̺���,ÿ��ϵͳ�����е���һ��
void vtimer_init(void);                 //��ʼ�����ⶨʱ��
void vtimer_set(uint8 n,uint32 t);              //n�Ŷ�ʱ����ʱ�����趨Ϊt��ϵͳ����
uint8 vtimer_alloc(void);               //����һ����ʱ��,����255��ʾû�ж��ඨʱ����
void vtimer_free(uint8 n);              //�ͷ�һ������Ҫ�õĶ�ʱ��

#endif
