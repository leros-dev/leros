

# cleanup
EXTENSIONS=class rbf rpt sof pin summary ttf qdf dat wlf done qws

# Assembler fils
APP=test

ifeq ($(WINDIR),)
	USBRUNNER=./USBRunner
	S=:
else
	USBRUNNER=USBRunner.exe
	S=\;
endif

USB=true

all: directories tools rom
	make lerosusb
	make config

directories:
	-mkdir rbf
	-mkdir vhdl/generated

tools:
	-rm -rf java/classes
	-rm -rf java/lib
	mkdir java/classes
	mkdir java/lib
	javac -d java/classes -sourcepath java/src java/src/leros/*java
	cd java/classes && jar cf ../lib/leros-tools.jar *

rom:
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

QPROJ=dspio

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

config_usb:
	cd rbf && ../$(USBRUNNER) $(QPROJ).rbf

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
