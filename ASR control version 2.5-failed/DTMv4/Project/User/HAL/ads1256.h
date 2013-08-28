//ads1256 simple driver
#ifndef __ADS1256_H__
#define __ADS1256_H__

uint8 ads1256_init(void (*f)(int32 data));
//initialize adc, return chip id
void ads1256_deinit(void);
//power down adc
void ads1256_NDRDY_ISR(void);
//#DRDY下降沿中断的服务函数，需要自己定义 
void ads1256_spi_recv_ISR(void);
//SPI收数据中断函数，用于连续读取 
#endif
