
%{
#include <stdio.h>
%}


LETRA   [a-zA-Z]
DIGITO  [0-9]

PALAVRA  {LETRA}+
INTEIRO  {DIGITO}+
/*(0) deve ter esse inteiro em especifico (0)*(1)*(2) entra com 012 12 2
[]\;*/

USUARIO [a-zA-Z0-9]+
SIMBOLOS[-_.]
OSDOIS[-_.a-zA-Z0-9]
NAOTEMEMFRASE[-_]
/*primeiro os casos em que nao imprime nada mesmo tendo o formato (comeca ou termina com simbolo), depois os que podem e por ultimo os simbolos que nao podem ser impressos sozinhos porque ^space nao funcionou*/
%%

{SIMBOLOS}+{USUARIO}{OSDOIS}*{USUARIO}[@]+{USUARIO}[.]+[c][o][m] ; 
{SIMBOLOS}+{USUARIO}{OSDOIS}*{USUARIO}[@]+{USUARIO}+ ; 
{USUARIO}{OSDOIS}*{USUARIO}[@]+{USUARIO}[.]+[c][o][m]+{NAOTEMEMFRASE} ;
{USUARIO}{SIMBOLOS}*{USUARIO}[@]+{USUARIO}+{NAOTEMEMFRASE} ;

{USUARIO}{OSDOIS}*{USUARIO}[@]+{USUARIO}{OSDOIS}+{USUARIO}[.]+[c][o][m]+ { printf("%s\n", yytext); }
{USUARIO}{OSDOIS}*{USUARIO}[@]+{USUARIO}{OSDOIS}+{USUARIO}+ { printf("%s\n", yytext); }
{USUARIO}{OSDOIS}*{USUARIO}[@]+{USUARIO}+ { printf("%s\n", yytext); }
{USUARIO} ;
[,]+ ;
[!]+ ;
[@]+ ;
{SIMBOLOS}+ ;
[[:space:]]+ ;
[.\n]* ;
%%


int main() {
  yylex();
  return 0;
}
