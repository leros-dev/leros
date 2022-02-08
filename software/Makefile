#
# Makefile for Flash programmer
#
test: test.c
	gcc -g -Wall -o test test.c

my_flash: my_flash.c serial.h utils.h
	gcc -g -Wall -o my_flash my_flash.c serial.h utils.h

clean:
		rm -f *~ my_flash test
