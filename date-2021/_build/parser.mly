%token TRUE
%token FALSE
%token <string> ID
%token NOT
%token AND
%token OR
%token IMPL
%token EQUIV
%token HOLD
%token NHOLD
%token WITHIN
%token CONCAT
%token OP
%token CL
%token UNDER
%token DOT
%token INTERVAL
%token COMMA
%token OPEN
%token CLOSE
%token EOF
%token <int> INT


%left IMPL EQUIV
%left AND OR Hold WITHIN CONCAT


%nonassoc NOT

%{
    open Formula
%}

%start parse_twtl_formula
%type <Formula.twtl_formula> parse_twtl_formula
%type <Formula.twtl_formula> formula_expr
%type <string> ap_id

%%

%public ap_id:
    s=ID                     { s }
    | s1=ap_id UNDER s2=ID   { s1 ^ "_" ^ s2 }

%public interval:
        OP s1=ID s2=ID CL                   { (s1,s2) }

%public formula_expr:
    | TRUE                                      { True }
    | FALSE                                     { False }
    | s1=ap_id  HOLD  s2=INT                    { Hold (s2,s1) }
    | s1=ap_id  NHOLD  s2=INT                  { NotHold (s2,s1) }
    | NOT f=formula_expr                        { Neg (f) }
    | f=formula_expr AND g=formula_expr         { And (f,g) }
    | f=formula_expr OR g=formula_expr          { Or (f,g) }
    | f=formula_expr IMPL g=formula_expr        { Imply (f,g) }
    | f=formula_expr CONCAT g=formula_expr      { Concat (f,g) }
    | g=formula_expr WITHIN o=OPEN i=INT p=COMMA j=INT c=CLOSE  { Within ((i,j),g) }
    | OP f=formula_expr CL                      { f }


parse_twtl_formula:
    | f=formula_expr EOF                         { f }
