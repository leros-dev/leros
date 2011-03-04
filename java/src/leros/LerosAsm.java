package leros;

import java.io.FileReader;
import java.io.IOException;
import java.io.Serializable;
import java.io.StreamTokenizer;
import java.util.HashMap;
import java.util.Map;

public class LerosAsm {

	public static class Line implements Serializable {
		private static final long serialVersionUID = 1L;

		int jinstr;
		String label;
		// Instruction instr;
		String instr; // just a hack
		int special;
		int intVal;
		String symVal;
		boolean nxt;
		boolean opd;
	}

	private Line getLine(StreamTokenizer in) {

		Line l = new Line();
		l.jinstr = -1;

		try {
			for (int cnt = 0; in.nextToken() != StreamTokenizer.TT_EOL; ++cnt) {

				if (in.ttype == StreamTokenizer.TT_WORD) {

					int pos = in.sval.indexOf(":");
					if (pos != -1) {
						String s = in.sval.substring(0, pos);
						l.label = s;
					} else {
						if (in.sval.equals("nxt")) {
							l.nxt = true;
						} else if (in.sval.equals("opd")) {
							l.opd = true;
						} else {
//							Instruction i = Instruction.get(in.sval);
							String i = in.sval; // just a quick hack
							if (i == null) {
								l.symVal = in.sval;
							} else if (l.instr == null) {
								l.instr = i;
							}
						}
					}

				} else if (in.ttype == StreamTokenizer.TT_NUMBER) {

					l.intVal = (int) in.nval;

				} else if (in.ttype == '=') {
					l.special = in.ttype;
				} else if (in.ttype == '?') {
					l.special = in.ttype;
				} else {
					error(in, "'" + (char) in.ttype + "' syntax");
				}
			} // EOL
		} catch (IOException e) {
			System.out.println(e.getMessage());
			System.exit(-1);
		}

		return l;
	}

	String fname;
	private Map<String, Integer> symMap = new HashMap<String, Integer>();
	boolean error;
	private int memcnt = 0;

	public LerosAsm(String[] args) {
		fname = args[0];
	}

	private StreamTokenizer getSt() {

		try {
			FileReader fileIn = new FileReader(fname);
			StreamTokenizer in = new StreamTokenizer(fileIn);

			in.wordChars('_', '_');
			in.wordChars(':', ':');
			in.eolIsSignificant(true);
			in.slashStarComments(true);
			in.slashSlashComments(true);
			in.lowerCaseMode(true);
			return in;
		} catch (IOException e) {
			System.out.println(e.getMessage());
			System.exit(-1);
			return null;
		}
	}

	void error(StreamTokenizer in, String s) {
		System.out.println((in.lineno() - 1) + " error: " + s);
		error = true;
	}

	/**
	 * Parse the assembler file and build symbol table (first pass). During this
	 * pass, the assembler code, the symboltable and vartable are build.
	 * 
	 * @return the map from program locations (pc) to microcode lines
	 */
	public void pass1() {
		StreamTokenizer in = getSt();
		int pc = 0;

		try {
			while (in.nextToken() != StreamTokenizer.TT_EOF) {
				in.pushBack();
				Line l = getLine(in);
				System.out.println("Hello");
				// System.out.println("L"+in.lineno()+" "+l.jinstr+" "+l.label+" "+l.instr+" '"+(char)
				// l.special+"' "+l.intVal+" "+l.symVal);

				if (l.jinstr == -1) {
					if (l.label != null) {
						if (symMap.containsKey(l.label)) {
							error(in, "symbol " + l.label + " already defined");
						} else {
							symMap.put(l.label, new Integer(pc));
						}
					}

					if (l.special == '=') {
						if (l.symVal == null) {
							error(in, "missing symbol for '='");
						} else {
							if (symMap.containsKey(l.symVal)) {
								error(in, "symbol " + l.symVal
										+ " allready defined");
							} else {
								symMap.put(l.symVal, new Integer(l.intVal));
							}
						}
					} else if (l.special == '?') {
						if (symMap.containsKey(l.symVal)) {
							error(in, "symbol " + l.symVal
									+ " allready defined");
						} else {
							symMap.put(l.symVal, new Integer(memcnt++));
							// varList.add(l.symVal);
						}
					}

				} else {
					// jinstrMap.put(l.jinstr,pc);
				}
				if (l.instr != null) {
					++pc;
					// instructions.add(l);
				}
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
			System.exit(-1);
		}
		// System.out.println(symMap);
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		if (args.length < 1) {
			System.out
					.println("usage: java Jopa [-s srcDir] [-d dstDir] filename");
			System.exit(-1);
		}
		LerosAsm la = new LerosAsm(args);
		la.pass1();

	}

}
