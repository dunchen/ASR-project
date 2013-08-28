//ADC driver for ECG application on STM32 --header
//ECG_ADC.h

#ifndef _STM32_ADC_H__
#define _STM32_ADC_H__

void ADC_init(void);
void ADC_process(void);
//call it in 1kHz
void __ADC_INT(void);
void ADC_set_forward(void (*)(uint8,uint16));
//Channel number,conversion result
void ADC_calibration(void);

#endif
