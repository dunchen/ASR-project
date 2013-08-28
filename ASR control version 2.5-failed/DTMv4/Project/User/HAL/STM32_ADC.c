#include "../platform.h"
#include "../hardware.h"

#include "STM32_ADC.h"

static void (*forward)(uint8,uint16) = NULL;
volatile bool configured = false;//ADC configured

//adc1 IN3   Pressure 2ksps   regular ch. TIM1_OC1 TRIG
//adc1 IN8   Temp     100sps  inject ch.  Systick TRIG
//adc1 IN17  INTREF   100sps  inject ch.  Systick TRIG

static void GPIO_Config(void)
{
    GPIO_InitTypeDef p;

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA|
                           RCC_APB2Periph_GPIOB,ENABLE);
//Analog Input
//PA3 IN3 Pressure
//PB0 IN8 Temp
    p.GPIO_Pin = GPIO_Pin_3;
    p.GPIO_Speed = GPIO_Speed_2MHz;
    p.GPIO_Mode = GPIO_Mode_AIN;
    GPIO_Init(GPIOA, &p);
    
    p.GPIO_Pin = GPIO_Pin_0;
    p.GPIO_Speed = GPIO_Speed_2MHz;
    p.GPIO_Mode = GPIO_Mode_AIN;
    GPIO_Init(GPIOB, &p);
}

static void TIM_Config(void)
{
    TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
    TIM_OCInitTypeDef        TIM_OCInitStructure;

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4,ENABLE);

    TIM_DeInit(TIM4);

    //APB1 36MHz
    TIM_TimeBaseStructure.TIM_Prescaler = 1000 - 1;
    TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
    TIM_TimeBaseStructure.TIM_Period = 72 - 1;
    TIM_TimeBaseStructure.TIM_ClockDivision = TIM_CKD_DIV1;
    TIM_TimeBaseStructure.TIM_RepetitionCounter = 0x0;
    TIM_TimeBaseInit(TIM4,&TIM_TimeBaseStructure);

    //TIM4 CH4 in PWM mode 1
    TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_Toggle;
    TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
    TIM_OCInitStructure.TIM_OutputNState = TIM_OutputNState_Disable;
    TIM_OCInitStructure.TIM_Pulse = (72-1)/2;
    TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_Low;
    TIM_OCInitStructure.TIM_OCNPolarity = TIM_OCNPolarity_Low;
    TIM_OCInitStructure.TIM_OCIdleState = TIM_OCIdleState_Reset;
    TIM_OCInitStructure.TIM_OCNIdleState = TIM_OCIdleState_Reset;
    TIM_OC4Init(TIM4,&TIM_OCInitStructure);
    
    /* TIM1 counter enable */
    TIM_Cmd(TIM4, ENABLE);
}

static void NVIC_ADC_INT_Config(void)
{
    NVIC_InitTypeDef NVIC_InitStructure;

    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_4);
    
    NVIC_InitStructure.NVIC_IRQChannel = ADC1_2_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 8;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;

    NVIC_Init(&NVIC_InitStructure);
}

/*
static void ADC2_Config(void)
{
    ADC_InitTypeDef c;

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC2,ENABLE);

    c.ADC_Mode = ADC_Mode_Independent;
    c.ADC_ScanConvMode = DISABLE;
    c.ADC_ContinuousConvMode = DISABLE;
    c.ADC_ExternalTrigConv = ADC_ExternalTrigConv_T1_CC1;
    c.ADC_DataAlign = ADC_DataAlign_Right;
    c.ADC_NbrOfChannel = 1;
    ADC_Init(ADC2, &c);
//PA1 IN1 Force1
    ADC_RegularChannelConfig(ADC2, ADC_Channel_1 , 1, ADC_SampleTime_41Cycles5);
//enable interrupts
    ADC_ITConfig(ADC2, ADC_IT_EOC , ENABLE);
//turn on internal reference
    ADC_TempSensorVrefintCmd(ENABLE);
//turn on ADC2
    ADC_Cmd(ADC2, ENABLE);
//calibration  
    ADC_ResetCalibration(ADC2);
    while(ADC_GetResetCalibrationStatus(ADC2));
    ADC_StartCalibration(ADC2);
    while(ADC_GetCalibrationStatus(ADC2));
    
    ADC_ExternalTrigConvCmd(ADC2, ENABLE);
}
*/

