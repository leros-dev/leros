
# A bit complicated handling of path and programs.
# A simple sbt test will run all available tests in SW and HW simulation,
# including cosimulation and check against Morten's simulator
# TODO: cleanup

# init submodules and build leros-sim
init:
	git submodule update --init --recursive
	cd leros-sim && ./build.sh
	sbt "runMain leros.util.DumpProgram asm/test/mem.s"
	leros-sim/build-leros-sim/leros-sim -d -f out.bin
	od -x out.bin

# runs all tests
test:
	sbt test

# run a single SW simulation
sw-simulation:
	sbt "runMain leros.sim.LerosSim asm/test/base.s"

APP=blink
TESTS="base lhi lhi2 lognosign reg imm mem"
TESTPATH=asm/test

hwsim:
	sbt -Dprogram=$(APP) "testOnly leros.LerosTest"


swsim:
	sbt -Dprogram=$(APP) "testOnly leros.sim.LerosSimTest"

hw:
	sbt "runMain leros.Leros asm/$(APP).s"

test-alu:
	sbt "test:runMain leros.AluTester"

all: all-hwsim all-swsim

all-hwsim:
	sbt "testOnly leros.LerosTest"

list-hwsim:
	sbt -Dtestpath=$(TESTPATH) -Dprogram=$(TESTS) "testOnly leros.LerosTest"

all-swsim:
	sbt "testOnly leros.sim.LerosSimTest"

list-swsim:
	sbt -Dtestpath=$(TESTPATH) -Dprogram=$(TESTS) "testOnly leros.sim.LerosSimTest"

# Synthesize and copy targets

# does not work from Makefile, C & P into shell
synpath:
	source /home/shared/Xilinx/Vivado/2017.4/settings64.sh

synth:
	./vivado_synth -t Leros -p xc7a100tcsg324-1 -x nexysA7.xdc -o build generated/Leros.v

cp-bit:
	-mkdir build
	scp masca@chipdesign1.compute.dtu.dk:~/source/leros/build/Leros.bit build

# Configure the Basys3 or NexysA7 board with open source tools

config:
	openocd -f 7series.txt

QPROJ=de2-115

# Quartus synth
qsynth:
	echo "building $(QPROJ)"
	-rm -rf quartus/$(QPROJ)/db
	-rm -f quartus/$(QPROJ)/leros.sof
	quartus_map quartus/$(QPROJ)/leros
	quartus_fit quartus/$(QPROJ)/leros
	quartus_asm quartus/$(QPROJ)/leros
	quartus_sta quartus/$(QPROJ)/leros
	cd quartus/$(QPROJ) && quartus_cpf -c -q 25MHz -g 3.3 --operation p output_files/leros.sof output_files/leros.svf

cp-svf:
	-mkdir build
	scp masca@helena.compute.dtu.dk:~/leros/quartus/de2-115/output_files/leros.svf build

qconfig:
	openocd -f ep4ce115f29.cfg

# not so useful anymore, is run with cosim, but have a target to show how to run
# the other simulator
explore:
	sbt "runMain leros.util.DumpProgram asm/test/base.s"
	leros-sim/build-leros-sim/leros-sim -d -f out.bin > dump.txt
	cat dump.txt
	sbt "testOnly leros.CompareTest"

cosim-morten:
	sbt -Dprogram=$(APP) "testOnly leros.CompareTest"

cosim:
	sbt -Dprogram=$(APP) "testOnly leros.CosimTest"

# clean everything (including IntelliJ project settings)
clean:
	git clean -fd
