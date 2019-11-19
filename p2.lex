    // Lex Program 2
    // =============
    // Problem: count number of spaces in a given string
    //
    // Input[1]: h e l l o
    // Output[1]: spaces = 4 
    //
    // Input[2]: hello world
    // Output[2]: spaces = 1

%{
    #include <stdio.h>
    int count = 0;
%}
%%
[ ]     {
            count++;
        }

.       ;

"\n"    {
            printf("spaces = %d\n",count);
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