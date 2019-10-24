
APP=base
TESTS=base reg lhi imm

hwsim:
	sbt "test:runMain leros.LerosTester asm/$(APP).s"

swsim:
	sbt "runMain leros.sim.LerosSim asm/$(APP).s"

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
