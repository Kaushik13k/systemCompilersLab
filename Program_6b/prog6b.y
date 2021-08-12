%{
	#include<stdio.h>
	#include<stdlib.h>
	int id=0,dig=0,key=0,op=0;
%}

%token DIGIT ID KEY OP

%% 
S:DIGIT S {dig++;}
| ID S  {id++;}
| KEY S  {key++;}
| OP S  {op++;}
| DIGIT  {dig++;}
| ID  {id++;}
| KEY   {key++;}
| OP  {op++;}
%%
extern FILE *yyin;

void main(){
yyin=fopen("i.c","r");
do{
yyparse();
}while(!feof(yyin));
fclose(yyin);
printf("number of operators:%d\n",op);
printf("number of identifiers:%d\n",id);
printf("number of keywords:%d\n",key);
printf("number of digits:%d\n",dig);
}
int yyerror()
{
printf("invalid");
}