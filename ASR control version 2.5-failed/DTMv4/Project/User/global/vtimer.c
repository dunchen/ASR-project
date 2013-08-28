//virtual timer
//vtimer.c

#include "../platform.h"
#include "vtimer.h"
#include "vtimer_conf.h"

//内部静态变量 
static volatile uint32 vtimer_ovft[VTIMERS_NUM]      = {0};
static volatile uint8  vtimer_run[VTIMERS_NUM]       = {0};
static volatile uint8  vtimer_ovf_tag[VTIMERS_NUM] ;
static volatile uint8  vtimer_using[VTIMERS_NUM]   = {0};

//功能函数 
void vtimer_init(void)
{
uint8 i;
for(i=0;i<VTIMERS_NUM;i++)
 {
  vtimer_ovf_tag[i] = 1;
  vtimer_run[i] = 0;
  vtimer_using[i] = 0;
 }
}

void vtimer_service(void)
{
uint8 i;
uint16 t_freeze = systick;
for(i=0;i<VTIMERS_NUM;i++)
  {
   if(vtimer_run[i]&&(vtimer_ovft[i]==t_freeze)) 
    {
        vtimer_ovf_tag[i] = 1;
        vtimer_run[i] = 0;
    }
  }
}

void vtimer_set(uint8 n,uint32 t)//开定时器,n为定时器号,t为时间(ms) 
{
if(t==0) 
 {
 vtimer_ovf_tag[n] = 1;
 return;
 }
vtimer_ovft[n]=systick+t;
vtimer_ovf_tag[n] = 0;
vtimer_run[n] = 1;
}

bool vtimer_ovf(uint8 n)
{
    return (bool)(vtimer_ovf_tag[n]);
}

uint8 vtimer_alloc(void)
{
  uint8 i;
  
  for(i=0;i<VTIMERS_NUM;i++)
  {
    if(!vtimer_using[i]) 
    {
      vtimer_using[i] = 1;
      return i;
    }
  }
  return VTIMER_NULL;
}

void vtimer_free(uint8 n)
{
    vtimer_using[n] = 0;
    vtimer_ovf_tag[n] = 1;
    vtimer_run[n] = 0;
    vtimer_using[n] = 0;
}

