/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package itcm;

/**
 *
 * @author Admin
 */
public class InvalidTypes extends Exception {
    TipoDato a, b;
    public InvalidTypes(String errorMessage) {
        super(errorMessage);
    }
    public InvalidTypes(String errorMessage, TipoDato a, TipoDato b) {
        this(errorMessage);
        this.a = a;
        this.b = b;
    }
}
