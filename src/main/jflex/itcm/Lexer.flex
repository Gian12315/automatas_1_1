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
%cup

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
";" {return new Symbol(syn.P_COMA, yyline, yycolumn, yytext());}
"{" {return new Symbol(syn.I_LLAVE, yyline, yycolumn, yytext());}
"}" {return new Symbol(syn.D_LLAVE, yyline, yycolumn, yytext());}
"(" {return new Symbol(syn.I_PAR, yyline, yycolumn, yytext());}
")" {return new Symbol(syn.D_PAR, yyline, yycolumn, yytext());}
", " {return new Symbol(syn.COMA, yyline, yycolumn, yytext());}

// Operadores Aritmeticos
"*" {return new Symbol(syn.MUL, yyline, yycolumn, yytext());}
"**" {return new Symbol(syn.POW, yyline, yycolumn, yytext());}
"+" {return new Symbol(syn.SUM, yyline, yycolumn, yytext());}
"-" {return new Symbol(syn.SUB, yyline, yycolumn, yytext());}
"/" {return new Symbol(syn.DIV, yyline, yycolumn, yytext());}
"%" {return new Symbol(syn.MOD, yyline, yycolumn, yytext());}

// Operadores Concatenación
"..." {return new Symbol(syn.CONCAT, yyline, yycolumn, yytext());}

// Operadores Rango
".." {return new Symbol(syn.EX_RANGO, yyline, yycolumn, yytext())};
"..=" {return new Symbol(syn.IN_RANGO, yyline, yycolumn, yytext());}

// Operadores Incremento
"++" {return new Symbol(syn.INC, yyline, yycolumn, yytext());}
"--" {return new Symbol(syn.DEC, yyline, yycolumn, yytext());}

// Operadores Lógicos
"and" {return new Symbol(syn.AND, yyline, yycolumn, yytext());}
"not" {return new Symbol(syn.NOT, yyline, yycolumn, yytext());}
"or" {return new Symbol(syn.OR, yyline, yycolumn, yytext());}

// Operadores Relacionales
"<" {return new Symbol(syn.MENOR, yyline, yycolumn, yytext());}
">" {return new Symbol(syn.MAYOR, yyline, yycolumn, yytext());}
"<=" {return new Symbol(syn.MENOR_IGUAL, yyline, yycolumn, yytext());}
">=" {return new Symbol(syn.MAYOR_IGUAl, yyline, yycolumn, yytext());}
"==" {return new Symbol(syn.IDENTICO, yyline, yycolumn, yytext());}
"<>" {return new Symbol(syn.DIFERENTE, yyline, yycolumn, yytext());}

// Operadores Generales
"->" {return new Symbol(syn.RETORNO, yyline, yycolumn, yytext());}O 
"=" {return new Symbol(syn.IGUAL , yyline, yycolumn, yytext());}

/// Palabras Reservadas

// Tipos de dato
"int"|
"double"|
"string"|
"char"|
"bool" {return new Symbol(syn.TIPODEDATO, yyline, yycolumn, yytext());}

// Estructuras de control
"forif" {return new Symbol(syn.FORIF, yyline, yycolumn, yytext());}
"for" {return new Symbol(syn.FOR, yyline, yycolumn, yytext());}
"if" {return new Symbol(syn.IF, yyline, yycolumn, yytext());}

// Manejo de funciones
"fun" {return new Symbol(syn.FUN, yyline, yycolumn, yytext());}
"return" {return new Symbol(syn.RETURN, yyline, yycolumn, yytext());}

// Gestión de librerías
"import" {return new Symbol(syn.IMPORT, yyline, yycolumn, yytext());}

// I/O
"input" {return new Symbol(syn.INPUT, yyline, yycolumn, yytext());}
"print" {return new Symbol(syn.PRINT, yyline, yycolumn, yytext());}

// Comentarios

"//" {System.out.println("//");}

" " {System.out.print("");}


{numbers}"."{return new Symbol(syn.DECIMAL, yyline, yycolumn, yytext());}
{numbers} {return new Symbol(syn.NUMERO, yyline, yycolumn, yytext());}
{letters} {return new Symbol(syn.IDENTIFICADOR, yyline, yycolumn, yytext());}

{spaces} {/* Ignore */}

{text} {return new Symbol(syn.TEXTO, yyline, yycolumn, yytext());}

. {return new Symbol(syn.ERROR, yyline, yycolumn, yytext());}
