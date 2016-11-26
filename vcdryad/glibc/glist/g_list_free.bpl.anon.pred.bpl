
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

axiom $def_struct_type(^d_node, 24, false, false);

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2(#s1, #s2, #p, ^d_node) } $inv2(#s1, #s2, #p, ^d_node) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2_without_lemmas(#s1, #s2, #p, ^d_node) } $inv2_without_lemmas(#s1, #s2, #p, ^d_node) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall p: $ptr, q: $ptr, s: $state :: { $in(q, $composite_extent(s, p, ^d_node)) } $in(q, $composite_extent(s, p, ^d_node)) == (q == p));

const unique d_node.key: $field;

axiom $def_phys_field(^d_node, d_node.key, ^^i4, false, 0);

const unique d_node.prev: $field;

axiom $def_phys_field(^d_node, d_node.prev, $ptr_to(^d_node), false, 8);

const unique d_node.next: $field;

axiom $def_phys_field(^d_node, d_node.next, $ptr_to(^d_node), false, 16);

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

const unique ^$#g_list_free.c..36776#3: $ctype;

axiom $def_fnptr_type(^$#g_list_free.c..36776#3);

type $#g_list_free.c..36776#3;

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



function F#dll_keys(#s: $state, SP#hd: $ptr) : $intset;

const unique cf#dll_keys: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#dll_keys(#s, SP#hd) } 1 < $decreases_level ==> ($non_null($phys_ptr_cast(SP#hd, ^d_node)) ==> $intset_in($rd_inv(#s, d_node.key, $phys_ptr_cast(SP#hd, ^d_node)), F#dll_keys(#s, SP#hd))) && ($is_null($phys_ptr_cast(SP#hd, ^d_node)) ==> F#dll_keys(#s, SP#hd) == $intset_empty()));

axiom $function_arg_type(cf#dll_keys, 0, ^$#intset);

axiom $function_arg_type(cf#dll_keys, 1, $ptr_to(^d_node));

procedure dll_keys(SP#hd: $ptr) returns ($result: $intset);
  ensures $non_null($phys_ptr_cast(SP#hd, ^d_node)) ==> $intset_in($rd_inv($s, d_node.key, $phys_ptr_cast(SP#hd, ^d_node)), $result);
  ensures $is_null($phys_ptr_cast(SP#hd, ^d_node)) ==> $result == $intset_empty();
  free ensures $result == F#dll_keys($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#dll_list_len_next(#s: $state, SP#x: $ptr) : int;

const unique cf#dll_list_len_next: $pure_function;

axiom (forall #s: $state, SP#x: $ptr :: { F#dll_list_len_next(#s, SP#x) } 1 < $decreases_level ==> $in_range_nat(F#dll_list_len_next(#s, SP#x)) && ($non_null($phys_ptr_cast(SP#x, ^d_node)) ==> F#dll_list_len_next(#s, SP#x) > 0) && ($is_null($phys_ptr_cast(SP#x, ^d_node)) ==> F#dll_list_len_next(#s, SP#x) == 0));

axiom $function_arg_type(cf#dll_list_len_next, 0, ^^nat);

axiom $function_arg_type(cf#dll_list_len_next, 1, $ptr_to(^d_node));

procedure dll_list_len_next(SP#x: $ptr) returns ($result: int);
  free ensures $in_range_nat($result);
  ensures $non_null($phys_ptr_cast(SP#x, ^d_node)) ==> $result > 0;
  ensures $is_null($phys_ptr_cast(SP#x, ^d_node)) ==> $result == 0;
  free ensures $result == F#dll_list_len_next($s, SP#x);
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
   list_keys(x)  == union( lseg_keys(x,y),  list_keys(y) )
   list_len(x)   == lseg_len(x,y) + list_len(y)
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
&& F#dll_keys(#s, $phys_ptr_cast(SP#x, ^d_node))
   == $intset_union(F#dll_lseg_keys(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)), F#dll_keys(#s, $phys_ptr_cast(SP#y, ^d_node)))
&& F#dll_list_len_next(#s, $phys_ptr_cast(SP#x, ^d_node))
   == $unchk_add(^^nat, F#dll_lseg_len_next(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)), F#dll_list_len_next(#s, $phys_ptr_cast(SP#y, ^d_node)))
));

/*
   lseg(x,y) && y != null
   && y->next != y && y->next != x && y->next \not\in lseg_reach(x,y)
   && y->next != null ==> y->next->prev == y
// && lseg_keys(x,y) <= singleton(y)
   ==>
   lseg(x,y->next) &&
   lseg_reach(x,y->next) == union( lseg_reach(x,y), singleton(y) )
   lseg_keys(x,y->next)  == union( lseg_keys(x,y),  singleton(y->key) )
   lseg_len(x,y->next)   == lseg_len(x,y) + 1
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
&& F#dll_lseg_keys(#s, $phys_ptr_cast(SP#x, ^d_node), $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node))
   == $intset_union(F#dll_lseg_keys(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)), $intset_singleton($rd_inv(#s, d_node.key, $phys_ptr_cast(SP#y, ^d_node))))
&& F#dll_lseg_len_next(#s, $phys_ptr_cast(SP#x, ^d_node), $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node))
   == $unchk_add(^^nat, F#dll_lseg_len_next(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)), 1)
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
  ensures $is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> $result == F#dll_reach($s, $phys_ptr_cast(SP#hd, ^d_node));
  free ensures $result == F#dll_lseg_reach($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#dll_lseg_keys(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : $intset;

const unique cf#dll_lseg_keys: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#dll_lseg_keys(#s, SP#hd, SP#tl) } 1 < $decreases_level ==>
true
&& ($phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg_keys(#s, SP#hd, SP#tl) == $intset_empty())
&& ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node)
   ==> $intset_in($rd_inv(#s, d_node.key, $phys_ptr_cast(SP#hd, ^d_node)), F#dll_lseg_keys(#s, SP#hd, SP#tl)))
&& ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $is_null($phys_ptr_cast(SP#tl, ^d_node))
   ==> F#dll_lseg_keys(#s, SP#hd, SP#tl) == F#dll_keys(#s, $phys_ptr_cast(SP#hd, ^d_node)))
);

axiom $function_arg_type(cf#dll_lseg_keys, 0, ^$#intset);

axiom $function_arg_type(cf#dll_lseg_keys, 1, $ptr_to(^d_node));

axiom $function_arg_type(cf#dll_lseg_keys, 2, $ptr_to(^d_node));

procedure dll_lseg_keys(SP#hd: $ptr, SP#tl: $ptr) returns ($result: $intset);
  ensures $non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $intset_in($rd_inv($s, d_node.key, $phys_ptr_cast(SP#hd, ^d_node)), $result);
  ensures $phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> $result == $intset_empty();
  ensures $is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> $result == F#dll_keys($s, $phys_ptr_cast(SP#hd, ^d_node));
  free ensures $result == F#dll_lseg_keys($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#dll_lseg_len_next(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : int;

const unique cf#dll_lseg_len_next: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#dll_lseg_len_next(#s, SP#hd, SP#tl) } 1 < $decreases_level ==>
true
&& $in_range_nat(F#dll_lseg_len_next(#s, SP#hd, SP#tl))
&& ($phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg_len_next(#s, SP#hd, SP#tl) == 0)
&& ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node)
   ==> F#dll_lseg_len_next(#s, SP#hd, SP#tl) > 0)
&& ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $is_null($phys_ptr_cast(SP#tl, ^d_node))
   ==> F#dll_lseg_len_next(#s, SP#hd, SP#tl) == F#dll_list_len_next(#s, $phys_ptr_cast(SP#hd, ^d_node)))
);

axiom $function_arg_type(cf#dll_lseg_len_next, 0, ^^nat);

axiom $function_arg_type(cf#dll_lseg_len_next, 1, $ptr_to(^d_node));

axiom $function_arg_type(cf#dll_lseg_len_next, 2, $ptr_to(^d_node));

procedure dll_lseg_len_next(SP#hd: $ptr, SP#tl: $ptr) returns ($result: int);
  free ensures $in_range_nat($result);
  ensures $phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> $result == 0;
  ensures ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node)) ==> $result > 0;
  ensures ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $is_null($phys_ptr_cast(SP#tl, ^d_node))) ==> $result == F#dll_list_len_next($s, $phys_ptr_cast(SP#hd, ^d_node));
  free ensures $result == F#dll_lseg_len_next($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



procedure g_list_free(P#list: $ptr) returns (OP#ALL_REACH: $oset);
  requires F#dll($s, $phys_ptr_cast(P#list, ^d_node));
  modifies $s, $cev_pc;
  ensures OP#ALL_REACH == $oset_empty();
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation g_list_free(P#list: $ptr) returns (OP#ALL_REACH: $oset)
{
  var stmtexpr2#4: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr1#3: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr0#2: $ptr;
  var SL#x0: $ptr;
  var L#next: $ptr;
  var loopState#15: $state;
  var L#x: $ptr;
  var stmtexpr1#6: $oset;
  var stmtexpr0#5: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$3^5.3: int;
  var #stackframe: int;

// INV:PTR: P#list, L#x
// INV:INT:
// INV:LST: dll2
// INV:OLD: loopState#15

  anon132:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$3^5.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$3^5.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$3^5.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := dll_reach(list); 
    call SL#_dryad_G0 := dll_reach($phys_ptr_cast(P#list, ^d_node));
    assume $full_stop_ext(#tok$4^0.0, $s);
    // _math \oset stmtexpr0#5; 
    // stmtexpr0#5 := _dryad_G0; 
    stmtexpr0#5 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#6; 
    // stmtexpr1#6 := _dryad_G1; 
    stmtexpr1#6 := SL#_dryad_G1;
    // assume ==(glob_reach(), _dryad_G1); 
    assume F#glob_reach() == SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll(list), &&(&&(dll(*((list->next))), ==>(@_vcc_ptr_neq_null(*((list->next))), @_vcc_ptr_eq_pure(*((*((list->next))->prev)), list))), unchecked!(@_vcc_oset_in(list, dll_reach(*((list->next)))))))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#list, ^d_node)) && !$oset_in($phys_ptr_cast(P#list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_reach(list), @_vcc_oset_union(dll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#list, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_keys(list), @_vcc_intset_union(dll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(P#list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(P#list, ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_list_len_next(list), unchecked+(dll_list_len_next(*((list->next))), 1))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(P#list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), 1);
    // struct d_node* x; 
    // assume ==>(@_vcc_ptr_neq_null(list), &&(@_vcc_mutable(@state, list), @writes_check(list))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> $mutable($s, $phys_ptr_cast(P#list, ^d_node)) && $top_writable($s, #wrTime$3^5.3, $phys_ptr_cast(P#list, ^d_node));
    // assume ==>(@_vcc_ptr_neq_null(list), @_vcc_is_malloc_root(@state, list)); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> $is_malloc_root($s, $phys_ptr_cast(P#list, ^d_node));
    // ALL_REACH := dll_reach(list); 
    call OP#ALL_REACH := dll_reach($phys_ptr_cast(P#list, ^d_node));
    assume $full_stop_ext(#tok$3^12.23, $s);
    // x := list; 
    L#x := $phys_ptr_cast(P#list, ^d_node);
    // assert dll_lseg(x, x); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#x, ^d_node), $phys_ptr_cast(L#x, ^d_node));
    // assume dll_lseg(x, x); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#x, ^d_node), $phys_ptr_cast(L#x, ^d_node));
    // assert dll_lseg(list, list); 
    assert F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(P#list, ^d_node));
    // assume dll_lseg(list, list); 
    assume F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(P#list, ^d_node));
    loopState#15 := $s;
    assume true;

// INV:LOOPHEAD

    while (true)

invariant b0000 ==> (F#dll($s,$phys_ptr_cast(P#list,^d_node)));
invariant b0001 ==> (F#dll($s,$phys_ptr_cast(L#x,^d_node)));
invariant b0002 ==> (F#dll_lseg($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(L#x,^d_node)));
invariant b0003 ==> (F#dll_lseg($s,$phys_ptr_cast(L#x,^d_node),$phys_ptr_cast(P#list,^d_node)));
invariant b0004 ==> ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#x,^d_node))));
invariant b0005 ==> ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#x,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
invariant b0006 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(L#x,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#x,^d_node))));
invariant b0007 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(L#x,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
invariant b0008 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(L#x,^d_node))));
invariant b0009 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(L#x,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
invariant b0010 ==> ($non_null($phys_ptr_cast(P#list,^d_node)));
invariant b0011 ==> ($non_null($phys_ptr_cast(L#x,^d_node)));
invariant b0012 ==> ($is_null($phys_ptr_cast(P#list,^d_node)));
invariant b0013 ==> ($is_null($phys_ptr_cast(L#x,^d_node)));
invariant b0014 ==> (($phys_ptr_cast(P#list,^d_node) == $phys_ptr_cast(L#x,^d_node)));
invariant b0015 ==> (($phys_ptr_cast(L#x,^d_node) == $phys_ptr_cast(P#list,^d_node)));
invariant b0016 ==> (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node))));
invariant b0017 ==> (($non_null($phys_ptr_cast(L#x,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#x,^d_node),^d_node))));
invariant b0018 ==> (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node))));
invariant b0019 ==> (($non_null($phys_ptr_cast(L#x,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#x,^d_node),^d_node))));
invariant b0020 ==> (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node) == $phys_ptr_cast(L#x,^d_node))));
invariant b0021 ==> (($non_null($phys_ptr_cast(L#x,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(L#x,^d_node),^d_node) == $phys_ptr_cast(P#list,^d_node))));


      invariant $non_null($phys_ptr_cast(L#x, ^d_node)) ==> $mutable($s, $phys_ptr_cast(L#x, ^d_node));
      invariant $non_null($phys_ptr_cast(L#x, ^d_node)) ==> $top_writable($s, #wrTime$3^5.3, $phys_ptr_cast(L#x, ^d_node));
      invariant $non_null($phys_ptr_cast(L#x, ^d_node)) ==> $is_malloc_root($s, $phys_ptr_cast(L#x, ^d_node));
      invariant OP#ALL_REACH == F#dll_reach($s, $phys_ptr_cast(L#x, ^d_node));
    {
      anon131:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#15, $s);
        assume $full_stop_ext(#tok$3^15.3, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(x)) ...
        if ($non_null($phys_ptr_cast(L#x, ^d_node)))
        {
          anon129:
            // assume ==>(@_vcc_ptr_neq_null(x), ==(dll(x), &&(&&(dll(*((x->next))), ==>(@_vcc_ptr_neq_null(*((x->next))), @_vcc_ptr_eq_pure(*((*((x->next))->prev)), x))), unchecked!(@_vcc_oset_in(x, dll_reach(*((x->next)))))))); 
            assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#x, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#x, ^d_node)) && !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_reach(x), @_vcc_oset_union(dll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
            assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#x, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#x, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_keys(x), @_vcc_intset_union(dll_keys(*((x->next))), @_vcc_intset_singleton(*((x->key)))))); 
            assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#x, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#x, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_list_len_next(x), unchecked+(dll_list_len_next(*((x->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#x, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll(list), &&(&&(dll(*((list->next))), ==>(@_vcc_ptr_neq_null(*((list->next))), @_vcc_ptr_eq_pure(*((*((list->next))->prev)), list))), unchecked!(@_vcc_oset_in(list, dll_reach(*((list->next)))))))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#list, ^d_node)) && !$oset_in($phys_ptr_cast(P#list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_reach(list), @_vcc_oset_union(dll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#list, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_keys(list), @_vcc_intset_union(dll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(P#list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(P#list, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_list_len_next(list), unchecked+(dll_list_len_next(*((list->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(P#list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), 1);
            // struct d_node* next; 
            // assume ==>(&&(@_vcc_ptr_neq_null(x), @_vcc_ptr_neq_null(*((x->next)))), ==(@_vcc_is_malloc_root(@state, *((x->next))), @_vcc_is_malloc_root(@state, x))); 
            assume $non_null($phys_ptr_cast(L#x, ^d_node)) && $non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)) ==> $is_malloc_root($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)) == $is_malloc_root($s, $phys_ptr_cast(L#x, ^d_node));
            // struct d_node* x0; 
            // x0 := x; 
            SL#x0 := $phys_ptr_cast(L#x, ^d_node);
            // struct d_node* stmtexpr0#2; 
            // stmtexpr0#2 := x0; 
            stmtexpr0#2 := $phys_ptr_cast(SL#x0, ^d_node);
            // assume ==>(@_vcc_ptr_neq_null(x), ==(dll(x), &&(&&(dll(*((x->next))), ==>(@_vcc_ptr_neq_null(*((x->next))), @_vcc_ptr_eq_pure(*((*((x->next))->prev)), x))), unchecked!(@_vcc_oset_in(x, dll_reach(*((x->next)))))))); 
            assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#x, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#x, ^d_node)) && !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_reach(x), @_vcc_oset_union(dll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
            assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#x, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#x, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_keys(x), @_vcc_intset_union(dll_keys(*((x->next))), @_vcc_intset_singleton(*((x->key)))))); 
            assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#x, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#x, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_list_len_next(x), unchecked+(dll_list_len_next(*((x->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#x, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)), 1);
            // assert @reads_check_normal((x->next)); 
            assert $thread_local($s, $phys_ptr_cast(L#x, ^d_node));
            // next := *((x->next)); 
            L#next := $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node);
            // assume ==>(@_vcc_ptr_neq_null(next), ==(dll(next), &&(&&(dll(*((next->next))), ==>(@_vcc_ptr_neq_null(*((next->next))), @_vcc_ptr_eq_pure(*((*((next->next))->prev)), next))), unchecked!(@_vcc_oset_in(next, dll_reach(*((next->next)))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#next, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#next, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#next, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#next, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#next, ^d_node)) && !$oset_in($phys_ptr_cast(L#next, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#next, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(dll_reach(next), @_vcc_oset_union(dll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#next, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#next, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#next, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(dll_keys(next), @_vcc_intset_union(dll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#next, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#next, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#next, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(dll_list_len_next(next), unchecked+(dll_list_len_next(*((next->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#next, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#next, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#next, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(x), ==(dll(x), &&(&&(dll(*((x->next))), ==>(@_vcc_ptr_neq_null(*((x->next))), @_vcc_ptr_eq_pure(*((*((x->next))->prev)), x))), unchecked!(@_vcc_oset_in(x, dll_reach(*((x->next)))))))); 
            assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#x, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#x, ^d_node)) && !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_reach(x), @_vcc_oset_union(dll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
            assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#x, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#x, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_keys(x), @_vcc_intset_union(dll_keys(*((x->next))), @_vcc_intset_singleton(*((x->key)))))); 
            assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#x, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#x, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_list_len_next(x), unchecked+(dll_list_len_next(*((x->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#x, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)), 1);
            // _math \state _dryad_S0; 
            // _dryad_S0 := @_vcc_current_state(@state); 
            SL#_dryad_S0 := $current_state($s);
            // _math \state stmtexpr1#3; 
            // stmtexpr1#3 := _dryad_S0; 
            stmtexpr1#3 := SL#_dryad_S0;
            // void function
            // assert @writes_check(x); 
            assert $top_writable($s, #wrTime$3^5.3, $phys_ptr_cast(L#x, ^d_node));
            // assert @writes_check(@_vcc_extent(@state, x)); 
            assert (forall #writes$3^23.5: $ptr :: { $dont_instantiate(#writes$3^23.5) } $set_in(#writes$3^23.5, $extent($s, $phys_ptr_cast(L#x, ^d_node))) ==> $top_writable($s, #wrTime$3^5.3, #writes$3^23.5));
            // stmt _vcc_free(x); 
            call $free($phys_ptr_cast(L#x, ^d_node));
            assume $full_stop_ext(#tok$3^23.5, $s);
            // _math \state _dryad_S1; 
            // _dryad_S1 := @_vcc_current_state(@state); 
            SL#_dryad_S1 := $current_state($s);
            // _math \state stmtexpr2#4; 
            // stmtexpr2#4 := _dryad_S1; 
            stmtexpr2#4 := SL#_dryad_S1;
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, dll_reach(x0)))), ==(old(_dryad_S0, dll(x0)), old(_dryad_S1, dll(x0)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(SL#x0, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, dll_reach(x0)))), ==(old(_dryad_S0, dll_reach(x0)), old(_dryad_S1, dll_reach(x0)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(SL#x0, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, dll_reach(x0)))), ==(old(_dryad_S0, dll_keys(x0)), old(_dryad_S1, dll_keys(x0)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^d_node))) ==> F#dll_keys(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^d_node)) == F#dll_keys(SL#_dryad_S1, $phys_ptr_cast(SL#x0, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, dll_reach(x0)))), ==(old(_dryad_S0, dll_list_len_next(x0)), old(_dryad_S1, dll_list_len_next(x0)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^d_node))) ==> F#dll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^d_node)) == F#dll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(SL#x0, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, dll_reach(next)))), ==(old(_dryad_S0, dll(next)), old(_dryad_S1, dll(next)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#next, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(L#next, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(L#next, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, dll_reach(next)))), ==(old(_dryad_S0, dll_reach(next)), old(_dryad_S1, dll_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#next, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#next, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(L#next, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, dll_reach(next)))), ==(old(_dryad_S0, dll_keys(next)), old(_dryad_S1, dll_keys(next)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#next, ^d_node))) ==> F#dll_keys(SL#_dryad_S0, $phys_ptr_cast(L#next, ^d_node)) == F#dll_keys(SL#_dryad_S1, $phys_ptr_cast(L#next, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, dll_reach(next)))), ==(old(_dryad_S0, dll_list_len_next(next)), old(_dryad_S1, dll_list_len_next(next)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#next, ^d_node))) ==> F#dll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#next, ^d_node)) == F#dll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#next, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, dll_reach(list)))), ==(old(_dryad_S0, dll(list)), old(_dryad_S1, dll(list)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(P#list, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, dll_reach(list)))), ==(old(_dryad_S0, dll_reach(list)), old(_dryad_S1, dll_reach(list)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(P#list, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, dll_reach(list)))), ==(old(_dryad_S0, dll_keys(list)), old(_dryad_S1, dll_keys(list)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node))) ==> F#dll_keys(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node)) == F#dll_keys(SL#_dryad_S1, $phys_ptr_cast(P#list, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, dll_reach(list)))), ==(old(_dryad_S0, dll_list_len_next(list)), old(_dryad_S1, dll_list_len_next(list)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node))) ==> F#dll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node)) == F#dll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(P#list, ^d_node));
            // ALL_REACH := @_vcc_oset_diff(ALL_REACH, @_vcc_oset_singleton(x)); 
            OP#ALL_REACH := $oset_diff(OP#ALL_REACH, $oset_singleton($phys_ptr_cast(L#x, ^d_node)));
            // x := next; 
            L#x := $phys_ptr_cast(L#next, ^d_node);
            // assert dll_lseg(x0, x0); 
            assert F#dll_lseg($s, $phys_ptr_cast(SL#x0, ^d_node), $phys_ptr_cast(SL#x0, ^d_node));
            // assume dll_lseg(x0, x0); 
            assume F#dll_lseg($s, $phys_ptr_cast(SL#x0, ^d_node), $phys_ptr_cast(SL#x0, ^d_node));
            // assert dll_lseg(next, next); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#next, ^d_node), $phys_ptr_cast(L#next, ^d_node));
            // assume dll_lseg(next, next); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#next, ^d_node), $phys_ptr_cast(L#next, ^d_node));
            // assert dll_lseg(x, x); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#x, ^d_node), $phys_ptr_cast(L#x, ^d_node));
            // assume dll_lseg(x, x); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#x, ^d_node), $phys_ptr_cast(L#x, ^d_node));
            // assert dll_lseg(list, list); 
            assert F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(P#list, ^d_node));
            // assume dll_lseg(list, list); 
            assume F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(P#list, ^d_node));
            // assume ==>(@_vcc_ptr_neq_null(x), &&(@_vcc_mutable(@state, x), @writes_check(x))); 
            assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> $mutable($s, $phys_ptr_cast(L#x, ^d_node)) && $top_writable($s, #wrTime$3^5.3, $phys_ptr_cast(L#x, ^d_node));
        }
        else
        {
          anon130:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // goto #break_1; 
            goto #break_1;
        }

      #continue_1:
        assume true;

// INV:LOOPTAIL

    }

  anon133:
    assume $full_stop_ext(#tok$3^15.3, $s);

  #break_1:
    // assume ==>(@_vcc_ptr_neq_null(x), ==(dll(x), &&(&&(dll(*((x->next))), ==>(@_vcc_ptr_neq_null(*((x->next))), @_vcc_ptr_eq_pure(*((*((x->next))->prev)), x))), unchecked!(@_vcc_oset_in(x, dll_reach(*((x->next)))))))); 
    assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#x, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#x, ^d_node)) && !$oset_in($phys_ptr_cast(L#x, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_reach(x), @_vcc_oset_union(dll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
    assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#x, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#x, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_keys(x), @_vcc_intset_union(dll_keys(*((x->next))), @_vcc_intset_singleton(*((x->key)))))); 
    assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#x, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#x, ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(x), ==(dll_list_len_next(x), unchecked+(dll_list_len_next(*((x->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#x, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#x, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#x, ^d_node), ^d_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll(list), &&(&&(dll(*((list->next))), ==>(@_vcc_ptr_neq_null(*((list->next))), @_vcc_ptr_eq_pure(*((*((list->next))->prev)), list))), unchecked!(@_vcc_oset_in(list, dll_reach(*((list->next)))))))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#list, ^d_node)) && !$oset_in($phys_ptr_cast(P#list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_reach(list), @_vcc_oset_union(dll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#list, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_keys(list), @_vcc_intset_union(dll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(P#list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(P#list, ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_list_len_next(list), unchecked+(dll_list_len_next(*((list->next))), 1))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(P#list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), 1);
    // return; 
    assume true;
    assert $position_marker();
    goto #exit;

  #exit:
}



const unique l#public: $label;

const unique #tok$3^23.5: $token;

const unique #tok$3^15.3: $token;

const unique #tok$3^12.23: $token;

const unique #tok$4^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(4, #file^?3Cno?20file?3E);

const unique #tok$3^5.3: $token;

const unique #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad_Bin?5CTests?5Cglist?5Cg_list_free.c: $token;

axiom $file_name_is(3, #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad_Bin?5CTests?5Cglist?5Cg_list_free.c);

const unique #file^c?3A?5Cusers?5Cdaniel?5Cworkspace?5Cvcdryad_bin?5Ctests?5Cglist?5Cdryad_dll_lseg_defs.h: $token;

axiom $file_name_is(2, #file^c?3A?5Cusers?5Cdaniel?5Cworkspace?5Cvcdryad_bin?5Ctests?5Cglist?5Cdryad_dll_lseg_defs.h);

const unique #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad?5Cvcc?5CHost?5Cbin?5CHeaders?5Cvccp.h: $token;

axiom $file_name_is(1, #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad?5Cvcc?5CHost?5Cbin?5CHeaders?5Cvccp.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^d_node);

