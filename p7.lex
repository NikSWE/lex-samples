    // Lex Program 7
    // =============
    // Problem: find the length of the longest word in a given string
    //
    // Input[1]: geeks for geeks
    // Output[1]: length = 5
    //
    // Input[2]: facebook google yahoo
    // Output[2]: length = 8

%{
    #include <stdio.h>
    int longest = 0;
%}
%%
[a-zA-Z]+       {
                    if(longest < yyleng)
                        longest = yyleng;
                }

.               ;

"\n"            {
                    printf("length = %d\n", longest);
                    longest = 0;
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