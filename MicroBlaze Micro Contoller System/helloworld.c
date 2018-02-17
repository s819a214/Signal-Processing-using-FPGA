/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */




#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
//#include "xparameters.h"
#include "xbasic_types.h"
//#include "xstatus.h"


//#define in32(addr) 			(*(volatile Xuint32 *)(addr))
//#define out32(addr, data) 	(*(volatile Xuint32 *)((addr)) = (data))

#define in32(addr) 			(*(volatile signed long *)(addr))
#define out32(addr, data) 	(*(volatile signed long *)((addr)) = (data))


#define USR_IO_SW_LED    0xC0000000
#define CMAC_IO_A  		 0xC0000010
#define CMAC_IO_B        0xC0000014
#define CMAC_IO_CR       0xC0000018
#define CMAC_IO_CI       0xC000001C
#define CMAC_IO_DR       0xC0000020
#define CMAC_IO_DI       0xC0000024

#define RAM_R_ADDR       0xC0000050    //to read outputs or other stored values in memory
#define RAM_R_DATA       0xC0000054
#define RAM_W_ADDR       0xC0000058   // to access the data
#define RAM_W_DATA       0xC000005C


#define RAM_R_DATA1       0xC0000060


int main()
{
    init_platform();

    //Xuint32 data;

    signed long data,A,B,CR,CI,DR,DI,data_idx,dft0, dft1, dft;
    unsigned long addr_idx, idx, idx_RAM_R_DATA;
    int i;

    // Clear the screen
    //  xil_printf("%c[2J",27);

    print("EECS 700 Project 2 Sravya Athinarapu \n\r");
    print("\n\r");
    print("\n\r");
    print("1. Access to on-board LEDs \n\r");
    print("Push a switch to glow the corresponding LED \n\r");
    print("\n\r");
    print("\n\r");
    print("\n\r");
    print("2. CMAC \n\r");


            out32(CMAC_IO_A,  0x0032FFFE);    //write
    	    A = in32(CMAC_IO_A);
    	    xil_printf("Reading A: 0x%X\n\r", A);

            out32(CMAC_IO_B,  0xFFD403FE);
    	    B = in32(CMAC_IO_B);
    	    xil_printf("Reading B: 0x%X\n\r", B);

            out32(CMAC_IO_CR,  0x0000139E);
    	    CR = in32(CMAC_IO_CR);
    	    xil_printf("Reading CR: 0x%X\n\r", CR);

            out32(CMAC_IO_CI,  0xFFFFFC0D);
    	    CI = in32(CMAC_IO_CI);
    	    xil_printf("Reading CI: 0x%X\n\r", CI);

    	    DR = in32(CMAC_IO_DR);   //display or Read
    	    //out32(CMAC_IO_DR, DR);
    	    xil_printf("Result DR: 0x%X\n\r", DR);

    	    DI = in32(CMAC_IO_DI);
    	    //out32(CMAC_IO_DI, DI);
    	    xil_printf("       DI: 0x%X\n\r", DI);


    	    print("3. Proc RAM \n\r");
    	    print("\n\r");
    	    print("\n\r");
    	    print("\n\r");

    	    // writing data for DFT calculation
		   for( idx = 0x00000000; idx < 0x00000020; idx = idx + 1 ){
			   out32(RAM_W_ADDR,  idx);    //write
			   addr_idx = in32(RAM_W_ADDR);
			   out32(RAM_W_DATA,  0x00010000);    //write
			   data_idx = in32(RAM_W_DATA);
			   xil_printf("RAM Write Addr-Data: 0x%X - 0x%X \n\r",addr_idx, data_idx);

		   }

		   //Reading DFT result
   	       print("\n\r");
   	       print("\n\r");
		   print("Real part , Imaginary part(last four bits) are represented as signed numbers \n\r");
		   print("\n\r");

		   print("DFT Result:\n\r");

		   dft0 = in32(RAM_R_DATA);   //display or Read
		   xil_printf("X(0): 0x%X\n\r", dft0);
		   i = 0;
		   for( idx_RAM_R_DATA = 0xC0000060; idx_RAM_R_DATA < 0xC00000D9; idx_RAM_R_DATA = idx_RAM_R_DATA + 0x00000004 ){
		   dft = in32(idx_RAM_R_DATA);
		   i = i+1;
		   xil_printf("X(%d): 0x%X\n\r", i,dft);

		   }


// Switches and LED's
while(1){

	    data = in32(USR_IO_SW_LED);
	    out32(USR_IO_SW_LED, data);

	    //xil_printf("Data: 0x%X\n\r",data);


}

    cleanup_platform();
    return 0;
}
