%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex(void);


%}

%token DO WHILE CONDITION STMT

%%
PROGRAM: START {printf("Valid Syntax of do while\n");}
START: DO '{' STMT_LIST '}' WHILE CONDITION;
STMT_LIST: | START STMT_LIST | STMT;

%%


int main() {
    printf("Enter the do-while stmt to check for syntax validity: \n ");
    yyparse();   // Parse the input
    
    return 0;
}


void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
