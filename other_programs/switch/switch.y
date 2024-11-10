%{
    #include <stdio.h>
    #include <stdlib.h>
    int yyparse();
    void yyerror();
    int valid=1;
%}
%token SWITCH CASE DEFAULT STMT EXPR BREAK
%%
PROGRAM: START {printf("Valid switch syntax\n");};
START: SWITCH EXPR '{'  CASES DEF_STMT '}';
CASES: CASE STMT_LIST BREAK CASES | ;
DEF_STMT: DEFAULT STMT_LIST |  ;
STMT_LIST:START STMT_LIST| STMT STMT_LIST| ;

%%
void yyerror(){
    printf("Not valid");
  
}

int main() {
    printf("Enter an switch statementto check for validity:\n ");
    yyparse();   // Parse the input
        
    return 0;
}
