/* Name: Soumya Mehar PRN: 24070521200
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(char* s);
int yylex(void);
int temp = 0;

char* newTemp() {
    char* t = malloc(10);
    sprintf(t, "t%d", temp++);
    return t;
}
%}

%union {
    int num;
    char* code;
}

%token <code> NUMBER
%type <code> expr

%left '+' '-'

%%

program:
    program expr '\n' { printf("%s\n", $2); }
    | program '\n'
    | /* empty */
    ;

expr:
    NUMBER {
        char* t = newTemp();
        $$ = malloc(50);
        sprintf($$, "%s = %s", t, $1);
    }
    | expr '+' expr {
        char* t = newTemp();
        $$ = malloc(strlen($1) + strlen($3) + 50);
        sprintf($$, "%s\n%s\n%s = %s + %s",
                $1, $3, t, $1, $3);
    }
    | expr '-' expr {
        char* t = newTemp();
        $$ = malloc(strlen($1) + strlen($3) + 50);
        sprintf($$, "%s\n%s\n%s = %s - %s",
                $1, $3, t, $1, $3);
    }
    | '(' expr ')' { $$ = $2; }
    ;

%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
