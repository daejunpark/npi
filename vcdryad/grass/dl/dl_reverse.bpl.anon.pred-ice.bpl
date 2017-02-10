
function {:existential true} my_inv (
b0000 : bool,
b0001 : bool,
b0002 : bool,
b0003 : bool,
b0004 : bool,
b0005 : bool,
b0006 : bool,
b0007 : bool,
b0008 : bool,
b0009 : bool,
b0010 : bool,
b0011 : bool,
b0012 : bool,
b0013 : bool,
b0014 : bool,
b0015 : bool,
b0016 : bool,
b0017 : bool,
b0018 : bool,
b0019 : bool,
b0020 : bool,
b0021 : bool,
b0022 : bool,
b0023 : bool,
b0024 : bool,
b0025 : bool,
b0026 : bool,
b0027 : bool,
b0028 : bool,
b0029 : bool,
b0030 : bool,
b0031 : bool,
b0032 : bool,
b0033 : bool,
b0034 : bool,
b0035 : bool,
b0036 : bool,
b0037 : bool,
b0038 : bool,
b0039 : bool,
b0040 : bool,
b0041 : bool,
b0042 : bool,
b0043 : bool,
b0044 : bool,
b0045 : bool,
b0046 : bool,
b0047 : bool,
b0048 : bool,
b0049 : bool,
b0050 : bool,
b0051 : bool,
b0052 : bool,
b0053 : bool,
b0054 : bool,
b0055 : bool,
b0056 : bool,
b0057 : bool,
b0058 : bool,
b0059 : bool,
b0060 : bool,
b0061 : bool,
b0062 : bool,
b0063 : bool
) : bool;

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
  

var p0000 : bool;
var p0001 : bool;
var p0002 : bool;
var p0003 : bool;
var p0004 : bool;
var p0005 : bool;
var p0006 : bool;
var p0007 : bool;
var p0008 : bool;
var p0009 : bool;
var p0010 : bool;
var p0011 : bool;
var p0012 : bool;
var p0013 : bool;
var p0014 : bool;
var p0015 : bool;
var p0016 : bool;
var p0017 : bool;
var p0018 : bool;
var p0019 : bool;
var p0020 : bool;
var p0021 : bool;
var p0022 : bool;
var p0023 : bool;
var p0024 : bool;
var p0025 : bool;
var p0026 : bool;
var p0027 : bool;
var p0028 : bool;
var p0029 : bool;
var p0030 : bool;
var p0031 : bool;
var p0032 : bool;
var p0033 : bool;
var p0034 : bool;
var p0035 : bool;
var p0036 : bool;
var p0037 : bool;
var p0038 : bool;
var p0039 : bool;
var p0040 : bool;
var p0041 : bool;
var p0042 : bool;
var p0043 : bool;
var p0044 : bool;
var p0045 : bool;
var p0046 : bool;
var p0047 : bool;
var p0048 : bool;
var p0049 : bool;
var p0050 : bool;
var p0051 : bool;
var p0052 : bool;
var p0053 : bool;
var p0054 : bool;
var p0055 : bool;
var p0056 : bool;
var p0057 : bool;
var p0058 : bool;
var p0059 : bool;
var p0060 : bool;
var p0061 : bool;
var p0062 : bool;

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

