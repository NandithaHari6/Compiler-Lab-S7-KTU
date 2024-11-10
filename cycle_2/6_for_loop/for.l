%{
#include "y.tab.h"
%}

%%
for					return FOR;
[\(\)]					return PARANTHESIS;
[a-zA-Z0-9]*				return OPERAND;
"="|"<"|">"|">="|"<="|"=="|"++"|"--"	return OPERATOR;
\;					return SEMICOLON;
,					return COMMA;
[\{\}]                  return CURLYBRACE;
                 
\n					return NEWLINE;
.					;
%%

int yywrap()
{
	return 1;
}
/*
                To run:
yacc -d for.y
lex for.l
gcc lex.yy.c y.tab.c -o for -ll 
./for


Input format:  for(i=0;i<10;i++){for(j=0;j<10;j++){}
}
Click Clt + D after the input. (Click ENTER after closing curly braces '}')

 
                */