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
";"|
"{"| 
"}"| 
"("| 
")" {name=yytext(); line=yyline;return Delimitador;}

// Operadores Aritmeticos
"*"| 
"**"| 
"+"| 
"-"| 
"/"| 
"%" {name=yytext(); line=yyline;return Operador_aritmetico;}

// Operadores Concatenación
"..." {name=yytext(); line=yyline;return Operador_concatenacion;}

// Operadores Rango
".."| 
"..=" {name=yytext(); line=yyline;return Operador_rango;}

// Operadores Incremento
"++"| 
"--" {name=yytext(); line=yyline;return Operador_incremento;}

// Operadores Lógicos
"and"| 
"not"| 
"or" {name=yytext(); line=yyline;return Operador_logico;}

// Operadores Relacionales
"<"| 
">"| 
"<="| 
">="| 
"=="| 
"<>" {name=yytext(); line=yyline;return Operador_relacional;}

// Operadores Generales
"->"| 
"=" {name=yytext(); line=yyline; return Operador_general;}

/// Palabras Reservadas

// Tipos de dato
"int"|
"double"|
"string"|
"char"|
"bool" {name=yytext(); line=yyline; return TipoDeDato;}

// Estructuras de control
"forif"| 
"for"|
"if" {name=yytext(); line=yyline; return Estructuras_control;}

// Manejo de funciones
"fun"|
"return" {name=yytext(); line=yyline; return Funciones;}

// Gestión de librerías
"import" {name=yytext(); line=yyline; return Libreria;}

// I/O
"input"|
"print" {name=yytext(); line=yyline; return Entradas_Salidas;}

// Comentarios

"//" {System.out.println("//");}

" " {System.out.print("");}

{numbers} {/* Ignore */}
{letters} {/* Ignore */}
{spaces} {/* Ignore */}
{text} {/* Ignore */}

. { name=yytext(); line=yyline; return ERROR; }