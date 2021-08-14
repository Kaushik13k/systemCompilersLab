%{
#include<stdio.h>
#include<stdlib.h>
%}
%token A B
%%
S:X B
X:A X
|;
%%
int main()
{
printf("enter the string");
yyparse();
printf("valid string");
}
yyerror()
{
printf("error, invalid string");
exit(0);
}