/*lex program to count number of words*/

%{ 
#include<stdio.h> 
#include<string.h> 

int i = 0;
int flag=0; 
char name[50]="";
%} 

/* Rules Section*/
%% 
[a-zA-Z]* {
	for(i=0;i<yyleng;i++){
		if(yytext[i]=='n' && yytext[i+1]=='a' && yytext[i+2]=='n' && yytext[i+3]=='d'){
			flag=1;
		}
	}
	strcpy(name,yytext);
}
[\n] {
 if(flag==1){printf("%s contains 4 letters of name as substring\n",name);
 flag=0;
 strcpy(name,"");
}else{
printf("%s does not contain 4 letters of name as  substring\n",name);
strcpy(name,"");
}
}


%% 


int main() 
{ printf("Enter the sentence");
	// The function that starts the analysis 
	yylex(); 
	

	return 0; 
} 
