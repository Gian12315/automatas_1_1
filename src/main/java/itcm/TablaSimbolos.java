package itcm;

import java.util.HashMap;

/**
 * TablaSimbolos
 */
public class TablaSimbolos {
    HashMap<String, Simbolo> tablaSimbolos;

    public TablaSimbolos() {
        tablaSimbolos = new HashMap<String, Simbolo>();
    }

    public void añadirSimbolo(Simbolo simbolo) {
        if (!buscarSimbolo(simbolo.id)) {
            tablaSimbolos.put(simbolo.id, simbolo);
        } else {
            System.err.println("Ya existe el simbolo '" + simbolo.id + "', ha sido ignorado");
        }
    }
    
    public boolean buscarSimbolo(String id) {
        return tablaSimbolos.containsKey(id);
    }
    
    public String retornaValor(String identificador) throws SymbolNotFound {
        if (!buscarSimbolo(identificador)) {
            throw new SymbolNotFound("Simbolo no encontrado", identificador);
        }
        return tablaSimbolos.get(identificador).valor;
    }
    
    public TipoDato retornaTipo(String identificador) throws SymbolNotFound {
        if (!buscarSimbolo(identificador)) {
            throw new SymbolNotFound("Simbolo no encontrado", identificador);
        }
        return tablaSimbolos.get(identificador).tipoDato;
    }

    public void removerSimbolo(String id) {
        tablaSimbolos.remove(id);
    }
    
    public HashMap<String, Simbolo> getInnerMap() {
        return tablaSimbolos;
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
