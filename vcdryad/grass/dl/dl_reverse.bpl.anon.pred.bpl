
const {:existential true} b0000 : bool;
const {:existential true} b0001 : bool;
const {:existential true} b0002 : bool;
const {:existential true} b0003 : bool;
const {:existential true} b0004 : bool;
const {:existential true} b0005 : bool;
const {:existential true} b0006 : bool;
const {:existential true} b0007 : bool;
const {:existential true} b0008 : bool;
const {:existential true} b0009 : bool;
const {:existential true} b0010 : bool;
const {:existential true} b0011 : bool;
const {:existential true} b0012 : bool;
const {:existential true} b0013 : bool;
const {:existential true} b0014 : bool;
const {:existential true} b0015 : bool;
const {:existential true} b0016 : bool;
const {:existential true} b0017 : bool;
const {:existential true} b0018 : bool;
const {:existential true} b0019 : bool;
const {:existential true} b0020 : bool;
const {:existential true} b0021 : bool;
const {:existential true} b0022 : bool;
const {:existential true} b0023 : bool;
const {:existential true} b0024 : bool;
const {:existential true} b0025 : bool;
const {:existential true} b0026 : bool;
const {:existential true} b0027 : bool;
const {:existential true} b0028 : bool;
const {:existential true} b0029 : bool;
const {:existential true} b0030 : bool;
const {:existential true} b0031 : bool;
const {:existential true} b0032 : bool;
const {:existential true} b0033 : bool;
const {:existential true} b0034 : bool;
const {:existential true} b0035 : bool;
const {:existential true} b0036 : bool;
const {:existential true} b0037 : bool;
const {:existential true} b0038 : bool;
const {:existential true} b0039 : bool;
const {:existential true} b0040 : bool;
const {:existential true} b0041 : bool;
const {:existential true} b0042 : bool;
const {:existential true} b0043 : bool;
const {:existential true} b0044 : bool;
const {:existential true} b0045 : bool;
const {:existential true} b0046 : bool;
const {:existential true} b0047 : bool;
const {:existential true} b0048 : bool;
const {:existential true} b0049 : bool;
const {:existential true} b0050 : bool;
const {:existential true} b0051 : bool;
const {:existential true} b0052 : bool;
const {:existential true} b0053 : bool;
const {:existential true} b0054 : bool;
const {:existential true} b0055 : bool;
const {:existential true} b0056 : bool;
const {:existential true} b0057 : bool;
const {:existential true} b0058 : bool;
const {:existential true} b0059 : bool;
const {:existential true} b0060 : bool;
const {:existential true} b0061 : bool;
const {:existential true} b0062 : bool;

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

const unique ^$#dl_reverse.c..36776#3: $ctype;

