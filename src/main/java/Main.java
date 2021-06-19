//import java.io.*;
import java.io.FileReader;

public class Main {
    public static void main(String[] argv) {
        /* Start the parser */
        String file_path = "src/test/data/test.txt";
//        if (argv.length == 0){
//            System.out.println("Enter path to process:");
//            Scanner scanner = new Scanner(System. in);
//            file_path = scanner.nextLine();
//        } else {
//            file_path = argv[0];
//        }
        try {
            VCToken token;
            VC_Lexical lex = new VC_Lexical(new FileReader(file_path));
            parser p = new parser(lex);
            p.parse();
        } catch (Exception e) {
            /* do cleanup here -- possibly rethrow e */
            e.printStackTrace();
        }
    }
}