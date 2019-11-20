    // Lex Program 10
    // =============
    // Problem: accept a valid integer and float value
    //
    // Input[1]: -77.99
    // Output[1]: valid Float value 
    //
    // Input[2]: fghj
    // Output[2]: Not a valid Integer/Float value

%{
    #include <stdio.h>
%}
%%
^[+-]?[0-9]+$                      printf("valid Integer value\n");   

^[+-]?[0-9]+[.]?[0-9]+$            printf("valid Float value\n");

^.*                                printf("Not a valid Integer/Float value\n");                        

"\n"                     ;
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