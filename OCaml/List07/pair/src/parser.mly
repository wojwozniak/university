%{
open Ast
%}

%token <bool> BOOL
%token <int> INT
%token <string> IDENT
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
%token UNIT
%token FST
%token SND
%token MATCH
%token WITH
%token ARR
%token NUMBERP 
%token BOOLEANP 
%token PAIRP 
%token UNITP
%token LBRACK 
%token RBRACK 
%token SEMI
%token FOLD 
%token ANDKW

%start <Ast.expr> main

%left AND OR
%nonassoc EQ LEQ
%left PLUS MINUS
%left TIMES DIV

%%

main:
    | e = mexpr; EOF { e }
    ;

mexpr:
    | IF; e1 = mexpr; THEN; e2 = mexpr; ELSE; e3 = mexpr
        { If(e1, e2, e3) }
    | LET; x = IDENT; EQ; e1 = mexpr; IN; e2 = mexpr
        { Let(x, e1, e2) }
    | MATCH; e1 = mexpr; WITH; LPAREN; x = IDENT; COMMA; y = IDENT; RPAREN; ARR; e2 = mexpr
        { Match(e1, x, y, e2) }
    | FOLD; e1 = mexpr; WITH; LPAREN; x = IDENT; COMMA; acc = IDENT; RPAREN; ARR; e2 = mexpr; ANDKW; e3 = mexpr { Fold(e1, x, acc, e2, e3) }
    | e = expr
        { e }
    ;

expr:
    | i = INT { Int i }
    | b = BOOL { Bool b }
    | x = IDENT { Var x }
    | e1 = expr; PLUS; e2 = expr { Binop(Add, e1, e2) }
    | e1 = expr; MINUS; e2 = expr { Binop(Sub, e1, e2) }
    | e1 = expr; DIV; e2 = expr { Binop(Div, e1, e2) }
    | e1 = expr; TIMES; e2 = expr { Binop(Mult, e1, e2) }
    | e1 = expr; AND; e2 = expr { If (e1, e2, Bool false) } // Zad 1
    | e1 = expr; OR; e2 = expr { If (e1, Bool true, e2) } // Zad 1
    | e1 = expr; EQ; e2 = expr { Binop(Eq, e1, e2) }
    | e1 = expr; LEQ; e2 = expr { Binop(Leq, e1, e2) }
    | LPAREN; e1 = mexpr; COMMA; e2 = mexpr; RPAREN { Pair (e1,e2) }
    | UNIT { Unit }
    | FST; e = expr { Fst e }
    | SND; e = expr { Snd e }
    | NUMBERP; e = expr { NumberP e } 
    | BOOLEANP; e = expr { BooleanP e } 
    | PAIRP; e = expr { PairP e } 
    | UNITP; e = expr { UnitP e } 
    | LPAREN; e = mexpr; RPAREN { e }
    | LBRACK; es = expr_list; RBRACK { es }
    ;

expr_list: | { Unit } | e = mexpr { Pair (e, Unit) } | e = mexpr; SEMI; es = expr_list { Pair (e, es) } ;