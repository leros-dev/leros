/*
 * flashprog.c -- Terasic DE2-115 Flash ROM programmer
 */


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <fcntl.h>
#include <unistd.h>
#include <termios.h>
#include "serial.h"
#include "utils.h"

/**************************************************************/
/* Basic serial communication with FPGA */
/**************************************************************/

void initBoard(void) {
  lastAddr_0 = 0x00;
  while (!serialSnd(SET_ADDR_0 | lastAddr_0)) ;
  lastAddr_1 = 0x00;
  while (!serialSnd(SET_ADDR_1 | lastAddr_1)) ;
  lastAddr_2 = 0x00;
  while (!serialSnd(SET_ADDR_2 | lastAddr_2)) ;
  lastAddr_3 = 0x00;
  while (!serialSnd(SET_ADDR_3 | lastAddr_3)) ;
  lastAddr_4 = 0x00;
  while (!serialSnd(SET_ADDR_4 | lastAddr_4)) ;
  lastAddr_5 = 0x00;
  while (!serialSnd(SET_ADDR_5 | lastAddr_5)) ;
  lastData_0 = 0x00;
  while (!serialSnd(SET_DATA_0 | lastData_0)) ;
  lastData_1 = 0x00;
  while (!serialSnd(SET_DATA_1 | lastData_1)) ;

  while (!serialSnd(SET_CTRL | FL_RESET)) ;
  lastCtrl = 0x0F;
  while (!serialSnd(SET_CTRL | lastCtrl)) ;
}

void setAddr(unsigned int addr) {
  unsigned char b;

  b = (addr >> 0) & 0x0F;
  if (lastAddr_0 != b) {
    while (!serialSnd(SET_ADDR_0 | b)) ;
    lastAddr_0 = b;
  }
  b = (addr >> 4) & 0x0F;
  if (lastAddr_1 != b) {
    while (!serialSnd(SET_ADDR_1 | b)) ;
    lastAddr_1 = b;
  }
  b = (addr >> 8) & 0x0F;
  if (lastAddr_2 != b) {
    while (!serialSnd(SET_ADDR_2 | b)) ;
    lastAddr_2 = b;
  }
  b = (addr >> 12) & 0x0F;
  if (lastAddr_3 != b) {
    while (!serialSnd(SET_ADDR_3 | b)) ;
    lastAddr_3 = b;
  }
  b = (addr >> 16) & 0x0F;
  if (lastAddr_4 != b) {
    while (!serialSnd(SET_ADDR_4 | b)) ;
    lastAddr_4 = b;
  }
  b = (addr >> 20) & 0x0F;
  if (lastAddr_5 != b) {
    while (!serialSnd(SET_ADDR_5 | b)) ;
    lastAddr_5 = b;
  }
}

void setData(unsigned char data) {
  unsigned char b;
  //4LSB of data
  b = (data >> 0) & 0x0F;
  if (lastData_0 != b) {
      while (!serialSnd(SET_DATA_0 | b)) ; //send 4 LSB bit of b
      lastData_0 = b; //just for debug
  }
  //4MSB of data
  b = (data >> 4) & 0x0F;
  if (lastData_1 != b) {
      while (!serialSnd(SET_DATA_1 | b)) ; //send 4 MSB bit of b
      lastData_1 = b; //just for debug
  }
}

void setCtrl(unsigned char ctrl) {
  unsigned char b;

  b = ctrl & 0x0F;
  if (lastCtrl != b) {
    while (!serialSnd(SET_CTRL | b)) ;
    lastCtrl = b;
  }
}

unsigned char getData(void) {
  unsigned char b;

  while (!serialSnd(GET_DATA)) ;
  while (!serialRcv(&b)) ;
  return b;
}

unsigned char getReady(void) {
  unsigned char b;

  while (!serialSnd(GET_READY)) ;
  while (!serialRcv(&b)) ;
  return b;
}

/**************************************************************/
/* Compact functions */
/**************************************************************/

void fl_reset(void) {
  setCtrl(FL_RESET);
  setCtrl(FL_OUTPUT_MODE);
}


void standby(void) {
  setCtrl(FL_STANDBY_MODE);
}


unsigned char readData(unsigned int addr) {
  unsigned char b;

  setAddr(addr);
  setCtrl(FL_OUTPUT_MODE);
  b = getData();
  return b;
}


void writeData(unsigned int addr, unsigned char data) {
  setAddr(addr);
  setData(data);
  setCtrl(FL_INPUT_MODE);
  setCtrl(FL_OUTPUT_MODE);
}


void waitReady(void) {
  while ((getReady() & 0x01) == 0) ;
}

/**************************************************************/
/* Software functions */
/**************************************************************/
void checkID(void) {
  unsigned char b;

  printf("result should be    : 0x01 0x7E 0x10 0x00\n");
  printf("result actually is  :");
  //Command sequence in datasheet for DEVICE ID
  writeData(0xAAA, 0xAA);
  writeData(0x555, 0x55);
  writeData(0xAAA, 0x90);
  b = readData(0x00);
  printf(" 0x%02X", b);
  b = readData(0x02);
  printf(" 0x%02X", b);
  b = readData(0x1C);
  printf(" 0x%02X", b);
  b = readData(0x1E);
  printf(" 0x%02X", b);
  printf("\n");
  writeData(0xAAA, 0xF0); // reset to go back to read mode
}

void programByte(unsigned int addr, unsigned char data) {
  writeData(0xAAA, 0xAA);
  writeData(0x555, 0x55);
  writeData(0xAAA, 0xA0);
  writeData(addr, data);
  printf("write to addr: 0x%06X - b:0x%02X\n",addr, data);
  waitReady();
}

