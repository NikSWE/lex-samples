    // Lex Program 5
    // =============
    // Problem: count words that are less than 10 and greater than 5 in a given string
    // Approach: 2
    // Input[1]: geeksforgeeks hey google test lays
    // Output[1]: words = 1
    //
    // Input[2]: hello world, I'm Lex
    // Output[2]: words = 0

%{
    #include <stdio.h>
    int count = 0;
%}
%%
[a-zA-Z]+       {
                    if(yyleng > 5 && yyleng < 10)
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