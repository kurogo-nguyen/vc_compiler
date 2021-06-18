//import java.io.*;
import java.io.FileReader;
import java.util.Scanner;

public class Main {
    public static void main(String[] argv) {
        /* Start the parser */
        String file_path;
        if (argv.length == 0){
            System.out.println("Enter path to process:");
            Scanner scanner = new Scanner(System. in);
            file_path = scanner.nextLine();
        } else {
            file_path = argv[0];
        }
        try {
            VCToken token;
            VC_Lexical lex = new VC_Lexical(new FileReader(file_path));
//            Object result = p.parse().value;
            while (!lex.yyatEOF()){
                token = lex.next_token();
                System.out.println(token.toString());

            }
        } catch (Exception e) {
            /* do cleanup here -- possibly rethrow e */
            e.printStackTrace();
        }
    }
}