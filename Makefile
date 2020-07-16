
APP=base
TESTS=base lhi lhi2 lognosign reg imm

hwsim:
	sbt -Dprogram=asm/$(APP).s "testOnly leros.LerosSpec"

swsim:
	sbt -Dprogram=asm/$(APP).s "testOnly leros.sim.LerosSimSpec"

hw:
	sbt "runMain leros.Leros asm/$(APP).s"

test-alu:
	sbt "test:runMain leros.AluTester"

all:
	for t in $(TESTS); do \
		make hwsim APP=$$t; \
		make swsim APP=$$t; \
	done

all-swsim:
	for t in $(TESTS); do \
		make swsim APP=$$t; \
	done

# clean everything (including IntelliJ project settings)

clean:
	git clean -fd
