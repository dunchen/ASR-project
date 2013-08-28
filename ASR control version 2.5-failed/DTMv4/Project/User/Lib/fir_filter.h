//direct-form I fir filter

#ifndef _FIR_FILTER_H__
#define _FIR_FILTER_H__

typedef struct {
const uint16 taps;
const int16 *coefs;
int32 div;
int32 *buff;//pointer to input ring buffer, length = taps
int32 in_pos;//latest data in *(buff+pos)
}fir_object;
//change this to match coefficient file 

int32 fir_filter(fir_object *fir,int32 input);
//filter object, input data

int32 fir_reset(fir_object *fir);

#endif
