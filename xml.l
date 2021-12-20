%{
    #include "xml.tab.h"
%}
%option noyywrap
%option outfile = "xml.lex.c"


ANYTHING .*

TEXT [a-zA-Z0-9_]*

STRING (\"{ANYTHING}\")

EQUAL =

OPENTAG \<
CLOSETAG \>
OPENCLOSINGTAG \<\/
INLINECOMMENT #{ANYTHING}


%%
{TEXT} {
    printf("TEXT\n", yytext, yyleng);
    return TEXT;
}
{STRING} {
    printf("STRING\n", yytext, yyleng);
    return STRING;
}
{EQUAL} {
    printf("EQUAL\n", yytext, yyleng);
    return EQUAL;
}
{OPENTAG} {
    printf("OPENTAG\n", yytext, yyleng);
    return OPENTAG;
}
{CLOSETAG} {
    printf("CLOSETAG\n", yytext, yyleng);
    return CLOSETAG;
}
{OPENCLOSINGTAG} {
    printf("OPENCLOSINGTAG\n", yytext, yyleng);
    return OPENCLOSINGTAG;
}

[ \t\n] {;}

{INLINECOMMENT} {;}

. {

    yyerror("Unexpected character");
    yyterminate();
}
%%