p0000 := (F#dll($s,$phys_ptr_cast(P#lst,^d_node)));
p0001 := (F#dll($s,$phys_ptr_cast(L#curr,^d_node)));
p0002 := (F#dll($s,$phys_ptr_cast(L#rev,^d_node)));
p0003 := (F#dll_lseg($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node)));
p0004 := (F#dll_lseg($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node)));
p0005 := (F#dll_lseg($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node)));
p0006 := (F#dll_lseg($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node)));
p0007 := (F#dll_lseg($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node)));
p0008 := (F#dll_lseg($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node)));
p0009 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0010 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0011 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0012 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0013 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0014 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0015 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0016 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0017 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0018 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0019 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0020 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0021 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0022 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0023 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0024 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0025 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0026 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0027 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0028 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0029 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0030 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0031 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0032 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0033 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node))));
p0034 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node))));
p0035 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node))));
p0036 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node))));
p0037 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node))));
p0038 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node))));
p0039 := ($non_null($phys_ptr_cast(P#lst,^d_node)));
p0040 := ($non_null($phys_ptr_cast(L#curr,^d_node)));
p0041 := ($non_null($phys_ptr_cast(L#rev,^d_node)));
p0042 := ($is_null($phys_ptr_cast(P#lst,^d_node)));
p0043 := ($is_null($phys_ptr_cast(L#curr,^d_node)));
p0044 := ($is_null($phys_ptr_cast(L#rev,^d_node)));
p0045 := (($phys_ptr_cast(P#lst,^d_node) == $phys_ptr_cast(L#curr,^d_node)));
p0046 := (($phys_ptr_cast(P#lst,^d_node) == $phys_ptr_cast(L#rev,^d_node)));
p0047 := (($phys_ptr_cast(L#curr,^d_node) == $phys_ptr_cast(P#lst,^d_node)));
p0048 := (($phys_ptr_cast(L#curr,^d_node) == $phys_ptr_cast(L#rev,^d_node)));
p0049 := (($phys_ptr_cast(L#rev,^d_node) == $phys_ptr_cast(P#lst,^d_node)));
p0050 := (($phys_ptr_cast(L#rev,^d_node) == $phys_ptr_cast(L#curr,^d_node)));
p0051 := (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node))));
p0052 := (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node))));
p0053 := (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node))));
p0054 := (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node))));
p0055 := (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node))));
p0056 := (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node))));
p0057 := (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node) == $phys_ptr_cast(L#curr,^d_node))));
p0058 := (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node) == $phys_ptr_cast(L#rev,^d_node))));
p0059 := (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node) == $phys_ptr_cast(P#lst,^d_node))));
p0060 := (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node) == $phys_ptr_cast(L#rev,^d_node))));
p0061 := (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node) == $phys_ptr_cast(P#lst,^d_node))));
p0062 := (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node) == $phys_ptr_cast(L#curr,^d_node))));


    while (true)
	

invariant (p0000 == (F#dll($s,$phys_ptr_cast(P#lst,^d_node))));
invariant (p0001 == (F#dll($s,$phys_ptr_cast(L#curr,^d_node))));
invariant (p0002 == (F#dll($s,$phys_ptr_cast(L#rev,^d_node))));
invariant (p0003 == (F#dll_lseg($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node))));
invariant (p0004 == (F#dll_lseg($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node))));
invariant (p0005 == (F#dll_lseg($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node))));
invariant (p0006 == (F#dll_lseg($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node))));
invariant (p0007 == (F#dll_lseg($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node))));
invariant (p0008 == (F#dll_lseg($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node))));
invariant (p0009 == ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)))));
invariant (p0010 == ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)))));
invariant (p0011 == ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)))));
invariant (p0012 == ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)))));
invariant (p0013 == ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)))));
invariant (p0014 == ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)))));
invariant (p0015 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)))));
invariant (p0016 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)))));
invariant (p0017 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)))));
invariant (p0018 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)))));
invariant (p0019 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)))));
invariant (p0020 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)))));
invariant (p0021 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)))));
invariant (p0022 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)))));
invariant (p0023 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)))));
invariant (p0024 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)))));
invariant (p0025 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)))));
invariant (p0026 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)))));
invariant (p0027 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)))));
invariant (p0028 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)))));
invariant (p0029 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)))));
invariant (p0030 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)))));
invariant (p0031 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)))));
invariant (p0032 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)))));
invariant (p0033 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node)))));
invariant (p0034 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node)))));
invariant (p0035 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node)))));
invariant (p0036 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node)))));
invariant (p0037 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node)))));
invariant (p0038 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node)))));
invariant (p0039 == ($non_null($phys_ptr_cast(P#lst,^d_node))));
invariant (p0040 == ($non_null($phys_ptr_cast(L#curr,^d_node))));
invariant (p0041 == ($non_null($phys_ptr_cast(L#rev,^d_node))));
invariant (p0042 == ($is_null($phys_ptr_cast(P#lst,^d_node))));
invariant (p0043 == ($is_null($phys_ptr_cast(L#curr,^d_node))));
invariant (p0044 == ($is_null($phys_ptr_cast(L#rev,^d_node))));
invariant (p0045 == (($phys_ptr_cast(P#lst,^d_node) == $phys_ptr_cast(L#curr,^d_node))));
invariant (p0046 == (($phys_ptr_cast(P#lst,^d_node) == $phys_ptr_cast(L#rev,^d_node))));
invariant (p0047 == (($phys_ptr_cast(L#curr,^d_node) == $phys_ptr_cast(P#lst,^d_node))));
invariant (p0048 == (($phys_ptr_cast(L#curr,^d_node) == $phys_ptr_cast(L#rev,^d_node))));
invariant (p0049 == (($phys_ptr_cast(L#rev,^d_node) == $phys_ptr_cast(P#lst,^d_node))));
invariant (p0050 == (($phys_ptr_cast(L#rev,^d_node) == $phys_ptr_cast(L#curr,^d_node))));
invariant (p0051 == (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node)))));
invariant (p0052 == (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node)))));
invariant (p0053 == (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node)))));
invariant (p0054 == (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node)))));
invariant (p0055 == (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node)))));
invariant (p0056 == (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node)))));
invariant (p0057 == (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node) == $phys_ptr_cast(L#curr,^d_node)))));
invariant (p0058 == (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node) == $phys_ptr_cast(L#rev,^d_node)))));
invariant (p0059 == (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node) == $phys_ptr_cast(P#lst,^d_node)))));
invariant (p0060 == (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node) == $phys_ptr_cast(L#rev,^d_node)))));
invariant (p0061 == (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node) == $phys_ptr_cast(P#lst,^d_node)))));
invariant (p0062 == (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node) == $phys_ptr_cast(L#curr,^d_node)))));

invariant my_inv (
p0000,
p0001,
p0002,
p0003,
p0004,
p0005,
p0006,
p0007,
p0008,
p0009,
p0010,
p0011,
p0012,
p0013,
p0014,
p0015,
p0016,
p0017,
p0018,
p0019,
p0020,
p0021,
p0022,
p0023,
p0024,
p0025,
p0026,
p0027,
p0028,
p0029,
p0030,
p0031,
p0032,
p0033,
p0034,
p0035,
p0036,
p0037,
p0038,
p0039,
p0040,
p0041,
p0042,
p0043,
p0044,
p0045,
p0046,
p0047,
p0048,
p0049,
p0050,
p0051,
p0052,
p0053,
p0054,
p0055,
p0056,
p0057,
p0058,
p0059,
p0060,
p0061,
p0062,
true
);

    
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
		
p0000 := (F#dll($s,$phys_ptr_cast(P#lst,^d_node)));
p0001 := (F#dll($s,$phys_ptr_cast(L#curr,^d_node)));
p0002 := (F#dll($s,$phys_ptr_cast(L#rev,^d_node)));
p0003 := (F#dll_lseg($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node)));
p0004 := (F#dll_lseg($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node)));
p0005 := (F#dll_lseg($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node)));
p0006 := (F#dll_lseg($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node)));
p0007 := (F#dll_lseg($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node)));
p0008 := (F#dll_lseg($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node)));
p0009 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0010 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0011 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0012 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0013 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0014 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0015 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0016 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0017 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0018 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0019 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0020 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0021 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0022 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0023 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0024 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0025 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0026 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0027 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0028 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0029 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0030 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#rev,^d_node))));
p0031 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#lst,^d_node))));
p0032 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#curr,^d_node))));
p0033 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(L#rev,^d_node))));
p0034 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#lst,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(L#curr,^d_node))));
p0035 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#rev,^d_node))));
p0036 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#rev,^d_node),$phys_ptr_cast(P#lst,^d_node))));
p0037 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(P#lst,^d_node),$phys_ptr_cast(L#curr,^d_node))));
p0038 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#rev,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(L#curr,^d_node),$phys_ptr_cast(P#lst,^d_node))));
p0039 := ($non_null($phys_ptr_cast(P#lst,^d_node)));
p0040 := ($non_null($phys_ptr_cast(L#curr,^d_node)));
p0041 := ($non_null($phys_ptr_cast(L#rev,^d_node)));
p0042 := ($is_null($phys_ptr_cast(P#lst,^d_node)));
p0043 := ($is_null($phys_ptr_cast(L#curr,^d_node)));
p0044 := ($is_null($phys_ptr_cast(L#rev,^d_node)));
p0045 := (($phys_ptr_cast(P#lst,^d_node) == $phys_ptr_cast(L#curr,^d_node)));
p0046 := (($phys_ptr_cast(P#lst,^d_node) == $phys_ptr_cast(L#rev,^d_node)));
p0047 := (($phys_ptr_cast(L#curr,^d_node) == $phys_ptr_cast(P#lst,^d_node)));
p0048 := (($phys_ptr_cast(L#curr,^d_node) == $phys_ptr_cast(L#rev,^d_node)));
p0049 := (($phys_ptr_cast(L#rev,^d_node) == $phys_ptr_cast(P#lst,^d_node)));
p0050 := (($phys_ptr_cast(L#rev,^d_node) == $phys_ptr_cast(L#curr,^d_node)));
p0051 := (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node))));
p0052 := (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node))));
p0053 := (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node))));
p0054 := (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node))));
p0055 := (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node))));
p0056 := (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node))));
p0057 := (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node) == $phys_ptr_cast(L#curr,^d_node))));
p0058 := (($non_null($phys_ptr_cast(P#lst,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#lst,^d_node),^d_node) == $phys_ptr_cast(L#rev,^d_node))));
p0059 := (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node) == $phys_ptr_cast(P#lst,^d_node))));
p0060 := (($non_null($phys_ptr_cast(L#curr,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#curr,^d_node),^d_node) == $phys_ptr_cast(L#rev,^d_node))));
p0061 := (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node) == $phys_ptr_cast(P#lst,^d_node))));
p0062 := (($non_null($phys_ptr_cast(L#rev,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#rev,^d_node),^d_node) == $phys_ptr_cast(L#curr,^d_node))));

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

