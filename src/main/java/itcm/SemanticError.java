/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package itcm;

/**
 *
 * @author Admin
 */
public class SemanticError extends Exception {
    Simbolo symbol;
    public SemanticError(String errorMessage) {
        super(errorMessage);
    }
    public SemanticError(String errorMessage, Simbolo simbolo) {
        this(errorMessage);
        this.symbol = simbolo;
    }
}
