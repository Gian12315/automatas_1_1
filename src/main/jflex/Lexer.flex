package itcm;
import static itcm.Tokens.*;

%%

%public
%class Lexer
%type Tokens
%line
%column
%unicode
%ignorecase

%init{
    yyline = 1;
%init}

%{
    String name;
    int line;
%}

numbers = [:digit:]+(\.[:digit:]+)? 
letters = [:letter:]+
spaces = [ ,\t,\r\n]+
text = \".+\"

%%

// TODO: Terminar de cambiar el tipo de retorno de cada delimitador
// Operadores

// Delimitadores
";" {name=yytext(); line=yyline;return Punto_y_coma;}
"{" {name=yytext(); line=yyline;return Llave_izquierda;}
"}" {name=yytext(); line=yyline;return Llave_derecha;}
"(" {name=yytext(); line=yyline;return Parentesis_izquierdo;}
")" {name=yytext(); line=yyline;return Parentesis_derecho;}
", " {name=yytext(); line=yyline;return Coma;}

// Operadores Aritmeticos
"*" {name=yytext(); line=yyline;return Multiplicacion;}
"**" {name=yytext(); line=yyline;return Potencia;}
"+" {name=yytext(); line=yyline;return Suma;}
"-" {name=yytext(); line=yyline;return Sustraccion;}
"/" {name=yytext(); line=yyline;return Division;}
"%" {name=yytext(); line=yyline;return Modulo;}

// Operadores Concatenación
"..." {name=yytext(); line=yyline;return Concatenacion;}

// Operadores Rango
".." {name=yytext(); line=yyline;return Rango_exclusivo;}
"..=" {name=yytext(); line=yyline;return Rango_inclusivo;}

// Operadores Incremento
"++" {name=yytext(); line=yyline;return Incremento;}
"--" {name=yytext(); line=yyline;return Decremento;}

// Operadores Lógicos
"and" {name=yytext(); line=yyline;return AND;}
"not" {name=yytext(); line=yyline;return NOT;}
"or" {name=yytext(); line=yyline;return OR;}

// Operadores Relacionales
"<" {name=yytext(); line=yyline;return Menor;}
">" {name=yytext(); line=yyline;return Mayor;}
"<=" {name=yytext(); line=yyline;return Menor_igual;}
">=" {name=yytext(); line=yyline;return Mayor_igual;}
"==" {name=yytext(); line=yyline;return Identico;}
"<>" {name=yytext(); line=yyline;return Diferente;}

// Operadores Generales
"->" {name=yytext(); line=yyline;return Retorno;}
"=" {name=yytext(); line=yyline;return Igual;}

/// Palabras Reservadas

// Tipos de dato
"int"|
"double"|
"string"|
"char"|
"bool" {name=yytext(); line=yyline;return Tipo_de_dato;}

// Estructuras de control
"forif" {name=yytext(); line=yyline;return Forif;}
"for" {name=yytext(); line=yyline;return For;}
"if" {name=yytext(); line=yyline;return If;}
"else" {name=yytext(); line=yyline;return Else;}

// Manejo de funciones
"fun" {name=yytext(); line=yyline;return Funcion;}
"return" {name=yytext(); line=yyline;return Return;}

// Gestión de librerías
"import" {name=yytext(); line=yyline;return Import;}

// I/O
"input" {name=yytext(); line=yyline;return Input;}
"print" {name=yytext(); line=yyline;return Print;}

// Comentarios

"//" {System.out.println("//");}

" " {System.out.print("");}


{numbers}"." {name=yytext(); line=yyline;return Numero;}
{numbers} {name=yytext(); line=yyline;return Decimal;}
{letters} {name=yytext(); line=yyline;return Identificador;}

{spaces} {/* Ignore */}

{text} {name=yytext(); line=yyline;return Texto;}

. {name=yytext(); line=yyline;return Error;}
