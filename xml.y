%{
    #include <stdio.h>
    extern int yylex();
    void yyerror(char *s);    
%}

// tokens
%token ID 
%token STRING
%token EQUAL "="

%token OPENTAG "<"
%token CLOSETAG ">"
%token OPENCLOSINGTAG "</"

%left ID
%%

xml: 
    | "<" ID params_eps ">" content "</" ID ">"

content: content ID content
        | xml
        ;

params_eps: //eps
        | pair params_eps
        ;

pair: ID "=" STRING
%%

void yyerror(char *s){
    printf("%s\n", s);
}

int main(){
    yyparse();
}