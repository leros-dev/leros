/*
   Copyright 2011 Martin Schoeberl <masca@imm.dtu.dk>,
                  Technical University of Denmark, DTU Informatics. 
   All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:

      1. Redistributions of source code must retain the above copyright notice,
         this list of conditions and the following disclaimer.

      2. Redistributions in binary form must reproduce the above copyright
         notice, this list of conditions and the following disclaimer in the
         documentation and/or other materials provided with the distribution.

   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER ``AS IS'' AND ANY EXPRESS
   OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
   OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
   NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
   DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
   (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
   ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
   THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

   The views and conclusions contained in the software and documentation are
   those of the authors and should not be interpreted as representing official
   policies, either expressed or implied, of the copyright holder.
 */

package leros.sim;

import java.io.IOException;

/**
 * Simulation of IO devices connected to Leros. IO mapping is at the moment not
 * the same as in VHDL.
 * 
 * @author martin
 * 
 */
public class LerosIO {

	final static int UART = 0;

	public void write(int addr, int data) {
		switch (addr) {
		case UART+1:	// data register
			System.out.print((char) data);
			break;

		default:
			System.out.println("IO address " + addr + " not defined");
			break;
		}
	}

	public int read(int addr) {

		int ret = 0;
		switch (addr) {
		case UART:		// status register
			ret = 1;
			try {
				if (System.in.available()!=0) {
					ret |= 2;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			break;
		case UART+1:	// data registers
			try {
				ret = System.in.read();
			} catch (IOException e) {
				e.printStackTrace();
			}
			break;
		default:
			System.out.println("IO address " + addr + " not defined");
			break;
		}
		return ret;
	}
}
