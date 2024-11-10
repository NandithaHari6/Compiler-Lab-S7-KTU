%{
    #include "y.tab.h"
%}
%%
"do" {return DO;}
"while" {return WHILE;}
[a-zA-Z0-9]* return STMT;
"("[a-zA-Z0-9]+(">"|"<"|">="|"<="|"==")[a-zA-Z0-9]+")"  { return CONDITION; }
"{" { return '{'; }
"}" { return '}'; }
\n         ;
[ \t]      ;

%%
int yywrap(){
    return 1;
}