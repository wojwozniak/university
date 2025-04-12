
%token <float> FLOAT
%token PLUS
%token MINUS
%token TIMES
%token DIV
%token LPAREN
%token RPAREN
%token EOF
%token POW
%token LOG
%token E

%start <Ast.expr> main

%left PLUS MINUS
%left TIMES DIV
%right POW
%nonassoc LOG

%%

main:
    | e = expr; EOF { e }
    ;

expr:
    | f = FLOAT { Float f }
    | E { Float (exp 1.0) }
    | e1 = expr; PLUS; e2 = expr { Binop(Add, e1, e2) }
    | e1 = expr; MINUS; e2 = expr { Binop(Sub, e1, e2) }
    | e1 = expr; DIV; e2 = expr { Binop(Div, e1, e2) }
    | e1 = expr; TIMES; e2 = expr { Binop(Mult, e1, e2) }
    | e1 = expr; POW; e2 = expr { Binop(Pow, e1, e2) }
    | LOG; e1 = expr; { Unop(Log, e1) } (* Zadanie 6 - tu uwazać, bo kolejność ma znaczenie *)
    | LPAREN; e = expr; RPAREN { e }
    ;


(* Zadanie 5 - zamiana int na float *)