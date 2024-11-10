%{
#include "y.tab.h"
%}

%%

"if"       { return IF; }
"else if"  { return ELSEIF; }
"else"     { return ELSE; }

"("[a-zA-Z0-9]+(">"|"<"|">="|"<="|"==")[a-zA-Z0-9]+")"  { return CONDITION; }
[a-zA-Z0-9]* {return STMT;}
"{" { return '{'; }
"}" { return '}'; }
\n         ;
[ \t]      ;

%%

int yywrap() {
    return 1;
}
