%{
/*************************************************************
 * Project:        sourceDOG
 * File:           dog.l
 * Author:         Marco Manuel Almeida e Silva
 * Created:        2024-11-01
 *
 * License:        MIT License (see LICENSE file in project)
 *
 *************************************************************/

#include <stdio.h>
#include <stdlib.h>

%}



%%

.            { printf("%s\n", yytext); }

%%

extern int yylex();
extern int yyparse();

int main(int argc, char **argv) {
    yylex();
    return 0;
}

int yywrap(void) {
    return 1;
}

int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
