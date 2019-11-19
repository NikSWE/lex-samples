    // Lex Program 6
    // =============
    // Problem: count the frequency of the given word in a file
    //
    // Input[1]: geeks for geeks is a computer science portal for geeks.
    // Output[1]: frequency = 3

%{
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    int count = 0;
    char word[] = "geeks";
%}
%%
[a-zA-Z]+       {
                    if(strcmp(yytext, word) == 0)
                        count++;
                }

(.|\n)          ;
%%
int yywrap()
{
    return 1;
}

int main()
{   
    FILE *file = fopen("p6.txt", "r");
    if(file == NULL)
    {
        printf("file not found\n");
        exit(EXIT_FAILURE);
    }
    else
        yyin = file;
    yylex();
    printf("frequency = %d\n", count);
    return 0;
}