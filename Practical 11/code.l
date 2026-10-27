// Soumya Mehar
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%

[0-9]+       { yylval.code = strdup(yytext); return NUMBER; }
[-+*/()]     { return yytext[0]; }
[ \t]        { /* skip spaces and tabs */ }
\n           { return '\n'; }
.            { printf("Invalid character: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}
