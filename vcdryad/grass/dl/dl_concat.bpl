axiom $arch_ptr_size == 8;

axiom $arch_spec_ptr_start == $max.u8;

const unique ^$##thread_id: $ctype;

axiom $def_math_type(^$##thread_id);

type $##thread_id;

const unique ^$##club: $ctype;

axiom $def_math_type(^$##club);

type $##club;

const unique ^d_node: $ctype;

axiom $is_span_sequential(^d_node);

axiom $def_struct_type(^d_node, 16, false, false);

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2(#s1, #s2, #p, ^d_node) } $inv2(#s1, #s2, #p, ^d_node) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2_without_lemmas(#s1, #s2, #p, ^d_node) } $inv2_without_lemmas(#s1, #s2, #p, ^d_node) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall p: $ptr, q: $ptr, s: $state :: { $in(q, $composite_extent(s, p, ^d_node)) } $in(q, $composite_extent(s, p, ^d_node)) == (q == p));

const unique d_node.prev: $field;

axiom $def_phys_field(^d_node, d_node.prev, $ptr_to(^d_node), false, 0);

const unique d_node.next: $field;

axiom $def_phys_field(^d_node, d_node.next, $ptr_to(^d_node), false, 8);

const unique ^$#_purecall_handler#1: $ctype;

axiom $def_fnptr_type(^$#_purecall_handler#1);

type $#_purecall_handler#1;

const unique ^$#_invalid_parameter_handler#2: $ctype;

axiom $def_fnptr_type(^$#_invalid_parameter_handler#2);

type $#_invalid_parameter_handler#2;

const unique ^$#dl_concat.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#dl_concat.c..36263#3);

type $#dl_concat.c..36263#3;

const unique ^$#_PtFuncCompare#4: $ctype;

axiom $def_fnptr_type(^$#_PtFuncCompare#4);

type $#_PtFuncCompare#4;

const unique ^$#_PtFuncCompare#5: $ctype;

axiom $def_fnptr_type(^$#_PtFuncCompare#5);

type $#_PtFuncCompare#5;

const unique ^$#_PtFuncCompare#6: $ctype;

axiom $def_fnptr_type(^$#_PtFuncCompare#6);

type $#_PtFuncCompare#6;

const unique ^$#_PtFuncCompare#7: $ctype;

axiom $def_fnptr_type(^$#_PtFuncCompare#7);

type $#_PtFuncCompare#7;

const unique ^$#_onexit_t#8: $ctype;

axiom $def_fnptr_type(^$#_onexit_t#8);

type $#_onexit_t#8;

function F#dll(#s: $state, SP#hd: $ptr) : bool;

const unique cf#dll: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#dll(#s, SP#hd) } 1 < $decreases_level ==> $is_null($phys_ptr_cast(SP#hd, ^d_node)) ==> F#dll(#s, SP#hd));

axiom $function_arg_type(cf#dll, 0, ^^bool);

axiom $function_arg_type(cf#dll, 1, $ptr_to(^d_node));

procedure dll(SP#hd: $ptr) returns ($result: bool);
  ensures $is_null($phys_ptr_cast(SP#hd, ^d_node)) ==> $result;
  free ensures $result == F#dll($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#dll_reach(#s: $state, SP#hd: $ptr) : $oset;

const unique cf#dll_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#dll_reach(#s, SP#hd) } 1 < $decreases_level ==> ($non_null($phys_ptr_cast(SP#hd, ^d_node)) ==> $oset_in($phys_ptr_cast(SP#hd, ^d_node), F#dll_reach(#s, SP#hd))) && ($is_null($phys_ptr_cast(SP#hd, ^d_node)) ==> F#dll_reach(#s, SP#hd) == $oset_empty()));

axiom $function_arg_type(cf#dll_reach, 0, ^$#oset);

axiom $function_arg_type(cf#dll_reach, 1, $ptr_to(^d_node));

procedure dll_reach(SP#hd: $ptr) returns ($result: $oset);
  ensures ($non_null($phys_ptr_cast(SP#hd, ^d_node)) ==> $oset_in($phys_ptr_cast(SP#hd, ^d_node), $result)) && ($is_null($phys_ptr_cast(SP#hd, ^d_node)) ==> $result == $oset_empty());
  free ensures $result == F#dll_reach($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#dll_lseg(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : bool;

const unique cf#dll_lseg: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#dll_lseg(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($is_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg(#s, SP#hd, SP#tl)) && ($phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg(#s, SP#hd, SP#tl)) && ($is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> F#dll_lseg(#s, SP#hd, SP#tl) == F#dll(#s, $phys_ptr_cast(SP#hd, ^d_node))) && ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && F#dll(#s, $phys_ptr_cast(SP#tl, ^d_node)) && $oset_disjoint(F#dll_reach(#s, $phys_ptr_cast(SP#tl, ^d_node)), F#dll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) ==> F#dll(#s, $phys_ptr_cast(SP#hd, ^d_node)) && F#dll_reach(#s, $phys_ptr_cast(SP#hd, ^d_node)) == $oset_union(F#dll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node)), F#dll_reach(#s, $phys_ptr_cast(SP#tl, ^d_node)))) && ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $non_null($phys_ptr_cast(SP#tl, ^d_node)) && F#dll(#s, $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) && F#dll_lseg(#s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node)) && $oset_disjoint(F#dll_reach(#s, $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)), F#dll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^d_node), F#dll_reach(#s, $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^d_node), F#dll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) ==> $oset_in($phys_ptr_cast(SP#tl, ^d_node), F#dll_reach(#s, $phys_ptr_cast(SP#hd, ^d_node))) && F#dll_lseg(#s, $phys_ptr_cast(SP#hd, ^d_node), $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) && F#dll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^d_node), $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) == $oset_union($oset_singleton($phys_ptr_cast(SP#tl, ^d_node)), F#dll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node)))));

axiom $function_arg_type(cf#dll_lseg, 0, ^^bool);

axiom $function_arg_type(cf#dll_lseg, 1, $ptr_to(^d_node));

axiom $function_arg_type(cf#dll_lseg, 2, $ptr_to(^d_node));

procedure dll_lseg(SP#hd: $ptr, SP#tl: $ptr) returns ($result: bool);
  ensures $is_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $result;
  ensures $phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> $result;
  ensures $is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> $result == F#dll($s, $phys_ptr_cast(SP#hd, ^d_node));
  ensures $non_null($phys_ptr_cast(SP#hd, ^d_node)) && F#dll($s, $phys_ptr_cast(SP#tl, ^d_node)) && $oset_disjoint(F#dll_reach($s, $phys_ptr_cast(SP#tl, ^d_node)), F#dll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) ==> F#dll($s, $phys_ptr_cast(SP#hd, ^d_node)) && F#dll_reach($s, $phys_ptr_cast(SP#hd, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node)), F#dll_reach($s, $phys_ptr_cast(SP#tl, ^d_node)));
  ensures $non_null($phys_ptr_cast(SP#hd, ^d_node)) && $non_null($phys_ptr_cast(SP#tl, ^d_node)) && F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) && F#dll_lseg($s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node)) && $oset_disjoint(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)), F#dll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^d_node), F#dll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) ==> $oset_in($phys_ptr_cast(SP#tl, ^d_node), F#dll_reach($s, $phys_ptr_cast(SP#hd, ^d_node))) && F#dll_lseg($s, $phys_ptr_cast(SP#hd, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) && F#dll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) == $oset_union($oset_singleton($phys_ptr_cast(SP#tl, ^d_node)), F#dll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node)));
  free ensures $result == F#dll_lseg($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#dll_lseg_reach(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : $oset;

const unique cf#dll_lseg_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#dll_lseg_reach(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg_reach(#s, SP#hd, SP#tl) == $oset_empty()) && ($is_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg_reach(#s, SP#hd, SP#tl) == $oset_empty()) && ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $oset_in($phys_ptr_cast(SP#hd, ^d_node), F#dll_lseg_reach(#s, SP#hd, SP#tl))) && ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> F#dll_lseg_reach(#s, SP#hd, SP#tl) == F#dll_reach(#s, $phys_ptr_cast(SP#hd, ^d_node))));

axiom $function_arg_type(cf#dll_lseg_reach, 0, ^$#oset);

axiom $function_arg_type(cf#dll_lseg_reach, 1, $ptr_to(^d_node));

axiom $function_arg_type(cf#dll_lseg_reach, 2, $ptr_to(^d_node));

procedure dll_lseg_reach(SP#hd: $ptr, SP#tl: $ptr) returns ($result: $oset);
  ensures $phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> $result == $oset_empty();
  ensures $is_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $result == $oset_empty();
  ensures $non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $oset_in($phys_ptr_cast(SP#hd, ^d_node), $result);
  ensures $non_null($phys_ptr_cast(SP#hd, ^d_node)) && $is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> $result == F#dll_reach($s, $phys_ptr_cast(SP#hd, ^d_node));
  free ensures $result == F#dll_lseg_reach($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



procedure dl_concat(P#a: $ptr, P#b: $ptr) returns ($result: $ptr);
  requires F#dll($s, $phys_ptr_cast(P#a, ^d_node));
  requires F#dll($s, $phys_ptr_cast(P#b, ^d_node));
  requires $oset_disjoint(F#dll_reach($s, $phys_ptr_cast(P#a, ^d_node)), F#dll_reach($s, $phys_ptr_cast(P#b, ^d_node)));
  modifies $s, $cev_pc;
  ensures F#dll($s, $phys_ptr_cast($result, ^d_node));
  ensures F#dll_lseg($s, $phys_ptr_cast($result, ^d_node), $phys_ptr_cast(P#b, ^d_node));
  ensures $oset_disjoint(F#dll_lseg_reach($s, $phys_ptr_cast($result, ^d_node), $phys_ptr_cast(P#b, ^d_node)), F#dll_reach($s, $phys_ptr_cast(P#b, ^d_node)));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation dl_concat(P#a: $ptr, P#b: $ptr) returns ($result: $ptr)
{
  var stmtexpr1#6: $state;
  var SL#_dryad_S3: $state;
  var stmtexpr0#5: $state;
  var SL#_dryad_S2: $state;
  var stmtexpr1#8: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr0#7: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr0#4: $ptr;
  var SL#curr0: $ptr;
  var loopState#0: $state;
  var L#curr: $ptr;
  var stmtexpr1#10: $oset;
  var stmtexpr0#9: $oset;
  var res_dll_reach#3: $oset;
  var res_dll_reach#2: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$2^3.3: int;
  var #stackframe: int;

  anon10:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$2^3.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$2^3.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$2^3.3, (lambda #p: $ptr :: false));
    // assume true
    // assume true
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _math \oset res_dll_reach#2; 
    // res_dll_reach#2 := dll_reach(a); 
    call res_dll_reach#2 := dll_reach($phys_ptr_cast(P#a, ^d_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _math \oset res_dll_reach#3; 
    // res_dll_reach#3 := dll_reach(b); 
    call res_dll_reach#3 := dll_reach($phys_ptr_cast(P#b, ^d_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _dryad_G0 := @_vcc_oset_union(res_dll_reach#2, res_dll_reach#3); 
    SL#_dryad_G0 := $oset_union(res_dll_reach#2, res_dll_reach#3);
    // _math \oset stmtexpr0#9; 
    // stmtexpr0#9 := _dryad_G0; 
    stmtexpr0#9 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#10; 
    // stmtexpr1#10 := _dryad_G1; 
    stmtexpr1#10 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(b), ==(dll(b), &&(&&(dll(*((b->next))), ==>(@_vcc_ptr_neq_null(*((b->next))), @_vcc_ptr_eq_pure(*((*((b->next))->prev)), b))), unchecked!(@_vcc_oset_in(b, dll_reach(*((b->next)))))))); 
    assume $non_null($phys_ptr_cast(P#b, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#b, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#b, ^d_node)) && !$oset_in($phys_ptr_cast(P#b, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(b), ==(dll_reach(b), @_vcc_oset_union(dll_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
    assume $non_null($phys_ptr_cast(P#b, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#b, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#b, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(a), ==(dll(a), &&(&&(dll(*((a->next))), ==>(@_vcc_ptr_neq_null(*((a->next))), @_vcc_ptr_eq_pure(*((*((a->next))->prev)), a))), unchecked!(@_vcc_oset_in(a, dll_reach(*((a->next)))))))); 
    assume $non_null($phys_ptr_cast(P#a, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#a, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#a, ^d_node)) && !$oset_in($phys_ptr_cast(P#a, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(a), ==(dll_reach(a), @_vcc_oset_union(dll_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
    assume $non_null($phys_ptr_cast(P#a, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#a, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#a, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(a), &&(@_vcc_mutable(@state, a), @writes_check(a))); 
    assume $non_null($phys_ptr_cast(P#a, ^d_node)) ==> $mutable($s, $phys_ptr_cast(P#a, ^d_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(P#a, ^d_node));
    assume true;
    // if (@_vcc_ptr_eq_null(a)) ...
    if ($is_null($phys_ptr_cast(P#a, ^d_node)))
    {
      anon1:
        // return b; 
        $result := $phys_ptr_cast(P#b, ^d_node);
        assume true;
        assert $position_marker();
        goto #exit;
    }
    else
    {
      anon7:
        // assume ==>(@_vcc_ptr_neq_null(b), ==(dll(b), &&(&&(dll(*((b->next))), ==>(@_vcc_ptr_neq_null(*((b->next))), @_vcc_ptr_eq_pure(*((*((b->next))->prev)), b))), unchecked!(@_vcc_oset_in(b, dll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#b, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#b, ^d_node)) && !$oset_in($phys_ptr_cast(P#b, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(dll_reach(b), @_vcc_oset_union(dll_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#b, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#b, ^d_node)));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(dll(a), &&(&&(dll(*((a->next))), ==>(@_vcc_ptr_neq_null(*((a->next))), @_vcc_ptr_eq_pure(*((*((a->next))->prev)), a))), unchecked!(@_vcc_oset_in(a, dll_reach(*((a->next)))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#a, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#a, ^d_node)) && !$oset_in($phys_ptr_cast(P#a, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(dll_reach(a), @_vcc_oset_union(dll_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
        assume $non_null($phys_ptr_cast(P#a, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#a, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#a, ^d_node)));
        // struct d_node* curr; 
        // var struct d_node* curr
        // curr := a; 
        L#curr := $phys_ptr_cast(P#a, ^d_node);
        // assert dll_lseg(curr, curr); 
        assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
        // assume dll_lseg(curr, curr); 
        assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
        // assert dll_lseg(b, b); 
        assert F#dll_lseg($s, $phys_ptr_cast(P#b, ^d_node), $phys_ptr_cast(P#b, ^d_node));
        // assume dll_lseg(b, b); 
        assume F#dll_lseg($s, $phys_ptr_cast(P#b, ^d_node), $phys_ptr_cast(P#b, ^d_node));
        // assert dll_lseg(a, a); 
        assert F#dll_lseg($s, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(P#a, ^d_node));
        // assume dll_lseg(a, a); 
        assume F#dll_lseg($s, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(P#a, ^d_node));
        loopState#0 := $s;
        assume true;
        while (true)
          invariant $non_null($phys_ptr_cast(L#curr, ^d_node));
          invariant F#dll($s, $phys_ptr_cast(P#a, ^d_node));
          invariant F#dll($s, $phys_ptr_cast(L#curr, ^d_node));
          invariant F#dll_lseg($s, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
          invariant $oset_disjoint(F#dll_lseg_reach($s, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node)), F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)));
          invariant $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^d_node));
          invariant $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#curr, ^d_node));
        {
          anon4:
            assume $writes_nothing(old($s), $s);
            assume $timestamp_post(loopState#0, $s);
            assume $full_stop_ext(#tok$2^18.5, $s);
            // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
            assume $meta_eq(loopState#0, $s);
            // assert @reads_check_normal((curr->next)); 
            assert $thread_local($s, $phys_ptr_cast(L#curr, ^d_node));
            assume true;
            // if (@_vcc_ptr_neq_null(*((curr->next)))) ...
            if ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)))
            {
              anon2:
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(b), ==(dll(b), &&(&&(dll(*((b->next))), ==>(@_vcc_ptr_neq_null(*((b->next))), @_vcc_ptr_eq_pure(*((*((b->next))->prev)), b))), unchecked!(@_vcc_oset_in(b, dll_reach(*((b->next)))))))); 
                assume $non_null($phys_ptr_cast(P#b, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#b, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#b, ^d_node)) && !$oset_in($phys_ptr_cast(P#b, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(b), ==(dll_reach(b), @_vcc_oset_union(dll_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
                assume $non_null($phys_ptr_cast(P#b, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#b, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#b, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(a), ==(dll(a), &&(&&(dll(*((a->next))), ==>(@_vcc_ptr_neq_null(*((a->next))), @_vcc_ptr_eq_pure(*((*((a->next))->prev)), a))), unchecked!(@_vcc_oset_in(a, dll_reach(*((a->next)))))))); 
                assume $non_null($phys_ptr_cast(P#a, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#a, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#a, ^d_node)) && !$oset_in($phys_ptr_cast(P#a, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(a), ==(dll_reach(a), @_vcc_oset_union(dll_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
                assume $non_null($phys_ptr_cast(P#a, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#a, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#a, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_pure(a, curr), ==(dll_lseg(a, curr), &&(dll_lseg(*((a->next)), curr), unchecked!(@_vcc_oset_in(a, dll_lseg_reach(*((a->next)), curr)))))); 
                assume $phys_ptr_cast(P#a, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(P#a, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node))));
                // assume ==>(@_vcc_ptr_neq_pure(a, curr), ==(dll_lseg_reach(a, curr), @_vcc_oset_union(dll_lseg_reach(*((a->next)), curr), @_vcc_oset_singleton(a)))); 
                assume $phys_ptr_cast(P#a, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)), $oset_singleton($phys_ptr_cast(P#a, ^d_node)));
                // struct d_node* curr0; 
                // curr0 := curr; 
                SL#curr0 := $phys_ptr_cast(L#curr, ^d_node);
                // struct d_node* stmtexpr0#4; 
                // stmtexpr0#4 := curr0; 
                stmtexpr0#4 := $phys_ptr_cast(SL#curr0, ^d_node);
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_pure(curr, *((curr->next))), ==(dll_lseg(curr, *((curr->next))), &&(dll_lseg(*((curr->next)), *((curr->next))), unchecked!(@_vcc_oset_in(curr, dll_lseg_reach(*((curr->next)), *((curr->next)))))))); 
                assume $phys_ptr_cast(L#curr, ^d_node) != $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_pure(curr, *((curr->next))), ==(dll_lseg_reach(curr, *((curr->next))), @_vcc_oset_union(dll_lseg_reach(*((curr->next)), *((curr->next))), @_vcc_oset_singleton(curr)))); 
                assume $phys_ptr_cast(L#curr, ^d_node) != $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(L#curr, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
                // assert @reads_check_normal((curr->next)); 
                assert $thread_local($s, $phys_ptr_cast(L#curr, ^d_node));
                // curr := *((curr->next)); 
                L#curr := $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_pure(a, curr), ==(dll_lseg(a, curr), &&(dll_lseg(*((a->next)), curr), unchecked!(@_vcc_oset_in(a, dll_lseg_reach(*((a->next)), curr)))))); 
                assume $phys_ptr_cast(P#a, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(P#a, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node))));
                // assume ==>(@_vcc_ptr_neq_pure(a, curr), ==(dll_lseg_reach(a, curr), @_vcc_oset_union(dll_lseg_reach(*((a->next)), curr), @_vcc_oset_singleton(a)))); 
                assume $phys_ptr_cast(P#a, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)), $oset_singleton($phys_ptr_cast(P#a, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(curr), &&(@_vcc_mutable(@state, curr), @writes_check(curr))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^d_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#curr, ^d_node));
            }
            else
            {
              anon3:
                // assert @_vcc_possibly_unreachable; 
                assert {:PossiblyUnreachable true} true;
                // goto #break_1; 
                goto #break_1;
            }

          #continue_1:
            assume true;
        }

      anon8:
        assume $full_stop_ext(#tok$2^18.5, $s);

      #break_1:
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
        assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(dll(b), &&(&&(dll(*((b->next))), ==>(@_vcc_ptr_neq_null(*((b->next))), @_vcc_ptr_eq_pure(*((*((b->next))->prev)), b))), unchecked!(@_vcc_oset_in(b, dll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#b, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#b, ^d_node)) && !$oset_in($phys_ptr_cast(P#b, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(dll_reach(b), @_vcc_oset_union(dll_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#b, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#b, ^d_node)));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(dll(a), &&(&&(dll(*((a->next))), ==>(@_vcc_ptr_neq_null(*((a->next))), @_vcc_ptr_eq_pure(*((*((a->next))->prev)), a))), unchecked!(@_vcc_oset_in(a, dll_reach(*((a->next)))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#a, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#a, ^d_node)) && !$oset_in($phys_ptr_cast(P#a, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(dll_reach(a), @_vcc_oset_union(dll_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
        assume $non_null($phys_ptr_cast(P#a, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#a, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#a, ^d_node)));
        // _math \state _dryad_S0; 
        // _dryad_S0 := @_vcc_current_state(@state); 
        SL#_dryad_S0 := $current_state($s);
        // _math \state stmtexpr0#7; 
        // stmtexpr0#7 := _dryad_S0; 
        stmtexpr0#7 := SL#_dryad_S0;
        // assert @prim_writes_check((curr->next)); 
        assert $writable_prim($s, #wrTime$2^3.3, $dot($phys_ptr_cast(L#curr, ^d_node), d_node.next));
        // *(curr->next) := b; 
        call $write_int(d_node.next, $phys_ptr_cast(L#curr, ^d_node), $ptr_to_int($phys_ptr_cast(P#b, ^d_node)));
        assume $full_stop_ext(#tok$2^29.5, $s);
        // _math \state _dryad_S1; 
        // _dryad_S1 := @_vcc_current_state(@state); 
        SL#_dryad_S1 := $current_state($s);
        // _math \state stmtexpr1#8; 
        // stmtexpr1#8 := _dryad_S1; 
        stmtexpr1#8 := SL#_dryad_S1;
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, dll_reach(*((curr->prev)))))), ==(old(_dryad_S0, dll(*((curr->prev)))), old(_dryad_S1, dll(*((curr->prev)))))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node))) ==> F#dll(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) == F#dll(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, dll_reach(*((curr->prev)))))), ==(old(_dryad_S0, dll_reach(*((curr->prev)))), old(_dryad_S1, dll_reach(*((curr->prev)))))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) == F#dll_reach(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, dll_reach(b)))), ==(old(_dryad_S0, dll(b)), old(_dryad_S1, dll(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(P#b, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(P#b, ^d_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, dll_reach(b)))), ==(old(_dryad_S0, dll_reach(b)), old(_dryad_S1, dll_reach(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(P#b, ^d_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, dll_reach(a)))), ==(old(_dryad_S0, dll(a)), old(_dryad_S1, dll(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(P#a, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(P#a, ^d_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, dll_reach(a)))), ==(old(_dryad_S0, dll_reach(a)), old(_dryad_S1, dll_reach(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(P#a, ^d_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, dll_lseg_reach(a, curr)))), ==(old(_dryad_S0, dll_lseg(a, curr)), old(_dryad_S1, dll_lseg(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_lseg(SL#_dryad_S0, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == F#dll_lseg(SL#_dryad_S1, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, dll_lseg_reach(a, curr)))), ==(old(_dryad_S0, dll_lseg_reach(a, curr)), old(_dryad_S1, dll_lseg_reach(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == F#dll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(curr, b)), @_vcc_ptr_eq_pure(*((b->prev)), old(_dryad_S0, *((b->prev))))); 
        assume !($phys_ptr_cast(L#curr, ^d_node) == $phys_ptr_cast(P#b, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(P#b, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(P#b, ^d_node), ^d_node);
        // assume ==>(!(@_vcc_ptr_eq_pure(curr, b)), @_vcc_ptr_eq_pure(*((b->next)), old(_dryad_S0, *((b->next))))); 
        assume !($phys_ptr_cast(L#curr, ^d_node) == $phys_ptr_cast(P#b, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node);
        // assume ==>(!(@_vcc_ptr_eq_pure(curr, a)), @_vcc_ptr_eq_pure(*((a->prev)), old(_dryad_S0, *((a->prev))))); 
        assume !($phys_ptr_cast(L#curr, ^d_node) == $phys_ptr_cast(P#a, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(P#a, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(P#a, ^d_node), ^d_node);
        // assume ==>(!(@_vcc_ptr_eq_pure(curr, a)), @_vcc_ptr_eq_pure(*((a->next)), old(_dryad_S0, *((a->next))))); 
        assume !($phys_ptr_cast(L#curr, ^d_node) == $phys_ptr_cast(P#a, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node);
        // assume ==>(@_vcc_ptr_neq_null(b), ==(dll(b), &&(&&(dll(*((b->next))), ==>(@_vcc_ptr_neq_null(*((b->next))), @_vcc_ptr_eq_pure(*((*((b->next))->prev)), b))), unchecked!(@_vcc_oset_in(b, dll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#b, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#b, ^d_node)) && !$oset_in($phys_ptr_cast(P#b, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(dll_reach(b), @_vcc_oset_union(dll_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#b, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#b, ^d_node)));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(dll(a), &&(&&(dll(*((a->next))), ==>(@_vcc_ptr_neq_null(*((a->next))), @_vcc_ptr_eq_pure(*((*((a->next))->prev)), a))), unchecked!(@_vcc_oset_in(a, dll_reach(*((a->next)))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#a, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#a, ^d_node)) && !$oset_in($phys_ptr_cast(P#a, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(dll_reach(a), @_vcc_oset_union(dll_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
        assume $non_null($phys_ptr_cast(P#a, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#a, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#a, ^d_node)));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
        assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(dll(b), &&(&&(dll(*((b->next))), ==>(@_vcc_ptr_neq_null(*((b->next))), @_vcc_ptr_eq_pure(*((*((b->next))->prev)), b))), unchecked!(@_vcc_oset_in(b, dll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#b, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#b, ^d_node)) && !$oset_in($phys_ptr_cast(P#b, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(dll_reach(b), @_vcc_oset_union(dll_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#b, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#b, ^d_node)));
        assume true;
        // if (@_vcc_ptr_neq_null(b)) ...
        if ($non_null($phys_ptr_cast(P#b, ^d_node)))
        {
          anon5:
            // _math \state _dryad_S2; 
            // _dryad_S2 := @_vcc_current_state(@state); 
            SL#_dryad_S2 := $current_state($s);
            // _math \state stmtexpr0#5; 
            // stmtexpr0#5 := _dryad_S2; 
            stmtexpr0#5 := SL#_dryad_S2;
            // assert @prim_writes_check((b->prev)); 
            assert $writable_prim($s, #wrTime$2^3.3, $dot($phys_ptr_cast(P#b, ^d_node), d_node.prev));
            // *(b->prev) := curr; 
            call $write_int(d_node.prev, $phys_ptr_cast(P#b, ^d_node), $ptr_to_int($phys_ptr_cast(L#curr, ^d_node)));
            assume $full_stop_ext(#tok$2^31.7, $s);
            // _math \state _dryad_S3; 
            // _dryad_S3 := @_vcc_current_state(@state); 
            SL#_dryad_S3 := $current_state($s);
            // _math \state stmtexpr1#6; 
            // stmtexpr1#6 := _dryad_S3; 
            stmtexpr1#6 := SL#_dryad_S3;
            // assume ==>(unchecked!(@_vcc_oset_in(b, old(_dryad_S2, dll_reach(*((b->next)))))), ==(old(_dryad_S2, dll(*((b->next)))), old(_dryad_S3, dll(*((b->next)))))); 
            assume !$oset_in($phys_ptr_cast(P#b, ^d_node), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node))) ==> F#dll(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)) == F#dll(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(b, old(_dryad_S2, dll_reach(*((b->next)))))), ==(old(_dryad_S2, dll_reach(*((b->next)))), old(_dryad_S3, dll_reach(*((b->next)))))); 
            assume !$oset_in($phys_ptr_cast(P#b, ^d_node), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node)) == F#dll_reach(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, d_node.next, $phys_ptr_cast(P#b, ^d_node), ^d_node));
            // assume ==(old(_dryad_S2, dll(b)), old(_dryad_S3, dll(b))); 
            assume F#dll(SL#_dryad_S2, $phys_ptr_cast(P#b, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(P#b, ^d_node));
            // assume ==(old(_dryad_S2, dll_reach(b)), old(_dryad_S3, dll_reach(b))); 
            assume F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#b, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(P#b, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(b, old(_dryad_S2, dll_reach(curr)))), ==(old(_dryad_S2, dll(curr)), old(_dryad_S3, dll(curr)))); 
            assume !$oset_in($phys_ptr_cast(P#b, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(b, old(_dryad_S2, dll_reach(curr)))), ==(old(_dryad_S2, dll_reach(curr)), old(_dryad_S3, dll_reach(curr)))); 
            assume !$oset_in($phys_ptr_cast(P#b, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(b, old(_dryad_S2, dll_reach(a)))), ==(old(_dryad_S2, dll(a)), old(_dryad_S3, dll(a)))); 
            assume !$oset_in($phys_ptr_cast(P#b, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#a, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(P#a, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(P#a, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(b, old(_dryad_S2, dll_reach(a)))), ==(old(_dryad_S2, dll_reach(a)), old(_dryad_S3, dll_reach(a)))); 
            assume !$oset_in($phys_ptr_cast(P#b, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#a, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#a, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(P#a, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(b, old(_dryad_S2, dll_lseg_reach(a, curr)))), ==(old(_dryad_S2, dll_lseg(a, curr)), old(_dryad_S3, dll_lseg(a, curr)))); 
            assume !$oset_in($phys_ptr_cast(P#b, ^d_node), F#dll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_lseg(SL#_dryad_S2, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == F#dll_lseg(SL#_dryad_S3, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(b, old(_dryad_S2, dll_lseg_reach(a, curr)))), ==(old(_dryad_S2, dll_lseg_reach(a, curr)), old(_dryad_S3, dll_lseg_reach(a, curr)))); 
            assume !$oset_in($phys_ptr_cast(P#b, ^d_node), F#dll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == F#dll_lseg_reach(SL#_dryad_S3, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(b, curr)), @_vcc_ptr_eq_pure(*((curr->prev)), old(_dryad_S2, *((curr->prev))))); 
            assume !($phys_ptr_cast(P#b, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(b, curr)), @_vcc_ptr_eq_pure(*((curr->next)), old(_dryad_S2, *((curr->next))))); 
            assume !($phys_ptr_cast(P#b, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(b, a)), @_vcc_ptr_eq_pure(*((a->prev)), old(_dryad_S2, *((a->prev))))); 
            assume !($phys_ptr_cast(P#b, ^d_node) == $phys_ptr_cast(P#a, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(P#a, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(P#a, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(b, a)), @_vcc_ptr_eq_pure(*((a->next)), old(_dryad_S2, *((a->next))))); 
            assume !($phys_ptr_cast(P#b, ^d_node) == $phys_ptr_cast(P#a, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node);
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(a), ==(dll(a), &&(&&(dll(*((a->next))), ==>(@_vcc_ptr_neq_null(*((a->next))), @_vcc_ptr_eq_pure(*((*((a->next))->prev)), a))), unchecked!(@_vcc_oset_in(a, dll_reach(*((a->next)))))))); 
            assume $non_null($phys_ptr_cast(P#a, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#a, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#a, ^d_node)) && !$oset_in($phys_ptr_cast(P#a, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(a), ==(dll_reach(a), @_vcc_oset_union(dll_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
            assume $non_null($phys_ptr_cast(P#a, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#a, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#a, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_pure(a, curr), ==(dll_lseg(a, curr), &&(dll_lseg(*((a->next)), curr), unchecked!(@_vcc_oset_in(a, dll_lseg_reach(*((a->next)), curr)))))); 
            assume $phys_ptr_cast(P#a, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(P#a, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_pure(a, curr), ==(dll_lseg_reach(a, curr), @_vcc_oset_union(dll_lseg_reach(*((a->next)), curr), @_vcc_oset_singleton(a)))); 
            assume $phys_ptr_cast(P#a, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(P#a, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#a, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)), $oset_singleton($phys_ptr_cast(P#a, ^d_node)));
        }
        else
        {
          anon6:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
        }

      anon9:
        // return a; 
        $result := $phys_ptr_cast(P#a, ^d_node);
        assume true;
        assert $position_marker();
        goto #exit;
    }

  anon11:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$2^31.7: $token;

const unique #tok$2^29.5: $token;

const unique #tok$2^18.5: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^3.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cgrass?5Cdl?5Cdl_concat.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cgrass?5Cdl?5Cdl_concat.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cgrass?5Cdl?5Cdryad_dl.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cgrass?5Cdl?5Cdryad_dl.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^d_node);
