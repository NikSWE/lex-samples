    // Lex Program 3
    // =============
    // Problem: count number of words in a given string
    //
    // Input[1]: hello world
    // Output[1]: words = 2
    //
    // Input[2]: hello world, I'm Lex
    // Output[2]: words = 4

%{
    #include <stdio.h>
    int count = 0;
%}
%%
[a-zA-Z]+'?[a-zA-Z]*    {
                            count++;
                        }

.              ;

"\n"           {
                    printf("words = %d\n", count);
                    count = 0;
               }
%%
int yywrap()
{
    return 1;
}

int main()
{
    yylex();
    return 0;
}