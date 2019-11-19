    // Lex Program 1
    // =============
    // Problem: print "GOODBYE!" in place of "hello world" in a given string
    //
    // Input[1]: hello world
    // Output[1]: GOODBYE! 
    //
    // Input[2]: hello world, I'm Lex
    // Output[2]: GOODBYE!, I'm Lex
    
%%
"hello world"   printf("GOODBYE!");
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