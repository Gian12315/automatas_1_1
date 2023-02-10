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
// TODO: Buscar una mejor manera de realizarlo
expresion = ({numbers} | {letters})     ((\+|-|\*|\/)      ({numbers} | {letters})+)?
// 20 + 4
%%

"var " {letters} " = " {expresion} {
        System.out.println("line: " + yyline + ": variable");
        String tmp = yytext().trim();

        int first_space = tmp.indexOf(" ");
        int eq_sign = tmp.indexOf("=");
        String id_string = tmp.substring(first_space, eq_sign).trim();

        String value_string = tmp.substring(eq_sign+1).trim();

        System.out.println("id: " + id_string + " - value: " + value_string);
}

"print("{expresion}")" {
    System.out.println("line " + yyline + ": function");
    int par_izq = yytext().indexOf("(");
    int par_der = yytext().indexOf(")");
    System.out.println("fun: print - params: " + yytext().substring(par_izq+1, par_der));
}

[\t\r\f] { /* Espacios y tabulaciones */ }

^\s+$ { System.out.println("line " + yyline + ": void line"); }

. {
    System.out.print("?");
}

