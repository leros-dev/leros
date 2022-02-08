#ifndef __UTILS_H__
#define __UTILS_H__

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <fcntl.h>
#include <unistd.h>
#include <termios.h>
#include "serial.h"
#include <math.h>

/* State communication protocol in FPGA */
/* State Machine Control */
//4MSB = control - 4LSB = data 
#define SET_ADDR_0	0x00
#define SET_ADDR_1	0x10
#define SET_ADDR_2	0x20
#define SET_ADDR_3	0x30
#define SET_ADDR_4	0x40
#define SET_ADDR_5	0x50
#define SET_DATA_0	0x60
#define SET_DATA_1	0x70
#define SET_CTRL	0x80
#define GET_DATA	0x90
#define GET_READY	0xA0


/* Flash control */
/* ce_n  oe_n  we_n  rst_n */
#define FL_RESET        0x0E  // 1110
#define FL_OUTPUT_MODE  0x03  // 0011
#define FL_INPUT_MODE   0x05 // 0101
#define FL_STANDBY_MODE 0x0F // 1111

/* Utils for application*/
#define CMD_CHECK_ID      0
#define CMD_PROGRAM       1
#define CMD_READ          2
#define CMD_ERASE_FL      3
#define CMD_CHECK_1KB     4
#define CMD_PROGRAM_FILE  5
#define CMD_VERIFY_FILE   6


//store input
char* serialPort;
char *cmdName;
int cmd;
unsigned int n;
char *endptr;
// int i;
char *fileName;
unsigned int addr;
unsigned int data;

//for debug
unsigned char lastAddr_0 = 0x00;
unsigned char lastAddr_1 = 0x00;
unsigned char lastAddr_2 = 0x00;
unsigned char lastAddr_3 = 0x00;
unsigned char lastAddr_4 = 0x00;
unsigned char lastAddr_5 = 0x00;
unsigned char lastData_0 = 0x00;
unsigned char lastData_1 = 0x00;
unsigned char lastCtrl   = 0x0F;

void usage(char *myself) {
  printf("Usage: %s <serial port> <command> ...\n", myself);
  printf("valid commands are:\n");
  printf("    --id          identify flash\n");
  printf("    --pr <a> <n>  program flash\n");
  printf("    --rd <a>      read from flash\n");
  printf("    --er          erase flash sector 0\n");
  printf("    --ck          check 1KB sector 0 is empty\n");
  printf("    --pf <f>      program flash 1KB sector 0 from file\n");
  printf("    --vf <f>      verify programmed file\n");
  exit(1);
}

 //parsing argument
void parsing_argument(int argc, char *argv[]) {
  
  if(strcmp(cmdName, "--id") == 0){
    if(argc != 3){
      usage(argv[0]);
    }
    cmd = CMD_CHECK_ID;
  } else
  if(strcmp(cmdName, "--pr") == 0){
    if(argc != 5){
      usage(argv[0]);
    }
    cmd = CMD_PROGRAM;
    addr = strtoul(argv[3], &endptr, 0);
    if (*endptr != '\0') {
      error("invalid address");
    }
    addr &= 0x007FFFFF; //mask 22 bits of address
    data = strtoul(argv[4], &endptr, 0);
    if (*endptr != '\0') {
      error("invalid data value");
    }
    data &= 0x000000FF; //mask 8 bits of data
  } else 
  if(strcmp(cmdName, "--rd") == 0){
    if(argc != 4){
      usage(argv[0]);
    }
    cmd = CMD_READ;
    addr = strtoul(argv[3], &endptr, 0);
    if (*endptr != '\0') {
      error("invalid address");
    }
    addr &= 0x007FFFFF; //mask 22 bits of address
  } else
  if(strcmp(cmdName, "--er") == 0){
    if(argc != 3){
      usage(argv[0]);
    }
    cmd = CMD_ERASE_FL;
  } else
  if(strcmp(cmdName, "--ck") == 0){
    if(argc != 3){
      usage(argv[0]);
    }
    cmd = CMD_CHECK_1KB;
  } else
  if (strcmp(cmdName, "--pf") == 0) {
    if (argc != 4) {
      usage(argv[0]);
    }
    cmd = CMD_PROGRAM_FILE;
    fileName = argv[3];
  } else
  if (strcmp(cmdName, "--vf") == 0) {
    if (argc != 4) {
      usage(argv[0]);
    }
    cmd = CMD_VERIFY_FILE;
    fileName = argv[3];
  }
}


unsigned char charBin2Num(char* bin){
  unsigned char multiplier = 0x80;
  int i;
  unsigned char sum=0;
  for(i=0;i<8;i=i+1){
    if(bin[i] == '1') sum = sum | multiplier;
    multiplier = multiplier >> 1;
  }
  return sum;
}



#endif