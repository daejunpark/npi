
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
b0022 : bool
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

const unique ^$#g_list_last.c..36776#3: $ctype;

axiom $def_fnptr_type(^$#g_list_last.c..36776#3);

type $#g_list_last.c..36776#3;

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



procedure g_list_last(P#list: $ptr) returns ($result: $ptr);
  requires F#dll($s, $phys_ptr_cast(P#list, ^d_node));
  modifies $s, $cev_pc;
  ensures F#dll($s, $phys_ptr_cast(P#list, ^d_node)) == F#dll(old($s), $phys_ptr_cast(P#list, ^d_node));
  ensures $non_null($phys_ptr_cast(P#list, ^d_node)) ==> $non_null($phys_ptr_cast($result, ^d_node));
  ensures !$oset_in($phys_ptr_cast($result, ^d_node), F#dll_lseg_reach($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast($result, ^d_node)));
  ensures F#dll($s, $phys_ptr_cast(P#list, ^d_node));
  ensures F#dll($s, $phys_ptr_cast($result, ^d_node));
  ensures F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast($result, ^d_node));
  ensures $oset_disjoint(F#dll_lseg_reach($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast($result, ^d_node)), F#dll_reach($s, $phys_ptr_cast($result, ^d_node)));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation g_list_last(P#list: $ptr) returns ($result: $ptr)
{
  var stmtexpr0#2: $ptr;
  var SL#list0: $ptr;
  var loopState#17: $state;
  var stmtexpr1#4: $oset;
  var stmtexpr0#3: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var local.list: $ptr;
  var #wrTime$3^5.3: int;
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

// INV:PTR: P#list, local.list
// INV:INT:
// INV:LST: dll2
// INV:OLD: loopState#17

  anon149:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$3^5.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$3^5.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$3^5.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    // struct d_node* local.list; 
    // local.list := list; 
    local.list := $phys_ptr_cast(P#list, ^d_node);
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := dll_reach(local.list); 
    call SL#_dryad_G0 := dll_reach($phys_ptr_cast(local.list, ^d_node));
    assume $full_stop_ext(#tok$4^0.0, $s);
    // _math \oset stmtexpr0#3; 
    // stmtexpr0#3 := _dryad_G0; 
    stmtexpr0#3 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#4; 
    // stmtexpr1#4 := _dryad_G1; 
    stmtexpr1#4 := SL#_dryad_G1;
    // assume ==(glob_reach(), _dryad_G1); 
    assume F#glob_reach() == SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll(local.list), &&(&&(dll(*((local.list->next))), ==>(@_vcc_ptr_neq_null(*((local.list->next))), @_vcc_ptr_eq_pure(*((*((local.list->next))->prev)), local.list))), unchecked!(@_vcc_oset_in(local.list, dll_reach(*((local.list->next)))))))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(local.list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(local.list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_reach(local.list), @_vcc_oset_union(dll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(local.list, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_keys(local.list), @_vcc_intset_union(dll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_list_len_next(local.list), unchecked+(dll_list_len_next(*((local.list->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(local.list), &&(@_vcc_mutable(@state, local.list), @writes_check(local.list))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> $mutable($s, $phys_ptr_cast(local.list, ^d_node)) && $top_writable($s, #wrTime$3^5.3, $phys_ptr_cast(local.list, ^d_node));
    assume true;
    // if (@_vcc_ptr_neq_null(local.list)) ...
    if ($non_null($phys_ptr_cast(local.list, ^d_node)))
    {
      anon146:
        loopState#17 := $s;
        assume true;

p0000 := (F#dll($s,$phys_ptr_cast(P#list,^d_node)));
p0001 := (F#dll($s,$phys_ptr_cast(local.list,^d_node)));
p0002 := (F#dll_lseg($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)));
p0003 := (F#dll_lseg($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)));
p0004 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0005 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0006 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0007 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0008 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0009 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0010 := ($non_null($phys_ptr_cast(P#list,^d_node)));
p0011 := ($non_null($phys_ptr_cast(local.list,^d_node)));
p0012 := ($is_null($phys_ptr_cast(P#list,^d_node)));
p0013 := ($is_null($phys_ptr_cast(local.list,^d_node)));
p0014 := (($phys_ptr_cast(P#list,^d_node) == $phys_ptr_cast(local.list,^d_node)));
p0015 := (($phys_ptr_cast(local.list,^d_node) == $phys_ptr_cast(P#list,^d_node)));
p0016 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node))));
p0017 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node))));
p0018 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node))));
p0019 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node))));
p0020 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node) == $phys_ptr_cast(local.list,^d_node))));
p0021 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node) == $phys_ptr_cast(P#list,^d_node))));

        while (true)

invariant (p0000 == (F#dll($s,$phys_ptr_cast(P#list,^d_node))));
invariant (p0001 == (F#dll($s,$phys_ptr_cast(local.list,^d_node))));
invariant (p0002 == (F#dll_lseg($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))));
invariant (p0003 == (F#dll_lseg($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))));
invariant (p0004 == ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)))));
invariant (p0005 == ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)))));
invariant (p0006 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)))));
invariant (p0007 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)))));
invariant (p0008 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)))));
invariant (p0009 == ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)))));
invariant (p0010 == ($non_null($phys_ptr_cast(P#list,^d_node))));
invariant (p0011 == ($non_null($phys_ptr_cast(local.list,^d_node))));
invariant (p0012 == ($is_null($phys_ptr_cast(P#list,^d_node))));
invariant (p0013 == ($is_null($phys_ptr_cast(local.list,^d_node))));
invariant (p0014 == (($phys_ptr_cast(P#list,^d_node) == $phys_ptr_cast(local.list,^d_node))));
invariant (p0015 == (($phys_ptr_cast(local.list,^d_node) == $phys_ptr_cast(P#list,^d_node))));
invariant (p0016 == (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node)))));
invariant (p0017 == (($non_null($phys_ptr_cast(local.list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node)))));
invariant (p0018 == (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node)))));
invariant (p0019 == (($non_null($phys_ptr_cast(local.list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node)))));
invariant (p0020 == (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node) == $phys_ptr_cast(local.list,^d_node)))));
invariant (p0021 == (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node) == $phys_ptr_cast(P#list,^d_node)))));

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
true
);

          invariant $non_null($phys_ptr_cast(local.list, ^d_node)) ==> $mutable($s, $phys_ptr_cast(local.list, ^d_node));
          invariant $non_null($phys_ptr_cast(local.list, ^d_node)) ==> $top_writable($s, #wrTime$3^5.3, $phys_ptr_cast(local.list, ^d_node));
        {
          anon145:
            assume $writes_nothing(old($s), $s);
            assume $timestamp_post(loopState#17, $s);
            assume $full_stop_ext(#tok$3^18.5, $s);
            // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
            assume $meta_eq(loopState#17, $s);
            // assert @reads_check_normal((local.list->next)); 
            assert $thread_local($s, $phys_ptr_cast(local.list, ^d_node));
            assume true;
            // if (@_vcc_ptr_neq_null(*((local.list->next)))) ...
            if ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)))
            {
              anon143:
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll(local.list), &&(&&(dll(*((local.list->next))), ==>(@_vcc_ptr_neq_null(*((local.list->next))), @_vcc_ptr_eq_pure(*((*((local.list->next))->prev)), local.list))), unchecked!(@_vcc_oset_in(local.list, dll_reach(*((local.list->next)))))))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(local.list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(local.list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_reach(local.list), @_vcc_oset_union(dll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(local.list, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_keys(local.list), @_vcc_intset_union(dll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_list_len_next(local.list), unchecked+(dll_list_len_next(*((local.list->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), 1);
                // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg(list, local.list), &&(dll_lseg(*((list->next)), local.list), unchecked!(@_vcc_oset_in(list, dll_lseg_reach(*((list->next)), local.list)))))); 
                assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(P#list, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node))));
                // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg_reach(list, local.list), @_vcc_oset_union(dll_lseg_reach(*((list->next)), local.list), @_vcc_oset_singleton(list)))); 
                assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)), $oset_singleton($phys_ptr_cast(P#list, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg_keys(list, local.list), @_vcc_intset_union(dll_lseg_keys(*((list->next)), local.list), @_vcc_intset_singleton(*((list->key)))))); 
                assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg_keys($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_lseg_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(P#list, ^d_node))));
                // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg_len_next(list, local.list), unchecked+(dll_lseg_len_next(*((list->next)), local.list), 1))); 
                assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg_len_next($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_lseg_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)), 1);
                // struct d_node* list0; 
                // list0 := local.list; 
                SL#list0 := $phys_ptr_cast(local.list, ^d_node);
                // struct d_node* stmtexpr0#2; 
                // stmtexpr0#2 := list0; 
                stmtexpr0#2 := $phys_ptr_cast(SL#list0, ^d_node);
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll(local.list), &&(&&(dll(*((local.list->next))), ==>(@_vcc_ptr_neq_null(*((local.list->next))), @_vcc_ptr_eq_pure(*((*((local.list->next))->prev)), local.list))), unchecked!(@_vcc_oset_in(local.list, dll_reach(*((local.list->next)))))))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(local.list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(local.list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_reach(local.list), @_vcc_oset_union(dll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(local.list, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_keys(local.list), @_vcc_intset_union(dll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_list_len_next(local.list), unchecked+(dll_list_len_next(*((local.list->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), 1);
                // assume ==>(@_vcc_ptr_neq_pure(local.list, *((local.list->next))), ==(dll_lseg(local.list, *((local.list->next))), &&(dll_lseg(*((local.list->next)), *((local.list->next))), unchecked!(@_vcc_oset_in(local.list, dll_lseg_reach(*((local.list->next)), *((local.list->next)))))))); 
                assume $phys_ptr_cast(local.list, ^d_node) != $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(local.list, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) && !$oset_in($phys_ptr_cast(local.list, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_pure(local.list, *((local.list->next))), ==(dll_lseg_reach(local.list, *((local.list->next))), @_vcc_oset_union(dll_lseg_reach(*((local.list->next)), *((local.list->next))), @_vcc_oset_singleton(local.list)))); 
                assume $phys_ptr_cast(local.list, ^d_node) != $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(local.list, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(local.list, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_pure(local.list, *((local.list->next))), ==(dll_lseg_keys(local.list, *((local.list->next))), @_vcc_intset_union(dll_lseg_keys(*((local.list->next)), *((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
                assume $phys_ptr_cast(local.list, ^d_node) != $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node) ==> F#dll_lseg_keys($s, $phys_ptr_cast(local.list, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) == $intset_union(F#dll_lseg_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node))));
                // assume ==>(@_vcc_ptr_neq_pure(local.list, *((local.list->next))), ==(dll_lseg_len_next(local.list, *((local.list->next))), unchecked+(dll_lseg_len_next(*((local.list->next)), *((local.list->next))), 1))); 
                assume $phys_ptr_cast(local.list, ^d_node) != $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node) ==> F#dll_lseg_len_next($s, $phys_ptr_cast(local.list, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) == $unchk_add(^^nat, F#dll_lseg_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), 1);
                // assert @reads_check_normal((local.list->next)); 
                assert $thread_local($s, $phys_ptr_cast(local.list, ^d_node));
                // local.list := *((local.list->next)); 
                local.list := $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node);
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll(local.list), &&(&&(dll(*((local.list->next))), ==>(@_vcc_ptr_neq_null(*((local.list->next))), @_vcc_ptr_eq_pure(*((*((local.list->next))->prev)), local.list))), unchecked!(@_vcc_oset_in(local.list, dll_reach(*((local.list->next)))))))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(local.list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(local.list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_reach(local.list), @_vcc_oset_union(dll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(local.list, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_keys(local.list), @_vcc_intset_union(dll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_list_len_next(local.list), unchecked+(dll_list_len_next(*((local.list->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), 1);
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll(local.list), &&(&&(dll(*((local.list->next))), ==>(@_vcc_ptr_neq_null(*((local.list->next))), @_vcc_ptr_eq_pure(*((*((local.list->next))->prev)), local.list))), unchecked!(@_vcc_oset_in(local.list, dll_reach(*((local.list->next)))))))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(local.list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(local.list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_reach(local.list), @_vcc_oset_union(dll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(local.list, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_keys(local.list), @_vcc_intset_union(dll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_list_len_next(local.list), unchecked+(dll_list_len_next(*((local.list->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), 1);
                // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg(list, local.list), &&(dll_lseg(*((list->next)), local.list), unchecked!(@_vcc_oset_in(list, dll_lseg_reach(*((list->next)), local.list)))))); 
                assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(P#list, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node))));
                // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg_reach(list, local.list), @_vcc_oset_union(dll_lseg_reach(*((list->next)), local.list), @_vcc_oset_singleton(list)))); 
                assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)), $oset_singleton($phys_ptr_cast(P#list, ^d_node)));
                // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg_keys(list, local.list), @_vcc_intset_union(dll_lseg_keys(*((list->next)), local.list), @_vcc_intset_singleton(*((list->key)))))); 
                assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg_keys($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_lseg_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(P#list, ^d_node))));
                // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg_len_next(list, local.list), unchecked+(dll_lseg_len_next(*((list->next)), local.list), 1))); 
                assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg_len_next($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_lseg_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)), 1);
                // assume ==>(@_vcc_ptr_neq_null(local.list), &&(@_vcc_mutable(@state, local.list), @writes_check(local.list))); 
                assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> $mutable($s, $phys_ptr_cast(local.list, ^d_node)) && $top_writable($s, #wrTime$3^5.3, $phys_ptr_cast(local.list, ^d_node));
            }
            else
            {
              anon144:
                // assert @_vcc_possibly_unreachable; 
                assert {:PossiblyUnreachable true} true;
                // goto #break_1; 
                goto #break_1;
            }

          #continue_1:
            assume true;
			
p0000 := (F#dll($s,$phys_ptr_cast(P#list,^d_node)));
p0001 := (F#dll($s,$phys_ptr_cast(local.list,^d_node)));
p0002 := (F#dll_lseg($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)));
p0003 := (F#dll_lseg($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)));
p0004 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0005 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0006 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0007 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0008 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0009 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0010 := ($non_null($phys_ptr_cast(P#list,^d_node)));
p0011 := ($non_null($phys_ptr_cast(local.list,^d_node)));
p0012 := ($is_null($phys_ptr_cast(P#list,^d_node)));
p0013 := ($is_null($phys_ptr_cast(local.list,^d_node)));
p0014 := (($phys_ptr_cast(P#list,^d_node) == $phys_ptr_cast(local.list,^d_node)));
p0015 := (($phys_ptr_cast(local.list,^d_node) == $phys_ptr_cast(P#list,^d_node)));
p0016 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node))));
p0017 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node))));
p0018 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node))));
p0019 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node))));
p0020 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node) == $phys_ptr_cast(local.list,^d_node))));
p0021 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node) == $phys_ptr_cast(P#list,^d_node))));

        }

      anon147:
        assume $full_stop_ext(#tok$3^18.5, $s);

      #break_1:
        // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll(local.list), &&(&&(dll(*((local.list->next))), ==>(@_vcc_ptr_neq_null(*((local.list->next))), @_vcc_ptr_eq_pure(*((*((local.list->next))->prev)), local.list))), unchecked!(@_vcc_oset_in(local.list, dll_reach(*((local.list->next)))))))); 
        assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(local.list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(local.list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node))));
        // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_reach(local.list), @_vcc_oset_union(dll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
        assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(local.list, ^d_node)));
        // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_keys(local.list), @_vcc_intset_union(dll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
        assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node))));
        // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_list_len_next(local.list), unchecked+(dll_list_len_next(*((local.list->next))), 1))); 
        assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), 1);
    }
    else
    {
      anon148:
        // assert @_vcc_possibly_unreachable; 
        assert {:PossiblyUnreachable true} true;
    }

  anon150:
    // return local.list; 
    $result := $phys_ptr_cast(local.list, ^d_node);
    assume true;
    assert $position_marker();
    goto #exit;

  anon151:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$3^18.5: $token;

const unique #tok$4^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(4, #file^?3Cno?20file?3E);

const unique #tok$3^5.3: $token;

const unique #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad_Bin?5CTests?5Cglist?5Cg_list_last.c: $token;

axiom $file_name_is(3, #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad_Bin?5CTests?5Cglist?5Cg_list_last.c);

const unique #file^c?3A?5Cusers?5Cdaniel?5Cworkspace?5Cvcdryad_bin?5Ctests?5Cglist?5Cdryad_dll_lseg_defs.h: $token;

axiom $file_name_is(2, #file^c?3A?5Cusers?5Cdaniel?5Cworkspace?5Cvcdryad_bin?5Ctests?5Cglist?5Cdryad_dll_lseg_defs.h);

const unique #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad?5Cvcc?5CHost?5Cbin?5CHeaders?5Cvccp.h: $token;

axiom $file_name_is(1, #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad?5Cvcc?5CHost?5Cbin?5CHeaders?5Cvccp.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^d_node);

