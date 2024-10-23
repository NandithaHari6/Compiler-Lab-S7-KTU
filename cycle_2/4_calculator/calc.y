%{
#include <stdio.h>
#include <stdlib.h>

// Declare external functions
void yyerror(char *s);
int yylex(void);


%}

/* Declare tokens */
%token NUMBER

%%
/* Grammar rules for arithmetic expressions */
start:  expression             { printf(" Result is : %d\n", $1); }
        ;

expression:
      expression '+' term         { $$ = $1 + $3; }
    | expression '-' term         { $$ = $1 - $3; }
    | term                        { $$ = $1; }
    ;

term:
      term '*' factor             { $$ = $1 * $3; }
    | term '/' factor             { $$ = $1 / $3; }
    | factor                      { $$ = $1; }
    ;

factor:
      '(' expression ')'          { $$ = $2; }     // Value inside parentheses
    | NUMBER                      { $$ = $1; }     // The value of the number
    ;

%%

/* Main function */
int main() {
    printf("Enter an arithmetic expression: ");
    yyparse();   // Parse the input
    
    return 0;
}

/* Error handling function */
void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
