
base:
	sbt "test:runMain leros.LerosTester asm/base.asm"

sim:
	sbt "runMain leros.sim.LerosSim asm/base.asm"

