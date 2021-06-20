import java.io.FileReader;
import java.util.Scanner;

public class Main {
    public static void main(String[] argv) {
        /* Start the parser */
        String file_path;
        if (argv.length == 0) {
            System.out.println("Enter path to process:");
            Scanner scanner = new Scanner(System.in);
            file_path = scanner.nextLine();
        } else {
            file_path = argv[0];
        }
        try {
            VC_Lexical lex = new VC_Lexical(new FileReader(file_path));
            parser p = new parser(lex);
            p.parse();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}