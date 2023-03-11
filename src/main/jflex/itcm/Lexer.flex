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
";" {System.out.println(";");}
"{" {System.out.println("{");}
"}" {System.out.println("}");}
"(" {System.out.println("(");}
")" {System.out.println(")");}

// Operadores Aritmeticos
"*" {System.out.println("*");}
"**" {System.out.println("**");}
"+" {System.out.println("+");}
"-" {System.out.println("-");}
"/" {System.out.println("/");}
"%" {System.out.println("%");}

// Operadores Concatenación
"..." {System.out.println("...");}

// Operadores Rango
".." {System.out.println("..");}
"..=" {System.out.println("..=");}

// Operadores Incremento
"++" {System.out.println("++");}
"--" {System.out.println("--");}

// Operadores Lógicos
"and" {System.out.println("and");}
"not" {System.out.println("not");}
"or" {System.out.println("or");}

// Operadores Relacionales
"<" {System.out.println("<");}
">" {System.out.println(">");}
"<=" {System.out.println("<=");}
">=" {System.out.println(">=");}
"==" {System.out.println("==");}
"<>" {System.out.println("<>");}

// Operadores Generales
"->" {System.out.println("->");}
"=" {System.out.println("=");}

/// Palabras Reservadas

// Tipos de dato
"int" {System.out.println("int");}
"double" {System.out.println("double");}
"string" {System.out.println("string");}
"char" {System.out.println("char");}
"bool" {System.out.println("bool");}

// Estructuras de control
"forif" {System.out.println("forif");}
"for" {System.out.println("for");}
"if" {System.out.println("if");}

// Manejo de funciones
"fun" {System.out.println("fun");}
"return" {System.out.println("return");}

// Gestión de librerías
"import" {System.out.println("import");}

// I/O
"input" {System.out.println("input");}
"print" {System.out.println("print");}

// Comentarios

"//" {System.out.println("//");}

" " {System.out.print("");}

{numbers} {System.out.println(yytext());}
{letters} {System.out.println(yytext());}

. { System.out.println("{error}"); }

