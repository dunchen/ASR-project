#ifndef __APP_DISPLAY_H__
#define __APP_DISPLAY_H__

#define DISP_THURST        1
//thrust in 10kgf
#define DISP_PRESSURE      2
//pressure in MPa
#define DISP_TEMP          3
//temp in 100C

void display_init(void);
bool display_is_OFD(void);
void display_set(uint8 channel,float value);

#endif
