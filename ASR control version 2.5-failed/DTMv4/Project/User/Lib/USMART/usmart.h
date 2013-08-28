#ifndef __USMART_H
#define __USMART_H	  	
//////////////////////////////////////////////////////////////////////////////////	 
//������ֻ��ѧϰʹ�ã�δ��������ɣ��������������κ���;
//ALIENTEK STM32������	   
//����ԭ��@ALIENTEK
//������̳:www.openedv.com
//�޸�����:2011/6/13
//�汾��V2.0
//��Ȩ���У�����ؾ���
//Copyright(C) ����ԭ�� 2011-2021
//All rights reserved
//********************************************************************************
//����˵��
//V1.4
//�����˶Բ���Ϊstring���͵ĺ�����֧��.���÷�Χ������.
//�Ż����ڴ�ռ��,��̬�ڴ�ռ��Ϊ79���ֽ�@10������.��̬��Ӧ���ּ��ַ�������
//V2.0,
//1,�޸���listָ��,��ӡ�������������ʽ.
//2,������idָ��,��ӡÿ����������ڵ�ַ.
//3,�޸��˲���ƥ��,֧�ֺ��������ĵ���(������ڵ�ַ).
//4,�����˺��������Ⱥ궨��.			  
/////////////////////////////////////////////////////////////////////////////////////
//USMART��Դռ�����@MDK 3.80A��
//FLASH:2492�ֽ�~3152�ֽ�(ͨ��USMART_USE_HELP����)
//SRAM:72�ֽ�(���ٵ������)
//SRAM���㹫ʽ:   SRAM=PARM_LEN+72-4  ����PARM_LEN������ڵ���4.
//Ӧ�ñ�֤��ջ��С��100���ֽ�.
////////////////////////////////////////////�û����ò���////////////////////////////////////////////////////	  
#define __MAX_FNAME_LEN 	30	//��������󳤶ȣ�Ӧ������Ϊ��С����������ĳ��ȡ�											   
#define __MAX_PARM 	     	10	//���Ϊ10������ ,�޸Ĵ˲���,�����޸�usmart_exe��֮��Ӧ.
#define __PARM_LEN 		    4	//���в���֮�͵ĳ��Ȳ�����PARM_LEN���ֽ�,ע�⴮�ڽ��ղ���Ҫ��֮��Ӧ(��С��PARM_LEN)


#define USMART_USE_HELP	1	//ʹ�ð�������ֵ��Ϊ0�����Խ�ʡ��700���ֽڣ����ǽ������޷���ʾ������Ϣ��
///////////////////////////////////////////////END///////////////////////////////////////////////////////////

#define USMART_OK 			0  //�޴���
#define USMART_FUNCERR 		1  //��������
#define USMART_PARMERR 		2  //��������
#define USMART_PARMOVER 	3  //�������
#define USMART_NOFUNCFIND 	4  //δ�ҵ�ƥ�亯��

 //�������б�	 
struct _m_usmart_nametab
{
	void* func;			//����ָ��
	const u8* name;		//������(���Ҵ�)	 
};
//usmart���ƹ�����
struct _m_usmart_dev
{
	struct _m_usmart_nametab *funs;	//������ָ��
	void (*init)(void);				//��ʼ��
	u8 (*cmd_rec)(u8*str);			//ʶ������������
	void (*exe)(void); 				//ִ�� 
	void (*scan)(void);             //ɨ��
	u8 fnum; 				  		//��������
	u8 pnum;                        //��������
	u8 id;							//����id
	u16 parmtype;					//����������
	u8  plentbl[__MAX_PARM];  		//ÿ�������ĳ����ݴ��
	u8  parm[__PARM_LEN];  			//�����Ĳ���
};
extern struct _m_usmart_nametab usmart_nametab[];	//��usmart_config.c���涨��
extern struct _m_usmart_dev usmart_dev;				//��usmart_config.c���涨��


void usmart_init(void);		//��ʼ��
u8 usmart_cmd_rec(u8*str);	//ʶ��
void usmart_exe(void);		//ִ��
void usmart_scan(void);     //ɨ��
#endif






























