#ifndef _MINIKIT_H__
#define _MINIKIT_H__

#define LD2_0 GPIO_ResetBits(GPIOB, GPIO_Pin_5)
#define LD2_1 GPIO_SetBits(GPIOB, GPIO_Pin_5)
#define LD3_0 GPIO_ResetBits(GPIOB, GPIO_Pin_6)
#define LD3_1 GPIO_SetBits(GPIOB, GPIO_Pin_6)
#define LD4_0 GPIO_ResetBits(GPIOB, GPIO_Pin_7)
#define LD4_1 GPIO_SetBits(GPIOB, GPIO_Pin_7)
#define LD5_0 GPIO_ResetBits(GPIOB, GPIO_Pin_7)
#define LD5_1 GPIO_SetBits(GPIOB, GPIO_Pin_8)

#define JOY_OK  !GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_0)
#define JOY_U   !GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_4)
#define JOY_D   !GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_7)
#define JOY_L   !GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_6)
#define JOY_R   !GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_5)

void Minikit_init(void);

#endif
