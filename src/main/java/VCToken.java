import java_cup.runtime.Symbol;

public class VCToken extends Symbol implements sym {
    private final int line;
    private final int column;

    public VCToken(int type, Object value, int line, int column) {
        super(type, value);
        this.line = line;
        this.column = column;
    }

    public VCToken(int type, int line, int column) {
        this(type, null, line, column);
    }

    @Override
    public String toString() {
        return "line: " + String.format("%-3s", line) +
                ", column: " + String.format("%-3s", column) +
                ", type: " + String.format("%-20s", terminalNames[this.sym]) +
                (value == null ? "" : ", value: " + value);
    }

}
