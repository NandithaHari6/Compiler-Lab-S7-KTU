%{
#include <stdio.h>
#include <stdlib.h>
%}

%token IF ELSEIF ELSE STMT
%token CONDITION

%%
program:
        statement{printf("Valid Syntax of if-else\n");}
        ;

statement:
        if_statement
        ;

if_statement:
        IF CONDITION '{' statement_list'}' elseif_statements else_statement 
        ;

elseif_statements:
        /* epsilon */
        | ELSEIF CONDITION '{' statement_list '}' elseif_statements
        ;

else_statement:
        /* epsilon */
        | ELSE '{'statement_list'}'
        ;

statement_list:
        /* epsilon */
        | statement statement_list
        | STMT
        ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

