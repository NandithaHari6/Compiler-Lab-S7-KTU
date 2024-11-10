%{
    #include "y.tab.h"
%}
%%
"switch" {return SWITCH;}
"default:" {return DEFAULT;}
"break" return BREAK;
"("[a-zA-Z0-9]+")"  { return EXPR; }
"case("[a-zA-Z0-9]+"):" {return CASE;}

[a-zA-Z0-9]* {return STMT;}
"{" { return '{'; }
"}" { return '}'; }
\n  ;       ;
[ \t]      ;
%%
int yywrap(){
    return 1;
}