%{
/*************************************************************
 * Project:        sourceDOG
 * File:           dog.l
 * Author:         Marco Manuel Almeida e Silva
 * Created:        2024-11-01
 *
 * License:        MIT License (see LICENSE file in repository)
 *
 *************************************************************/

/* C code to be included in the generated lexer */
#include <stdio.h>
#include <stdlib.h>

/* You can add any other includes or definitions here */

%}

/* Definitions section (optional) */
/* Define any macros or regular expression shortcuts here */

%%

/* Rules section */
/* Define token matching rules here. 
   Each rule should follow the pattern:
   REGEX      { ACTION } */

.            { /* Example rule: matches any single character */ }

%%

/* Additional C code to be included in the generated file */
int main(int argc, char **argv) {
    /* Open input file if provided, else use stdin */
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror("Could not open input file");
            return 1;
        }
    }

    /* Start lexing */
    yylex();

    /* Close the file if it was opened */
    if (yyin != stdin) {
        fclose(yyin);
    }
    return 0;
}

/* Lexer error handling function */
int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

/* EOF */
