/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package itcm;

import java.util.LinkedList;

/**
 *
 * @author Admin
 */
public class Operation {
    public String op;
    public TipoDato type;
    
    Operation(Object op, Object type) {
        this.op = op.toString();
        this.type = (TipoDato) type;
        
    }
}
