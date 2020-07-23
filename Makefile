
APP=base
TESTS="base lhi lhi2 lognosign reg imm mem"
TESTPATH=asm

hwsim:
	sbt -Dprogram=$(APP) "testOnly leros.LerosSpec"


swsim:
	sbt -Dprogram=asm/$(APP).s "testOnly leros.sim.LerosSimSpec"

hw:
	sbt "runMain leros.Leros asm/$(APP).s"

test-alu:
	sbt "test:runMain leros.AluTester"

all: all-hwsim all-swsim

all-hwsim:
	sbt -Dtestpath=$(TESTPATH) -Dtests=$(TESTS) "testOnly leros.LerosSpec"

all-swsim:
	for t in $(TESTS); do \
		make swsim APP=$$t; \
	done

# clean everything (including IntelliJ project settings)
clean:
	git clean -fd
