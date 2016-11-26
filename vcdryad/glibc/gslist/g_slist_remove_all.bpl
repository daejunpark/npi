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

const unique ^$#g_slist_remove_all.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#g_slist_remove_all.c..36263#3);

type $#g_slist_remove_all.c..36263#3;

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



procedure g_slist_remove_all(P#list: $ptr, P#data: int) returns ($result: $ptr);
  requires F#sll($s, $phys_ptr_cast(P#list, ^s_node));
  modifies $s, $cev_pc;
  ensures F#sll($s, $phys_ptr_cast($result, ^s_node));
  ensures !$intset_in(P#data, F#sll_keys(old($s), $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_keys($s, $phys_ptr_cast($result, ^s_node)) == F#sll_keys(old($s), $phys_ptr_cast(P#list, ^s_node));
  ensures !$intset_in(P#data, F#sll_keys($s, $phys_ptr_cast($result, ^s_node)));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation g_slist_remove_all(P#list: $ptr, P#data: int) returns ($result: $ptr)
{
  var stmtexpr0#7: $ptr;
  var SL#prev0: $ptr;
  var stmtexpr2#6: $state;
  var _dryad_S1#1: $state;
  var stmtexpr1#5: $state;
  var _dryad_S0#0: $state;
  var stmtexpr1#3: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr0#2: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr0#4: $ptr;
  var SL#tmp0: $ptr;
  var L#tmp_next: $ptr;
  var loopState#0: $state;
  var L#tmp: $ptr;
  var L#prev: $ptr;
  var stmtexpr1#9: $oset;
  var stmtexpr0#8: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var local.list: $ptr;
  var #wrTime$2^3.3: int;
  var #stackframe: int;

  anon10:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$2^3.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$2^3.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$2^3.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @in_range_i4(data); 
    assume $in_range_i4(P#data);
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    // struct s_node* local.list; 
    // local.list := list; 
    local.list := $phys_ptr_cast(P#list, ^s_node);
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := sll_reach(local.list); 
    call SL#_dryad_G0 := sll_reach($phys_ptr_cast(local.list, ^s_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _math \oset stmtexpr0#8; 
    // stmtexpr0#8 := _dryad_G0; 
    stmtexpr0#8 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#9; 
    // stmtexpr1#9 := _dryad_G1; 
    stmtexpr1#9 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_keys(local.list), @_vcc_intset_union(sll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_list_len_next(local.list), unchecked+(sll_list_len_next(*((local.list->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll(local.list), &&(sll(*((local.list->next))), unchecked!(@_vcc_oset_in(local.list, sll_reach(*((local.list->next)))))))); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_reach(local.list), @_vcc_oset_union(sll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
    // struct s_node* prev; 
    // struct s_node* tmp; 
    // assume ==>(@_vcc_ptr_neq_null(local.list), &&(&&(@_vcc_mutable(@state, local.list), @writes_check(local.list)), @_vcc_is_malloc_root(@state, local.list))); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.list, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.list, ^s_node)) && $is_malloc_root($s, $phys_ptr_cast(local.list, ^s_node));
    // var struct s_node* tmp
    // prev := (struct s_node*)@null; 
    L#prev := $phys_ptr_cast($null, ^s_node);
    // assert sll_lseg(tmp, tmp); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#tmp, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
    // assume sll_lseg(tmp, tmp); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#tmp, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
    // assert sll_lseg(prev, prev); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
    // assume sll_lseg(prev, prev); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
    // assert sll_lseg(local.list, local.list); 
    assert F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(local.list, ^s_node));
    // assume sll_lseg(local.list, local.list); 
    assume F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(local.list, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
    // tmp := local.list; 
    L#tmp := $phys_ptr_cast(local.list, ^s_node);
    // assert sll_lseg(tmp, tmp); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#tmp, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
    // assume sll_lseg(tmp, tmp); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#tmp, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
    // assert sll_lseg(prev, prev); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
    // assume sll_lseg(prev, prev); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
    // assert sll_lseg(local.list, local.list); 
    assert F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(local.list, ^s_node));
    // assume sll_lseg(local.list, local.list); 
    assume F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(local.list, ^s_node));
    loopState#0 := $s;
    assume true;
    while (true)
      invariant F#sll($s, $phys_ptr_cast(L#tmp, ^s_node));
      invariant F#sll($s, $phys_ptr_cast(L#prev, ^s_node));
      invariant F#sll($s, $phys_ptr_cast(local.list, ^s_node));
      invariant F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
      invariant $oset_disjoint(F#sll_lseg_reach($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), F#sll_reach($s, $phys_ptr_cast(L#tmp, ^s_node)));
      invariant F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
      invariant $oset_disjoint(F#sll_lseg_reach($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)), F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)));
      invariant !$intset_in(P#data, F#sll_keys(loopState#0, $phys_ptr_cast(P#list, ^s_node))) ==> F#sll_keys($s, $phys_ptr_cast(local.list, ^s_node)) == F#sll_keys(loopState#0, $phys_ptr_cast(P#list, ^s_node));
      invariant !$intset_in(P#data, F#sll_lseg_keys($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)));
      invariant $intset_in(P#data, F#sll_keys(loopState#0, $phys_ptr_cast(P#list, ^s_node))) ==> $intset_in(P#data, F#sll_keys($s, $phys_ptr_cast(local.list, ^s_node))) || !$intset_in(P#data, F#sll_keys($s, $phys_ptr_cast(local.list, ^s_node)));
      invariant $intset_in(P#data, F#sll_keys($s, $phys_ptr_cast(L#tmp, ^s_node))) == $intset_in(P#data, F#sll_keys($s, $phys_ptr_cast(local.list, ^s_node)));
      invariant F#sll_keys($s, $phys_ptr_cast(local.list, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), F#sll_keys($s, $phys_ptr_cast(L#tmp, ^s_node)));
      invariant $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node) == $phys_ptr_cast(L#tmp, ^s_node);
      invariant $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#tmp, ^s_node));
      invariant $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#tmp, ^s_node));
      invariant $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> $is_malloc_root($s, $phys_ptr_cast(L#tmp, ^s_node));
      invariant $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#prev, ^s_node));
      invariant $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#prev, ^s_node));
    {
      anon9:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#0, $s);
        assume $full_stop_ext(#tok$2^16.2, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(tmp)) ...
        if ($non_null($phys_ptr_cast(L#tmp, ^s_node)))
        {
          anon6:
            // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_keys(tmp), @_vcc_intset_union(sll_keys(*((tmp->next))), @_vcc_intset_singleton(*((tmp->key)))))); 
            assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_list_len_next(tmp), unchecked+(sll_list_len_next(*((tmp->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll(tmp), &&(sll(*((tmp->next))), unchecked!(@_vcc_oset_in(tmp, sll_reach(*((tmp->next)))))))); 
            assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_reach(tmp), @_vcc_oset_union(sll_reach(*((tmp->next))), @_vcc_oset_singleton(tmp)))); 
            assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_keys(local.list), @_vcc_intset_union(sll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_list_len_next(local.list), unchecked+(sll_list_len_next(*((local.list->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll(local.list), &&(sll(*((local.list->next))), unchecked!(@_vcc_oset_in(local.list, sll_reach(*((local.list->next)))))))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_reach(local.list), @_vcc_oset_union(sll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg(local.list, prev), &&(sll_lseg(*((local.list->next)), prev), unchecked!(@_vcc_oset_in(local.list, sll_lseg_reach(*((local.list->next)), prev)))))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg_reach(local.list, prev), @_vcc_oset_union(sll_lseg_reach(*((local.list->next)), prev), @_vcc_oset_singleton(local.list)))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg_keys(local.list, prev), @_vcc_intset_union(sll_lseg_keys(*((local.list->next)), prev), @_vcc_intset_singleton(*((local.list->key)))))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg_len_next(local.list, prev), unchecked+(sll_lseg_len_next(*((local.list->next)), prev), 1))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg(local.list, tmp), &&(sll_lseg(*((local.list->next)), tmp), unchecked!(@_vcc_oset_in(local.list, sll_lseg_reach(*((local.list->next)), tmp)))))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_reach(local.list, tmp), @_vcc_oset_union(sll_lseg_reach(*((local.list->next)), tmp), @_vcc_oset_singleton(local.list)))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_keys(local.list, tmp), @_vcc_intset_union(sll_lseg_keys(*((local.list->next)), tmp), @_vcc_intset_singleton(*((local.list->key)))))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_len_next(local.list, tmp), unchecked+(sll_lseg_len_next(*((local.list->next)), tmp), 1))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), 1);
            // assert @reads_check_normal((tmp->key)); 
            assert $thread_local($s, $phys_ptr_cast(L#tmp, ^s_node));
            assume true;
            // if (==(*((tmp->key)), data)) ...
            if ($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp, ^s_node)) == P#data)
            {
              anon3:
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_keys(tmp), @_vcc_intset_union(sll_keys(*((tmp->next))), @_vcc_intset_singleton(*((tmp->key)))))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_list_len_next(tmp), unchecked+(sll_list_len_next(*((tmp->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), 1);
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll(tmp), &&(sll(*((tmp->next))), unchecked!(@_vcc_oset_in(tmp, sll_reach(*((tmp->next)))))))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_reach(tmp), @_vcc_oset_union(sll_reach(*((tmp->next))), @_vcc_oset_singleton(tmp)))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_keys(local.list), @_vcc_intset_union(sll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_list_len_next(local.list), unchecked+(sll_list_len_next(*((local.list->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), 1);
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll(local.list), &&(sll(*((local.list->next))), unchecked!(@_vcc_oset_in(local.list, sll_reach(*((local.list->next)))))))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_reach(local.list), @_vcc_oset_union(sll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg(local.list, prev), &&(sll_lseg(*((local.list->next)), prev), unchecked!(@_vcc_oset_in(local.list, sll_lseg_reach(*((local.list->next)), prev)))))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg_reach(local.list, prev), @_vcc_oset_union(sll_lseg_reach(*((local.list->next)), prev), @_vcc_oset_singleton(local.list)))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg_keys(local.list, prev), @_vcc_intset_union(sll_lseg_keys(*((local.list->next)), prev), @_vcc_intset_singleton(*((local.list->key)))))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg_len_next(local.list, prev), unchecked+(sll_lseg_len_next(*((local.list->next)), prev), 1))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg(local.list, tmp), &&(sll_lseg(*((local.list->next)), tmp), unchecked!(@_vcc_oset_in(local.list, sll_lseg_reach(*((local.list->next)), tmp)))))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_reach(local.list, tmp), @_vcc_oset_union(sll_lseg_reach(*((local.list->next)), tmp), @_vcc_oset_singleton(local.list)))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_keys(local.list, tmp), @_vcc_intset_union(sll_lseg_keys(*((local.list->next)), tmp), @_vcc_intset_singleton(*((local.list->key)))))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_len_next(local.list, tmp), unchecked+(sll_lseg_len_next(*((local.list->next)), tmp), 1))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), 1);
                // struct s_node* tmp_next; 
                // struct s_node* tmp0; 
                // tmp0 := tmp; 
                SL#tmp0 := $phys_ptr_cast(L#tmp, ^s_node);
                // struct s_node* stmtexpr0#4; 
                // stmtexpr0#4 := tmp0; 
                stmtexpr0#4 := $phys_ptr_cast(SL#tmp0, ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_keys(tmp), @_vcc_intset_union(sll_keys(*((tmp->next))), @_vcc_intset_singleton(*((tmp->key)))))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_list_len_next(tmp), unchecked+(sll_list_len_next(*((tmp->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), 1);
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll(tmp), &&(sll(*((tmp->next))), unchecked!(@_vcc_oset_in(tmp, sll_reach(*((tmp->next)))))))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_reach(tmp), @_vcc_oset_union(sll_reach(*((tmp->next))), @_vcc_oset_singleton(tmp)))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp, ^s_node)));
                // assert @reads_check_normal((tmp->next)); 
                assert $thread_local($s, $phys_ptr_cast(L#tmp, ^s_node));
                // tmp_next := *((tmp->next)); 
                L#tmp_next := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll_keys(tmp_next), @_vcc_intset_union(sll_keys(*((tmp_next->next))), @_vcc_intset_singleton(*((tmp_next->key)))))); 
                assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_next, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll_list_len_next(tmp_next), unchecked+(sll_list_len_next(*((tmp_next->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)), 1);
                // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll(tmp_next), &&(sll(*((tmp_next->next))), unchecked!(@_vcc_oset_in(tmp_next, sll_reach(*((tmp_next->next)))))))); 
                assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll_reach(tmp_next), @_vcc_oset_union(sll_reach(*((tmp_next->next))), @_vcc_oset_singleton(tmp_next)))); 
                assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_next, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_keys(tmp), @_vcc_intset_union(sll_keys(*((tmp->next))), @_vcc_intset_singleton(*((tmp->key)))))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_list_len_next(tmp), unchecked+(sll_list_len_next(*((tmp->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), 1);
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll(tmp), &&(sll(*((tmp->next))), unchecked!(@_vcc_oset_in(tmp, sll_reach(*((tmp->next)))))))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_reach(tmp), @_vcc_oset_union(sll_reach(*((tmp->next))), @_vcc_oset_singleton(tmp)))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp, ^s_node)));
                assume true;
                // if (@_vcc_ptr_neq_null(prev)) ...
                if ($non_null($phys_ptr_cast(L#prev, ^s_node)))
                {
                  anon1:
                    // _math \state _dryad_S0; 
                    // _dryad_S0 := @_vcc_current_state(@state); 
                    SL#_dryad_S0 := $current_state($s);
                    // _math \state stmtexpr0#2; 
                    // stmtexpr0#2 := _dryad_S0; 
                    stmtexpr0#2 := SL#_dryad_S0;
                    // assert @prim_writes_check((prev->next)); 
                    assert $writable_prim($s, #wrTime$2^3.3, $dot($phys_ptr_cast(L#prev, ^s_node), s_node.next));
                    // *(prev->next) := tmp_next; 
                    call $write_int(s_node.next, $phys_ptr_cast(L#prev, ^s_node), $ptr_to_int($phys_ptr_cast(L#tmp_next, ^s_node)));
                    assume $full_stop_ext(#tok$2^36.5, $s);
                    // _math \state _dryad_S1; 
                    // _dryad_S1 := @_vcc_current_state(@state); 
                    SL#_dryad_S1 := $current_state($s);
                    // _math \state stmtexpr1#3; 
                    // stmtexpr1#3 := _dryad_S1; 
                    stmtexpr1#3 := SL#_dryad_S1;
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(tmp0)))), ==(old(_dryad_S0, sll_keys(tmp0)), old(_dryad_S1, sll_keys(tmp0)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#tmp0, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(SL#tmp0, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(SL#tmp0, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(tmp0)))), ==(old(_dryad_S0, sll_list_len_next(tmp0)), old(_dryad_S1, sll_list_len_next(tmp0)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#tmp0, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(SL#tmp0, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(SL#tmp0, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(tmp0)))), ==(old(_dryad_S0, sll(tmp0)), old(_dryad_S1, sll(tmp0)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#tmp0, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(SL#tmp0, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(SL#tmp0, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(tmp0)))), ==(old(_dryad_S0, sll_reach(tmp0)), old(_dryad_S1, sll_reach(tmp0)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#tmp0, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#tmp0, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(SL#tmp0, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(tmp_next)))), ==(old(_dryad_S0, sll_keys(tmp_next)), old(_dryad_S1, sll_keys(tmp_next)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp_next, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#tmp_next, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#tmp_next, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(tmp_next)))), ==(old(_dryad_S0, sll_list_len_next(tmp_next)), old(_dryad_S1, sll_list_len_next(tmp_next)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp_next, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#tmp_next, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#tmp_next, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(tmp_next)))), ==(old(_dryad_S0, sll(tmp_next)), old(_dryad_S1, sll(tmp_next)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp_next, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#tmp_next, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#tmp_next, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(tmp_next)))), ==(old(_dryad_S0, sll_reach(tmp_next)), old(_dryad_S1, sll_reach(tmp_next)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp_next, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp_next, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#tmp_next, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(tmp)))), ==(old(_dryad_S0, sll_keys(tmp)), old(_dryad_S1, sll_keys(tmp)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#tmp, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(tmp)))), ==(old(_dryad_S0, sll_list_len_next(tmp)), old(_dryad_S1, sll_list_len_next(tmp)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#tmp, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(tmp)))), ==(old(_dryad_S0, sll(tmp)), old(_dryad_S1, sll(tmp)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#tmp, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#tmp, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(tmp)))), ==(old(_dryad_S0, sll_reach(tmp)), old(_dryad_S1, sll_reach(tmp)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#tmp, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(local.list)))), ==(old(_dryad_S0, sll_keys(local.list)), old(_dryad_S1, sll_keys(local.list)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(local.list)))), ==(old(_dryad_S0, sll_list_len_next(local.list)), old(_dryad_S1, sll_list_len_next(local.list)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(local.list)))), ==(old(_dryad_S0, sll(local.list)), old(_dryad_S1, sll(local.list)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_reach(local.list)))), ==(old(_dryad_S0, sll_reach(local.list)), old(_dryad_S1, sll_reach(local.list)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_lseg_reach(local.list, prev)))), ==(old(_dryad_S0, sll_lseg(local.list, prev)), old(_dryad_S1, sll_lseg(local.list, prev)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_lseg_reach(local.list, prev)))), ==(old(_dryad_S0, sll_lseg_reach(local.list, prev)), old(_dryad_S1, sll_lseg_reach(local.list, prev)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_lseg_reach(local.list, prev)))), ==(old(_dryad_S0, sll_lseg_keys(local.list, prev)), old(_dryad_S1, sll_lseg_keys(local.list, prev)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_lseg_reach(local.list, prev)))), ==(old(_dryad_S0, sll_lseg_len_next(local.list, prev)), old(_dryad_S1, sll_lseg_len_next(local.list, prev)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0, sll_lseg(local.list, tmp)), old(_dryad_S1, sll_lseg(local.list, tmp)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0, sll_lseg_reach(local.list, tmp)), old(_dryad_S1, sll_lseg_reach(local.list, tmp)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0, sll_lseg_keys(local.list, tmp)), old(_dryad_S1, sll_lseg_keys(local.list, tmp)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0, sll_lseg_len_next(local.list, tmp)), old(_dryad_S1, sll_lseg_len_next(local.list, tmp)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0, sll_lseg(local.list, tmp)), old(_dryad_S1, sll_lseg(local.list, tmp)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0, sll_lseg_reach(local.list, tmp)), old(_dryad_S1, sll_lseg_reach(local.list, tmp)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0, sll_lseg_keys(local.list, tmp)), old(_dryad_S1, sll_lseg_keys(local.list, tmp)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                    // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0, sll_lseg_len_next(local.list, tmp)), old(_dryad_S1, sll_lseg_len_next(local.list, tmp)))); 
                    assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                    // assume ==>(!(@_vcc_ptr_eq_pure(prev, tmp0)), ==(*((tmp0->key)), old(_dryad_S0, *((tmp0->key))))); 
                    assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(SL#tmp0, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(SL#tmp0, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(SL#tmp0, ^s_node));
                    // assume ==>(!(@_vcc_ptr_eq_pure(prev, tmp0)), @_vcc_ptr_eq_pure(*((tmp0->next)), old(_dryad_S0, *((tmp0->next))))); 
                    assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(SL#tmp0, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#tmp0, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(SL#tmp0, ^s_node), ^s_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prev, tmp_next)), ==(*((tmp_next->key)), old(_dryad_S0, *((tmp_next->key))))); 
                    assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(L#tmp_next, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_next, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(L#tmp_next, ^s_node));
                    // assume ==>(!(@_vcc_ptr_eq_pure(prev, tmp_next)), @_vcc_ptr_eq_pure(*((tmp_next->next)), old(_dryad_S0, *((tmp_next->next))))); 
                    assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(L#tmp_next, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prev, tmp)), ==(*((tmp->key)), old(_dryad_S0, *((tmp->key))))); 
                    assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(L#tmp, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(L#tmp, ^s_node));
                    // assume ==>(!(@_vcc_ptr_eq_pure(prev, tmp)), @_vcc_ptr_eq_pure(*((tmp->next)), old(_dryad_S0, *((tmp->next))))); 
                    assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(L#tmp, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node);
                    // assume ==>(!(@_vcc_ptr_eq_pure(prev, local.list)), ==(*((local.list->key)), old(_dryad_S0, *((local.list->key))))); 
                    assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(local.list, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(local.list, ^s_node));
                    // assume ==>(!(@_vcc_ptr_eq_pure(prev, local.list)), @_vcc_ptr_eq_pure(*((local.list->next)), old(_dryad_S0, *((local.list->next))))); 
                    assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(local.list, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node);
                    // assume ==>(@_vcc_ptr_neq_null(tmp0), ==(sll_keys(tmp0), @_vcc_intset_union(sll_keys(*((tmp0->next))), @_vcc_intset_singleton(*((tmp0->key)))))); 
                    assume $non_null($phys_ptr_cast(SL#tmp0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#tmp0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#tmp0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#tmp0, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(tmp0), ==(sll_list_len_next(tmp0), unchecked+(sll_list_len_next(*((tmp0->next))), 1))); 
                    assume $non_null($phys_ptr_cast(SL#tmp0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#tmp0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#tmp0, ^s_node), ^s_node)), 1);
                    // assume ==>(@_vcc_ptr_neq_null(tmp0), ==(sll(tmp0), &&(sll(*((tmp0->next))), unchecked!(@_vcc_oset_in(tmp0, sll_reach(*((tmp0->next)))))))); 
                    assume $non_null($phys_ptr_cast(SL#tmp0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#tmp0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#tmp0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#tmp0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#tmp0, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(tmp0), ==(sll_reach(tmp0), @_vcc_oset_union(sll_reach(*((tmp0->next))), @_vcc_oset_singleton(tmp0)))); 
                    assume $non_null($phys_ptr_cast(SL#tmp0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#tmp0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#tmp0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#tmp0, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll_keys(tmp_next), @_vcc_intset_union(sll_keys(*((tmp_next->next))), @_vcc_intset_singleton(*((tmp_next->key)))))); 
                    assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_next, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll_list_len_next(tmp_next), unchecked+(sll_list_len_next(*((tmp_next->next))), 1))); 
                    assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)), 1);
                    // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll(tmp_next), &&(sll(*((tmp_next->next))), unchecked!(@_vcc_oset_in(tmp_next, sll_reach(*((tmp_next->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll_reach(tmp_next), @_vcc_oset_union(sll_reach(*((tmp_next->next))), @_vcc_oset_singleton(tmp_next)))); 
                    assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_next, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_keys(tmp), @_vcc_intset_union(sll_keys(*((tmp->next))), @_vcc_intset_singleton(*((tmp->key)))))); 
                    assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_list_len_next(tmp), unchecked+(sll_list_len_next(*((tmp->next))), 1))); 
                    assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), 1);
                    // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll(tmp), &&(sll(*((tmp->next))), unchecked!(@_vcc_oset_in(tmp, sll_reach(*((tmp->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_reach(tmp), @_vcc_oset_union(sll_reach(*((tmp->next))), @_vcc_oset_singleton(tmp)))); 
                    assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_keys(local.list), @_vcc_intset_union(sll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_list_len_next(local.list), unchecked+(sll_list_len_next(*((local.list->next))), 1))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), 1);
                    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll(local.list), &&(sll(*((local.list->next))), unchecked!(@_vcc_oset_in(local.list, sll_reach(*((local.list->next)))))))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_reach(local.list), @_vcc_oset_union(sll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
                    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll_keys(tmp_next), @_vcc_intset_union(sll_keys(*((tmp_next->next))), @_vcc_intset_singleton(*((tmp_next->key)))))); 
                    assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_next, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll_list_len_next(tmp_next), unchecked+(sll_list_len_next(*((tmp_next->next))), 1))); 
                    assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)), 1);
                    // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll(tmp_next), &&(sll(*((tmp_next->next))), unchecked!(@_vcc_oset_in(tmp_next, sll_reach(*((tmp_next->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll_reach(tmp_next), @_vcc_oset_union(sll_reach(*((tmp_next->next))), @_vcc_oset_singleton(tmp_next)))); 
                    assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_next, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg(local.list, tmp), &&(sll_lseg(*((local.list->next)), tmp), unchecked!(@_vcc_oset_in(local.list, sll_lseg_reach(*((local.list->next)), tmp)))))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node))));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_reach(local.list, tmp), @_vcc_oset_union(sll_lseg_reach(*((local.list->next)), tmp), @_vcc_oset_singleton(local.list)))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_keys(local.list, tmp), @_vcc_intset_union(sll_lseg_keys(*((local.list->next)), tmp), @_vcc_intset_singleton(*((local.list->key)))))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_len_next(local.list, tmp), unchecked+(sll_lseg_len_next(*((local.list->next)), tmp), 1))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), 1);
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg(local.list, tmp), &&(sll_lseg(*((local.list->next)), tmp), unchecked!(@_vcc_oset_in(local.list, sll_lseg_reach(*((local.list->next)), tmp)))))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node))));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_reach(local.list, tmp), @_vcc_oset_union(sll_lseg_reach(*((local.list->next)), tmp), @_vcc_oset_singleton(local.list)))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_keys(local.list, tmp), @_vcc_intset_union(sll_lseg_keys(*((local.list->next)), tmp), @_vcc_intset_singleton(*((local.list->key)))))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_len_next(local.list, tmp), unchecked+(sll_lseg_len_next(*((local.list->next)), tmp), 1))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), 1);
                }
                else
                {
                  anon2:
                    // assume ==>(@_vcc_ptr_neq_null(tmp0), ==(sll_keys(tmp0), @_vcc_intset_union(sll_keys(*((tmp0->next))), @_vcc_intset_singleton(*((tmp0->key)))))); 
                    assume $non_null($phys_ptr_cast(SL#tmp0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#tmp0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#tmp0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#tmp0, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(tmp0), ==(sll_list_len_next(tmp0), unchecked+(sll_list_len_next(*((tmp0->next))), 1))); 
                    assume $non_null($phys_ptr_cast(SL#tmp0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#tmp0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#tmp0, ^s_node), ^s_node)), 1);
                    // assume ==>(@_vcc_ptr_neq_null(tmp0), ==(sll(tmp0), &&(sll(*((tmp0->next))), unchecked!(@_vcc_oset_in(tmp0, sll_reach(*((tmp0->next)))))))); 
                    assume $non_null($phys_ptr_cast(SL#tmp0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#tmp0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#tmp0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#tmp0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#tmp0, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(tmp0), ==(sll_reach(tmp0), @_vcc_oset_union(sll_reach(*((tmp0->next))), @_vcc_oset_singleton(tmp0)))); 
                    assume $non_null($phys_ptr_cast(SL#tmp0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#tmp0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#tmp0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#tmp0, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll_keys(tmp_next), @_vcc_intset_union(sll_keys(*((tmp_next->next))), @_vcc_intset_singleton(*((tmp_next->key)))))); 
                    assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp_next, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll_list_len_next(tmp_next), unchecked+(sll_list_len_next(*((tmp_next->next))), 1))); 
                    assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)), 1);
                    // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll(tmp_next), &&(sll(*((tmp_next->next))), unchecked!(@_vcc_oset_in(tmp_next, sll_reach(*((tmp_next->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp_next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(tmp_next), ==(sll_reach(tmp_next), @_vcc_oset_union(sll_reach(*((tmp_next->next))), @_vcc_oset_singleton(tmp_next)))); 
                    assume $non_null($phys_ptr_cast(L#tmp_next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp_next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp_next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp_next, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_keys(tmp), @_vcc_intset_union(sll_keys(*((tmp->next))), @_vcc_intset_singleton(*((tmp->key)))))); 
                    assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_list_len_next(tmp), unchecked+(sll_list_len_next(*((tmp->next))), 1))); 
                    assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), 1);
                    // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll(tmp), &&(sll(*((tmp->next))), unchecked!(@_vcc_oset_in(tmp, sll_reach(*((tmp->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_reach(tmp), @_vcc_oset_union(sll_reach(*((tmp->next))), @_vcc_oset_singleton(tmp)))); 
                    assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
                    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_keys(local.list), @_vcc_intset_union(sll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_list_len_next(local.list), unchecked+(sll_list_len_next(*((local.list->next))), 1))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), 1);
                    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll(local.list), &&(sll(*((local.list->next))), unchecked!(@_vcc_oset_in(local.list, sll_reach(*((local.list->next)))))))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_reach(local.list), @_vcc_oset_union(sll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg(local.list, prev), &&(sll_lseg(*((local.list->next)), prev), unchecked!(@_vcc_oset_in(local.list, sll_lseg_reach(*((local.list->next)), prev)))))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node))));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg_reach(local.list, prev), @_vcc_oset_union(sll_lseg_reach(*((local.list->next)), prev), @_vcc_oset_singleton(local.list)))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg_keys(local.list, prev), @_vcc_intset_union(sll_lseg_keys(*((local.list->next)), prev), @_vcc_intset_singleton(*((local.list->key)))))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg_len_next(local.list, prev), unchecked+(sll_lseg_len_next(*((local.list->next)), prev), 1))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), 1);
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg(local.list, tmp), &&(sll_lseg(*((local.list->next)), tmp), unchecked!(@_vcc_oset_in(local.list, sll_lseg_reach(*((local.list->next)), tmp)))))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node))));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_reach(local.list, tmp), @_vcc_oset_union(sll_lseg_reach(*((local.list->next)), tmp), @_vcc_oset_singleton(local.list)))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_keys(local.list, tmp), @_vcc_intset_union(sll_lseg_keys(*((local.list->next)), tmp), @_vcc_intset_singleton(*((local.list->key)))))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_len_next(local.list, tmp), unchecked+(sll_lseg_len_next(*((local.list->next)), tmp), 1))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), 1);
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg(local.list, tmp), &&(sll_lseg(*((local.list->next)), tmp), unchecked!(@_vcc_oset_in(local.list, sll_lseg_reach(*((local.list->next)), tmp)))))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node))));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_reach(local.list, tmp), @_vcc_oset_union(sll_lseg_reach(*((local.list->next)), tmp), @_vcc_oset_singleton(local.list)))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_keys(local.list, tmp), @_vcc_intset_union(sll_lseg_keys(*((local.list->next)), tmp), @_vcc_intset_singleton(*((local.list->key)))))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
                    // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_len_next(local.list, tmp), unchecked+(sll_lseg_len_next(*((local.list->next)), tmp), 1))); 
                    assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), 1);
                    // local.list := tmp_next; 
                    local.list := $phys_ptr_cast(L#tmp_next, ^s_node);
                    // assert sll_lseg(tmp0, tmp0); 
                    assert F#sll_lseg($s, $phys_ptr_cast(SL#tmp0, ^s_node), $phys_ptr_cast(SL#tmp0, ^s_node));
                    // assume sll_lseg(tmp0, tmp0); 
                    assume F#sll_lseg($s, $phys_ptr_cast(SL#tmp0, ^s_node), $phys_ptr_cast(SL#tmp0, ^s_node));
                    // assert sll_lseg(tmp_next, tmp_next); 
                    assert F#sll_lseg($s, $phys_ptr_cast(L#tmp_next, ^s_node), $phys_ptr_cast(L#tmp_next, ^s_node));
                    // assume sll_lseg(tmp_next, tmp_next); 
                    assume F#sll_lseg($s, $phys_ptr_cast(L#tmp_next, ^s_node), $phys_ptr_cast(L#tmp_next, ^s_node));
                    // assert sll_lseg(tmp, tmp); 
                    assert F#sll_lseg($s, $phys_ptr_cast(L#tmp, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                    // assume sll_lseg(tmp, tmp); 
                    assume F#sll_lseg($s, $phys_ptr_cast(L#tmp, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                    // assert sll_lseg(prev, prev); 
                    assert F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                    // assume sll_lseg(prev, prev); 
                    assume F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                    // assert sll_lseg(local.list, local.list); 
                    assert F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(local.list, ^s_node));
                    // assume sll_lseg(local.list, local.list); 
                    assume F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(local.list, ^s_node));
                }

              anon4:
                // _math \state _dryad_S0#0; 
                // _dryad_S0#0 := @_vcc_current_state(@state); 
                _dryad_S0#0 := $current_state($s);
                // _math \state stmtexpr1#5; 
                // stmtexpr1#5 := _dryad_S0#0; 
                stmtexpr1#5 := _dryad_S0#0;
                // void function
                // assert @writes_check(tmp); 
                assert $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#tmp, ^s_node));
                // assert @writes_check(@_vcc_extent(@state, tmp)); 
                assert (forall #writes$2^41.4: $ptr :: { $dont_instantiate(#writes$2^41.4) } $set_in(#writes$2^41.4, $extent($s, $phys_ptr_cast(L#tmp, ^s_node))) ==> $top_writable($s, #wrTime$2^3.3, #writes$2^41.4));
                // stmt _vcc_free(tmp); 
                call $free($phys_ptr_cast(L#tmp, ^s_node));
                assume $full_stop_ext(#tok$2^41.4, $s);
                // _math \state _dryad_S1#1; 
                // _dryad_S1#1 := @_vcc_current_state(@state); 
                _dryad_S1#1 := $current_state($s);
                // _math \state stmtexpr2#6; 
                // stmtexpr2#6 := _dryad_S1#1; 
                stmtexpr2#6 := _dryad_S1#1;
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(tmp0)))), ==(old(_dryad_S0#0, sll_keys(tmp0)), old(_dryad_S1#1, sll_keys(tmp0)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(SL#tmp0, ^s_node))) ==> F#sll_keys(_dryad_S0#0, $phys_ptr_cast(SL#tmp0, ^s_node)) == F#sll_keys(_dryad_S1#1, $phys_ptr_cast(SL#tmp0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(tmp0)))), ==(old(_dryad_S0#0, sll_list_len_next(tmp0)), old(_dryad_S1#1, sll_list_len_next(tmp0)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(SL#tmp0, ^s_node))) ==> F#sll_list_len_next(_dryad_S0#0, $phys_ptr_cast(SL#tmp0, ^s_node)) == F#sll_list_len_next(_dryad_S1#1, $phys_ptr_cast(SL#tmp0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(tmp0)))), ==(old(_dryad_S0#0, sll(tmp0)), old(_dryad_S1#1, sll(tmp0)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(SL#tmp0, ^s_node))) ==> F#sll(_dryad_S0#0, $phys_ptr_cast(SL#tmp0, ^s_node)) == F#sll(_dryad_S1#1, $phys_ptr_cast(SL#tmp0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(tmp0)))), ==(old(_dryad_S0#0, sll_reach(tmp0)), old(_dryad_S1#1, sll_reach(tmp0)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(SL#tmp0, ^s_node))) ==> F#sll_reach(_dryad_S0#0, $phys_ptr_cast(SL#tmp0, ^s_node)) == F#sll_reach(_dryad_S1#1, $phys_ptr_cast(SL#tmp0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(tmp_next)))), ==(old(_dryad_S0#0, sll_keys(tmp_next)), old(_dryad_S1#1, sll_keys(tmp_next)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(L#tmp_next, ^s_node))) ==> F#sll_keys(_dryad_S0#0, $phys_ptr_cast(L#tmp_next, ^s_node)) == F#sll_keys(_dryad_S1#1, $phys_ptr_cast(L#tmp_next, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(tmp_next)))), ==(old(_dryad_S0#0, sll_list_len_next(tmp_next)), old(_dryad_S1#1, sll_list_len_next(tmp_next)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(L#tmp_next, ^s_node))) ==> F#sll_list_len_next(_dryad_S0#0, $phys_ptr_cast(L#tmp_next, ^s_node)) == F#sll_list_len_next(_dryad_S1#1, $phys_ptr_cast(L#tmp_next, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(tmp_next)))), ==(old(_dryad_S0#0, sll(tmp_next)), old(_dryad_S1#1, sll(tmp_next)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(L#tmp_next, ^s_node))) ==> F#sll(_dryad_S0#0, $phys_ptr_cast(L#tmp_next, ^s_node)) == F#sll(_dryad_S1#1, $phys_ptr_cast(L#tmp_next, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(tmp_next)))), ==(old(_dryad_S0#0, sll_reach(tmp_next)), old(_dryad_S1#1, sll_reach(tmp_next)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(L#tmp_next, ^s_node))) ==> F#sll_reach(_dryad_S0#0, $phys_ptr_cast(L#tmp_next, ^s_node)) == F#sll_reach(_dryad_S1#1, $phys_ptr_cast(L#tmp_next, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(prev)))), ==(old(_dryad_S0#0, sll_keys(prev)), old(_dryad_S1#1, sll_keys(prev)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_keys(_dryad_S0#0, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_keys(_dryad_S1#1, $phys_ptr_cast(L#prev, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(prev)))), ==(old(_dryad_S0#0, sll_list_len_next(prev)), old(_dryad_S1#1, sll_list_len_next(prev)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_list_len_next(_dryad_S0#0, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_list_len_next(_dryad_S1#1, $phys_ptr_cast(L#prev, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(prev)))), ==(old(_dryad_S0#0, sll(prev)), old(_dryad_S1#1, sll(prev)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll(_dryad_S0#0, $phys_ptr_cast(L#prev, ^s_node)) == F#sll(_dryad_S1#1, $phys_ptr_cast(L#prev, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(prev)))), ==(old(_dryad_S0#0, sll_reach(prev)), old(_dryad_S1#1, sll_reach(prev)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_reach(_dryad_S0#0, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_reach(_dryad_S1#1, $phys_ptr_cast(L#prev, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(local.list)))), ==(old(_dryad_S0#0, sll_keys(local.list)), old(_dryad_S1#1, sll_keys(local.list)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node))) ==> F#sll_keys(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node)) == F#sll_keys(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(local.list)))), ==(old(_dryad_S0#0, sll_list_len_next(local.list)), old(_dryad_S1#1, sll_list_len_next(local.list)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node))) ==> F#sll_list_len_next(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node)) == F#sll_list_len_next(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(local.list)))), ==(old(_dryad_S0#0, sll(local.list)), old(_dryad_S1#1, sll(local.list)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node))) ==> F#sll(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node)) == F#sll(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_reach(local.list)))), ==(old(_dryad_S0#0, sll_reach(local.list)), old(_dryad_S1#1, sll_reach(local.list)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node))) ==> F#sll_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node)) == F#sll_reach(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_lseg_reach(local.list, prev)))), ==(old(_dryad_S0#0, sll_lseg(local.list, prev)), old(_dryad_S1#1, sll_lseg(local.list, prev)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_lseg_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_lseg_reach(local.list, prev)))), ==(old(_dryad_S0#0, sll_lseg_reach(local.list, prev)), old(_dryad_S1#1, sll_lseg_reach(local.list, prev)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_lseg_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_reach(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_lseg_reach(local.list, prev)))), ==(old(_dryad_S0#0, sll_lseg_keys(local.list, prev)), old(_dryad_S1#1, sll_lseg_keys(local.list, prev)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_lseg_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_keys(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_keys(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_lseg_reach(local.list, prev)))), ==(old(_dryad_S0#0, sll_lseg_len_next(local.list, prev)), old(_dryad_S1#1, sll_lseg_len_next(local.list, prev)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_lseg_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_len_next(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_len_next(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0#0, sll_lseg(local.list, tmp)), old(_dryad_S1#1, sll_lseg(local.list, tmp)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_lseg_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0#0, sll_lseg_reach(local.list, tmp)), old(_dryad_S1#1, sll_lseg_reach(local.list, tmp)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_lseg_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg_reach(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0#0, sll_lseg_keys(local.list, tmp)), old(_dryad_S1#1, sll_lseg_keys(local.list, tmp)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_lseg_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg_keys(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg_keys(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0#0, sll_lseg_len_next(local.list, tmp)), old(_dryad_S1#1, sll_lseg_len_next(local.list, tmp)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_lseg_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg_len_next(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg_len_next(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0#0, sll_lseg(local.list, tmp)), old(_dryad_S1#1, sll_lseg(local.list, tmp)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_lseg_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0#0, sll_lseg_reach(local.list, tmp)), old(_dryad_S1#1, sll_lseg_reach(local.list, tmp)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_lseg_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg_reach(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0#0, sll_lseg_keys(local.list, tmp)), old(_dryad_S1#1, sll_lseg_keys(local.list, tmp)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_lseg_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg_keys(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg_keys(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(tmp, old(_dryad_S0#0, sll_lseg_reach(local.list, tmp)))), ==(old(_dryad_S0#0, sll_lseg_len_next(local.list, tmp)), old(_dryad_S1#1, sll_lseg_len_next(local.list, tmp)))); 
                assume !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_lseg_reach(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node))) ==> F#sll_lseg_len_next(_dryad_S0#0, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == F#sll_lseg_len_next(_dryad_S1#1, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                // tmp := tmp_next; 
                L#tmp := $phys_ptr_cast(L#tmp_next, ^s_node);
                // assert sll_lseg(tmp0, tmp0); 
                assert F#sll_lseg($s, $phys_ptr_cast(SL#tmp0, ^s_node), $phys_ptr_cast(SL#tmp0, ^s_node));
                // assume sll_lseg(tmp0, tmp0); 
                assume F#sll_lseg($s, $phys_ptr_cast(SL#tmp0, ^s_node), $phys_ptr_cast(SL#tmp0, ^s_node));
                // assert sll_lseg(tmp_next, tmp_next); 
                assert F#sll_lseg($s, $phys_ptr_cast(L#tmp_next, ^s_node), $phys_ptr_cast(L#tmp_next, ^s_node));
                // assume sll_lseg(tmp_next, tmp_next); 
                assume F#sll_lseg($s, $phys_ptr_cast(L#tmp_next, ^s_node), $phys_ptr_cast(L#tmp_next, ^s_node));
                // assert sll_lseg(tmp, tmp); 
                assert F#sll_lseg($s, $phys_ptr_cast(L#tmp, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                // assume sll_lseg(tmp, tmp); 
                assume F#sll_lseg($s, $phys_ptr_cast(L#tmp, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                // assert sll_lseg(prev, prev); 
                assert F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                // assume sll_lseg(prev, prev); 
                assume F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                // assert sll_lseg(local.list, local.list); 
                assert F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(local.list, ^s_node));
                // assume sll_lseg(local.list, local.list); 
                assume F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(local.list, ^s_node));
            }
            else
            {
              anon5:
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_keys(tmp), @_vcc_intset_union(sll_keys(*((tmp->next))), @_vcc_intset_singleton(*((tmp->key)))))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_list_len_next(tmp), unchecked+(sll_list_len_next(*((tmp->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), 1);
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll(tmp), &&(sll(*((tmp->next))), unchecked!(@_vcc_oset_in(tmp, sll_reach(*((tmp->next)))))))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_reach(tmp), @_vcc_oset_union(sll_reach(*((tmp->next))), @_vcc_oset_singleton(tmp)))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_keys(local.list), @_vcc_intset_union(sll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_list_len_next(local.list), unchecked+(sll_list_len_next(*((local.list->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), 1);
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll(local.list), &&(sll(*((local.list->next))), unchecked!(@_vcc_oset_in(local.list, sll_reach(*((local.list->next)))))))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_reach(local.list), @_vcc_oset_union(sll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg(local.list, prev), &&(sll_lseg(*((local.list->next)), prev), unchecked!(@_vcc_oset_in(local.list, sll_lseg_reach(*((local.list->next)), prev)))))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg_reach(local.list, prev), @_vcc_oset_union(sll_lseg_reach(*((local.list->next)), prev), @_vcc_oset_singleton(local.list)))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg_keys(local.list, prev), @_vcc_intset_union(sll_lseg_keys(*((local.list->next)), prev), @_vcc_intset_singleton(*((local.list->key)))))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, prev)), ==(sll_lseg_len_next(local.list, prev), unchecked+(sll_lseg_len_next(*((local.list->next)), prev), 1))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg(local.list, tmp), &&(sll_lseg(*((local.list->next)), tmp), unchecked!(@_vcc_oset_in(local.list, sll_lseg_reach(*((local.list->next)), tmp)))))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_reach(local.list, tmp), @_vcc_oset_union(sll_lseg_reach(*((local.list->next)), tmp), @_vcc_oset_singleton(local.list)))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_keys(local.list, tmp), @_vcc_intset_union(sll_lseg_keys(*((local.list->next)), tmp), @_vcc_intset_singleton(*((local.list->key)))))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_pure(local.list, tmp)), ==(sll_lseg_len_next(local.list, tmp), unchecked+(sll_lseg_len_next(*((local.list->next)), tmp), 1))); 
                assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $phys_ptr_cast(local.list, ^s_node) != $phys_ptr_cast(L#tmp, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node), $phys_ptr_cast(L#tmp, ^s_node)), 1);
                // prev := tmp; 
                L#prev := $phys_ptr_cast(L#tmp, ^s_node);
                // assert sll_lseg(tmp, tmp); 
                assert F#sll_lseg($s, $phys_ptr_cast(L#tmp, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                // assume sll_lseg(tmp, tmp); 
                assume F#sll_lseg($s, $phys_ptr_cast(L#tmp, ^s_node), $phys_ptr_cast(L#tmp, ^s_node));
                // assert sll_lseg(prev, prev); 
                assert F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                // assume sll_lseg(prev, prev); 
                assume F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                // assert sll_lseg(local.list, local.list); 
                assert F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(local.list, ^s_node));
                // assume sll_lseg(local.list, local.list); 
                assume F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(local.list, ^s_node));
                // struct s_node* prev0; 
                // prev0 := prev; 
                SL#prev0 := $phys_ptr_cast(L#prev, ^s_node);
                // struct s_node* stmtexpr0#7; 
                // stmtexpr0#7 := prev0; 
                stmtexpr0#7 := $phys_ptr_cast(SL#prev0, ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
                // assert @reads_check_normal((prev->next)); 
                assert $thread_local($s, $phys_ptr_cast(L#prev, ^s_node));
                // tmp := *((prev->next)); 
                L#tmp := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_keys(tmp), @_vcc_intset_union(sll_keys(*((tmp->next))), @_vcc_intset_singleton(*((tmp->key)))))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_list_len_next(tmp), unchecked+(sll_list_len_next(*((tmp->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), 1);
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll(tmp), &&(sll(*((tmp->next))), unchecked!(@_vcc_oset_in(tmp, sll_reach(*((tmp->next)))))))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_reach(tmp), @_vcc_oset_union(sll_reach(*((tmp->next))), @_vcc_oset_singleton(tmp)))); 
                assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
                assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            }

          anon7:
            // assume ==>(@_vcc_ptr_neq_null(tmp), &&(&&(@_vcc_mutable(@state, tmp), @writes_check(tmp)), @_vcc_is_malloc_root(@state, tmp))); 
            assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#tmp, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#tmp, ^s_node)) && $is_malloc_root($s, $phys_ptr_cast(L#tmp, ^s_node));
        }
        else
        {
          anon8:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // goto #break_1; 
            goto #break_1;
        }

      #continue_1:
        assume true;
    }

  anon11:
    assume $full_stop_ext(#tok$2^16.2, $s);

  #break_1:
    // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_keys(tmp), @_vcc_intset_union(sll_keys(*((tmp->next))), @_vcc_intset_singleton(*((tmp->key)))))); 
    assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tmp, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tmp, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_list_len_next(tmp), unchecked+(sll_list_len_next(*((tmp->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tmp, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll(tmp), &&(sll(*((tmp->next))), unchecked!(@_vcc_oset_in(tmp, sll_reach(*((tmp->next)))))))); 
    assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tmp, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tmp, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(tmp), ==(sll_reach(tmp), @_vcc_oset_union(sll_reach(*((tmp->next))), @_vcc_oset_singleton(tmp)))); 
    assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tmp, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tmp, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tmp, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_keys(local.list), @_vcc_intset_union(sll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_list_len_next(local.list), unchecked+(sll_list_len_next(*((local.list->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll(local.list), &&(sll(*((local.list->next))), unchecked!(@_vcc_oset_in(local.list, sll_reach(*((local.list->next)))))))); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_reach(local.list), @_vcc_oset_union(sll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
    // return local.list; 
    $result := $phys_ptr_cast(local.list, ^s_node);
    assume true;
    assert $position_marker();
    goto #exit;

  anon12:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$2^41.4: $token;

const unique #tok$2^36.5: $token;

const unique #tok$2^16.2: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^3.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cglibc?5Cgslist?5Cg_slist_remove_all.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cglibc?5Cgslist?5Cg_slist_remove_all.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cglibc?5Cgslist?5Cdryad_gslist_sll.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cglibc?5Cgslist?5Cdryad_gslist_sll.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^s_node);
