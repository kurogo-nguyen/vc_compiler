import java_cup.runtime.Symbol;

public class VCToken extends Symbol implements sym {
    private final int line;
    private final int column;
    private final String str;

    public VCToken(int id, Object o, int line, int column, String str) {
        super(id, o);
        this.line = line;
        this.column = column;
        this.str = str;
    }

    public VCToken(int sym_num, Object o, int line, int column) {
        this(sym_num, o, line, column, null);
    }
//
//    public VCToken(int type, int line, int column) {
//        this(type, null, line, column);
//    }

    @Override
    public String toString() {
        return "type: " + String.format("%-20s", terminalNames[this.sym]) +
                ", value: " + (str == null ? value : str);
    }

}
