%{
open Ast
%}

%token <bool> BOOL
%token <int> INT
%token <string> IDENT
%token UNIT
%token IF
%token THEN
%token ELSE
%token LET
%token IN
%token PLUS
%token MINUS
%token TIMES
%token DIV
%token AND
%token OR
%token EQ
%token LEQ
%token LPAREN
%token RPAREN
%token EOF
%token COMMA
%token MATCH
%token WITH

%start <Ast.expr> main

%left AND OR
%nonassoc EQ LEQ
%left PLUS MINUS
%left TIMES DIV
%nonassoc UNIT
%nonassoc MATCH

%%

main:
    | e = mexpr; EOF { e }
    ;

mexpr:
    | IF; e1 = mexpr; THEN; e2 = mexpr; ELSE; e3 = mexpr { If(e1,e2,e3) }
    | LET; x = IDENT; EQ; e1 = mexpr; IN; e2 = mexpr { Let(x,e1,e2) }
    | MATCH; p = mexpr; WITH; LPAREN; x = IDENT; COMMA; y = IDENT; RPAREN; EQ; e = mexpr { Match(p, x, y, e)}
    | e = expr { e }
    ;

expr:
    | i = INT { Int i }
    | b = BOOL { Bool b }
    | UNIT { Unit }
    | x = IDENT { Var x }
    | e1 = expr; PLUS; e2 = expr { Binop(Add, e1, e2) }
    | e1 = expr; MINUS; e2 = expr { Binop(Sub, e1, e2) }
    | e1 = expr; DIV; e2 = expr { Binop(Div, e1, e2) }
    | e1 = expr; TIMES; e2 = expr { Binop(Mult, e1, e2) }
    | e1 = expr; AND; e2 = expr { Binop(And, e1, e2) }
    | e1 = expr; OR; e2 = expr { Binop(Or, e1, e2) }
    | e1 = expr; EQ; e2 = expr { Binop(Eq, e1, e2) }
    | e1 = expr; LEQ; e2 = expr { Binop(Leq, e1, e2) }
    | LPAREN; e1 = expr; COMMA; e2 = expr; RPAREN { Pair(e1, e2) }
    | LPAREN; e = mexpr; RPAREN { e }
    ;


