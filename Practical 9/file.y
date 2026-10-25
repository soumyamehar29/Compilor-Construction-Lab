//Soumya Mehar 24070521200
%{
#define YYSTYPE double
#include "y.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+(\.[0-9]+)?    {
                         yylval = atof(yytext);
                         return NUMBER;
                     }

"++"                 return INC;
"--"                 return DEC;

"+"                  return '+';
"-"                  return '-';
"*"                  return '*';
"/"                  return '/';
"%"                  return '%';
"^"                  return '^';

"("                  return '(';
")"                  return ')';

\n                   return '\n';

[ \t]+               ;

.                    return INVALID;

%%

int yywrap()
{
    return 1;
}