void readByte(unsigned int addr){
  unsigned char b;
  b = readData(addr);
  printf("read from addr: 0x%06X - b:0x%02X\n",addr, b);
}

void eraseBootSector0(unsigned int sector) {
  //sector 0 has 8KB but we only need 1KB
  writeData(0xAAA, 0xAA);
  writeData(0x555, 0x55);
  writeData(0xAAA, 0x80);
  writeData(0xAAA, 0xAA);
  writeData(0x555, 0x55);
  writeData(sector << 13, 0x30);
  waitReady();
}

void check1KB(void){
  unsigned int addr;
  unsigned char b;
  int i;

  for (i = 0; i < 1 * 1024; i++) {
    addr = (0 << 13) + i;
    b = readData(addr);
    if (b != 0xFF) {
      error("addr 0x%06X not empty, data is 0x%02X", addr, b);
    }
  }
}

/* Program flash sector 0 from file with size 1KB */
//TODO: for now read txt file instead of binary file
//Need to fix Java program to generate binary file
void program1KBFile(char *fileName) {
  FILE *inFile;
  unsigned int size;
  unsigned int addr = 0;
  //for read file
  char* c;
  size_t len=0;
  size_t read;
  //for program
  unsigned char b;
  unsigned int cnt = 0;

  inFile = fopen(fileName, "r"); //read txt file instead of bin file
  if (inFile == NULL) {
    error("cannot open input file '%s'", fileName);
  }
  fseek(inFile, 0, SEEK_END);
  size = ftell(inFile);
  fseek(inFile, 0, SEEK_SET);
  if (size > 1024*8+1024) {
    fclose(inFile);
    error("size of file is bigger than the capacity of the Flash");
  }
  
  /*Program Process*/
  //Using Bypass mode
  writeData(0xAAA, 0xAA);
  writeData(0x555, 0x55);
  writeData(0xAAA, 0x20);
  
  while((read = getline(&c, &len, inFile)) != -1){
    if(c[read-1]== '\n') {
      c[read-1] = '\0';
      read = read - 1;
    }
    b = charBin2Num(c);
    // printf("byte: %s - len: %ld\n", c, read);
    // printf("hex: 0x%02x\n",b);
    writeData(0xAAA, 0xA0);  /* addr is don't care */
		addr = cnt;
		writeData(addr, b);
    waitReady();
    cnt = cnt+1;
  }
  printf("Program FLASH with file size: %d Bytes\n",cnt);
  //if file is less than 1KB, program 0 for the rest
  while (cnt < 1024){
    writeData(0xAAA, 0xA0);  /* addr is don't care */
    addr = cnt;
    writeData(addr, 0);
    waitReady();
    cnt = cnt+1;
  }
  writeData(addr, 0x90);  /* reset Bypass mode addr is don't care */
  writeData(addr, 0x00);  /* addr is don't care */
  fclose(inFile);
  setCtrl(FL_OUTPUT_MODE);
}

void verifyFile(char *fileName) {
   FILE *inFile;
  unsigned int size;
  unsigned int addr = 0;
  //for read file
  char* c;
  size_t len=0;
  size_t read;
  //for program
  unsigned char b, r;
  unsigned int cnt = 0;

  inFile = fopen(fileName, "r"); //read txt file instead of bin file
  if (inFile == NULL) {
    error("cannot open input file '%s'", fileName);
  }
  fseek(inFile, 0, SEEK_END);
  size = ftell(inFile);
  fseek(inFile, 0, SEEK_SET);
  if (size > 1024*8+1024) {
    fclose(inFile);
    error("size of file is bigger than the capacity of the Flash");
  }

  while((read = getline(&c, &len, inFile)) != -1){
    if(c[read-1]== '\n') {
      c[read-1] = '\0';
      read = read - 1;
    }
    b = charBin2Num(c);
    // printf("byte: %s - len: %ld\n", c, read);
    // printf("hex: 0x%02x\n",b);
		addr = cnt;
    cnt = cnt+1;
		r = readData(addr);
    if (b != r) {
      error("addr 0x%06X, file = 0x%02X, ROM = 0x%02X", addr, b, r);
    }
  }

  while (cnt < 1024){
    addr = cnt;
    cnt = cnt+1;
		r = readData(addr);
    if (r != 0) {
      error("addr 0x%06X, file = 0x%02X, ROM = 0x%02X", addr, b, r);
    }
  }

  fclose(inFile);
}


int main(int argc, char *argv[]){

  //start up
  if (argc < 3) {
    usage(argv[0]);
  }
  serialPort = argv[1];
  cmdName = argv[2];

  parsing_argument(argc, argv);

  //execute command
  serialOpen(serialPort);
  initBoard();
  fl_reset();
  switch(cmd){
    case CMD_CHECK_ID:
      checkID();
      break;
    case CMD_PROGRAM:
      programByte(addr, data);
      break;
    case CMD_READ:
      readByte(addr);
      break;
    case CMD_ERASE_FL:
      eraseBootSector0(0);
      printf("FLASH erasing finished!\n");
      break;
    case CMD_CHECK_1KB:
      check1KB();
      printf("Check 1KB empty finished!\n");
      break;
    case CMD_PROGRAM_FILE:
      program1KBFile(fileName);
      printf("Program from file finished!\n");
      break;
    case CMD_VERIFY_FILE:
      verifyFile(fileName);
      printf("Verify from file successful!\n");
      break;
  }

  if (sfd != 0) {
    standby();
    tcdrain(sfd);
    sleep(1);
    serialClose();
    sfd = 0;
  }
  printf("Finished\n");
  return 0;

}


