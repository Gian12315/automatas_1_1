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

%%

// TODO: Terminar de cambiar el tipo de retorno de cada delimitador
// Operadores

// Delimitadores
";"|
"{"| 
"}"| 
"("| 
")"{name=yytext(); line=yyline;return Delimitador;} 

// Operadores Aritmeticos
"*"| 
"**"| 
"+"| 
"-"| 
"/"| 
"%" {name=yytext(); line=yyline;return Operador_aritmetico;}

// Operadores Concatenación
"..."{name=yytext(); line=yyline;return Operador_concatenación;}

// Operadores Rango
".."| 
"..="{name=yytext(); line=yyline;return Operador_rango;}

// Operadores Incremento
"++"| 
"--"{name=yytext(); line=yyline;return Operador_incremento;} 

// Operadores Lógicos
"and"| 
"not"| 
"or"{name=yytext(); line=yyline;return Operador_logico;} 

// Operadores Relacionales
"<"| 
">"| 
"<="| 
">="| 
"=="| 
"<>"{name=yytext(); line=yyline;return Operador_relacional;} 

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
"if"|

// Manejo de funciones
"fun"|
"return"| 

// Gestión de librerías
"import"|

// I/O
"input"|
"print"{name=yytext(); line=yyline; return Reservadas;}

// Comentarios

"//" {System.out.println("//");}

" " {System.out.print("");}

//Identificadores
{L}{L}{D}*{name=yytext();line=yyline;return Identificador;}
//Numeros
("(-"{D}+")")|{D}+{name=yytext();line=yyline;return Numero;}

{numbers} {System.out.println(yytext());}
{letters} {System.out.println(yytext());}
{spaces} {/* Ignore */}
. { return ERROR; }