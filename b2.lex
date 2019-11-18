%{
    #include <stdio.h>
    int count = 0;
%}
%%
[ ]    printf("space found %d",++count);

%%
int yywrap()
{
    return 1;
}

int main()
{
    yylex();
    // printf("words = %d",count + 1);
}