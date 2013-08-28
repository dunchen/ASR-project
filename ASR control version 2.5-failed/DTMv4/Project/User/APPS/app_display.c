#include "../platform.h"
#include "../hardware.h"
#include "app_display.h"

static uint8 decim;
#define REFRESH_DELAY   500
//refresh period in ms

void display_init(void)
{
    decim = vtimer_alloc();
    PWM_init();   
    vtimer_set(decim,0);
}

bool display_is_OFD(void)
{
    return (bool)vtimer_ovf(decim);
}

void display_set(uint8 channel,float value)
{
    static float ch1,ch2,ch3;
    switch(channel)
    {
        case DISP_THURST:
             ch1 =  value/98.1/3.3*65535;
             break;
        case DISP_PRESSURE:
             ch2 =  value/3.3*65535;
             break;
        case DISP_TEMP:
             ch3 =  value/100/3.3*65535;
             break;
    }     
    if(!vtimer_ovf(decim)) return;
    PWM_set(1,(uint16)ch1);
    PWM_set(2,(uint16)ch2);
    PWM_set(3,(uint16)ch3);
    vtimer_set(decim,REFRESH_DELAY);
}
