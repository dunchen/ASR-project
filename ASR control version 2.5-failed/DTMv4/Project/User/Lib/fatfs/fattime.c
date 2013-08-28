/* Martin Thomas 4/2009 */
/* WarMonkey Edited 5/2012 */

#include "platform.h"

#include "integer.h"
#include "fattime.h"

DWORD get_fattime (void)
{
	DWORD res;
	
	res =  (0 << 25)
	        | (1 << 21)
		| (1 << 16)
		| (1 << 11)
		| (0 << 5)
		| (0 >> 1);

	return res;
}

