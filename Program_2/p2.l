%option noyywrap
%{
	#include <stdio.h>
	#include <string.h>
	int num = 0;
	int op = 0;
	int valid = 1;
	int top = -1;
	int stack[10];
	char operand[20];
	int otop=0,itop=0;
	int identifier[20];
	int i,j;
%}

%%
"(" {top++;
     stack[top]='(';
     }
")" {if(stack[top]!='(') valid = 0;
      else top--;
    }

[0-9]+ {num++;
	identifier[itop]=atoi(yytext);
	itop++;
	}
"+"	{op++;
	operand[otop]='+';
	otop++;
	}
"*" {op++;
     operand[otop]='*';
     otop++;
     }
. ;	
%%

int main()
{
	printf("Enter an arithmetic expression\n");
	yylex();
	if(valid == 1 && top ==-1)
	{
		if(op == num - 1)
		{
			printf("\n Valid Expression\n");
			printf("Number of Identifiers = %d\n", num);
			printf("Number of Operators = %d\n", op);
		}	
		else
			printf("\n Invalid Expression\n");
	}
	else
		printf("\n Invalid Expression\n");
	printf("Identifiers are\n");
	for( i = 0; i<=otop; i++)
	{
		printf("%d\n",identifier[i]);
	}
	printf("Operands are\n");
	for( j=0; j< itop; j++)
	{
		printf("%c\n", operand[j]);
	}
	
	return 0;
}