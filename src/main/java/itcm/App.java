package itcm;

/**
 * Hello world!
 *
 */

import java.io.FileReader;

public class App {
    public static void main(String[] args) {
        String input = new String("entrada.txt");
        TablaSimbolos tbl = new TablaSimbolos();
        Simbolo sim = new Simbolo(TipoDato.DOUBLE, "two", "2.2");
        tbl.añadirSimbolo(sim);

        System.out.println(tbl);

        // try {
        // Lexico lex = new Lexico(new FileReader(input));
        // lex.parse();
        // } catch(Exception ex) {
        // System.out.println("Error fatal en compilación de entrada.");
        // System.out.println("Causa: "+ex.getCause());
        // }
    }
}
