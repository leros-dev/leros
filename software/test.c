#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <fcntl.h>
#include <unistd.h>
#include <termios.h>

// unsigned char charBin2Dec(char* bin){
//   int multiplier = 0;
//   int i;
//   unsigned char sum=0;
//   for(i=7;i>=0;i=i-1){
//     if(bin[i] == '1') sum = sum + pow((double)2,(double)multiplier);
//     multiplier = multiplier + 1;
//   }
//   return sum;
// }

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

void readFile(char* fileName){
  FILE *inFile;
  unsigned int size;
  char* b; //byte retrieve
  unsigned char num;
  size_t len=0;
  size_t read;

  inFile = fopen(fileName, "r");
  if (inFile == NULL) {
    perror("cannot open input file");
    exit(1);
  }
  fseek(inFile, 0, SEEK_END);
  size = ftell(inFile);
  fseek(inFile, 0, SEEK_SET);
  printf("size of file: %d\n",size);
  if (size > 1024*8+1024) {
    fclose(inFile);
    perror("size of file is bigger than the capacity of the Flash");
  }
  
  while((read = getline(&b, &len, inFile)) != -1){
    if(b[read-1]== '\n') {
      b[read-1] = '\0';
      read = read - 1;
    }
    printf("byte: %s - len: %ld\n", b, read);
    num = charBin2Num(b);
    printf("hex: 0x%02x\n",num);
  }

  fclose(inFile);
}

void readBinFile(char* fileName){
  FILE *inFile;
  unsigned int size, i;
  unsigned char b;

  inFile = fopen(fileName, "rb");
  if (inFile == NULL) {
    perror("cannot open input file");
    exit(1);
  }
  fseek(inFile, 0, SEEK_END);
  size = ftell(inFile);
  fseek(inFile, 0, SEEK_SET);
  printf("size of file: %d\n",size);
  if (size > 8 * 1024 * 1024) {
    fclose(inFile);
    perror("size of file is bigger than the capacity of the Flash ROM");
  }
  
  for (i = 0; i < size; i++) {
    if (fread(&b, 1, 1, inFile) != 1) {
      perror("cannot read from input file");
       exit(1);
    }
    printf("%c",b);
  }
  fclose(inFile);
}

void readFlashFile(char* fileName){
FILE *inFile;
unsigned int size, i;
unsigned char b;

inFile = fopen(fileName,"rb");
if (inFile == NULL) {
	perror("cannot open output file");
	exit(-1);
}
fseek(inFile, 0, SEEK_END);
size = ftell(inFile);
fseek(inFile, 0, SEEK_SET);
printf("size of file: %d\n",size);



for (i = 0; i < 1 * 5; i++) {
	if (fread(&b, 1, 1, inFile) != 1) {
	      perror("cannot read from input file ");
	      break;
	}
	printf("%c",b);
}
fclose(inFile);

}

int main(){
printf("Read flash 1KB file\n");
// char* flashFile ="/home/tuankiet/Documents/Workspace/boot_flash/flashprog-DE2-115/host/read1kb2";
char* binFile ="/home/tuankiet/Documents/Workspace/boot_flash/flashprog-DE2-115/host/testblink";

// readBinFile(binFile);
// printf("\n--------------------\n");
// readFlashFile(flashFile);

readFile(binFile);

printf("\nProgram Finished\n");
return 0;
}

