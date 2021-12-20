%{
    #include "xml.tab.h"
%}
%option noyywrap
%option outfile = "xml.lex.c"


ANYTHING .*

ID [a-zA-Z][a-zA-Z0-9_]*

STRING (\"{ANYTHING}\")

EQUAL =

OPENTAG \<
CLOSETAG \>
OPENCLOSINGTAG \<\/
INLINECOMMENT #{ANYTHING}


%%
{ID} {
    printf(" IDENTIFIER ", yytext, yyleng);
    return ID;
}
{STRING} {
    printf(" STRING ", yytext, yyleng);
    return STRING;
}
{EQUAL} {
    printf(" EQUAL ", yytext, yyleng);
    return EQUAL;
}
{OPENTAG} {
    printf(" OPENTAG ", yytext, yyleng);
    return OPENTAG;
}
{CLOSETAG} {
    printf(" CLOSETAG ", yytext, yyleng);
    return CLOSETAG;
}
{OPENCLOSINGTAG} {
    printf(" OPENCLOSINGTAG ", yytext, yyleng);
    return OPENCLOSINGTAG;
}

[ \t\n] {;}

{INLINECOMMENT} {;}

. {

    printf("\nUnrecognized character %s\n", yytext);
    yyterminate();
}
%%