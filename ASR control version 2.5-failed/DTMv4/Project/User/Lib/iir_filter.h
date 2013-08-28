#ifndef _IIR_FILTER_H__
#define _IIR_FILTER_H__

//2*nsec阶直接型II IIR滤波器
//nsec个二阶biquad串联
int32 iir_filter(int32 x);

//复位滤波器
void iir_reset(void);


#endif
