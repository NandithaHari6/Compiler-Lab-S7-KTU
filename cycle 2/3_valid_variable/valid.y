%{
    #include<stdio.h>
    int valid=1;
    int yyerror();
%}

%token digit letter

%%
start : letter s
s :     letter s
      | digit s
      |
      ;

%%

int yyerror(){  
    printf("\nIts not a identifier!\n");
   valid=0;
   return 0;}

int main(){ 
     printf("\nEnter a name to tested for identifier ");
    yyparse();
    if(valid){
    printf("\nIt is an identifier!\n");
    }
}