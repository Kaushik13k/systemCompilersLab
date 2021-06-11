%{
	#include<stdio.h>
	#include<stdlib.h>
	int result=0;
%}

%token num
%left '+' '-'
%left '*' '/'

%% 
S: E     	 {result=$1;} 
E: E'+'E	 {$$=$1+$3;}
|E'-'E	         {$$=$1-$3;}
|E'*'E	         {$$=$1*$3;}
|E'/'E 	         { if($3!=0)
		    {
		      $$=$1/$3;
		     }
		    else
		    {
          			printf("Divide by Zero\n");
			        exit(0);
		     }
		     }
|'('E')'	 {$$=$2;}
|num 		 {$$=$1;}
|  		;

%%
int main()
{
	printf("Enter an expression:\n");
	yyparse();
	printf("valid expression");
	printf("Result of the expression is %d ",result);
}
int yyerror()
{
	printf("error"); exit(0);
}