open Formula
open Printf

let l_interval (i:interval) = fst i
let u_interval (i:interval) = snd i
let in_interval x (i:interval) = (l_interval i) <= x && x <= (u_interval i)
let lift_truth (b:bool) = match b with
                                true -> True
                              | false -> False
let ( -- ) (i:interval) a = let x = if 0 <= (l_interval i) - a  then  ((l_interval i) - a)
                                    else 0
                            and y = if 0 <= (u_interval i) - a  then  ((u_interval i) - a)
                                    else 0 in
                            (x,y) ;;
let p_event (e:event) = snd e ;;
let t_event (e:event) = fst e ;;

let rec reduce (form:twtl_formula) = match form with
    | Neg e -> (match (reduce e) with
                | True -> False
          			| False -> True
          			| Neg f -> reduce f
          			)

    | And (a, b) -> (match (reduce a), (reduce b) with

          						| True,e -> reduce e
          						| e, True -> e
          						| False, _ -> False
          						| _, False -> False
                      | _ -> And (reduce a, reduce b)
                      )

          | Or (a, b) ->  (match (reduce a), (reduce b) with
          					  	True , _ -> True
          						| _, True -> True
          						| False, e -> e
          						| e, False -> e
                      | _ -> Or (reduce a, reduce b)
                      )

          | Imply (a, b) -> (match (reduce a), (reduce b) with
          					 False,_ -> True
          					| _,True -> True
          					| True,e -> e
                    | (a,b) -> Or (Neg (reduce a), (reduce b))
                        )
					| Concat (a,b) -> (match (reduce a), (reduce b) with
					          | True, e -> e
										| False, e -> e
										| _ -> Concat (a,b))
					|Within (i,f) -> (match i with
			  					           | (0,0) ->  f
														 | _ -> Within (i,f))
          | _ -> form



let rec progress (form:twtl_formula) ei =

	 	 match  form with
			  False -> False
			| True -> True
			| Hold (d,p) -> (match d with
				                   | 1 -> lift_truth(List.mem p (p_event(ei)))
													 | _ -> And(lift_truth(List.mem p (p_event(ei))),Hold (d - 1,p)))
			| NotHold (d,p) -> (match d with
							 						 | 1 -> lift_truth(not (List.mem p (p_event(ei))))
							 				     | _ -> And(lift_truth(not(List.mem p (p_event(ei)))), NotHold (d - 1,p)))
			| Or (f1,f2) -> Or(progress f1 ei, progress f2 ei)
			| And(f1,f2) -> And(progress f1 ei, progress f2 ei)
			| Neg f -> Neg(progress f ei)
			| Imply(f1,f2) -> Or(Neg (progress f1 ei), progress f2 ei)
			| Concat (f1,f2) -> (if (progress f1 ei) = True then (progress f1 ei)
			                     else Concat((progress f1 ei),f2))
		  | Within ((i1,i2),f1) -> Or((progress f1 ei), Within(((i1,i2) -- 1),f1))


let formula_of_string s =
  Parser.parse_twtl_formula Lexer.lex (Lexing.from_string s)

let split = Str.split (Str.regexp_string " ");;
let get_event input = let i = split(input) in
                         (int_of_string(List.hd(i)),List.tl(i))




let rec string_of_formula f = match f with
    | True -> "True"
		| False -> "False"
		| Neg f -> "~ ("^string_of_formula(f)^")"
		| Hold (i,p) -> p^" holds_for "^string_of_int(i)^" time units"
		| NotHold (i,p) -> p^" notholds_for "^string_of_int(i)
		| Concat (f,g) -> (string_of_formula f)^" * "^(string_of_formula g)
		| And (f,g) -> (string_of_formula f)^" & "^(string_of_formula g)
		| Or (f,g) -> (string_of_formula f)^" | "^(string_of_formula g)
		| Imply (f,g) -> (string_of_formula f)^" ==> "^(string_of_formula g)
		| Within ((x,y),g) -> (string_of_formula g)^" within "^"["^string_of_int(x)^","^string_of_int(y)^"]"
		|_ -> "I screwed up!!!"



		let () =
		  let f = formula_of_string Sys.argv.(1) in
		  let f' = string_of_formula f in
		      print_string ("======================================== \n");
		      print_string ("Entered TWLTL Formula: ");
		      print_string (f' ^ "\n");
		      print_string ("======================================== \n");
		      let stop = ref false in
		      let ff = ref f in
		        while  not !stop do
		            print_string ("Enter the Event in the form: time_point a b c):");
		            let ee = read_line() in
								let e = get_event(ee) in
		            let p = progress !ff e in
                let p' = reduce p in
		            if p' = True || p' = False
		              then
		                begin
		                print_string ("======================================== \n");
		                print_string ("Pure Rewrite Step: ");
		                print_string ((string_of_formula p) ^ "\n");
		                print_string ("======================================== \n");
										print_string ("======================================== \n");
		                print_string ("Simplified Formula: ");
		                print_string ((string_of_formula p') ^ "\n");
		                print_string ("======================================== \n");
		                print_string ("**** STOPPING: Further rewriting will not change the evaluation **** \n \n");
		                stop := true
		                end
		              else
		                begin
		                print_string ("======================================== \n");
		                print_string ("Pure Rewrite Step: ");
		                print_string ((string_of_formula p) ^ "\n");
		                print_string ("======================================== \n ");
										print_string ("======================================== \n");
		                print_string ("Simplified Formula: ");
		                print_string ((string_of_formula p') ^ "\n");
		                print_string ("======================================== \n");
		                ff := p'
		                 end
		        done
