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

                FileReader fileReader = null;
                try {
                       fileReader = new FileReader("test.txt");
                }catch (Exception e) {
                        System.out.println("Error at reading the input");
                        e.printStackTrace();
                }

                Syntax pars = new Syntax(new LexerCup(fileReader));
                try {
                        pars.parse();
                } catch (Exception e) {
                        Symbol s = pars.getS();
                        System.out.println("Error " + e.getMessage());
                        int row = s.right;
                        int col = s.left;
                        Object value = s.value;

                        System.out.println("Línea: " + row);
                        System.out.println("Columna: " + col);
                        System.out.println("Valor: " + value);
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
