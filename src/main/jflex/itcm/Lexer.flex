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
";"|
"{"| 
"}"| 
"("| 
")" {return new Symbol(syn.DELIMITADOR, yyline, yycolumn, yytext());}

// Operadores Aritmeticos
"*"| 
"**"| 
"+"| 
"-"| 
"/"| 
"%" {return new Symbol(syn.OPERADOR_ARITMETICO, yyline, yycolumn, yytext());}

// Operadores Concatenación
"..." {return new Symbol(syn.OPERADOR_CONCATENACION, yyline, yycolumn, yytext());}

// Operadores Rango
".."| 
"..=" {return new Symbol(syn.OPERADOR_RANGO, yyline, yycolumn, yytext());}

// Operadores Incremento
"++"| 
"--" {return new Symbol(syn.OPERADOR_INCREMENTO, yyline, yycolumn, yytext());}

// Operadores Lógicos
"and"| 
"not"| 
"or" {return new Symbol(syn.OPERADOR_LOGICO, yyline, yycolumn, yytext());}

// Operadores Relacionales
"<"| 
">"| 
"<="| 
">="| 
"=="| 
"<>" {return new Symbol(syn.OPERADOR_RELACIONAL, yyline, yycolumn, yytext());}

// Operadores Generales
"->"| 
"=" {return new Symbol(syn.OPERADOR_GENERAL, yyline, yycolumn, yytext());}

/// Palabras Reservadas

// Tipos de dato
"int"|
"double"|
"string"|
"char"|
"bool" {return new Symbol(syn.TIPODEDATO, yyline, yycolumn, yytext());}

// Estructuras de control
"forif"| 
"for"|
"if" {return new Symbol(syn.ESTRUCTURAS_CONTROL, yyline, yycolumn, yytext());}

// Manejo de funciones
"fun"|
"return" {return new Symbol(syn.FUNCIONES, yyline, yycolumn, yytext());}

// Gestión de librerías
"import" {return new Symbol(syn.LIBRERIA, yyline, yycolumn, yytext());}

// I/O
"input"|
"print" {return new Symbol(syn.ENTRADAS_SALIDAS, yyline, yycolumn, yytext());}

// Comentarios

"//" {System.out.println("//");}

" " {System.out.print("");}


{numbers}"."{return new Symbol(syn.DECIMAL, yyline, yycolumn, yytext());}
{numbers} {return new Symbol(syn.NUMERO, yyline, yycolumn, yytext());}
{letters} {return new Symbol(syn.IDENTIFICADOR, yyline, yycolumn, yytext());}

{spaces} {/* Ignore */}

{text} {return new Symbol(syn.TEXTO, yyline, yycolumn, yytext());}

. {return new Symbol(syn.ERROR, yyline, yycolumn, yytext());}
