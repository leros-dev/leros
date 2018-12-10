
base:
	sbt "test:runMain leros.LerosTester asm/base.asm"

test-alu:
	sbt "test:runMain leros.AluTester"

sim:
	sbt "runMain leros.sim.LerosSim asm/base.asm"

