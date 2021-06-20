import java_cup.runtime.Symbol;

public class VCToken extends Symbol implements sym {
    private final String str;

    public VCToken(int id, Object o, String str) {
        super(id, o);
        this.str = str;
    }

    public VCToken(int sym_num, Object o) {
        this(sym_num, o, null);
    }

    @Override
    public String toString() {
        return "Class: " + String.format("%-12s", terminalNames[this.sym]) +
                "\t , Text: " + (str == null ? value : str);
    }

}
