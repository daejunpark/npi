
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
const {:existential true} b0063 : bool;
const {:existential true} b0064 : bool;
const {:existential true} b0065 : bool;
const {:existential true} b0066 : bool;
const {:existential true} b0067 : bool;
const {:existential true} b0068 : bool;
const {:existential true} b0069 : bool;
const {:existential true} b0070 : bool;
const {:existential true} b0071 : bool;
const {:existential true} b0072 : bool;
const {:existential true} b0073 : bool;
const {:existential true} b0074 : bool;
const {:existential true} b0075 : bool;
const {:existential true} b0076 : bool;
const {:existential true} b0077 : bool;
const {:existential true} b0078 : bool;
const {:existential true} b0079 : bool;
const {:existential true} b0080 : bool;
const {:existential true} b0081 : bool;
const {:existential true} b0082 : bool;
const {:existential true} b0083 : bool;
const {:existential true} b0084 : bool;
const {:existential true} b0085 : bool;
const {:existential true} b0086 : bool;
const {:existential true} b0087 : bool;

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

const unique ^$#g_list_length.c..36776#3: $ctype;

axiom $def_fnptr_type(^$#g_list_length.c..36776#3);

type $#g_list_length.c..36776#3;

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



procedure g_list_length(P#list: $ptr, P#data: int) returns ($result: int);
  requires F#dll($s, $phys_ptr_cast(P#list, ^d_node));
  requires F#dll_list_len_next($s, $phys_ptr_cast(P#list, ^d_node)) < 2147483647;
  modifies $s, $cev_pc;
  free ensures $in_range_u4($result);
  ensures F#dll($s, $phys_ptr_cast(P#list, ^d_node));
  ensures $result == F#dll_list_len_next($s, $phys_ptr_cast(P#list, ^d_node));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation g_list_length(P#list: $ptr, P#data: int) returns ($result: int)
{
  var stmtexpr0#2: $ptr;
  var SL#list0: $ptr;
  var loopState#18: $state;
  var L#length: int where $in_range_u4(L#length);
  var stmtexpr1#4: $oset;
  var stmtexpr0#3: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var local.list: $ptr;
  var #wrTime$3^6.3: int;
  var #stackframe: int;
  
// INV:PTR: P#list, local.list
// INV:INT: P#data, L#length
// INV:LST: dll2
// INV:OLD: loopState#18

  anon155:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$3^6.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$3^6.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$3^6.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @in_range_i4(data); 
    assume $in_range_i4(P#data);
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
    // uint32_t length; 
    // assume ==>(@_vcc_ptr_neq_null(local.list), &&(@_vcc_mutable(@state, local.list), @writes_check(local.list))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> $mutable($s, $phys_ptr_cast(local.list, ^d_node)) && $top_writable($s, #wrTime$3^6.3, $phys_ptr_cast(local.list, ^d_node));
    // var uint32_t length
    // length := 0; 
    L#length := 0;
    loopState#18 := $s;
    assume true;

// INV:LOOPHEAD

    while (true)
	
invariant b0000 ==> (F#dll($s,$phys_ptr_cast(P#list,^d_node)));
invariant b0001 ==> (F#dll($s,$phys_ptr_cast(local.list,^d_node)));
invariant b0002 ==> (F#dll_lseg($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)));
invariant b0003 ==> (F#dll_lseg($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)));
invariant b0004 ==> ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
invariant b0005 ==> ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
invariant b0006 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
invariant b0007 ==> ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
invariant b0008 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
invariant b0009 ==> ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
invariant b0010 ==> ($non_null($phys_ptr_cast(P#list,^d_node)));
invariant b0011 ==> ($non_null($phys_ptr_cast(local.list,^d_node)));
invariant b0012 ==> ($is_null($phys_ptr_cast(P#list,^d_node)));
invariant b0013 ==> ($is_null($phys_ptr_cast(local.list,^d_node)));
invariant b0014 ==> (($phys_ptr_cast(P#list,^d_node) == $phys_ptr_cast(local.list,^d_node)));
invariant b0015 ==> (($phys_ptr_cast(local.list,^d_node) == $phys_ptr_cast(P#list,^d_node)));
invariant b0016 ==> (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node))));
invariant b0017 ==> (($non_null($phys_ptr_cast(local.list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node))));
invariant b0018 ==> (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node))));
invariant b0019 ==> (($non_null($phys_ptr_cast(local.list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node))));
invariant b0020 ==> (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node) == $phys_ptr_cast(local.list,^d_node))));
invariant b0021 ==> (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node) == $phys_ptr_cast(P#list,^d_node))));
invariant b0022 ==> ((!($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
invariant b0023 ==> ((!($intset_in(L#length,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
invariant b0024 ==> ((!($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
invariant b0025 ==> ((!($intset_in(L#length,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
invariant b0026 ==> ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))))));
invariant b0027 ==> ((!($intset_in(L#length,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))))));
invariant b0028 ==> ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))))));
invariant b0029 ==> ((!($intset_in(L#length,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))))));
invariant b0030 ==> ($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))));
invariant b0031 ==> ($intset_in(L#length,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))));
invariant b0032 ==> ($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))));
invariant b0033 ==> ($intset_in(L#length,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))));
invariant b0034 ==> ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))));
invariant b0035 ==> ($intset_in(L#length,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))));
invariant b0036 ==> ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))));
invariant b0037 ==> ($intset_in(L#length,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))));
invariant b0038 ==> ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))));
invariant b0039 ==> ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))));
invariant b0040 ==> ((F#dll_keys(loopState#18,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
invariant b0041 ==> ((F#dll_keys(loopState#18,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
invariant b0042 ==> ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys(loopState#18,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
invariant b0043 ==> ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys(loopState#18,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
invariant b0044 ==> ((P#data < 2147483647));
invariant b0045 ==> ((L#length < 2147483647));
invariant b0046 ==> ((P#data < 2147483647));
invariant b0047 ==> ((L#length < 2147483647));
invariant b0048 ==> ((P#data < 4294967295));
invariant b0049 ==> ((L#length < 4294967295));
invariant b0050 ==> ((P#data < 4294967295));
invariant b0051 ==> ((L#length < 4294967295));
invariant b0052 ==> ((P#data >= 0));
invariant b0053 ==> ((L#length >= 0));
invariant b0054 ==> ((P#data >= 0));
invariant b0055 ==> ((L#length >= 0));
invariant b0056 ==> (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) < P#data)));
invariant b0057 ==> (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) < L#length)));
invariant b0058 ==> (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) < P#data)));
invariant b0059 ==> (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) < L#length)));
invariant b0060 ==> ((($non_null($phys_ptr_cast(P#list,^d_node)) && $non_null($phys_ptr_cast(local.list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)))));
invariant b0061 ==> ((($non_null($phys_ptr_cast(local.list,^d_node)) && $non_null($phys_ptr_cast(P#list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)))));
invariant b0062 ==> ((($non_null($phys_ptr_cast(P#list,^d_node)) && $non_null($phys_ptr_cast(local.list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)))));
invariant b0063 ==> ((($non_null($phys_ptr_cast(local.list,^d_node)) && $non_null($phys_ptr_cast(P#list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)))));
invariant b0064 ==> ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == P#data));
invariant b0065 ==> ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == L#length));
invariant b0066 ==> ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == P#data));
invariant b0067 ==> ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == L#length));
invariant b0068 ==> ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == P#data));
invariant b0069 ==> ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == L#length));
invariant b0070 ==> ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == P#data));
invariant b0071 ==> ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == L#length));
invariant b0072 ==> ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == (P#data - L#length)));
invariant b0073 ==> ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == (L#length - P#data)));
invariant b0074 ==> ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == (P#data - L#length)));
invariant b0075 ==> ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == (L#length - P#data)));
invariant b0076 ==> ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == (P#data - L#length)));
invariant b0077 ==> ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == (L#length - P#data)));
invariant b0078 ==> ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == (P#data - L#length)));
invariant b0079 ==> ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == (L#length - P#data)));
invariant b0080 ==> (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == P#data));
invariant b0081 ==> (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == L#length));
invariant b0082 ==> (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == P#data));
invariant b0083 ==> (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == L#length));
invariant b0084 ==> (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == (P#data - L#length)));
invariant b0085 ==> (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == (L#length - P#data)));
invariant b0086 ==> (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == (P#data - L#length)));
invariant b0087 ==> (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == (L#length - P#data)));

	  invariant $non_null($phys_ptr_cast(local.list, ^d_node)) ==> $mutable($s, $phys_ptr_cast(local.list, ^d_node));
      invariant $non_null($phys_ptr_cast(local.list, ^d_node)) ==> $top_writable($s, #wrTime$3^6.3, $phys_ptr_cast(local.list, ^d_node));
    {
      anon154:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#18, $s);
        assume $full_stop_ext(#tok$3^17.3, $s);
        // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
        assume $meta_eq(loopState#18, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(local.list)) ...
        if ($non_null($phys_ptr_cast(local.list, ^d_node)))
        {
          anon152:
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
            // assert @in_range_u4(+(length, 1)); 
            assert $in_range_u4(L#length + 1);
            // length := +(length, 1); 
            L#length := L#length + 1;
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
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> $mutable($s, $phys_ptr_cast(local.list, ^d_node)) && $top_writable($s, #wrTime$3^6.3, $phys_ptr_cast(local.list, ^d_node));
        }
        else
        {
          anon153:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // goto #break_1; 
            goto #break_1;
        }

      #continue_1:
        assume true;
		
// INV:LOOPTAIL
    }

  anon156:
    assume $full_stop_ext(#tok$3^17.3, $s);

  #break_1:
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll(local.list), &&(&&(dll(*((local.list->next))), ==>(@_vcc_ptr_neq_null(*((local.list->next))), @_vcc_ptr_eq_pure(*((*((local.list->next))->prev)), local.list))), unchecked!(@_vcc_oset_in(local.list, dll_reach(*((local.list->next)))))))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(local.list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(local.list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_reach(local.list), @_vcc_oset_union(dll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(local.list, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_keys(local.list), @_vcc_intset_union(dll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_list_len_next(local.list), unchecked+(dll_list_len_next(*((local.list->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), 1);
    // return length; 
    $result := L#length;
    assume true;
    assert $position_marker();
    goto #exit;

  anon157:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$3^17.3: $token;

const unique #tok$4^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(4, #file^?3Cno?20file?3E);

const unique #tok$3^6.3: $token;

const unique #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad_Bin?5CTests?5Cglist?5Cg_list_length.c: $token;

axiom $file_name_is(3, #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad_Bin?5CTests?5Cglist?5Cg_list_length.c);

const unique #file^c?3A?5Cusers?5Cdaniel?5Cworkspace?5Cvcdryad_bin?5Ctests?5Cglist?5Cdryad_dll_lseg_defs.h: $token;

axiom $file_name_is(2, #file^c?3A?5Cusers?5Cdaniel?5Cworkspace?5Cvcdryad_bin?5Ctests?5Cglist?5Cdryad_dll_lseg_defs.h);

const unique #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad?5Cvcc?5CHost?5Cbin?5CHeaders?5Cvccp.h: $token;

axiom $file_name_is(1, #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad?5Cvcc?5CHost?5Cbin?5CHeaders?5Cvccp.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^d_node);

