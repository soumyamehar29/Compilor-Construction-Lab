//JANHAVI ADMANE 24070521211
%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror(char *s);
%}

%token NUM

%%

E: E '+' T
 | T
 ;

T: T '*' F
 | F
 ;

F: '(' E ')'
 | NUM
 ;

%%

int yyerror(char *s)
{
    printf("Invalid Expression\n");
    return 0;
}

int main()
{
    printf("Enter Expression: ");

    if (yyparse() == 0)
        printf("Valid Expression\n");

    return 0;
}
