    // Lex Program 4
    // =============
    // Problem: count the number of vowels and consonents in a given string
    // Approach: 1
    // Input[1]: Hello everyone
    // Output[1]: Number of vowels are: 6
    //            Number of consonants are: 7
    //
    // Input[2]: This is GeeksforGeeks
    // Output[2]: Number of vowels are: 7
    //            Number of consonants are: 12

%{
    #include <stdio.h>
    int vowels = 0;
    int consonants = 0;
%}
%%
[aeiouAEIOU]                            vowels++;

[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]        consonants++;

.                                       ;

"\n"                                    {
                                            printf("Number of vowels are: %d\n", vowels);
                                            printf("Number of consonants are: %d\n", consonants);
                                            vowels = 0;
                                            consonants = 0;
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