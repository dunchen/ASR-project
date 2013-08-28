//虚拟定时器
#ifndef _VTIMER_H__
#define _VTIMER_H__

#define VTIMER_NULL       255           //无效定时器号 

bool vtimer_ovf(uint8 n);               //是否时间到 
void vtimer_service(void);              //服务进程函数,每个系统节拍中调用一次
void vtimer_init(void);                 //初始化虚拟定时器
void vtimer_set(uint8 n,uint32 t);              //n号定时器定时长度设定为t个系统节拍
uint8 vtimer_alloc(void);               //申请一个定时器,返回255表示没有多余定时器了
void vtimer_free(uint8 n);              //释放一个不需要用的定时器

#endif
