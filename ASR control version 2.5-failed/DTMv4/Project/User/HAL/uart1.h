//STM32
#ifndef _UART1_H__
#define _UART1_H__

void uart1_puts(char *src);
void uart1_gets(uint8 *dst,uint8 length); //length Ϊ dst �����ɵĳ���
//void uart_putpgms(__flash char *src);

void uart1_putc(char c);
char uart1_getc(void);
bool uart1_init(uint32 baudrate);
bool uart1_deinit(void);
bool uart1_datainrxbuffer(void);
void uart1_clearrxbuffer(void);

void uart1_rx_start(void);
void uart1_rx_stop(void);

void uart1_senddata(uint8 *pdata,uint16 length);//������
uint16 uart1_recvdata(uint8 *pdata, uint16 limit);//������,����ʵ�ʽ��յ������ݳ���

//void __uart1_ISR(void);
//��USART1_IRQHandler()��� 

#endif
