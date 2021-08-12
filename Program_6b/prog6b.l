%option noyywrap
%{
	#include<stdio.h>
	#include"y.tab.h"
	extern int yylval;
%}

%%
[\+\-\*\/\=]	{printf("%s is operator \n",yytext);
		return OP;}

[0-9]*		{yylval=atoi(yytext);
		printf("%d is a number\n",yylval);
		return  DIGIT;}


int|char|bool|float|void|for|do|while|if|else|return 	{printf("%s is keyword \n",yytext);
							 return KEY;}

[a-zA-Z]+	{printf("identifier is %s\n",yytext);
		return ID;}

.		;
%%