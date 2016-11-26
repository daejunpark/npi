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

const unique ^$#dl_copy.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#dl_copy.c..36263#3);

type $#dl_copy.c..36263#3;

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



procedure dl_copy(P#lst: $ptr) returns ($result: $ptr);
  requires F#dll($s, $phys_ptr_cast(P#lst, ^d_node));
  modifies $s, $cev_pc;
  ensures F#dll($s, $phys_ptr_cast(P#lst, ^d_node));
  ensures F#dll($s, $phys_ptr_cast($result, ^d_node));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation dl_copy(P#lst: $ptr) returns ($result: $ptr)
{
  var stmtexpr5#9: $ptr;
  var SL#curr1: $ptr;
  var stmtexpr1#3: $state;
  var SL#_dryad_S5: $state;
  var stmtexpr0#2: $state;
  var SL#_dryad_S4: $state;
  var stmtexpr4#8: $state;
  var SL#_dryad_S3: $state;
  var stmtexpr3#7: $state;
  var SL#_dryad_S2: $state;
  var stmtexpr2#6: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr1#5: $oset;
  var stmtexpr0#4: $state;
  var SL#_dryad_S0: $state;
  var L#old_cp: $ptr;
  var loopState#0: $state;
  var SL#ALL_REACH: $oset;
  var L#curr: $ptr;
  var L#cp: $ptr;
  var stmtexpr1#11: $oset;
  var stmtexpr0#10: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$3^3.3: int;
  var #stackframe: int;

  anon7:
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
    // _dryad_G0 := dll_reach(lst); 
    call SL#_dryad_G0 := dll_reach($phys_ptr_cast(P#lst, ^d_node));
    assume $full_stop_ext(#tok$4^0.0, $s);
    // _math \oset stmtexpr0#10; 
    // stmtexpr0#10 := _dryad_G0; 
    stmtexpr0#10 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#11; 
    // stmtexpr1#11 := _dryad_G1; 
    stmtexpr1#11 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll(lst), &&(&&(dll(*((lst->next))), ==>(@_vcc_ptr_neq_null(*((lst->next))), @_vcc_ptr_eq_pure(*((*((lst->next))->prev)), lst))), unchecked!(@_vcc_oset_in(lst, dll_reach(*((lst->next)))))))); 
    assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#lst, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll_reach(lst), @_vcc_oset_union(dll_reach(*((lst->next))), @_vcc_oset_singleton(lst)))); 
    assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#lst, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
    // struct d_node* cp; 
    // struct d_node* curr; 
    // _math \oset ALL_REACH; 
    // assume ==>(@_vcc_ptr_neq_null(lst), &&(@_vcc_mutable(@state, lst), @writes_check(lst))); 
    assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> $mutable($s, $phys_ptr_cast(P#lst, ^d_node)) && $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(P#lst, ^d_node));
    // ALL_REACH := dll_reach(lst); 
    call SL#ALL_REACH := dll_reach($phys_ptr_cast(P#lst, ^d_node));
    assume $full_stop_ext(#tok$3^10.29, $s);
    // curr := lst; 
    L#curr := $phys_ptr_cast(P#lst, ^d_node);
    // assert dll_lseg(curr, curr); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assume dll_lseg(curr, curr); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assert dll_lseg(cp, cp); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#cp, ^d_node), $phys_ptr_cast(L#cp, ^d_node));
    // assume dll_lseg(cp, cp); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#cp, ^d_node), $phys_ptr_cast(L#cp, ^d_node));
    // assert dll_lseg(lst, lst); 
    assert F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(P#lst, ^d_node));
    // assume dll_lseg(lst, lst); 
    assume F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(P#lst, ^d_node));
    // cp := (struct d_node*)@null; 
    L#cp := $phys_ptr_cast($null, ^d_node);
    // assert dll_lseg(curr, curr); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assume dll_lseg(curr, curr); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assert dll_lseg(cp, cp); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#cp, ^d_node), $phys_ptr_cast(L#cp, ^d_node));
    // assume dll_lseg(cp, cp); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#cp, ^d_node), $phys_ptr_cast(L#cp, ^d_node));
    // assert dll_lseg(lst, lst); 
    assert F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(P#lst, ^d_node));
    // assume dll_lseg(lst, lst); 
    assume F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(P#lst, ^d_node));
    // assume ==>(@_vcc_ptr_neq_null(cp), ==(dll(cp), &&(&&(dll(*((cp->next))), ==>(@_vcc_ptr_neq_null(*((cp->next))), @_vcc_ptr_eq_pure(*((*((cp->next))->prev)), cp))), unchecked!(@_vcc_oset_in(cp, dll_reach(*((cp->next)))))))); 
    assume $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#cp, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#cp, ^d_node)) && !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(cp), ==(dll_reach(cp), @_vcc_oset_union(dll_reach(*((cp->next))), @_vcc_oset_singleton(cp)))); 
    assume $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#cp, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#cp, ^d_node)));
    loopState#0 := $s;
    assume true;
    while (true)
      invariant F#dll($s, $phys_ptr_cast(P#lst, ^d_node));
      invariant F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
      invariant F#dll($s, $phys_ptr_cast(L#curr, ^d_node));
      invariant $oset_disjoint(F#dll_lseg_reach($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)), F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)));
      invariant F#dll($s, $phys_ptr_cast(L#cp, ^d_node));
      invariant $oset_disjoint(F#dll_lseg_reach($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)), F#dll_reach($s, $phys_ptr_cast(L#cp, ^d_node)));
      invariant $oset_disjoint(F#dll_reach($s, $phys_ptr_cast(L#cp, ^d_node)), F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)));
      invariant $oset_disjoint(F#dll_reach($s, $phys_ptr_cast(L#cp, ^d_node)), F#dll_reach($s, $phys_ptr_cast(P#lst, ^d_node)));
      invariant $oset_subset(F#dll_reach($s, $phys_ptr_cast(P#lst, ^d_node)), SL#ALL_REACH);
      invariant $oset_subset(F#dll_reach($s, $phys_ptr_cast(L#cp, ^d_node)), SL#ALL_REACH);
      invariant $oset_subset(F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)), SL#ALL_REACH);
      invariant $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^d_node));
      invariant $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(L#curr, ^d_node));
      invariant $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> $mutable($s, $phys_ptr_cast(L#cp, ^d_node));
      invariant $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(L#cp, ^d_node));
    {
      anon6:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#0, $s);
        assume $full_stop_ext(#tok$3^14.3, $s);
        // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
        assume $meta_eq(loopState#0, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(curr)) ...
        if ($non_null($phys_ptr_cast(L#curr, ^d_node)))
        {
          anon3:
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(cp), ==(dll(cp), &&(&&(dll(*((cp->next))), ==>(@_vcc_ptr_neq_null(*((cp->next))), @_vcc_ptr_eq_pure(*((*((cp->next))->prev)), cp))), unchecked!(@_vcc_oset_in(cp, dll_reach(*((cp->next)))))))); 
            assume $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#cp, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#cp, ^d_node)) && !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(cp), ==(dll_reach(cp), @_vcc_oset_union(dll_reach(*((cp->next))), @_vcc_oset_singleton(cp)))); 
            assume $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#cp, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#cp, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll(lst), &&(&&(dll(*((lst->next))), ==>(@_vcc_ptr_neq_null(*((lst->next))), @_vcc_ptr_eq_pure(*((*((lst->next))->prev)), lst))), unchecked!(@_vcc_oset_in(lst, dll_reach(*((lst->next)))))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#lst, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll_reach(lst), @_vcc_oset_union(dll_reach(*((lst->next))), @_vcc_oset_singleton(lst)))); 
            assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#lst, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_pure(lst, curr), ==(dll_lseg(lst, curr), &&(dll_lseg(*((lst->next)), curr), unchecked!(@_vcc_oset_in(lst, dll_lseg_reach(*((lst->next)), curr)))))); 
            assume $phys_ptr_cast(P#lst, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_pure(lst, curr), ==(dll_lseg_reach(lst, curr), @_vcc_oset_union(dll_lseg_reach(*((lst->next)), curr), @_vcc_oset_singleton(lst)))); 
            assume $phys_ptr_cast(P#lst, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
            // struct d_node* old_cp; 
            // old_cp := cp; 
            L#old_cp := $phys_ptr_cast(L#cp, ^d_node);
            // assert dll_lseg(old_cp, old_cp); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#old_cp, ^d_node), $phys_ptr_cast(L#old_cp, ^d_node));
            // assume dll_lseg(old_cp, old_cp); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#old_cp, ^d_node), $phys_ptr_cast(L#old_cp, ^d_node));
            // assert dll_lseg(curr, curr); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assume dll_lseg(curr, curr); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assert dll_lseg(cp, cp); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#cp, ^d_node), $phys_ptr_cast(L#cp, ^d_node));
            // assume dll_lseg(cp, cp); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#cp, ^d_node), $phys_ptr_cast(L#cp, ^d_node));
            // assert dll_lseg(lst, lst); 
            assert F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(P#lst, ^d_node));
            // assume dll_lseg(lst, lst); 
            assume F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(P#lst, ^d_node));
            // _math \state _dryad_S0; 
            // _dryad_S0 := @_vcc_current_state(@state); 
            SL#_dryad_S0 := $current_state($s);
            // _math \state stmtexpr0#4; 
            // stmtexpr0#4 := _dryad_S0; 
            stmtexpr0#4 := SL#_dryad_S0;
            // cp := _vcc_alloc(@_vcc_typeof((struct d_node*)@null)); 
            call L#cp := $alloc(^d_node);
            assume $full_stop_ext(#tok$3^33.10, $s);
            // assume !(@_vcc_oset_in(cp, @_vcc_oset_union(_dryad_G0, _dryad_G1))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), $oset_union(SL#_dryad_G0, SL#_dryad_G1));
            // _dryad_G1 := @_vcc_oset_union(_dryad_G0, @_vcc_oset_singleton(cp)); 
            SL#_dryad_G1 := $oset_union(SL#_dryad_G0, $oset_singleton($phys_ptr_cast(L#cp, ^d_node)));
            // _math \oset stmtexpr1#5; 
            // stmtexpr1#5 := _dryad_G1; 
            stmtexpr1#5 := SL#_dryad_G1;
            // assume ==(glob_reach(), _dryad_G1); 
            assume F#glob_reach() == SL#_dryad_G1;
            // _math \state _dryad_S1; 
            // _dryad_S1 := @_vcc_current_state(@state); 
            SL#_dryad_S1 := $current_state($s);
            // _math \state stmtexpr2#6; 
            // stmtexpr2#6 := _dryad_S1; 
            stmtexpr2#6 := SL#_dryad_S1;
            // assume ==>(@_vcc_ptr_neq_null(old_cp), ==(dll(old_cp), &&(&&(dll(*((old_cp->next))), ==>(@_vcc_ptr_neq_null(*((old_cp->next))), @_vcc_ptr_eq_pure(*((*((old_cp->next))->prev)), old_cp))), unchecked!(@_vcc_oset_in(old_cp, dll_reach(*((old_cp->next)))))))); 
            assume $non_null($phys_ptr_cast(L#old_cp, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_cp, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_cp, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_cp, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(old_cp), ==(dll_reach(old_cp), @_vcc_oset_union(dll_reach(*((old_cp->next))), @_vcc_oset_singleton(old_cp)))); 
            assume $non_null($phys_ptr_cast(L#old_cp, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_cp, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_cp, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(cp), ==(dll(cp), &&(&&(dll(*((cp->next))), ==>(@_vcc_ptr_neq_null(*((cp->next))), @_vcc_ptr_eq_pure(*((*((cp->next))->prev)), cp))), unchecked!(@_vcc_oset_in(cp, dll_reach(*((cp->next)))))))); 
            assume $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#cp, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#cp, ^d_node)) && !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(cp), ==(dll_reach(cp), @_vcc_oset_union(dll_reach(*((cp->next))), @_vcc_oset_singleton(cp)))); 
            assume $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#cp, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#cp, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll(lst), &&(&&(dll(*((lst->next))), ==>(@_vcc_ptr_neq_null(*((lst->next))), @_vcc_ptr_eq_pure(*((*((lst->next))->prev)), lst))), unchecked!(@_vcc_oset_in(lst, dll_reach(*((lst->next)))))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#lst, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll_reach(lst), @_vcc_oset_union(dll_reach(*((lst->next))), @_vcc_oset_singleton(lst)))); 
            assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#lst, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_pure(lst, curr), ==(dll_lseg(lst, curr), &&(dll_lseg(*((lst->next)), curr), unchecked!(@_vcc_oset_in(lst, dll_lseg_reach(*((lst->next)), curr)))))); 
            assume $phys_ptr_cast(P#lst, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_pure(lst, curr), ==(dll_lseg_reach(lst, curr), @_vcc_oset_union(dll_lseg_reach(*((lst->next)), curr), @_vcc_oset_singleton(lst)))); 
            assume $phys_ptr_cast(P#lst, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, dll_reach(old_cp)))), ==(old(_dryad_S0, dll(old_cp)), old(_dryad_S1, dll(old_cp)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#old_cp, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(L#old_cp, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(L#old_cp, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, dll_reach(old_cp)))), ==(old(_dryad_S0, dll_reach(old_cp)), old(_dryad_S1, dll_reach(old_cp)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#old_cp, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#old_cp, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(L#old_cp, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, dll_reach(curr)))), ==(old(_dryad_S0, dll(curr)), old(_dryad_S1, dll(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, dll_reach(curr)))), ==(old(_dryad_S0, dll_reach(curr)), old(_dryad_S1, dll_reach(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, dll_reach(lst)))), ==(old(_dryad_S0, dll(lst)), old(_dryad_S1, dll(lst)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(P#lst, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, dll_reach(lst)))), ==(old(_dryad_S0, dll_reach(lst)), old(_dryad_S1, dll_reach(lst)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(P#lst, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, dll_lseg_reach(lst, curr)))), ==(old(_dryad_S0, dll_lseg(lst, curr)), old(_dryad_S1, dll_lseg(lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_lseg(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == F#dll_lseg(SL#_dryad_S1, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S0, dll_lseg_reach(lst, curr)))), ==(old(_dryad_S0, dll_lseg_reach(lst, curr)), old(_dryad_S1, dll_lseg_reach(lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == F#dll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assume @_vcc_ptr_neq_null(cp); 
            assume $non_null($phys_ptr_cast(L#cp, ^d_node));
            // assume unchecked!(@_vcc_oset_in(cp, ALL_REACH)); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), SL#ALL_REACH);
            // ALL_REACH := @_vcc_oset_union(ALL_REACH, @_vcc_oset_singleton(cp)); 
            SL#ALL_REACH := $oset_union(SL#ALL_REACH, $oset_singleton($phys_ptr_cast(L#cp, ^d_node)));
            // _math \state _dryad_S2; 
            // _dryad_S2 := @_vcc_current_state(@state); 
            SL#_dryad_S2 := $current_state($s);
            // _math \state stmtexpr3#7; 
            // stmtexpr3#7 := _dryad_S2; 
            stmtexpr3#7 := SL#_dryad_S2;
            // assert @prim_writes_check((cp->next)); 
            assert $writable_prim($s, #wrTime$3^3.3, $dot($phys_ptr_cast(L#cp, ^d_node), d_node.next));
            // *(cp->next) := old_cp; 
            call $write_int(d_node.next, $phys_ptr_cast(L#cp, ^d_node), $ptr_to_int($phys_ptr_cast(L#old_cp, ^d_node)));
            assume $full_stop_ext(#tok$3^37.5, $s);
            // _math \state _dryad_S3; 
            // _dryad_S3 := @_vcc_current_state(@state); 
            SL#_dryad_S3 := $current_state($s);
            // _math \state stmtexpr4#8; 
            // stmtexpr4#8 := _dryad_S3; 
            stmtexpr4#8 := SL#_dryad_S3;
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, dll_reach(*((cp->prev)))))), ==(old(_dryad_S2, dll(*((cp->prev)))), old(_dryad_S3, dll(*((cp->prev)))))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(L#cp, ^d_node), ^d_node))) ==> F#dll(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) == F#dll(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, d_node.prev, $phys_ptr_cast(L#cp, ^d_node), ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, dll_reach(*((cp->prev)))))), ==(old(_dryad_S2, dll_reach(*((cp->prev)))), old(_dryad_S3, dll_reach(*((cp->prev)))))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(L#cp, ^d_node), ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) == F#dll_reach(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, d_node.prev, $phys_ptr_cast(L#cp, ^d_node), ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, dll_reach(old_cp)))), ==(old(_dryad_S2, dll(old_cp)), old(_dryad_S3, dll(old_cp)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#old_cp, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(L#old_cp, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(L#old_cp, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, dll_reach(old_cp)))), ==(old(_dryad_S2, dll_reach(old_cp)), old(_dryad_S3, dll_reach(old_cp)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#old_cp, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#old_cp, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(L#old_cp, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, dll_reach(curr)))), ==(old(_dryad_S2, dll(curr)), old(_dryad_S3, dll(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, dll_reach(curr)))), ==(old(_dryad_S2, dll_reach(curr)), old(_dryad_S3, dll_reach(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, dll_reach(lst)))), ==(old(_dryad_S2, dll(lst)), old(_dryad_S3, dll(lst)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(P#lst, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, dll_reach(lst)))), ==(old(_dryad_S2, dll_reach(lst)), old(_dryad_S3, dll_reach(lst)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(P#lst, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, dll_lseg_reach(lst, curr)))), ==(old(_dryad_S2, dll_lseg(lst, curr)), old(_dryad_S3, dll_lseg(lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_lseg(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == F#dll_lseg(SL#_dryad_S3, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(cp, old(_dryad_S2, dll_lseg_reach(lst, curr)))), ==(old(_dryad_S2, dll_lseg_reach(lst, curr)), old(_dryad_S3, dll_lseg_reach(lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == F#dll_lseg_reach(SL#_dryad_S3, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(cp, old_cp)), @_vcc_ptr_eq_pure(*((old_cp->prev)), old(_dryad_S2, *((old_cp->prev))))); 
            assume !($phys_ptr_cast(L#cp, ^d_node) == $phys_ptr_cast(L#old_cp, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(cp, old_cp)), @_vcc_ptr_eq_pure(*((old_cp->next)), old(_dryad_S2, *((old_cp->next))))); 
            assume !($phys_ptr_cast(L#cp, ^d_node) == $phys_ptr_cast(L#old_cp, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(cp, curr)), @_vcc_ptr_eq_pure(*((curr->prev)), old(_dryad_S2, *((curr->prev))))); 
            assume !($phys_ptr_cast(L#cp, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(cp, curr)), @_vcc_ptr_eq_pure(*((curr->next)), old(_dryad_S2, *((curr->next))))); 
            assume !($phys_ptr_cast(L#cp, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(cp, lst)), @_vcc_ptr_eq_pure(*((lst->prev)), old(_dryad_S2, *((lst->prev))))); 
            assume !($phys_ptr_cast(L#cp, ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(P#lst, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(P#lst, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(cp, lst)), @_vcc_ptr_eq_pure(*((lst->next)), old(_dryad_S2, *((lst->next))))); 
            assume !($phys_ptr_cast(L#cp, ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node);
            // assume ==>(@_vcc_ptr_neq_null(old_cp), ==(dll(old_cp), &&(&&(dll(*((old_cp->next))), ==>(@_vcc_ptr_neq_null(*((old_cp->next))), @_vcc_ptr_eq_pure(*((*((old_cp->next))->prev)), old_cp))), unchecked!(@_vcc_oset_in(old_cp, dll_reach(*((old_cp->next)))))))); 
            assume $non_null($phys_ptr_cast(L#old_cp, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_cp, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_cp, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_cp, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(old_cp), ==(dll_reach(old_cp), @_vcc_oset_union(dll_reach(*((old_cp->next))), @_vcc_oset_singleton(old_cp)))); 
            assume $non_null($phys_ptr_cast(L#old_cp, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_cp, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_cp, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll(lst), &&(&&(dll(*((lst->next))), ==>(@_vcc_ptr_neq_null(*((lst->next))), @_vcc_ptr_eq_pure(*((*((lst->next))->prev)), lst))), unchecked!(@_vcc_oset_in(lst, dll_reach(*((lst->next)))))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#lst, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll_reach(lst), @_vcc_oset_union(dll_reach(*((lst->next))), @_vcc_oset_singleton(lst)))); 
            assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#lst, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(cp), ==(dll(cp), &&(&&(dll(*((cp->next))), ==>(@_vcc_ptr_neq_null(*((cp->next))), @_vcc_ptr_eq_pure(*((*((cp->next))->prev)), cp))), unchecked!(@_vcc_oset_in(cp, dll_reach(*((cp->next)))))))); 
            assume $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#cp, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#cp, ^d_node)) && !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(cp), ==(dll_reach(cp), @_vcc_oset_union(dll_reach(*((cp->next))), @_vcc_oset_singleton(cp)))); 
            assume $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#cp, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#cp, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(old_cp), ==(dll(old_cp), &&(&&(dll(*((old_cp->next))), ==>(@_vcc_ptr_neq_null(*((old_cp->next))), @_vcc_ptr_eq_pure(*((*((old_cp->next))->prev)), old_cp))), unchecked!(@_vcc_oset_in(old_cp, dll_reach(*((old_cp->next)))))))); 
            assume $non_null($phys_ptr_cast(L#old_cp, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_cp, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_cp, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_cp, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(old_cp), ==(dll_reach(old_cp), @_vcc_oset_union(dll_reach(*((old_cp->next))), @_vcc_oset_singleton(old_cp)))); 
            assume $non_null($phys_ptr_cast(L#old_cp, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_cp, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_cp, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_pure(lst, curr), ==(dll_lseg(lst, curr), &&(dll_lseg(*((lst->next)), curr), unchecked!(@_vcc_oset_in(lst, dll_lseg_reach(*((lst->next)), curr)))))); 
            assume $phys_ptr_cast(P#lst, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_pure(lst, curr), ==(dll_lseg_reach(lst, curr), @_vcc_oset_union(dll_lseg_reach(*((lst->next)), curr), @_vcc_oset_singleton(lst)))); 
            assume $phys_ptr_cast(P#lst, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
            assume true;
            // if (@_vcc_ptr_neq_null(old_cp)) ...
            if ($non_null($phys_ptr_cast(L#old_cp, ^d_node)))
            {
              anon1:
                // _math \state _dryad_S4; 
                // _dryad_S4 := @_vcc_current_state(@state); 
                SL#_dryad_S4 := $current_state($s);
                // _math \state stmtexpr0#2; 
                // stmtexpr0#2 := _dryad_S4; 
                stmtexpr0#2 := SL#_dryad_S4;
                // assert @prim_writes_check((old_cp->prev)); 
                assert $writable_prim($s, #wrTime$3^3.3, $dot($phys_ptr_cast(L#old_cp, ^d_node), d_node.prev));
                // *(old_cp->prev) := cp; 
                call $write_int(d_node.prev, $phys_ptr_cast(L#old_cp, ^d_node), $ptr_to_int($phys_ptr_cast(L#cp, ^d_node)));
                assume $full_stop_ext(#tok$3^39.7, $s);
                // _math \state _dryad_S5; 
                // _dryad_S5 := @_vcc_current_state(@state); 
                SL#_dryad_S5 := $current_state($s);
                // _math \state stmtexpr1#3; 
                // stmtexpr1#3 := _dryad_S5; 
                stmtexpr1#3 := SL#_dryad_S5;
                // assume ==>(unchecked!(@_vcc_oset_in(old_cp, old(_dryad_S4, dll_reach(*((old_cp->next)))))), ==(old(_dryad_S4, dll(*((old_cp->next)))), old(_dryad_S5, dll(*((old_cp->next)))))); 
                assume !$oset_in($phys_ptr_cast(L#old_cp, ^d_node), F#dll_reach(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node))) ==> F#dll(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node)) == F#dll(SL#_dryad_S5, $rd_phys_ptr(SL#_dryad_S5, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_cp, old(_dryad_S4, dll_reach(*((old_cp->next)))))), ==(old(_dryad_S4, dll_reach(*((old_cp->next)))), old(_dryad_S5, dll_reach(*((old_cp->next)))))); 
                assume !$oset_in($phys_ptr_cast(L#old_cp, ^d_node), F#dll_reach(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node))) ==> F#dll_reach(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node)) == F#dll_reach(SL#_dryad_S5, $rd_phys_ptr(SL#_dryad_S5, d_node.next, $phys_ptr_cast(L#old_cp, ^d_node), ^d_node));
                // assume ==(old(_dryad_S4, dll(old_cp)), old(_dryad_S5, dll(old_cp))); 
                assume F#dll(SL#_dryad_S4, $phys_ptr_cast(L#old_cp, ^d_node)) == F#dll(SL#_dryad_S5, $phys_ptr_cast(L#old_cp, ^d_node));
                // assume ==(old(_dryad_S4, dll_reach(old_cp)), old(_dryad_S5, dll_reach(old_cp))); 
                assume F#dll_reach(SL#_dryad_S4, $phys_ptr_cast(L#old_cp, ^d_node)) == F#dll_reach(SL#_dryad_S5, $phys_ptr_cast(L#old_cp, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_cp, old(_dryad_S4, dll_reach(curr)))), ==(old(_dryad_S4, dll(curr)), old(_dryad_S5, dll(curr)))); 
                assume !$oset_in($phys_ptr_cast(L#old_cp, ^d_node), F#dll_reach(SL#_dryad_S4, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll(SL#_dryad_S4, $phys_ptr_cast(L#curr, ^d_node)) == F#dll(SL#_dryad_S5, $phys_ptr_cast(L#curr, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_cp, old(_dryad_S4, dll_reach(curr)))), ==(old(_dryad_S4, dll_reach(curr)), old(_dryad_S5, dll_reach(curr)))); 
                assume !$oset_in($phys_ptr_cast(L#old_cp, ^d_node), F#dll_reach(SL#_dryad_S4, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_reach(SL#_dryad_S4, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_reach(SL#_dryad_S5, $phys_ptr_cast(L#curr, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_cp, old(_dryad_S4, dll_reach(cp)))), ==(old(_dryad_S4, dll(cp)), old(_dryad_S5, dll(cp)))); 
                assume !$oset_in($phys_ptr_cast(L#old_cp, ^d_node), F#dll_reach(SL#_dryad_S4, $phys_ptr_cast(L#cp, ^d_node))) ==> F#dll(SL#_dryad_S4, $phys_ptr_cast(L#cp, ^d_node)) == F#dll(SL#_dryad_S5, $phys_ptr_cast(L#cp, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_cp, old(_dryad_S4, dll_reach(cp)))), ==(old(_dryad_S4, dll_reach(cp)), old(_dryad_S5, dll_reach(cp)))); 
                assume !$oset_in($phys_ptr_cast(L#old_cp, ^d_node), F#dll_reach(SL#_dryad_S4, $phys_ptr_cast(L#cp, ^d_node))) ==> F#dll_reach(SL#_dryad_S4, $phys_ptr_cast(L#cp, ^d_node)) == F#dll_reach(SL#_dryad_S5, $phys_ptr_cast(L#cp, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_cp, old(_dryad_S4, dll_reach(lst)))), ==(old(_dryad_S4, dll(lst)), old(_dryad_S5, dll(lst)))); 
                assume !$oset_in($phys_ptr_cast(L#old_cp, ^d_node), F#dll_reach(SL#_dryad_S4, $phys_ptr_cast(P#lst, ^d_node))) ==> F#dll(SL#_dryad_S4, $phys_ptr_cast(P#lst, ^d_node)) == F#dll(SL#_dryad_S5, $phys_ptr_cast(P#lst, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_cp, old(_dryad_S4, dll_reach(lst)))), ==(old(_dryad_S4, dll_reach(lst)), old(_dryad_S5, dll_reach(lst)))); 
                assume !$oset_in($phys_ptr_cast(L#old_cp, ^d_node), F#dll_reach(SL#_dryad_S4, $phys_ptr_cast(P#lst, ^d_node))) ==> F#dll_reach(SL#_dryad_S4, $phys_ptr_cast(P#lst, ^d_node)) == F#dll_reach(SL#_dryad_S5, $phys_ptr_cast(P#lst, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_cp, old(_dryad_S4, dll_lseg_reach(lst, curr)))), ==(old(_dryad_S4, dll_lseg(lst, curr)), old(_dryad_S5, dll_lseg(lst, curr)))); 
                assume !$oset_in($phys_ptr_cast(L#old_cp, ^d_node), F#dll_lseg_reach(SL#_dryad_S4, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_lseg(SL#_dryad_S4, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == F#dll_lseg(SL#_dryad_S5, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_cp, old(_dryad_S4, dll_lseg_reach(lst, curr)))), ==(old(_dryad_S4, dll_lseg_reach(lst, curr)), old(_dryad_S5, dll_lseg_reach(lst, curr)))); 
                assume !$oset_in($phys_ptr_cast(L#old_cp, ^d_node), F#dll_lseg_reach(SL#_dryad_S4, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_lseg_reach(SL#_dryad_S4, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == F#dll_lseg_reach(SL#_dryad_S5, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(old_cp, curr)), @_vcc_ptr_eq_pure(*((curr->prev)), old(_dryad_S4, *((curr->prev))))); 
                assume !($phys_ptr_cast(L#old_cp, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S4, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(old_cp, curr)), @_vcc_ptr_eq_pure(*((curr->next)), old(_dryad_S4, *((curr->next))))); 
                assume !($phys_ptr_cast(L#old_cp, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S4, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(old_cp, cp)), @_vcc_ptr_eq_pure(*((cp->prev)), old(_dryad_S4, *((cp->prev))))); 
                assume !($phys_ptr_cast(L#old_cp, ^d_node) == $phys_ptr_cast(L#cp, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#cp, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S4, d_node.prev, $phys_ptr_cast(L#cp, ^d_node), ^d_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(old_cp, cp)), @_vcc_ptr_eq_pure(*((cp->next)), old(_dryad_S4, *((cp->next))))); 
                assume !($phys_ptr_cast(L#old_cp, ^d_node) == $phys_ptr_cast(L#cp, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S4, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(old_cp, lst)), @_vcc_ptr_eq_pure(*((lst->prev)), old(_dryad_S4, *((lst->prev))))); 
                assume !($phys_ptr_cast(L#old_cp, ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(P#lst, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S4, d_node.prev, $phys_ptr_cast(P#lst, ^d_node), ^d_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(old_cp, lst)), @_vcc_ptr_eq_pure(*((lst->next)), old(_dryad_S4, *((lst->next))))); 
                assume !($phys_ptr_cast(L#old_cp, ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S4, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node);
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(cp), ==(dll(cp), &&(&&(dll(*((cp->next))), ==>(@_vcc_ptr_neq_null(*((cp->next))), @_vcc_ptr_eq_pure(*((*((cp->next))->prev)), cp))), unchecked!(@_vcc_oset_in(cp, dll_reach(*((cp->next)))))))); 
                assume $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#cp, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#cp, ^d_node)) && !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(cp), ==(dll_reach(cp), @_vcc_oset_union(dll_reach(*((cp->next))), @_vcc_oset_singleton(cp)))); 
                assume $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#cp, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#cp, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll(lst), &&(&&(dll(*((lst->next))), ==>(@_vcc_ptr_neq_null(*((lst->next))), @_vcc_ptr_eq_pure(*((*((lst->next))->prev)), lst))), unchecked!(@_vcc_oset_in(lst, dll_reach(*((lst->next)))))))); 
                assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#lst, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll_reach(lst), @_vcc_oset_union(dll_reach(*((lst->next))), @_vcc_oset_singleton(lst)))); 
                assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#lst, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(cp), ==(dll(cp), &&(&&(dll(*((cp->next))), ==>(@_vcc_ptr_neq_null(*((cp->next))), @_vcc_ptr_eq_pure(*((*((cp->next))->prev)), cp))), unchecked!(@_vcc_oset_in(cp, dll_reach(*((cp->next)))))))); 
                assume $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#cp, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#cp, ^d_node)) && !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(cp), ==(dll_reach(cp), @_vcc_oset_union(dll_reach(*((cp->next))), @_vcc_oset_singleton(cp)))); 
                assume $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#cp, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#cp, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_pure(lst, curr), ==(dll_lseg(lst, curr), &&(dll_lseg(*((lst->next)), curr), unchecked!(@_vcc_oset_in(lst, dll_lseg_reach(*((lst->next)), curr)))))); 
                assume $phys_ptr_cast(P#lst, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node))));
                // assume ==>(@_vcc_ptr_neq_pure(lst, curr), ==(dll_lseg_reach(lst, curr), @_vcc_oset_union(dll_lseg_reach(*((lst->next)), curr), @_vcc_oset_singleton(lst)))); 
                assume $phys_ptr_cast(P#lst, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
            }
            else
            {
              anon2:
                // assert @_vcc_possibly_unreachable; 
                assert {:PossiblyUnreachable true} true;
            }

          anon4:
            // struct d_node* curr1; 
            // curr1 := curr; 
            SL#curr1 := $phys_ptr_cast(L#curr, ^d_node);
            // struct d_node* stmtexpr5#9; 
            // stmtexpr5#9 := curr1; 
            stmtexpr5#9 := $phys_ptr_cast(SL#curr1, ^d_node);
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
            // assume ==>(@_vcc_ptr_neq_pure(lst, curr), ==(dll_lseg(lst, curr), &&(dll_lseg(*((lst->next)), curr), unchecked!(@_vcc_oset_in(lst, dll_lseg_reach(*((lst->next)), curr)))))); 
            assume $phys_ptr_cast(P#lst, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_pure(lst, curr), ==(dll_lseg_reach(lst, curr), @_vcc_oset_union(dll_lseg_reach(*((lst->next)), curr), @_vcc_oset_singleton(lst)))); 
            assume $phys_ptr_cast(P#lst, ^d_node) != $phys_ptr_cast(L#curr, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), $phys_ptr_cast(L#curr, ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), &&(@_vcc_mutable(@state, curr), @writes_check(curr))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^d_node)) && $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(@_vcc_ptr_neq_null(cp), &&(@_vcc_mutable(@state, cp), @writes_check(cp))); 
            assume $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> $mutable($s, $phys_ptr_cast(L#cp, ^d_node)) && $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(L#cp, ^d_node));
        }
        else
        {
          anon5:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // goto #break_1; 
            goto #break_1;
        }

      #continue_1:
        assume true;
    }

  anon8:
    assume $full_stop_ext(#tok$3^14.3, $s);

  #break_1:
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(cp), ==(dll(cp), &&(&&(dll(*((cp->next))), ==>(@_vcc_ptr_neq_null(*((cp->next))), @_vcc_ptr_eq_pure(*((*((cp->next))->prev)), cp))), unchecked!(@_vcc_oset_in(cp, dll_reach(*((cp->next)))))))); 
    assume $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#cp, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#cp, ^d_node)) && !$oset_in($phys_ptr_cast(L#cp, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(cp), ==(dll_reach(cp), @_vcc_oset_union(dll_reach(*((cp->next))), @_vcc_oset_singleton(cp)))); 
    assume $non_null($phys_ptr_cast(L#cp, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#cp, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#cp, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#cp, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll(lst), &&(&&(dll(*((lst->next))), ==>(@_vcc_ptr_neq_null(*((lst->next))), @_vcc_ptr_eq_pure(*((*((lst->next))->prev)), lst))), unchecked!(@_vcc_oset_in(lst, dll_reach(*((lst->next)))))))); 
    assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#lst, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll_reach(lst), @_vcc_oset_union(dll_reach(*((lst->next))), @_vcc_oset_singleton(lst)))); 
    assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#lst, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
    // return cp; 
    $result := $phys_ptr_cast(L#cp, ^d_node);
    assume true;
    assert $position_marker();
    goto #exit;

  anon9:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$3^39.7: $token;

const unique #tok$3^37.5: $token;

const unique #tok$3^33.10: $token;

const unique #tok$3^14.3: $token;

const unique #tok$3^10.29: $token;

const unique #tok$4^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(4, #file^?3Cno?20file?3E);

const unique #tok$3^3.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cgrass?5Cdl?5Cdl_copy.c: $token;

axiom $file_name_is(3, #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cgrass?5Cdl?5Cdl_copy.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cgrass?5Cdl?5Cdryad_dl.h: $token;

axiom $file_name_is(2, #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cgrass?5Cdl?5Cdryad_dl.h);

const unique #file^Z?3A?5CInvariantSynthesis?5CDownloads?5CVCDryad?2Dbin?5CHeaders?5Cvccp.h: $token;

axiom $file_name_is(1, #file^Z?3A?5CInvariantSynthesis?5CDownloads?5CVCDryad?2Dbin?5CHeaders?5Cvccp.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^d_node);
