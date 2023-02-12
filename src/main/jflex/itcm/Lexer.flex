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
";" {System.out.print(" del:final_linea");}
"{" {System.out.print(" del:llave_izquierda");}
"}" {System.out.print(" del:llave_derecha");}
"(" {System.out.print(" del:paréntesis_izquierdo");}
")" {System.out.print(" del:paréntesis_derecho");}

// Operadores Aritmeticos
"*" {System.out.print(" op:multiplicación");}
"**" {System.out.print(" op:potencia");}
"+" {System.out.print(" op:suma");}
"-" {System.out.print(" op:resta");}
"/" {System.out.print(" op:división");}
"%" {System.out.print(" op:modulo");}

// Operadores Concatenación
"..." {System.out.print(" op:concatenación");}

// Operadores Rango
".." {System.out.print(" op:rango_exclusivo");}
"..=" {System.out.print(" op:inclusivo");}

// Operadores Incremento
"++" {System.out.print(" op:incremento");}
"--" {System.out.print(" op:decremento");}

// Operadores Lógicos
"and" {System.out.print(" op:and");}
"not" {System.out.print(" op:not");}
"or" {System.out.print(" op:or");}

// Operadores Relacionales
"<" {System.out.print(" op:menor");}
">" {System.out.print(" op:mayor");}
"<=" {System.out.print(" op:menor_igual");}
">=" {System.out.print(" op:mayor_igual");}
"==" {System.out.print(" op:igual");}
"<>" {System.out.print(" op:diferente");}

// Operadores Generales
"->" {System.out.print(" op:definición_retorno");}
"=" {System.out.print(" op:asignación");}

/// Palabras Reservadas

// Tipos de dato
"int" {System.out.print(" tipo:entero");}
"double" {System.out.print(" tipo:decimal");}
"string" {System.out.print(" tipo:cadena");}
"char" {System.out.print(" tipo:carácter");}
"bool" {System.out.print(" tipo:booleano");}

// Estructuras de control
"forif" {System.out.print(" ctl:forif");}
"for" {System.out.print(" ctl:for");}
"if" {System.out.print(" ctl:if");}

// Manejo de funciones
"fun" {System.out.print(" def:función");}
"return" {System.out.print(" def:retorno");}

// Gestión de librerías
"import" {System.out.print(" def:importar");}

// I/O
"input" {System.out.print(" io:entrada");}
"print" {System.out.print(" io:salida");}

// Comentarios

"//" {System.out.print(" cmnt:comentario");}

" " {System.out.print(" ");}

{numbers} {System.out.print(" var:" + yytext());}
{letters} {System.out.print(" dig:" + yytext());}

. { System.out.print(" ?"); }

