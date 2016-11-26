axiom $arch_ptr_size == 8;

axiom $arch_spec_ptr_start == $max.u8;

const unique ^$##thread_id: $ctype;

axiom $def_math_type(^$##thread_id);

type $##thread_id;

const unique ^$##club: $ctype;

axiom $def_math_type(^$##club);

type $##club;

const unique ^s_node: $ctype;

axiom $is_span_sequential(^s_node);

axiom $def_struct_type(^s_node, 16, false, false);

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2(#s1, #s2, #p, ^s_node) } $inv2(#s1, #s2, #p, ^s_node) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2_without_lemmas(#s1, #s2, #p, ^s_node) } $inv2_without_lemmas(#s1, #s2, #p, ^s_node) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall p: $ptr, q: $ptr, s: $state :: { $in(q, $composite_extent(s, p, ^s_node)) } $in(q, $composite_extent(s, p, ^s_node)) == (q == p));

const unique s_node.key: $field;

axiom $def_phys_field(^s_node, s_node.key, ^^i4, false, 0);

const unique s_node.next: $field;

axiom $def_phys_field(^s_node, s_node.next, $ptr_to(^s_node), false, 8);

const unique ^$#_purecall_handler#1: $ctype;

axiom $def_fnptr_type(^$#_purecall_handler#1);

type $#_purecall_handler#1;

const unique ^$#_invalid_parameter_handler#2: $ctype;

axiom $def_fnptr_type(^$#_invalid_parameter_handler#2);

type $#_invalid_parameter_handler#2;

const unique ^$#sl_concat.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#sl_concat.c..36263#3);

type $#sl_concat.c..36263#3;

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

function F#sll(#s: $state, SP#hd: $ptr) : bool;

const unique cf#sll: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#sll(#s, SP#hd) } 1 < $decreases_level ==> $is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> F#sll(#s, SP#hd));

axiom $function_arg_type(cf#sll, 0, ^^bool);

axiom $function_arg_type(cf#sll, 1, $ptr_to(^s_node));

procedure sll(SP#hd: $ptr) returns ($result: bool);
  ensures $is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $result;
  free ensures $result == F#sll($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#sll_reach(#s: $state, SP#hd: $ptr) : $oset;

const unique cf#sll_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#sll_reach(#s, SP#hd) } 1 < $decreases_level ==> ($non_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $oset_in($phys_ptr_cast(SP#hd, ^s_node), F#sll_reach(#s, SP#hd))) && ($is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> F#sll_reach(#s, SP#hd) == $oset_empty()));

axiom $function_arg_type(cf#sll_reach, 0, ^$#oset);

axiom $function_arg_type(cf#sll_reach, 1, $ptr_to(^s_node));

procedure sll_reach(SP#hd: $ptr) returns ($result: $oset);
  ensures ($non_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $oset_in($phys_ptr_cast(SP#hd, ^s_node), $result)) && ($is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $result == $oset_empty());
  free ensures $result == F#sll_reach($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#sll_keys(#s: $state, SP#hd: $ptr) : $intset;

const unique cf#sll_keys: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#sll_keys(#s, SP#hd) } 1 < $decreases_level ==> ($non_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $intset_in($rd_inv(#s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node)), F#sll_keys(#s, SP#hd))) && ($is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> F#sll_keys(#s, SP#hd) == $intset_empty()));

axiom $function_arg_type(cf#sll_keys, 0, ^$#intset);

axiom $function_arg_type(cf#sll_keys, 1, $ptr_to(^s_node));

procedure sll_keys(SP#hd: $ptr) returns ($result: $intset);
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $intset_in($rd_inv($s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node)), $result);
  ensures $is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $result == $intset_empty();
  free ensures $result == F#sll_keys($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#sll_lseg(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : bool;

const unique cf#sll_lseg: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#sll_lseg(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($is_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg(#s, SP#hd, SP#tl)) && ($phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg(#s, SP#hd, SP#tl)) && ($is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> F#sll_lseg(#s, SP#hd, SP#tl) == F#sll(#s, $phys_ptr_cast(SP#hd, ^s_node))) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && F#sll(#s, $phys_ptr_cast(SP#tl, ^s_node)) && $oset_disjoint(F#sll_reach(#s, $phys_ptr_cast(SP#tl, ^s_node)), F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node))) ==> F#sll(#s, $phys_ptr_cast(SP#hd, ^s_node)) && F#sll_reach(#s, $phys_ptr_cast(SP#hd, ^s_node)) == $oset_union(F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), F#sll_reach(#s, $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_keys(#s, $phys_ptr_cast(SP#hd, ^s_node)) == $intset_union(F#sll_keys(#s, $phys_ptr_cast(SP#tl, ^s_node)), F#sll_lseg_keys(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)))) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $non_null($phys_ptr_cast(SP#tl, ^s_node)) && F#sll(#s, $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) && F#sll_lseg(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)) && $oset_disjoint(F#sll_reach(#s, $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)), F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^s_node), F#sll_reach(#s, $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^s_node), F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node))) ==> $oset_in($phys_ptr_cast(SP#tl, ^s_node), F#sll_reach(#s, $phys_ptr_cast(SP#hd, ^s_node))) && F#sll_lseg(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) && F#sll_lseg_keys(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $intset_union($intset_singleton($rd_inv(#s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node))), F#sll_lseg_keys(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $oset_union_one1($phys_ptr_cast(SP#tl, ^s_node), F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)))));

axiom $function_arg_type(cf#sll_lseg, 0, ^^bool);

axiom $function_arg_type(cf#sll_lseg, 1, $ptr_to(^s_node));

axiom $function_arg_type(cf#sll_lseg, 2, $ptr_to(^s_node));

procedure sll_lseg(SP#hd: $ptr, SP#tl: $ptr) returns ($result: bool);
  ensures $is_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $result;
  ensures $phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> $result;
  ensures $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> $result == F#sll($s, $phys_ptr_cast(SP#hd, ^s_node));
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && F#sll($s, $phys_ptr_cast(SP#tl, ^s_node)) && $oset_disjoint(F#sll_reach($s, $phys_ptr_cast(SP#tl, ^s_node)), F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node))) ==> F#sll($s, $phys_ptr_cast(SP#hd, ^s_node)) && F#sll_reach($s, $phys_ptr_cast(SP#hd, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), F#sll_reach($s, $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_keys($s, $phys_ptr_cast(SP#hd, ^s_node)) == $intset_union(F#sll_keys($s, $phys_ptr_cast(SP#tl, ^s_node)), F#sll_lseg_keys($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)));
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $non_null($phys_ptr_cast(SP#tl, ^s_node)) && F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) && F#sll_lseg($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)) && $oset_disjoint(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)), F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^s_node), F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node))) ==> $oset_in($phys_ptr_cast(SP#tl, ^s_node), F#sll_reach($s, $phys_ptr_cast(SP#hd, ^s_node))) && F#sll_lseg($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) && F#sll_lseg_keys($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $intset_union($intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node))), F#sll_lseg_keys($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $oset_union_one1($phys_ptr_cast(SP#tl, ^s_node), F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)));
  free ensures $result == F#sll_lseg($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#sll_lseg_reach(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : $oset;

const unique cf#sll_lseg_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#sll_lseg_reach(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($is_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg_reach(#s, SP#hd, SP#tl) == $oset_empty()) && ($phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg_reach(#s, SP#hd, SP#tl) == $oset_empty()) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $oset_in($phys_ptr_cast(SP#hd, ^s_node), F#sll_lseg_reach(#s, SP#hd, SP#tl))) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> F#sll_lseg_reach(#s, SP#hd, SP#tl) == F#sll_reach(#s, $phys_ptr_cast(SP#hd, ^s_node))));

axiom $function_arg_type(cf#sll_lseg_reach, 0, ^$#oset);

axiom $function_arg_type(cf#sll_lseg_reach, 1, $ptr_to(^s_node));

axiom $function_arg_type(cf#sll_lseg_reach, 2, $ptr_to(^s_node));

procedure sll_lseg_reach(SP#hd: $ptr, SP#tl: $ptr) returns ($result: $oset);
  ensures $is_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $result == $oset_empty();
  ensures $phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> $result == $oset_empty();
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $oset_in($phys_ptr_cast(SP#hd, ^s_node), $result);
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> $result == F#sll_reach($s, $phys_ptr_cast(SP#hd, ^s_node));
  free ensures $result == F#sll_lseg_reach($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#sll_lseg_keys(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : $intset;

const unique cf#sll_lseg_keys: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#sll_lseg_keys(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($is_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg_keys(#s, SP#hd, SP#tl) == $intset_empty()) && ($phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg_keys(#s, SP#hd, SP#tl) == $intset_empty()) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $intset_in($rd_inv(#s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node)), F#sll_lseg_keys(#s, SP#hd, SP#tl))) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> F#sll_lseg_keys(#s, SP#hd, SP#tl) == F#sll_keys(#s, $phys_ptr_cast(SP#hd, ^s_node))));

axiom $function_arg_type(cf#sll_lseg_keys, 0, ^$#intset);

axiom $function_arg_type(cf#sll_lseg_keys, 1, $ptr_to(^s_node));

axiom $function_arg_type(cf#sll_lseg_keys, 2, $ptr_to(^s_node));

procedure sll_lseg_keys(SP#hd: $ptr, SP#tl: $ptr) returns ($result: $intset);
  ensures $is_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $result == $intset_empty();
  ensures $phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> $result == $intset_empty();
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $intset_in($rd_inv($s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node)), $result);
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> $result == F#sll_keys($s, $phys_ptr_cast(SP#hd, ^s_node));
  free ensures $result == F#sll_lseg_keys($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



procedure concat(P#a: $ptr, P#b: $ptr) returns ($result: $ptr);
  requires F#sll($s, $phys_ptr_cast(P#a, ^s_node));
  requires F#sll($s, $phys_ptr_cast(P#b, ^s_node));
  requires $oset_disjoint(F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)), F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)));
  modifies $s, $cev_pc;
  ensures F#sll($s, $phys_ptr_cast($result, ^s_node));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation concat(P#a: $ptr, P#b: $ptr) returns ($result: $ptr)
{
  var stmtexpr1#6: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr0#5: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr0#4: $ptr;
  var SL#curr0: $ptr;
  var loopState#0: $state;
  var L#curr: $ptr;
  var stmtexpr1#8: $oset;
  var stmtexpr0#7: $oset;
  var res_sll_reach#3: $oset;
  var res_sll_reach#2: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$2^3.3: int;
  var #stackframe: int;

  anon7:
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
    // _math \oset res_sll_reach#2; 
    // res_sll_reach#2 := sll_reach(a); 
    call res_sll_reach#2 := sll_reach($phys_ptr_cast(P#a, ^s_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _math \oset res_sll_reach#3; 
    // res_sll_reach#3 := sll_reach(b); 
    call res_sll_reach#3 := sll_reach($phys_ptr_cast(P#b, ^s_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _dryad_G0 := @_vcc_oset_union(res_sll_reach#2, res_sll_reach#3); 
    SL#_dryad_G0 := $oset_union(res_sll_reach#2, res_sll_reach#3);
    // _math \oset stmtexpr0#7; 
    // stmtexpr0#7 := _dryad_G0; 
    stmtexpr0#7 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#8; 
    // stmtexpr1#8 := _dryad_G1; 
    stmtexpr1#8 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union_one2(sll_reach(*((b->next))), b))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $phys_ptr_cast(P#b, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_keys(a), @_vcc_intset_union(sll_keys(*((a->next))), @_vcc_intset_singleton(*((a->key)))))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#a, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(a), ==(sll(a), &&(sll(*((a->next))), unchecked!(@_vcc_oset_in(a, sll_reach(*((a->next)))))))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#a, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_reach(a), @_vcc_oset_union_one2(sll_reach(*((a->next))), a))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $phys_ptr_cast(P#a, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(a), &&(@_vcc_mutable(@state, a), @writes_check(a))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> $mutable($s, $phys_ptr_cast(P#a, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(P#a, ^s_node));
    assume true;
    // if (@_vcc_ptr_eq_null(a)) ...
    if ($is_null($phys_ptr_cast(P#a, ^s_node)))
    {
      anon1:
        // return b; 
        $result := $phys_ptr_cast(P#b, ^s_node);
        assume true;
        assert $position_marker();
        goto #exit;
    }
    else
    {
      anon5:
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union_one2(sll_reach(*((b->next))), b))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_keys(a), @_vcc_intset_union(sll_keys(*((a->next))), @_vcc_intset_singleton(*((a->key)))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#a, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll(a), &&(sll(*((a->next))), unchecked!(@_vcc_oset_in(a, sll_reach(*((a->next)))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#a, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_reach(a), @_vcc_oset_union_one2(sll_reach(*((a->next))), a))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $phys_ptr_cast(P#a, ^s_node));
        // struct s_node* curr; 
        // var struct s_node* curr
        // curr := a; 
        L#curr := $phys_ptr_cast(P#a, ^s_node);
        // assert sll_lseg(curr, curr); 
        assert F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume sll_lseg(curr, curr); 
        assume F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assert sll_lseg(b, b); 
        assert F#sll_lseg($s, $phys_ptr_cast(P#b, ^s_node), $phys_ptr_cast(P#b, ^s_node));
        // assume sll_lseg(b, b); 
        assume F#sll_lseg($s, $phys_ptr_cast(P#b, ^s_node), $phys_ptr_cast(P#b, ^s_node));
        // assert sll_lseg(a, a); 
        assert F#sll_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(P#a, ^s_node));
        // assume sll_lseg(a, a); 
        assume F#sll_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(P#a, ^s_node));
        loopState#0 := $s;
        assume true;
        while (true)
          invariant $non_null($phys_ptr_cast(L#curr, ^s_node));
          invariant F#sll($s, $phys_ptr_cast(P#a, ^s_node));
          invariant F#sll($s, $phys_ptr_cast(L#curr, ^s_node));
          invariant F#sll_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
          invariant $oset_disjoint(F#sll_lseg_reach($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)), F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)));
          invariant $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^s_node));
          invariant $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#curr, ^s_node));
        {
          anon4:
            assume $writes_nothing(old($s), $s);
            assume $timestamp_post(loopState#0, $s);
            assume $full_stop_ext(#tok$2^16.5, $s);
            // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
            assume $meta_eq(loopState#0, $s);
            // assert @reads_check_normal((curr->next)); 
            assert $thread_local($s, $phys_ptr_cast(L#curr, ^s_node));
            assume true;
            // if (@_vcc_ptr_neq_null(*((curr->next)))) ...
            if ($non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)))
            {
              anon2:
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union_one2(sll_reach(*((b->next))), b))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $phys_ptr_cast(P#b, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_keys(a), @_vcc_intset_union(sll_keys(*((a->next))), @_vcc_intset_singleton(*((a->key)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#a, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(a), ==(sll(a), &&(sll(*((a->next))), unchecked!(@_vcc_oset_in(a, sll_reach(*((a->next)))))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#a, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_reach(a), @_vcc_oset_union_one2(sll_reach(*((a->next))), a))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $phys_ptr_cast(P#a, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg(a, curr), &&(sll_lseg(*((a->next)), curr), unchecked!(@_vcc_oset_in(a, sll_lseg_reach(*((a->next)), curr)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg_reach(a, curr), @_vcc_oset_union_one2(sll_lseg_reach(*((a->next)), curr), a))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $phys_ptr_cast(P#a, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg_keys(a, curr), @_vcc_intset_union(sll_lseg_keys(*((a->next)), curr), @_vcc_intset_singleton(*((a->key)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
                // struct s_node* curr0; 
                // curr0 := curr; 
                SL#curr0 := $phys_ptr_cast(L#curr, ^s_node);
                // struct s_node* stmtexpr0#4; 
                // stmtexpr0#4 := curr0; 
                stmtexpr0#4 := $phys_ptr_cast(SL#curr0, ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_pure(curr, *((curr->next)))), ==(sll_lseg(curr, *((curr->next))), &&(sll_lseg(*((curr->next)), *((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_lseg_reach(*((curr->next)), *((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $phys_ptr_cast(L#curr, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_pure(curr, *((curr->next)))), ==(sll_lseg_reach(curr, *((curr->next))), @_vcc_oset_union_one2(sll_lseg_reach(*((curr->next)), *((curr->next))), curr))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $phys_ptr_cast(L#curr, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#curr, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_pure(curr, *((curr->next)))), ==(sll_lseg_keys(curr, *((curr->next))), @_vcc_intset_union(sll_lseg_keys(*((curr->next)), *((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $phys_ptr_cast(L#curr, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#curr, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
                // assert @reads_check_normal((curr->next)); 
                assert $thread_local($s, $phys_ptr_cast(L#curr, ^s_node));
                // curr := *((curr->next)); 
                L#curr := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg(a, curr), &&(sll_lseg(*((a->next)), curr), unchecked!(@_vcc_oset_in(a, sll_lseg_reach(*((a->next)), curr)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg_reach(a, curr), @_vcc_oset_union_one2(sll_lseg_reach(*((a->next)), curr), a))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $phys_ptr_cast(P#a, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg_keys(a, curr), @_vcc_intset_union(sll_lseg_keys(*((a->next)), curr), @_vcc_intset_singleton(*((a->key)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), &&(@_vcc_mutable(@state, curr), @writes_check(curr))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#curr, ^s_node));
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

      anon6:
        assume $full_stop_ext(#tok$2^16.5, $s);

      #break_1:
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union_one2(sll_reach(*((b->next))), b))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_keys(a), @_vcc_intset_union(sll_keys(*((a->next))), @_vcc_intset_singleton(*((a->key)))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#a, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll(a), &&(sll(*((a->next))), unchecked!(@_vcc_oset_in(a, sll_reach(*((a->next)))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#a, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_reach(a), @_vcc_oset_union_one2(sll_reach(*((a->next))), a))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $phys_ptr_cast(P#a, ^s_node));
        // _math \state _dryad_S0; 
        // _dryad_S0 := @_vcc_current_state(@state); 
        SL#_dryad_S0 := $current_state($s);
        // _math \state stmtexpr0#5; 
        // stmtexpr0#5 := _dryad_S0; 
        stmtexpr0#5 := SL#_dryad_S0;
        // assert @prim_writes_check((curr->next)); 
        assert $writable_prim($s, #wrTime$2^3.3, $dot($phys_ptr_cast(L#curr, ^s_node), s_node.next));
        // *(curr->next) := b; 
        call $write_int(s_node.next, $phys_ptr_cast(L#curr, ^s_node), $ptr_to_int($phys_ptr_cast(P#b, ^s_node)));
        assume $full_stop_ext(#tok$2^27.5, $s);
        // _math \state _dryad_S1; 
        // _dryad_S1 := @_vcc_current_state(@state); 
        SL#_dryad_S1 := $current_state($s);
        // _math \state stmtexpr1#6; 
        // stmtexpr1#6 := _dryad_S1; 
        stmtexpr1#6 := SL#_dryad_S1;
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(b)))), ==(old(_dryad_S0, sll_keys(b)), old(_dryad_S1, sll_keys(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(b)))), ==(old(_dryad_S0, sll(b)), old(_dryad_S1, sll(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(b)))), ==(old(_dryad_S0, sll_reach(b)), old(_dryad_S1, sll_reach(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(a)))), ==(old(_dryad_S0, sll_keys(a)), old(_dryad_S1, sll_keys(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(a)))), ==(old(_dryad_S0, sll(a)), old(_dryad_S1, sll(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(a)))), ==(old(_dryad_S0, sll_reach(a)), old(_dryad_S1, sll_reach(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_lseg_reach(a, curr)))), ==(old(_dryad_S0, sll_lseg(a, curr)), old(_dryad_S1, sll_lseg(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_lseg_reach(a, curr)))), ==(old(_dryad_S0, sll_lseg_reach(a, curr)), old(_dryad_S1, sll_lseg_reach(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_lseg_reach(a, curr)))), ==(old(_dryad_S0, sll_lseg_keys(a, curr)), old(_dryad_S1, sll_lseg_keys(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(curr, b)), ==(*((b->key)), old(_dryad_S0, *((b->key))))); 
        assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(P#b, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(curr, b)), @_vcc_ptr_eq_pure(*((b->next)), old(_dryad_S0, *((b->next))))); 
        assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(P#b, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node);
        // assume ==>(!(@_vcc_ptr_eq_pure(curr, a)), ==(*((a->key)), old(_dryad_S0, *((a->key))))); 
        assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(P#a, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(curr, a)), @_vcc_ptr_eq_pure(*((a->next)), old(_dryad_S0, *((a->next))))); 
        assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(P#a, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node);
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union_one2(sll_reach(*((b->next))), b))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_keys(a), @_vcc_intset_union(sll_keys(*((a->next))), @_vcc_intset_singleton(*((a->key)))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#a, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll(a), &&(sll(*((a->next))), unchecked!(@_vcc_oset_in(a, sll_reach(*((a->next)))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#a, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_reach(a), @_vcc_oset_union_one2(sll_reach(*((a->next))), a))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union_one2(sll_reach(*((b->next))), b))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $phys_ptr_cast(P#b, ^s_node));
        // return a; 
        $result := $phys_ptr_cast(P#a, ^s_node);
        assume true;
        assert $position_marker();
        goto #exit;
    }

  anon8:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$2^27.5: $token;

const unique #tok$2^16.5: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^3.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cgrass?5Csl?5Csl_concat.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cgrass?5Csl?5Csl_concat.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cgrass?5Csl?5Cdryad_sl.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cgrass?5Csl?5Cdryad_sl.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^s_node);