axiom $def_fnptr_type(^$#dl_reverse.c..36776#3);

type $#dl_reverse.c..36776#3;

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

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#dll_lseg(#s, SP#hd, SP#tl) } 1 < $decreases_level ==>
true
&& ($phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg(#s, SP#hd, SP#tl))
&& ($is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> F#dll_lseg(#s, SP#hd, SP#tl) == F#dll(#s, $phys_ptr_cast(SP#hd, ^d_node)))
);

/*
   lseg(x,y) ==> disjoint( lseg_reach(x,y), singleton(y) )
*/
axiom (forall #s: $state, SP#x: $ptr, SP#y: $ptr ::
{ F#dll_lseg(#s, SP#x, SP#y) }
( true
&& F#dll_lseg(#s, SP#x, SP#y)
) ==> ( true
&& $oset_disjoint( F#dll_lseg_reach(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)), $oset_singleton($phys_ptr_cast(SP#y, ^d_node)) )
));

/*
   lseg(x,y) && list(y)
// && lseg_keys(x,y) <= list_keys(y)
   ==>
   list(x) &&
   list_reach(x) == union( lseg_reach(x,y), list_reach(y) )
// list_keys(x)  == union( lseg_keys(x,y),  list_keys(y) )
// list_len(x)   == lseg_len(x,y) + list_len(y)
*/
axiom (forall #s: $state, SP#x: $ptr, SP#y: $ptr ::
{ F#dll_lseg(#s, SP#x, SP#y) }
( true
&& F#dll_lseg(#s, SP#x, SP#y)
&& F#dll(#s, $phys_ptr_cast(SP#y, ^d_node))
) ==> ( true
&& F#dll(#s, $phys_ptr_cast(SP#x, ^d_node))
&& F#dll_reach(#s, $phys_ptr_cast(SP#x, ^d_node))
   == $oset_union(F#dll_lseg_reach(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)), F#dll_reach(#s, $phys_ptr_cast(SP#y, ^d_node)))
));

/*
   lseg(x,y) && y != null
   && y->next != y && y->next != x && y->next \not\in lseg_reach(x,y)
   && y->next != null ==> y->next->prev == y
// && lseg_keys(x,y) <= singleton(y)
   ==>
   lseg(x,y->next) &&
   lseg_reach(x,y->next) == union( lseg_reach(x,y), singleton(y) )
// lseg_keys(x,y->next)  == union( lseg_keys(x,y),  singleton(y->key) )
// lseg_len(x,y->next)   == lseg_len(x,y) + 1
*/
axiom (forall #s: $state, SP#x: $ptr, SP#y: $ptr ::
{ F#dll_lseg(#s, SP#x, SP#y) }
( true
&& F#dll_lseg(#s, SP#x, SP#y)
&& $non_null($phys_ptr_cast(SP#y, ^d_node))
&& $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node) != $phys_ptr_cast(SP#x, ^d_node)
&& $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node) != $phys_ptr_cast(SP#y, ^d_node)
&& !$oset_in($rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node), F#dll_lseg_reach(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)))
&& ( $non_null($rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node))
     ==> ($rd_phys_ptr(#s, d_node.prev, $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SP#y, ^d_node)))
) ==> ( true
&& F#dll_lseg(#s, $phys_ptr_cast(SP#x, ^d_node), $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node))
&& F#dll_lseg_reach(#s, $phys_ptr_cast(SP#x, ^d_node), $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node))
   == $oset_union(F#dll_lseg_reach(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)), $oset_singleton($phys_ptr_cast(SP#y, ^d_node)))
));


axiom $function_arg_type(cf#dll_lseg, 0, ^^bool);

axiom $function_arg_type(cf#dll_lseg, 1, $ptr_to(^d_node));

axiom $function_arg_type(cf#dll_lseg, 2, $ptr_to(^d_node));

procedure dll_lseg(SP#hd: $ptr, SP#tl: $ptr) returns ($result: bool);
  ensures $phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> $result;
  ensures $is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> $result == F#dll($s, $phys_ptr_cast(SP#hd, ^d_node));
  free ensures $result == F#dll_lseg($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#dll_lseg_reach(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : $oset;

const unique cf#dll_lseg_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#dll_lseg_reach(#s, SP#hd, SP#tl) } 1 < $decreases_level ==>
true
&& ($phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg_reach(#s, SP#hd, SP#tl) == $oset_empty())
&& ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node)
   ==> $oset_in($phys_ptr_cast(SP#hd, ^d_node), F#dll_lseg_reach(#s, SP#hd, SP#tl)))
&& ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $is_null($phys_ptr_cast(SP#tl, ^d_node))
   ==> F#dll_lseg_reach(#s, SP#hd, SP#tl) == F#dll_reach(#s, $phys_ptr_cast(SP#hd, ^d_node)))
);

axiom $function_arg_type(cf#dll_lseg_reach, 0, ^$#oset);

axiom $function_arg_type(cf#dll_lseg_reach, 1, $ptr_to(^d_node));

axiom $function_arg_type(cf#dll_lseg_reach, 2, $ptr_to(^d_node));

procedure dll_lseg_reach(SP#hd: $ptr, SP#tl: $ptr) returns ($result: $oset);
  ensures $phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> $result == $oset_empty();
  ensures $non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $oset_in($phys_ptr_cast(SP#hd, ^d_node), $result);
  ensures $non_null($phys_ptr_cast(SP#hd, ^d_node)) && $is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> $result == F#dll_reach($s, $phys_ptr_cast(SP#hd, ^d_node));
  free ensures $result == F#dll_lseg_reach($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



procedure dl_reverse(P#lst: $ptr) returns ($result: $ptr);
  requires F#dll($s, $phys_ptr_cast(P#lst, ^d_node));
  modifies $s, $cev_pc;
  ensures F#dll($s, $phys_ptr_cast($result, ^d_node));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation dl_reverse(P#lst: $ptr) returns ($result: $ptr)
{
  var stmtexpr1#3: $state;
  var SL#_dryad_S3: $state;
  var stmtexpr0#2: $state;
  var SL#_dryad_S2: $state;
  var stmtexpr2#6: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr1#5: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr0#4: $ptr;
  var SL#curr0: $ptr;
  var L#tmp: $ptr;
  var loopState#29: $state;
  var L#curr: $ptr;
  var L#rev: $ptr;
  var stmtexpr1#8: $oset;
  var stmtexpr0#7: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$3^3.3: int;
  var #stackframe: int;
  
// INV:PTR: P#lst, L#curr, L#rev
// INV:INT: 
// INV:LST: dll
// INV:OLD: loopState#29

  anon263:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$3^3.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$3^3.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$3^3.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := dll_reach(lst); 
    call SL#_dryad_G0 := dll_reach($phys_ptr_cast(P#lst, ^d_node));
    assume $full_stop_ext(#tok$4^0.0, $s);
    // _math \oset stmtexpr0#7; 
    // stmtexpr0#7 := _dryad_G0; 
    stmtexpr0#7 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#8; 
    // stmtexpr1#8 := _dryad_G1; 
    stmtexpr1#8 := SL#_dryad_G1;
    // assume ==(glob_reach(), _dryad_G1); 
    assume F#glob_reach() == SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll(lst), &&(&&(dll(*((lst->next))), ==>(@_vcc_ptr_neq_null(*((lst->next))), @_vcc_ptr_eq_pure(*((*((lst->next))->prev)), lst))), unchecked!(@_vcc_oset_in(lst, dll_reach(*((lst->next)))))))); 
    assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#lst, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll_reach(lst), @_vcc_oset_union(dll_reach(*((lst->next))), @_vcc_oset_singleton(lst)))); 
    assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#lst, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
    // struct d_node* rev; 
    // struct d_node* curr; 
    // assume ==>(@_vcc_ptr_neq_null(lst), &&(@_vcc_mutable(@state, lst), @writes_check(lst))); 
    assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> $mutable($s, $phys_ptr_cast(P#lst, ^d_node)) && $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(P#lst, ^d_node));
    // curr := lst; 
    L#curr := $phys_ptr_cast(P#lst, ^d_node);
    // assert dll_lseg(curr, curr); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assume dll_lseg(curr, curr); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assert dll_lseg(rev, rev); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#rev, ^d_node), $phys_ptr_cast(L#rev, ^d_node));
    // assume dll_lseg(rev, rev); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#rev, ^d_node), $phys_ptr_cast(L#rev, ^d_node));
    // assert dll_lseg(lst, lst); 
    assert F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(P#lst, ^d_node));
    // assume dll_lseg(lst, lst); 
    assume F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(P#lst, ^d_node));
    // rev := (struct d_node*)@null; 
    L#rev := $phys_ptr_cast($null, ^d_node);
    // assert dll_lseg(curr, curr); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assume dll_lseg(curr, curr); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assert dll_lseg(rev, rev); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#rev, ^d_node), $phys_ptr_cast(L#rev, ^d_node));
    // assume dll_lseg(rev, rev); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#rev, ^d_node), $phys_ptr_cast(L#rev, ^d_node));
    // assert dll_lseg(lst, lst); 
    assert F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(P#lst, ^d_node));
    // assume dll_lseg(lst, lst); 
    assume F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(P#lst, ^d_node));
    // assume ==>(@_vcc_ptr_neq_null(rev), ==(dll(rev), &&(&&(dll(*((rev->next))), ==>(@_vcc_ptr_neq_null(*((rev->next))), @_vcc_ptr_eq_pure(*((*((rev->next))->prev)), rev))), unchecked!(@_vcc_oset_in(rev, dll_reach(*((rev->next)))))))); 
    assume $non_null($phys_ptr_cast(L#rev, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#rev, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#rev, ^d_node)) && !$oset_in($phys_ptr_cast(L#rev, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(rev), ==(dll_reach(rev), @_vcc_oset_union(dll_reach(*((rev->next))), @_vcc_oset_singleton(rev)))); 
    assume $non_null($phys_ptr_cast(L#rev, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#rev, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#rev, ^d_node)));
    loopState#29 := $s;
    assume true;

// INV:LOOPHEAD

    while (true)
	
invariant b0000 ==> (F#dll($s,$phys_ptr_cast(P#lst,^d_node)));
invariant b0001 ==> (F#dll($s,$phys_ptr_cast(L#curr,^d_node)));
invariant b0002 ==> (F#dll($s,$phys_ptr_cast(L#rev,^d_node)));
invariant b0003 ==> (F#dll_lseg($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node)));
invariant b0004 ==> (F#dll_lseg($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node)));
invariant b0005 ==> (F#dll_lseg($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node)));
invariant b0006 ==> (F#dll_lseg($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node)));
invariant b0007 ==> (F#dll_lseg($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node)));
invariant b0008 ==> (F#dll_lseg($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node)));
invariant b0009 ==> ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
invariant b0010 ==> ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
invariant b0011 ==> ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
invariant b0012 ==> ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
invariant b0013 ==> ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
invariant b0014 ==> ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
invariant b0015 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
invariant b0016 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
invariant b0017 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
invariant b0018 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
invariant b0019 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
invariant b0020 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
invariant b0021 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
invariant b0022 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
invariant b0023 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
invariant b0024 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
invariant b0025 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
invariant b0026 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
invariant b0027 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
invariant b0028 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
invariant b0029 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
invariant b0030 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
invariant b0031 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
invariant b0032 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
invariant b0033 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node))));
invariant b0034 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node))));
invariant b0035 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node))));
invariant b0036 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node))));
invariant b0037 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node))));
invariant b0038 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node))));
invariant b0039 ==> ($non_null($phys_ptr_cast(P#lst,^d_node)));
invariant b0040 ==> ($non_null($phys_ptr_cast(L#curr,^d_node)));
invariant b0041 ==> ($non_null($phys_ptr_cast(L#rev,^d_node)));
invariant b0042 ==> ($is_null($phys_ptr_cast(P#lst,^d_node)));
invariant b0043 ==> ($is_null($phys_ptr_cast(L#curr,^d_node)));
invariant b0044 ==> ($is_null($phys_ptr_cast(L#rev,^d_node)));
invariant b0045 ==> (($phys_ptr_cast(P#lst,^d_node) == $phys_ptr_cast(L#curr,^d_node)));
invariant b0046 ==> (($phys_ptr_cast(P#lst,^d_node) == $phys_ptr_cast(L#rev,^d_node)));
invariant b0047 ==> (($phys_ptr_cast(L#curr,^d_node) == $phys_ptr_cast(P#lst,^d_node)));
invariant b0048 ==> (($phys_ptr_cast(L#curr,^d_node) == $phys_ptr_cast(L#rev,^d_node)));
invariant b0049 ==> (($phys_ptr_cast(L#rev,^d_node) == $phys_ptr_cast(P#lst,^d_node)));
invariant b0050 ==> (($phys_ptr_cast(L#rev,^d_node) == $phys_ptr_cast(L#curr,^d_node)));
invariant b0051 ==> (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node))));
invariant b0052 ==> (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node))));
invariant b0053 ==> (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node))));
invariant b0054 ==> (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node))));
invariant b0055 ==> (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node))));
invariant b0056 ==> (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node))));
invariant b0057 ==> (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node) == $phys_ptr_cast(L#curr,^d_node))));
invariant b0058 ==> (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node) == $phys_ptr_cast(L#rev,^d_node))));
invariant b0059 ==> (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node) == $phys_ptr_cast(P#lst,^d_node))));
invariant b0060 ==> (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node) == $phys_ptr_cast(L#rev,^d_node))));
invariant b0061 ==> (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node) == $phys_ptr_cast(P#lst,^d_node))));
invariant b0062 ==> (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node) == $phys_ptr_cast(L#curr,^d_node))));

    
	  invariant $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^d_node));
      invariant $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(L#curr, ^d_node));
    {
      anon262:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#29, $s);
        assume $full_stop_ext(#tok$3^11.3, $s);
        // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
        assume $meta_eq(loopState#29, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(curr)) ...
        if ($non_null($phys_ptr_cast(L#curr, ^d_node)))
        {
          anon259:
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(rev), ==(dll(rev), &&(&&(dll(*((rev->next))), ==>(@_vcc_ptr_neq_null(*((rev->next))), @_vcc_ptr_eq_pure(*((*((rev->next))->prev)), rev))), unchecked!(@_vcc_oset_in(rev, dll_reach(*((rev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#rev, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#rev, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#rev, ^d_node)) && !$oset_in($phys_ptr_cast(L#rev, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(rev), ==(dll_reach(rev), @_vcc_oset_union(dll_reach(*((rev->next))), @_vcc_oset_singleton(rev)))); 
            assume $non_null($phys_ptr_cast(L#rev, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#rev, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#rev, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll(lst), &&(&&(dll(*((lst->next))), ==>(@_vcc_ptr_neq_null(*((lst->next))), @_vcc_ptr_eq_pure(*((*((lst->next))->prev)), lst))), unchecked!(@_vcc_oset_in(lst, dll_reach(*((lst->next)))))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#lst, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll_reach(lst), @_vcc_oset_union(dll_reach(*((lst->next))), @_vcc_oset_singleton(lst)))); 
            assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#lst, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
            // struct d_node* tmp; 
            // var struct d_node* tmp
            // tmp := curr; 
            L#tmp := $phys_ptr_cast(L#curr, ^d_node);
            // assert dll_lseg(tmp, tmp); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#tmp, ^d_node), $phys_ptr_cast(L#tmp, ^d_node));
            // assume dll_lseg(tmp, tmp); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#tmp, ^d_node), $phys_ptr_cast(L#tmp, ^d_node));
            // assert dll_lseg(curr, curr); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assume dll_lseg(curr, curr); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assert dll_lseg(rev, rev); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#rev, ^d_node), $phys_ptr_cast(L#rev, ^d_node));
            // assume dll_lseg(rev, rev); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#rev, ^d_node), $phys_ptr_cast(L#rev, ^d_node));
            // assert dll_lseg(lst, lst); 
            assert F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(P#lst, ^d_node));
            // assume dll_lseg(lst, lst); 
            assume F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(P#lst, ^d_node));
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
            // assume ==>(@_vcc_ptr_neq_null(curr), &&(@_vcc_mutable(@state, curr), @writes_check(curr))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^d_node)) && $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(L#curr, ^d_node));
            // _math \state _dryad_S0; 
            // _dryad_S0 := @_vcc_current_state(@state); 
            SL#_dryad_S0 := $current_state($s);
            // _math \state stmtexpr1#5; 
            // stmtexpr1#5 := _dryad_S0; 
            stmtexpr1#5 := SL#_dryad_S0;
            // assert @prim_writes_check((tmp->next)); 
            assert $writable_prim($s, #wrTime$3^3.3, $dot($phys_ptr_cast(L#tmp, ^d_node), d_node.next));
            // *(tmp->next) := rev; 
            call $write_int(d_node.next, $phys_ptr_cast(L#tmp, ^d_node), $ptr_to_int($phys_ptr_cast(L#rev, ^d_node)));
            assume $full_stop_ext(#tok$3^21.5, $s);
            // _math \state _dryad_S1; 
            // _dryad_S1 := @_vcc_current_state(@state); 
            SL#_dryad_S1 := $current_state($s);
            // _math \state stmtexpr2#6; 
            // stmtexpr2#6 := _dryad_S1; 
            stmtexpr2#6 := SL#_dryad_S1;
            // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0, dll_reach(*((tmp->prev)))))), ==(old(_dryad_S0, dll(*((tmp->prev)))), old(_dryad_S1, dll(*((tmp->prev)))))); 
            assume !$oset_in($phys_ptr_cast(L#tmp, ^d_node), F#dll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#tmp, ^d_node), ^d_node))) ==> F#dll(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#tmp, ^d_node), ^d_node)) == F#dll(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, d_node.prev, $phys_ptr_cast(L#tmp, ^d_node), ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0, dll_reach(*((tmp->prev)))))), ==(old(_dryad_S0, dll_reach(*((tmp->prev)))), old(_dryad_S1, dll_reach(*((tmp->prev)))))); 
            assume !$oset_in($phys_ptr_cast(L#tmp, ^d_node), F#dll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#tmp, ^d_node), ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#tmp, ^d_node), ^d_node)) == F#dll_reach(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, d_node.prev, $phys_ptr_cast(L#tmp, ^d_node), ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0, dll_reach(curr0)))), ==(old(_dryad_S0, dll(curr0)), old(_dryad_S1, dll(curr0)))); 
            assume !$oset_in($phys_ptr_cast(L#tmp, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(SL#curr0, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0, dll_reach(curr0)))), ==(old(_dryad_S0, dll_reach(curr0)), old(_dryad_S1, dll_reach(curr0)))); 
            assume !$oset_in($phys_ptr_cast(L#tmp, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(SL#curr0, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0, dll_reach(curr)))), ==(old(_dryad_S0, dll(curr)), old(_dryad_S1, dll(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#tmp, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0, dll_reach(curr)))), ==(old(_dryad_S0, dll_reach(curr)), old(_dryad_S1, dll_reach(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#tmp, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0, dll_reach(rev)))), ==(old(_dryad_S0, dll(rev)), old(_dryad_S1, dll(rev)))); 
            assume !$oset_in($phys_ptr_cast(L#tmp, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#rev, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(L#rev, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(L#rev, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0, dll_reach(rev)))), ==(old(_dryad_S0, dll_reach(rev)), old(_dryad_S1, dll_reach(rev)))); 
            assume !$oset_in($phys_ptr_cast(L#tmp, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#rev, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#rev, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(L#rev, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0, dll_reach(lst)))), ==(old(_dryad_S0, dll(lst)), old(_dryad_S1, dll(lst)))); 
            assume !$oset_in($phys_ptr_cast(L#tmp, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(P#lst, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0, dll_reach(lst)))), ==(old(_dryad_S0, dll_reach(lst)), old(_dryad_S1, dll_reach(lst)))); 
            assume !$oset_in($phys_ptr_cast(L#tmp, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#lst, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(P#lst, ^d_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(tmp, curr0)), @_vcc_ptr_eq_pure(*((curr0->prev)), old(_dryad_S0, *((curr0->prev))))); 
            assume !($phys_ptr_cast(L#tmp, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(tmp, curr0)), @_vcc_ptr_eq_pure(*((curr0->next)), old(_dryad_S0, *((curr0->next))))); 
            assume !($phys_ptr_cast(L#tmp, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(tmp, curr)), @_vcc_ptr_eq_pure(*((curr->prev)), old(_dryad_S0, *((curr->prev))))); 
            assume !($phys_ptr_cast(L#tmp, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(tmp, curr)), @_vcc_ptr_eq_pure(*((curr->next)), old(_dryad_S0, *((curr->next))))); 
            assume !($phys_ptr_cast(L#tmp, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(tmp, rev)), @_vcc_ptr_eq_pure(*((rev->prev)), old(_dryad_S0, *((rev->prev))))); 
            assume !($phys_ptr_cast(L#tmp, ^d_node) == $phys_ptr_cast(L#rev, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#rev, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#rev, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(tmp, rev)), @_vcc_ptr_eq_pure(*((rev->next)), old(_dryad_S0, *((rev->next))))); 
            assume !($phys_ptr_cast(L#tmp, ^d_node) == $phys_ptr_cast(L#rev, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(tmp, lst)), @_vcc_ptr_eq_pure(*((lst->prev)), old(_dryad_S0, *((lst->prev))))); 
            assume !($phys_ptr_cast(L#tmp, ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(P#lst, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(P#lst, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(tmp, lst)), @_vcc_ptr_eq_pure(*((lst->next)), old(_dryad_S0, *((lst->next))))); 
            assume !($phys_ptr_cast(L#tmp, ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node);
            // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll(curr0), &&(&&(dll(*((curr0->next))), ==>(@_vcc_ptr_neq_null(*((curr0->next))), @_vcc_ptr_eq_pure(*((*((curr0->next))->prev)), curr0))), unchecked!(@_vcc_oset_in(curr0, dll_reach(*((curr0->next)))))))); 
            assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll($s, $phys_ptr_cast(SL#curr0, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) && !$oset_in($phys_ptr_cast(SL#curr0, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll_reach(curr0), @_vcc_oset_union(dll_reach(*((curr0->next))), @_vcc_oset_singleton(curr0)))); 
            assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(SL#curr0, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(SL#curr0, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(rev), ==(dll(rev), &&(&&(dll(*((rev->next))), ==>(@_vcc_ptr_neq_null(*((rev->next))), @_vcc_ptr_eq_pure(*((*((rev->next))->prev)), rev))), unchecked!(@_vcc_oset_in(rev, dll_reach(*((rev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#rev, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#rev, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#rev, ^d_node)) && !$oset_in($phys_ptr_cast(L#rev, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(rev), ==(dll_reach(rev), @_vcc_oset_union(dll_reach(*((rev->next))), @_vcc_oset_singleton(rev)))); 
            assume $non_null($phys_ptr_cast(L#rev, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#rev, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#rev, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll(lst), &&(&&(dll(*((lst->next))), ==>(@_vcc_ptr_neq_null(*((lst->next))), @_vcc_ptr_eq_pure(*((*((lst->next))->prev)), lst))), unchecked!(@_vcc_oset_in(lst, dll_reach(*((lst->next)))))))); 
            assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#lst, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll_reach(lst), @_vcc_oset_union(dll_reach(*((lst->next))), @_vcc_oset_singleton(lst)))); 
            assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#lst, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(tmp), ==(dll(tmp), &&(&&(dll(*((tmp->next))), ==>(@_vcc_ptr_neq_null(*((tmp->next))), @_vcc_ptr_eq_pure(*((*((tmp->next))->prev)), tmp))), unchecked!(@_vcc_oset_in(tmp, dll_reach(*((tmp->next)))))))); 
            assume $non_null($phys_ptr_cast(L#tmp, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#tmp, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#tmp, ^d_node)) && !$oset_in($phys_ptr_cast(L#tmp, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(tmp), ==(dll_reach(tmp), @_vcc_oset_union(dll_reach(*((tmp->next))), @_vcc_oset_singleton(tmp)))); 
            assume $non_null($phys_ptr_cast(L#tmp, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#tmp, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#tmp, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(rev), ==(dll(rev), &&(&&(dll(*((rev->next))), ==>(@_vcc_ptr_neq_null(*((rev->next))), @_vcc_ptr_eq_pure(*((*((rev->next))->prev)), rev))), unchecked!(@_vcc_oset_in(rev, dll_reach(*((rev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#rev, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#rev, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#rev, ^d_node)) && !$oset_in($phys_ptr_cast(L#rev, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(rev), ==(dll_reach(rev), @_vcc_oset_union(dll_reach(*((rev->next))), @_vcc_oset_singleton(rev)))); 
            assume $non_null($phys_ptr_cast(L#rev, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#rev, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#rev, ^d_node)));
            assume true;
            // if (@_vcc_ptr_neq_null(rev)) ...
            if ($non_null($phys_ptr_cast(L#rev, ^d_node)))
            {
              anon257:
                // _math \state _dryad_S2; 
                // _dryad_S2 := @_vcc_current_state(@state); 
                SL#_dryad_S2 := $current_state($s);
                // _math \state stmtexpr0#2; 
                // stmtexpr0#2 := _dryad_S2; 
                stmtexpr0#2 := SL#_dryad_S2;
                // assert @prim_writes_check((rev->prev)); 
                assert $writable_prim($s, #wrTime$3^3.3, $dot($phys_ptr_cast(L#rev, ^d_node), d_node.prev));
                // *(rev->prev) := tmp; 
                call $write_int(d_node.prev, $phys_ptr_cast(L#rev, ^d_node), $ptr_to_int($phys_ptr_cast(L#tmp, ^d_node)));
                assume $full_stop_ext(#tok$3^23.7, $s);
                // _math \state _dryad_S3; 
                // _dryad_S3 := @_vcc_current_state(@state); 
                SL#_dryad_S3 := $current_state($s);
                // _math \state stmtexpr1#3; 
                // stmtexpr1#3 := _dryad_S3; 
                stmtexpr1#3 := SL#_dryad_S3;
                // assume ==>(unchecked!(@_vcc_oset_in(rev, old(_dryad_S2, dll_reach(*((rev->next)))))), ==(old(_dryad_S2, dll(*((rev->next)))), old(_dryad_S3, dll(*((rev->next)))))); 
                assume !$oset_in($phys_ptr_cast(L#rev, ^d_node), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node))) ==> F#dll(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)) == F#dll(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(rev, old(_dryad_S2, dll_reach(*((rev->next)))))), ==(old(_dryad_S2, dll_reach(*((rev->next)))), old(_dryad_S3, dll_reach(*((rev->next)))))); 
                assume !$oset_in($phys_ptr_cast(L#rev, ^d_node), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)) == F#dll_reach(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node));
                // assume ==(old(_dryad_S2, dll(rev)), old(_dryad_S3, dll(rev))); 
                assume F#dll(SL#_dryad_S2, $phys_ptr_cast(L#rev, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(L#rev, ^d_node));
                // assume ==(old(_dryad_S2, dll_reach(rev)), old(_dryad_S3, dll_reach(rev))); 
                assume F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#rev, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(L#rev, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(rev, old(_dryad_S2, dll_reach(curr0)))), ==(old(_dryad_S2, dll(curr0)), old(_dryad_S3, dll(curr0)))); 
                assume !$oset_in($phys_ptr_cast(L#rev, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(SL#curr0, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(rev, old(_dryad_S2, dll_reach(curr0)))), ==(old(_dryad_S2, dll_reach(curr0)), old(_dryad_S3, dll_reach(curr0)))); 
                assume !$oset_in($phys_ptr_cast(L#rev, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(SL#curr0, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(rev, old(_dryad_S2, dll_reach(tmp)))), ==(old(_dryad_S2, dll(tmp)), old(_dryad_S3, dll(tmp)))); 
                assume !$oset_in($phys_ptr_cast(L#rev, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tmp, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(L#tmp, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(L#tmp, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(rev, old(_dryad_S2, dll_reach(tmp)))), ==(old(_dryad_S2, dll_reach(tmp)), old(_dryad_S3, dll_reach(tmp)))); 
                assume !$oset_in($phys_ptr_cast(L#rev, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tmp, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tmp, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(L#tmp, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(rev, old(_dryad_S2, dll_reach(curr)))), ==(old(_dryad_S2, dll(curr)), old(_dryad_S3, dll(curr)))); 
                assume !$oset_in($phys_ptr_cast(L#rev, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(L#curr, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(rev, old(_dryad_S2, dll_reach(curr)))), ==(old(_dryad_S2, dll_reach(curr)), old(_dryad_S3, dll_reach(curr)))); 
                assume !$oset_in($phys_ptr_cast(L#rev, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(L#curr, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(rev, old(_dryad_S2, dll_reach(lst)))), ==(old(_dryad_S2, dll(lst)), old(_dryad_S3, dll(lst)))); 
                assume !$oset_in($phys_ptr_cast(L#rev, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(P#lst, ^d_node));
                // assume ==>(unchecked!(@_vcc_oset_in(rev, old(_dryad_S2, dll_reach(lst)))), ==(old(_dryad_S2, dll_reach(lst)), old(_dryad_S3, dll_reach(lst)))); 
                assume !$oset_in($phys_ptr_cast(L#rev, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#lst, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(P#lst, ^d_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(rev, curr0)), @_vcc_ptr_eq_pure(*((curr0->prev)), old(_dryad_S2, *((curr0->prev))))); 
                assume !($phys_ptr_cast(L#rev, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(rev, curr0)), @_vcc_ptr_eq_pure(*((curr0->next)), old(_dryad_S2, *((curr0->next))))); 
                assume !($phys_ptr_cast(L#rev, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(rev, tmp)), @_vcc_ptr_eq_pure(*((tmp->prev)), old(_dryad_S2, *((tmp->prev))))); 
                assume !($phys_ptr_cast(L#rev, ^d_node) == $phys_ptr_cast(L#tmp, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#tmp, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(L#tmp, ^d_node), ^d_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(rev, tmp)), @_vcc_ptr_eq_pure(*((tmp->next)), old(_dryad_S2, *((tmp->next))))); 
                assume !($phys_ptr_cast(L#rev, ^d_node) == $phys_ptr_cast(L#tmp, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(rev, curr)), @_vcc_ptr_eq_pure(*((curr->prev)), old(_dryad_S2, *((curr->prev))))); 
                assume !($phys_ptr_cast(L#rev, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(rev, curr)), @_vcc_ptr_eq_pure(*((curr->next)), old(_dryad_S2, *((curr->next))))); 
                assume !($phys_ptr_cast(L#rev, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(rev, lst)), @_vcc_ptr_eq_pure(*((lst->prev)), old(_dryad_S2, *((lst->prev))))); 
                assume !($phys_ptr_cast(L#rev, ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(P#lst, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(P#lst, ^d_node), ^d_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(rev, lst)), @_vcc_ptr_eq_pure(*((lst->next)), old(_dryad_S2, *((lst->next))))); 
                assume !($phys_ptr_cast(L#rev, ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node);
                // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll(curr0), &&(&&(dll(*((curr0->next))), ==>(@_vcc_ptr_neq_null(*((curr0->next))), @_vcc_ptr_eq_pure(*((*((curr0->next))->prev)), curr0))), unchecked!(@_vcc_oset_in(curr0, dll_reach(*((curr0->next)))))))); 
                assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll($s, $phys_ptr_cast(SL#curr0, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) && !$oset_in($phys_ptr_cast(SL#curr0, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll_reach(curr0), @_vcc_oset_union(dll_reach(*((curr0->next))), @_vcc_oset_singleton(curr0)))); 
                assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(SL#curr0, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(SL#curr0, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(dll(tmp), &&(&&(dll(*((tmp->next))), ==>(@_vcc_ptr_neq_null(*((tmp->next))), @_vcc_ptr_eq_pure(*((*((tmp->next))->prev)), tmp))), unchecked!(@_vcc_oset_in(tmp, dll_reach(*((tmp->next)))))))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#tmp, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#tmp, ^d_node)) && !$oset_in($phys_ptr_cast(L#tmp, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(dll_reach(tmp), @_vcc_oset_union(dll_reach(*((tmp->next))), @_vcc_oset_singleton(tmp)))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#tmp, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#tmp, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll(lst), &&(&&(dll(*((lst->next))), ==>(@_vcc_ptr_neq_null(*((lst->next))), @_vcc_ptr_eq_pure(*((*((lst->next))->prev)), lst))), unchecked!(@_vcc_oset_in(lst, dll_reach(*((lst->next)))))))); 
                assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#lst, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll_reach(lst), @_vcc_oset_union(dll_reach(*((lst->next))), @_vcc_oset_singleton(lst)))); 
                assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#lst, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(dll(tmp), &&(&&(dll(*((tmp->next))), ==>(@_vcc_ptr_neq_null(*((tmp->next))), @_vcc_ptr_eq_pure(*((*((tmp->next))->prev)), tmp))), unchecked!(@_vcc_oset_in(tmp, dll_reach(*((tmp->next)))))))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#tmp, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#tmp, ^d_node)) && !$oset_in($phys_ptr_cast(L#tmp, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(dll_reach(tmp), @_vcc_oset_union(dll_reach(*((tmp->next))), @_vcc_oset_singleton(tmp)))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#tmp, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#tmp, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#tmp, ^d_node)));
            }
            else
            {
              anon258:
                // assert @_vcc_possibly_unreachable; 
                assert {:PossiblyUnreachable true} true;
            }

          anon260:
            // rev := tmp; 
            L#rev := $phys_ptr_cast(L#tmp, ^d_node);
            // assert dll_lseg(curr0, curr0); 
            assert F#dll_lseg($s, $phys_ptr_cast(SL#curr0, ^d_node), $phys_ptr_cast(SL#curr0, ^d_node));
            // assume dll_lseg(curr0, curr0); 
            assume F#dll_lseg($s, $phys_ptr_cast(SL#curr0, ^d_node), $phys_ptr_cast(SL#curr0, ^d_node));
            // assert dll_lseg(tmp, tmp); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#tmp, ^d_node), $phys_ptr_cast(L#tmp, ^d_node));
            // assume dll_lseg(tmp, tmp); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#tmp, ^d_node), $phys_ptr_cast(L#tmp, ^d_node));
            // assert dll_lseg(curr, curr); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assume dll_lseg(curr, curr); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assert dll_lseg(rev, rev); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#rev, ^d_node), $phys_ptr_cast(L#rev, ^d_node));
            // assume dll_lseg(rev, rev); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#rev, ^d_node), $phys_ptr_cast(L#rev, ^d_node));
            // assert dll_lseg(lst, lst); 
            assert F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(P#lst, ^d_node));
            // assume dll_lseg(lst, lst); 
            assume F#dll_lseg($s, $phys_ptr_cast(P#lst, ^d_node), $phys_ptr_cast(P#lst, ^d_node));
        }
        else
        {
          anon261:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // goto #break_1; 
            goto #break_1;
        }

      #continue_1:
        assume true;
		
// INV:LOOPTAIL
    }

  anon264:
    assume $full_stop_ext(#tok$3^11.3, $s);

  #break_1:
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(rev), ==(dll(rev), &&(&&(dll(*((rev->next))), ==>(@_vcc_ptr_neq_null(*((rev->next))), @_vcc_ptr_eq_pure(*((*((rev->next))->prev)), rev))), unchecked!(@_vcc_oset_in(rev, dll_reach(*((rev->next)))))))); 
    assume $non_null($phys_ptr_cast(L#rev, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#rev, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#rev, ^d_node)) && !$oset_in($phys_ptr_cast(L#rev, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(rev), ==(dll_reach(rev), @_vcc_oset_union(dll_reach(*((rev->next))), @_vcc_oset_singleton(rev)))); 
    assume $non_null($phys_ptr_cast(L#rev, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#rev, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#rev, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#rev, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll(lst), &&(&&(dll(*((lst->next))), ==>(@_vcc_ptr_neq_null(*((lst->next))), @_vcc_ptr_eq_pure(*((*((lst->next))->prev)), lst))), unchecked!(@_vcc_oset_in(lst, dll_reach(*((lst->next)))))))); 
    assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#lst, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#lst, ^d_node)) && !$oset_in($phys_ptr_cast(P#lst, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(lst), ==(dll_reach(lst), @_vcc_oset_union(dll_reach(*((lst->next))), @_vcc_oset_singleton(lst)))); 
    assume $non_null($phys_ptr_cast(P#lst, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#lst, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#lst, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#lst, ^d_node)));
    // return rev; 
    $result := $phys_ptr_cast(L#rev, ^d_node);
    assume true;
    assert $position_marker();
    goto #exit;

  anon265:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$3^23.7: $token;

const unique #tok$3^21.5: $token;

const unique #tok$3^11.3: $token;

const unique #tok$4^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(4, #file^?3Cno?20file?3E);

const unique #tok$3^3.3: $token;

const unique #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad_Bin?5CTests?5Cgrass?5Cdl_reverse.c: $token;

axiom $file_name_is(3, #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad_Bin?5CTests?5Cgrass?5Cdl_reverse.c);

const unique #file^c?3A?5Cusers?5Cdaniel?5Cworkspace?5Cvcdryad_bin?5Ctests?5Cgrass?5Cdryad_dl.h: $token;

axiom $file_name_is(2, #file^c?3A?5Cusers?5Cdaniel?5Cworkspace?5Cvcdryad_bin?5Ctests?5Cgrass?5Cdryad_dl.h);

const unique #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad?5Cvcc?5CHost?5Cbin?5CHeaders?5Cvccp.h: $token;

axiom $file_name_is(1, #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad?5Cvcc?5CHost?5Cbin?5CHeaders?5Cvccp.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^d_node);

