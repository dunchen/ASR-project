//STM32
#ifndef _UART1_H__
#define _UART1_H__

void uart1_puts(char *src);
void uart1_gets(uint8 *dst,uint8 length); //length 为 dst 锟斤拷锟斤拷锟缴的筹拷锟斤拷
//void uart_putpgms(__flash char *src);

void uart1_putc(char c);
char uart1_getc(void);
bool uart1_init(uint32 baudrate);
bool uart1_deinit(void);
bool uart1_datainrxbuffer(void);
void uart1_clearrxbuffer(void);

void uart1_rx_start(void);
void uart1_rx_stop(void);

void uart1_senddata(uint8 *pdata,uint16 length);//发数据
uint16 uart1_recvdata(uint8 *pdata, uint16 limit);//收数据,返回实际接收到的数据长度

//void __uart1_ISR(void);
//用USART1_IRQHandler()替代 

#endif
