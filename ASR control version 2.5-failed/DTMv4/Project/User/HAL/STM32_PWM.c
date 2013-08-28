//module PWM for STM32

#include "../platform.h"
#include "../hardware.h"
#include "STM32_PWM.h"

static void GPIO_config(void)
{
    GPIO_InitTypeDef p;

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA|
                           RCC_APB2Periph_AFIO  ,ENABLE);
    //PA0 TIM2_CH1
    p.GPIO_Mode = GPIO_Mode_AF_PP;
    p.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2;//|GPIO_Pin_1;
    p.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA,&p);
}

static void TIM_config(void)
{
    TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
    TIM_OCInitTypeDef        TIM_OCInitStructure;

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2,ENABLE);

    TIM_DeInit(TIM2);

    //APB1 36MHz
    TIM_TimeBaseStructure.TIM_Prescaler = 1 - 1;
    TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
    TIM_TimeBaseStructure.TIM_Period = 65535;
    TIM_TimeBaseStructure.TIM_ClockDivision = TIM_CKD_DIV1;
    TIM_TimeBaseStructure.TIM_RepetitionCounter = 0;
    TIM_TimeBaseInit(TIM2,&TIM_TimeBaseStructure);

    TIM_ARRPreloadConfig(TIM2, ENABLE);

    //TIM2 CH1,2,3 in PWM mode 1
    TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM1;
    TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
    TIM_OCInitStructure.TIM_OutputNState = TIM_OutputNState_Disable;
    TIM_OCInitStructure.TIM_Pulse = 0;
    TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_Low;
    TIM_OCInitStructure.TIM_OCNPolarity = TIM_OCNPolarity_Low;
    TIM_OCInitStructure.TIM_OCIdleState = TIM_OCIdleState_Set;
    TIM_OCInitStructure.TIM_OCNIdleState = TIM_OCIdleState_Reset;
    TIM_OC1Init(TIM2,&TIM_OCInitStructure);
    TIM_OC2Init(TIM2,&TIM_OCInitStructure);

    TIM_OC1PreloadConfig(TIM2, TIM_OCPreload_Enable);
    TIM_OC2PreloadConfig(TIM2, TIM_OCPreload_Enable);
    TIM_OC2PreloadConfig(TIM2, TIM_OCPreload_Enable);

    /* TIM2 counter enable */
    TIM_Cmd(TIM2, ENABLE);
    /* TIM2 main Output Enable */
    TIM_CtrlPWMOutputs(TIM2, ENABLE);
}

void PWM_init(void)
{
    GPIO_config();
    TIM_config();
}

void PWM_set(uint8 ch,uint16 v)
{
    if(ch == 1)
      TIM2->CCR1=v;
    else if(ch == 2)
      TIM2->CCR2=v;
    else if(ch == 3)
      TIM2->CCR3=v;
    else return;
}

