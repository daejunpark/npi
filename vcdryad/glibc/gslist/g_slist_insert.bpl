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

const unique ^$#g_slist_insert.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#g_slist_insert.c..36263#3);

type $#g_slist_insert.c..36263#3;

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



procedure g_slist_prepend(P#list: $ptr, P#data: int) returns ($result: $ptr);
  requires F#sll($s, $phys_ptr_cast(P#list, ^s_node));
  modifies $s, $cev_pc;
  ensures F#sll($s, $phys_ptr_cast($result, ^s_node));
  ensures F#sll_keys($s, $phys_ptr_cast($result, ^s_node)) == $intset_union(F#sll_keys(old($s), $phys_ptr_cast(P#list, ^s_node)), $intset_singleton(P#data));
  ensures !$oset_in($phys_ptr_cast($result, ^s_node), F#sll_reach(old($s), $phys_ptr_cast(P#list, ^s_node)));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



procedure g_slist_append(P#list: $ptr, P#data: int) returns ($result: $ptr);
  requires F#sll($s, $phys_ptr_cast(P#list, ^s_node));
  modifies $s, $cev_pc;
  ensures F#sll($s, $phys_ptr_cast($result, ^s_node));
  ensures F#sll_keys($s, $phys_ptr_cast($result, ^s_node)) == $intset_union(F#sll_keys(old($s), $phys_ptr_cast(P#list, ^s_node)), $intset_singleton(P#data));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



procedure g_slist_insert(P#list: $ptr, P#data: int, P#pos: int) returns ($result: $ptr);
  requires F#sll($s, $phys_ptr_cast(P#list, ^s_node));
  modifies $s, $cev_pc;
  ensures F#sll($s, $phys_ptr_cast($result, ^s_node));
  ensures F#sll_keys($s, $phys_ptr_cast($result, ^s_node)) == $intset_union(F#sll_keys(old($s), $phys_ptr_cast(P#list, ^s_node)), $intset_singleton(P#data));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation g_slist_insert(P#list: $ptr, P#data: int, P#pos: int) returns ($result: $ptr)
{
  var stmtexpr11#19: $state;
  var SL#_dryad_S7: $state;
  var stmtexpr10#18: $state;
  var SL#_dryad_S6: $state;
  var stmtexpr9#17: $state;
  var _dryad_S5#1: $state;
  var stmtexpr8#16: $state;
  var _dryad_S4#0: $state;
  var stmtexpr7#15: $ptr;
  var SL#prev_list1: $ptr;
  var stmtexpr0#7: $ptr;
  var SL#tmp_list1: $ptr;
  var ite#1: bool;
  var loopState#0: $state;
  var stmtexpr1#6: $state;
  var SL#_dryad_S5: $state;
  var stmtexpr0#5: $state;
  var SL#_dryad_S4: $state;
  var stmtexpr6#14: $state;
  var SL#_dryad_S3: $state;
  var stmtexpr5#13: $state;
  var SL#_dryad_S2: $state;
  var stmtexpr4#12: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr3#11: $oset;
  var stmtexpr2#10: $state;
  var SL#_dryad_S0: $state;
  var res_g_slist_prepend#4: $ptr;
  var res_g_slist_append#3: $ptr;
  var L#prev_list: $ptr;
  var L#tmp_list: $ptr;
  var L#new_list: $ptr;
  var L#tmp_prev: $ptr;
  var stmtexpr1#9: $oset;
  var stmtexpr0#8: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var local.pos: int where $in_range_i4(local.pos);
  var #wrTime$3^16.3: int;
  var #stackframe: int;

  anon10:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$3^16.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$3^16.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$3^16.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @in_range_i4(data); 
    assume $in_range_i4(P#data);
    // assume @in_range_i4(pos); 
    assume $in_range_i4(P#pos);
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    // int32_t local.pos; 
    // local.pos := pos; 
    local.pos := P#pos;
    // assume true
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := sll_reach(list); 
    call SL#_dryad_G0 := sll_reach($phys_ptr_cast(P#list, ^s_node));
    assume $full_stop_ext(#tok$4^0.0, $s);
    // _math \oset stmtexpr0#8; 
    // stmtexpr0#8 := _dryad_G0; 
    stmtexpr0#8 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#9; 
    // stmtexpr1#9 := _dryad_G1; 
    stmtexpr1#9 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_keys(list), @_vcc_intset_union(sll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_list_len_next(list), unchecked+(sll_list_len_next(*((list->next))), 1))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll(list), &&(sll(*((list->next))), unchecked!(@_vcc_oset_in(list, sll_reach(*((list->next)))))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_reach(list), @_vcc_oset_union(sll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
    // struct s_node* tmp_prev; 
    // struct s_node* new_list; 
    // struct s_node* tmp_list; 
    // struct s_node* prev_list; 
    assume true;
    // if (<(local.pos, 0)) ...
    if (local.pos < 0)
    {
      anon1:
        // struct s_node* res_g_slist_append#3; 
        // res_g_slist_append#3 := g_slist_append(list, data); 
        call res_g_slist_append#3 := g_slist_append($phys_ptr_cast(P#list, ^s_node), P#data);
        assume $full_stop_ext(#tok$3^23.12, $s);
        // return res_g_slist_append#3; 
        $result := $phys_ptr_cast(res_g_slist_append#3, ^s_node);
        assume true;
        assert $position_marker();
        goto #exit;
    }
    else
    {
      anon2:
        // assert @_vcc_possibly_unreachable; 
        assert {:PossiblyUnreachable true} true;
    }

  anon11:
    assume true;
    // if (==(local.pos, 0)) ...
    if (local.pos == 0)
    {
      anon3:
        // struct s_node* res_g_slist_prepend#4; 
        // res_g_slist_prepend#4 := g_slist_prepend(list, data); 
        call res_g_slist_prepend#4 := g_slist_prepend($phys_ptr_cast(P#list, ^s_node), P#data);
        assume $full_stop_ext(#tok$3^26.12, $s);
        // return res_g_slist_prepend#4; 
        $result := $phys_ptr_cast(res_g_slist_prepend#4, ^s_node);
        assume true;
        assert $position_marker();
        goto #exit;
    }
    else
    {
      anon4:
        // assert @_vcc_possibly_unreachable; 
        assert {:PossiblyUnreachable true} true;
    }

  anon12:
    // assume ==>(@_vcc_ptr_neq_null(list), &&(@_vcc_mutable(@state, list), @writes_check(list))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> $mutable($s, $phys_ptr_cast(P#list, ^s_node)) && $top_writable($s, #wrTime$3^16.3, $phys_ptr_cast(P#list, ^s_node));
    // var struct s_node* prev_list
    // var struct s_node* tmp_list
    // var struct s_node* new_list
    // _math \state _dryad_S0; 
    // _dryad_S0 := @_vcc_current_state(@state); 
    SL#_dryad_S0 := $current_state($s);
    // _math \state stmtexpr2#10; 
    // stmtexpr2#10 := _dryad_S0; 
    stmtexpr2#10 := SL#_dryad_S0;
    // new_list := _vcc_alloc(@_vcc_typeof((struct s_node*)@null)); 
    call L#new_list := $alloc(^s_node);
    assume $full_stop_ext(#tok$3^33.14, $s);
    // assume !(@_vcc_oset_in(new_list, @_vcc_oset_union(_dryad_G0, _dryad_G1))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), $oset_union(SL#_dryad_G0, SL#_dryad_G1));
    // _dryad_G1 := @_vcc_oset_union(_dryad_G0, @_vcc_oset_singleton(new_list)); 
    SL#_dryad_G1 := $oset_union(SL#_dryad_G0, $oset_singleton($phys_ptr_cast(L#new_list, ^s_node)));
    // _math \oset stmtexpr3#11; 
    // stmtexpr3#11 := _dryad_G1; 
    stmtexpr3#11 := SL#_dryad_G1;
    // assume ==(glob_reach(), _dryad_G1); 
    assume F#glob_reach() == SL#_dryad_G1;
    // _math \state _dryad_S1; 
    // _dryad_S1 := @_vcc_current_state(@state); 
    SL#_dryad_S1 := $current_state($s);
    // _math \state stmtexpr4#12; 
    // stmtexpr4#12 := _dryad_S1; 
    stmtexpr4#12 := SL#_dryad_S1;
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_keys(prev_list), @_vcc_intset_union(sll_keys(*((prev_list->next))), @_vcc_intset_singleton(*((prev_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_list_len_next(prev_list), unchecked+(sll_list_len_next(*((prev_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll(prev_list), &&(sll(*((prev_list->next))), unchecked!(@_vcc_oset_in(prev_list, sll_reach(*((prev_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_reach(prev_list), @_vcc_oset_union(sll_reach(*((prev_list->next))), @_vcc_oset_singleton(prev_list)))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev_list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_keys(tmp_list), @_vcc_intset_union(sll_keys(*((tmp_list->next))), @_vcc_intset_singleton(*((tmp_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_list_len_next(tmp_list), unchecked+(sll_list_len_next(*((tmp_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll(tmp_list), &&(sll(*((tmp_list->next))), unchecked!(@_vcc_oset_in(tmp_list, sll_reach(*((tmp_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_reach(tmp_list), @_vcc_oset_union(sll_reach(*((tmp_list->next))), @_vcc_oset_singleton(tmp_list)))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_keys(new_list), @_vcc_intset_union(sll_keys(*((new_list->next))), @_vcc_intset_singleton(*((new_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#new_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#new_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_list_len_next(new_list), unchecked+(sll_list_len_next(*((new_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#new_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll(new_list), &&(sll(*((new_list->next))), unchecked!(@_vcc_oset_in(new_list, sll_reach(*((new_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#new_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_reach(new_list), @_vcc_oset_union(sll_reach(*((new_list->next))), @_vcc_oset_singleton(new_list)))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#new_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#new_list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_keys(tmp_prev), @_vcc_intset_union(sll_keys(*((tmp_prev->next))), @_vcc_intset_singleton(*((tmp_prev->key)))))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_list_len_next(tmp_prev), unchecked+(sll_list_len_next(*((tmp_prev->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll(tmp_prev), &&(sll(*((tmp_prev->next))), unchecked!(@_vcc_oset_in(tmp_prev, sll_reach(*((tmp_prev->next)))))))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_reach(tmp_prev), @_vcc_oset_union(sll_reach(*((tmp_prev->next))), @_vcc_oset_singleton(tmp_prev)))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_prev, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_keys(list), @_vcc_intset_union(sll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_list_len_next(list), unchecked+(sll_list_len_next(*((list->next))), 1))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll(list), &&(sll(*((list->next))), unchecked!(@_vcc_oset_in(list, sll_reach(*((list->next)))))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_reach(list), @_vcc_oset_union(sll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(prev_list)))), ==(old(_dryad_S0, sll_keys(prev_list)), old(_dryad_S1, sll_keys(prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(prev_list)))), ==(old(_dryad_S0, sll_list_len_next(prev_list)), old(_dryad_S1, sll_list_len_next(prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(prev_list)))), ==(old(_dryad_S0, sll(prev_list)), old(_dryad_S1, sll(prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(prev_list)))), ==(old(_dryad_S0, sll_reach(prev_list)), old(_dryad_S1, sll_reach(prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(tmp_list)))), ==(old(_dryad_S0, sll_keys(tmp_list)), old(_dryad_S1, sll_keys(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(tmp_list)))), ==(old(_dryad_S0, sll_list_len_next(tmp_list)), old(_dryad_S1, sll_list_len_next(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(tmp_list)))), ==(old(_dryad_S0, sll(tmp_list)), old(_dryad_S1, sll(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(tmp_list)))), ==(old(_dryad_S0, sll_reach(tmp_list)), old(_dryad_S1, sll_reach(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(tmp_prev)))), ==(old(_dryad_S0, sll_keys(tmp_prev)), old(_dryad_S1, sll_keys(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(tmp_prev)))), ==(old(_dryad_S0, sll_list_len_next(tmp_prev)), old(_dryad_S1, sll_list_len_next(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(tmp_prev)))), ==(old(_dryad_S0, sll(tmp_prev)), old(_dryad_S1, sll(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(tmp_prev)))), ==(old(_dryad_S0, sll_reach(tmp_prev)), old(_dryad_S1, sll_reach(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(list)))), ==(old(_dryad_S0, sll_keys(list)), old(_dryad_S1, sll_keys(list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(P#list, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(list)))), ==(old(_dryad_S0, sll_list_len_next(list)), old(_dryad_S1, sll_list_len_next(list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(P#list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(list)))), ==(old(_dryad_S0, sll(list)), old(_dryad_S1, sll(list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(P#list, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S0, sll_reach(list)))), ==(old(_dryad_S0, sll_reach(list)), old(_dryad_S1, sll_reach(list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#list, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(P#list, ^s_node));
    // assume @_vcc_ptr_neq_null(new_list); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node));
    // _math \state _dryad_S2; 
    // _dryad_S2 := @_vcc_current_state(@state); 
    SL#_dryad_S2 := $current_state($s);
    // _math \state stmtexpr5#13; 
    // stmtexpr5#13 := _dryad_S2; 
    stmtexpr5#13 := SL#_dryad_S2;
    // assert @prim_writes_check((new_list->key)); 
    assert $writable_prim($s, #wrTime$3^16.3, $dot($phys_ptr_cast(L#new_list, ^s_node), s_node.key));
    // *(new_list->key) := data; 
    call $write_int(s_node.key, $phys_ptr_cast(L#new_list, ^s_node), P#data);
    assume $full_stop_ext(#tok$3^35.3, $s);
    // _math \state _dryad_S3; 
    // _dryad_S3 := @_vcc_current_state(@state); 
    SL#_dryad_S3 := $current_state($s);
    // _math \state stmtexpr6#14; 
    // stmtexpr6#14 := _dryad_S3; 
    stmtexpr6#14 := SL#_dryad_S3;
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(*((new_list->next)))))), ==(old(_dryad_S2, sll_keys(*((new_list->next)))), old(_dryad_S3, sll_keys(*((new_list->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node))) ==> F#sll_keys(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)) == F#sll_keys(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(*((new_list->next)))))), ==(old(_dryad_S2, sll_list_len_next(*((new_list->next)))), old(_dryad_S3, sll_list_len_next(*((new_list->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(*((new_list->next)))))), ==(old(_dryad_S2, sll(*((new_list->next)))), old(_dryad_S3, sll(*((new_list->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node))) ==> F#sll(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)) == F#sll(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(*((new_list->next)))))), ==(old(_dryad_S2, sll_reach(*((new_list->next)))), old(_dryad_S3, sll_reach(*((new_list->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node))) ==> F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)) == F#sll_reach(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node));
    // assume ==(old(_dryad_S2, sll_list_len_next(prev_list)), old(_dryad_S3, sll_list_len_next(prev_list))); 
    assume F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==(old(_dryad_S2, sll(prev_list)), old(_dryad_S3, sll(prev_list))); 
    assume F#sll(SL#_dryad_S2, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==(old(_dryad_S2, sll_reach(prev_list)), old(_dryad_S3, sll_reach(prev_list))); 
    assume F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==(old(_dryad_S2, sll_list_len_next(tmp_list)), old(_dryad_S3, sll_list_len_next(tmp_list))); 
    assume F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==(old(_dryad_S2, sll(tmp_list)), old(_dryad_S3, sll(tmp_list))); 
    assume F#sll(SL#_dryad_S2, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==(old(_dryad_S2, sll_reach(tmp_list)), old(_dryad_S3, sll_reach(tmp_list))); 
    assume F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==(old(_dryad_S2, sll_list_len_next(new_list)), old(_dryad_S3, sll_list_len_next(new_list))); 
    assume F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(L#new_list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(L#new_list, ^s_node));
    // assume ==(old(_dryad_S2, sll(new_list)), old(_dryad_S3, sll(new_list))); 
    assume F#sll(SL#_dryad_S2, $phys_ptr_cast(L#new_list, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(L#new_list, ^s_node));
    // assume ==(old(_dryad_S2, sll_reach(new_list)), old(_dryad_S3, sll_reach(new_list))); 
    assume F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#new_list, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(L#new_list, ^s_node));
    // assume ==(old(_dryad_S2, sll_list_len_next(tmp_prev)), old(_dryad_S3, sll_list_len_next(tmp_prev))); 
    assume F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==(old(_dryad_S2, sll(tmp_prev)), old(_dryad_S3, sll(tmp_prev))); 
    assume F#sll(SL#_dryad_S2, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==(old(_dryad_S2, sll_reach(tmp_prev)), old(_dryad_S3, sll_reach(tmp_prev))); 
    assume F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==(old(_dryad_S2, sll_list_len_next(list)), old(_dryad_S3, sll_list_len_next(list))); 
    assume F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(P#list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(P#list, ^s_node));
    // assume ==(old(_dryad_S2, sll(list)), old(_dryad_S3, sll(list))); 
    assume F#sll(SL#_dryad_S2, $phys_ptr_cast(P#list, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(P#list, ^s_node));
    // assume ==(old(_dryad_S2, sll_reach(list)), old(_dryad_S3, sll_reach(list))); 
    assume F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#list, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(prev_list)))), ==(old(_dryad_S2, sll_keys(prev_list)), old(_dryad_S3, sll_keys(prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_keys(SL#_dryad_S2, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_keys(SL#_dryad_S3, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(prev_list)))), ==(old(_dryad_S2, sll_list_len_next(prev_list)), old(_dryad_S3, sll_list_len_next(prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(prev_list)))), ==(old(_dryad_S2, sll(prev_list)), old(_dryad_S3, sll(prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(prev_list)))), ==(old(_dryad_S2, sll_reach(prev_list)), old(_dryad_S3, sll_reach(prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(tmp_list)))), ==(old(_dryad_S2, sll_keys(tmp_list)), old(_dryad_S3, sll_keys(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_keys(SL#_dryad_S2, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_keys(SL#_dryad_S3, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(tmp_list)))), ==(old(_dryad_S2, sll_list_len_next(tmp_list)), old(_dryad_S3, sll_list_len_next(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(tmp_list)))), ==(old(_dryad_S2, sll(tmp_list)), old(_dryad_S3, sll(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(tmp_list)))), ==(old(_dryad_S2, sll_reach(tmp_list)), old(_dryad_S3, sll_reach(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(tmp_prev)))), ==(old(_dryad_S2, sll_keys(tmp_prev)), old(_dryad_S3, sll_keys(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll_keys(SL#_dryad_S2, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_keys(SL#_dryad_S3, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(tmp_prev)))), ==(old(_dryad_S2, sll_list_len_next(tmp_prev)), old(_dryad_S3, sll_list_len_next(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(tmp_prev)))), ==(old(_dryad_S2, sll(tmp_prev)), old(_dryad_S3, sll(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(tmp_prev)))), ==(old(_dryad_S2, sll_reach(tmp_prev)), old(_dryad_S3, sll_reach(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(list)))), ==(old(_dryad_S2, sll_keys(list)), old(_dryad_S3, sll_keys(list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_keys(SL#_dryad_S2, $phys_ptr_cast(P#list, ^s_node)) == F#sll_keys(SL#_dryad_S3, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(list)))), ==(old(_dryad_S2, sll_list_len_next(list)), old(_dryad_S3, sll_list_len_next(list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(P#list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(list)))), ==(old(_dryad_S2, sll(list)), old(_dryad_S3, sll(list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(P#list, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S2, sll_reach(list)))), ==(old(_dryad_S2, sll_reach(list)), old(_dryad_S3, sll_reach(list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#list, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, prev_list)), ==(*((prev_list->key)), old(_dryad_S2, *((prev_list->key))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#prev_list, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node)) == $rd_inv(SL#_dryad_S2, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, prev_list)), @_vcc_ptr_eq_pure(*((prev_list->next)), old(_dryad_S2, *((prev_list->next))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#prev_list, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node);
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, tmp_list)), ==(*((tmp_list->key)), old(_dryad_S2, *((tmp_list->key))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#tmp_list, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node)) == $rd_inv(SL#_dryad_S2, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, tmp_list)), @_vcc_ptr_eq_pure(*((tmp_list->next)), old(_dryad_S2, *((tmp_list->next))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#tmp_list, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node);
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, tmp_prev)), ==(*((tmp_prev->key)), old(_dryad_S2, *((tmp_prev->key))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#tmp_prev, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $rd_inv(SL#_dryad_S2, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, tmp_prev)), @_vcc_ptr_eq_pure(*((tmp_prev->next)), old(_dryad_S2, *((tmp_prev->next))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#tmp_prev, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node);
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, list)), ==(*((list->key)), old(_dryad_S2, *((list->key))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(P#list, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node)) == $rd_inv(SL#_dryad_S2, s_node.key, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, list)), @_vcc_ptr_eq_pure(*((list->next)), old(_dryad_S2, *((list->next))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(P#list, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node);
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_keys(prev_list), @_vcc_intset_union(sll_keys(*((prev_list->next))), @_vcc_intset_singleton(*((prev_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_list_len_next(prev_list), unchecked+(sll_list_len_next(*((prev_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll(prev_list), &&(sll(*((prev_list->next))), unchecked!(@_vcc_oset_in(prev_list, sll_reach(*((prev_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_reach(prev_list), @_vcc_oset_union(sll_reach(*((prev_list->next))), @_vcc_oset_singleton(prev_list)))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev_list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_keys(tmp_list), @_vcc_intset_union(sll_keys(*((tmp_list->next))), @_vcc_intset_singleton(*((tmp_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_list_len_next(tmp_list), unchecked+(sll_list_len_next(*((tmp_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll(tmp_list), &&(sll(*((tmp_list->next))), unchecked!(@_vcc_oset_in(tmp_list, sll_reach(*((tmp_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_reach(tmp_list), @_vcc_oset_union(sll_reach(*((tmp_list->next))), @_vcc_oset_singleton(tmp_list)))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_keys(tmp_prev), @_vcc_intset_union(sll_keys(*((tmp_prev->next))), @_vcc_intset_singleton(*((tmp_prev->key)))))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_list_len_next(tmp_prev), unchecked+(sll_list_len_next(*((tmp_prev->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll(tmp_prev), &&(sll(*((tmp_prev->next))), unchecked!(@_vcc_oset_in(tmp_prev, sll_reach(*((tmp_prev->next)))))))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_reach(tmp_prev), @_vcc_oset_union(sll_reach(*((tmp_prev->next))), @_vcc_oset_singleton(tmp_prev)))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_prev, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_keys(list), @_vcc_intset_union(sll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_list_len_next(list), unchecked+(sll_list_len_next(*((list->next))), 1))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll(list), &&(sll(*((list->next))), unchecked!(@_vcc_oset_in(list, sll_reach(*((list->next)))))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_reach(list), @_vcc_oset_union(sll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_keys(new_list), @_vcc_intset_union(sll_keys(*((new_list->next))), @_vcc_intset_singleton(*((new_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#new_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#new_list, ^s_node))));
    assume true;
    // if (@_vcc_ptr_eq_null(list)) ...
    if ($is_null($phys_ptr_cast(P#list, ^s_node)))
    {
      anon5:
        // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_keys(prev_list), @_vcc_intset_union(sll_keys(*((prev_list->next))), @_vcc_intset_singleton(*((prev_list->key)))))); 
        assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_list_len_next(prev_list), unchecked+(sll_list_len_next(*((prev_list->next))), 1))); 
        assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), 1);
        // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll(prev_list), &&(sll(*((prev_list->next))), unchecked!(@_vcc_oset_in(prev_list, sll_reach(*((prev_list->next)))))))); 
        assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_reach(prev_list), @_vcc_oset_union(sll_reach(*((prev_list->next))), @_vcc_oset_singleton(prev_list)))); 
        assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev_list, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_keys(tmp_list), @_vcc_intset_union(sll_keys(*((tmp_list->next))), @_vcc_intset_singleton(*((tmp_list->key)))))); 
        assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_list_len_next(tmp_list), unchecked+(sll_list_len_next(*((tmp_list->next))), 1))); 
        assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), 1);
        // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll(tmp_list), &&(sll(*((tmp_list->next))), unchecked!(@_vcc_oset_in(tmp_list, sll_reach(*((tmp_list->next)))))))); 
        assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_reach(tmp_list), @_vcc_oset_union(sll_reach(*((tmp_list->next))), @_vcc_oset_singleton(tmp_list)))); 
        assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_list, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_keys(new_list), @_vcc_intset_union(sll_keys(*((new_list->next))), @_vcc_intset_singleton(*((new_list->key)))))); 
        assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#new_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#new_list, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_list_len_next(new_list), unchecked+(sll_list_len_next(*((new_list->next))), 1))); 
        assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#new_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), 1);
        // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll(new_list), &&(sll(*((new_list->next))), unchecked!(@_vcc_oset_in(new_list, sll_reach(*((new_list->next)))))))); 
        assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#new_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_reach(new_list), @_vcc_oset_union(sll_reach(*((new_list->next))), @_vcc_oset_singleton(new_list)))); 
        assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#new_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#new_list, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_keys(tmp_prev), @_vcc_intset_union(sll_keys(*((tmp_prev->next))), @_vcc_intset_singleton(*((tmp_prev->key)))))); 
        assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_list_len_next(tmp_prev), unchecked+(sll_list_len_next(*((tmp_prev->next))), 1))); 
        assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), 1);
        // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll(tmp_prev), &&(sll(*((tmp_prev->next))), unchecked!(@_vcc_oset_in(tmp_prev, sll_reach(*((tmp_prev->next)))))))); 
        assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_reach(tmp_prev), @_vcc_oset_union(sll_reach(*((tmp_prev->next))), @_vcc_oset_singleton(tmp_prev)))); 
        assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_prev, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_keys(list), @_vcc_intset_union(sll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
        assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_list_len_next(list), unchecked+(sll_list_len_next(*((list->next))), 1))); 
        assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), 1);
        // assume ==>(@_vcc_ptr_neq_null(list), ==(sll(list), &&(sll(*((list->next))), unchecked!(@_vcc_oset_in(list, sll_reach(*((list->next)))))))); 
        assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_reach(list), @_vcc_oset_union(sll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
        assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
        // _math \state _dryad_S4; 
        // _dryad_S4 := @_vcc_current_state(@state); 
        SL#_dryad_S4 := $current_state($s);
        // _math \state stmtexpr0#5; 
        // stmtexpr0#5 := _dryad_S4; 
        stmtexpr0#5 := SL#_dryad_S4;
        // assert @prim_writes_check((new_list->next)); 
        assert $writable_prim($s, #wrTime$3^16.3, $dot($phys_ptr_cast(L#new_list, ^s_node), s_node.next));
        // *(new_list->next) := (struct s_node*)@null; 
        call $write_int(s_node.next, $phys_ptr_cast(L#new_list, ^s_node), $ptr_to_int($phys_ptr_cast($null, ^s_node)));
        assume $full_stop_ext(#tok$3^38.5, $s);
        // _math \state _dryad_S5; 
        // _dryad_S5 := @_vcc_current_state(@state); 
        SL#_dryad_S5 := $current_state($s);
        // _math \state stmtexpr1#6; 
        // stmtexpr1#6 := _dryad_S5; 
        stmtexpr1#6 := SL#_dryad_S5;
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(prev_list)))), ==(old(_dryad_S4, sll_keys(prev_list)), old(_dryad_S5, sll_keys(prev_list)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_keys(SL#_dryad_S4, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_keys(SL#_dryad_S5, $phys_ptr_cast(L#prev_list, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(prev_list)))), ==(old(_dryad_S4, sll_list_len_next(prev_list)), old(_dryad_S5, sll_list_len_next(prev_list)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S4, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S5, $phys_ptr_cast(L#prev_list, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(prev_list)))), ==(old(_dryad_S4, sll(prev_list)), old(_dryad_S5, sll(prev_list)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll(SL#_dryad_S4, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll(SL#_dryad_S5, $phys_ptr_cast(L#prev_list, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(prev_list)))), ==(old(_dryad_S4, sll_reach(prev_list)), old(_dryad_S5, sll_reach(prev_list)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_reach(SL#_dryad_S5, $phys_ptr_cast(L#prev_list, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(tmp_list)))), ==(old(_dryad_S4, sll_keys(tmp_list)), old(_dryad_S5, sll_keys(tmp_list)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_keys(SL#_dryad_S4, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_keys(SL#_dryad_S5, $phys_ptr_cast(L#tmp_list, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(tmp_list)))), ==(old(_dryad_S4, sll_list_len_next(tmp_list)), old(_dryad_S5, sll_list_len_next(tmp_list)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S4, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S5, $phys_ptr_cast(L#tmp_list, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(tmp_list)))), ==(old(_dryad_S4, sll(tmp_list)), old(_dryad_S5, sll(tmp_list)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll(SL#_dryad_S4, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll(SL#_dryad_S5, $phys_ptr_cast(L#tmp_list, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(tmp_list)))), ==(old(_dryad_S4, sll_reach(tmp_list)), old(_dryad_S5, sll_reach(tmp_list)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_reach(SL#_dryad_S5, $phys_ptr_cast(L#tmp_list, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(tmp_prev)))), ==(old(_dryad_S4, sll_keys(tmp_prev)), old(_dryad_S5, sll_keys(tmp_prev)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll_keys(SL#_dryad_S4, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_keys(SL#_dryad_S5, $phys_ptr_cast(L#tmp_prev, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(tmp_prev)))), ==(old(_dryad_S4, sll_list_len_next(tmp_prev)), old(_dryad_S5, sll_list_len_next(tmp_prev)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S4, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_list_len_next(SL#_dryad_S5, $phys_ptr_cast(L#tmp_prev, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(tmp_prev)))), ==(old(_dryad_S4, sll(tmp_prev)), old(_dryad_S5, sll(tmp_prev)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll(SL#_dryad_S4, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll(SL#_dryad_S5, $phys_ptr_cast(L#tmp_prev, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(tmp_prev)))), ==(old(_dryad_S4, sll_reach(tmp_prev)), old(_dryad_S5, sll_reach(tmp_prev)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_reach(SL#_dryad_S5, $phys_ptr_cast(L#tmp_prev, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(list)))), ==(old(_dryad_S4, sll_keys(list)), old(_dryad_S5, sll_keys(list)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_keys(SL#_dryad_S4, $phys_ptr_cast(P#list, ^s_node)) == F#sll_keys(SL#_dryad_S5, $phys_ptr_cast(P#list, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(list)))), ==(old(_dryad_S4, sll_list_len_next(list)), old(_dryad_S5, sll_list_len_next(list)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S4, $phys_ptr_cast(P#list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S5, $phys_ptr_cast(P#list, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(list)))), ==(old(_dryad_S4, sll(list)), old(_dryad_S5, sll(list)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll(SL#_dryad_S4, $phys_ptr_cast(P#list, ^s_node)) == F#sll(SL#_dryad_S5, $phys_ptr_cast(P#list, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4, sll_reach(list)))), ==(old(_dryad_S4, sll_reach(list)), old(_dryad_S5, sll_reach(list)))); 
        assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(P#list, ^s_node)) == F#sll_reach(SL#_dryad_S5, $phys_ptr_cast(P#list, ^s_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(new_list, prev_list)), ==(*((prev_list->key)), old(_dryad_S4, *((prev_list->key))))); 
        assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#prev_list, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node)) == $rd_inv(SL#_dryad_S4, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(new_list, prev_list)), @_vcc_ptr_eq_pure(*((prev_list->next)), old(_dryad_S4, *((prev_list->next))))); 
        assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#prev_list, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S4, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node);
        // assume ==>(!(@_vcc_ptr_eq_pure(new_list, tmp_list)), ==(*((tmp_list->key)), old(_dryad_S4, *((tmp_list->key))))); 
        assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#tmp_list, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node)) == $rd_inv(SL#_dryad_S4, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(new_list, tmp_list)), @_vcc_ptr_eq_pure(*((tmp_list->next)), old(_dryad_S4, *((tmp_list->next))))); 
        assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#tmp_list, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S4, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node);
        // assume ==>(!(@_vcc_ptr_eq_pure(new_list, tmp_prev)), ==(*((tmp_prev->key)), old(_dryad_S4, *((tmp_prev->key))))); 
        assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#tmp_prev, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $rd_inv(SL#_dryad_S4, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(new_list, tmp_prev)), @_vcc_ptr_eq_pure(*((tmp_prev->next)), old(_dryad_S4, *((tmp_prev->next))))); 
        assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#tmp_prev, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S4, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node);
        // assume ==>(!(@_vcc_ptr_eq_pure(new_list, list)), ==(*((list->key)), old(_dryad_S4, *((list->key))))); 
        assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(P#list, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node)) == $rd_inv(SL#_dryad_S4, s_node.key, $phys_ptr_cast(P#list, ^s_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(new_list, list)), @_vcc_ptr_eq_pure(*((list->next)), old(_dryad_S4, *((list->next))))); 
        assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(P#list, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S4, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node);
        // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_keys(prev_list), @_vcc_intset_union(sll_keys(*((prev_list->next))), @_vcc_intset_singleton(*((prev_list->key)))))); 
        assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_list_len_next(prev_list), unchecked+(sll_list_len_next(*((prev_list->next))), 1))); 
        assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), 1);
        // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll(prev_list), &&(sll(*((prev_list->next))), unchecked!(@_vcc_oset_in(prev_list, sll_reach(*((prev_list->next)))))))); 
        assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_reach(prev_list), @_vcc_oset_union(sll_reach(*((prev_list->next))), @_vcc_oset_singleton(prev_list)))); 
        assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev_list, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_keys(tmp_list), @_vcc_intset_union(sll_keys(*((tmp_list->next))), @_vcc_intset_singleton(*((tmp_list->key)))))); 
        assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_list_len_next(tmp_list), unchecked+(sll_list_len_next(*((tmp_list->next))), 1))); 
        assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), 1);
        // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll(tmp_list), &&(sll(*((tmp_list->next))), unchecked!(@_vcc_oset_in(tmp_list, sll_reach(*((tmp_list->next)))))))); 
        assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_reach(tmp_list), @_vcc_oset_union(sll_reach(*((tmp_list->next))), @_vcc_oset_singleton(tmp_list)))); 
        assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_list, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_keys(tmp_prev), @_vcc_intset_union(sll_keys(*((tmp_prev->next))), @_vcc_intset_singleton(*((tmp_prev->key)))))); 
        assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_list_len_next(tmp_prev), unchecked+(sll_list_len_next(*((tmp_prev->next))), 1))); 
        assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), 1);
        // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll(tmp_prev), &&(sll(*((tmp_prev->next))), unchecked!(@_vcc_oset_in(tmp_prev, sll_reach(*((tmp_prev->next)))))))); 
        assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_reach(tmp_prev), @_vcc_oset_union(sll_reach(*((tmp_prev->next))), @_vcc_oset_singleton(tmp_prev)))); 
        assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_prev, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_keys(list), @_vcc_intset_union(sll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
        assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_list_len_next(list), unchecked+(sll_list_len_next(*((list->next))), 1))); 
        assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), 1);
        // assume ==>(@_vcc_ptr_neq_null(list), ==(sll(list), &&(sll(*((list->next))), unchecked!(@_vcc_oset_in(list, sll_reach(*((list->next)))))))); 
        assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_reach(list), @_vcc_oset_union(sll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
        assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_keys(new_list), @_vcc_intset_union(sll_keys(*((new_list->next))), @_vcc_intset_singleton(*((new_list->key)))))); 
        assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#new_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#new_list, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_list_len_next(new_list), unchecked+(sll_list_len_next(*((new_list->next))), 1))); 
        assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#new_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), 1);
        // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll(new_list), &&(sll(*((new_list->next))), unchecked!(@_vcc_oset_in(new_list, sll_reach(*((new_list->next)))))))); 
        assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#new_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_reach(new_list), @_vcc_oset_union(sll_reach(*((new_list->next))), @_vcc_oset_singleton(new_list)))); 
        assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#new_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#new_list, ^s_node)));
        // return new_list; 
        $result := $phys_ptr_cast(L#new_list, ^s_node);
        assume true;
        assert $position_marker();
        goto #exit;
    }
    else
    {
      anon6:
        // assert @_vcc_possibly_unreachable; 
        assert {:PossiblyUnreachable true} true;
    }

  anon13:
    // tmp_list := list; 
    L#tmp_list := $phys_ptr_cast(P#list, ^s_node);
    // assert sll_lseg(prev_list, prev_list); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#prev_list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume sll_lseg(prev_list, prev_list); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#prev_list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assert sll_lseg(tmp_list, tmp_list); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#tmp_list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume sll_lseg(tmp_list, tmp_list); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#tmp_list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node));
    // assert sll_lseg(new_list, new_list); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#new_list, ^s_node), $phys_ptr_cast(L#new_list, ^s_node));
    // assume sll_lseg(new_list, new_list); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#new_list, ^s_node), $phys_ptr_cast(L#new_list, ^s_node));
    // assert sll_lseg(tmp_prev, tmp_prev); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#tmp_prev, ^s_node), $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume sll_lseg(tmp_prev, tmp_prev); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#tmp_prev, ^s_node), $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assert sll_lseg(list, list); 
    assert F#sll_lseg($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(P#list, ^s_node));
    // assume sll_lseg(list, list); 
    assume F#sll_lseg($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(P#list, ^s_node));
    // prev_list := tmp_list; 
    L#prev_list := $phys_ptr_cast(L#tmp_list, ^s_node);
    // assert sll_lseg(prev_list, prev_list); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#prev_list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume sll_lseg(prev_list, prev_list); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#prev_list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assert sll_lseg(tmp_list, tmp_list); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#tmp_list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume sll_lseg(tmp_list, tmp_list); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#tmp_list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node));
    // assert sll_lseg(new_list, new_list); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#new_list, ^s_node), $phys_ptr_cast(L#new_list, ^s_node));
    // assume sll_lseg(new_list, new_list); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#new_list, ^s_node), $phys_ptr_cast(L#new_list, ^s_node));
    // assert sll_lseg(tmp_prev, tmp_prev); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#tmp_prev, ^s_node), $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume sll_lseg(tmp_prev, tmp_prev); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#tmp_prev, ^s_node), $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assert sll_lseg(list, list); 
    assert F#sll_lseg($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(P#list, ^s_node));
    // assume sll_lseg(list, list); 
    assume F#sll_lseg($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(P#list, ^s_node));
    loopState#0 := $s;
    assume true;
    while (true)
      invariant $phys_ptr_cast(L#prev_list, ^s_node) == $phys_ptr_cast(L#tmp_list, ^s_node) || $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node) == $phys_ptr_cast(L#tmp_list, ^s_node);
      invariant $phys_ptr_cast(L#prev_list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node) == $phys_ptr_cast(L#tmp_list, ^s_node);
      invariant local.pos >= 0;
      invariant F#sll($s, $phys_ptr_cast(L#tmp_list, ^s_node));
      invariant F#sll($s, $phys_ptr_cast(L#prev_list, ^s_node));
      invariant F#sll($s, $phys_ptr_cast(P#list, ^s_node));
      invariant F#sll_lseg($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node));
      invariant $oset_disjoint(F#sll_lseg_reach($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)), F#sll_reach($s, $phys_ptr_cast(L#tmp_list, ^s_node)));
      invariant F#sll_lseg($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
      invariant $oset_disjoint(F#sll_lseg_reach($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)), F#sll_reach($s, $phys_ptr_cast(L#prev_list, ^s_node)));
      invariant $non_null($phys_ptr_cast(L#prev_list, ^s_node));
      invariant $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#prev_list, ^s_node));
      invariant $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> $top_writable($s, #wrTime$3^16.3, $phys_ptr_cast(L#prev_list, ^s_node));
      invariant $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#tmp_list, ^s_node));
      invariant $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> $top_writable($s, #wrTime$3^16.3, $phys_ptr_cast(L#tmp_list, ^s_node));
    {
      anon9:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#0, $s);
        assume $full_stop_ext(#tok$3^45.3, $s);
        // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
        assume $meta_eq(loopState#0, $s);
        // _Bool ite#1; 
        // ite#1 := &&(>(local.pos, 0), @_vcc_ptr_neq_null(tmp_list)); 
        ite#1 := local.pos > 0 && $non_null($phys_ptr_cast(L#tmp_list, ^s_node));
        assume true;
        // if (ite#1) ...
        if (ite#1)
        {
          anon7:
            // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_keys(prev_list), @_vcc_intset_union(sll_keys(*((prev_list->next))), @_vcc_intset_singleton(*((prev_list->key)))))); 
            assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_list_len_next(prev_list), unchecked+(sll_list_len_next(*((prev_list->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll(prev_list), &&(sll(*((prev_list->next))), unchecked!(@_vcc_oset_in(prev_list, sll_reach(*((prev_list->next)))))))); 
            assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_reach(prev_list), @_vcc_oset_union(sll_reach(*((prev_list->next))), @_vcc_oset_singleton(prev_list)))); 
            assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev_list, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_keys(tmp_list), @_vcc_intset_union(sll_keys(*((tmp_list->next))), @_vcc_intset_singleton(*((tmp_list->key)))))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_list_len_next(tmp_list), unchecked+(sll_list_len_next(*((tmp_list->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll(tmp_list), &&(sll(*((tmp_list->next))), unchecked!(@_vcc_oset_in(tmp_list, sll_reach(*((tmp_list->next)))))))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_reach(tmp_list), @_vcc_oset_union(sll_reach(*((tmp_list->next))), @_vcc_oset_singleton(tmp_list)))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_list, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_keys(new_list), @_vcc_intset_union(sll_keys(*((new_list->next))), @_vcc_intset_singleton(*((new_list->key)))))); 
            assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#new_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#new_list, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_list_len_next(new_list), unchecked+(sll_list_len_next(*((new_list->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#new_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll(new_list), &&(sll(*((new_list->next))), unchecked!(@_vcc_oset_in(new_list, sll_reach(*((new_list->next)))))))); 
            assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#new_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_reach(new_list), @_vcc_oset_union(sll_reach(*((new_list->next))), @_vcc_oset_singleton(new_list)))); 
            assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#new_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#new_list, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_keys(tmp_prev), @_vcc_intset_union(sll_keys(*((tmp_prev->next))), @_vcc_intset_singleton(*((tmp_prev->key)))))); 
            assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_list_len_next(tmp_prev), unchecked+(sll_list_len_next(*((tmp_prev->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll(tmp_prev), &&(sll(*((tmp_prev->next))), unchecked!(@_vcc_oset_in(tmp_prev, sll_reach(*((tmp_prev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_reach(tmp_prev), @_vcc_oset_union(sll_reach(*((tmp_prev->next))), @_vcc_oset_singleton(tmp_prev)))); 
            assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_prev, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_keys(list), @_vcc_intset_union(sll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_list_len_next(list), unchecked+(sll_list_len_next(*((list->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(list), ==(sll(list), &&(sll(*((list->next))), unchecked!(@_vcc_oset_in(list, sll_reach(*((list->next)))))))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_reach(list), @_vcc_oset_union(sll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, prev_list)), ==(sll_lseg(list, prev_list), &&(sll_lseg(*((list->next)), prev_list), unchecked!(@_vcc_oset_in(list, sll_lseg_reach(*((list->next)), prev_list)))))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#prev_list, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, prev_list)), ==(sll_lseg_reach(list, prev_list), @_vcc_oset_union(sll_lseg_reach(*((list->next)), prev_list), @_vcc_oset_singleton(list)))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#prev_list, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, prev_list)), ==(sll_lseg_keys(list, prev_list), @_vcc_intset_union(sll_lseg_keys(*((list->next)), prev_list), @_vcc_intset_singleton(*((list->key)))))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#prev_list, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, prev_list)), ==(sll_lseg_len_next(list, prev_list), unchecked+(sll_lseg_len_next(*((list->next)), prev_list), 1))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#prev_list, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg(list, tmp_list), &&(sll_lseg(*((list->next)), tmp_list), unchecked!(@_vcc_oset_in(list, sll_lseg_reach(*((list->next)), tmp_list)))))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg_reach(list, tmp_list), @_vcc_oset_union(sll_lseg_reach(*((list->next)), tmp_list), @_vcc_oset_singleton(list)))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg_keys(list, tmp_list), @_vcc_intset_union(sll_lseg_keys(*((list->next)), tmp_list), @_vcc_intset_singleton(*((list->key)))))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg_len_next(list, tmp_list), unchecked+(sll_lseg_len_next(*((list->next)), tmp_list), 1))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(tmp_list), @_vcc_ptr_neq_null(*((tmp_list->next)))), &&(==(@_vcc_mutable(@state, tmp_list), @_vcc_mutable(@state, *((tmp_list->next)))), ==(@writes_check(tmp_list), @writes_check(*((tmp_list->next)))))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $mutable($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) && $top_writable($s, #wrTime$3^16.3, $phys_ptr_cast(L#tmp_list, ^s_node)) == $top_writable($s, #wrTime$3^16.3, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node));
            // assert @in_range_i4(-(local.pos, 1)); 
            assert $in_range_i4(local.pos - 1);
            // local.pos := -(local.pos, 1); 
            local.pos := local.pos - 1;
            // prev_list := tmp_list; 
            L#prev_list := $phys_ptr_cast(L#tmp_list, ^s_node);
            // assert sll_lseg(prev_list, prev_list); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#prev_list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
            // assume sll_lseg(prev_list, prev_list); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#prev_list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
            // assert sll_lseg(tmp_list, tmp_list); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#tmp_list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node));
            // assume sll_lseg(tmp_list, tmp_list); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#tmp_list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node));
            // assert sll_lseg(new_list, new_list); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#new_list, ^s_node), $phys_ptr_cast(L#new_list, ^s_node));
            // assume sll_lseg(new_list, new_list); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#new_list, ^s_node), $phys_ptr_cast(L#new_list, ^s_node));
            // assert sll_lseg(tmp_prev, tmp_prev); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#tmp_prev, ^s_node), $phys_ptr_cast(L#tmp_prev, ^s_node));
            // assume sll_lseg(tmp_prev, tmp_prev); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#tmp_prev, ^s_node), $phys_ptr_cast(L#tmp_prev, ^s_node));
            // assert sll_lseg(list, list); 
            assert F#sll_lseg($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(P#list, ^s_node));
            // assume sll_lseg(list, list); 
            assume F#sll_lseg($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(P#list, ^s_node));
            // struct s_node* tmp_list1; 
            // tmp_list1 := tmp_list; 
            SL#tmp_list1 := $phys_ptr_cast(L#tmp_list, ^s_node);
            // struct s_node* stmtexpr0#7; 
            // stmtexpr0#7 := tmp_list1; 
            stmtexpr0#7 := $phys_ptr_cast(SL#tmp_list1, ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_keys(tmp_list), @_vcc_intset_union(sll_keys(*((tmp_list->next))), @_vcc_intset_singleton(*((tmp_list->key)))))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_list_len_next(tmp_list), unchecked+(sll_list_len_next(*((tmp_list->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll(tmp_list), &&(sll(*((tmp_list->next))), unchecked!(@_vcc_oset_in(tmp_list, sll_reach(*((tmp_list->next)))))))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_reach(tmp_list), @_vcc_oset_union(sll_reach(*((tmp_list->next))), @_vcc_oset_singleton(tmp_list)))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_list, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(tmp_list), @_vcc_ptr_neq_pure(tmp_list, *((tmp_list->next)))), ==(sll_lseg(tmp_list, *((tmp_list->next))), &&(sll_lseg(*((tmp_list->next)), *((tmp_list->next))), unchecked!(@_vcc_oset_in(tmp_list, sll_lseg_reach(*((tmp_list->next)), *((tmp_list->next)))))))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) && $phys_ptr_cast(L#tmp_list, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#tmp_list, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(tmp_list), @_vcc_ptr_neq_pure(tmp_list, *((tmp_list->next)))), ==(sll_lseg_reach(tmp_list, *((tmp_list->next))), @_vcc_oset_union(sll_lseg_reach(*((tmp_list->next)), *((tmp_list->next))), @_vcc_oset_singleton(tmp_list)))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) && $phys_ptr_cast(L#tmp_list, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#tmp_list, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_list, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(tmp_list), @_vcc_ptr_neq_pure(tmp_list, *((tmp_list->next)))), ==(sll_lseg_keys(tmp_list, *((tmp_list->next))), @_vcc_intset_union(sll_lseg_keys(*((tmp_list->next)), *((tmp_list->next))), @_vcc_intset_singleton(*((tmp_list->key)))))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) && $phys_ptr_cast(L#tmp_list, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#tmp_list, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(tmp_list), @_vcc_ptr_neq_pure(tmp_list, *((tmp_list->next)))), ==(sll_lseg_len_next(tmp_list, *((tmp_list->next))), unchecked+(sll_lseg_len_next(*((tmp_list->next)), *((tmp_list->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) && $phys_ptr_cast(L#tmp_list, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(L#tmp_list, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), 1);
            // assert @reads_check_normal((tmp_list->next)); 
            assert $thread_local($s, $phys_ptr_cast(L#tmp_list, ^s_node));
            // tmp_list := *((tmp_list->next)); 
            L#tmp_list := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_keys(tmp_list), @_vcc_intset_union(sll_keys(*((tmp_list->next))), @_vcc_intset_singleton(*((tmp_list->key)))))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_list_len_next(tmp_list), unchecked+(sll_list_len_next(*((tmp_list->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll(tmp_list), &&(sll(*((tmp_list->next))), unchecked!(@_vcc_oset_in(tmp_list, sll_reach(*((tmp_list->next)))))))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_reach(tmp_list), @_vcc_oset_union(sll_reach(*((tmp_list->next))), @_vcc_oset_singleton(tmp_list)))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_list, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_keys(tmp_list), @_vcc_intset_union(sll_keys(*((tmp_list->next))), @_vcc_intset_singleton(*((tmp_list->key)))))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_list_len_next(tmp_list), unchecked+(sll_list_len_next(*((tmp_list->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll(tmp_list), &&(sll(*((tmp_list->next))), unchecked!(@_vcc_oset_in(tmp_list, sll_reach(*((tmp_list->next)))))))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_reach(tmp_list), @_vcc_oset_union(sll_reach(*((tmp_list->next))), @_vcc_oset_singleton(tmp_list)))); 
            assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_list, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg(list, tmp_list), &&(sll_lseg(*((list->next)), tmp_list), unchecked!(@_vcc_oset_in(list, sll_lseg_reach(*((list->next)), tmp_list)))))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg_reach(list, tmp_list), @_vcc_oset_union(sll_lseg_reach(*((list->next)), tmp_list), @_vcc_oset_singleton(list)))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg_keys(list, tmp_list), @_vcc_intset_union(sll_lseg_keys(*((list->next)), tmp_list), @_vcc_intset_singleton(*((list->key)))))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg_len_next(list, tmp_list), unchecked+(sll_lseg_len_next(*((list->next)), tmp_list), 1))); 
            assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)), 1);
        }
        else
        {
          anon8:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // goto #break_2; 
            goto #break_2;
        }

      #continue_2:
        assume true;
    }

  anon14:
    assume $full_stop_ext(#tok$3^45.3, $s);

  #break_2:
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_keys(prev_list), @_vcc_intset_union(sll_keys(*((prev_list->next))), @_vcc_intset_singleton(*((prev_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_list_len_next(prev_list), unchecked+(sll_list_len_next(*((prev_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll(prev_list), &&(sll(*((prev_list->next))), unchecked!(@_vcc_oset_in(prev_list, sll_reach(*((prev_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_reach(prev_list), @_vcc_oset_union(sll_reach(*((prev_list->next))), @_vcc_oset_singleton(prev_list)))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev_list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_keys(tmp_list), @_vcc_intset_union(sll_keys(*((tmp_list->next))), @_vcc_intset_singleton(*((tmp_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_list_len_next(tmp_list), unchecked+(sll_list_len_next(*((tmp_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll(tmp_list), &&(sll(*((tmp_list->next))), unchecked!(@_vcc_oset_in(tmp_list, sll_reach(*((tmp_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_reach(tmp_list), @_vcc_oset_union(sll_reach(*((tmp_list->next))), @_vcc_oset_singleton(tmp_list)))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_keys(new_list), @_vcc_intset_union(sll_keys(*((new_list->next))), @_vcc_intset_singleton(*((new_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#new_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#new_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_list_len_next(new_list), unchecked+(sll_list_len_next(*((new_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#new_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll(new_list), &&(sll(*((new_list->next))), unchecked!(@_vcc_oset_in(new_list, sll_reach(*((new_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#new_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_reach(new_list), @_vcc_oset_union(sll_reach(*((new_list->next))), @_vcc_oset_singleton(new_list)))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#new_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#new_list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_keys(tmp_prev), @_vcc_intset_union(sll_keys(*((tmp_prev->next))), @_vcc_intset_singleton(*((tmp_prev->key)))))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_list_len_next(tmp_prev), unchecked+(sll_list_len_next(*((tmp_prev->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll(tmp_prev), &&(sll(*((tmp_prev->next))), unchecked!(@_vcc_oset_in(tmp_prev, sll_reach(*((tmp_prev->next)))))))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_reach(tmp_prev), @_vcc_oset_union(sll_reach(*((tmp_prev->next))), @_vcc_oset_singleton(tmp_prev)))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_prev, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_keys(list), @_vcc_intset_union(sll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_list_len_next(list), unchecked+(sll_list_len_next(*((list->next))), 1))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll(list), &&(sll(*((list->next))), unchecked!(@_vcc_oset_in(list, sll_reach(*((list->next)))))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_reach(list), @_vcc_oset_union(sll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
    // struct s_node* prev_list1; 
    // prev_list1 := prev_list; 
    SL#prev_list1 := $phys_ptr_cast(L#prev_list, ^s_node);
    // struct s_node* stmtexpr7#15; 
    // stmtexpr7#15 := prev_list1; 
    stmtexpr7#15 := $phys_ptr_cast(SL#prev_list1, ^s_node);
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_keys(prev_list), @_vcc_intset_union(sll_keys(*((prev_list->next))), @_vcc_intset_singleton(*((prev_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_list_len_next(prev_list), unchecked+(sll_list_len_next(*((prev_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll(prev_list), &&(sll(*((prev_list->next))), unchecked!(@_vcc_oset_in(prev_list, sll_reach(*((prev_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_reach(prev_list), @_vcc_oset_union(sll_reach(*((prev_list->next))), @_vcc_oset_singleton(prev_list)))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev_list, ^s_node)));
    // assert @reads_check_normal((prev_list->next)); 
    assert $thread_local($s, $phys_ptr_cast(L#prev_list, ^s_node));
    // tmp_prev := *((prev_list->next)); 
    L#tmp_prev := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node);
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_keys(tmp_prev), @_vcc_intset_union(sll_keys(*((tmp_prev->next))), @_vcc_intset_singleton(*((tmp_prev->key)))))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_list_len_next(tmp_prev), unchecked+(sll_list_len_next(*((tmp_prev->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll(tmp_prev), &&(sll(*((tmp_prev->next))), unchecked!(@_vcc_oset_in(tmp_prev, sll_reach(*((tmp_prev->next)))))))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_reach(tmp_prev), @_vcc_oset_union(sll_reach(*((tmp_prev->next))), @_vcc_oset_singleton(tmp_prev)))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_prev, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_keys(prev_list), @_vcc_intset_union(sll_keys(*((prev_list->next))), @_vcc_intset_singleton(*((prev_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_list_len_next(prev_list), unchecked+(sll_list_len_next(*((prev_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll(prev_list), &&(sll(*((prev_list->next))), unchecked!(@_vcc_oset_in(prev_list, sll_reach(*((prev_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_reach(prev_list), @_vcc_oset_union(sll_reach(*((prev_list->next))), @_vcc_oset_singleton(prev_list)))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev_list, ^s_node)));
    // _math \state _dryad_S4#0; 
    // _dryad_S4#0 := @_vcc_current_state(@state); 
    _dryad_S4#0 := $current_state($s);
    // _math \state stmtexpr8#16; 
    // stmtexpr8#16 := _dryad_S4#0; 
    stmtexpr8#16 := _dryad_S4#0;
    // assert @prim_writes_check((new_list->next)); 
    assert $writable_prim($s, #wrTime$3^16.3, $dot($phys_ptr_cast(L#new_list, ^s_node), s_node.next));
    // *(new_list->next) := tmp_prev; 
    call $write_int(s_node.next, $phys_ptr_cast(L#new_list, ^s_node), $ptr_to_int($phys_ptr_cast(L#tmp_prev, ^s_node)));
    assume $full_stop_ext(#tok$3^65.3, $s);
    // _math \state _dryad_S5#1; 
    // _dryad_S5#1 := @_vcc_current_state(@state); 
    _dryad_S5#1 := $current_state($s);
    // _math \state stmtexpr9#17; 
    // stmtexpr9#17 := _dryad_S5#1; 
    stmtexpr9#17 := _dryad_S5#1;
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(prev_list1)))), ==(old(_dryad_S4#0, sll_keys(prev_list1)), old(_dryad_S5#1, sll_keys(prev_list1)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(SL#prev_list1, ^s_node))) ==> F#sll_keys(_dryad_S4#0, $phys_ptr_cast(SL#prev_list1, ^s_node)) == F#sll_keys(_dryad_S5#1, $phys_ptr_cast(SL#prev_list1, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(prev_list1)))), ==(old(_dryad_S4#0, sll_list_len_next(prev_list1)), old(_dryad_S5#1, sll_list_len_next(prev_list1)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(SL#prev_list1, ^s_node))) ==> F#sll_list_len_next(_dryad_S4#0, $phys_ptr_cast(SL#prev_list1, ^s_node)) == F#sll_list_len_next(_dryad_S5#1, $phys_ptr_cast(SL#prev_list1, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(prev_list1)))), ==(old(_dryad_S4#0, sll(prev_list1)), old(_dryad_S5#1, sll(prev_list1)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(SL#prev_list1, ^s_node))) ==> F#sll(_dryad_S4#0, $phys_ptr_cast(SL#prev_list1, ^s_node)) == F#sll(_dryad_S5#1, $phys_ptr_cast(SL#prev_list1, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(prev_list1)))), ==(old(_dryad_S4#0, sll_reach(prev_list1)), old(_dryad_S5#1, sll_reach(prev_list1)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(SL#prev_list1, ^s_node))) ==> F#sll_reach(_dryad_S4#0, $phys_ptr_cast(SL#prev_list1, ^s_node)) == F#sll_reach(_dryad_S5#1, $phys_ptr_cast(SL#prev_list1, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(prev_list)))), ==(old(_dryad_S4#0, sll_keys(prev_list)), old(_dryad_S5#1, sll_keys(prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_keys(_dryad_S4#0, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_keys(_dryad_S5#1, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(prev_list)))), ==(old(_dryad_S4#0, sll_list_len_next(prev_list)), old(_dryad_S5#1, sll_list_len_next(prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_list_len_next(_dryad_S4#0, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_list_len_next(_dryad_S5#1, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(prev_list)))), ==(old(_dryad_S4#0, sll(prev_list)), old(_dryad_S5#1, sll(prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll(_dryad_S4#0, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll(_dryad_S5#1, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(prev_list)))), ==(old(_dryad_S4#0, sll_reach(prev_list)), old(_dryad_S5#1, sll_reach(prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_reach(_dryad_S4#0, $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_reach(_dryad_S5#1, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(tmp_list)))), ==(old(_dryad_S4#0, sll_keys(tmp_list)), old(_dryad_S5#1, sll_keys(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_keys(_dryad_S4#0, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_keys(_dryad_S5#1, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(tmp_list)))), ==(old(_dryad_S4#0, sll_list_len_next(tmp_list)), old(_dryad_S5#1, sll_list_len_next(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_list_len_next(_dryad_S4#0, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_list_len_next(_dryad_S5#1, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(tmp_list)))), ==(old(_dryad_S4#0, sll(tmp_list)), old(_dryad_S5#1, sll(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll(_dryad_S4#0, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll(_dryad_S5#1, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(tmp_list)))), ==(old(_dryad_S4#0, sll_reach(tmp_list)), old(_dryad_S5#1, sll_reach(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_reach(_dryad_S4#0, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_reach(_dryad_S5#1, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(tmp_prev)))), ==(old(_dryad_S4#0, sll_keys(tmp_prev)), old(_dryad_S5#1, sll_keys(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll_keys(_dryad_S4#0, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_keys(_dryad_S5#1, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(tmp_prev)))), ==(old(_dryad_S4#0, sll_list_len_next(tmp_prev)), old(_dryad_S5#1, sll_list_len_next(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll_list_len_next(_dryad_S4#0, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_list_len_next(_dryad_S5#1, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(tmp_prev)))), ==(old(_dryad_S4#0, sll(tmp_prev)), old(_dryad_S5#1, sll(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll(_dryad_S4#0, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll(_dryad_S5#1, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(tmp_prev)))), ==(old(_dryad_S4#0, sll_reach(tmp_prev)), old(_dryad_S5#1, sll_reach(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll_reach(_dryad_S4#0, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_reach(_dryad_S5#1, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(list)))), ==(old(_dryad_S4#0, sll_keys(list)), old(_dryad_S5#1, sll_keys(list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_keys(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node)) == F#sll_keys(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(list)))), ==(old(_dryad_S4#0, sll_list_len_next(list)), old(_dryad_S5#1, sll_list_len_next(list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_list_len_next(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node)) == F#sll_list_len_next(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(list)))), ==(old(_dryad_S4#0, sll(list)), old(_dryad_S5#1, sll(list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node)) == F#sll(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_reach(list)))), ==(old(_dryad_S4#0, sll_reach(list)), old(_dryad_S5#1, sll_reach(list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node)) == F#sll_reach(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S4#0, sll_lseg(list, prev_list)), old(_dryad_S5#1, sll_lseg(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_lseg_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S4#0, sll_lseg_reach(list, prev_list)), old(_dryad_S5#1, sll_lseg_reach(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_lseg_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg_reach(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S4#0, sll_lseg_keys(list, prev_list)), old(_dryad_S5#1, sll_lseg_keys(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_lseg_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg_keys(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg_keys(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S4#0, sll_lseg_len_next(list, prev_list)), old(_dryad_S5#1, sll_lseg_len_next(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_lseg_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg_len_next(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg_len_next(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_lseg_reach(list, tmp_list)))), ==(old(_dryad_S4#0, sll_lseg(list, tmp_list)), old(_dryad_S5#1, sll_lseg(list, tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_lseg_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_lseg(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_lseg(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_lseg_reach(list, tmp_list)))), ==(old(_dryad_S4#0, sll_lseg_reach(list, tmp_list)), old(_dryad_S5#1, sll_lseg_reach(list, tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_lseg_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_lseg_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_lseg_reach(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_lseg_reach(list, tmp_list)))), ==(old(_dryad_S4#0, sll_lseg_keys(list, tmp_list)), old(_dryad_S5#1, sll_lseg_keys(list, tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_lseg_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_lseg_keys(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_lseg_keys(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_lseg_reach(list, tmp_list)))), ==(old(_dryad_S4#0, sll_lseg_len_next(list, tmp_list)), old(_dryad_S5#1, sll_lseg_len_next(list, tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_lseg_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_lseg_len_next(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_lseg_len_next(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S4#0, sll_lseg(list, prev_list)), old(_dryad_S5#1, sll_lseg(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_lseg_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S4#0, sll_lseg_reach(list, prev_list)), old(_dryad_S5#1, sll_lseg_reach(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_lseg_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg_reach(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S4#0, sll_lseg_keys(list, prev_list)), old(_dryad_S5#1, sll_lseg_keys(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_lseg_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg_keys(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg_keys(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(new_list, old(_dryad_S4#0, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S4#0, sll_lseg_len_next(list, prev_list)), old(_dryad_S5#1, sll_lseg_len_next(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_lseg_reach(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg_len_next(_dryad_S4#0, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg_len_next(_dryad_S5#1, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, prev_list1)), ==(*((prev_list1->key)), old(_dryad_S4#0, *((prev_list1->key))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(SL#prev_list1, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(SL#prev_list1, ^s_node)) == $rd_inv(_dryad_S4#0, s_node.key, $phys_ptr_cast(SL#prev_list1, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, prev_list1)), @_vcc_ptr_eq_pure(*((prev_list1->next)), old(_dryad_S4#0, *((prev_list1->next))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(SL#prev_list1, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#prev_list1, ^s_node), ^s_node) == $rd_phys_ptr(_dryad_S4#0, s_node.next, $phys_ptr_cast(SL#prev_list1, ^s_node), ^s_node);
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, prev_list)), ==(*((prev_list->key)), old(_dryad_S4#0, *((prev_list->key))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#prev_list, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node)) == $rd_inv(_dryad_S4#0, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, prev_list)), @_vcc_ptr_eq_pure(*((prev_list->next)), old(_dryad_S4#0, *((prev_list->next))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#prev_list, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node) == $rd_phys_ptr(_dryad_S4#0, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node);
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, tmp_list)), ==(*((tmp_list->key)), old(_dryad_S4#0, *((tmp_list->key))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#tmp_list, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node)) == $rd_inv(_dryad_S4#0, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, tmp_list)), @_vcc_ptr_eq_pure(*((tmp_list->next)), old(_dryad_S4#0, *((tmp_list->next))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#tmp_list, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node) == $rd_phys_ptr(_dryad_S4#0, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node);
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, tmp_prev)), ==(*((tmp_prev->key)), old(_dryad_S4#0, *((tmp_prev->key))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#tmp_prev, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $rd_inv(_dryad_S4#0, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, tmp_prev)), @_vcc_ptr_eq_pure(*((tmp_prev->next)), old(_dryad_S4#0, *((tmp_prev->next))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(L#tmp_prev, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node) == $rd_phys_ptr(_dryad_S4#0, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node);
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, list)), ==(*((list->key)), old(_dryad_S4#0, *((list->key))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(P#list, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node)) == $rd_inv(_dryad_S4#0, s_node.key, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(new_list, list)), @_vcc_ptr_eq_pure(*((list->next)), old(_dryad_S4#0, *((list->next))))); 
    assume !($phys_ptr_cast(L#new_list, ^s_node) == $phys_ptr_cast(P#list, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node) == $rd_phys_ptr(_dryad_S4#0, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node);
    // assume ==>(@_vcc_ptr_neq_null(prev_list1), ==(sll_keys(prev_list1), @_vcc_intset_union(sll_keys(*((prev_list1->next))), @_vcc_intset_singleton(*((prev_list1->key)))))); 
    assume $non_null($phys_ptr_cast(SL#prev_list1, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#prev_list1, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#prev_list1, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#prev_list1, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list1), ==(sll_list_len_next(prev_list1), unchecked+(sll_list_len_next(*((prev_list1->next))), 1))); 
    assume $non_null($phys_ptr_cast(SL#prev_list1, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#prev_list1, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#prev_list1, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(prev_list1), ==(sll(prev_list1), &&(sll(*((prev_list1->next))), unchecked!(@_vcc_oset_in(prev_list1, sll_reach(*((prev_list1->next)))))))); 
    assume $non_null($phys_ptr_cast(SL#prev_list1, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#prev_list1, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#prev_list1, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#prev_list1, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#prev_list1, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list1), ==(sll_reach(prev_list1), @_vcc_oset_union(sll_reach(*((prev_list1->next))), @_vcc_oset_singleton(prev_list1)))); 
    assume $non_null($phys_ptr_cast(SL#prev_list1, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#prev_list1, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#prev_list1, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#prev_list1, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_keys(prev_list), @_vcc_intset_union(sll_keys(*((prev_list->next))), @_vcc_intset_singleton(*((prev_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_list_len_next(prev_list), unchecked+(sll_list_len_next(*((prev_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll(prev_list), &&(sll(*((prev_list->next))), unchecked!(@_vcc_oset_in(prev_list, sll_reach(*((prev_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_reach(prev_list), @_vcc_oset_union(sll_reach(*((prev_list->next))), @_vcc_oset_singleton(prev_list)))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev_list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_keys(tmp_list), @_vcc_intset_union(sll_keys(*((tmp_list->next))), @_vcc_intset_singleton(*((tmp_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_list_len_next(tmp_list), unchecked+(sll_list_len_next(*((tmp_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll(tmp_list), &&(sll(*((tmp_list->next))), unchecked!(@_vcc_oset_in(tmp_list, sll_reach(*((tmp_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_reach(tmp_list), @_vcc_oset_union(sll_reach(*((tmp_list->next))), @_vcc_oset_singleton(tmp_list)))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_keys(tmp_prev), @_vcc_intset_union(sll_keys(*((tmp_prev->next))), @_vcc_intset_singleton(*((tmp_prev->key)))))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_list_len_next(tmp_prev), unchecked+(sll_list_len_next(*((tmp_prev->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll(tmp_prev), &&(sll(*((tmp_prev->next))), unchecked!(@_vcc_oset_in(tmp_prev, sll_reach(*((tmp_prev->next)))))))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_reach(tmp_prev), @_vcc_oset_union(sll_reach(*((tmp_prev->next))), @_vcc_oset_singleton(tmp_prev)))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_prev, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_keys(list), @_vcc_intset_union(sll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_list_len_next(list), unchecked+(sll_list_len_next(*((list->next))), 1))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll(list), &&(sll(*((list->next))), unchecked!(@_vcc_oset_in(list, sll_reach(*((list->next)))))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_reach(list), @_vcc_oset_union(sll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_keys(new_list), @_vcc_intset_union(sll_keys(*((new_list->next))), @_vcc_intset_singleton(*((new_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#new_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#new_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_list_len_next(new_list), unchecked+(sll_list_len_next(*((new_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#new_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll(new_list), &&(sll(*((new_list->next))), unchecked!(@_vcc_oset_in(new_list, sll_reach(*((new_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#new_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_reach(new_list), @_vcc_oset_union(sll_reach(*((new_list->next))), @_vcc_oset_singleton(new_list)))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#new_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#new_list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_keys(tmp_prev), @_vcc_intset_union(sll_keys(*((tmp_prev->next))), @_vcc_intset_singleton(*((tmp_prev->key)))))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_list_len_next(tmp_prev), unchecked+(sll_list_len_next(*((tmp_prev->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll(tmp_prev), &&(sll(*((tmp_prev->next))), unchecked!(@_vcc_oset_in(tmp_prev, sll_reach(*((tmp_prev->next)))))))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_reach(tmp_prev), @_vcc_oset_union(sll_reach(*((tmp_prev->next))), @_vcc_oset_singleton(tmp_prev)))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_prev, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, prev_list)), ==(sll_lseg(list, prev_list), &&(sll_lseg(*((list->next)), prev_list), unchecked!(@_vcc_oset_in(list, sll_lseg_reach(*((list->next)), prev_list)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#prev_list, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))));
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, prev_list)), ==(sll_lseg_reach(list, prev_list), @_vcc_oset_union(sll_lseg_reach(*((list->next)), prev_list), @_vcc_oset_singleton(list)))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#prev_list, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, prev_list)), ==(sll_lseg_keys(list, prev_list), @_vcc_intset_union(sll_lseg_keys(*((list->next)), prev_list), @_vcc_intset_singleton(*((list->key)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#prev_list, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, prev_list)), ==(sll_lseg_len_next(list, prev_list), unchecked+(sll_lseg_len_next(*((list->next)), prev_list), 1))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#prev_list, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg(list, tmp_list), &&(sll_lseg(*((list->next)), tmp_list), unchecked!(@_vcc_oset_in(list, sll_lseg_reach(*((list->next)), tmp_list)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node))));
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg_reach(list, tmp_list), @_vcc_oset_union(sll_lseg_reach(*((list->next)), tmp_list), @_vcc_oset_singleton(list)))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg_keys(list, tmp_list), @_vcc_intset_union(sll_lseg_keys(*((list->next)), tmp_list), @_vcc_intset_singleton(*((list->key)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg_len_next(list, tmp_list), unchecked+(sll_lseg_len_next(*((list->next)), tmp_list), 1))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, prev_list)), ==(sll_lseg(list, prev_list), &&(sll_lseg(*((list->next)), prev_list), unchecked!(@_vcc_oset_in(list, sll_lseg_reach(*((list->next)), prev_list)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#prev_list, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))));
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, prev_list)), ==(sll_lseg_reach(list, prev_list), @_vcc_oset_union(sll_lseg_reach(*((list->next)), prev_list), @_vcc_oset_singleton(list)))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#prev_list, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, prev_list)), ==(sll_lseg_keys(list, prev_list), @_vcc_intset_union(sll_lseg_keys(*((list->next)), prev_list), @_vcc_intset_singleton(*((list->key)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#prev_list, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, prev_list)), ==(sll_lseg_len_next(list, prev_list), unchecked+(sll_lseg_len_next(*((list->next)), prev_list), 1))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#prev_list, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)), 1);
    // _math \state _dryad_S6; 
    // _dryad_S6 := @_vcc_current_state(@state); 
    SL#_dryad_S6 := $current_state($s);
    // _math \state stmtexpr10#18; 
    // stmtexpr10#18 := _dryad_S6; 
    stmtexpr10#18 := SL#_dryad_S6;
    // assert @prim_writes_check((prev_list->next)); 
    assert $writable_prim($s, #wrTime$3^16.3, $dot($phys_ptr_cast(L#prev_list, ^s_node), s_node.next));
    // *(prev_list->next) := new_list; 
    call $write_int(s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), $ptr_to_int($phys_ptr_cast(L#new_list, ^s_node)));
    assume $full_stop_ext(#tok$3^66.3, $s);
    // _math \state _dryad_S7; 
    // _dryad_S7 := @_vcc_current_state(@state); 
    SL#_dryad_S7 := $current_state($s);
    // _math \state stmtexpr11#19; 
    // stmtexpr11#19 := _dryad_S7; 
    stmtexpr11#19 := SL#_dryad_S7;
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(prev_list1)))), ==(old(_dryad_S6, sll_keys(prev_list1)), old(_dryad_S7, sll_keys(prev_list1)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(SL#prev_list1, ^s_node))) ==> F#sll_keys(SL#_dryad_S6, $phys_ptr_cast(SL#prev_list1, ^s_node)) == F#sll_keys(SL#_dryad_S7, $phys_ptr_cast(SL#prev_list1, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(prev_list1)))), ==(old(_dryad_S6, sll_list_len_next(prev_list1)), old(_dryad_S7, sll_list_len_next(prev_list1)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(SL#prev_list1, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S6, $phys_ptr_cast(SL#prev_list1, ^s_node)) == F#sll_list_len_next(SL#_dryad_S7, $phys_ptr_cast(SL#prev_list1, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(prev_list1)))), ==(old(_dryad_S6, sll(prev_list1)), old(_dryad_S7, sll(prev_list1)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(SL#prev_list1, ^s_node))) ==> F#sll(SL#_dryad_S6, $phys_ptr_cast(SL#prev_list1, ^s_node)) == F#sll(SL#_dryad_S7, $phys_ptr_cast(SL#prev_list1, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(prev_list1)))), ==(old(_dryad_S6, sll_reach(prev_list1)), old(_dryad_S7, sll_reach(prev_list1)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(SL#prev_list1, ^s_node))) ==> F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(SL#prev_list1, ^s_node)) == F#sll_reach(SL#_dryad_S7, $phys_ptr_cast(SL#prev_list1, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(tmp_list)))), ==(old(_dryad_S6, sll_keys(tmp_list)), old(_dryad_S7, sll_keys(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_keys(SL#_dryad_S6, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_keys(SL#_dryad_S7, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(tmp_list)))), ==(old(_dryad_S6, sll_list_len_next(tmp_list)), old(_dryad_S7, sll_list_len_next(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S6, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S7, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(tmp_list)))), ==(old(_dryad_S6, sll(tmp_list)), old(_dryad_S7, sll(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll(SL#_dryad_S6, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll(SL#_dryad_S7, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(tmp_list)))), ==(old(_dryad_S6, sll_reach(tmp_list)), old(_dryad_S7, sll_reach(tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_reach(SL#_dryad_S7, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(new_list)))), ==(old(_dryad_S6, sll_keys(new_list)), old(_dryad_S7, sll_keys(new_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#new_list, ^s_node))) ==> F#sll_keys(SL#_dryad_S6, $phys_ptr_cast(L#new_list, ^s_node)) == F#sll_keys(SL#_dryad_S7, $phys_ptr_cast(L#new_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(new_list)))), ==(old(_dryad_S6, sll_list_len_next(new_list)), old(_dryad_S7, sll_list_len_next(new_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#new_list, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S6, $phys_ptr_cast(L#new_list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S7, $phys_ptr_cast(L#new_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(new_list)))), ==(old(_dryad_S6, sll(new_list)), old(_dryad_S7, sll(new_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#new_list, ^s_node))) ==> F#sll(SL#_dryad_S6, $phys_ptr_cast(L#new_list, ^s_node)) == F#sll(SL#_dryad_S7, $phys_ptr_cast(L#new_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(new_list)))), ==(old(_dryad_S6, sll_reach(new_list)), old(_dryad_S7, sll_reach(new_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#new_list, ^s_node))) ==> F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#new_list, ^s_node)) == F#sll_reach(SL#_dryad_S7, $phys_ptr_cast(L#new_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(tmp_prev)))), ==(old(_dryad_S6, sll_keys(tmp_prev)), old(_dryad_S7, sll_keys(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll_keys(SL#_dryad_S6, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_keys(SL#_dryad_S7, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(tmp_prev)))), ==(old(_dryad_S6, sll_list_len_next(tmp_prev)), old(_dryad_S7, sll_list_len_next(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S6, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_list_len_next(SL#_dryad_S7, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(tmp_prev)))), ==(old(_dryad_S6, sll(tmp_prev)), old(_dryad_S7, sll(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll(SL#_dryad_S6, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll(SL#_dryad_S7, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(tmp_prev)))), ==(old(_dryad_S6, sll_reach(tmp_prev)), old(_dryad_S7, sll_reach(tmp_prev)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#tmp_prev, ^s_node))) ==> F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#tmp_prev, ^s_node)) == F#sll_reach(SL#_dryad_S7, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(list)))), ==(old(_dryad_S6, sll_keys(list)), old(_dryad_S7, sll_keys(list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_keys(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node)) == F#sll_keys(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(list)))), ==(old(_dryad_S6, sll_list_len_next(list)), old(_dryad_S7, sll_list_len_next(list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(list)))), ==(old(_dryad_S6, sll(list)), old(_dryad_S7, sll(list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node)) == F#sll(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_reach(list)))), ==(old(_dryad_S6, sll_reach(list)), old(_dryad_S7, sll_reach(list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node)) == F#sll_reach(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S6, sll_lseg(list, prev_list)), old(_dryad_S7, sll_lseg(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S6, sll_lseg_reach(list, prev_list)), old(_dryad_S7, sll_lseg_reach(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S6, sll_lseg_keys(list, prev_list)), old(_dryad_S7, sll_lseg_keys(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S6, sll_lseg_len_next(list, prev_list)), old(_dryad_S7, sll_lseg_len_next(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg_len_next(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg_len_next(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_lseg_reach(list, tmp_list)))), ==(old(_dryad_S6, sll_lseg(list, tmp_list)), old(_dryad_S7, sll_lseg(list, tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_lseg(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_lseg(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_lseg_reach(list, tmp_list)))), ==(old(_dryad_S6, sll_lseg_reach(list, tmp_list)), old(_dryad_S7, sll_lseg_reach(list, tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_lseg_reach(list, tmp_list)))), ==(old(_dryad_S6, sll_lseg_keys(list, tmp_list)), old(_dryad_S7, sll_lseg_keys(list, tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_lseg_reach(list, tmp_list)))), ==(old(_dryad_S6, sll_lseg_len_next(list, tmp_list)), old(_dryad_S7, sll_lseg_len_next(list, tmp_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node))) ==> F#sll_lseg_len_next(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == F#sll_lseg_len_next(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S6, sll_lseg(list, prev_list)), old(_dryad_S7, sll_lseg(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S6, sll_lseg_reach(list, prev_list)), old(_dryad_S7, sll_lseg_reach(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S6, sll_lseg_keys(list, prev_list)), old(_dryad_S7, sll_lseg_keys(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(unchecked!(@_vcc_oset_in(prev_list, old(_dryad_S6, sll_lseg_reach(list, prev_list)))), ==(old(_dryad_S6, sll_lseg_len_next(list, prev_list)), old(_dryad_S7, sll_lseg_len_next(list, prev_list)))); 
    assume !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node))) ==> F#sll_lseg_len_next(SL#_dryad_S6, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node)) == F#sll_lseg_len_next(SL#_dryad_S7, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#prev_list, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(prev_list, prev_list1)), ==(*((prev_list1->key)), old(_dryad_S6, *((prev_list1->key))))); 
    assume !($phys_ptr_cast(L#prev_list, ^s_node) == $phys_ptr_cast(SL#prev_list1, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(SL#prev_list1, ^s_node)) == $rd_inv(SL#_dryad_S6, s_node.key, $phys_ptr_cast(SL#prev_list1, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(prev_list, prev_list1)), @_vcc_ptr_eq_pure(*((prev_list1->next)), old(_dryad_S6, *((prev_list1->next))))); 
    assume !($phys_ptr_cast(L#prev_list, ^s_node) == $phys_ptr_cast(SL#prev_list1, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#prev_list1, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S6, s_node.next, $phys_ptr_cast(SL#prev_list1, ^s_node), ^s_node);
    // assume ==>(!(@_vcc_ptr_eq_pure(prev_list, tmp_list)), ==(*((tmp_list->key)), old(_dryad_S6, *((tmp_list->key))))); 
    assume !($phys_ptr_cast(L#prev_list, ^s_node) == $phys_ptr_cast(L#tmp_list, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node)) == $rd_inv(SL#_dryad_S6, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(prev_list, tmp_list)), @_vcc_ptr_eq_pure(*((tmp_list->next)), old(_dryad_S6, *((tmp_list->next))))); 
    assume !($phys_ptr_cast(L#prev_list, ^s_node) == $phys_ptr_cast(L#tmp_list, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S6, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node);
    // assume ==>(!(@_vcc_ptr_eq_pure(prev_list, new_list)), ==(*((new_list->key)), old(_dryad_S6, *((new_list->key))))); 
    assume !($phys_ptr_cast(L#prev_list, ^s_node) == $phys_ptr_cast(L#new_list, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#new_list, ^s_node)) == $rd_inv(SL#_dryad_S6, s_node.key, $phys_ptr_cast(L#new_list, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(prev_list, new_list)), @_vcc_ptr_eq_pure(*((new_list->next)), old(_dryad_S6, *((new_list->next))))); 
    assume !($phys_ptr_cast(L#prev_list, ^s_node) == $phys_ptr_cast(L#new_list, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S6, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node);
    // assume ==>(!(@_vcc_ptr_eq_pure(prev_list, tmp_prev)), ==(*((tmp_prev->key)), old(_dryad_S6, *((tmp_prev->key))))); 
    assume !($phys_ptr_cast(L#prev_list, ^s_node) == $phys_ptr_cast(L#tmp_prev, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $rd_inv(SL#_dryad_S6, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(prev_list, tmp_prev)), @_vcc_ptr_eq_pure(*((tmp_prev->next)), old(_dryad_S6, *((tmp_prev->next))))); 
    assume !($phys_ptr_cast(L#prev_list, ^s_node) == $phys_ptr_cast(L#tmp_prev, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S6, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node);
    // assume ==>(!(@_vcc_ptr_eq_pure(prev_list, list)), ==(*((list->key)), old(_dryad_S6, *((list->key))))); 
    assume !($phys_ptr_cast(L#prev_list, ^s_node) == $phys_ptr_cast(P#list, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node)) == $rd_inv(SL#_dryad_S6, s_node.key, $phys_ptr_cast(P#list, ^s_node));
    // assume ==>(!(@_vcc_ptr_eq_pure(prev_list, list)), @_vcc_ptr_eq_pure(*((list->next)), old(_dryad_S6, *((list->next))))); 
    assume !($phys_ptr_cast(L#prev_list, ^s_node) == $phys_ptr_cast(P#list, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S6, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node);
    // assume ==>(@_vcc_ptr_neq_null(prev_list1), ==(sll_keys(prev_list1), @_vcc_intset_union(sll_keys(*((prev_list1->next))), @_vcc_intset_singleton(*((prev_list1->key)))))); 
    assume $non_null($phys_ptr_cast(SL#prev_list1, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#prev_list1, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#prev_list1, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#prev_list1, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list1), ==(sll_list_len_next(prev_list1), unchecked+(sll_list_len_next(*((prev_list1->next))), 1))); 
    assume $non_null($phys_ptr_cast(SL#prev_list1, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#prev_list1, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#prev_list1, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(prev_list1), ==(sll(prev_list1), &&(sll(*((prev_list1->next))), unchecked!(@_vcc_oset_in(prev_list1, sll_reach(*((prev_list1->next)))))))); 
    assume $non_null($phys_ptr_cast(SL#prev_list1, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#prev_list1, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#prev_list1, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#prev_list1, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#prev_list1, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list1), ==(sll_reach(prev_list1), @_vcc_oset_union(sll_reach(*((prev_list1->next))), @_vcc_oset_singleton(prev_list1)))); 
    assume $non_null($phys_ptr_cast(SL#prev_list1, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#prev_list1, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#prev_list1, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#prev_list1, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_keys(tmp_list), @_vcc_intset_union(sll_keys(*((tmp_list->next))), @_vcc_intset_singleton(*((tmp_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_list_len_next(tmp_list), unchecked+(sll_list_len_next(*((tmp_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll(tmp_list), &&(sll(*((tmp_list->next))), unchecked!(@_vcc_oset_in(tmp_list, sll_reach(*((tmp_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_list), ==(sll_reach(tmp_list), @_vcc_oset_union(sll_reach(*((tmp_list->next))), @_vcc_oset_singleton(tmp_list)))); 
    assume $non_null($phys_ptr_cast(L#tmp_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_keys(new_list), @_vcc_intset_union(sll_keys(*((new_list->next))), @_vcc_intset_singleton(*((new_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#new_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#new_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_list_len_next(new_list), unchecked+(sll_list_len_next(*((new_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#new_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll(new_list), &&(sll(*((new_list->next))), unchecked!(@_vcc_oset_in(new_list, sll_reach(*((new_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#new_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_reach(new_list), @_vcc_oset_union(sll_reach(*((new_list->next))), @_vcc_oset_singleton(new_list)))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#new_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#new_list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_keys(tmp_prev), @_vcc_intset_union(sll_keys(*((tmp_prev->next))), @_vcc_intset_singleton(*((tmp_prev->key)))))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_prev, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_list_len_next(tmp_prev), unchecked+(sll_list_len_next(*((tmp_prev->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll(tmp_prev), &&(sll(*((tmp_prev->next))), unchecked!(@_vcc_oset_in(tmp_prev, sll_reach(*((tmp_prev->next)))))))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp_prev), ==(sll_reach(tmp_prev), @_vcc_oset_union(sll_reach(*((tmp_prev->next))), @_vcc_oset_singleton(tmp_prev)))); 
    assume $non_null($phys_ptr_cast(L#tmp_prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_prev, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_keys(list), @_vcc_intset_union(sll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_list_len_next(list), unchecked+(sll_list_len_next(*((list->next))), 1))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll(list), &&(sll(*((list->next))), unchecked!(@_vcc_oset_in(list, sll_reach(*((list->next)))))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(sll_reach(list), @_vcc_oset_union(sll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_keys(prev_list), @_vcc_intset_union(sll_keys(*((prev_list->next))), @_vcc_intset_singleton(*((prev_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_list_len_next(prev_list), unchecked+(sll_list_len_next(*((prev_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll(prev_list), &&(sll(*((prev_list->next))), unchecked!(@_vcc_oset_in(prev_list, sll_reach(*((prev_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev_list), ==(sll_reach(prev_list), @_vcc_oset_union(sll_reach(*((prev_list->next))), @_vcc_oset_singleton(prev_list)))); 
    assume $non_null($phys_ptr_cast(L#prev_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev_list, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_keys(new_list), @_vcc_intset_union(sll_keys(*((new_list->next))), @_vcc_intset_singleton(*((new_list->key)))))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#new_list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#new_list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_list_len_next(new_list), unchecked+(sll_list_len_next(*((new_list->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#new_list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll(new_list), &&(sll(*((new_list->next))), unchecked!(@_vcc_oset_in(new_list, sll_reach(*((new_list->next)))))))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#new_list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#new_list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(new_list), ==(sll_reach(new_list), @_vcc_oset_union(sll_reach(*((new_list->next))), @_vcc_oset_singleton(new_list)))); 
    assume $non_null($phys_ptr_cast(L#new_list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#new_list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#new_list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#new_list, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg(list, tmp_list), &&(sll_lseg(*((list->next)), tmp_list), unchecked!(@_vcc_oset_in(list, sll_lseg_reach(*((list->next)), tmp_list)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) && !$oset_in($phys_ptr_cast(P#list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node))));
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg_reach(list, tmp_list), @_vcc_oset_union(sll_lseg_reach(*((list->next)), tmp_list), @_vcc_oset_singleton(list)))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)), $oset_singleton($phys_ptr_cast(P#list, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg_keys(list, tmp_list), @_vcc_intset_union(sll_lseg_keys(*((list->next)), tmp_list), @_vcc_intset_singleton(*((list->key)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#list, ^s_node))));
    // assume ==>(&&(@_vcc_ptr_neq_null(list), @_vcc_ptr_neq_pure(list, tmp_list)), ==(sll_lseg_len_next(list, tmp_list), unchecked+(sll_lseg_len_next(*((list->next)), tmp_list), 1))); 
    assume $non_null($phys_ptr_cast(P#list, ^s_node)) && $phys_ptr_cast(P#list, ^s_node) != $phys_ptr_cast(L#tmp_list, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(P#list, ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp_list, ^s_node)), 1);
    // return list; 
    $result := $phys_ptr_cast(P#list, ^s_node);
    assume true;
    assert $position_marker();
    goto #exit;

  anon15:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$3^66.3: $token;

const unique #tok$3^65.3: $token;

const unique #tok$3^45.3: $token;

const unique #tok$3^38.5: $token;

const unique #tok$3^35.3: $token;

const unique #tok$3^33.14: $token;

const unique #tok$3^26.12: $token;

const unique #tok$3^23.12: $token;

const unique #tok$4^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(4, #file^?3Cno?20file?3E);

const unique #tok$3^16.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cglibc?5Cgslist?5Cg_slist_insert.c: $token;

axiom $file_name_is(3, #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cglibc?5Cgslist?5Cg_slist_insert.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cglibc?5Cgslist?5Cdryad_gslist_sll.h: $token;

axiom $file_name_is(2, #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cglibc?5Cgslist?5Cdryad_gslist_sll.h);

const unique #file^Z?3A?5CInvariantSynthesis?5CDownloads?5CVCDryad?2Dbin?5CHeaders?5Cvccp.h: $token;

axiom $file_name_is(1, #file^Z?3A?5CInvariantSynthesis?5CDownloads?5CVCDryad?2Dbin?5CHeaders?5Cvccp.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^s_node);
