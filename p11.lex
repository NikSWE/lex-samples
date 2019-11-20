    // Lex Program 11
    // =============
    // Problem: find the number of valid 'printf' statements alongwith variables used in it
    //
    // Input[1]: printf("sum = %d", a);
    // Output[1]: valid_statements = 1, variables = 1
    //            invalid_statements = 0

%{
    #include <stdio.h>
    #include <string.h>
    #include <ctype.h>
    #include <stdlib.h>
    #include <stdbool.h>
    int valid_statements = 0;
    int invalid_statements = 0;
    int variables = 0;

    int count_variables(char *, int);
%}
variable    [_a-zA-Z]+[0-9]*[_a-zA-Z]*
space       [ \t]*
%%
^{space}printf{space}\(\".*\"{space}(,{space}{variable})*\);$       {
                                                                        valid_statements++;
                                                                        variables += count_variables(yytext, yyleng);
                                                                    }

^{space}printf.*                                                    invalid_statements++;

.|\n                                                                ;
%%
int yywrap()
{
    return 1;
}

int count_variables(char *str, int length)
{
    int i = length - 1, count = 0;
    char cur_char = str[i];

    while(cur_char != '"')
    {
        if(cur_char == ',')
            {
                count++;
            }
        cur_char = str[--i];
    }
    
    return count;
}

int main()
{   
    FILE *file = fopen("p11.c", "r");
    if(file == NULL)
    {
        printf("file not found\n");
        exit(EXIT_FAILURE);
    }
    else
        yyin = file;
    yylex();
    printf("valid_statements = %d, variables = %d\n", valid_statements, variables);
    printf("invalid_statements = %d\n", invalid_statements);
    return 0;
}