
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | WITHIN
    | UNDER
    | TRUE
    | OR
    | OPEN
    | OP
    | NOT
    | NHOLD
    | INTERVAL
    | INT of (
# 22 "parser.mly"
       (int)
# 20 "parser.ml"
  )
    | IMPL
    | ID of (
# 3 "parser.mly"
       (string)
# 26 "parser.ml"
  )
    | HOLD
    | FALSE
    | EQUIV
    | EOF
    | DOT
    | CONCAT
    | COMMA
    | CLOSE
    | CL
    | AND
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState27
  | MenhirState25
  | MenhirState23
  | MenhirState21
  | MenhirState3
  | MenhirState2
  | MenhirState0

# 31 "parser.mly"
  
    open Formula

# 66 "parser.ml"

let rec _menhir_run15 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 71 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | OPEN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | INT _v ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_stack = (_menhir_stack, _v) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | CLOSE ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let (((_menhir_stack, _menhir_s, (g : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 106 "parser.ml"
                        ))), (i : (
# 22 "parser.mly"
       (int)
# 110 "parser.ml"
                        ))), (j : (
# 22 "parser.mly"
       (int)
# 114 "parser.ml"
                        ))) = _menhir_stack in
                        let c = () in
                        let p = () in
                        let o = () in
                        let _2 = () in
                        let _v : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 123 "parser.ml"
                        ) = 
# 59 "parser.mly"
                                                                ( Within ((i,j),g) )
# 127 "parser.ml"
                         in
                        _menhir_goto_formula_expr _menhir_env _menhir_stack _menhir_s _v
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run21 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 164 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | NOT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | OP ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | TRUE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_run23 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 188 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | NOT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | OP ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | TRUE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run25 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 212 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | NOT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | OP ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | TRUE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_run27 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 236 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | NOT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | OP ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | TRUE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_goto_ap_id : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 38 "parser.mly"
      (string)
# 260 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | HOLD ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (s2 : (
# 22 "parser.mly"
       (int)
# 280 "parser.ml"
            )) = _v in
            let (_menhir_stack, _menhir_s, (s1 : (
# 38 "parser.mly"
      (string)
# 285 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 291 "parser.ml"
            ) = 
# 52 "parser.mly"
                                                ( Hold (s2,s1) )
# 295 "parser.ml"
             in
            _menhir_goto_formula_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | NHOLD ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (s2 : (
# 22 "parser.mly"
       (int)
# 316 "parser.ml"
            )) = _v in
            let (_menhir_stack, _menhir_s, (s1 : (
# 38 "parser.mly"
      (string)
# 321 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 327 "parser.ml"
            ) = 
# 53 "parser.mly"
                                               ( NotHold (s2,s1) )
# 331 "parser.ml"
             in
            _menhir_goto_formula_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | UNDER ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (s2 : (
# 3 "parser.mly"
       (string)
# 352 "parser.ml"
            )) = _v in
            let (_menhir_stack, _menhir_s, (s1 : (
# 38 "parser.mly"
      (string)
# 357 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 38 "parser.mly"
      (string)
# 363 "parser.ml"
            ) = 
# 44 "parser.mly"
                             ( s1 ^ "_" ^ s2 )
# 367 "parser.ml"
             in
            _menhir_goto_ap_id _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_formula_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 386 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, (f : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 397 "parser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 403 "parser.ml"
        ) = 
# 54 "parser.mly"
                                                ( Neg (f) )
# 407 "parser.ml"
         in
        _menhir_goto_formula_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | CL ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (f : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 424 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 431 "parser.ml"
            ) = 
# 60 "parser.mly"
                                                ( f )
# 435 "parser.ml"
             in
            _menhir_goto_formula_expr _menhir_env _menhir_stack _menhir_s _v
        | CONCAT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | IMPL ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | WITHIN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (f : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 458 "parser.ml"
        ))), _, (g : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 462 "parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 468 "parser.ml"
        ) = 
# 56 "parser.mly"
                                                ( Or (f,g) )
# 472 "parser.ml"
         in
        _menhir_goto_formula_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | CONCAT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | WITHIN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | CL | EOF | IMPL ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (f : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 493 "parser.ml"
            ))), _, (g : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 497 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 503 "parser.ml"
            ) = 
# 57 "parser.mly"
                                                ( Imply (f,g) )
# 507 "parser.ml"
             in
            _menhir_goto_formula_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (f : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 522 "parser.ml"
        ))), _, (g : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 526 "parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 532 "parser.ml"
        ) = 
# 58 "parser.mly"
                                                ( Concat (f,g) )
# 536 "parser.ml"
         in
        _menhir_goto_formula_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (f : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 545 "parser.ml"
        ))), _, (g : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 549 "parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 555 "parser.ml"
        ) = 
# 55 "parser.mly"
                                                ( And (f,g) )
# 559 "parser.ml"
         in
        _menhir_goto_formula_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | CONCAT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (f : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 577 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 36 "parser.mly"
      (Formula.twtl_formula)
# 583 "parser.ml"
            ) = 
# 64 "parser.mly"
                                                 ( f )
# 587 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 36 "parser.mly"
      (Formula.twtl_formula)
# 594 "parser.ml"
            )) = _v in
            Obj.magic _1
        | IMPL ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | WITHIN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 649 "parser.ml"
    ) = 
# 50 "parser.mly"
                                                ( True )
# 653 "parser.ml"
     in
    _menhir_goto_formula_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | NOT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | OP ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | TRUE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | NOT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | OP ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | TRUE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 3 "parser.mly"
       (string)
# 702 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (s : (
# 3 "parser.mly"
       (string)
# 710 "parser.ml"
    )) = _v in
    let _v : (
# 38 "parser.mly"
      (string)
# 715 "parser.ml"
    ) = 
# 43 "parser.mly"
                             ( s )
# 719 "parser.ml"
     in
    _menhir_goto_ap_id _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (
# 37 "parser.mly"
      (Formula.twtl_formula)
# 731 "parser.ml"
    ) = 
# 51 "parser.mly"
                                                ( False )
# 735 "parser.ml"
     in
    _menhir_goto_formula_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and parse_twtl_formula : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 36 "parser.mly"
      (Formula.twtl_formula)
# 754 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ID _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | NOT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | OP ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | TRUE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 269 "/usr/local/Cellar/menhir/20190626/share/menhir/standard.mly"
  

# 786 "parser.ml"
