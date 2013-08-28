//hardware drivers

#include "HAL/Minikit.h"
//#include "HAL/USBCDC/USBCDC.h"
//#include "HAL/loadcell.h"
#include "HAL/STM32_ADC.h"
//#include "HAL/STM32_PWM.h"
#include "HAL/ads1256.h"
#include "HAL/uart1.h"
#include "Lib/FATFS/diskio.h"

//On STM32 Minikit
#define LED_FAULT_1   GPIO_SetBits(GPIOB, GPIO_Pin_8)
#define LED_FAULT_0   GPIO_ResetBits(GPIOB, GPIO_Pin_8)
