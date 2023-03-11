package itcm;
import java.util.*;

%%

%public
%class Lexico
%line
%column
%standalone
%unicode
%ignorecase

%init{
    yyline = 1;
%init}

%{
    String name;
%}

numbers = [:digit:]+(\.[:digit:]+)?
letters = [:jletter:]+
%%

/// Operadores

// Delimitadores
";" {System.out.println("del:final_linea");}
"{" {System.out.println("del:llave_izquierda");}
"}" {System.out.println("del:llave_derecha");}
"(" {System.out.println("del:paréntesis_izquierdo");}
")" {System.out.println("del:paréntesis_derecho");}

// Operadores Aritmeticos
"*" {System.out.println("op:multiplicación");}
"**" {System.out.println("op:potencia");}
"+" {System.out.println("op:suma");}
"-" {System.out.println("op:resta");}
"/" {System.out.println("op:división");}
"%" {System.out.println("op:modulo");}

// Operadores Concatenación
"..." {System.out.println("op:concatenación");}

// Operadores Rango
".." {System.out.println("op:rango_exclusivo");}
"..=" {System.out.println("op:inclusivo");}

// Operadores Incremento
"++" {System.out.println("op:incremento");}
"--" {System.out.println("op:decremento");}

// Operadores Lógicos
"and" {System.out.println("op:and");}
"not" {System.out.println("op:not");}
"or" {System.out.println("op:or");}

// Operadores Relacionales
"<" {System.out.println("op:menor");}
">" {System.out.println("op:mayor");}
"<=" {System.out.println("op:menor_igual");}
">=" {System.out.println("op:mayor_igual");}
"==" {System.out.println("op:igual");}
"<>" {System.out.println("op:diferente");}

// Operadores Generales
"->" {System.out.println("op:definición_retorno");}
"=" {System.out.println("op:asignación");}

/// Palabras Reservadas

// Tipos de dato
"int" {System.out.println("tipo:entero");}
"double" {System.out.println("tipo:decimal");}
"string" {System.out.println("tipo:cadena");}
"char" {System.out.println("tipo:carácter");}
"bool" {System.out.println("tipo:booleano");}

// Estructuras de control
"forif" {System.out.println("ctl:forif");}
"for" {System.out.println("ctl:for");}
"if" {System.out.println("ctl:if");}

// Manejo de funciones
"fun" {System.out.println("def:función");}
"return" {System.out.println("def:retorno");}

// Gestión de librerías
"import" {System.out.println("def:importar");}

// I/O
"input" {System.out.println("io:entrada");}
"print" {System.out.println("io:salida");}

// Comentarios

"//" {System.out.println("cmnt:comentario");}

" " {System.out.print("");}

{numbers} {System.out.println("var:" + yytext());}
{letters} {System.out.println("dig:" + yytext());}

. { System.out.println("?"); }

