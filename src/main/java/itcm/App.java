package itcm;

import java.io.FileInputStream;

/**
 * Hello world!
 *
 */

import java.io.FileReader;
import java.io.StringReader;

import java_cup.runtime.Symbol;

public class App {
        public static void main(String[] args) {
                String input = new String("entrada.txt");
                TablaSimbolos tbl = new TablaSimbolos();
                Simbolo sim = new Simbolo(TipoDato.DOUBLE, "two", "2.2");
                tbl.añadirSimbolo(sim);

                System.out.println(tbl);

                Sintactico pars;
                try {
                    String path = System.getProperty("user.dir") + "\\src\\main\\java\\itcm\\test.txt";
                    FileReader fileReader = new FileReader(path);

                        Symbol s;
                        do {
                                s = pars.parse();
                                System.out.println(s.sym);
                                System.out.println(s.value);
                        } while (s.value != null);

                } catch (Exception e) {
                        System.out.println("Error " + e.getMessage());
                        e.printStackTrace();
                }

                // try {
                // Lexico lex = new Lexico(new FileReader(input));
                // lex.parse();
                // } catch(Exception ex) {
                // System.out.println("Error fatal en compilación de entrada.");
                // System.out.println("Causa: "+ex.getCause());
                // }
        }
}
