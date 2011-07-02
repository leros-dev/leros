#
# Makefile for Leros build
#

# cleanup
EXTENSIONS=class rbf rpt sof pin summary ttf qdf dat wlf done qws

#
#	Set USB to true for an FTDI chip based board (dspio, usbmin, lego)
#
USB=false


# Assembler files
APP=test
APP=muvium
# Altera FPGA configuration cable
#BLASTER_TYPE=ByteBlasterMV
BLASTER_TYPE=USB-Blaster

ifeq ($(WINDIR),)
	USBRUNNER=./USBRunner
	S=:
else
	USBRUNNER=USBRunner.exe
	S=\;
endif

# The VHDL project for Quartus
QPROJ=dspio
QPROJ=altde2-70

all: directories tools rom
	make lerosusb
	make config

directories:
	-mkdir rbf

tools:
	-rm -rf java/classes
	-rm -rf java/lib
	-rm -rf java/src/leros/asm/generated
	mkdir java/classes
	mkdir java/lib
	mkdir java/src/leros/asm/generated
	java -classpath lib/antlr-3.3-complete.jar org.antlr.Tool \
		-fo java/src/leros/asm/generated java/src/grammar/Leros.g
	javac -classpath lib/antlr-3.3-complete.jar \
		-d java/classes java/src/leros/asm/generated/*.java \
		java/src/leros/asm/*.java
	javac -d java/classes -sourcepath java/src java/src/leros/sim/*.java
	cd java/classes && jar cf ../lib/leros-tools.jar *

rom: 
	-rm -rf vhdl/generated
	mkdir vhdl/generated
	java -cp java/lib/leros-tools.jar$(S)lib/antlr-3.3-complete.jar \
		leros.asm.LerosAsm -s asm -d vhdl/generated $(APP).asm
jsim: rom
	java -cp java/lib/leros-tools.jar -Dlog=false \
		leros.sim.LerosSim rom.txt
sim: rom
	cd modelsim; make

rom_old:
	-rm -rf vhdl/generated
	mkdir vhdl/generated
	java -cp java/lib/leros-tools.jar leros.LerosAsm -s asm -d vhdl/generated $(APP).asm

# configure the FPGA
config:
ifeq ($(USB),true)
	make config_usb
else
ifeq ($(XFPGA),true)
	make config_xilinx
else
	make config_byteblaster
endif
endif

lerosusb:
	@echo $(QPROJ)
	for target in $(QPROJ); do \
		make qsyn -e QBT=$$target || exit; \
		cd quartus/$$target && quartus_cpf -c leros.sof ../../rbf/$$target.rbf; \
	done

#
#	Quartus build process
#		called by jopser, jopusb,...
#
qsyn:
	echo $(QBT)
	echo "building $(QBT)"
	-rm -rf quartus/$(QBT)/db
	-rm -f quartus/$(QBT)/leros.sof
	-rm -f jbc/$(QBT).jbc
	-rm -f rbf/$(QBT).rbf
	quartus_map quartus/$(QBT)/leros
	quartus_fit quartus/$(QBT)/leros
	quartus_asm quartus/$(QBT)/leros
	quartus_sta quartus/$(QBT)/leros

config_byteblaster:
	cd quartus/$(QPROJ) && quartus_pgm -c $(BLASTER_TYPE) -m JTAG leros.cdf

config_usb:
	cd rbf && ../$(USBRUNNER) $(QPROJ).rbf

# TODO: no Xilinx Makefiles available yet
config_xilinx:
	cd xilinx/$(XPROJ) && make config

clean:
	for ext in $(EXTENSIONS); do \
		find `ls` -name \*.$$ext -print -exec rm -r -f {} \; ; \
	done
	-find `ls` -name leros.pof -print -exec rm -r -f {} \;
	-find `ls` -name db -print -exec rm -r -f {} \;
	-find `ls` -name incremental_db -print -exec rm -r -f {} \;
	-find `ls` -name leros_description.txt -print -exec rm -r -f {} \;
	-rm -rf asm/generated
	-rm -f vhdl/*.vhd
	-rm -rf $(TOOLS)/dist
	-rm -rf $(PCTOOLS)/dist
	-rm -rf $(TARGET)/dist
	-rm -rf modelsim/work
	-rm -rf modelsim/transcript
	-rm -rf modelsim/gaisler
	-rm -rf modelsim/grlib
	-rm -rf modelsim/techmap
