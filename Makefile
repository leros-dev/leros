
# A bit complicated handling of path and programs.
# A simple sbt test will run all available tests in SW and HW simulation,
# including cosimulation and check against Morten's simulator
# TODO: cleanup

# runs all tests
test:
	sbt test

# run a single SW simulation
sw-simulation:
	sbt "runMain leros.sim.LerosSim asm/test/base.s"

APP=base
TESTS="base lhi lhi2 lognosign reg imm mem"
TESTPATH=asm/test

hwsim:
	sbt -Dprogram=$(APP) "testOnly leros.LerosTest"


swsim:
	sbt -Dprogram=$(APP) "testOnly leros.sim.LerosSimTest"

hw:
	sbt "runMain leros.Leros asm/test/$(APP).s"

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

# not so useful anymore, is run with cosim, but have a target to show how to run
# the other simulator
explore:
	sbt "runMain leros.util.DumpProgram asm/test/base.s"
	../leros-sim/build-leros-sim/leros-sim -d -f out.bin > dump.txt
	cat dump.txt
	sbt "testOnly leros.CompareTest"

cosim-morten:
	sbt "testOnly leros.CompareTest"

cosim:
	sbt -Dprogram=mem2 "testOnly leros.CosimTest"

# clean everything (including IntelliJ project settings)
clean:
	git clean -fd
