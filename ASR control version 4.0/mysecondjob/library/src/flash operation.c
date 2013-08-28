#include "flash operation.h"
#include "stm32f10x_flash.h"
/*
* \stm32f106RD6 flash is 384k, addr is 0x0800_0000 to 0x0805_ffff
*  make the last page to save user data
*/
#define BANK_WRITE_START_ADDR  (u_long)(0x08000000 + 382*1024)
#define BANK_WRITE_END_ADDR    (u_long)(0x08000000 + 384*1024)





/*
* \ brief  Read a half word from the specify FLASH addr
*
* \ param dwiAddr The specify address in the flash between
*         BANK_WRITE_END_ADDR to BANK_WRITE_START_ADDR
*
* \ return data read from the specify adddress.
*/
int eeReadHalfWord(u_long dwiAddr)
{
    u_short data;

    u_short *ptrFlash;

    ptrFlash = (u_short*)(dwiAddr);
    data = *ptrFlash;

    return (int)(u_int)data;
}

/*
* \ brief  Read a word from the specify FLASH addr
*
* \ param dwiAddr The specify address in the flash between
*         BANK_WRITE_END_ADDR to BANK_WRITE_START_ADDR
*
* \ return data read from the specify addr.
*/
int eeReadWord(u_long dwiAddr)
{
    u_int data;
    u_int *ptrFlash;

    ptrFlash = (u_int*)(dwiAddr);
    data = *ptrFlash;

    return ((int)(u_int)data);
}


/*
* \ brief  check a block flash is needed to erase.
*
* \ param dwiAddr The specify address in the flash between
*         BANK_WRITE_END_ADDR to BANK_WRITE_START_ADDR
* \ param wiSize
*
* \ return 
*          -2 the block flash need to erase,if we write data to the flash,
*           0 can write data to the block flash.
*/
int eeCheckBlockFlash(u_long dwiAddr, u_short wiSize)
{
    u_int nResult;
    u_short i = 0;

    for (i = 0; i < wiSize; i++)
    {
        nResult = eeReadWord(dwiAddr);
        if (nResult != 0xffffffff)
        {
            return -2;/*Flag This block in the flash is needed to erase.*/
        }
    }

    return 0;
}


/*
* \ brief  write a half word to the specify piaddr
*
* \ param dwiAddr The specify address in the flash between
*         BANK_WRITE_END_ADDR to BANK_WRITE_START_ADDR
* \ param wiData The data is to save the specify addr.
*
* \ return -1,addr error, 
*          -2,addr is odd num. 
*          -3,data save the specify addr is error.
*           0 success write data to the specify addr.
*/
int eeWriteHalfWord(u_long dwAddr, u_short wiData)
{
    int  nResult;

    /*Addr is not in the page.*/
    if((dwAddr>BANK_WRITE_END_ADDR)&&(dwAddr<BANK_WRITE_START_ADDR))
    {
        return -1;
    }

    /*addr is a odd num*/
    if (dwAddr % 2 != 0)
    {
        return -2;
    }
    
    FLASH_Unlock( );
    FLASH_ErasePage(dwAddr);
    FLASH_ProgramHalfWord(dwAddr, wiData);
    FLASH_Lock( );
    /*Check the save data is right or error*/
    nResult = eeReadHalfWord(dwAddr);
    if ((0xffff & nResult) != wiData)
    {
        return -3;
    }
    

    return 0;
}


/*
* \ brief  write a word to the specify piaddr
*
* \ param dwiAddr The specify address in the flash between
*         BANK_WRITE_END_ADDR to BANK_WRITE_START_ADDR
* \ param dwiData The data save to the specify addr.
*
* \ return -1,addr error, -2 addr is odd number
*          -3,data save to the specify addr is error. 
*          0 success write data to the specify addr.
*/
int eeWriteWord(u_long dwiAddr, u_long dwiData)
{
    int  nResult;
     
    if ((dwiAddr > BANK_WRITE_END_ADDR) && (dwiAddr<BANK_WRITE_START_ADDR))
    {
        return -1;
    }

    if (dwiAddr % 2 != 0)
    {
        return -2;
    }
    
    FLASH_Unlock( );
    FLASH_ErasePage((u_long)dwiAddr);
    FLASH_ProgramWord((u_long)dwiAddr, dwiData);
    nResult = eeReadWord(dwiAddr);
    FLASH_Lock( );
    
    if (nResult != dwiData)
    {
        return -3;
    }
    
    return 0;
}

