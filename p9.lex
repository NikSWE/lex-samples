    // Lex Program 9
    // =============
    // Problem: accept string starting with vowel
    //
    // Input[1]: animal
    // Output[1]: accepted
    //
    // Input[2]: zebra
    // Output[2]: not accepted

%{
    #include <stdio.h>
%}
%%
[aeiouAEIOU].*          printf("accepted\n");

.*|\n                   printf("not accepted\n");
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