static void ADC1_Config(void)
{
    ADC_InitTypeDef   c;
    
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1,ENABLE);

    c.ADC_Mode = ADC_Mode_Independent;
    c.ADC_ScanConvMode = DISABLE;
    c.ADC_ContinuousConvMode = DISABLE;
    c.ADC_ExternalTrigConv = ADC_ExternalTrigConv_T4_CC4;
    c.ADC_DataAlign = ADC_DataAlign_Right;
    c.ADC_NbrOfChannel = 1;
    ADC_Init(ADC1, &c);
//inject channels
//    ADC_InjectedSequencerLengthConfig(ADC1, 2);
//    ADC_InjectedChannelConfig(ADC1, ADC_Channel_8 , 1, ADC_SampleTime_239Cycles5);
//    ADC_InjectedChannelConfig(ADC1, ADC_Channel_17, 2, ADC_SampleTime_239Cycles5); 
//software triggering
//    ADC_ExternalTrigInjectedConvConfig(ADC1,ADC_ExternalTrigInjecConv_None);
//regular channels
    ADC_RegularChannelConfig(ADC1, ADC_Channel_3 , 1, ADC_SampleTime_41Cycles5);
//enable interrupts
    ADC_ITConfig(ADC1, ADC_IT_EOC/*|ADC_IT_JEOC*/ , ENABLE);
//turn on internal reference
    ADC_TempSensorVrefintCmd(ENABLE);
//turn on ADC1
    ADC_Cmd(ADC1, ENABLE);
//calibration  
    ADC_ResetCalibration(ADC1);
    while(ADC_GetResetCalibrationStatus(ADC1));
    ADC_StartCalibration(ADC1);
    while(ADC_GetCalibrationStatus(ADC1));
    
//   ADC_ExternalTrigInjectedConvCmd(ADC1,ENABLE);
  ADC_ExternalTrigConvCmd(ADC1, ENABLE);
}

void ADC_init(void)
{
    GPIO_Config();
    TIM_Config();
    //ADCCLK = PCLK2/6
    RCC_ADCCLKConfig(RCC_PCLK2_Div6);
    ADC1_Config();
//    ADC2_Config();
    
    ADC_calibration();
    
    TIM_CtrlPWMOutputs(TIM4, ENABLE);
 
    NVIC_ADC_INT_Config();
}

void ADC_process(void)
{
    //ADC_SoftwareStartInjectedConvCmd(ADC1,ENABLE);
}

void  __ADC_INT(void)
{
    //仅仅适用于当前硬件与软件，修改库以后必须重写
    if(ADC1->SR&ADC_FLAG_EOC)
    {
        ADC1->SR = 0x0000;
        (*forward)(3,ADC1->DR);
    }
/*    if(ADC1->SR&ADC_FLAG_JEOC)
    {
        ADC1->SR = 0x0000;
        (*forward)(8, *((uint32 *)(ADC1_BASE + 1 + 0x28)));
        (*forward)(17,*((uint32 *)(ADC1_BASE + 2 + 0x28)));
    }*/
}

void ADC_set_forward(void (*f)(uint8,uint16))
{
    forward=f;
}

void ADC_calibration(void)
{
    //stop ADC
  ADC_ExternalTrigConvCmd(ADC1, DISABLE);
    ADC_ExternalTrigInjectedConvCmd(ADC1,DISABLE);
//    ADC_ExternalTrigConvCmd(ADC2, DISABLE);

    ADC_ResetCalibration(ADC1);
//    ADC_ResetCalibration(ADC2);
    while(ADC_GetResetCalibrationStatus(ADC1));
//  while(ADC_GetResetCalibrationStatus(ADC2));
    ADC_StartCalibration(ADC1);
//    ADC_StartCalibration(ADC2);
    while(ADC_GetCalibrationStatus(ADC1));
//    while(ADC_GetCalibrationStatus(ADC2));
    
        ADC_ExternalTrigConvCmd(ADC1, ENABLE);
    ADC_ExternalTrigInjectedConvCmd(ADC1,ENABLE);
//    ADC_ExternalTrigConvCmd(ADC2, ENABLE);
}
