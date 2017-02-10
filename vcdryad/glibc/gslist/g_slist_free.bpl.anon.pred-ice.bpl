
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

const unique ^$#g_slist_free.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#g_slist_free.c..36263#3);

type $#g_slist_free.c..36263#3;

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



function F#sll_list_len_next(#s: $state, SP#x: $ptr) : int;

const unique cf#sll_list_len_next: $pure_function;

axiom (forall #s: $state, SP#x: $ptr :: { F#sll_list_len_next(#s, SP#x) } 1 < $decreases_level ==> $in_range_nat(F#sll_list_len_next(#s, SP#x)) && ($non_null($phys_ptr_cast(SP#x, ^s_node)) ==> F#sll_list_len_next(#s, SP#x) > 0) && ($is_null($phys_ptr_cast(SP#x, ^s_node)) ==> F#sll_list_len_next(#s, SP#x) == 0));

axiom $function_arg_type(cf#sll_list_len_next, 0, ^^nat);

axiom $function_arg_type(cf#sll_list_len_next, 1, $ptr_to(^s_node));

procedure sll_list_len_next(SP#x: $ptr) returns ($result: int);
  free ensures $in_range_nat($result);
  ensures $non_null($phys_ptr_cast(SP#x, ^s_node)) ==> $result > 0;
  ensures $is_null($phys_ptr_cast(SP#x, ^s_node)) ==> $result == 0;
  free ensures $result == F#sll_list_len_next($s, SP#x);
  free ensures $call_transition(old($s), $s);



function F#sll_lseg(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : bool;

const unique cf#sll_lseg: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#sll_lseg(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> F#sll_lseg(#s, SP#hd, SP#tl) == F#sll(#s, $phys_ptr_cast(SP#hd, ^s_node))) && ($phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg(#s, SP#hd, SP#tl)) && (F#sll_lseg(#s, SP#hd, SP#tl) ==> $oset_disjoint(F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), $oset_singleton($phys_ptr_cast(SP#tl, ^s_node)))) && (F#sll_lseg(#s, SP#hd, SP#tl) && F#sll(#s, $phys_ptr_cast(SP#tl, ^s_node)) ==> F#sll(#s, $phys_ptr_cast(SP#hd, ^s_node)) && F#sll_reach(#s, $phys_ptr_cast(SP#hd, ^s_node)) == $oset_union(F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), F#sll_reach(#s, $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_keys(#s, $phys_ptr_cast(SP#hd, ^s_node)) == $intset_union(F#sll_lseg_keys(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), F#sll_keys(#s, $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_list_len_next(#s, $phys_ptr_cast(SP#hd, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), F#sll_list_len_next(#s, $phys_ptr_cast(SP#tl, ^s_node)))) && (F#sll_lseg(#s, SP#hd, SP#tl) && $non_null($phys_ptr_cast(SP#tl, ^s_node)) && $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) && $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node) != $phys_ptr_cast(SP#hd, ^s_node) && !$oset_in($rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node), F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node))) ==> F#sll_lseg(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) && F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $oset_union(F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), $oset_singleton($phys_ptr_cast(SP#tl, ^s_node))) && F#sll_lseg_keys(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $intset_union(F#sll_lseg_keys(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), $intset_singleton($rd_inv(#s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node)))) && F#sll_lseg_len_next(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), 1)));

axiom $function_arg_type(cf#sll_lseg, 0, ^^bool);

axiom $function_arg_type(cf#sll_lseg, 1, $ptr_to(^s_node));

axiom $function_arg_type(cf#sll_lseg, 2, $ptr_to(^s_node));

procedure sll_lseg(SP#hd: $ptr, SP#tl: $ptr) returns ($result: bool);
  ensures $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> $result == F#sll($s, $phys_ptr_cast(SP#hd, ^s_node));
  ensures $phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> $result;
  ensures $result ==> $oset_disjoint(F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), $oset_singleton($phys_ptr_cast(SP#tl, ^s_node)));
  ensures $result && F#sll($s, $phys_ptr_cast(SP#tl, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SP#hd, ^s_node)) && F#sll_reach($s, $phys_ptr_cast(SP#hd, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), F#sll_reach($s, $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_keys($s, $phys_ptr_cast(SP#hd, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), F#sll_keys($s, $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_list_len_next($s, $phys_ptr_cast(SP#hd, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), F#sll_list_len_next($s, $phys_ptr_cast(SP#tl, ^s_node)));
  ensures $result && $non_null($phys_ptr_cast(SP#tl, ^s_node)) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node) != $phys_ptr_cast(SP#hd, ^s_node) && !$oset_in($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node), F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node))) ==> F#sll_lseg($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) && F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $oset_union(F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), $oset_singleton($phys_ptr_cast(SP#tl, ^s_node))) && F#sll_lseg_keys($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $intset_union(F#sll_lseg_keys($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node)))) && F#sll_lseg_len_next($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), 1);
  free ensures $result == F#sll_lseg($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#sll_lseg_reach(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : $oset;

const unique cf#sll_lseg_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#sll_lseg_reach(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> F#sll_lseg_reach(#s, SP#hd, SP#tl) == F#sll_reach(#s, $phys_ptr_cast(SP#hd, ^s_node))) && ($phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg_reach(#s, SP#hd, SP#tl) == $oset_empty()) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $oset_in($phys_ptr_cast(SP#hd, ^s_node), F#sll_lseg_reach(#s, SP#hd, SP#tl))));

axiom $function_arg_type(cf#sll_lseg_reach, 0, ^$#oset);

axiom $function_arg_type(cf#sll_lseg_reach, 1, $ptr_to(^s_node));

axiom $function_arg_type(cf#sll_lseg_reach, 2, $ptr_to(^s_node));

procedure sll_lseg_reach(SP#hd: $ptr, SP#tl: $ptr) returns ($result: $oset);
  ensures $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> $result == F#sll_reach($s, $phys_ptr_cast(SP#hd, ^s_node));
  ensures $phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> $result == $oset_empty();
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $oset_in($phys_ptr_cast(SP#hd, ^s_node), $result);
  free ensures $result == F#sll_lseg_reach($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#sll_lseg_keys(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : $intset;

const unique cf#sll_lseg_keys: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#sll_lseg_keys(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> F#sll_lseg_keys(#s, SP#hd, SP#tl) == F#sll_keys(#s, $phys_ptr_cast(SP#hd, ^s_node))) && ($phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg_keys(#s, SP#hd, SP#tl) == $intset_empty()) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $intset_in($rd_inv(#s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node)), F#sll_lseg_keys(#s, SP#hd, SP#tl))));

axiom $function_arg_type(cf#sll_lseg_keys, 0, ^$#intset);

axiom $function_arg_type(cf#sll_lseg_keys, 1, $ptr_to(^s_node));

axiom $function_arg_type(cf#sll_lseg_keys, 2, $ptr_to(^s_node));

procedure sll_lseg_keys(SP#hd: $ptr, SP#tl: $ptr) returns ($result: $intset);
  ensures $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> $result == F#sll_keys($s, $phys_ptr_cast(SP#hd, ^s_node));
  ensures $phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> $result == $intset_empty();
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $intset_in($rd_inv($s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node)), $result);
  free ensures $result == F#sll_lseg_keys($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#sll_lseg_len_next(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : int;

const unique cf#sll_lseg_len_next: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#sll_lseg_len_next(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> $in_range_nat(F#sll_lseg_len_next(#s, SP#hd, SP#tl)) && ($is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> F#sll_lseg_len_next(#s, SP#hd, SP#tl) == F#sll_list_len_next(#s, $phys_ptr_cast(SP#hd, ^s_node))) && ($phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg_len_next(#s, SP#hd, SP#tl) == 0) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg_len_next(#s, SP#hd, SP#tl) > 0));

axiom $function_arg_type(cf#sll_lseg_len_next, 0, ^^nat);

axiom $function_arg_type(cf#sll_lseg_len_next, 1, $ptr_to(^s_node));

axiom $function_arg_type(cf#sll_lseg_len_next, 2, $ptr_to(^s_node));

procedure sll_lseg_len_next(SP#hd: $ptr, SP#tl: $ptr) returns ($result: int);
  free ensures $in_range_nat($result);
  ensures $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> $result == F#sll_list_len_next($s, $phys_ptr_cast(SP#hd, ^s_node));
  ensures $phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> $result == 0;
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $result > 0;
  free ensures $result == F#sll_lseg_len_next($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



procedure g_slist_free(P#l: $ptr) returns (OP#ALL_REACH: $oset);
  requires F#sll($s, $phys_ptr_cast(P#l, ^s_node));
  modifies $s, $cev_pc;
  ensures OP#ALL_REACH == $oset_empty();
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation g_slist_free(P#l: $ptr) returns (OP#ALL_REACH: $oset)
{
  var stmtexpr2#4: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr1#3: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr0#2: $ptr;
  var SL#x0: $ptr;
  var L#next: $ptr;
  var loopState#0: $state;
  var L#x: $ptr;
  var stmtexpr1#6: $oset;
  var stmtexpr0#5: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$2^3.3: int;
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

// INV:PTR: P#l, L#x
// INV:INT:
// INV:LST: sll

  anon4:
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
    // _dryad_G0 := sll_reach(l); 
    call SL#_dryad_G0 := sll_reach($phys_ptr_cast(P#l, ^s_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _math \oset stmtexpr0#5; 
    // stmtexpr0#5 := _dryad_G0; 
    stmtexpr0#5 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#6; 
    // stmtexpr1#6 := _dryad_G1; 
    stmtexpr1#6 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
    // struct s_node* x; 
    // assume ==>(@_vcc_ptr_neq_null(l), &&(@_vcc_mutable(@state, l), @writes_check(l))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> $mutable($s, $phys_ptr_cast(P#l, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(P#l, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(l), @_vcc_is_malloc_root(@state, l)); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> $is_malloc_root($s, $phys_ptr_cast(P#l, ^s_node));
    // ALL_REACH := sll_reach(l); 
    call OP#ALL_REACH := sll_reach($phys_ptr_cast(P#l, ^s_node));
    assume $full_stop_ext(#tok$2^10.23, $s);
    // x := l; 
    L#x := $phys_ptr_cast(P#l, ^s_node);
    // assert sll_lseg(x, x); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#x, ^s_node), $phys_ptr_cast(L#x, ^s_node));
    // assume sll_lseg(x, x); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#x, ^s_node), $phys_ptr_cast(L#x, ^s_node));
    // assert sll_lseg(l, l); 
    assert F#sll_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(P#l, ^s_node));
    // assume sll_lseg(l, l); 
    assume F#sll_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(P#l, ^s_node));
    loopState#0 := $s;
    assume true;
p0000 := (F#sll($s,$phys_ptr_cast(P#l,^s_node)));
p0001 := (F#sll($s,$phys_ptr_cast(L#x,^s_node)));
p0002 := (F#sll_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#x,^s_node)));
p0003 := (F#sll_lseg($s,$phys_ptr_cast(L#x,^s_node),$phys_ptr_cast(P#l,^s_node)));
p0004 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#l,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#x,^s_node))));
p0005 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#x,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0006 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#x,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#x,^s_node))));
p0007 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#x,^s_node),$phys_ptr_cast(P#l,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0008 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#l,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#x,^s_node))));
p0009 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#x,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0010 := ($non_null($phys_ptr_cast(P#l,^s_node)));
p0011 := ($non_null($phys_ptr_cast(L#x,^s_node)));
p0012 := ($is_null($phys_ptr_cast(P#l,^s_node)));
p0013 := ($is_null($phys_ptr_cast(L#x,^s_node)));
p0014 := (($phys_ptr_cast(P#l,^s_node) == $phys_ptr_cast(L#x,^s_node)));
p0015 := (($phys_ptr_cast(L#x,^s_node) == $phys_ptr_cast(P#l,^s_node)));
p0016 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node))));
p0017 := (($non_null($phys_ptr_cast(L#x,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#x,^s_node),^s_node))));
p0018 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node))));
p0019 := (($non_null($phys_ptr_cast(L#x,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#x,^s_node),^s_node))));
p0020 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node) == $phys_ptr_cast(L#x,^s_node))));
p0021 := (($non_null($phys_ptr_cast(L#x,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#x,^s_node),^s_node) == $phys_ptr_cast(P#l,^s_node))));

    while (true)

invariant (p0000 == (F#sll($s,$phys_ptr_cast(P#l,^s_node))));
invariant (p0001 == (F#sll($s,$phys_ptr_cast(L#x,^s_node))));
invariant (p0002 == (F#sll_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#x,^s_node))));
invariant (p0003 == (F#sll_lseg($s,$phys_ptr_cast(L#x,^s_node),$phys_ptr_cast(P#l,^s_node))));
invariant (p0004 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#l,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#x,^s_node)))));
invariant (p0005 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#x,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#l,^s_node)))));
invariant (p0006 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#x,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#x,^s_node)))));
invariant (p0007 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#x,^s_node),$phys_ptr_cast(P#l,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#l,^s_node)))));
invariant (p0008 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#l,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#x,^s_node)))));
invariant (p0009 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#x,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#l,^s_node)))));
invariant (p0010 == ($non_null($phys_ptr_cast(P#l,^s_node))));
invariant (p0011 == ($non_null($phys_ptr_cast(L#x,^s_node))));
invariant (p0012 == ($is_null($phys_ptr_cast(P#l,^s_node))));
invariant (p0013 == ($is_null($phys_ptr_cast(L#x,^s_node))));
invariant (p0014 == (($phys_ptr_cast(P#l,^s_node) == $phys_ptr_cast(L#x,^s_node))));
invariant (p0015 == (($phys_ptr_cast(L#x,^s_node) == $phys_ptr_cast(P#l,^s_node))));
invariant (p0016 == (($non_null($phys_ptr_cast(P#l,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node)))));
invariant (p0017 == (($non_null($phys_ptr_cast(L#x,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#x,^s_node),^s_node)))));
invariant (p0018 == (($non_null($phys_ptr_cast(P#l,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node)))));
invariant (p0019 == (($non_null($phys_ptr_cast(L#x,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#x,^s_node),^s_node)))));
invariant (p0020 == (($non_null($phys_ptr_cast(P#l,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node) == $phys_ptr_cast(L#x,^s_node)))));
invariant (p0021 == (($non_null($phys_ptr_cast(L#x,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#x,^s_node),^s_node) == $phys_ptr_cast(P#l,^s_node)))));

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

      invariant $non_null($phys_ptr_cast(L#x, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#x, ^s_node));
      invariant $non_null($phys_ptr_cast(L#x, ^s_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#x, ^s_node));
      invariant $non_null($phys_ptr_cast(L#x, ^s_node)) ==> $is_malloc_root($s, $phys_ptr_cast(L#x, ^s_node));
      invariant OP#ALL_REACH == F#sll_reach($s, $phys_ptr_cast(L#x, ^s_node));
    {
      anon3:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#0, $s);
        assume $full_stop_ext(#tok$2^13.3, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(x)) ...
        if ($non_null($phys_ptr_cast(L#x, ^s_node)))
        {
          anon1:
            // assume ==>(@_vcc_ptr_neq_null(x), ==(sll_keys(x), @_vcc_intset_union(sll_keys(*((x->next))), @_vcc_intset_singleton(*((x->key)))))); 
            assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#x, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#x, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(sll_list_len_next(x), unchecked+(sll_list_len_next(*((x->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#x, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(x), ==(sll(x), &&(sll(*((x->next))), unchecked!(@_vcc_oset_in(x, sll_reach(*((x->next)))))))); 
            assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#x, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(sll_reach(x), @_vcc_oset_union(sll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
            assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#x, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#x, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // struct s_node* next; 
            // assume ==>(&&(@_vcc_ptr_neq_null(x), @_vcc_ptr_neq_null(*((x->next)))), &&(==(@_vcc_mutable(@state, x), @_vcc_mutable(@state, *((x->next)))), ==(@writes_check(x), @writes_check(*((x->next)))))); 
            assume $non_null($phys_ptr_cast(L#x, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#x, ^s_node)) == $mutable($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#x, ^s_node)) == $top_writable($s, #wrTime$2^3.3, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(x), @_vcc_ptr_neq_null(*((x->next)))), ==(@_vcc_is_malloc_root(@state, *((x->next))), @_vcc_is_malloc_root(@state, x))); 
            assume $non_null($phys_ptr_cast(L#x, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)) ==> $is_malloc_root($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)) == $is_malloc_root($s, $phys_ptr_cast(L#x, ^s_node));
            // struct s_node* x0; 
            // x0 := x; 
            SL#x0 := $phys_ptr_cast(L#x, ^s_node);
            // struct s_node* stmtexpr0#2; 
            // stmtexpr0#2 := x0; 
            stmtexpr0#2 := $phys_ptr_cast(SL#x0, ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(x), ==(sll_keys(x), @_vcc_intset_union(sll_keys(*((x->next))), @_vcc_intset_singleton(*((x->key)))))); 
            assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#x, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#x, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(sll_list_len_next(x), unchecked+(sll_list_len_next(*((x->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#x, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(x), ==(sll(x), &&(sll(*((x->next))), unchecked!(@_vcc_oset_in(x, sll_reach(*((x->next)))))))); 
            assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#x, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(sll_reach(x), @_vcc_oset_union(sll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
            assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#x, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#x, ^s_node)));
            // assert @reads_check_normal((x->next)); 
            assert $thread_local($s, $phys_ptr_cast(L#x, ^s_node));
            // next := *((x->next)); 
            L#next := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_keys(next), @_vcc_intset_union(sll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_list_len_next(next), unchecked+(sll_list_len_next(*((next->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll(next), &&(sll(*((next->next))), unchecked!(@_vcc_oset_in(next, sll_reach(*((next->next)))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_reach(next), @_vcc_oset_union(sll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(sll_keys(x), @_vcc_intset_union(sll_keys(*((x->next))), @_vcc_intset_singleton(*((x->key)))))); 
            assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#x, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#x, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(sll_list_len_next(x), unchecked+(sll_list_len_next(*((x->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#x, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(x), ==(sll(x), &&(sll(*((x->next))), unchecked!(@_vcc_oset_in(x, sll_reach(*((x->next)))))))); 
            assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#x, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(x), ==(sll_reach(x), @_vcc_oset_union(sll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
            assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#x, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#x, ^s_node)));
            // _math \state _dryad_S0; 
            // _dryad_S0 := @_vcc_current_state(@state); 
            SL#_dryad_S0 := $current_state($s);
            // _math \state stmtexpr1#3; 
            // stmtexpr1#3 := _dryad_S0; 
            stmtexpr1#3 := SL#_dryad_S0;
            // void function
            // assert @writes_check(x); 
            assert $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#x, ^s_node));
            // assert @writes_check(@_vcc_extent(@state, x)); 
            assert (forall #writes$2^22.5: $ptr :: { $dont_instantiate(#writes$2^22.5) } $set_in(#writes$2^22.5, $extent($s, $phys_ptr_cast(L#x, ^s_node))) ==> $top_writable($s, #wrTime$2^3.3, #writes$2^22.5));
            // stmt _vcc_free(x); 
            call $free($phys_ptr_cast(L#x, ^s_node));
            assume $full_stop_ext(#tok$2^22.5, $s);
            // _math \state _dryad_S1; 
            // _dryad_S1 := @_vcc_current_state(@state); 
            SL#_dryad_S1 := $current_state($s);
            // _math \state stmtexpr2#4; 
            // stmtexpr2#4 := _dryad_S1; 
            stmtexpr2#4 := SL#_dryad_S1;
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, sll_reach(x0)))), ==(old(_dryad_S0, sll_keys(x0)), old(_dryad_S1, sll_keys(x0)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(SL#x0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, sll_reach(x0)))), ==(old(_dryad_S0, sll_list_len_next(x0)), old(_dryad_S1, sll_list_len_next(x0)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(SL#x0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, sll_reach(x0)))), ==(old(_dryad_S0, sll(x0)), old(_dryad_S1, sll(x0)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(SL#x0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, sll_reach(x0)))), ==(old(_dryad_S0, sll_reach(x0)), old(_dryad_S1, sll_reach(x0)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#x0, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(SL#x0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, sll_reach(next)))), ==(old(_dryad_S0, sll_keys(next)), old(_dryad_S1, sll_keys(next)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, sll_reach(next)))), ==(old(_dryad_S0, sll_list_len_next(next)), old(_dryad_S1, sll_list_len_next(next)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, sll_reach(next)))), ==(old(_dryad_S0, sll(next)), old(_dryad_S1, sll(next)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, sll_reach(next)))), ==(old(_dryad_S0, sll_reach(next)), old(_dryad_S1, sll_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, sll_reach(l)))), ==(old(_dryad_S0, sll_keys(l)), old(_dryad_S1, sll_keys(l)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, sll_reach(l)))), ==(old(_dryad_S0, sll_list_len_next(l)), old(_dryad_S1, sll_list_len_next(l)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, sll_reach(l)))), ==(old(_dryad_S0, sll(l)), old(_dryad_S1, sll(l)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, sll_reach(l)))), ==(old(_dryad_S0, sll_reach(l)), old(_dryad_S1, sll_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(P#l, ^s_node));
            // ALL_REACH := @_vcc_oset_diff(ALL_REACH, @_vcc_oset_singleton(x)); 
            OP#ALL_REACH := $oset_diff(OP#ALL_REACH, $oset_singleton($phys_ptr_cast(L#x, ^s_node)));
            // x := next; 
            L#x := $phys_ptr_cast(L#next, ^s_node);
            // assert sll_lseg(x0, x0); 
            assert F#sll_lseg($s, $phys_ptr_cast(SL#x0, ^s_node), $phys_ptr_cast(SL#x0, ^s_node));
            // assume sll_lseg(x0, x0); 
            assume F#sll_lseg($s, $phys_ptr_cast(SL#x0, ^s_node), $phys_ptr_cast(SL#x0, ^s_node));
            // assert sll_lseg(next, next); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#next, ^s_node), $phys_ptr_cast(L#next, ^s_node));
            // assume sll_lseg(next, next); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#next, ^s_node), $phys_ptr_cast(L#next, ^s_node));
            // assert sll_lseg(x, x); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#x, ^s_node), $phys_ptr_cast(L#x, ^s_node));
            // assume sll_lseg(x, x); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#x, ^s_node), $phys_ptr_cast(L#x, ^s_node));
            // assert sll_lseg(l, l); 
            assert F#sll_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(P#l, ^s_node));
            // assume sll_lseg(l, l); 
            assume F#sll_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(P#l, ^s_node));
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
p0000 := (F#sll($s,$phys_ptr_cast(P#l,^s_node)));
p0001 := (F#sll($s,$phys_ptr_cast(L#x,^s_node)));
p0002 := (F#sll_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#x,^s_node)));
p0003 := (F#sll_lseg($s,$phys_ptr_cast(L#x,^s_node),$phys_ptr_cast(P#l,^s_node)));
p0004 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#l,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#x,^s_node))));
p0005 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#x,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0006 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#x,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#x,^s_node))));
p0007 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#x,^s_node),$phys_ptr_cast(P#l,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0008 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#l,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#x,^s_node))));
p0009 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#x,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0010 := ($non_null($phys_ptr_cast(P#l,^s_node)));
p0011 := ($non_null($phys_ptr_cast(L#x,^s_node)));
p0012 := ($is_null($phys_ptr_cast(P#l,^s_node)));
p0013 := ($is_null($phys_ptr_cast(L#x,^s_node)));
p0014 := (($phys_ptr_cast(P#l,^s_node) == $phys_ptr_cast(L#x,^s_node)));
p0015 := (($phys_ptr_cast(L#x,^s_node) == $phys_ptr_cast(P#l,^s_node)));
p0016 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node))));
p0017 := (($non_null($phys_ptr_cast(L#x,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#x,^s_node),^s_node))));
p0018 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node))));
p0019 := (($non_null($phys_ptr_cast(L#x,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#x,^s_node),^s_node))));
p0020 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node) == $phys_ptr_cast(L#x,^s_node))));
p0021 := (($non_null($phys_ptr_cast(L#x,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#x,^s_node),^s_node) == $phys_ptr_cast(P#l,^s_node))));

    }

  anon5:
    assume $full_stop_ext(#tok$2^13.3, $s);

  #break_1:
    // assume ==>(@_vcc_ptr_neq_null(x), ==(sll_keys(x), @_vcc_intset_union(sll_keys(*((x->next))), @_vcc_intset_singleton(*((x->key)))))); 
    assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#x, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#x, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(x), ==(sll_list_len_next(x), unchecked+(sll_list_len_next(*((x->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#x, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(x), ==(sll(x), &&(sll(*((x->next))), unchecked!(@_vcc_oset_in(x, sll_reach(*((x->next)))))))); 
    assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#x, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#x, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(x), ==(sll_reach(x), @_vcc_oset_union(sll_reach(*((x->next))), @_vcc_oset_singleton(x)))); 
    assume $non_null($phys_ptr_cast(L#x, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#x, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#x, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#x, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
    // return; 
    assume true;
    assert $position_marker();
    goto #exit;

  #exit:
}



const unique l#public: $label;

const unique #tok$2^22.5: $token;

const unique #tok$2^13.3: $token;

const unique #tok$2^10.23: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^3.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Cgslist?5Cg_slist_free.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Cgslist?5Cg_slist_free.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Cgslist?5Cdryad_gslist_sll.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Cgslist?5Cdryad_gslist_sll.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^s_node);

