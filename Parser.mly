(* Copyright Per Lindgren 2016-2018, see the file "LICENSE" *)
(* for the full license governing this code.                *)

(* cimp/Parser.mly *)

%left SC (*Lowest precedence according to Java*)
%left AND
%left PLUS MINUS PLUSU MINUSU
%left NOT (*Higest precedence *)



%token <State__State.id> ID
%token <int> INTVAL
%token IF THEN ELSE END WHILE DO DONE
%token TRUE FALSE AND NOT BEQ BLE BGE BG BL
%token SC C LP RP ASSIGN PLUS PLUSU MINUS MINUSU

%token SINT UINT32

%token EOF
%token <string> STRINGVAL

%{
  open T_Imp
  open Common
  open Env
  open State__State
%}

%start prog

%type <T_Imp.prog> prog

%%

prog:
  | decl_span  SC com_span EOF        { Prog ($1, $3) } 

decl_span:
  | decl                              { ($1, ($startofs, $endofs)) }  
decl:
  | decl_span SC decl_span            { Dseq ($1, $3) } 
  | ID C primtype                     { Ddecl ($1, $3) }

 

primtype:
  | SINT                              { Tsint }
  | UINT32                            { Tuint32 }

com_span:
  | com                               { ($1, ($startofs, $endofs)) }
com:
  | com_span SC com_span              { Cseq ($1, $3) }
  | ID ASSIGN aexpr_span              { Cassign ($1, $3) }
  | IF bexpr_span THEN com_span 
    ELSE com_span END                 { Cif ($2, $4, $6) }
  | IF bexpr_span THEN com_span END   { Cif ($2, $4, (Cskip, (0, 0))) }
  | WHILE bexpr_span DO com_span DONE { Cwhile ($2, $4) }
  | com_span SC EOF                   { Cseq($1, (Cskip, (0,0)))}
  

bexpr_span:
  | bexpr                          { ($1, ($startofs, $endofs)) }

bexpr:
  | LP bexpr RP                    { $2 }
  | TRUE                           { Btrue }
  | FALSE                          { Bfalse }
  | bexpr_span AND bexpr_span      { Band ($1, $3) }
  | NOT bexpr_span                 { Bnot ($2) }
  | aexpr_span BEQ aexpr_span      { Beq ($1, $3) }
  | aexpr_span BLE aexpr_span      { Ble ($1, $3) }
  | aexpr_span BGE aexpr_span      { Ble($3,$1)}
  | aexpr_span BG aexpr_span       { Bnot( (Ble($1, $3), ($startofs, $endofs) )) } 
  | aexpr_span BL aexpr_span       { Band((Ble($1,$3),(0,0)),(Bnot((Beq($1,$3),(0,0))),(0,0))) } (* is this right *)

aexpr_span:                        
  | aexpr                             { ($1, ($startofs, $endofs)) }

aexpr:
  | LP aexpr RP                    { $2 }
  | INTVAL                         { Anum (Z.of_int $1) }
  | ID                             { Avar $1 }
  | aexpr_span PLUS aexpr_span     { Aadd ($1, $3) }
  | aexpr_span PLUSU aexpr_span    { Aaddu ($1, $3) }
  | aexpr_span MINUS aexpr_span    { Asub ($1, $3) }
  | aexpr_span MINUSU aexpr_span   { Asubu ($1, $3) }
  | LP MINUS aexpr_span RP         {Asub((Anum(Z.zero),($startofs, $endofs)),$3)}
  | LP primtype RP aexpr_span              { Acast($4,$2)}
 



