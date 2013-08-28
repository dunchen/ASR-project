#include "../platform.h"
#include "fir_filter.h"

//fir filter

int32 fir_filter(fir_obj *p,int32 input);
{
    uint16 count;
    uint16 r_pos;
    int64 sum = 0;
    
    fir->in_pos++;
    if(fir->in_pos <= fir->taps) fir->in_pos = 0;
    fir->buff[fir->in_pos] = input;
    
    for(count = 0;count<fir->taps - fir->in_pos;count++)
    {
        sum += fir->buff[fir->in_pos + count]*fir->coefs[count];
    }
    for(r_pos = 0;r_pos < fir->in_pos;r_pos++)
    {
        sum += fir->buff[r_pos]*fir->coefs[count];
        count++;
    }
    
    sum /= coefs_div;
    
    return sum;  
    
}

void fir_reset(fir_obj *fir)
{
    uint16 cnt;
    
    fir->in_pos = 0;
    for(cnt = 0;cnt < fir_taps;cnt++)
        fir->buff[cnt] = 0;
}
