#include "../platform.h"
#include "uart1.h"

#define UART1_RX_BUFFER_SIZE 128 /* 1,2,4,8...*/
#define UART1_TX_BUFFER_SIZE 2048 /* 1,2,4,8...*/

static char UART1_RxBuf[UART1_RX_BUFFER_SIZE];
static uint16 UART1_RxHead;
static uint16 UART1_RxTail;
static char UART1_TxBuf[UART1_TX_BUFFER_SIZE];
static uint16 UART1_TxHead;
static uint16 UART1_TxTail;

#define UART1_RX_BUFFER_MASK ( UART1_RX_BUFFER_SIZE - 1 )
#define UART1_TX_BUFFER_MASK ( UART1_TX_BUFFER_SIZE - 1 )

#if ( UART1_RX_BUFFER_SIZE & UART1_RX_BUFFER_MASK )
#error RX buffer size is not a power of 2
#endif

bool uart1_init(uint32 baudrate )  //baudrate bps,8,n,1
{
    NVIC_InitTypeDef NVIC_InitStructure;
    GPIO_InitTypeDef GPIO_InitStructure;
    USART_InitTypeDef USART_InitStructure;
   // USART_ClockInitTypeDef USART_ClockInitStructure;  
    
    UART1_RxTail = 0;
    UART1_RxHead = 0;
    UART1_TxTail = 0;
    UART1_TxHead = 0;

    /* Enable USART1, GPIOA and AFIO clocks */
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1 |
                           RCC_APB2Periph_GPIOA  |
                           RCC_APB2Periph_AFIO, ENABLE);

    /* Configure the NVIC Preemption Priority Bits */
    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_4);

    /* Enable the USART1 Interrupt */
    NVIC_InitStructure.NVIC_IRQChannel = USART1_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 6;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);

    /* Configure USART1 Rx (PA.10) as input floating */
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    /* Configure USART1 Tx (PA.09) as alternate function push-pull */
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

//  baudrate,8,N,1
    USART_InitStructure.USART_BaudRate = baudrate;  
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;  
    USART_InitStructure.USART_StopBits = USART_StopBits_1;  
    USART_InitStructure.USART_Parity = USART_Parity_No; 
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;  
    USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;  
   /*   
    USART_ClockInitStructure.USART_Clock = USART_Clock_Disable;  
    USART_ClockInitStructure.USART_CPOL = USART_CPOL_Low;  
    USART_ClockInitStructure.USART_CPHA = USART_CPHA_2Edge;  
    USART_ClockInitStructure.USART_LastBit = USART_LastBit_Disable;  
    USART_ClockInit(USART1, &USART_ClockInitStructure);  
    */
    USART_Init(USART1, &USART_InitStructure);  

    /* Enable USART1 Receive and Transmit interrupts */
    USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
    USART_ITConfig(USART1, USART_IT_TXE, ENABLE);

    /* Enable the USART1 */
    USART_Cmd(USART1, ENABLE);

    return true;
}

bool uart1_deinit(void)
{
    USART_Cmd(USART1, DISABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1,DISABLE);

    return true;
}

//void __uart1_ISR(void);
void USART1_IRQHandler(void)
{
    char data;
    uint16 tmp;

/*if(USART_GetITStatus(USART1,USART_IT_RXNE))
{   
    //����ж� 
    if(USART_GetFlagStatus(USART1, USART_FLAG_ORE))
        USART_ReceiveData(USART1);
    else */
        if(USART_GetFlagStatus(USART1,USART_FLAG_RXNE))
    { 
    data = USART_ReceiveData(USART1);
    //����������ָ��
    tmp = ( UART1_RxHead + 1 ) & UART1_RX_BUFFER_MASK;
    UART1_RxHead = tmp; //���滺����ָ��
    /*
    if ( tmp == UART1_RxTail )
        {
          //���ջ��������
        }
    */
    UART1_RxBuf[tmp] = data; //���������ͻ���
    }
//}

//�����ж�
//if(USART_GetITStatus(USART1,USART_IT_TXE))
if(USART_GetFlagStatus(USART1,USART_FLAG_TXE))
{
    //����Ƿ��޴���
    if ( UART1_TxHead != UART1_TxTail )
        {
        //����������ָ��
        tmp = ( UART1_TxTail + 1 ) & UART1_TX_BUFFER_MASK;
        UART1_TxTail = tmp; //������ֵ
        USART_SendData(USART1,UART1_TxBuf[tmp]); //��ʼ����
        }
    else
        {
          USART_ITConfig(USART1, USART_IT_TXE, DISABLE);//���ж� 
        }
}

}
    
//�ӽ��ջ�����ȡ����
char uart1_getc( void )
{   
    uint16 tmptail;
    
    while ( UART1_RxHead == UART1_RxTail ) //�ȴ���������
        ;
    tmptail = ( UART1_RxTail + 1 ) & UART1_RX_BUFFER_MASK;//����������ָ��
    UART1_RxTail = tmptail; //���滺����ָ��	
    
	return UART1_RxBuf[tmptail]; //��������
}

//���ͻ�����������
void uart1_putc(char c )
{  
    uint16 tmphead;

    //���㻺����ָ��
    tmphead = ( UART1_TxHead + 1 ) & UART1_TX_BUFFER_MASK; 
    //�ȴ��������ռ�
    while ( tmphead == UART1_TxTail );
    UART1_TxBuf[tmphead] = c; //�򻺳���д������
    UART1_TxHead = tmphead;      //���滺����ָ��
    USART_ITConfig(USART1, USART_IT_TXE, ENABLE);//���ж� 
}

bool uart1_datainrxbuffer( void )
{
    return (bool)( UART1_RxHead != UART1_RxTail );
}

void uart1_rx_start(void)
{
    setb(USART1->CR1,2);//Receive Enable
}

void uart1_rx_stop(void)
{
     clr(USART1->CR1,2);//Receive Disable
}


void uart1_puts(char *src)
{
    while(*src!='\0')
    {
        uart1_putc(*src);
        src++;
    }
}

void uart1_gets(uint8 *dst,uint8 length)
{
    length--;
    while(uart1_datainrxbuffer()&&length)
    {
        *dst=uart1_getc();
        dst++;
        length--;
    }
    *dst='\0';
}

/*
void uart1_putpgms(__flash char *src)
{
    while(*src!='\0')
    {
        uart1_putc(*src);
        src++;
    }
}
*/

void uart1_clearrxbuffer(void)
{
    while(uart1_datainrxbuffer())
    {
        uart1_getc();
    }
}

void uart1_senddata(uint8 *pdata,uint16 length)
{
    while(length--)
    {
        uart1_putc(*pdata);
        pdata++;
    }
}

uint16 uart1_recvdata(uint8 *pdata, uint16 limit)
{
    uint16 length;
    
    if(UART1_RxHead == UART1_RxTail) return 0;
	//�������򲻽���

	if(UART1_RxHead > UART1_RxTail)
		length = UART1_RxHead - UART1_RxTail;
  	else
  	 	length = UART1_RxHead + UART1_RX_BUFFER_SIZE - UART1_RxTail;
	//�������ݳ���

    if(length < limit)
		length = limit;
    else
        limit = length;//use limit to save retval
    
    while(length)
	{
        *pdata = uart1_getc();
		pdata++;
		length--;
	}
    
    return limit;
}
