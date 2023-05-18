package itcm;


public class Simbolo {
    TipoDato tipoDato;
    String id;
    String valor;

    public Simbolo(TipoDato tipoDato, String id, String valor) {
        this.tipoDato = tipoDato;
        this.id = id;
        this.valor = valor;
    }
    
    public Simbolo(String tipoDato, String id, String valor) {
        
        
        switch (tipoDato) {
            case "int":
                this.tipoDato = TipoDato.INT;
                break;
            case "double":
                this.tipoDato = TipoDato.DOUBLE;
                break;
            case "string":
                this.tipoDato = TipoDato.STRING;
                break;
            case "char":
                this.tipoDato = TipoDato.CHAR;
                break;
            case "bool":
                this.tipoDato = TipoDato.BOOL;
                break;
            default:                
                this.tipoDato = TipoDato.CLASS;
        }        
        this.id = id;
        this.valor = valor;
        
       
    }
}