/*
* \ brief  write muti half data from the flash block
* \ param dwiAddr save the data in the flash,The specify address in the flash between,
*         BANK_WRITE_END_ADDR to BANK_WRITE_START_ADDR.
* \ param pciSrc pointer to the data need to save.
*
* \ return -1 addr error, -2, addr is odd num, 0 write success.
*/
int eeWriteMultiHalfWord(u_long dwiAddr, const u_short *pciSrc, u_short wiDataLen)
{
    u_short i = 0;
    u_short *pdest = (u_short *)dwiAddr;
    int nResult;

    if ((dwiAddr > BANK_WRITE_END_ADDR) && (dwiAddr < BANK_WRITE_START_ADDR))
    {
        return -1;
    }

    if (dwiAddr % 2 != 0)
    {
        return -2;
    }
    
    nResult = eeCheckBlockFlash(dwiAddr, wiDataLen);

    FLASH_Unlock( );
    if (nResult == -2)
    {
        FLASH_ErasePage((u_long)pdest);
    }
    for (i = 0; i < wiDataLen; i++)
    {
        FLASH_ProgramHalfWord((u_long)pdest, *pciSrc);
        pdest++;
        pciSrc++;
    }
    FLASH_Lock( );
    return 0;
}

/*
* \ brief  write multi  word data to the flash block
*
* \ param dwiAddr save the data in the flash,The specify address in the flash between,
*         BANK_WRITE_END_ADDR to BANK_WRITE_START_ADDR.
*
* \ param pciSrc pointer to the data need to save.
* \ param wiDataLen read number of data.
*
* \ return -1 addr error, 
*          -2 addr num is odd.
*          0 write success.
*/
int eeWriteMultiWord(u_long dwiAddr, const u_long *pciSrc, u_short wiDataLen)
{
    u_short i = 0;
    u_long *pDestAddr = (u_long*)dwiAddr;
    int nResult;

    /*The addr is over the specify page.*/
    if ((dwiAddr > BANK_WRITE_END_ADDR) && (dwiAddr< BANK_WRITE_START_ADDR))
    {
        return -1;
    }
    
    /*The addr(dwiAddr) is a odd num, write data here will be made a fault.*/
    if (dwiAddr % 2 != 0)
    {
        return -2;   
    }
    
    /*Check block Flash is needed to erase.*/
    nResult = eeCheckBlockFlash(dwiAddr, wiDataLen);
    FLASH_Unlock( );
    if (nResult == -2)
    {
        FLASH_ErasePage((u_long)pDestAddr);
    }
    
    for (i = 0; i < wiDataLen; i++)
    {
        FLASH_ProgramWord((u_long)pDestAddr, *pciSrc);
        pDestAddr++;
        pciSrc++;
    }
    FLASH_Lock( );
    return 0;
}


/*
* \ brief  read multi half word data from the flash block
*
* \ param dwiSrcAddr The specify address in the flash between
*         BANK_WRITE_END_ADDR to BANK_WRITE_START_ADDR
* \ param piDestAddr Apointer to the addr that save the data from the flash.
* \ param wiDataLen read number of data.
*
* \ return -1 addr error, 
*          -2 addr is a odd number
*          0 read success.
*/
int eeReadMultiHalfWord(u_short *piDestAddr, u_long dwiSrcAddr, u_short wiDataLen)
{
    u_short i = 0;
    u_short *pSrcAddr = (u_short *)dwiSrcAddr;

    /*The addr is over the specify page.*/
    if ((dwiSrcAddr > BANK_WRITE_END_ADDR) && (dwiSrcAddr < BANK_WRITE_START_ADDR))
    {
        return -1;
    }
    /*The addr(dwiAddr) is a odd num, write data here will be made a fault.*/
    if( dwiSrcAddr % 2 != 0)
    {
        return -2;
    }
    
    for (i = 0; i < wiDataLen; i++)
    {
        *piDestAddr = (u_short)(*pSrcAddr);
        piDestAddr++;
        pSrcAddr++;
    }

    return 0;
}

/*
* \ brief  read multi  word data from the flash block
*
* \ param dwiSrcAddr The specify address in the flash between
*         BANK_WRITE_END_ADDR to BANK_WRITE_START_ADDR
* \ param piDestAddr A pointer to the addr that save the data from the flash.
* \ param wiDataLen read number of data.
*
* \ return -1 addr error, 
*          -2 addr is a odd number
*          0 read success.
*/
int eeReadMultiWord(u_long *piDestAddr, u_long dwiSrcAddr, u_short wiDataLen)
{
    u_short i = 0;
    u_long *pSrcAddr = (u_long*)dwiSrcAddr;
    
    /*The addr is over the specify page.*/
    if ((dwiSrcAddr > BANK_WRITE_END_ADDR) && (dwiSrcAddr < BANK_WRITE_START_ADDR))
    {
        return -1;
    }
    
    /*The addr(dwiAddr) is a odd num, write data here will be made a fault.*/
    if (dwiSrcAddr % 2 != 0)
    {
        return -2;
    }
    
    for (i = 0; i < wiDataLen; i++)
    {
        *piDestAddr = *pSrcAddr;
        piDestAddr++;
        pSrcAddr++;
    }

    return 0;
}



