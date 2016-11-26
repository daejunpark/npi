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

const unique ^$#dl_filter.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#dl_filter.c..36263#3);

type $#dl_filter.c..36263#3;

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



procedure dl_filter(P#x: $ptr) returns ($result: $ptr);
  requires F#dll($s, $phys_ptr_cast(P#x, ^d_node));
  modifies $s, $cev_pc;
  ensures F#dll($s, $phys_ptr_cast($result, ^d_node));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation dl_filter(P#x: $ptr) returns ($result: $ptr)
{
  var stmtexpr1#13: $state;
  var _dryad_S1#4: $state;
  var stmtexpr0#12: $state;
  var _dryad_S0#3: $state;
  var stmtexpr1#11: $state;
  var _dryad_S1#2: $state;
  var stmtexpr0#10: $state;
  var _dryad_S0#1: $state;
  var stmtexpr0#9: $ptr;
  var old_curr1#0: $ptr;
  var stmtexpr1#8: $state;
  var SL#_dryad_S3: $state;
  var stmtexpr0#7: $state;
  var SL#_dryad_S2: $state;
  var stmtexpr2#6: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr1#5: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr0#4: $ptr;
  var SL#old_curr1: $ptr;
  var L#old_curr_next: $ptr;
  var ite#1: bool;
  var stmtexpr0#3: $ptr;
  var SL#curr0: $ptr;
  var L#old_curr: $ptr;
  var L#nondet: int where $in_range_i4(L#nondet);
  var loopState#0: $state;
  var L#prv: $ptr;
  var L#curr: $ptr;
  var L#res: $ptr;
  var stmtexpr1#15: $oset;
  var stmtexpr0#14: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$2^3.3: int;
  var #stackframe: int;

  anon13:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$2^3.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$2^3.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$2^3.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := dll_reach(x); 
    call SL#_dryad_G0 := dll_reach($phys_ptr_cast(P#x, ^d_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _math \oset stmtexpr0#14; 
    // stmtexpr0#14 := _dryad_G0; 
    stmtexpr0#14 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#15; 
    // stmtexpr1#15 := _dryad_G1; 
    stmtexpr1#15 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(x), ==(dll(x), &&(&&(dll(*((x->next))), ==>(@_vcc_ptr_neq_null(*((x->next))), @_vcc_ptr_eq_pure(*((*((x->next))->prev)), x))), unchecked!(@_vcc_oset_in(x, dll_reach(*((x->next)))))))); 
    assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#x, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#x, ^d_node)) && !$oset_in($phys_ptr_cast(P#x, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_reach(x), @_vcc_oset_union(dll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
    assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#x, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#x, ^d_node)));
    // struct d_node* res; 
    // struct d_node* curr; 
    // struct d_node* prv; 
    // assume ==>(@_vcc_ptr_neq_null(x), &&(@_vcc_mutable(@state, x), @writes_check(x))); 
    assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> $mutable($s, $phys_ptr_cast(P#x, ^d_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(P#x, ^d_node));
    // assume ==>(@_vcc_ptr_neq_null(x), @_vcc_is_malloc_root(@state, x)); 
    assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> $is_malloc_root($s, $phys_ptr_cast(P#x, ^d_node));
    // prv := (struct d_node*)@null; 
    L#prv := $phys_ptr_cast($null, ^d_node);
    // assert dll_lseg(prv, prv); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#prv, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
    // assume dll_lseg(prv, prv); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#prv, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
    // assert dll_lseg(curr, curr); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assume dll_lseg(curr, curr); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assert dll_lseg(res, res); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#res, ^d_node));
    // assume dll_lseg(res, res); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#res, ^d_node));
    // assert dll_lseg(x, x); 
    assert F#dll_lseg($s, $phys_ptr_cast(P#x, ^d_node), $phys_ptr_cast(P#x, ^d_node));
    // assume dll_lseg(x, x); 
    assume F#dll_lseg($s, $phys_ptr_cast(P#x, ^d_node), $phys_ptr_cast(P#x, ^d_node));
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll(prv), &&(&&(dll(*((prv->next))), ==>(@_vcc_ptr_neq_null(*((prv->next))), @_vcc_ptr_eq_pure(*((*((prv->next))->prev)), prv))), unchecked!(@_vcc_oset_in(prv, dll_reach(*((prv->next)))))))); 
    assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#prv, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll_reach(prv), @_vcc_oset_union(dll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
    assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#prv, ^d_node)));
    // curr := x; 
    L#curr := $phys_ptr_cast(P#x, ^d_node);
    // assert dll_lseg(prv, prv); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#prv, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
    // assume dll_lseg(prv, prv); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#prv, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
    // assert dll_lseg(curr, curr); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assume dll_lseg(curr, curr); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assert dll_lseg(res, res); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#res, ^d_node));
    // assume dll_lseg(res, res); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#res, ^d_node));
    // assert dll_lseg(x, x); 
    assert F#dll_lseg($s, $phys_ptr_cast(P#x, ^d_node), $phys_ptr_cast(P#x, ^d_node));
    // assume dll_lseg(x, x); 
    assume F#dll_lseg($s, $phys_ptr_cast(P#x, ^d_node), $phys_ptr_cast(P#x, ^d_node));
    // res := x; 
    L#res := $phys_ptr_cast(P#x, ^d_node);
    // assert dll_lseg(prv, prv); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#prv, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
    // assume dll_lseg(prv, prv); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#prv, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
    // assert dll_lseg(curr, curr); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assume dll_lseg(curr, curr); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assert dll_lseg(res, res); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#res, ^d_node));
    // assume dll_lseg(res, res); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#res, ^d_node));
    // assert dll_lseg(x, x); 
    assert F#dll_lseg($s, $phys_ptr_cast(P#x, ^d_node), $phys_ptr_cast(P#x, ^d_node));
    // assume dll_lseg(x, x); 
    assume F#dll_lseg($s, $phys_ptr_cast(P#x, ^d_node), $phys_ptr_cast(P#x, ^d_node));
    loopState#0 := $s;
    assume true;
    while (true)
      invariant F#dll($s, $phys_ptr_cast(L#prv, ^d_node));
      invariant F#dll($s, $phys_ptr_cast(L#res, ^d_node));
      invariant F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
      invariant $oset_disjoint(F#dll_lseg_reach($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)), F#dll_reach($s, $phys_ptr_cast(L#prv, ^d_node)));
      invariant $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node);
      invariant $is_null($phys_ptr_cast(L#prv, ^d_node)) ==> $phys_ptr_cast(L#res, ^d_node) == $phys_ptr_cast(L#curr, ^d_node);
      invariant $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> $mutable($s, $phys_ptr_cast(L#prv, ^d_node));
      invariant $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#prv, ^d_node));
      invariant $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^d_node));
      invariant $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#curr, ^d_node));
      invariant $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $is_malloc_root($s, $phys_ptr_cast(L#curr, ^d_node));
    {
      anon12:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#0, $s);
        assume $full_stop_ext(#tok$2^13.3, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(curr)) ...
        if ($non_null($phys_ptr_cast(L#curr, ^d_node)))
        {
          anon10:
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll(prv), &&(&&(dll(*((prv->next))), ==>(@_vcc_ptr_neq_null(*((prv->next))), @_vcc_ptr_eq_pure(*((*((prv->next))->prev)), prv))), unchecked!(@_vcc_oset_in(prv, dll_reach(*((prv->next)))))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#prv, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll_reach(prv), @_vcc_oset_union(dll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
            assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#prv, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(res), ==(dll(res), &&(&&(dll(*((res->next))), ==>(@_vcc_ptr_neq_null(*((res->next))), @_vcc_ptr_eq_pure(*((*((res->next))->prev)), res))), unchecked!(@_vcc_oset_in(res, dll_reach(*((res->next)))))))); 
            assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#res, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#res, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(res), ==(dll_reach(res), @_vcc_oset_union(dll_reach(*((res->next))), @_vcc_oset_singleton(res)))); 
            assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#res, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(dll(x), &&(&&(dll(*((x->next))), ==>(@_vcc_ptr_neq_null(*((x->next))), @_vcc_ptr_eq_pure(*((*((x->next))->prev)), x))), unchecked!(@_vcc_oset_in(x, dll_reach(*((x->next)))))))); 
            assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#x, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#x, ^d_node)) && !$oset_in($phys_ptr_cast(P#x, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_reach(x), @_vcc_oset_union(dll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
            assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#x, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#x, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg(res, prv), &&(dll_lseg(*((res->next)), prv), unchecked!(@_vcc_oset_in(res, dll_lseg_reach(*((res->next)), prv)))))); 
            assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg_reach(res, prv), @_vcc_oset_union(dll_lseg_reach(*((res->next)), prv), @_vcc_oset_singleton(res)))); 
            assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
            // int32_t nondet; 
            // struct d_node* old_curr; 
            // old_curr := curr; 
            L#old_curr := $phys_ptr_cast(L#curr, ^d_node);
            // assert dll_lseg(old_curr, old_curr); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#old_curr, ^d_node), $phys_ptr_cast(L#old_curr, ^d_node));
            // assume dll_lseg(old_curr, old_curr); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#old_curr, ^d_node), $phys_ptr_cast(L#old_curr, ^d_node));
            // assert dll_lseg(prv, prv); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#prv, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
            // assume dll_lseg(prv, prv); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#prv, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
            // assert dll_lseg(curr, curr); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assume dll_lseg(curr, curr); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assert dll_lseg(res, res); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#res, ^d_node));
            // assume dll_lseg(res, res); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#res, ^d_node));
            // assert dll_lseg(x, x); 
            assert F#dll_lseg($s, $phys_ptr_cast(P#x, ^d_node), $phys_ptr_cast(P#x, ^d_node));
            // assume dll_lseg(x, x); 
            assume F#dll_lseg($s, $phys_ptr_cast(P#x, ^d_node), $phys_ptr_cast(P#x, ^d_node));
            // struct d_node* curr0; 
            // curr0 := curr; 
            SL#curr0 := $phys_ptr_cast(L#curr, ^d_node);
            // struct d_node* stmtexpr0#3; 
            // stmtexpr0#3 := curr0; 
            stmtexpr0#3 := $phys_ptr_cast(SL#curr0, ^d_node);
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
            // assume ==>(@_vcc_ptr_neq_null(curr), &&(@_vcc_mutable(@state, curr), @writes_check(curr))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^d_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(@_vcc_ptr_neq_null(curr), @_vcc_is_malloc_root(@state, curr)); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $is_malloc_root($s, $phys_ptr_cast(L#curr, ^d_node));
            // var int32_t nondet
            // _Bool ite#1; 
            // ite#1 := (_Bool)nondet; 
            ite#1 := $int_to_bool(L#nondet);
            assume true;
            // if (ite#1) ...
            if (ite#1)
            {
              anon7:
                // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll(curr0), &&(&&(dll(*((curr0->next))), ==>(@_vcc_ptr_neq_null(*((curr0->next))), @_vcc_ptr_eq_pure(*((*((curr0->next))->prev)), curr0))), unchecked!(@_vcc_oset_in(curr0, dll_reach(*((curr0->next)))))))); 
                assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll($s, $phys_ptr_cast(SL#curr0, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) && !$oset_in($phys_ptr_cast(SL#curr0, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll_reach(curr0), @_vcc_oset_union(dll_reach(*((curr0->next))), @_vcc_oset_singleton(curr0)))); 
                assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(SL#curr0, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(SL#curr0, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll(old_curr), &&(&&(dll(*((old_curr->next))), ==>(@_vcc_ptr_neq_null(*((old_curr->next))), @_vcc_ptr_eq_pure(*((*((old_curr->next))->prev)), old_curr))), unchecked!(@_vcc_oset_in(old_curr, dll_reach(*((old_curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll_reach(old_curr), @_vcc_oset_union(dll_reach(*((old_curr->next))), @_vcc_oset_singleton(old_curr)))); 
                assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_curr, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll(prv), &&(&&(dll(*((prv->next))), ==>(@_vcc_ptr_neq_null(*((prv->next))), @_vcc_ptr_eq_pure(*((*((prv->next))->prev)), prv))), unchecked!(@_vcc_oset_in(prv, dll_reach(*((prv->next)))))))); 
                assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#prv, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll_reach(prv), @_vcc_oset_union(dll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
                assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#prv, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(res), ==(dll(res), &&(&&(dll(*((res->next))), ==>(@_vcc_ptr_neq_null(*((res->next))), @_vcc_ptr_eq_pure(*((*((res->next))->prev)), res))), unchecked!(@_vcc_oset_in(res, dll_reach(*((res->next)))))))); 
                assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#res, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#res, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(res), ==(dll_reach(res), @_vcc_oset_union(dll_reach(*((res->next))), @_vcc_oset_singleton(res)))); 
                assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#res, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(dll(x), &&(&&(dll(*((x->next))), ==>(@_vcc_ptr_neq_null(*((x->next))), @_vcc_ptr_eq_pure(*((*((x->next))->prev)), x))), unchecked!(@_vcc_oset_in(x, dll_reach(*((x->next)))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#x, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#x, ^d_node)) && !$oset_in($phys_ptr_cast(P#x, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_reach(x), @_vcc_oset_union(dll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
                assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#x, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#x, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg(res, prv), &&(dll_lseg(*((res->next)), prv), unchecked!(@_vcc_oset_in(res, dll_lseg_reach(*((res->next)), prv)))))); 
                assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node))));
                // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg_reach(res, prv), @_vcc_oset_union(dll_lseg_reach(*((res->next)), prv), @_vcc_oset_singleton(res)))); 
                assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
                assume true;
                // if (@_vcc_ptr_neq_null(prv)) ...
                if ($non_null($phys_ptr_cast(L#prv, ^d_node)))
                {
                  anon3:
                    // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll(curr0), &&(&&(dll(*((curr0->next))), ==>(@_vcc_ptr_neq_null(*((curr0->next))), @_vcc_ptr_eq_pure(*((*((curr0->next))->prev)), curr0))), unchecked!(@_vcc_oset_in(curr0, dll_reach(*((curr0->next)))))))); 
                    assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll($s, $phys_ptr_cast(SL#curr0, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) && !$oset_in($phys_ptr_cast(SL#curr0, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll_reach(curr0), @_vcc_oset_union(dll_reach(*((curr0->next))), @_vcc_oset_singleton(curr0)))); 
                    assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(SL#curr0, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(SL#curr0, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll(old_curr), &&(&&(dll(*((old_curr->next))), ==>(@_vcc_ptr_neq_null(*((old_curr->next))), @_vcc_ptr_eq_pure(*((*((old_curr->next))->prev)), old_curr))), unchecked!(@_vcc_oset_in(old_curr, dll_reach(*((old_curr->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll_reach(old_curr), @_vcc_oset_union(dll_reach(*((old_curr->next))), @_vcc_oset_singleton(old_curr)))); 
                    assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_curr, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll(prv), &&(&&(dll(*((prv->next))), ==>(@_vcc_ptr_neq_null(*((prv->next))), @_vcc_ptr_eq_pure(*((*((prv->next))->prev)), prv))), unchecked!(@_vcc_oset_in(prv, dll_reach(*((prv->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#prv, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll_reach(prv), @_vcc_oset_union(dll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
                    assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#prv, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(res), ==(dll(res), &&(&&(dll(*((res->next))), ==>(@_vcc_ptr_neq_null(*((res->next))), @_vcc_ptr_eq_pure(*((*((res->next))->prev)), res))), unchecked!(@_vcc_oset_in(res, dll_reach(*((res->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#res, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#res, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(res), ==(dll_reach(res), @_vcc_oset_union(dll_reach(*((res->next))), @_vcc_oset_singleton(res)))); 
                    assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#res, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(x), ==(dll(x), &&(&&(dll(*((x->next))), ==>(@_vcc_ptr_neq_null(*((x->next))), @_vcc_ptr_eq_pure(*((*((x->next))->prev)), x))), unchecked!(@_vcc_oset_in(x, dll_reach(*((x->next)))))))); 
                    assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#x, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#x, ^d_node)) && !$oset_in($phys_ptr_cast(P#x, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_reach(x), @_vcc_oset_union(dll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
                    assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#x, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#x, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg(res, prv), &&(dll_lseg(*((res->next)), prv), unchecked!(@_vcc_oset_in(res, dll_lseg_reach(*((res->next)), prv)))))); 
                    assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg_reach(res, prv), @_vcc_oset_union(dll_lseg_reach(*((res->next)), prv), @_vcc_oset_singleton(res)))); 
                    assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
                    // struct d_node* old_curr_next; 
                    // struct d_node* old_curr1; 
                    // old_curr1 := old_curr; 
                    SL#old_curr1 := $phys_ptr_cast(L#old_curr, ^d_node);
                    // struct d_node* stmtexpr0#4; 
                    // stmtexpr0#4 := old_curr1; 
                    stmtexpr0#4 := $phys_ptr_cast(SL#old_curr1, ^d_node);
                    // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll(old_curr), &&(&&(dll(*((old_curr->next))), ==>(@_vcc_ptr_neq_null(*((old_curr->next))), @_vcc_ptr_eq_pure(*((*((old_curr->next))->prev)), old_curr))), unchecked!(@_vcc_oset_in(old_curr, dll_reach(*((old_curr->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll_reach(old_curr), @_vcc_oset_union(dll_reach(*((old_curr->next))), @_vcc_oset_singleton(old_curr)))); 
                    assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_curr, ^d_node)));
                    // assert @reads_check_normal((old_curr->next)); 
                    assert $thread_local($s, $phys_ptr_cast(L#old_curr, ^d_node));
                    // old_curr_next := *((old_curr->next)); 
                    L#old_curr_next := $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node);
                    // assume ==>(@_vcc_ptr_neq_null(old_curr_next), ==(dll(old_curr_next), &&(&&(dll(*((old_curr_next->next))), ==>(@_vcc_ptr_neq_null(*((old_curr_next->next))), @_vcc_ptr_eq_pure(*((*((old_curr_next->next))->prev)), old_curr_next))), unchecked!(@_vcc_oset_in(old_curr_next, dll_reach(*((old_curr_next->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#old_curr_next, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_curr_next, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_curr_next, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr_next), ==(dll_reach(old_curr_next), @_vcc_oset_union(dll_reach(*((old_curr_next->next))), @_vcc_oset_singleton(old_curr_next)))); 
                    assume $non_null($phys_ptr_cast(L#old_curr_next, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_curr_next, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_curr_next, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll(old_curr), &&(&&(dll(*((old_curr->next))), ==>(@_vcc_ptr_neq_null(*((old_curr->next))), @_vcc_ptr_eq_pure(*((*((old_curr->next))->prev)), old_curr))), unchecked!(@_vcc_oset_in(old_curr, dll_reach(*((old_curr->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll_reach(old_curr), @_vcc_oset_union(dll_reach(*((old_curr->next))), @_vcc_oset_singleton(old_curr)))); 
                    assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_curr, ^d_node)));
                    // _math \state _dryad_S0; 
                    // _dryad_S0 := @_vcc_current_state(@state); 
                    SL#_dryad_S0 := $current_state($s);
                    // _math \state stmtexpr1#5; 
                    // stmtexpr1#5 := _dryad_S0; 
                    stmtexpr1#5 := SL#_dryad_S0;
                    // assert @prim_writes_check((prv->next)); 
                    assert $writable_prim($s, #wrTime$2^3.3, $dot($phys_ptr_cast(L#prv, ^d_node), d_node.next));
                    // *(prv->next) := old_curr_next; 
                    call $write_int(d_node.next, $phys_ptr_cast(L#prv, ^d_node), $ptr_to_int($phys_ptr_cast(L#old_curr_next, ^d_node)));
                    assume $full_stop_ext(#tok$2^33.9, $s);
                    // _math \state _dryad_S1; 
                    // _dryad_S1 := @_vcc_current_state(@state); 
                    SL#_dryad_S1 := $current_state($s);
                    // _math \state stmtexpr2#6; 
                    // stmtexpr2#6 := _dryad_S1; 
                    stmtexpr2#6 := SL#_dryad_S1;
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(*((prv->prev)))))), ==(old(_dryad_S0, dll(*((prv->prev)))), old(_dryad_S1, dll(*((prv->prev)))))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#prv, ^d_node), ^d_node))) ==> F#dll(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) == F#dll(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, d_node.prev, $phys_ptr_cast(L#prv, ^d_node), ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(*((prv->prev)))))), ==(old(_dryad_S0, dll_reach(*((prv->prev)))), old(_dryad_S1, dll_reach(*((prv->prev)))))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#prv, ^d_node), ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) == F#dll_reach(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, d_node.prev, $phys_ptr_cast(L#prv, ^d_node), ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(old_curr1)))), ==(old(_dryad_S0, dll(old_curr1)), old(_dryad_S1, dll(old_curr1)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#old_curr1, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(SL#old_curr1, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(SL#old_curr1, ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(old_curr1)))), ==(old(_dryad_S0, dll_reach(old_curr1)), old(_dryad_S1, dll_reach(old_curr1)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#old_curr1, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#old_curr1, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(SL#old_curr1, ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(old_curr_next)))), ==(old(_dryad_S0, dll(old_curr_next)), old(_dryad_S1, dll(old_curr_next)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#old_curr_next, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(L#old_curr_next, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(L#old_curr_next, ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(old_curr_next)))), ==(old(_dryad_S0, dll_reach(old_curr_next)), old(_dryad_S1, dll_reach(old_curr_next)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#old_curr_next, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#old_curr_next, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(L#old_curr_next, ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(curr0)))), ==(old(_dryad_S0, dll(curr0)), old(_dryad_S1, dll(curr0)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(SL#curr0, ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(curr0)))), ==(old(_dryad_S0, dll_reach(curr0)), old(_dryad_S1, dll_reach(curr0)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(SL#curr0, ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(old_curr)))), ==(old(_dryad_S0, dll(old_curr)), old(_dryad_S1, dll(old_curr)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#old_curr, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(L#old_curr, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(L#old_curr, ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(old_curr)))), ==(old(_dryad_S0, dll_reach(old_curr)), old(_dryad_S1, dll_reach(old_curr)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#old_curr, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#old_curr, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(L#old_curr, ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(curr)))), ==(old(_dryad_S0, dll(curr)), old(_dryad_S1, dll(curr)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(curr)))), ==(old(_dryad_S0, dll_reach(curr)), old(_dryad_S1, dll_reach(curr)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(res)))), ==(old(_dryad_S0, dll(res)), old(_dryad_S1, dll(res)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#res, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(L#res, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(L#res, ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(res)))), ==(old(_dryad_S0, dll_reach(res)), old(_dryad_S1, dll_reach(res)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#res, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#res, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(L#res, ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(x)))), ==(old(_dryad_S0, dll(x)), old(_dryad_S1, dll(x)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#x, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(P#x, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(P#x, ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_reach(x)))), ==(old(_dryad_S0, dll_reach(x)), old(_dryad_S1, dll_reach(x)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#x, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#x, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(P#x, ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_lseg_reach(res, prv)))), ==(old(_dryad_S0, dll_lseg(res, prv)), old(_dryad_S1, dll_lseg(res, prv)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll_lseg(SL#_dryad_S0, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == F#dll_lseg(SL#_dryad_S1, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, dll_lseg_reach(res, prv)))), ==(old(_dryad_S0, dll_lseg_reach(res, prv)), old(_dryad_S1, dll_lseg_reach(res, prv)))); 
                    assume !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == F#dll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
                    // assume ==>(!(@_vcc_ptr_eq_pure(prv, old_curr1)), @_vcc_ptr_eq_pure(*((old_curr1->prev)), old(_dryad_S0, *((old_curr1->prev))))); 
                    assume !($phys_ptr_cast(L#prv, ^d_node) == $phys_ptr_cast(SL#old_curr1, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prv, old_curr1)), @_vcc_ptr_eq_pure(*((old_curr1->next)), old(_dryad_S0, *((old_curr1->next))))); 
                    assume !($phys_ptr_cast(L#prv, ^d_node) == $phys_ptr_cast(SL#old_curr1, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prv, old_curr_next)), @_vcc_ptr_eq_pure(*((old_curr_next->prev)), old(_dryad_S0, *((old_curr_next->prev))))); 
                    assume !($phys_ptr_cast(L#prv, ^d_node) == $phys_ptr_cast(L#old_curr_next, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prv, old_curr_next)), @_vcc_ptr_eq_pure(*((old_curr_next->next)), old(_dryad_S0, *((old_curr_next->next))))); 
                    assume !($phys_ptr_cast(L#prv, ^d_node) == $phys_ptr_cast(L#old_curr_next, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prv, curr0)), @_vcc_ptr_eq_pure(*((curr0->prev)), old(_dryad_S0, *((curr0->prev))))); 
                    assume !($phys_ptr_cast(L#prv, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prv, curr0)), @_vcc_ptr_eq_pure(*((curr0->next)), old(_dryad_S0, *((curr0->next))))); 
                    assume !($phys_ptr_cast(L#prv, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prv, old_curr)), @_vcc_ptr_eq_pure(*((old_curr->prev)), old(_dryad_S0, *((old_curr->prev))))); 
                    assume !($phys_ptr_cast(L#prv, ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prv, old_curr)), @_vcc_ptr_eq_pure(*((old_curr->next)), old(_dryad_S0, *((old_curr->next))))); 
                    assume !($phys_ptr_cast(L#prv, ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prv, curr)), @_vcc_ptr_eq_pure(*((curr->prev)), old(_dryad_S0, *((curr->prev))))); 
                    assume !($phys_ptr_cast(L#prv, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prv, curr)), @_vcc_ptr_eq_pure(*((curr->next)), old(_dryad_S0, *((curr->next))))); 
                    assume !($phys_ptr_cast(L#prv, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prv, res)), @_vcc_ptr_eq_pure(*((res->prev)), old(_dryad_S0, *((res->prev))))); 
                    assume !($phys_ptr_cast(L#prv, ^d_node) == $phys_ptr_cast(L#res, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prv, res)), @_vcc_ptr_eq_pure(*((res->next)), old(_dryad_S0, *((res->next))))); 
                    assume !($phys_ptr_cast(L#prv, ^d_node) == $phys_ptr_cast(L#res, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prv, x)), @_vcc_ptr_eq_pure(*((x->prev)), old(_dryad_S0, *((x->prev))))); 
                    assume !($phys_ptr_cast(L#prv, ^d_node) == $phys_ptr_cast(P#x, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(P#x, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(P#x, ^d_node), ^d_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prv, x)), @_vcc_ptr_eq_pure(*((x->next)), old(_dryad_S0, *((x->next))))); 
                    assume !($phys_ptr_cast(L#prv, ^d_node) == $phys_ptr_cast(P#x, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node);
                    // assume ==>(@_vcc_ptr_neq_null(old_curr1), ==(dll(old_curr1), &&(&&(dll(*((old_curr1->next))), ==>(@_vcc_ptr_neq_null(*((old_curr1->next))), @_vcc_ptr_eq_pure(*((*((old_curr1->next))->prev)), old_curr1))), unchecked!(@_vcc_oset_in(old_curr1, dll_reach(*((old_curr1->next)))))))); 
                    assume $non_null($phys_ptr_cast(SL#old_curr1, ^d_node)) ==> F#dll($s, $phys_ptr_cast(SL#old_curr1, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SL#old_curr1, ^d_node)) && !$oset_in($phys_ptr_cast(SL#old_curr1, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr1), ==(dll_reach(old_curr1), @_vcc_oset_union(dll_reach(*((old_curr1->next))), @_vcc_oset_singleton(old_curr1)))); 
                    assume $non_null($phys_ptr_cast(SL#old_curr1, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(SL#old_curr1, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(SL#old_curr1, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr_next), ==(dll(old_curr_next), &&(&&(dll(*((old_curr_next->next))), ==>(@_vcc_ptr_neq_null(*((old_curr_next->next))), @_vcc_ptr_eq_pure(*((*((old_curr_next->next))->prev)), old_curr_next))), unchecked!(@_vcc_oset_in(old_curr_next, dll_reach(*((old_curr_next->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#old_curr_next, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_curr_next, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_curr_next, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr_next), ==(dll_reach(old_curr_next), @_vcc_oset_union(dll_reach(*((old_curr_next->next))), @_vcc_oset_singleton(old_curr_next)))); 
                    assume $non_null($phys_ptr_cast(L#old_curr_next, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_curr_next, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_curr_next, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll(curr0), &&(&&(dll(*((curr0->next))), ==>(@_vcc_ptr_neq_null(*((curr0->next))), @_vcc_ptr_eq_pure(*((*((curr0->next))->prev)), curr0))), unchecked!(@_vcc_oset_in(curr0, dll_reach(*((curr0->next)))))))); 
                    assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll($s, $phys_ptr_cast(SL#curr0, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) && !$oset_in($phys_ptr_cast(SL#curr0, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll_reach(curr0), @_vcc_oset_union(dll_reach(*((curr0->next))), @_vcc_oset_singleton(curr0)))); 
                    assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(SL#curr0, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(SL#curr0, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll(old_curr), &&(&&(dll(*((old_curr->next))), ==>(@_vcc_ptr_neq_null(*((old_curr->next))), @_vcc_ptr_eq_pure(*((*((old_curr->next))->prev)), old_curr))), unchecked!(@_vcc_oset_in(old_curr, dll_reach(*((old_curr->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll_reach(old_curr), @_vcc_oset_union(dll_reach(*((old_curr->next))), @_vcc_oset_singleton(old_curr)))); 
                    assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_curr, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(res), ==(dll(res), &&(&&(dll(*((res->next))), ==>(@_vcc_ptr_neq_null(*((res->next))), @_vcc_ptr_eq_pure(*((*((res->next))->prev)), res))), unchecked!(@_vcc_oset_in(res, dll_reach(*((res->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#res, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#res, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(res), ==(dll_reach(res), @_vcc_oset_union(dll_reach(*((res->next))), @_vcc_oset_singleton(res)))); 
                    assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#res, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(x), ==(dll(x), &&(&&(dll(*((x->next))), ==>(@_vcc_ptr_neq_null(*((x->next))), @_vcc_ptr_eq_pure(*((*((x->next))->prev)), x))), unchecked!(@_vcc_oset_in(x, dll_reach(*((x->next)))))))); 
                    assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#x, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#x, ^d_node)) && !$oset_in($phys_ptr_cast(P#x, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_reach(x), @_vcc_oset_union(dll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
                    assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#x, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#x, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll(prv), &&(&&(dll(*((prv->next))), ==>(@_vcc_ptr_neq_null(*((prv->next))), @_vcc_ptr_eq_pure(*((*((prv->next))->prev)), prv))), unchecked!(@_vcc_oset_in(prv, dll_reach(*((prv->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#prv, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll_reach(prv), @_vcc_oset_union(dll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
                    assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#prv, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr_next), ==(dll(old_curr_next), &&(&&(dll(*((old_curr_next->next))), ==>(@_vcc_ptr_neq_null(*((old_curr_next->next))), @_vcc_ptr_eq_pure(*((*((old_curr_next->next))->prev)), old_curr_next))), unchecked!(@_vcc_oset_in(old_curr_next, dll_reach(*((old_curr_next->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#old_curr_next, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_curr_next, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_curr_next, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr_next), ==(dll_reach(old_curr_next), @_vcc_oset_union(dll_reach(*((old_curr_next->next))), @_vcc_oset_singleton(old_curr_next)))); 
                    assume $non_null($phys_ptr_cast(L#old_curr_next, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_curr_next, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_curr_next, ^d_node)));
                    assume true;
                    // if (@_vcc_ptr_neq_null(old_curr_next)) ...
                    if ($non_null($phys_ptr_cast(L#old_curr_next, ^d_node)))
                    {
                      anon1:
                        // _math \state _dryad_S2; 
                        // _dryad_S2 := @_vcc_current_state(@state); 
                        SL#_dryad_S2 := $current_state($s);
                        // _math \state stmtexpr0#7; 
                        // stmtexpr0#7 := _dryad_S2; 
                        stmtexpr0#7 := SL#_dryad_S2;
                        // assert @prim_writes_check((old_curr_next->prev)); 
                        assert $writable_prim($s, #wrTime$2^3.3, $dot($phys_ptr_cast(L#old_curr_next, ^d_node), d_node.prev));
                        // *(old_curr_next->prev) := prv; 
                        call $write_int(d_node.prev, $phys_ptr_cast(L#old_curr_next, ^d_node), $ptr_to_int($phys_ptr_cast(L#prv, ^d_node)));
                        assume $full_stop_ext(#tok$2^35.11, $s);
                        // _math \state _dryad_S3; 
                        // _dryad_S3 := @_vcc_current_state(@state); 
                        SL#_dryad_S3 := $current_state($s);
                        // _math \state stmtexpr1#8; 
                        // stmtexpr1#8 := _dryad_S3; 
                        stmtexpr1#8 := SL#_dryad_S3;
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(*((old_curr_next->next)))))), ==(old(_dryad_S2, dll(*((old_curr_next->next)))), old(_dryad_S3, dll(*((old_curr_next->next)))))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node))) ==> F#dll(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node)) == F#dll(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(*((old_curr_next->next)))))), ==(old(_dryad_S2, dll_reach(*((old_curr_next->next)))), old(_dryad_S3, dll_reach(*((old_curr_next->next)))))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node)) == F#dll_reach(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, d_node.next, $phys_ptr_cast(L#old_curr_next, ^d_node), ^d_node));
                        // assume ==(old(_dryad_S2, dll(old_curr_next)), old(_dryad_S3, dll(old_curr_next))); 
                        assume F#dll(SL#_dryad_S2, $phys_ptr_cast(L#old_curr_next, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(L#old_curr_next, ^d_node));
                        // assume ==(old(_dryad_S2, dll_reach(old_curr_next)), old(_dryad_S3, dll_reach(old_curr_next))); 
                        assume F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#old_curr_next, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(L#old_curr_next, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(old_curr1)))), ==(old(_dryad_S2, dll(old_curr1)), old(_dryad_S3, dll(old_curr1)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#old_curr1, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(SL#old_curr1, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(SL#old_curr1, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(old_curr1)))), ==(old(_dryad_S2, dll_reach(old_curr1)), old(_dryad_S3, dll_reach(old_curr1)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#old_curr1, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#old_curr1, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(SL#old_curr1, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(curr0)))), ==(old(_dryad_S2, dll(curr0)), old(_dryad_S3, dll(curr0)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(SL#curr0, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(curr0)))), ==(old(_dryad_S2, dll_reach(curr0)), old(_dryad_S3, dll_reach(curr0)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(SL#curr0, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(old_curr)))), ==(old(_dryad_S2, dll(old_curr)), old(_dryad_S3, dll(old_curr)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#old_curr, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(L#old_curr, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(L#old_curr, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(old_curr)))), ==(old(_dryad_S2, dll_reach(old_curr)), old(_dryad_S3, dll_reach(old_curr)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#old_curr, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#old_curr, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(L#old_curr, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(prv)))), ==(old(_dryad_S2, dll(prv)), old(_dryad_S3, dll(prv)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(L#prv, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(prv)))), ==(old(_dryad_S2, dll_reach(prv)), old(_dryad_S3, dll_reach(prv)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#prv, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(curr)))), ==(old(_dryad_S2, dll(curr)), old(_dryad_S3, dll(curr)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(L#curr, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(curr)))), ==(old(_dryad_S2, dll_reach(curr)), old(_dryad_S3, dll_reach(curr)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(L#curr, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(res)))), ==(old(_dryad_S2, dll(res)), old(_dryad_S3, dll(res)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#res, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(L#res, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(L#res, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(res)))), ==(old(_dryad_S2, dll_reach(res)), old(_dryad_S3, dll_reach(res)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#res, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#res, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(L#res, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(x)))), ==(old(_dryad_S2, dll(x)), old(_dryad_S3, dll(x)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#x, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(P#x, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(P#x, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_reach(x)))), ==(old(_dryad_S2, dll_reach(x)), old(_dryad_S3, dll_reach(x)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#x, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#x, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(P#x, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_lseg_reach(res, prv)))), ==(old(_dryad_S2, dll_lseg(res, prv)), old(_dryad_S3, dll_lseg(res, prv)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll_lseg(SL#_dryad_S2, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == F#dll_lseg(SL#_dryad_S3, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(old_curr_next, old(_dryad_S2, dll_lseg_reach(res, prv)))), ==(old(_dryad_S2, dll_lseg_reach(res, prv)), old(_dryad_S3, dll_lseg_reach(res, prv)))); 
                        assume !$oset_in($phys_ptr_cast(L#old_curr_next, ^d_node), F#dll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == F#dll_lseg_reach(SL#_dryad_S3, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==>(!(@_vcc_ptr_eq_pure(old_curr_next, old_curr1)), @_vcc_ptr_eq_pure(*((old_curr1->prev)), old(_dryad_S2, *((old_curr1->prev))))); 
                        assume !($phys_ptr_cast(L#old_curr_next, ^d_node) == $phys_ptr_cast(SL#old_curr1, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(old_curr_next, old_curr1)), @_vcc_ptr_eq_pure(*((old_curr1->next)), old(_dryad_S2, *((old_curr1->next))))); 
                        assume !($phys_ptr_cast(L#old_curr_next, ^d_node) == $phys_ptr_cast(SL#old_curr1, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(old_curr_next, curr0)), @_vcc_ptr_eq_pure(*((curr0->prev)), old(_dryad_S2, *((curr0->prev))))); 
                        assume !($phys_ptr_cast(L#old_curr_next, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(old_curr_next, curr0)), @_vcc_ptr_eq_pure(*((curr0->next)), old(_dryad_S2, *((curr0->next))))); 
                        assume !($phys_ptr_cast(L#old_curr_next, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(old_curr_next, old_curr)), @_vcc_ptr_eq_pure(*((old_curr->prev)), old(_dryad_S2, *((old_curr->prev))))); 
                        assume !($phys_ptr_cast(L#old_curr_next, ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(old_curr_next, old_curr)), @_vcc_ptr_eq_pure(*((old_curr->next)), old(_dryad_S2, *((old_curr->next))))); 
                        assume !($phys_ptr_cast(L#old_curr_next, ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(old_curr_next, prv)), @_vcc_ptr_eq_pure(*((prv->prev)), old(_dryad_S2, *((prv->prev))))); 
                        assume !($phys_ptr_cast(L#old_curr_next, ^d_node) == $phys_ptr_cast(L#prv, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#prv, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(L#prv, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(old_curr_next, prv)), @_vcc_ptr_eq_pure(*((prv->next)), old(_dryad_S2, *((prv->next))))); 
                        assume !($phys_ptr_cast(L#old_curr_next, ^d_node) == $phys_ptr_cast(L#prv, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(old_curr_next, curr)), @_vcc_ptr_eq_pure(*((curr->prev)), old(_dryad_S2, *((curr->prev))))); 
                        assume !($phys_ptr_cast(L#old_curr_next, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(old_curr_next, curr)), @_vcc_ptr_eq_pure(*((curr->next)), old(_dryad_S2, *((curr->next))))); 
                        assume !($phys_ptr_cast(L#old_curr_next, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(old_curr_next, res)), @_vcc_ptr_eq_pure(*((res->prev)), old(_dryad_S2, *((res->prev))))); 
                        assume !($phys_ptr_cast(L#old_curr_next, ^d_node) == $phys_ptr_cast(L#res, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(old_curr_next, res)), @_vcc_ptr_eq_pure(*((res->next)), old(_dryad_S2, *((res->next))))); 
                        assume !($phys_ptr_cast(L#old_curr_next, ^d_node) == $phys_ptr_cast(L#res, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(old_curr_next, x)), @_vcc_ptr_eq_pure(*((x->prev)), old(_dryad_S2, *((x->prev))))); 
                        assume !($phys_ptr_cast(L#old_curr_next, ^d_node) == $phys_ptr_cast(P#x, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(P#x, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(P#x, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(old_curr_next, x)), @_vcc_ptr_eq_pure(*((x->next)), old(_dryad_S2, *((x->next))))); 
                        assume !($phys_ptr_cast(L#old_curr_next, ^d_node) == $phys_ptr_cast(P#x, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node);
                        // assume ==>(@_vcc_ptr_neq_null(old_curr1), ==(dll(old_curr1), &&(&&(dll(*((old_curr1->next))), ==>(@_vcc_ptr_neq_null(*((old_curr1->next))), @_vcc_ptr_eq_pure(*((*((old_curr1->next))->prev)), old_curr1))), unchecked!(@_vcc_oset_in(old_curr1, dll_reach(*((old_curr1->next)))))))); 
                        assume $non_null($phys_ptr_cast(SL#old_curr1, ^d_node)) ==> F#dll($s, $phys_ptr_cast(SL#old_curr1, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SL#old_curr1, ^d_node)) && !$oset_in($phys_ptr_cast(SL#old_curr1, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_null(old_curr1), ==(dll_reach(old_curr1), @_vcc_oset_union(dll_reach(*((old_curr1->next))), @_vcc_oset_singleton(old_curr1)))); 
                        assume $non_null($phys_ptr_cast(SL#old_curr1, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(SL#old_curr1, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#old_curr1, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(SL#old_curr1, ^d_node)));
                        // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll(curr0), &&(&&(dll(*((curr0->next))), ==>(@_vcc_ptr_neq_null(*((curr0->next))), @_vcc_ptr_eq_pure(*((*((curr0->next))->prev)), curr0))), unchecked!(@_vcc_oset_in(curr0, dll_reach(*((curr0->next)))))))); 
                        assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll($s, $phys_ptr_cast(SL#curr0, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) && !$oset_in($phys_ptr_cast(SL#curr0, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll_reach(curr0), @_vcc_oset_union(dll_reach(*((curr0->next))), @_vcc_oset_singleton(curr0)))); 
                        assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(SL#curr0, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(SL#curr0, ^d_node)));
                        // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll(old_curr), &&(&&(dll(*((old_curr->next))), ==>(@_vcc_ptr_neq_null(*((old_curr->next))), @_vcc_ptr_eq_pure(*((*((old_curr->next))->prev)), old_curr))), unchecked!(@_vcc_oset_in(old_curr, dll_reach(*((old_curr->next)))))))); 
                        assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll_reach(old_curr), @_vcc_oset_union(dll_reach(*((old_curr->next))), @_vcc_oset_singleton(old_curr)))); 
                        assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_curr, ^d_node)));
                        // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll(prv), &&(&&(dll(*((prv->next))), ==>(@_vcc_ptr_neq_null(*((prv->next))), @_vcc_ptr_eq_pure(*((*((prv->next))->prev)), prv))), unchecked!(@_vcc_oset_in(prv, dll_reach(*((prv->next)))))))); 
                        assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#prv, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll_reach(prv), @_vcc_oset_union(dll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
                        assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#prv, ^d_node)));
                        // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                        assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                        assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
                        // assume ==>(@_vcc_ptr_neq_null(res), ==(dll(res), &&(&&(dll(*((res->next))), ==>(@_vcc_ptr_neq_null(*((res->next))), @_vcc_ptr_eq_pure(*((*((res->next))->prev)), res))), unchecked!(@_vcc_oset_in(res, dll_reach(*((res->next)))))))); 
                        assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#res, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#res, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_null(res), ==(dll_reach(res), @_vcc_oset_union(dll_reach(*((res->next))), @_vcc_oset_singleton(res)))); 
                        assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#res, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
                        // assume ==>(@_vcc_ptr_neq_null(x), ==(dll(x), &&(&&(dll(*((x->next))), ==>(@_vcc_ptr_neq_null(*((x->next))), @_vcc_ptr_eq_pure(*((*((x->next))->prev)), x))), unchecked!(@_vcc_oset_in(x, dll_reach(*((x->next)))))))); 
                        assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#x, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#x, ^d_node)) && !$oset_in($phys_ptr_cast(P#x, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_reach(x), @_vcc_oset_union(dll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
                        assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#x, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#x, ^d_node)));
                        // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll(prv), &&(&&(dll(*((prv->next))), ==>(@_vcc_ptr_neq_null(*((prv->next))), @_vcc_ptr_eq_pure(*((*((prv->next))->prev)), prv))), unchecked!(@_vcc_oset_in(prv, dll_reach(*((prv->next)))))))); 
                        assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#prv, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll_reach(prv), @_vcc_oset_union(dll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
                        assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#prv, ^d_node)));
                        // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg(res, prv), &&(dll_lseg(*((res->next)), prv), unchecked!(@_vcc_oset_in(res, dll_lseg_reach(*((res->next)), prv)))))); 
                        assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg_reach(res, prv), @_vcc_oset_union(dll_lseg_reach(*((res->next)), prv), @_vcc_oset_singleton(res)))); 
                        assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
                    }
                    else
                    {
                      anon2:
                        // assert @_vcc_possibly_unreachable; 
                        assert {:PossiblyUnreachable true} true;
                    }
                }
                else
                {
                  anon6:
                    // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll(curr0), &&(&&(dll(*((curr0->next))), ==>(@_vcc_ptr_neq_null(*((curr0->next))), @_vcc_ptr_eq_pure(*((*((curr0->next))->prev)), curr0))), unchecked!(@_vcc_oset_in(curr0, dll_reach(*((curr0->next)))))))); 
                    assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll($s, $phys_ptr_cast(SL#curr0, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) && !$oset_in($phys_ptr_cast(SL#curr0, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll_reach(curr0), @_vcc_oset_union(dll_reach(*((curr0->next))), @_vcc_oset_singleton(curr0)))); 
                    assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(SL#curr0, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(SL#curr0, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll(old_curr), &&(&&(dll(*((old_curr->next))), ==>(@_vcc_ptr_neq_null(*((old_curr->next))), @_vcc_ptr_eq_pure(*((*((old_curr->next))->prev)), old_curr))), unchecked!(@_vcc_oset_in(old_curr, dll_reach(*((old_curr->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll_reach(old_curr), @_vcc_oset_union(dll_reach(*((old_curr->next))), @_vcc_oset_singleton(old_curr)))); 
                    assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_curr, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll(prv), &&(&&(dll(*((prv->next))), ==>(@_vcc_ptr_neq_null(*((prv->next))), @_vcc_ptr_eq_pure(*((*((prv->next))->prev)), prv))), unchecked!(@_vcc_oset_in(prv, dll_reach(*((prv->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#prv, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll_reach(prv), @_vcc_oset_union(dll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
                    assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#prv, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(res), ==(dll(res), &&(&&(dll(*((res->next))), ==>(@_vcc_ptr_neq_null(*((res->next))), @_vcc_ptr_eq_pure(*((*((res->next))->prev)), res))), unchecked!(@_vcc_oset_in(res, dll_reach(*((res->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#res, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#res, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(res), ==(dll_reach(res), @_vcc_oset_union(dll_reach(*((res->next))), @_vcc_oset_singleton(res)))); 
                    assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#res, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(x), ==(dll(x), &&(&&(dll(*((x->next))), ==>(@_vcc_ptr_neq_null(*((x->next))), @_vcc_ptr_eq_pure(*((*((x->next))->prev)), x))), unchecked!(@_vcc_oset_in(x, dll_reach(*((x->next)))))))); 
                    assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#x, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#x, ^d_node)) && !$oset_in($phys_ptr_cast(P#x, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_reach(x), @_vcc_oset_union(dll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
                    assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#x, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#x, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg(res, prv), &&(dll_lseg(*((res->next)), prv), unchecked!(@_vcc_oset_in(res, dll_lseg_reach(*((res->next)), prv)))))); 
                    assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg_reach(res, prv), @_vcc_oset_union(dll_lseg_reach(*((res->next)), prv), @_vcc_oset_singleton(res)))); 
                    assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
                    // struct d_node* old_curr1#0; 
                    // old_curr1#0 := old_curr; 
                    old_curr1#0 := $phys_ptr_cast(L#old_curr, ^d_node);
                    // struct d_node* stmtexpr0#9; 
                    // stmtexpr0#9 := old_curr1#0; 
                    stmtexpr0#9 := $phys_ptr_cast(old_curr1#0, ^d_node);
                    // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll(old_curr), &&(&&(dll(*((old_curr->next))), ==>(@_vcc_ptr_neq_null(*((old_curr->next))), @_vcc_ptr_eq_pure(*((*((old_curr->next))->prev)), old_curr))), unchecked!(@_vcc_oset_in(old_curr, dll_reach(*((old_curr->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll_reach(old_curr), @_vcc_oset_union(dll_reach(*((old_curr->next))), @_vcc_oset_singleton(old_curr)))); 
                    assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_curr, ^d_node)));
                    // assert @reads_check_normal((old_curr->next)); 
                    assert $thread_local($s, $phys_ptr_cast(L#old_curr, ^d_node));
                    // res := *((old_curr->next)); 
                    L#res := $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node);
                    // assume ==>(@_vcc_ptr_neq_null(res), ==(dll(res), &&(&&(dll(*((res->next))), ==>(@_vcc_ptr_neq_null(*((res->next))), @_vcc_ptr_eq_pure(*((*((res->next))->prev)), res))), unchecked!(@_vcc_oset_in(res, dll_reach(*((res->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#res, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#res, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(res), ==(dll_reach(res), @_vcc_oset_union(dll_reach(*((res->next))), @_vcc_oset_singleton(res)))); 
                    assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#res, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll(old_curr), &&(&&(dll(*((old_curr->next))), ==>(@_vcc_ptr_neq_null(*((old_curr->next))), @_vcc_ptr_eq_pure(*((*((old_curr->next))->prev)), old_curr))), unchecked!(@_vcc_oset_in(old_curr, dll_reach(*((old_curr->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node))));
                    // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll_reach(old_curr), @_vcc_oset_union(dll_reach(*((old_curr->next))), @_vcc_oset_singleton(old_curr)))); 
                    assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_curr, ^d_node)));
                    assume true;
                    // if (@_vcc_ptr_neq_null(res)) ...
                    if ($non_null($phys_ptr_cast(L#res, ^d_node)))
                    {
                      anon4:
                        // _math \state _dryad_S0#1; 
                        // _dryad_S0#1 := @_vcc_current_state(@state); 
                        _dryad_S0#1 := $current_state($s);
                        // _math \state stmtexpr0#10; 
                        // stmtexpr0#10 := _dryad_S0#1; 
                        stmtexpr0#10 := _dryad_S0#1;
                        // assert @prim_writes_check((res->prev)); 
                        assert $writable_prim($s, #wrTime$2^3.3, $dot($phys_ptr_cast(L#res, ^d_node), d_node.prev));
                        // *(res->prev) := (struct d_node*)@null; 
                        call $write_int(d_node.prev, $phys_ptr_cast(L#res, ^d_node), $ptr_to_int($phys_ptr_cast($null, ^d_node)));
                        assume $full_stop_ext(#tok$2^39.33, $s);
                        // _math \state _dryad_S1#2; 
                        // _dryad_S1#2 := @_vcc_current_state(@state); 
                        _dryad_S1#2 := $current_state($s);
                        // _math \state stmtexpr1#11; 
                        // stmtexpr1#11 := _dryad_S1#2; 
                        stmtexpr1#11 := _dryad_S1#2;
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_reach(*((res->next)))))), ==(old(_dryad_S0#1, dll(*((res->next)))), old(_dryad_S1#2, dll(*((res->next)))))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node))) ==> F#dll(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) == F#dll(_dryad_S1#2, $rd_phys_ptr(_dryad_S1#2, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_reach(*((res->next)))))), ==(old(_dryad_S0#1, dll_reach(*((res->next)))), old(_dryad_S1#2, dll_reach(*((res->next)))))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node))) ==> F#dll_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) == F#dll_reach(_dryad_S1#2, $rd_phys_ptr(_dryad_S1#2, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node));
                        // assume ==(old(_dryad_S0#1, dll(old_curr1#0)), old(_dryad_S1#2, dll(old_curr1#0))); 
                        assume F#dll(_dryad_S0#1, $phys_ptr_cast(old_curr1#0, ^d_node)) == F#dll(_dryad_S1#2, $phys_ptr_cast(old_curr1#0, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll_reach(old_curr1#0)), old(_dryad_S1#2, dll_reach(old_curr1#0))); 
                        assume F#dll_reach(_dryad_S0#1, $phys_ptr_cast(old_curr1#0, ^d_node)) == F#dll_reach(_dryad_S1#2, $phys_ptr_cast(old_curr1#0, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll(curr0)), old(_dryad_S1#2, dll(curr0))); 
                        assume F#dll(_dryad_S0#1, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll(_dryad_S1#2, $phys_ptr_cast(SL#curr0, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll_reach(curr0)), old(_dryad_S1#2, dll_reach(curr0))); 
                        assume F#dll_reach(_dryad_S0#1, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll_reach(_dryad_S1#2, $phys_ptr_cast(SL#curr0, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll(old_curr)), old(_dryad_S1#2, dll(old_curr))); 
                        assume F#dll(_dryad_S0#1, $phys_ptr_cast(L#old_curr, ^d_node)) == F#dll(_dryad_S1#2, $phys_ptr_cast(L#old_curr, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll_reach(old_curr)), old(_dryad_S1#2, dll_reach(old_curr))); 
                        assume F#dll_reach(_dryad_S0#1, $phys_ptr_cast(L#old_curr, ^d_node)) == F#dll_reach(_dryad_S1#2, $phys_ptr_cast(L#old_curr, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll(prv)), old(_dryad_S1#2, dll(prv))); 
                        assume F#dll(_dryad_S0#1, $phys_ptr_cast(L#prv, ^d_node)) == F#dll(_dryad_S1#2, $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll_reach(prv)), old(_dryad_S1#2, dll_reach(prv))); 
                        assume F#dll_reach(_dryad_S0#1, $phys_ptr_cast(L#prv, ^d_node)) == F#dll_reach(_dryad_S1#2, $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll(curr)), old(_dryad_S1#2, dll(curr))); 
                        assume F#dll(_dryad_S0#1, $phys_ptr_cast(L#curr, ^d_node)) == F#dll(_dryad_S1#2, $phys_ptr_cast(L#curr, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll_reach(curr)), old(_dryad_S1#2, dll_reach(curr))); 
                        assume F#dll_reach(_dryad_S0#1, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_reach(_dryad_S1#2, $phys_ptr_cast(L#curr, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll(res)), old(_dryad_S1#2, dll(res))); 
                        assume F#dll(_dryad_S0#1, $phys_ptr_cast(L#res, ^d_node)) == F#dll(_dryad_S1#2, $phys_ptr_cast(L#res, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll_reach(res)), old(_dryad_S1#2, dll_reach(res))); 
                        assume F#dll_reach(_dryad_S0#1, $phys_ptr_cast(L#res, ^d_node)) == F#dll_reach(_dryad_S1#2, $phys_ptr_cast(L#res, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll(x)), old(_dryad_S1#2, dll(x))); 
                        assume F#dll(_dryad_S0#1, $phys_ptr_cast(P#x, ^d_node)) == F#dll(_dryad_S1#2, $phys_ptr_cast(P#x, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll_reach(x)), old(_dryad_S1#2, dll_reach(x))); 
                        assume F#dll_reach(_dryad_S0#1, $phys_ptr_cast(P#x, ^d_node)) == F#dll_reach(_dryad_S1#2, $phys_ptr_cast(P#x, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll_lseg(res, prv)), old(_dryad_S1#2, dll_lseg(res, prv))); 
                        assume F#dll_lseg(_dryad_S0#1, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == F#dll_lseg(_dryad_S1#2, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll_lseg_reach(res, prv)), old(_dryad_S1#2, dll_lseg_reach(res, prv))); 
                        assume F#dll_lseg_reach(_dryad_S0#1, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == F#dll_lseg_reach(_dryad_S1#2, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll_lseg(res, prv)), old(_dryad_S1#2, dll_lseg(res, prv))); 
                        assume F#dll_lseg(_dryad_S0#1, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == F#dll_lseg(_dryad_S1#2, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==(old(_dryad_S0#1, dll_lseg_reach(res, prv)), old(_dryad_S1#2, dll_lseg_reach(res, prv))); 
                        assume F#dll_lseg_reach(_dryad_S0#1, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == F#dll_lseg_reach(_dryad_S1#2, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_reach(old_curr1#0)))), ==(old(_dryad_S0#1, dll(old_curr1#0)), old(_dryad_S1#2, dll(old_curr1#0)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach(_dryad_S0#1, $phys_ptr_cast(old_curr1#0, ^d_node))) ==> F#dll(_dryad_S0#1, $phys_ptr_cast(old_curr1#0, ^d_node)) == F#dll(_dryad_S1#2, $phys_ptr_cast(old_curr1#0, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_reach(old_curr1#0)))), ==(old(_dryad_S0#1, dll_reach(old_curr1#0)), old(_dryad_S1#2, dll_reach(old_curr1#0)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach(_dryad_S0#1, $phys_ptr_cast(old_curr1#0, ^d_node))) ==> F#dll_reach(_dryad_S0#1, $phys_ptr_cast(old_curr1#0, ^d_node)) == F#dll_reach(_dryad_S1#2, $phys_ptr_cast(old_curr1#0, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_reach(curr0)))), ==(old(_dryad_S0#1, dll(curr0)), old(_dryad_S1#2, dll(curr0)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach(_dryad_S0#1, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll(_dryad_S0#1, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll(_dryad_S1#2, $phys_ptr_cast(SL#curr0, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_reach(curr0)))), ==(old(_dryad_S0#1, dll_reach(curr0)), old(_dryad_S1#2, dll_reach(curr0)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach(_dryad_S0#1, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll_reach(_dryad_S0#1, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll_reach(_dryad_S1#2, $phys_ptr_cast(SL#curr0, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_reach(old_curr)))), ==(old(_dryad_S0#1, dll(old_curr)), old(_dryad_S1#2, dll(old_curr)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach(_dryad_S0#1, $phys_ptr_cast(L#old_curr, ^d_node))) ==> F#dll(_dryad_S0#1, $phys_ptr_cast(L#old_curr, ^d_node)) == F#dll(_dryad_S1#2, $phys_ptr_cast(L#old_curr, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_reach(old_curr)))), ==(old(_dryad_S0#1, dll_reach(old_curr)), old(_dryad_S1#2, dll_reach(old_curr)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach(_dryad_S0#1, $phys_ptr_cast(L#old_curr, ^d_node))) ==> F#dll_reach(_dryad_S0#1, $phys_ptr_cast(L#old_curr, ^d_node)) == F#dll_reach(_dryad_S1#2, $phys_ptr_cast(L#old_curr, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_reach(prv)))), ==(old(_dryad_S0#1, dll(prv)), old(_dryad_S1#2, dll(prv)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach(_dryad_S0#1, $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll(_dryad_S0#1, $phys_ptr_cast(L#prv, ^d_node)) == F#dll(_dryad_S1#2, $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_reach(prv)))), ==(old(_dryad_S0#1, dll_reach(prv)), old(_dryad_S1#2, dll_reach(prv)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach(_dryad_S0#1, $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll_reach(_dryad_S0#1, $phys_ptr_cast(L#prv, ^d_node)) == F#dll_reach(_dryad_S1#2, $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_reach(curr)))), ==(old(_dryad_S0#1, dll(curr)), old(_dryad_S1#2, dll(curr)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach(_dryad_S0#1, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll(_dryad_S0#1, $phys_ptr_cast(L#curr, ^d_node)) == F#dll(_dryad_S1#2, $phys_ptr_cast(L#curr, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_reach(curr)))), ==(old(_dryad_S0#1, dll_reach(curr)), old(_dryad_S1#2, dll_reach(curr)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach(_dryad_S0#1, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_reach(_dryad_S0#1, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_reach(_dryad_S1#2, $phys_ptr_cast(L#curr, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_reach(x)))), ==(old(_dryad_S0#1, dll(x)), old(_dryad_S1#2, dll(x)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach(_dryad_S0#1, $phys_ptr_cast(P#x, ^d_node))) ==> F#dll(_dryad_S0#1, $phys_ptr_cast(P#x, ^d_node)) == F#dll(_dryad_S1#2, $phys_ptr_cast(P#x, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_reach(x)))), ==(old(_dryad_S0#1, dll_reach(x)), old(_dryad_S1#2, dll_reach(x)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach(_dryad_S0#1, $phys_ptr_cast(P#x, ^d_node))) ==> F#dll_reach(_dryad_S0#1, $phys_ptr_cast(P#x, ^d_node)) == F#dll_reach(_dryad_S1#2, $phys_ptr_cast(P#x, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_lseg_reach(old(_dryad_S0#1, *((res->prev))), prv)))), ==(old(_dryad_S0#1, dll_lseg(old(_dryad_S0#1, *((res->prev))), prv)), old(_dryad_S1#2, dll_lseg(old(_dryad_S0#1, *((res->prev))), prv)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_lseg_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll_lseg(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == F#dll_lseg(_dryad_S1#2, $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_lseg_reach(old(_dryad_S0#1, *((res->prev))), prv)))), ==(old(_dryad_S0#1, dll_lseg_reach(old(_dryad_S0#1, *((res->prev))), prv)), old(_dryad_S1#2, dll_lseg_reach(old(_dryad_S0#1, *((res->prev))), prv)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_lseg_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll_lseg_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == F#dll_lseg_reach(_dryad_S1#2, $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_lseg_reach(old(_dryad_S0#1, *((res->prev))), prv)))), ==(old(_dryad_S0#1, dll_lseg(old(_dryad_S0#1, *((res->prev))), prv)), old(_dryad_S1#2, dll_lseg(old(_dryad_S0#1, *((res->prev))), prv)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_lseg_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll_lseg(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == F#dll_lseg(_dryad_S1#2, $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==>(unchecked!(@_vcc_oset_in(res, old(_dryad_S0#1, dll_lseg_reach(old(_dryad_S0#1, *((res->prev))), prv)))), ==(old(_dryad_S0#1, dll_lseg_reach(old(_dryad_S0#1, *((res->prev))), prv)), old(_dryad_S1#2, dll_lseg_reach(old(_dryad_S0#1, *((res->prev))), prv)))); 
                        assume !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_lseg_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll_lseg_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == F#dll_lseg_reach(_dryad_S1#2, $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node));
                        // assume ==>(!(@_vcc_ptr_eq_pure(res, old_curr1#0)), @_vcc_ptr_eq_pure(*((old_curr1#0->prev)), old(_dryad_S0#1, *((old_curr1#0->prev))))); 
                        assume !($phys_ptr_cast(L#res, ^d_node) == $phys_ptr_cast(old_curr1#0, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(old_curr1#0, ^d_node), ^d_node) == $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(old_curr1#0, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(res, old_curr1#0)), @_vcc_ptr_eq_pure(*((old_curr1#0->next)), old(_dryad_S0#1, *((old_curr1#0->next))))); 
                        assume !($phys_ptr_cast(L#res, ^d_node) == $phys_ptr_cast(old_curr1#0, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(old_curr1#0, ^d_node), ^d_node) == $rd_phys_ptr(_dryad_S0#1, d_node.next, $phys_ptr_cast(old_curr1#0, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(res, curr0)), @_vcc_ptr_eq_pure(*((curr0->prev)), old(_dryad_S0#1, *((curr0->prev))))); 
                        assume !($phys_ptr_cast(L#res, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node) == $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(res, curr0)), @_vcc_ptr_eq_pure(*((curr0->next)), old(_dryad_S0#1, *((curr0->next))))); 
                        assume !($phys_ptr_cast(L#res, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node) == $rd_phys_ptr(_dryad_S0#1, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(res, old_curr)), @_vcc_ptr_eq_pure(*((old_curr->prev)), old(_dryad_S0#1, *((old_curr->prev))))); 
                        assume !($phys_ptr_cast(L#res, ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node) == $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(res, old_curr)), @_vcc_ptr_eq_pure(*((old_curr->next)), old(_dryad_S0#1, *((old_curr->next))))); 
                        assume !($phys_ptr_cast(L#res, ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node) == $rd_phys_ptr(_dryad_S0#1, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(res, prv)), @_vcc_ptr_eq_pure(*((prv->prev)), old(_dryad_S0#1, *((prv->prev))))); 
                        assume !($phys_ptr_cast(L#res, ^d_node) == $phys_ptr_cast(L#prv, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#prv, ^d_node), ^d_node) == $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(L#prv, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(res, prv)), @_vcc_ptr_eq_pure(*((prv->next)), old(_dryad_S0#1, *((prv->next))))); 
                        assume !($phys_ptr_cast(L#res, ^d_node) == $phys_ptr_cast(L#prv, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node) == $rd_phys_ptr(_dryad_S0#1, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(res, curr)), @_vcc_ptr_eq_pure(*((curr->prev)), old(_dryad_S0#1, *((curr->prev))))); 
                        assume !($phys_ptr_cast(L#res, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(res, curr)), @_vcc_ptr_eq_pure(*((curr->next)), old(_dryad_S0#1, *((curr->next))))); 
                        assume !($phys_ptr_cast(L#res, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(_dryad_S0#1, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(res, x)), @_vcc_ptr_eq_pure(*((x->prev)), old(_dryad_S0#1, *((x->prev))))); 
                        assume !($phys_ptr_cast(L#res, ^d_node) == $phys_ptr_cast(P#x, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(P#x, ^d_node), ^d_node) == $rd_phys_ptr(_dryad_S0#1, d_node.prev, $phys_ptr_cast(P#x, ^d_node), ^d_node);
                        // assume ==>(!(@_vcc_ptr_eq_pure(res, x)), @_vcc_ptr_eq_pure(*((x->next)), old(_dryad_S0#1, *((x->next))))); 
                        assume !($phys_ptr_cast(L#res, ^d_node) == $phys_ptr_cast(P#x, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node) == $rd_phys_ptr(_dryad_S0#1, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node);
                        // assume ==>(@_vcc_ptr_neq_null(old_curr1#0), ==(dll(old_curr1#0), &&(&&(dll(*((old_curr1#0->next))), ==>(@_vcc_ptr_neq_null(*((old_curr1#0->next))), @_vcc_ptr_eq_pure(*((*((old_curr1#0->next))->prev)), old_curr1#0))), unchecked!(@_vcc_oset_in(old_curr1#0, dll_reach(*((old_curr1#0->next)))))))); 
                        assume $non_null($phys_ptr_cast(old_curr1#0, ^d_node)) ==> F#dll($s, $phys_ptr_cast(old_curr1#0, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(old_curr1#0, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(old_curr1#0, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(old_curr1#0, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(old_curr1#0, ^d_node)) && !$oset_in($phys_ptr_cast(old_curr1#0, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(old_curr1#0, ^d_node), ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_null(old_curr1#0), ==(dll_reach(old_curr1#0), @_vcc_oset_union(dll_reach(*((old_curr1#0->next))), @_vcc_oset_singleton(old_curr1#0)))); 
                        assume $non_null($phys_ptr_cast(old_curr1#0, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(old_curr1#0, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(old_curr1#0, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(old_curr1#0, ^d_node)));
                        // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll(curr0), &&(&&(dll(*((curr0->next))), ==>(@_vcc_ptr_neq_null(*((curr0->next))), @_vcc_ptr_eq_pure(*((*((curr0->next))->prev)), curr0))), unchecked!(@_vcc_oset_in(curr0, dll_reach(*((curr0->next)))))))); 
                        assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll($s, $phys_ptr_cast(SL#curr0, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) && !$oset_in($phys_ptr_cast(SL#curr0, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll_reach(curr0), @_vcc_oset_union(dll_reach(*((curr0->next))), @_vcc_oset_singleton(curr0)))); 
                        assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(SL#curr0, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(SL#curr0, ^d_node)));
                        // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll(old_curr), &&(&&(dll(*((old_curr->next))), ==>(@_vcc_ptr_neq_null(*((old_curr->next))), @_vcc_ptr_eq_pure(*((*((old_curr->next))->prev)), old_curr))), unchecked!(@_vcc_oset_in(old_curr, dll_reach(*((old_curr->next)))))))); 
                        assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll_reach(old_curr), @_vcc_oset_union(dll_reach(*((old_curr->next))), @_vcc_oset_singleton(old_curr)))); 
                        assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_curr, ^d_node)));
                        // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll(prv), &&(&&(dll(*((prv->next))), ==>(@_vcc_ptr_neq_null(*((prv->next))), @_vcc_ptr_eq_pure(*((*((prv->next))->prev)), prv))), unchecked!(@_vcc_oset_in(prv, dll_reach(*((prv->next)))))))); 
                        assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#prv, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll_reach(prv), @_vcc_oset_union(dll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
                        assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#prv, ^d_node)));
                        // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                        assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                        assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
                        // assume ==>(@_vcc_ptr_neq_null(x), ==(dll(x), &&(&&(dll(*((x->next))), ==>(@_vcc_ptr_neq_null(*((x->next))), @_vcc_ptr_eq_pure(*((*((x->next))->prev)), x))), unchecked!(@_vcc_oset_in(x, dll_reach(*((x->next)))))))); 
                        assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#x, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#x, ^d_node)) && !$oset_in($phys_ptr_cast(P#x, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_reach(x), @_vcc_oset_union(dll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
                        assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#x, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#x, ^d_node)));
                        // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg(res, prv), &&(dll_lseg(*((res->next)), prv), unchecked!(@_vcc_oset_in(res, dll_lseg_reach(*((res->next)), prv)))))); 
                        assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg_reach(res, prv), @_vcc_oset_union(dll_lseg_reach(*((res->next)), prv), @_vcc_oset_singleton(res)))); 
                        assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
                        // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg(res, prv), &&(dll_lseg(*((res->next)), prv), unchecked!(@_vcc_oset_in(res, dll_lseg_reach(*((res->next)), prv)))))); 
                        assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node))));
                        // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg_reach(res, prv), @_vcc_oset_union(dll_lseg_reach(*((res->next)), prv), @_vcc_oset_singleton(res)))); 
                        assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
                    }
                    else
                    {
                      anon5:
                        // assert @_vcc_possibly_unreachable; 
                        assert {:PossiblyUnreachable true} true;
                    }
                }

              anon8:
                // _math \state _dryad_S0#3; 
                // _dryad_S0#3 := @_vcc_current_state(@state); 
                _dryad_S0#3 := $current_state($s);
                // _math \state stmtexpr0#12; 
                // stmtexpr0#12 := _dryad_S0#3; 
                stmtexpr0#12 := _dryad_S0#3;
                // void function
                // assert @writes_check(old_curr); 
                assert $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#old_curr, ^d_node));
                // assert @writes_check(@_vcc_extent(@state, old_curr)); 
                assert (forall #writes$2^41.7: $ptr :: { $dont_instantiate(#writes$2^41.7) } $set_in(#writes$2^41.7, $extent($s, $phys_ptr_cast(L#old_curr, ^d_node))) ==> $top_writable($s, #wrTime$2^3.3, #writes$2^41.7));
                // stmt _vcc_free(old_curr); 
                call $free($phys_ptr_cast(L#old_curr, ^d_node));
                assume $full_stop_ext(#tok$2^41.7, $s);
                // _math \state _dryad_S1#4; 
                // _dryad_S1#4 := @_vcc_current_state(@state); 
                _dryad_S1#4 := $current_state($s);
                // _math \state stmtexpr1#13; 
                // stmtexpr1#13 := _dryad_S1#4; 
                stmtexpr1#13 := _dryad_S1#4;
                // assume ==>(unchecked!(@_vcc_oset_in(old_curr, old(_dryad_S0#3, dll_reach(curr0)))), ==(old(_dryad_S0#3, dll(curr0)), old(_dryad_S1#4, dll(curr0)))); 
                assume !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach(_dryad_S0#3, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll(_dryad_S0#3, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll(_dryad_S1#4, $phys_ptr_cast(SL#curr0, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_curr, old(_dryad_S0#3, dll_reach(curr0)))), ==(old(_dryad_S0#3, dll_reach(curr0)), old(_dryad_S1#4, dll_reach(curr0)))); 
                assume !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach(_dryad_S0#3, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll_reach(_dryad_S0#3, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll_reach(_dryad_S1#4, $phys_ptr_cast(SL#curr0, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_curr, old(_dryad_S0#3, dll_reach(prv)))), ==(old(_dryad_S0#3, dll(prv)), old(_dryad_S1#4, dll(prv)))); 
                assume !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach(_dryad_S0#3, $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll(_dryad_S0#3, $phys_ptr_cast(L#prv, ^d_node)) == F#dll(_dryad_S1#4, $phys_ptr_cast(L#prv, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_curr, old(_dryad_S0#3, dll_reach(prv)))), ==(old(_dryad_S0#3, dll_reach(prv)), old(_dryad_S1#4, dll_reach(prv)))); 
                assume !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach(_dryad_S0#3, $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll_reach(_dryad_S0#3, $phys_ptr_cast(L#prv, ^d_node)) == F#dll_reach(_dryad_S1#4, $phys_ptr_cast(L#prv, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_curr, old(_dryad_S0#3, dll_reach(curr)))), ==(old(_dryad_S0#3, dll(curr)), old(_dryad_S1#4, dll(curr)))); 
                assume !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach(_dryad_S0#3, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll(_dryad_S0#3, $phys_ptr_cast(L#curr, ^d_node)) == F#dll(_dryad_S1#4, $phys_ptr_cast(L#curr, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_curr, old(_dryad_S0#3, dll_reach(curr)))), ==(old(_dryad_S0#3, dll_reach(curr)), old(_dryad_S1#4, dll_reach(curr)))); 
                assume !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach(_dryad_S0#3, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_reach(_dryad_S0#3, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_reach(_dryad_S1#4, $phys_ptr_cast(L#curr, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_curr, old(_dryad_S0#3, dll_reach(res)))), ==(old(_dryad_S0#3, dll(res)), old(_dryad_S1#4, dll(res)))); 
                assume !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach(_dryad_S0#3, $phys_ptr_cast(L#res, ^d_node))) ==> F#dll(_dryad_S0#3, $phys_ptr_cast(L#res, ^d_node)) == F#dll(_dryad_S1#4, $phys_ptr_cast(L#res, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_curr, old(_dryad_S0#3, dll_reach(res)))), ==(old(_dryad_S0#3, dll_reach(res)), old(_dryad_S1#4, dll_reach(res)))); 
                assume !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach(_dryad_S0#3, $phys_ptr_cast(L#res, ^d_node))) ==> F#dll_reach(_dryad_S0#3, $phys_ptr_cast(L#res, ^d_node)) == F#dll_reach(_dryad_S1#4, $phys_ptr_cast(L#res, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_curr, old(_dryad_S0#3, dll_reach(x)))), ==(old(_dryad_S0#3, dll(x)), old(_dryad_S1#4, dll(x)))); 
                assume !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach(_dryad_S0#3, $phys_ptr_cast(P#x, ^d_node))) ==> F#dll(_dryad_S0#3, $phys_ptr_cast(P#x, ^d_node)) == F#dll(_dryad_S1#4, $phys_ptr_cast(P#x, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_curr, old(_dryad_S0#3, dll_reach(x)))), ==(old(_dryad_S0#3, dll_reach(x)), old(_dryad_S1#4, dll_reach(x)))); 
                assume !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach(_dryad_S0#3, $phys_ptr_cast(P#x, ^d_node))) ==> F#dll_reach(_dryad_S0#3, $phys_ptr_cast(P#x, ^d_node)) == F#dll_reach(_dryad_S1#4, $phys_ptr_cast(P#x, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_curr, old(_dryad_S0#3, dll_lseg_reach(res, prv)))), ==(old(_dryad_S0#3, dll_lseg(res, prv)), old(_dryad_S1#4, dll_lseg(res, prv)))); 
                assume !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_lseg_reach(_dryad_S0#3, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll_lseg(_dryad_S0#3, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == F#dll_lseg(_dryad_S1#4, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(old_curr, old(_dryad_S0#3, dll_lseg_reach(res, prv)))), ==(old(_dryad_S0#3, dll_lseg_reach(res, prv)), old(_dryad_S1#4, dll_lseg_reach(res, prv)))); 
                assume !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_lseg_reach(_dryad_S0#3, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node))) ==> F#dll_lseg_reach(_dryad_S0#3, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == F#dll_lseg_reach(_dryad_S1#4, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
            }
            else
            {
              anon9:
                // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll(curr0), &&(&&(dll(*((curr0->next))), ==>(@_vcc_ptr_neq_null(*((curr0->next))), @_vcc_ptr_eq_pure(*((*((curr0->next))->prev)), curr0))), unchecked!(@_vcc_oset_in(curr0, dll_reach(*((curr0->next)))))))); 
                assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll($s, $phys_ptr_cast(SL#curr0, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) && !$oset_in($phys_ptr_cast(SL#curr0, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll_reach(curr0), @_vcc_oset_union(dll_reach(*((curr0->next))), @_vcc_oset_singleton(curr0)))); 
                assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(SL#curr0, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(SL#curr0, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll(old_curr), &&(&&(dll(*((old_curr->next))), ==>(@_vcc_ptr_neq_null(*((old_curr->next))), @_vcc_ptr_eq_pure(*((*((old_curr->next))->prev)), old_curr))), unchecked!(@_vcc_oset_in(old_curr, dll_reach(*((old_curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#old_curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#old_curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#old_curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(old_curr), ==(dll_reach(old_curr), @_vcc_oset_union(dll_reach(*((old_curr->next))), @_vcc_oset_singleton(old_curr)))); 
                assume $non_null($phys_ptr_cast(L#old_curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#old_curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#old_curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#old_curr, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll(prv), &&(&&(dll(*((prv->next))), ==>(@_vcc_ptr_neq_null(*((prv->next))), @_vcc_ptr_eq_pure(*((*((prv->next))->prev)), prv))), unchecked!(@_vcc_oset_in(prv, dll_reach(*((prv->next)))))))); 
                assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#prv, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll_reach(prv), @_vcc_oset_union(dll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
                assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#prv, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(res), ==(dll(res), &&(&&(dll(*((res->next))), ==>(@_vcc_ptr_neq_null(*((res->next))), @_vcc_ptr_eq_pure(*((*((res->next))->prev)), res))), unchecked!(@_vcc_oset_in(res, dll_reach(*((res->next)))))))); 
                assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#res, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#res, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(res), ==(dll_reach(res), @_vcc_oset_union(dll_reach(*((res->next))), @_vcc_oset_singleton(res)))); 
                assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#res, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(dll(x), &&(&&(dll(*((x->next))), ==>(@_vcc_ptr_neq_null(*((x->next))), @_vcc_ptr_eq_pure(*((*((x->next))->prev)), x))), unchecked!(@_vcc_oset_in(x, dll_reach(*((x->next)))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#x, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#x, ^d_node)) && !$oset_in($phys_ptr_cast(P#x, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_reach(x), @_vcc_oset_union(dll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
                assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#x, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#x, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg(res, prv), &&(dll_lseg(*((res->next)), prv), unchecked!(@_vcc_oset_in(res, dll_lseg_reach(*((res->next)), prv)))))); 
                assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node))));
                // assume ==>(@_vcc_ptr_neq_pure(res, prv), ==(dll_lseg_reach(res, prv), @_vcc_oset_union(dll_lseg_reach(*((res->next)), prv), @_vcc_oset_singleton(res)))); 
                assume $phys_ptr_cast(L#res, ^d_node) != $phys_ptr_cast(L#prv, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), $phys_ptr_cast(L#prv, ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
                // prv := old_curr; 
                L#prv := $phys_ptr_cast(L#old_curr, ^d_node);
                // assert dll_lseg(curr0, curr0); 
                assert F#dll_lseg($s, $phys_ptr_cast(SL#curr0, ^d_node), $phys_ptr_cast(SL#curr0, ^d_node));
                // assume dll_lseg(curr0, curr0); 
                assume F#dll_lseg($s, $phys_ptr_cast(SL#curr0, ^d_node), $phys_ptr_cast(SL#curr0, ^d_node));
                // assert dll_lseg(old_curr, old_curr); 
                assert F#dll_lseg($s, $phys_ptr_cast(L#old_curr, ^d_node), $phys_ptr_cast(L#old_curr, ^d_node));
                // assume dll_lseg(old_curr, old_curr); 
                assume F#dll_lseg($s, $phys_ptr_cast(L#old_curr, ^d_node), $phys_ptr_cast(L#old_curr, ^d_node));
                // assert dll_lseg(prv, prv); 
                assert F#dll_lseg($s, $phys_ptr_cast(L#prv, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
                // assume dll_lseg(prv, prv); 
                assume F#dll_lseg($s, $phys_ptr_cast(L#prv, ^d_node), $phys_ptr_cast(L#prv, ^d_node));
                // assert dll_lseg(curr, curr); 
                assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
                // assume dll_lseg(curr, curr); 
                assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
                // assert dll_lseg(res, res); 
                assert F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#res, ^d_node));
                // assume dll_lseg(res, res); 
                assume F#dll_lseg($s, $phys_ptr_cast(L#res, ^d_node), $phys_ptr_cast(L#res, ^d_node));
                // assert dll_lseg(x, x); 
                assert F#dll_lseg($s, $phys_ptr_cast(P#x, ^d_node), $phys_ptr_cast(P#x, ^d_node));
                // assume dll_lseg(x, x); 
                assume F#dll_lseg($s, $phys_ptr_cast(P#x, ^d_node), $phys_ptr_cast(P#x, ^d_node));
            }
        }
        else
        {
          anon11:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // goto #break_2; 
            goto #break_2;
        }

      #continue_2:
        assume true;
    }

  anon14:
    assume $full_stop_ext(#tok$2^13.3, $s);

  #break_2:
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll(prv), &&(&&(dll(*((prv->next))), ==>(@_vcc_ptr_neq_null(*((prv->next))), @_vcc_ptr_eq_pure(*((*((prv->next))->prev)), prv))), unchecked!(@_vcc_oset_in(prv, dll_reach(*((prv->next)))))))); 
    assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#prv, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#prv, ^d_node)) && !$oset_in($phys_ptr_cast(L#prv, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(dll_reach(prv), @_vcc_oset_union(dll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
    assume $non_null($phys_ptr_cast(L#prv, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#prv, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#prv, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#prv, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(res), ==(dll(res), &&(&&(dll(*((res->next))), ==>(@_vcc_ptr_neq_null(*((res->next))), @_vcc_ptr_eq_pure(*((*((res->next))->prev)), res))), unchecked!(@_vcc_oset_in(res, dll_reach(*((res->next)))))))); 
    assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#res, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#res, ^d_node)) && !$oset_in($phys_ptr_cast(L#res, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(res), ==(dll_reach(res), @_vcc_oset_union(dll_reach(*((res->next))), @_vcc_oset_singleton(res)))); 
    assume $non_null($phys_ptr_cast(L#res, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#res, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#res, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#res, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(x), ==(dll(x), &&(&&(dll(*((x->next))), ==>(@_vcc_ptr_neq_null(*((x->next))), @_vcc_ptr_eq_pure(*((*((x->next))->prev)), x))), unchecked!(@_vcc_oset_in(x, dll_reach(*((x->next)))))))); 
    assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#x, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#x, ^d_node)) && !$oset_in($phys_ptr_cast(P#x, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_reach(x), @_vcc_oset_union(dll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
    assume $non_null($phys_ptr_cast(P#x, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#x, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#x, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#x, ^d_node)));
    // return res; 
    $result := $phys_ptr_cast(L#res, ^d_node);
    assume true;
    assert $position_marker();
    goto #exit;

  anon15:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$2^41.7: $token;

const unique #tok$2^39.33: $token;

const unique #tok$2^35.11: $token;

const unique #tok$2^33.9: $token;

const unique #tok$2^13.3: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^3.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cgrass?5Cdl?5Cdl_filter.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cgrass?5Cdl?5Cdl_filter.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cgrass?5Cdl?5Cdryad_dl.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cgrass?5Cdl?5Cdryad_dl.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^d_node);
