package leros;

public class Instruction {

	public String name;
	public int opcode;
	public int opdSize;

	public Instruction(String s, int opc) {
		name = s;
		opcode = opc;
		opdSize = 8;
	}

	private static Instruction[] ia = new Instruction[] {
		new Instruction("ld", 0x1234),
		new Instruction("add", 0x7788),
		new Instruction("sub", 0x2233),
	};

	public static Instruction get(String sval) {
		
		for (int i=0; i<ia.length; ++i) {
			if (ia[i].name.equals(sval)) {
				return ia[i];
			}
		}
		// TODO Auto-generated method stub
		return null;
	}

}
