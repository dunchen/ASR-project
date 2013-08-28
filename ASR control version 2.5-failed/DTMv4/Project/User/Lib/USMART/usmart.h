#ifndef __USMART_H
#define __USMART_H	  	
//////////////////////////////////////////////////////////////////////////////////	 
//本程序只供学习使用，未经作者许可，不得用于其它任何用途
//ALIENTEK STM32开发板	   
//正点原子@ALIENTEK
//技术论坛:www.openedv.com
//修改日期:2011/6/13
//版本：V2.0
//版权所有，盗版必究。
//Copyright(C) 正点原子 2011-2021
//All rights reserved
//********************************************************************************
//升级说明
//V1.4
//增加了对参数为string类型的函数的支持.适用范围大大提高.
//优化了内存占用,静态内存占用为79个字节@10个参数.动态适应数字及字符串长度
//V2.0,
//1,修改了list指令,打印函数的完整表达式.
//2,增加了id指令,打印每个函数的入口地址.
//3,修改了参数匹配,支持函数参数的调用(输入入口地址).
//4,增加了函数名长度宏定义.			  
/////////////////////////////////////////////////////////////////////////////////////
//USMART资源占用情况@MDK 3.80A：
//FLASH:2492字节~3152字节(通过USMART_USE_HELP设置)
//SRAM:72字节(最少的情况下)
//SRAM计算公式:   SRAM=PARM_LEN+72-4  其中PARM_LEN必须大于等于4.
//应该保证堆栈不小于100个字节.
////////////////////////////////////////////用户配置参数////////////////////////////////////////////////////	  
#define __MAX_FNAME_LEN 	30	//函数名最大长度，应该设置为不小于最长函数名的长度。											   
#define __MAX_PARM 	     	10	//最大为10个参数 ,修改此参数,必须修改usmart_exe与之对应.
#define __PARM_LEN 		    4	//所有参数之和的长度不超过PARM_LEN个字节,注意串口接收部分要与之对应(不小于PARM_LEN)


#define USMART_USE_HELP	1	//使用帮助，该值设为0，可以节省近700个字节，但是将导致无法显示帮助信息。
///////////////////////////////////////////////END///////////////////////////////////////////////////////////

#define USMART_OK 			0  //无错误
#define USMART_FUNCERR 		1  //函数错误
#define USMART_PARMERR 		2  //参数错误
#define USMART_PARMOVER 	3  //参数溢出
#define USMART_NOFUNCFIND 	4  //未找到匹配函数

 //函数名列表	 
struct _m_usmart_nametab
{
	void* func;			//函数指针
	const u8* name;		//函数名(查找串)	 
};
//usmart控制管理器
struct _m_usmart_dev
{
	struct _m_usmart_nametab *funs;	//函数名指针
	void (*init)(void);				//初始化
	u8 (*cmd_rec)(u8*str);			//识别函数名及参数
	void (*exe)(void); 				//执行 
	void (*scan)(void);             //扫描
	u8 fnum; 				  		//函数数量
	u8 pnum;                        //参数数量
	u8 id;							//函数id
	u16 parmtype;					//参数的类型
	u8  plentbl[__MAX_PARM];  		//每个参数的长度暂存表
	u8  parm[__PARM_LEN];  			//函数的参数
};
extern struct _m_usmart_nametab usmart_nametab[];	//在usmart_config.c里面定义
extern struct _m_usmart_dev usmart_dev;				//在usmart_config.c里面定义


void usmart_init(void);		//初始化
u8 usmart_cmd_rec(u8*str);	//识别
void usmart_exe(void);		//执行
void usmart_scan(void);     //扫描
#endif






























