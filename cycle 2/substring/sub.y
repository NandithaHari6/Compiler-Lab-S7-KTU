%{
#include<stdio.h>
%}
%token VL ER
%%
start:VL {printf("Error");}
%%
void yyerror(const char *str){printf("Valid");}
int yywrap(){return 1;}
main(){yyparse();}