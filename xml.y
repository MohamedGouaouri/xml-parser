%{
    #include <stdio.h>
    extern int yylex();
    void yyerror(char *s);

    #define RESET   "\033[0m"
    #define RED     "\033[31m"      /* Red */
    #define GREEN   "\033[32m"      /* Green */ 
%}

// tokens
%token TEXT 
%token STRING
%token EQUAL "="

%token OPENTAG "<"
%token CLOSETAG ">"
%token OPENCLOSINGTAG "</"

%left TEXT
%%

xml: 
    | "<" TEXT params_eps ">" content "</" TEXT ">"

content: content TEXT content
        | xml
        ;

params_eps: //eps
        | pair params_eps
        ;

pair: TEXT "=" STRING
%%

void yyerror(char *s){
    fprintf(stderr, "" RED "%s" RESET "\n", s);
}

int main(){
    yyparse();
}