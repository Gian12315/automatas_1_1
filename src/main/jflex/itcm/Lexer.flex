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

%{
    String name;
%}
numbers = {:jdigit:}+
letters = {:jletter:}+
%%

"var " {letters} " = " {numbers} ";" {/* Inserte funcionalidad aquí */}
"name " [a-zA-Z] + {name = yytext().substring(5);} 
[Hh] "ello" {System.out.print(yytext() + " " + name + "!");}
