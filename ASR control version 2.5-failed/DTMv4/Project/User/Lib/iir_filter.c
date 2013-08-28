#include "../platform.h"

//#include "iir_coefs.float.flat.h"
//#include "iir_coefs.float.sharp.h"
#include "iir_coefs_pass@2Hz_stop@0.8Hz.h"
#include "iir_filter.h"

static float y[IIR_NSEC][3];
static float x[IIR_NSEC+1][3];

//IIR_NSEC阶直接型II IIR滤波器
//IIR_NSEC个二阶biquad串联 
int32 iir_filter(int32 in)
{
      uint16 i;
      
      x[0][0] = in;
      
      for(i=0;i<IIR_NSEC;i++)
      {
         
        //  y[i][0] = x[i][0]*IIR_B[i][0] +x[i][1]*IIR_B[i][1] +x[i][2]*IIR_B[i][2]-y[i][1]*IIR_A[i][1]-y[i][2]*IIR_A[i][2];
          y[i][0] = 0;
          
          if(IIR_B[i][0] == 1) y[i][0]+=x[i][0];
          else if(IIR_B[i][0] == -1) y[i][0]-=x[i][0];
          else if(IIR_B[i][0] == -2) y[i][0]=y[i][0]-x[i][0]-x[i][0];
          else if(IIR_B[i][0] == 0);    
          else y[i][0] += x[i][0]*IIR_B[i][0];
          
          if(IIR_B[i][1] == 1) y[i][0]+=x[i][1];
          else if(IIR_B[i][1] == -1) y[i][0]-=x[i][1];
          else if(IIR_B[i][1] == -2) y[i][0]=y[i][0]-x[i][1]-x[i][1];
          else if(IIR_B[i][1] == 0);  
          else y[i][0] += x[i][1]*IIR_B[i][1];
          
          if(IIR_B[i][2] == 1) y[i][0]+=x[i][2];
          else if(IIR_B[i][2] == -1) y[i][0]-=x[i][2];
          else if(IIR_B[i][2] == -2) y[i][0]=y[i][0]-x[i][2]-x[i][2];
          else if(IIR_B[i][2] == 0);
          else y[i][0] += x[i][2]*IIR_B[i][2];
          
          if(IIR_A[i][1] == 1) y[i][0]-=y[i][1];
          else if(IIR_A[i][1] == -1) y[i][0]+=y[i][1];
          else if(IIR_A[i][1] == -2) y[i][0]=y[i][0]+y[i][1]+y[i][1];
          else if(IIR_A[i][1] == 0);
          else y[i][0] -= y[i][1]*IIR_A[i][1];
          
          if(IIR_A[i][2] == 1) y[i][0]-=y[i][2];
          else if(IIR_A[i][2] == -1) y[i][0]+=y[i][2];
          else if(IIR_A[i][2] == -2) y[i][0]=y[i][0]+y[i][2]+y[i][2];
          else if(IIR_A[i][2] == 0);
          else y[i][0] -= y[i][2]*IIR_A[i][2];
          
          if(IIR_A[i][0] != 1) y[i][0] /= IIR_A[i][0];
          
          y[i][2]=y[i][1];y[i][1]=y[i][0];
          x[i][2]=x[i][1];x[i][1]=x[i][0];
          
          x[i+1][0] = y[i][0];
      }
      
      if( x[IIR_NSEC][0]>2147483647)  x[IIR_NSEC][0]=2147483647;
      if( x[IIR_NSEC][0]<-2147483648) x[IIR_NSEC][0]=-2147483648;
      return  ((int32)x[IIR_NSEC][0]);     
      
}

//复位滤波器
void iir_reset(void)
{
    uint16 i,j;
    
    for(i=0;i<IIR_NSEC+1;i++)
    {
       for(j=0;j<3;j++)
       {
          x[i][j]=0;
       }
    }
    
    for(i=0;i<IIR_NSEC;i++)
    {
       for(j=0;j<3;j++)
       {
          y[i][j]=0;
       }
    }
}
