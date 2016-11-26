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

function F#glob_reach() : $oset;

const unique cf#glob_reach: $pure_function;

axiom $function_arg_type(cf#glob_reach, 0, ^$#oset);

procedure glob_reach() returns ($result: $oset);
  free ensures $result == F#glob_reach();
  free ensures $call_transition(old($s), $s);



const unique ^$#_purecall_handler#1: $ctype;

axiom $def_fnptr_type(^$#_purecall_handler#1);

type $#_purecall_handler#1;

const unique ^$#_invalid_parameter_handler#2: $ctype;

axiom $def_fnptr_type(^$#_invalid_parameter_handler#2);

type $#_invalid_parameter_handler#2;

const unique ^$#sl_copy.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#sl_copy.c..36263#3);

type $#sl_copy.c..36263#3;

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



procedure sl_copy(P#lst: $ptr) returns ($result: $ptr);
  requires F#sll($s, $phys_ptr_cast(P#lst, ^s_node));
  modifies $s, $cev_pc;
  ensures F#sll($s, $phys_ptr_cast(P#lst, ^s_node));
  ensures F#sll($s, $phys_ptr_cast($result, ^s_node));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation sl_copy(P#lst: $ptr) returns ($result: $ptr)
{
  var stmtexpr5#7: $ptr;
  var SL#curr1: $ptr;
  var stmtexpr4#6: $state;
  var SL#_dryad_S3: $state;
  var stmtexpr3#5: $state;
  var SL#_dryad_S2: $state;
  var stmtexpr2#4: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr1#3: $oset;
  var stmtexpr0#2: $state;
  var SL#_dryad_S0: $state;
  var L#old_cp: $ptr;
  var loopState#0: $state;
  var SL#ALL_REACH: $oset;
  var L#curr: $ptr;
  var L#cp: $ptr;
  var stmtexpr1#9: $oset;
  var stmtexpr0#8: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$3^3.3: int;
  var #stackframe: int;

  anon4:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$3^3.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$3^3.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$3^3.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    // assume true
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := sll_reach(lst); 
    call SL#_dryad_G0 := sll_reach($phys_ptr_cast(P#lst, ^s_node));
    assume $full_stop_ext(#tok$4^0.0, $s);
    // _math \oset stmtexpr0#8; 
    // stmtexpr0#8 := _dryad_G0; 
    stmtexpr0#8 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#9; 
    // stmtexpr1#9 := _dryad_G1; 
    stmtexpr1#9 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(lst), ==(sll_keys(lst), @_vcc_intset_union(sll_keys(*((lst->next))), @_vcc_intset_singleton(*((lst->key)))))); 
    assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#lst, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#lst, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(lst), ==(sll(lst), &&(sll(*((lst->next))), unchecked!(@_vcc_oset_in(lst, sll_reach(*((lst->next)))))))); 
    assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#lst, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#lst, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(lst), ==(sll_reach(lst), @_vcc_oset_union_one2(sll_reach(*((lst->next))), lst))); 
    assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#lst, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node)), $phys_ptr_cast(P#lst, ^s_node));
    // struct s_node* cp; 
    // struct s_node* curr; 
    // _math \oset ALL_REACH; 
    // assume ==>(@_vcc_ptr_neq_null(lst), &&(@_vcc_mutable(@state, lst), @writes_check(lst))); 
    assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> $mutable($s, $phys_ptr_cast(P#lst, ^s_node)) && $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(P#lst, ^s_node));
    // ALL_REACH := sll_reach(lst); 
    call SL#ALL_REACH := sll_reach($phys_ptr_cast(P#lst, ^s_node));
    assume $full_stop_ext(#tok$3^10.29, $s);
    // curr := lst; 
    L#curr := $phys_ptr_cast(P#lst, ^s_node);
    // assert sll_lseg(curr, curr); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
    // assume sll_lseg(curr, curr); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
    // assert sll_lseg(cp, cp); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#cp, ^s_node), $phys_ptr_cast(L#cp, ^s_node));
    // assume sll_lseg(cp, cp); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#cp, ^s_node), $phys_ptr_cast(L#cp, ^s_node));
    // assert sll_lseg(lst, lst); 
    assert F#sll_lseg($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(P#lst, ^s_node));
    // assume sll_lseg(lst, lst); 
    assume F#sll_lseg($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(P#lst, ^s_node));
    // cp := (struct s_node*)@null; 
    L#cp := $phys_ptr_cast($null, ^s_node);
    // assert sll_lseg(curr, curr); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
    // assume sll_lseg(curr, curr); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
    // assert sll_lseg(cp, cp); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#cp, ^s_node), $phys_ptr_cast(L#cp, ^s_node));
    // assume sll_lseg(cp, cp); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#cp, ^s_node), $phys_ptr_cast(L#cp, ^s_node));
    // assert sll_lseg(lst, lst); 
    assert F#sll_lseg($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(P#lst, ^s_node));
    // assume sll_lseg(lst, lst); 
    assume F#sll_lseg($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(P#lst, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(cp), ==(sll_keys(cp), @_vcc_intset_union(sll_keys(*((cp->next))), @_vcc_intset_singleton(*((cp->key)))))); 
    assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#cp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#cp, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(cp), ==(sll(cp), &&(sll(*((cp->next))), unchecked!(@_vcc_oset_in(cp, sll_reach(*((cp->next)))))))); 
    assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#cp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(cp), ==(sll_reach(cp), @_vcc_oset_union_one2(sll_reach(*((cp->next))), cp))); 
    assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#cp, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node)), $phys_ptr_cast(L#cp, ^s_node));
    loopState#0 := $s;
    assume true;
    while (true)
      invariant F#sll($s, $phys_ptr_cast(P#lst, ^s_node));
      invariant F#sll_lseg($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
      invariant F#sll($s, $phys_ptr_cast(L#curr, ^s_node));
      invariant $oset_disjoint(F#sll_lseg_reach($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)), F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)));
      invariant F#sll($s, $phys_ptr_cast(L#cp, ^s_node));
      invariant $oset_disjoint(F#sll_lseg_reach($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)), F#sll_reach($s, $phys_ptr_cast(L#cp, ^s_node)));
      invariant $oset_disjoint(F#sll_reach($s, $phys_ptr_cast(L#cp, ^s_node)), F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)));
      invariant $oset_disjoint(F#sll_reach($s, $phys_ptr_cast(L#cp, ^s_node)), F#sll_reach($s, $phys_ptr_cast(P#lst, ^s_node)));
      invariant $oset_subset(F#sll_reach($s, $phys_ptr_cast(P#lst, ^s_node)), SL#ALL_REACH);
      invariant $oset_subset(F#sll_reach($s, $phys_ptr_cast(L#cp, ^s_node)), SL#ALL_REACH);
      invariant $oset_subset(F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)), SL#ALL_REACH);
      invariant $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^s_node));
      invariant $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(L#curr, ^s_node));
      invariant $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#cp, ^s_node));
      invariant $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(L#cp, ^s_node));
    {
      anon3:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#0, $s);
        assume $full_stop_ext(#tok$3^14.3, $s);
        // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
        assume $meta_eq(loopState#0, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(curr)) ...
        if ($non_null($phys_ptr_cast(L#curr, ^s_node)))
        {
          anon1:
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(cp), ==(sll_keys(cp), @_vcc_intset_union(sll_keys(*((cp->next))), @_vcc_intset_singleton(*((cp->key)))))); 
            assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#cp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#cp, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(cp), ==(sll(cp), &&(sll(*((cp->next))), unchecked!(@_vcc_oset_in(cp, sll_reach(*((cp->next)))))))); 
            assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#cp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(cp), ==(sll_reach(cp), @_vcc_oset_union_one2(sll_reach(*((cp->next))), cp))); 
            assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#cp, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node)), $phys_ptr_cast(L#cp, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(sll_keys(lst), @_vcc_intset_union(sll_keys(*((lst->next))), @_vcc_intset_singleton(*((lst->key)))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#lst, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#lst, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(sll(lst), &&(sll(*((lst->next))), unchecked!(@_vcc_oset_in(lst, sll_reach(*((lst->next)))))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#lst, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#lst, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(sll_reach(lst), @_vcc_oset_union_one2(sll_reach(*((lst->next))), lst))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#lst, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node)), $phys_ptr_cast(P#lst, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(lst), @_vcc_ptr_neq_pure(lst, curr)), ==(sll_lseg(lst, curr), &&(sll_lseg(*((lst->next)), curr), unchecked!(@_vcc_oset_in(lst, sll_lseg_reach(*((lst->next)), curr)))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) && $phys_ptr_cast(P#lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(P#lst, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(lst), @_vcc_ptr_neq_pure(lst, curr)), ==(sll_lseg_reach(lst, curr), @_vcc_oset_union_one2(sll_lseg_reach(*((lst->next)), curr), lst))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) && $phys_ptr_cast(P#lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $phys_ptr_cast(P#lst, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(lst), @_vcc_ptr_neq_pure(lst, curr)), ==(sll_lseg_keys(lst, curr), @_vcc_intset_union(sll_lseg_keys(*((lst->next)), curr), @_vcc_intset_singleton(*((lst->key)))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) && $phys_ptr_cast(P#lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#lst, ^s_node))));
            // struct s_node* old_cp; 
            // old_cp := cp; 
            L#old_cp := $phys_ptr_cast(L#cp, ^s_node);
            // assert sll_lseg(old_cp, old_cp); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#old_cp, ^s_node), $phys_ptr_cast(L#old_cp, ^s_node));
            // assume sll_lseg(old_cp, old_cp); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#old_cp, ^s_node), $phys_ptr_cast(L#old_cp, ^s_node));
            // assert sll_lseg(curr, curr); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume sll_lseg(curr, curr); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assert sll_lseg(cp, cp); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#cp, ^s_node), $phys_ptr_cast(L#cp, ^s_node));
            // assume sll_lseg(cp, cp); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#cp, ^s_node), $phys_ptr_cast(L#cp, ^s_node));
            // assert sll_lseg(lst, lst); 
            assert F#sll_lseg($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(P#lst, ^s_node));
            // assume sll_lseg(lst, lst); 
            assume F#sll_lseg($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(P#lst, ^s_node));
            // _math \state _dryad_S0; 
            // _dryad_S0 := @_vcc_current_state(@state); 
            SL#_dryad_S0 := $current_state($s);
            // _math \state stmtexpr0#2; 
            // stmtexpr0#2 := _dryad_S0; 
            stmtexpr0#2 := SL#_dryad_S0;
            // cp := _vcc_alloc(@_vcc_typeof((struct s_node*)@null)); 
            call L#cp := $alloc(^s_node);
            assume $full_stop_ext(#tok$3^33.10, $s);
            // assume !(@_vcc_oset_in(cp, @_vcc_oset_union(_dryad_G0, _dryad_G1))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), $oset_union(SL#_dryad_G0, SL#_dryad_G1));
            // _dryad_G1 := @_vcc_oset_union(_dryad_G0, @_vcc_oset_singleton(cp)); 
            SL#_dryad_G1 := $oset_union(SL#_dryad_G0, $oset_singleton($phys_ptr_cast(L#cp, ^s_node)));
            // _math \oset stmtexpr1#3; 
            // stmtexpr1#3 := _dryad_G1; 
            stmtexpr1#3 := SL#_dryad_G1;
            // assume ==(glob_reach(), _dryad_G1); 
            assume F#glob_reach() == SL#_dryad_G1;
            // _math \state _dryad_S1; 
            // _dryad_S1 := @_vcc_current_state(@state); 
            SL#_dryad_S1 := $current_state($s);
            // _math \state stmtexpr2#4; 
            // stmtexpr2#4 := _dryad_S1; 
            stmtexpr2#4 := SL#_dryad_S1;
            // assume ==>(@_vcc_ptr_neq_null(old_cp), ==(sll_keys(old_cp), @_vcc_intset_union(sll_keys(*((old_cp->next))), @_vcc_intset_singleton(*((old_cp->key)))))); 
            assume $non_null($phys_ptr_cast(L#old_cp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#old_cp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#old_cp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#old_cp, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(old_cp), ==(sll(old_cp), &&(sll(*((old_cp->next))), unchecked!(@_vcc_oset_in(old_cp, sll_reach(*((old_cp->next)))))))); 
            assume $non_null($phys_ptr_cast(L#old_cp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#old_cp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#old_cp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#old_cp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#old_cp, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(old_cp), ==(sll_reach(old_cp), @_vcc_oset_union_one2(sll_reach(*((old_cp->next))), old_cp))); 
            assume $non_null($phys_ptr_cast(L#old_cp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#old_cp, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#old_cp, ^s_node), ^s_node)), $phys_ptr_cast(L#old_cp, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(cp), ==(sll_keys(cp), @_vcc_intset_union(sll_keys(*((cp->next))), @_vcc_intset_singleton(*((cp->key)))))); 
            assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#cp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#cp, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(cp), ==(sll(cp), &&(sll(*((cp->next))), unchecked!(@_vcc_oset_in(cp, sll_reach(*((cp->next)))))))); 
            assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#cp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(cp), ==(sll_reach(cp), @_vcc_oset_union_one2(sll_reach(*((cp->next))), cp))); 
            assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#cp, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node)), $phys_ptr_cast(L#cp, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(sll_keys(lst), @_vcc_intset_union(sll_keys(*((lst->next))), @_vcc_intset_singleton(*((lst->key)))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#lst, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#lst, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(sll(lst), &&(sll(*((lst->next))), unchecked!(@_vcc_oset_in(lst, sll_reach(*((lst->next)))))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#lst, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#lst, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(sll_reach(lst), @_vcc_oset_union_one2(sll_reach(*((lst->next))), lst))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#lst, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node)), $phys_ptr_cast(P#lst, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(lst), @_vcc_ptr_neq_pure(lst, curr)), ==(sll_lseg(lst, curr), &&(sll_lseg(*((lst->next)), curr), unchecked!(@_vcc_oset_in(lst, sll_lseg_reach(*((lst->next)), curr)))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) && $phys_ptr_cast(P#lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(P#lst, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(lst), @_vcc_ptr_neq_pure(lst, curr)), ==(sll_lseg_reach(lst, curr), @_vcc_oset_union_one2(sll_lseg_reach(*((lst->next)), curr), lst))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) && $phys_ptr_cast(P#lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $phys_ptr_cast(P#lst, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(lst), @_vcc_ptr_neq_pure(lst, curr)), ==(sll_lseg_keys(lst, curr), @_vcc_intset_union(sll_lseg_keys(*((lst->next)), curr), @_vcc_intset_singleton(*((lst->key)))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) && $phys_ptr_cast(P#lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#lst, ^s_node))));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, sll_reach(old_cp)))), ==(old(_dryad_S0, sll_keys(old_cp)), old(_dryad_S1, sll_keys(old_cp)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#old_cp, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#old_cp, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#old_cp, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, sll_reach(old_cp)))), ==(old(_dryad_S0, sll(old_cp)), old(_dryad_S1, sll(old_cp)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#old_cp, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#old_cp, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#old_cp, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, sll_reach(old_cp)))), ==(old(_dryad_S0, sll_reach(old_cp)), old(_dryad_S1, sll_reach(old_cp)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#old_cp, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#old_cp, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#old_cp, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, sll_reach(curr)))), ==(old(_dryad_S0, sll_keys(curr)), old(_dryad_S1, sll_keys(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, sll_reach(curr)))), ==(old(_dryad_S0, sll(curr)), old(_dryad_S1, sll(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, sll_reach(curr)))), ==(old(_dryad_S0, sll_reach(curr)), old(_dryad_S1, sll_reach(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, sll_reach(lst)))), ==(old(_dryad_S0, sll_keys(lst)), old(_dryad_S1, sll_keys(lst)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(P#lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, sll_reach(lst)))), ==(old(_dryad_S0, sll(lst)), old(_dryad_S1, sll(lst)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(P#lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, sll_reach(lst)))), ==(old(_dryad_S0, sll_reach(lst)), old(_dryad_S1, sll_reach(lst)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(P#lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, sll_lseg_reach(lst, curr)))), ==(old(_dryad_S0, sll_lseg(lst, curr)), old(_dryad_S1, sll_lseg(lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, sll_lseg_reach(lst, curr)))), ==(old(_dryad_S0, sll_lseg_reach(lst, curr)), old(_dryad_S1, sll_lseg_reach(lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, sll_lseg_reach(lst, curr)))), ==(old(_dryad_S0, sll_lseg_keys(lst, curr)), old(_dryad_S1, sll_lseg_keys(lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume @_vcc_ptr_neq_null(cp); 
            assume $non_null($phys_ptr_cast(L#cp, ^s_node));
            // assume unchecked!(@_vcc_oset_in(cp, ALL_REACH)); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), SL#ALL_REACH);
            // ALL_REACH := @_vcc_oset_union(ALL_REACH, @_vcc_oset_singleton(cp)); 
            SL#ALL_REACH := $oset_union(SL#ALL_REACH, $oset_singleton($phys_ptr_cast(L#cp, ^s_node)));
            // _math \state _dryad_S2; 
            // _dryad_S2 := @_vcc_current_state(@state); 
            SL#_dryad_S2 := $current_state($s);
            // _math \state stmtexpr3#5; 
            // stmtexpr3#5 := _dryad_S2; 
            stmtexpr3#5 := SL#_dryad_S2;
            // assert @prim_writes_check((cp->next)); 
            assert $writable_prim($s, #wrTime$3^3.3, $dot($phys_ptr_cast(L#cp, ^s_node), s_node.next));
            // *(cp->next) := old_cp; 
            call $write_int(s_node.next, $phys_ptr_cast(L#cp, ^s_node), $ptr_to_int($phys_ptr_cast(L#old_cp, ^s_node)));
            assume $full_stop_ext(#tok$3^37.5, $s);
            // _math \state _dryad_S3; 
            // _dryad_S3 := @_vcc_current_state(@state); 
            SL#_dryad_S3 := $current_state($s);
            // _math \state stmtexpr4#6; 
            // stmtexpr4#6 := _dryad_S3; 
            stmtexpr4#6 := SL#_dryad_S3;
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, sll_reach(old_cp)))), ==(old(_dryad_S2, sll_keys(old_cp)), old(_dryad_S3, sll_keys(old_cp)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#old_cp, ^s_node))) ==> F#sll_keys(SL#_dryad_S2, $phys_ptr_cast(L#old_cp, ^s_node)) == F#sll_keys(SL#_dryad_S3, $phys_ptr_cast(L#old_cp, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, sll_reach(old_cp)))), ==(old(_dryad_S2, sll(old_cp)), old(_dryad_S3, sll(old_cp)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#old_cp, ^s_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(L#old_cp, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(L#old_cp, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, sll_reach(old_cp)))), ==(old(_dryad_S2, sll_reach(old_cp)), old(_dryad_S3, sll_reach(old_cp)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#old_cp, ^s_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#old_cp, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(L#old_cp, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, sll_reach(curr)))), ==(old(_dryad_S2, sll_keys(curr)), old(_dryad_S3, sll_keys(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_keys(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_keys(SL#_dryad_S3, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, sll_reach(curr)))), ==(old(_dryad_S2, sll(curr)), old(_dryad_S3, sll(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, sll_reach(curr)))), ==(old(_dryad_S2, sll_reach(curr)), old(_dryad_S3, sll_reach(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, sll_reach(lst)))), ==(old(_dryad_S2, sll_keys(lst)), old(_dryad_S3, sll_keys(lst)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^s_node))) ==> F#sll_keys(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^s_node)) == F#sll_keys(SL#_dryad_S3, $phys_ptr_cast(P#lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, sll_reach(lst)))), ==(old(_dryad_S2, sll(lst)), old(_dryad_S3, sll(lst)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^s_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(P#lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, sll_reach(lst)))), ==(old(_dryad_S2, sll_reach(lst)), old(_dryad_S3, sll_reach(lst)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^s_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(P#lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, sll_lseg_reach(lst, curr)))), ==(old(_dryad_S2, sll_lseg(lst, curr)), old(_dryad_S3, sll_lseg(lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg(SL#_dryad_S3, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, sll_lseg_reach(lst, curr)))), ==(old(_dryad_S2, sll_lseg_reach(lst, curr)), old(_dryad_S3, sll_lseg_reach(lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S3, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, sll_lseg_reach(lst, curr)))), ==(old(_dryad_S2, sll_lseg_keys(lst, curr)), old(_dryad_S3, sll_lseg_keys(lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S3, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(cp, old_cp)), ==(*((old_cp->key)), old(_dryad_S2, *((old_cp->key))))); 
            assume !($phys_ptr_cast(L#cp, ^s_node) == $phys_ptr_cast(L#old_cp, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#old_cp, ^s_node)) == $rd_inv(SL#_dryad_S2, s_node.key, $phys_ptr_cast(L#old_cp, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(cp, old_cp)), @_vcc_ptr_eq_pure(*((old_cp->next)), old(_dryad_S2, *((old_cp->next))))); 
            assume !($phys_ptr_cast(L#cp, ^s_node) == $phys_ptr_cast(L#old_cp, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#old_cp, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#old_cp, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(cp, curr)), ==(*((curr->key)), old(_dryad_S2, *((curr->key))))); 
            assume !($phys_ptr_cast(L#cp, ^s_node) == $phys_ptr_cast(L#curr, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) == $rd_inv(SL#_dryad_S2, s_node.key, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(cp, curr)), @_vcc_ptr_eq_pure(*((curr->next)), old(_dryad_S2, *((curr->next))))); 
            assume !($phys_ptr_cast(L#cp, ^s_node) == $phys_ptr_cast(L#curr, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(cp, lst)), ==(*((lst->key)), old(_dryad_S2, *((lst->key))))); 
            assume !($phys_ptr_cast(L#cp, ^s_node) == $phys_ptr_cast(P#lst, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#lst, ^s_node)) == $rd_inv(SL#_dryad_S2, s_node.key, $phys_ptr_cast(P#lst, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(cp, lst)), @_vcc_ptr_eq_pure(*((lst->next)), old(_dryad_S2, *((lst->next))))); 
            assume !($phys_ptr_cast(L#cp, ^s_node) == $phys_ptr_cast(P#lst, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(old_cp), ==(sll_keys(old_cp), @_vcc_intset_union(sll_keys(*((old_cp->next))), @_vcc_intset_singleton(*((old_cp->key)))))); 
            assume $non_null($phys_ptr_cast(L#old_cp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#old_cp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#old_cp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#old_cp, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(old_cp), ==(sll(old_cp), &&(sll(*((old_cp->next))), unchecked!(@_vcc_oset_in(old_cp, sll_reach(*((old_cp->next)))))))); 
            assume $non_null($phys_ptr_cast(L#old_cp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#old_cp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#old_cp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#old_cp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#old_cp, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(old_cp), ==(sll_reach(old_cp), @_vcc_oset_union_one2(sll_reach(*((old_cp->next))), old_cp))); 
            assume $non_null($phys_ptr_cast(L#old_cp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#old_cp, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#old_cp, ^s_node), ^s_node)), $phys_ptr_cast(L#old_cp, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(sll_keys(lst), @_vcc_intset_union(sll_keys(*((lst->next))), @_vcc_intset_singleton(*((lst->key)))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#lst, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#lst, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(sll(lst), &&(sll(*((lst->next))), unchecked!(@_vcc_oset_in(lst, sll_reach(*((lst->next)))))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#lst, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#lst, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(sll_reach(lst), @_vcc_oset_union_one2(sll_reach(*((lst->next))), lst))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#lst, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node)), $phys_ptr_cast(P#lst, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(cp), ==(sll_keys(cp), @_vcc_intset_union(sll_keys(*((cp->next))), @_vcc_intset_singleton(*((cp->key)))))); 
            assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#cp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#cp, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(cp), ==(sll(cp), &&(sll(*((cp->next))), unchecked!(@_vcc_oset_in(cp, sll_reach(*((cp->next)))))))); 
            assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#cp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(cp), ==(sll_reach(cp), @_vcc_oset_union_one2(sll_reach(*((cp->next))), cp))); 
            assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#cp, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node)), $phys_ptr_cast(L#cp, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(old_cp), ==(sll_keys(old_cp), @_vcc_intset_union(sll_keys(*((old_cp->next))), @_vcc_intset_singleton(*((old_cp->key)))))); 
            assume $non_null($phys_ptr_cast(L#old_cp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#old_cp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#old_cp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#old_cp, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(old_cp), ==(sll(old_cp), &&(sll(*((old_cp->next))), unchecked!(@_vcc_oset_in(old_cp, sll_reach(*((old_cp->next)))))))); 
            assume $non_null($phys_ptr_cast(L#old_cp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#old_cp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#old_cp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#old_cp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#old_cp, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(old_cp), ==(sll_reach(old_cp), @_vcc_oset_union_one2(sll_reach(*((old_cp->next))), old_cp))); 
            assume $non_null($phys_ptr_cast(L#old_cp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#old_cp, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#old_cp, ^s_node), ^s_node)), $phys_ptr_cast(L#old_cp, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(lst), @_vcc_ptr_neq_pure(lst, curr)), ==(sll_lseg(lst, curr), &&(sll_lseg(*((lst->next)), curr), unchecked!(@_vcc_oset_in(lst, sll_lseg_reach(*((lst->next)), curr)))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) && $phys_ptr_cast(P#lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(P#lst, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(lst), @_vcc_ptr_neq_pure(lst, curr)), ==(sll_lseg_reach(lst, curr), @_vcc_oset_union_one2(sll_lseg_reach(*((lst->next)), curr), lst))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) && $phys_ptr_cast(P#lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $phys_ptr_cast(P#lst, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(lst), @_vcc_ptr_neq_pure(lst, curr)), ==(sll_lseg_keys(lst, curr), @_vcc_intset_union(sll_lseg_keys(*((lst->next)), curr), @_vcc_intset_singleton(*((lst->key)))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) && $phys_ptr_cast(P#lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#lst, ^s_node))));
            // struct s_node* curr1; 
            // curr1 := curr; 
            SL#curr1 := $phys_ptr_cast(L#curr, ^s_node);
            // struct s_node* stmtexpr5#7; 
            // stmtexpr5#7 := curr1; 
            stmtexpr5#7 := $phys_ptr_cast(SL#curr1, ^s_node);
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
            // assume ==>(&&(@_vcc_ptr_neq_null(lst), @_vcc_ptr_neq_pure(lst, curr)), ==(sll_lseg(lst, curr), &&(sll_lseg(*((lst->next)), curr), unchecked!(@_vcc_oset_in(lst, sll_lseg_reach(*((lst->next)), curr)))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) && $phys_ptr_cast(P#lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(P#lst, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(lst), @_vcc_ptr_neq_pure(lst, curr)), ==(sll_lseg_reach(lst, curr), @_vcc_oset_union_one2(sll_lseg_reach(*((lst->next)), curr), lst))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) && $phys_ptr_cast(P#lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $phys_ptr_cast(P#lst, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(lst), @_vcc_ptr_neq_pure(lst, curr)), ==(sll_lseg_keys(lst, curr), @_vcc_intset_union(sll_lseg_keys(*((lst->next)), curr), @_vcc_intset_singleton(*((lst->key)))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^s_node)) && $phys_ptr_cast(P#lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#lst, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), &&(@_vcc_mutable(@state, curr), @writes_check(curr))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^s_node)) && $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(cp), &&(@_vcc_mutable(@state, cp), @writes_check(cp))); 
            assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#cp, ^s_node)) && $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(L#cp, ^s_node));
        }
        else
        {
          anon2:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // goto #break_1; 
            goto #break_1;
        }

      #continue_1:
        assume true;
    }

  anon5:
    assume $full_stop_ext(#tok$3^14.3, $s);

  #break_1:
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
    assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
    assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
    assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(cp), ==(sll_keys(cp), @_vcc_intset_union(sll_keys(*((cp->next))), @_vcc_intset_singleton(*((cp->key)))))); 
    assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#cp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#cp, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(cp), ==(sll(cp), &&(sll(*((cp->next))), unchecked!(@_vcc_oset_in(cp, sll_reach(*((cp->next)))))))); 
    assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#cp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#cp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(cp), ==(sll_reach(cp), @_vcc_oset_union_one2(sll_reach(*((cp->next))), cp))); 
    assume $non_null($phys_ptr_cast(L#cp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#cp, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#cp, ^s_node), ^s_node)), $phys_ptr_cast(L#cp, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(lst), ==(sll_keys(lst), @_vcc_intset_union(sll_keys(*((lst->next))), @_vcc_intset_singleton(*((lst->key)))))); 
    assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#lst, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#lst, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(lst), ==(sll(lst), &&(sll(*((lst->next))), unchecked!(@_vcc_oset_in(lst, sll_reach(*((lst->next)))))))); 
    assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#lst, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#lst, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(lst), ==(sll_reach(lst), @_vcc_oset_union_one2(sll_reach(*((lst->next))), lst))); 
    assume $non_null($phys_ptr_cast(P#lst, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#lst, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#lst, ^s_node), ^s_node)), $phys_ptr_cast(P#lst, ^s_node));
    // return cp; 
    $result := $phys_ptr_cast(L#cp, ^s_node);
    assume true;
    assert $position_marker();
    goto #exit;

  anon6:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$3^37.5: $token;

const unique #tok$3^33.10: $token;

const unique #tok$3^14.3: $token;

const unique #tok$3^10.29: $token;

const unique #tok$4^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(4, #file^?3Cno?20file?3E);

const unique #tok$3^3.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cgrass?5Csl?5Csl_copy.c: $token;

axiom $file_name_is(3, #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cgrass?5Csl?5Csl_copy.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cgrass?5Csl?5Cdryad_sl.h: $token;

axiom $file_name_is(2, #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cgrass?5Csl?5Cdryad_sl.h);

const unique #file^Z?3A?5CInvariantSynthesis?5CDownloads?5CVCDryad?2Dbin?5CHeaders?5Cvccp.h: $token;

axiom $file_name_is(1, #file^Z?3A?5CInvariantSynthesis?5CDownloads?5CVCDryad?2Dbin?5CHeaders?5Cvccp.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^s_node);
