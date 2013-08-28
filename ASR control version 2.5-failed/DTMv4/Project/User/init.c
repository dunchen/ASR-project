//System Initialize

//global variables
bool fault=false;

//macros

//functions

void RCC_Config(void)
{
    ErrorStatus HSEStartUpStatus;
    /*
    Clock Tree
    HSE -- PLL  -- AHB   -- APB1  -- TIM2 --OC1 -> PWM1
    8MHz   72MHz   72MHz    36MHz 
                         -- APB2  -- GPIOA
                            72MHz -- GPIOB
                                  -- SPI1
                                  -- ADC1 
                                     12MHz
                         -- Systick --Counter Reload = 9000
                            9MHz      1kHz     
                -- USB 48MHz
    */

//Set Regs to defaults
    RCC_DeInit();
    /* Enable HSE */
    RCC_HSEConfig(RCC_HSE_ON);
    /* Wait till HSE is ready and if Time out is reached exit */
    HSEStartUpStatus = RCC_WaitForHSEStartUp();
    if(HSEStartUpStatus == SUCCESS)
    {
        /* Add here PLL ans system clock config */
        fault = false;
        /* Configure HCLK such as HCLK = SYSCLK/1 */
        RCC_HCLKConfig(RCC_SYSCLK_Div1);
        /* Configure PCLK1 such as PCLK1 = HCLK/2 */
        RCC_PCLK1Config(RCC_HCLK_Div2);
        /* Configure PCLK2 such as PCLK2 = HCLK/1 */
        RCC_PCLK2Config(RCC_HCLK_Div1);
        /* Configure the Latency cycle: Set 2 Latency cycles */
        FLASH_SetLatency(FLASH_Latency_2);
        /* Enable The Prefetch Buffer */
        FLASH_PrefetchBufferCmd(FLASH_PrefetchBuffer_Enable);
        /* Set PLL clock output to 72MHz using HSE (8MHz) as entry clock */
        RCC_PLLConfig(RCC_PLLSource_HSE_Div1, RCC_PLLMul_9);
        /* Enable the PLL */
        RCC_PLLCmd(ENABLE);
        /* Wait for PLL ready */
        while(RCC_GetFlagStatus(RCC_FLAG_PLLRDY) == RESET);
        /* Select the PLL as system clock source */
        RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);
        /* Wait till PLL is used as system clock */
        while(RCC_GetSYSCLKSource() != 0x08);
//RCC OK
    }
    else
    {
        /* Deal with the error */
        fault = true;
        /* Configure HCLK such as HCLK = SYSCLK */
        RCC_HCLKConfig(RCC_SYSCLK_Div1);
        /* Configure PCLK2 such as PCLK1 = HCLK   */
        RCC_PCLK1Config(RCC_HCLK_Div1);
        /* Configure PCLK2 such as PCLK2 = HCLK */
        RCC_PCLK2Config(RCC_HCLK_Div1);
    }

}

void NVIC_Config(void)
{
    NVIC_SetVectorTable(NVIC_VectTab_FLASH,0x0);
    //NVIC_SetVectorTable(NVIC_VectTab_RAM,0x0);
}

void GPIO_Config(void)
{
    GPIO_InitTypeDef p;
    GPIO_DeInit(GPIOA);
    GPIO_DeInit(GPIOB);

    /* Enable GPIOA Clock */
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA,ENABLE);
    /* Enable GPIOB Clock */
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB,ENABLE);
// Enable AFIO Clock
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO,ENABLE);

//Fault LED
    p.GPIO_Pin = GPIO_Pin_8;
    p.GPIO_Speed = GPIO_Speed_2MHz;
    p.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(GPIOB, &p);

}


void STM32Init(void)
{
    RCC_Config();
    NVIC_Config();
    GPIO_Config();

    if(fault)
    {
        LED_FAULT_1;
        while(1);
    }
    else LED_FAULT_0;

}
