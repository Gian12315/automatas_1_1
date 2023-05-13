package itcm;

import java.util.HashMap;

import itcm.TipoDato;

/**
 * InnerTablaSimbolos
 */
class Simbolo {
    TipoDato tipoDato;
    String id;
    String valor;

    public Simbolo(TipoDato tipoDato, String id, String valor) {
        this.tipoDato = tipoDato;
        this.id = id;
        this.valor = valor;
    }
}

/**
 * TablaSimbolos
 */
public class TablaSimbolos {
    HashMap<String, Simbolo> tablaSimbolos;

    public TablaSimbolos() {
        tablaSimbolos = new HashMap<String, Simbolo>();
    }

    public void añadirSimbolo(Simbolo simbolo) {
        tablaSimbolos.put(simbolo.id, simbolo);
    }

    public void removerSimbolo(String id) {
        tablaSimbolos.remove(id);
    }

    public String toString() {
        StringBuilder output = new StringBuilder();
        output.append("Tipo,Identificador,Valor\n");
        for (Simbolo simbolo : tablaSimbolos.values()) {
            output.append(simbolo.tipoDato);
            output.append(",");
            output.append(simbolo.id);
            output.append(",");
            output.append(simbolo.valor);
            output.append("\n");
        }

        return output.toString();
    }
}
