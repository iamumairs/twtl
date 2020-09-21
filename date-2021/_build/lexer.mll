{
    open Parser
}

rule lex = parse
    | "True"             { TRUE }
    | "False"            { FALSE }
    | "&"                { AND }
    | "|"                { OR }
    | ['~' '!']          { NOT }
    | ['-' '='] '>'      { IMPL }
    | "holds_for"             { HOLD }
    | "notholds_for"          { NHOLD }
    | "within"           { WITHIN }
    | '*'                { CONCAT }
    | ['0'-'9']+ as lxm { INT(int_of_string lxm) }
    (*| ['A'-'Z' 'a'-'z']['0'-'9' 'A'-'Z' 'a'-'z']* as s { ID (s) }*)
    | ['0'-'9' 'A'-'Z' 'a'-'z']* as s { ID (s) }
    | "_"                { UNDER }
    | ","                { COMMA }
    | "."                { DOT }
    | [' ' '\t' '\n']    { lex lexbuf }
    | "["                { OPEN }
    | "]"                { CLOSE }
    | "("                { OP }
    | ")"                { CL }
    | eof                { EOF }
