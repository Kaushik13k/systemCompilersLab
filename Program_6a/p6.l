%option noyywrap
%{
#include<stdio.h>
#include "string.h"
int comment=0, state=1;
%}

%%
"/*" { state=0;}
"*/" { if(state==0)
{
comment++;
state=1;
}
}
"//"([A-Za-z0-9\t ])*[\n] {comment++; state=1;}
.|\n { if(state==1) /* not a comment line*/
fprintf(yyout,"%s",yytext);
}


%%
int main()
{

char infile[256],outfile[256];
printf("Enter the input filename : ");
scanf("%s",infile);
printf("Enter the output filename : ");
scanf("%s",outfile);
yyin=fopen(infile,"r");
yyout=fopen(outfile,"w");
yylex();
printf("\n Number of comment lines in the given file: %d\n",comment);
}