/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package itcm;

/**
 *
 * @author Admin
 */
public class SymbolNotFound extends Exception {
    String id;
    public SymbolNotFound(String errorMessage) {
        super(errorMessage);
    }
    public SymbolNotFound(String errorMessage, String id) {
        this(errorMessage);
        this.id = id;
    }
}
