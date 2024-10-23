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
/*The program only checks the syntax of a for loop header 
The input MUST NOT have any spaces between the tokens

Valid inputs:

for(;;)				[Loop header with no initialization statement, no test expression, no update statement]

for(i=0;i<n;i++)		[Loop header with all the statements and expressions]

for(i=0,j=0;i<n,j<n;i++,j--)	[Loop header with multiple statements and expressions]

for(;i<n;)			[Loop header with only the test expression]

for(i=0;;)			[Loop header with only the initialization statement]

for(;;i++)			[Loop header with only the update statement]

				[Any combination of the above three inputs]
                To run:
yacc -d for.y
lex for.l
gcc lex.yy.c y.tab.c -o for -ll 
./for


                */