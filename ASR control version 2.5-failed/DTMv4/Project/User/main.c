//Dynamic Torque Monitor V4
//FW V0.2

#include "platform.h"
#include "hardware.h"
#include "applications.h"

#include "init.c"

//#include "lib/fir_coefs_50Hz.h"


#define PIN_STOP  (!GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_1))

char str[96];
int32 current_value;

//file system objects
FATFS fs;
FIL f;

//data buffer
#define BUFF_SIZE   		 4096  		 
#define BUFF_POS_MASK 		 (BUFF_SIZE-1)


uint8 buff[BUFF_SIZE];
//volatile bool writing_buff = false;// true -> writing, false -> not writing
volatile uint16 wpos = 0;
volatile uint16 rpos = 0;

bool in_rec_loop = false;

void error_handle(TCHAR *msg)
{
    in_rec_loop = false;
    f_close(&f);
    uart1_puts("Error:");
    uart1_puts(msg);
    uart1_puts("stop recording\n");
    while(1)
    {
         if(PIN_STOP)
            NVIC_SystemReset();
    }
}

void clear_buffer(void)
{
    uint16 i;
    for(i=0;i<BUFF_SIZE;i++)
        buff[i] = 0;
}

void openfile(void)
{
    FRESULT res;
    uint16 f_id;
    TCHAR fmt[] = "log%d.bin";
    TCHAR fname[13];//8.3 format / NO LONG FILE NAME SUPPORTS
    
    f_id = 1;
    while(f_id <= 9999)// from 1 to 9999
    {
        sprintf(fname,fmt,f_id);//make filename
        res = f_open(&f,fname,FA_READ|FA_OPEN_EXISTING);
        //try to open that file
        switch(res)
        {
            case FR_NO_FILE:
                //this filename is available
                uart1_puts("Write data to: ");
                uart1_puts(fname);
                uart1_puts("\n\n");
                f_close(&f);
                                
                //open output file 
                res = f_open(&f,fname,FA_WRITE|FA_CREATE_NEW);
				uart1_puts("MemCard:caught filename ");
				uart1_puts(fname);
				uart1_puts("\n");
                if(res != FR_OK)//catched an error
                {
		    uart1_puts("Error:");
		    uart1_putc(res+'0');
		    uart1_puts("\n");
                    error_handle("MemCard:cannot open output file\n");
                }
                return;
            case FR_OK:
                f_id++;
                continue;
            default:
                error_handle("MemCard:cannot find usable file id\n");
        }
    }
}

void process(int32 value)
{
    uint16 wptr;
    
    current_value = value;
    
    LD4_1;
    
    wptr = wpos;
    wpos=(wpos+5)&BUFF_POS_MASK;
    buff[wptr]=0xfd;
    wptr=(wptr+1)&BUFF_POS_MASK;
    buff[wptr]=((uint8 *)&value)[0];
    wptr=(wptr+1)&BUFF_POS_MASK;
    buff[wptr]=((uint8 *)&value)[1];
    wptr=(wptr+1)&BUFF_POS_MASK;
    buff[wptr]=((uint8 *)&value)[2];
    wptr=(wptr+1)&BUFF_POS_MASK;
    buff[wptr]=((uint8 *)&value)[3];
    
    LD4_0;
}

/*
void p_hook(uint8 ch,uint16 val)
{
    uint8 id = 0xfd;
    uart1_senddata((uint8 *)&id,1);
    uart1_senddata((uint8 *)&val,2);
}
*/

int main(void)
{
    //long i;
    //long j;
    FRESULT res;
    unsigned int datawritten;
//    uint32 size;
    uint16 length;
    uint8 tmr;
    uint32 sec;
    GPIO_InitTypeDef GPIO_InitStructure;
    
    //STM32Init();
    //Minikit_init();
    SystemInit();
    vtimer_init();
    systick_init();
    //Minikit_init();
    //usb_config();
    uart1_init(115200);
    uart1_puts("Board = DTM V4, FW = 0.3b\n");
    
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
    //ADC_set_forward(p_hook);
    //ADC_init();
    
    f_mount(0,&fs);
    
    //Memory Card
    uart1_puts("Wait for MemCard\n");
    while(disk_initialize(0) != 0)
    {
        if(PIN_STOP)
            NVIC_SystemReset();
    }
    uart1_puts("MemCard Init OK\n");
    
    delay_nms(10);
    openfile();
    
    clear_buffer();
    
    ads1256_init(process);
    
    rpos = 0;
    wpos = 0;
    tmr = vtimer_alloc();
    sec = 0;
    in_rec_loop = true;
    vtimer_set(tmr,500);
    while(in_rec_loop)
    {
        
	if(PIN_STOP) in_rec_loop = false;
	//if(in_write) continue;
		
        if(vtimer_ovf(tmr))
        {
            vtimer_set(tmr,500);
            sec++;
            sprintf(str,"%.1f,",sec/2.0);
            uart1_puts(str);
            sprintf(str,"%ld\n",current_value);
            uart1_puts(str);
        }
        
        if(wpos > rpos)
            length = wpos - rpos;
        else if(wpos < rpos)
            length = BUFF_SIZE - rpos;   
        else continue;

	//if(length > BUFF_SIZE/2) uart0_puts("buff half full\n");
		
        LD3_1;
        res = f_write(&f,buff+rpos,length,&datawritten);
        LD3_0;
	
        if(res != FR_OK || datawritten < length)
        {
	    //kprintf("Error:%d  ",res);
//	    kprintf("W:%d\n",datawritten);
            error_handle("MemCard:write error\n");
        }
		
	rpos = (rpos+datawritten)&BUFF_POS_MASK;
    }
    
    uart1_puts("Stop recording\n");
    f_close(&f);
    
    delay_nms(1000);
    while(!PIN_STOP);
        NVIC_SystemReset();
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  */
void assert_failed(uint8_t* file, uint32_t line)
{
    /* User can add his own implementation to report the file name and line number,
       ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
    LED_FAULT_1;
    /* Infinite loop */
    while (1)
    {
    }
}
#endif
