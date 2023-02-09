package itcm;

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

%%

"name " [a-zA-Z] + {name = yytext().substring(5);} 
[Hh] "ello" {System.out.print(yytext() + " " + name + "!");}
