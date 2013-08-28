//Engine Test Process

#include "../platform.h"
#include "../hardware.h"
#include "app_test.h"

#include "app_display.h"

#define     USE_SD_SAVE
//#define     USE_USB_UPLOAD
//#define     USE_USB_MSG
#define     USE_CALIBRATION
//instant cal./use preconfigured calibration value instead

//#define     USE_DISPLAY

#ifdef USE_CALIBRATION
int32 loadcell_avg;
int32 pressure_avg;
uint8 cal_state = 2;
char  cal_str[16];
uint8 cal_tmr;
#define KEY_CAL (!GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_13))
#endif

static int32 loadcell_offset = 11025;
static float loadcell_scale  = 13000.0;
#ifdef USE_USB_UPLOAD
char loadcell_str[16];
#endif

static int32 pressure_offset = 1092;
static float pressure_scale  = 273.0;
#ifdef USE_USB_UPLOAD
char pressure_str[16];
#endif

#ifdef USE_CALIBRATION
void cal_init(void)
{
  GPIO_InitTypeDef p;

  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC,ENABLE);
  p.GPIO_Mode = GPIO_Mode_IPU;
  p.GPIO_Pin = GPIO_Pin_13;
  p.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOC,&p);
}
#endif


void stm32_adc_process(uint8 ch,uint16 v)
{
  if(ch != 3) return;
#ifdef USE_CALIBRATION
  if(cal_state)
  {
    if(cal_state == 2)
    {
      cal_state--;
      pressure_avg = v;
    }
    else
      pressure_avg = (pressure_avg+v)/2;
    return;
  }
#endif
  
#ifdef USE_DISPLAY
  if(display_is_OFD())
    display_set(DISP_PRESSURE,((float)(v-pressure_offset)/pressure_scale));
#endif
  
#ifdef USE_USB_UPLOAD
  sprintf(pressure_str,"P,%d\n",v);
  USBCDC_senddata((uint8 *)pressure_str,strlen(pressure_str));
/*
  pressure_str[0] = 'P';
  pressure_str[1] = ':';
  pressure_str[2] = v;//2,3
  pressure_str[4] = '\n';
  USBCDC_senddata((uint8 *)pressure_str,5);
*/
#endif

}

void ads1256_process(uint8 input_id,int32 v)
{
#ifdef USE_CALIBRATION
  if(cal_state)
  {
    if(cal_state == 2)
    {
      cal_state--;
      loadcell_avg = v;
    }
    else
      loadcell_avg = (loadcell_avg+v)/2;
    return;
  }
#endif
  
#ifdef USE_USB_UPLOAD
  sprintf(loadcell_str,"T,%d\n",v);
  USBCDC_senddata((uint8 *)loadcell_str,strlen(loadcell_str));
/*    loadcell_str[0] = 'T';
    loadcell_str[1] = ':';
    loadcell_str[2] = v;//2,3,4,5
    loadcell_str[6] = '\n';
    USBCDC_senddata((uint8 *)loadcell_str,7);
*/
#endif
#ifdef USE_DISPLAY
  if(display_is_OFD())
    display_set(DISP_THURST,((float)(v-loadcell_offset)/loadcell_scale));
#endif
}

void app_test(void)
{
#ifdef USE_USB_MSG
  USBCDC_init();
  while(!USBCDC_isready());
  delay_nms(5000);
  USBCDC_senddata("pwr on\n",7);
#endif

#ifdef USE_DISPLAY
  display_init();
#endif
  
  ads1256_set_forward(ads1256_process);
  ads1256_init();
  ADC_set_forward(stm32_adc_process);
  ADC_init();
  
#ifdef USE_USB_MSG
  USBCDC_senddata("adc init ok\n",12);
#endif
  
#ifdef USE_CALIBRATION
  
#ifdef USE_USB_MSG
  USBCDC_senddata("start calibration\n",18);
#endif
  
  cal_tmr = vtimer_alloc();
  cal_init();
  
  //zero cal.
  cal_state = 2;
  while(!KEY_CAL)
  {
#ifdef USE_USB_MSG
    sprintf(cal_str,"loadcell:%d\n",loadcell_avg);
    USBCDC_senddata((uint8 *)cal_str,strlen(cal_str));
    sprintf(cal_str,"pressure:%d\n",pressure_avg);
    USBCDC_senddata((uint8 *)cal_str,strlen(cal_str));
    vtimer_set(cal_tmr,500);
    while(!vtimer_ovf(cal_tmr))
    {
      if(KEY_CAL) break;
    }
#endif
  }
  
  loadcell_offset = loadcell_avg;
  pressure_offset = pressure_avg;
  
#ifdef USE_USB_MSG
  USBCDC_senddata((uint8 *)"Tzero:",6);
  sprintf(cal_str,"%d\n",loadcell_offset);
  USBCDC_senddata((uint8 *)cal_str,strlen(cal_str));
  
  USBCDC_senddata((uint8 *)"Pzero:",6);
  sprintf(cal_str,"%d\n",pressure_offset);
  USBCDC_senddata((uint8 *)cal_str,strlen(cal_str));
  
  USBCDC_sync();
#endif  

  delay_nms(3000);
  
  cal_state = 2;
  //scale cal.
  while(!KEY_CAL)
  {
#ifdef USE_USB_MSG
    sprintf(cal_str,"scale:%d\n",loadcell_avg);
    USBCDC_senddata((uint8 *)cal_str,strlen(cal_str));
    vtimer_set(cal_tmr,500);
    while(!vtimer_ovf(cal_tmr)) 
    {
      if(KEY_CAL) break;
    }
#endif
  }
  
  loadcell_scale = 2000.0/(loadcell_avg - loadcell_offset);

#ifdef USE_USB_MSG
  USBCDC_senddata((uint8 *)"Tscale:",7);
  sprintf(cal_str,"%f/kg\n",loadcell_scale);
  USBCDC_senddata((uint8 *)cal_str,strlen(cal_str));
  
  USBCDC_senddata((uint8 *)"Pscale:",7);
  sprintf(cal_str,"%f/kg\n",pressure_scale);
  USBCDC_senddata((uint8 *)cal_str,strlen(cal_str));
  
  USBCDC_sync();
#endif
  
  delay_nms(3000);

  cal_state = 0;
#endif
  while(1);
}
