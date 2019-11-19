    // Lex Program 8
    // =============
    // Problem: find the length of a given string
    //
    // Input[1]: geeksforgeeks
    // Output[1]: length of given string is : 13
    //
    // Input[2]: geeks
    // Output[2]: length of given string is : 5

%{
    #include <stdio.h>
    int length = 0;
%}
%%
[a-zA-Z0-9 ]*               {
                                length = yyleng;
                            }

.              ;

"\n"           {
                    printf("length of given string is : %d\n", length);
                    length = 0;
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