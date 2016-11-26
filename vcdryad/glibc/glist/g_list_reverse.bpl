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

const unique ^$#_purecall_handler#1: $ctype;

axiom $def_fnptr_type(^$#_purecall_handler#1);

type $#_purecall_handler#1;

const unique ^$#_invalid_parameter_handler#2: $ctype;

axiom $def_fnptr_type(^$#_invalid_parameter_handler#2);

type $#_invalid_parameter_handler#2;

const unique ^$#g_list_reverse.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#g_list_reverse.c..36263#3);

type $#g_list_reverse.c..36263#3;

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

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#dll_lseg(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($is_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg(#s, SP#hd, SP#tl)) && ($phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg(#s, SP#hd, SP#tl)) && ($is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> F#dll_lseg(#s, SP#hd, SP#tl) == F#dll(#s, $phys_ptr_cast(SP#hd, ^d_node))) && (F#dll(#s, $phys_ptr_cast(SP#tl, ^d_node)) && $oset_disjoint(F#dll_reach(#s, $phys_ptr_cast(SP#tl, ^d_node)), F#dll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) ==> F#dll(#s, $phys_ptr_cast(SP#hd, ^d_node)) && F#dll_keys(#s, $phys_ptr_cast(SP#hd, ^d_node)) == $intset_union(F#dll_keys(#s, $phys_ptr_cast(SP#tl, ^d_node)), F#dll_lseg_keys(#s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) && F#dll_list_len_next(#s, $phys_ptr_cast(SP#hd, ^d_node)) == $unchk_add(^^nat, F#dll_lseg_len_next(#s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node)), F#dll_list_len_next(#s, $phys_ptr_cast(SP#tl, ^d_node)))) && ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && F#dll(#s, $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) && $oset_disjoint(F#dll_reach(#s, $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)), F#dll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^d_node), F#dll_reach(#s, $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^d_node), F#dll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) ==> F#dll_lseg(#s, $phys_ptr_cast(SP#hd, ^d_node), $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) && F#dll_lseg_keys(#s, $phys_ptr_cast(SP#hd, ^d_node), $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) == $intset_union($intset_singleton($rd_inv(#s, d_node.key, $phys_ptr_cast(SP#tl, ^d_node))), F#dll_lseg_keys(#s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) && F#dll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^d_node), $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) == $oset_union($oset_singleton($phys_ptr_cast(SP#tl, ^d_node)), F#dll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) && F#dll_lseg_len_next(#s, $phys_ptr_cast(SP#hd, ^d_node), $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) == $unchk_add(^^nat, F#dll_lseg_len_next(#s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node)), 1)));

axiom $function_arg_type(cf#dll_lseg, 0, ^^bool);

axiom $function_arg_type(cf#dll_lseg, 1, $ptr_to(^d_node));

axiom $function_arg_type(cf#dll_lseg, 2, $ptr_to(^d_node));

procedure dll_lseg(SP#hd: $ptr, SP#tl: $ptr) returns ($result: bool);
  ensures $is_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $result;
  ensures $phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> $result;
  ensures $is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> $result == F#dll($s, $phys_ptr_cast(SP#hd, ^d_node));
  ensures F#dll($s, $phys_ptr_cast(SP#tl, ^d_node)) && $oset_disjoint(F#dll_reach($s, $phys_ptr_cast(SP#tl, ^d_node)), F#dll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) ==> F#dll($s, $phys_ptr_cast(SP#hd, ^d_node)) && F#dll_keys($s, $phys_ptr_cast(SP#hd, ^d_node)) == $intset_union(F#dll_keys($s, $phys_ptr_cast(SP#tl, ^d_node)), F#dll_lseg_keys($s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) && F#dll_list_len_next($s, $phys_ptr_cast(SP#hd, ^d_node)) == $unchk_add(^^nat, F#dll_lseg_len_next($s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node)), F#dll_list_len_next($s, $phys_ptr_cast(SP#tl, ^d_node)));
  ensures $non_null($phys_ptr_cast(SP#hd, ^d_node)) && F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) && $oset_disjoint(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)), F#dll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^d_node), F#dll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) ==> F#dll_lseg($s, $phys_ptr_cast(SP#hd, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) && F#dll_lseg_keys($s, $phys_ptr_cast(SP#hd, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) == $intset_union($intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(SP#tl, ^d_node))), F#dll_lseg_keys($s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) && F#dll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) == $oset_union($oset_singleton($phys_ptr_cast(SP#tl, ^d_node)), F#dll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))) && F#dll_lseg_len_next($s, $phys_ptr_cast(SP#hd, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SP#tl, ^d_node), ^d_node)) == $unchk_add(^^nat, F#dll_lseg_len_next($s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node)), 1);
  free ensures $result == F#dll_lseg($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#dll_lseg_reach(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : $oset;

const unique cf#dll_lseg_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#dll_lseg_reach(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($is_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg_reach(#s, SP#hd, SP#tl) == $oset_empty()) && ($phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg_reach(#s, SP#hd, SP#tl) == $oset_empty()) && ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $oset_in($phys_ptr_cast(SP#hd, ^d_node), F#dll_lseg_reach(#s, SP#hd, SP#tl))) && ($is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> F#dll_lseg_reach(#s, SP#hd, SP#tl) == F#dll_reach(#s, $phys_ptr_cast(SP#hd, ^d_node))));

axiom $function_arg_type(cf#dll_lseg_reach, 0, ^$#oset);

axiom $function_arg_type(cf#dll_lseg_reach, 1, $ptr_to(^d_node));

axiom $function_arg_type(cf#dll_lseg_reach, 2, $ptr_to(^d_node));

procedure dll_lseg_reach(SP#hd: $ptr, SP#tl: $ptr) returns ($result: $oset);
  ensures $is_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $result == $oset_empty();
  ensures $phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> $result == $oset_empty();
  ensures $non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $oset_in($phys_ptr_cast(SP#hd, ^d_node), $result);
  ensures $is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> $result == F#dll_reach($s, $phys_ptr_cast(SP#hd, ^d_node));
  free ensures $result == F#dll_lseg_reach($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#dll_lseg_keys(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : $intset;

const unique cf#dll_lseg_keys: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#dll_lseg_keys(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $intset_in($rd_inv(#s, d_node.key, $phys_ptr_cast(SP#hd, ^d_node)), F#dll_lseg_keys(#s, SP#hd, SP#tl))) && ($is_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg_keys(#s, SP#hd, SP#tl) == $intset_empty()) && ($phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg_keys(#s, SP#hd, SP#tl) == $intset_empty()) && ($is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> F#dll_lseg_keys(#s, SP#hd, SP#tl) == F#dll_keys(#s, $phys_ptr_cast(SP#hd, ^d_node))));

axiom $function_arg_type(cf#dll_lseg_keys, 0, ^$#intset);

axiom $function_arg_type(cf#dll_lseg_keys, 1, $ptr_to(^d_node));

axiom $function_arg_type(cf#dll_lseg_keys, 2, $ptr_to(^d_node));

procedure dll_lseg_keys(SP#hd: $ptr, SP#tl: $ptr) returns ($result: $intset);
  ensures $non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $intset_in($rd_inv($s, d_node.key, $phys_ptr_cast(SP#hd, ^d_node)), $result);
  ensures $is_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $result == $intset_empty();
  ensures $phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> $result == $intset_empty();
  ensures $is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> $result == F#dll_keys($s, $phys_ptr_cast(SP#hd, ^d_node));
  free ensures $result == F#dll_lseg_keys($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#dll_lseg_len_next(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : int;

const unique cf#dll_lseg_len_next: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#dll_lseg_len_next(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> $in_range_nat(F#dll_lseg_len_next(#s, SP#hd, SP#tl)) && ($phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg_len_next(#s, SP#hd, SP#tl) == 0) && ($is_null($phys_ptr_cast(SP#hd, ^d_node)) ==> F#dll_lseg_len_next(#s, SP#hd, SP#tl) == 0) && ($phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg_len_next(#s, SP#hd, SP#tl) > 0) && ($is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> F#dll_lseg_len_next(#s, SP#hd, SP#tl) == F#dll_lseg_len_next(#s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node))));

axiom $function_arg_type(cf#dll_lseg_len_next, 0, ^^nat);

axiom $function_arg_type(cf#dll_lseg_len_next, 1, $ptr_to(^d_node));

axiom $function_arg_type(cf#dll_lseg_len_next, 2, $ptr_to(^d_node));

procedure dll_lseg_len_next(SP#hd: $ptr, SP#tl: $ptr) returns ($result: int);
  free ensures $in_range_nat($result);
  ensures $phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> $result == 0;
  ensures $is_null($phys_ptr_cast(SP#hd, ^d_node)) ==> $result == 0;
  ensures $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $result > 0;
  ensures $is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> $result == F#dll_lseg_len_next($s, $phys_ptr_cast(SP#hd, ^d_node), $phys_ptr_cast(SP#tl, ^d_node));
  free ensures $result == F#dll_lseg_len_next($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



procedure g_list_reverse(P#list: $ptr) returns ($result: $ptr);
  requires F#dll($s, $phys_ptr_cast(P#list, ^d_node));
  requires $non_null($phys_ptr_cast(P#list, ^d_node)) ==> $is_null($rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(P#list, ^d_node), ^d_node));
  modifies $s, $cev_pc;
  ensures F#dll($s, $phys_ptr_cast($result, ^d_node));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation g_list_reverse(P#list: $ptr) returns ($result: $ptr)
{
  var stmtexpr5#7: $state;
  var SL#_dryad_S3: $state;
  var stmtexpr4#6: $state;
  var SL#_dryad_S2: $state;
  var stmtexpr3#5: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr2#4: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr1#3: $ptr;
  var SL#last1: $ptr;
  var stmtexpr0#2: $ptr;
  var SL#curr0: $ptr;
  var L#last_prev: $ptr;
  var loopState#0: $state;
  var L#last: $ptr;
  var L#curr: $ptr;
  var stmtexpr1#9: $oset;
  var stmtexpr0#8: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$2^5.3: int;
  var #stackframe: int;

  anon4:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$2^5.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$2^5.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$2^5.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := dll_reach(list); 
    call SL#_dryad_G0 := dll_reach($phys_ptr_cast(P#list, ^d_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _math \oset stmtexpr0#8; 
    // stmtexpr0#8 := _dryad_G0; 
    stmtexpr0#8 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#9; 
    // stmtexpr1#9 := _dryad_G1; 
    stmtexpr1#9 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll(list), &&(&&(dll(*((list->next))), ==>(@_vcc_ptr_neq_null(*((list->next))), @_vcc_ptr_eq_pure(*((*((list->next))->prev)), list))), unchecked!(@_vcc_oset_in(list, dll_reach(*((list->next)))))))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#list, ^d_node)) && !$oset_in($phys_ptr_cast(P#list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_reach(list), @_vcc_oset_union(dll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#list, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_keys(list), @_vcc_intset_union(dll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(P#list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(P#list, ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_list_len_next(list), unchecked+(dll_list_len_next(*((list->next))), 1))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(P#list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), 1);
    // struct d_node* curr; 
    // struct d_node* last; 
    // assume ==>(@_vcc_ptr_neq_null(list), &&(@_vcc_mutable(@state, list), @writes_check(list))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> $mutable($s, $phys_ptr_cast(P#list, ^d_node)) && $top_writable($s, #wrTime$2^5.3, $phys_ptr_cast(P#list, ^d_node));
    // last := (struct d_node*)@null; 
    L#last := $phys_ptr_cast($null, ^d_node);
    // assert dll_lseg(last, last); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#last, ^d_node), $phys_ptr_cast(L#last, ^d_node));
    // assume dll_lseg(last, last); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#last, ^d_node), $phys_ptr_cast(L#last, ^d_node));
    // assert dll_lseg(curr, curr); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assume dll_lseg(curr, curr); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assert dll_lseg(list, list); 
    assert F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(P#list, ^d_node));
    // assume dll_lseg(list, list); 
    assume F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(P#list, ^d_node));
    // assume ==>(@_vcc_ptr_neq_null(last), ==(dll(last), &&(&&(dll(*((last->next))), ==>(@_vcc_ptr_neq_null(*((last->next))), @_vcc_ptr_eq_pure(*((*((last->next))->prev)), last))), unchecked!(@_vcc_oset_in(last, dll_reach(*((last->next)))))))); 
    assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#last, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#last, ^d_node)) && !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(last), ==(dll_reach(last), @_vcc_oset_union(dll_reach(*((last->next))), @_vcc_oset_singleton(last)))); 
    assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#last, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#last, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(last), ==(dll_keys(last), @_vcc_intset_union(dll_keys(*((last->next))), @_vcc_intset_singleton(*((last->key)))))); 
    assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#last, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#last, ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(last), ==(dll_list_len_next(last), unchecked+(dll_list_len_next(*((last->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#last, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)), 1);
    // curr := list; 
    L#curr := $phys_ptr_cast(P#list, ^d_node);
    // assert dll_lseg(last, last); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#last, ^d_node), $phys_ptr_cast(L#last, ^d_node));
    // assume dll_lseg(last, last); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#last, ^d_node), $phys_ptr_cast(L#last, ^d_node));
    // assert dll_lseg(curr, curr); 
    assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assume dll_lseg(curr, curr); 
    assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
    // assert dll_lseg(list, list); 
    assert F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(P#list, ^d_node));
    // assume dll_lseg(list, list); 
    assume F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(P#list, ^d_node));
    loopState#0 := $s;
    assume true;
    while (true)
      invariant F#dll($s, $phys_ptr_cast(L#last, ^d_node));
      invariant F#dll($s, $phys_ptr_cast(L#curr, ^d_node));
      invariant $oset_disjoint(F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)), F#dll_reach($s, $phys_ptr_cast(L#last, ^d_node)));
      invariant $non_null($phys_ptr_cast(L#last, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#last, ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node);
      invariant $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $phys_ptr_cast(L#last, ^d_node);
      invariant $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^d_node));
      invariant $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $top_writable($s, #wrTime$2^5.3, $phys_ptr_cast(L#curr, ^d_node));
    {
      anon3:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#0, $s);
        assume $full_stop_ext(#tok$2^14.3, $s);
        // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
        assume $meta_eq(loopState#0, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(curr)) ...
        if ($non_null($phys_ptr_cast(L#curr, ^d_node)))
        {
          anon1:
            // assume ==>(@_vcc_ptr_neq_null(last), ==(dll(last), &&(&&(dll(*((last->next))), ==>(@_vcc_ptr_neq_null(*((last->next))), @_vcc_ptr_eq_pure(*((*((last->next))->prev)), last))), unchecked!(@_vcc_oset_in(last, dll_reach(*((last->next)))))))); 
            assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#last, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#last, ^d_node)) && !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last), ==(dll_reach(last), @_vcc_oset_union(dll_reach(*((last->next))), @_vcc_oset_singleton(last)))); 
            assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#last, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#last, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(last), ==(dll_keys(last), @_vcc_intset_union(dll_keys(*((last->next))), @_vcc_intset_singleton(*((last->key)))))); 
            assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#last, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#last, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last), ==(dll_list_len_next(last), unchecked+(dll_list_len_next(*((last->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#last, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_keys(curr), @_vcc_intset_union(dll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#curr, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#curr, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_list_len_next(curr), unchecked+(dll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#curr, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll(list), &&(&&(dll(*((list->next))), ==>(@_vcc_ptr_neq_null(*((list->next))), @_vcc_ptr_eq_pure(*((*((list->next))->prev)), list))), unchecked!(@_vcc_oset_in(list, dll_reach(*((list->next)))))))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#list, ^d_node)) && !$oset_in($phys_ptr_cast(P#list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_reach(list), @_vcc_oset_union(dll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#list, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_keys(list), @_vcc_intset_union(dll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(P#list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(P#list, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_list_len_next(list), unchecked+(dll_list_len_next(*((list->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(P#list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), 1);
            // struct d_node* last_prev; 
            // last := curr; 
            L#last := $phys_ptr_cast(L#curr, ^d_node);
            // assert dll_lseg(last_prev, last_prev); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#last_prev, ^d_node), $phys_ptr_cast(L#last_prev, ^d_node));
            // assume dll_lseg(last_prev, last_prev); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#last_prev, ^d_node), $phys_ptr_cast(L#last_prev, ^d_node));
            // assert dll_lseg(last, last); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#last, ^d_node), $phys_ptr_cast(L#last, ^d_node));
            // assume dll_lseg(last, last); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#last, ^d_node), $phys_ptr_cast(L#last, ^d_node));
            // assert dll_lseg(curr, curr); 
            assert F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assume dll_lseg(curr, curr); 
            assume F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $phys_ptr_cast(L#curr, ^d_node));
            // assert dll_lseg(list, list); 
            assert F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(P#list, ^d_node));
            // assume dll_lseg(list, list); 
            assume F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(P#list, ^d_node));
            // struct d_node* curr0; 
            // curr0 := curr; 
            SL#curr0 := $phys_ptr_cast(L#curr, ^d_node);
            // struct d_node* stmtexpr0#2; 
            // stmtexpr0#2 := curr0; 
            stmtexpr0#2 := $phys_ptr_cast(SL#curr0, ^d_node);
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_keys(curr), @_vcc_intset_union(dll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#curr, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#curr, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_list_len_next(curr), unchecked+(dll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#curr, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_pure(curr, *((curr->next))), ==(dll_lseg(curr, *((curr->next))), &&(dll_lseg(*((curr->next)), *((curr->next))), unchecked!(@_vcc_oset_in(curr, dll_lseg_reach(*((curr->next)), *((curr->next)))))))); 
            assume $phys_ptr_cast(L#curr, ^d_node) != $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(L#curr, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_pure(curr, *((curr->next))), ==(dll_lseg_reach(curr, *((curr->next))), @_vcc_oset_union(dll_lseg_reach(*((curr->next)), *((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $phys_ptr_cast(L#curr, ^d_node) != $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(L#curr, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_pure(curr, *((curr->next))), ==(dll_lseg_keys(curr, *((curr->next))), @_vcc_intset_union(dll_lseg_keys(*((curr->next)), *((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $phys_ptr_cast(L#curr, ^d_node) != $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) ==> F#dll_lseg_keys($s, $phys_ptr_cast(L#curr, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) == $intset_union(F#dll_lseg_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#curr, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_pure(curr, *((curr->next))), ==(dll_lseg_len_next(curr, *((curr->next))), unchecked+(dll_lseg_len_next(*((curr->next)), *((curr->next))), 1))); 
            assume $phys_ptr_cast(L#curr, ^d_node) != $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) ==> F#dll_lseg_len_next($s, $phys_ptr_cast(L#curr, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) == $unchk_add(^^nat, F#dll_lseg_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), 1);
            // assert @reads_check_normal((curr->next)); 
            assert $thread_local($s, $phys_ptr_cast(L#curr, ^d_node));
            // curr := *((curr->next)); 
            L#curr := $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_keys(curr), @_vcc_intset_union(dll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#curr, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#curr, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_list_len_next(curr), unchecked+(dll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#curr, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_keys(curr), @_vcc_intset_union(dll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#curr, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#curr, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_list_len_next(curr), unchecked+(dll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#curr, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), 1);
            // struct d_node* last1; 
            // last1 := last; 
            SL#last1 := $phys_ptr_cast(L#last, ^d_node);
            // struct d_node* stmtexpr1#3; 
            // stmtexpr1#3 := last1; 
            stmtexpr1#3 := $phys_ptr_cast(SL#last1, ^d_node);
            // assert @reads_check_normal((last->prev)); 
            assert $thread_local($s, $phys_ptr_cast(L#last, ^d_node));
            // last_prev := *((last->prev)); 
            L#last_prev := $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#last, ^d_node), ^d_node);
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll(last_prev), &&(&&(dll(*((last_prev->next))), ==>(@_vcc_ptr_neq_null(*((last_prev->next))), @_vcc_ptr_eq_pure(*((*((last_prev->next))->prev)), last_prev))), unchecked!(@_vcc_oset_in(last_prev, dll_reach(*((last_prev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#last_prev, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#last_prev, ^d_node)) && !$oset_in($phys_ptr_cast(L#last_prev, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll_reach(last_prev), @_vcc_oset_union(dll_reach(*((last_prev->next))), @_vcc_oset_singleton(last_prev)))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#last_prev, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#last_prev, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll_keys(last_prev), @_vcc_intset_union(dll_keys(*((last_prev->next))), @_vcc_intset_singleton(*((last_prev->key)))))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#last_prev, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#last_prev, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll_list_len_next(last_prev), unchecked+(dll_list_len_next(*((last_prev->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#last_prev, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)), 1);
            // _math \state _dryad_S0; 
            // _dryad_S0 := @_vcc_current_state(@state); 
            SL#_dryad_S0 := $current_state($s);
            // _math \state stmtexpr2#4; 
            // stmtexpr2#4 := _dryad_S0; 
            stmtexpr2#4 := SL#_dryad_S0;
            // assert @prim_writes_check((last->next)); 
            assert $writable_prim($s, #wrTime$2^5.3, $dot($phys_ptr_cast(L#last, ^d_node), d_node.next));
            // *(last->next) := last_prev; 
            call $write_int(d_node.next, $phys_ptr_cast(L#last, ^d_node), $ptr_to_int($phys_ptr_cast(L#last_prev, ^d_node)));
            assume $full_stop_ext(#tok$2^25.5, $s);
            // _math \state _dryad_S1; 
            // _dryad_S1 := @_vcc_current_state(@state); 
            SL#_dryad_S1 := $current_state($s);
            // _math \state stmtexpr3#5; 
            // stmtexpr3#5 := _dryad_S1; 
            stmtexpr3#5 := SL#_dryad_S1;
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(*((last->prev)))))), ==(old(_dryad_S0, dll(*((last->prev)))), old(_dryad_S1, dll(*((last->prev)))))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#last, ^d_node), ^d_node))) ==> F#dll(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#last, ^d_node), ^d_node)) == F#dll(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, d_node.prev, $phys_ptr_cast(L#last, ^d_node), ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(*((last->prev)))))), ==(old(_dryad_S0, dll_reach(*((last->prev)))), old(_dryad_S1, dll_reach(*((last->prev)))))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#last, ^d_node), ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#last, ^d_node), ^d_node)) == F#dll_reach(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, d_node.prev, $phys_ptr_cast(L#last, ^d_node), ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(*((last->prev)))))), ==(old(_dryad_S0, dll_keys(*((last->prev)))), old(_dryad_S1, dll_keys(*((last->prev)))))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#last, ^d_node), ^d_node))) ==> F#dll_keys(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#last, ^d_node), ^d_node)) == F#dll_keys(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, d_node.prev, $phys_ptr_cast(L#last, ^d_node), ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(*((last->prev)))))), ==(old(_dryad_S0, dll_list_len_next(*((last->prev)))), old(_dryad_S1, dll_list_len_next(*((last->prev)))))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#last, ^d_node), ^d_node))) ==> F#dll_list_len_next(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#last, ^d_node), ^d_node)) == F#dll_list_len_next(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, d_node.prev, $phys_ptr_cast(L#last, ^d_node), ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(last1)))), ==(old(_dryad_S0, dll(last1)), old(_dryad_S1, dll(last1)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#last1, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(SL#last1, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(SL#last1, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(last1)))), ==(old(_dryad_S0, dll_reach(last1)), old(_dryad_S1, dll_reach(last1)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#last1, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#last1, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(SL#last1, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(last1)))), ==(old(_dryad_S0, dll_keys(last1)), old(_dryad_S1, dll_keys(last1)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#last1, ^d_node))) ==> F#dll_keys(SL#_dryad_S0, $phys_ptr_cast(SL#last1, ^d_node)) == F#dll_keys(SL#_dryad_S1, $phys_ptr_cast(SL#last1, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(last1)))), ==(old(_dryad_S0, dll_list_len_next(last1)), old(_dryad_S1, dll_list_len_next(last1)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#last1, ^d_node))) ==> F#dll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(SL#last1, ^d_node)) == F#dll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(SL#last1, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(curr0)))), ==(old(_dryad_S0, dll(curr0)), old(_dryad_S1, dll(curr0)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(SL#curr0, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(curr0)))), ==(old(_dryad_S0, dll_reach(curr0)), old(_dryad_S1, dll_reach(curr0)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(SL#curr0, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(curr0)))), ==(old(_dryad_S0, dll_keys(curr0)), old(_dryad_S1, dll_keys(curr0)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll_keys(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll_keys(SL#_dryad_S1, $phys_ptr_cast(SL#curr0, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(curr0)))), ==(old(_dryad_S0, dll_list_len_next(curr0)), old(_dryad_S1, dll_list_len_next(curr0)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(SL#curr0, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(last_prev)))), ==(old(_dryad_S0, dll(last_prev)), old(_dryad_S1, dll(last_prev)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#last_prev, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(L#last_prev, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(L#last_prev, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(last_prev)))), ==(old(_dryad_S0, dll_reach(last_prev)), old(_dryad_S1, dll_reach(last_prev)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#last_prev, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#last_prev, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(L#last_prev, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(last_prev)))), ==(old(_dryad_S0, dll_keys(last_prev)), old(_dryad_S1, dll_keys(last_prev)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#last_prev, ^d_node))) ==> F#dll_keys(SL#_dryad_S0, $phys_ptr_cast(L#last_prev, ^d_node)) == F#dll_keys(SL#_dryad_S1, $phys_ptr_cast(L#last_prev, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(last_prev)))), ==(old(_dryad_S0, dll_list_len_next(last_prev)), old(_dryad_S1, dll_list_len_next(last_prev)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#last_prev, ^d_node))) ==> F#dll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#last_prev, ^d_node)) == F#dll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#last_prev, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(curr)))), ==(old(_dryad_S0, dll(curr)), old(_dryad_S1, dll(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(curr)))), ==(old(_dryad_S0, dll_reach(curr)), old(_dryad_S1, dll_reach(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(curr)))), ==(old(_dryad_S0, dll_keys(curr)), old(_dryad_S1, dll_keys(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_keys(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_keys(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(curr)))), ==(old(_dryad_S0, dll_list_len_next(curr)), old(_dryad_S1, dll_list_len_next(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(list)))), ==(old(_dryad_S0, dll(list)), old(_dryad_S1, dll(list)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node))) ==> F#dll(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node)) == F#dll(SL#_dryad_S1, $phys_ptr_cast(P#list, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(list)))), ==(old(_dryad_S0, dll_reach(list)), old(_dryad_S1, dll_reach(list)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node))) ==> F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node)) == F#dll_reach(SL#_dryad_S1, $phys_ptr_cast(P#list, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(list)))), ==(old(_dryad_S0, dll_keys(list)), old(_dryad_S1, dll_keys(list)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node))) ==> F#dll_keys(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node)) == F#dll_keys(SL#_dryad_S1, $phys_ptr_cast(P#list, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S0, dll_reach(list)))), ==(old(_dryad_S0, dll_list_len_next(list)), old(_dryad_S1, dll_list_len_next(list)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node))) ==> F#dll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(P#list, ^d_node)) == F#dll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(P#list, ^d_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(last, last1)), ==(*((last1->key)), old(_dryad_S0, *((last1->key))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(SL#last1, ^d_node)) ==> $rd_inv($s, d_node.key, $phys_ptr_cast(SL#last1, ^d_node)) == $rd_inv(SL#_dryad_S0, d_node.key, $phys_ptr_cast(SL#last1, ^d_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(last, last1)), @_vcc_ptr_eq_pure(*((last1->prev)), old(_dryad_S0, *((last1->prev))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(SL#last1, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(SL#last1, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(SL#last1, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, last1)), @_vcc_ptr_eq_pure(*((last1->next)), old(_dryad_S0, *((last1->next))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(SL#last1, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, curr0)), ==(*((curr0->key)), old(_dryad_S0, *((curr0->key))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_inv($s, d_node.key, $phys_ptr_cast(SL#curr0, ^d_node)) == $rd_inv(SL#_dryad_S0, d_node.key, $phys_ptr_cast(SL#curr0, ^d_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(last, curr0)), @_vcc_ptr_eq_pure(*((curr0->prev)), old(_dryad_S0, *((curr0->prev))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, curr0)), @_vcc_ptr_eq_pure(*((curr0->next)), old(_dryad_S0, *((curr0->next))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, last_prev)), ==(*((last_prev->key)), old(_dryad_S0, *((last_prev->key))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(L#last_prev, ^d_node)) ==> $rd_inv($s, d_node.key, $phys_ptr_cast(L#last_prev, ^d_node)) == $rd_inv(SL#_dryad_S0, d_node.key, $phys_ptr_cast(L#last_prev, ^d_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(last, last_prev)), @_vcc_ptr_eq_pure(*((last_prev->prev)), old(_dryad_S0, *((last_prev->prev))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(L#last_prev, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, last_prev)), @_vcc_ptr_eq_pure(*((last_prev->next)), old(_dryad_S0, *((last_prev->next))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(L#last_prev, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, curr)), ==(*((curr->key)), old(_dryad_S0, *((curr->key))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_inv($s, d_node.key, $phys_ptr_cast(L#curr, ^d_node)) == $rd_inv(SL#_dryad_S0, d_node.key, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(last, curr)), @_vcc_ptr_eq_pure(*((curr->prev)), old(_dryad_S0, *((curr->prev))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, curr)), @_vcc_ptr_eq_pure(*((curr->next)), old(_dryad_S0, *((curr->next))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, list)), ==(*((list->key)), old(_dryad_S0, *((list->key))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(P#list, ^d_node)) ==> $rd_inv($s, d_node.key, $phys_ptr_cast(P#list, ^d_node)) == $rd_inv(SL#_dryad_S0, d_node.key, $phys_ptr_cast(P#list, ^d_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(last, list)), @_vcc_ptr_eq_pure(*((list->prev)), old(_dryad_S0, *((list->prev))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(P#list, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(P#list, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.prev, $phys_ptr_cast(P#list, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, list)), @_vcc_ptr_eq_pure(*((list->next)), old(_dryad_S0, *((list->next))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(P#list, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S0, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node);
            // assume ==>(@_vcc_ptr_neq_null(last1), ==(dll(last1), &&(&&(dll(*((last1->next))), ==>(@_vcc_ptr_neq_null(*((last1->next))), @_vcc_ptr_eq_pure(*((*((last1->next))->prev)), last1))), unchecked!(@_vcc_oset_in(last1, dll_reach(*((last1->next)))))))); 
            assume $non_null($phys_ptr_cast(SL#last1, ^d_node)) ==> F#dll($s, $phys_ptr_cast(SL#last1, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SL#last1, ^d_node)) && !$oset_in($phys_ptr_cast(SL#last1, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last1), ==(dll_reach(last1), @_vcc_oset_union(dll_reach(*((last1->next))), @_vcc_oset_singleton(last1)))); 
            assume $non_null($phys_ptr_cast(SL#last1, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(SL#last1, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(SL#last1, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(last1), ==(dll_keys(last1), @_vcc_intset_union(dll_keys(*((last1->next))), @_vcc_intset_singleton(*((last1->key)))))); 
            assume $non_null($phys_ptr_cast(SL#last1, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(SL#last1, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(SL#last1, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last1), ==(dll_list_len_next(last1), unchecked+(dll_list_len_next(*((last1->next))), 1))); 
            assume $non_null($phys_ptr_cast(SL#last1, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(SL#last1, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll(curr0), &&(&&(dll(*((curr0->next))), ==>(@_vcc_ptr_neq_null(*((curr0->next))), @_vcc_ptr_eq_pure(*((*((curr0->next))->prev)), curr0))), unchecked!(@_vcc_oset_in(curr0, dll_reach(*((curr0->next)))))))); 
            assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll($s, $phys_ptr_cast(SL#curr0, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) && !$oset_in($phys_ptr_cast(SL#curr0, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll_reach(curr0), @_vcc_oset_union(dll_reach(*((curr0->next))), @_vcc_oset_singleton(curr0)))); 
            assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(SL#curr0, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(SL#curr0, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll_keys(curr0), @_vcc_intset_union(dll_keys(*((curr0->next))), @_vcc_intset_singleton(*((curr0->key)))))); 
            assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(SL#curr0, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(SL#curr0, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll_list_len_next(curr0), unchecked+(dll_list_len_next(*((curr0->next))), 1))); 
            assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(SL#curr0, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll(last_prev), &&(&&(dll(*((last_prev->next))), ==>(@_vcc_ptr_neq_null(*((last_prev->next))), @_vcc_ptr_eq_pure(*((*((last_prev->next))->prev)), last_prev))), unchecked!(@_vcc_oset_in(last_prev, dll_reach(*((last_prev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#last_prev, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#last_prev, ^d_node)) && !$oset_in($phys_ptr_cast(L#last_prev, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll_reach(last_prev), @_vcc_oset_union(dll_reach(*((last_prev->next))), @_vcc_oset_singleton(last_prev)))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#last_prev, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#last_prev, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll_keys(last_prev), @_vcc_intset_union(dll_keys(*((last_prev->next))), @_vcc_intset_singleton(*((last_prev->key)))))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#last_prev, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#last_prev, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll_list_len_next(last_prev), unchecked+(dll_list_len_next(*((last_prev->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#last_prev, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_keys(curr), @_vcc_intset_union(dll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#curr, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#curr, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_list_len_next(curr), unchecked+(dll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#curr, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll(list), &&(&&(dll(*((list->next))), ==>(@_vcc_ptr_neq_null(*((list->next))), @_vcc_ptr_eq_pure(*((*((list->next))->prev)), list))), unchecked!(@_vcc_oset_in(list, dll_reach(*((list->next)))))))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#list, ^d_node)) && !$oset_in($phys_ptr_cast(P#list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_reach(list), @_vcc_oset_union(dll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#list, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_keys(list), @_vcc_intset_union(dll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(P#list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(P#list, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_list_len_next(list), unchecked+(dll_list_len_next(*((list->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(P#list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(last), ==(dll(last), &&(&&(dll(*((last->next))), ==>(@_vcc_ptr_neq_null(*((last->next))), @_vcc_ptr_eq_pure(*((*((last->next))->prev)), last))), unchecked!(@_vcc_oset_in(last, dll_reach(*((last->next)))))))); 
            assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#last, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#last, ^d_node)) && !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last), ==(dll_reach(last), @_vcc_oset_union(dll_reach(*((last->next))), @_vcc_oset_singleton(last)))); 
            assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#last, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#last, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(last), ==(dll_keys(last), @_vcc_intset_union(dll_keys(*((last->next))), @_vcc_intset_singleton(*((last->key)))))); 
            assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#last, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#last, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last), ==(dll_list_len_next(last), unchecked+(dll_list_len_next(*((last->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#last, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll(last_prev), &&(&&(dll(*((last_prev->next))), ==>(@_vcc_ptr_neq_null(*((last_prev->next))), @_vcc_ptr_eq_pure(*((*((last_prev->next))->prev)), last_prev))), unchecked!(@_vcc_oset_in(last_prev, dll_reach(*((last_prev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#last_prev, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#last_prev, ^d_node)) && !$oset_in($phys_ptr_cast(L#last_prev, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll_reach(last_prev), @_vcc_oset_union(dll_reach(*((last_prev->next))), @_vcc_oset_singleton(last_prev)))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#last_prev, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#last_prev, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll_keys(last_prev), @_vcc_intset_union(dll_keys(*((last_prev->next))), @_vcc_intset_singleton(*((last_prev->key)))))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#last_prev, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#last_prev, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll_list_len_next(last_prev), unchecked+(dll_list_len_next(*((last_prev->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#last_prev, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)), 1);
            // _math \state _dryad_S2; 
            // _dryad_S2 := @_vcc_current_state(@state); 
            SL#_dryad_S2 := $current_state($s);
            // _math \state stmtexpr4#6; 
            // stmtexpr4#6 := _dryad_S2; 
            stmtexpr4#6 := SL#_dryad_S2;
            // assert @prim_writes_check((last->prev)); 
            assert $writable_prim($s, #wrTime$2^5.3, $dot($phys_ptr_cast(L#last, ^d_node), d_node.prev));
            // *(last->prev) := curr; 
            call $write_int(d_node.prev, $phys_ptr_cast(L#last, ^d_node), $ptr_to_int($phys_ptr_cast(L#curr, ^d_node)));
            assume $full_stop_ext(#tok$2^26.5, $s);
            // _math \state _dryad_S3; 
            // _dryad_S3 := @_vcc_current_state(@state); 
            SL#_dryad_S3 := $current_state($s);
            // _math \state stmtexpr5#7; 
            // stmtexpr5#7 := _dryad_S3; 
            stmtexpr5#7 := SL#_dryad_S3;
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(*((last->next)))))), ==(old(_dryad_S2, dll(*((last->next)))), old(_dryad_S3, dll(*((last->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node))) ==> F#dll(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)) == F#dll(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(*((last->next)))))), ==(old(_dryad_S2, dll_reach(*((last->next)))), old(_dryad_S3, dll_reach(*((last->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)) == F#dll_reach(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(*((last->next)))))), ==(old(_dryad_S2, dll_keys(*((last->next)))), old(_dryad_S3, dll_keys(*((last->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node))) ==> F#dll_keys(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)) == F#dll_keys(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(*((last->next)))))), ==(old(_dryad_S2, dll_list_len_next(*((last->next)))), old(_dryad_S3, dll_list_len_next(*((last->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node))) ==> F#dll_list_len_next(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)) == F#dll_list_len_next(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node));
            // assume ==(old(_dryad_S2, dll(last)), old(_dryad_S3, dll(last))); 
            assume F#dll(SL#_dryad_S2, $phys_ptr_cast(L#last, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(L#last, ^d_node));
            // assume ==(old(_dryad_S2, dll_reach(last)), old(_dryad_S3, dll_reach(last))); 
            assume F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#last, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(L#last, ^d_node));
            // assume ==(old(_dryad_S2, dll_keys(last)), old(_dryad_S3, dll_keys(last))); 
            assume F#dll_keys(SL#_dryad_S2, $phys_ptr_cast(L#last, ^d_node)) == F#dll_keys(SL#_dryad_S3, $phys_ptr_cast(L#last, ^d_node));
            // assume ==(old(_dryad_S2, dll_list_len_next(last)), old(_dryad_S3, dll_list_len_next(last))); 
            assume F#dll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(L#last, ^d_node)) == F#dll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(L#last, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(last1)))), ==(old(_dryad_S2, dll(last1)), old(_dryad_S3, dll(last1)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#last1, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(SL#last1, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(SL#last1, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(last1)))), ==(old(_dryad_S2, dll_reach(last1)), old(_dryad_S3, dll_reach(last1)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#last1, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#last1, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(SL#last1, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(last1)))), ==(old(_dryad_S2, dll_keys(last1)), old(_dryad_S3, dll_keys(last1)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#last1, ^d_node))) ==> F#dll_keys(SL#_dryad_S2, $phys_ptr_cast(SL#last1, ^d_node)) == F#dll_keys(SL#_dryad_S3, $phys_ptr_cast(SL#last1, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(last1)))), ==(old(_dryad_S2, dll_list_len_next(last1)), old(_dryad_S3, dll_list_len_next(last1)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#last1, ^d_node))) ==> F#dll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(SL#last1, ^d_node)) == F#dll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(SL#last1, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(curr0)))), ==(old(_dryad_S2, dll(curr0)), old(_dryad_S3, dll(curr0)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(SL#curr0, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(curr0)))), ==(old(_dryad_S2, dll_reach(curr0)), old(_dryad_S3, dll_reach(curr0)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(SL#curr0, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(curr0)))), ==(old(_dryad_S2, dll_keys(curr0)), old(_dryad_S3, dll_keys(curr0)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll_keys(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll_keys(SL#_dryad_S3, $phys_ptr_cast(SL#curr0, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(curr0)))), ==(old(_dryad_S2, dll_list_len_next(curr0)), old(_dryad_S3, dll_list_len_next(curr0)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node))) ==> F#dll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(SL#curr0, ^d_node)) == F#dll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(SL#curr0, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(last_prev)))), ==(old(_dryad_S2, dll(last_prev)), old(_dryad_S3, dll(last_prev)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#last_prev, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(L#last_prev, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(L#last_prev, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(last_prev)))), ==(old(_dryad_S2, dll_reach(last_prev)), old(_dryad_S3, dll_reach(last_prev)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#last_prev, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#last_prev, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(L#last_prev, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(last_prev)))), ==(old(_dryad_S2, dll_keys(last_prev)), old(_dryad_S3, dll_keys(last_prev)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#last_prev, ^d_node))) ==> F#dll_keys(SL#_dryad_S2, $phys_ptr_cast(L#last_prev, ^d_node)) == F#dll_keys(SL#_dryad_S3, $phys_ptr_cast(L#last_prev, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(last_prev)))), ==(old(_dryad_S2, dll_list_len_next(last_prev)), old(_dryad_S3, dll_list_len_next(last_prev)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#last_prev, ^d_node))) ==> F#dll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(L#last_prev, ^d_node)) == F#dll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(L#last_prev, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(curr)))), ==(old(_dryad_S2, dll(curr)), old(_dryad_S3, dll(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(curr)))), ==(old(_dryad_S2, dll_reach(curr)), old(_dryad_S3, dll_reach(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(curr)))), ==(old(_dryad_S2, dll_keys(curr)), old(_dryad_S3, dll_keys(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_keys(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_keys(SL#_dryad_S3, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(curr)))), ==(old(_dryad_S2, dll_list_len_next(curr)), old(_dryad_S3, dll_list_len_next(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node))) ==> F#dll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(L#curr, ^d_node)) == F#dll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(list)))), ==(old(_dryad_S2, dll(list)), old(_dryad_S3, dll(list)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#list, ^d_node))) ==> F#dll(SL#_dryad_S2, $phys_ptr_cast(P#list, ^d_node)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(P#list, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(list)))), ==(old(_dryad_S2, dll_reach(list)), old(_dryad_S3, dll_reach(list)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#list, ^d_node))) ==> F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#list, ^d_node)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(P#list, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(list)))), ==(old(_dryad_S2, dll_keys(list)), old(_dryad_S3, dll_keys(list)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#list, ^d_node))) ==> F#dll_keys(SL#_dryad_S2, $phys_ptr_cast(P#list, ^d_node)) == F#dll_keys(SL#_dryad_S3, $phys_ptr_cast(P#list, ^d_node));
            // assume ==>(unchecked!(@_vcc_oset_in(last, old(_dryad_S2, dll_reach(list)))), ==(old(_dryad_S2, dll_list_len_next(list)), old(_dryad_S3, dll_list_len_next(list)))); 
            assume !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(P#list, ^d_node))) ==> F#dll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(P#list, ^d_node)) == F#dll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(P#list, ^d_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(last, last1)), ==(*((last1->key)), old(_dryad_S2, *((last1->key))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(SL#last1, ^d_node)) ==> $rd_inv($s, d_node.key, $phys_ptr_cast(SL#last1, ^d_node)) == $rd_inv(SL#_dryad_S2, d_node.key, $phys_ptr_cast(SL#last1, ^d_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(last, last1)), @_vcc_ptr_eq_pure(*((last1->prev)), old(_dryad_S2, *((last1->prev))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(SL#last1, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(SL#last1, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(SL#last1, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, last1)), @_vcc_ptr_eq_pure(*((last1->next)), old(_dryad_S2, *((last1->next))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(SL#last1, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, curr0)), ==(*((curr0->key)), old(_dryad_S2, *((curr0->key))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_inv($s, d_node.key, $phys_ptr_cast(SL#curr0, ^d_node)) == $rd_inv(SL#_dryad_S2, d_node.key, $phys_ptr_cast(SL#curr0, ^d_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(last, curr0)), @_vcc_ptr_eq_pure(*((curr0->prev)), old(_dryad_S2, *((curr0->prev))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, curr0)), @_vcc_ptr_eq_pure(*((curr0->next)), old(_dryad_S2, *((curr0->next))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, last_prev)), ==(*((last_prev->key)), old(_dryad_S2, *((last_prev->key))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(L#last_prev, ^d_node)) ==> $rd_inv($s, d_node.key, $phys_ptr_cast(L#last_prev, ^d_node)) == $rd_inv(SL#_dryad_S2, d_node.key, $phys_ptr_cast(L#last_prev, ^d_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(last, last_prev)), @_vcc_ptr_eq_pure(*((last_prev->prev)), old(_dryad_S2, *((last_prev->prev))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(L#last_prev, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, last_prev)), @_vcc_ptr_eq_pure(*((last_prev->next)), old(_dryad_S2, *((last_prev->next))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(L#last_prev, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, curr)), ==(*((curr->key)), old(_dryad_S2, *((curr->key))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_inv($s, d_node.key, $phys_ptr_cast(L#curr, ^d_node)) == $rd_inv(SL#_dryad_S2, d_node.key, $phys_ptr_cast(L#curr, ^d_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(last, curr)), @_vcc_ptr_eq_pure(*((curr->prev)), old(_dryad_S2, *((curr->prev))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, curr)), @_vcc_ptr_eq_pure(*((curr->next)), old(_dryad_S2, *((curr->next))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, list)), ==(*((list->key)), old(_dryad_S2, *((list->key))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(P#list, ^d_node)) ==> $rd_inv($s, d_node.key, $phys_ptr_cast(P#list, ^d_node)) == $rd_inv(SL#_dryad_S2, d_node.key, $phys_ptr_cast(P#list, ^d_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(last, list)), @_vcc_ptr_eq_pure(*((list->prev)), old(_dryad_S2, *((list->prev))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(P#list, ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $phys_ptr_cast(P#list, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.prev, $phys_ptr_cast(P#list, ^d_node), ^d_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(last, list)), @_vcc_ptr_eq_pure(*((list->next)), old(_dryad_S2, *((list->next))))); 
            assume !($phys_ptr_cast(L#last, ^d_node) == $phys_ptr_cast(P#list, ^d_node)) ==> $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node) == $rd_phys_ptr(SL#_dryad_S2, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node);
            // assume ==>(@_vcc_ptr_neq_null(last1), ==(dll(last1), &&(&&(dll(*((last1->next))), ==>(@_vcc_ptr_neq_null(*((last1->next))), @_vcc_ptr_eq_pure(*((*((last1->next))->prev)), last1))), unchecked!(@_vcc_oset_in(last1, dll_reach(*((last1->next)))))))); 
            assume $non_null($phys_ptr_cast(SL#last1, ^d_node)) ==> F#dll($s, $phys_ptr_cast(SL#last1, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SL#last1, ^d_node)) && !$oset_in($phys_ptr_cast(SL#last1, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last1), ==(dll_reach(last1), @_vcc_oset_union(dll_reach(*((last1->next))), @_vcc_oset_singleton(last1)))); 
            assume $non_null($phys_ptr_cast(SL#last1, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(SL#last1, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(SL#last1, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(last1), ==(dll_keys(last1), @_vcc_intset_union(dll_keys(*((last1->next))), @_vcc_intset_singleton(*((last1->key)))))); 
            assume $non_null($phys_ptr_cast(SL#last1, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(SL#last1, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(SL#last1, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last1), ==(dll_list_len_next(last1), unchecked+(dll_list_len_next(*((last1->next))), 1))); 
            assume $non_null($phys_ptr_cast(SL#last1, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(SL#last1, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#last1, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll(curr0), &&(&&(dll(*((curr0->next))), ==>(@_vcc_ptr_neq_null(*((curr0->next))), @_vcc_ptr_eq_pure(*((*((curr0->next))->prev)), curr0))), unchecked!(@_vcc_oset_in(curr0, dll_reach(*((curr0->next)))))))); 
            assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll($s, $phys_ptr_cast(SL#curr0, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SL#curr0, ^d_node)) && !$oset_in($phys_ptr_cast(SL#curr0, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll_reach(curr0), @_vcc_oset_union(dll_reach(*((curr0->next))), @_vcc_oset_singleton(curr0)))); 
            assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(SL#curr0, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(SL#curr0, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll_keys(curr0), @_vcc_intset_union(dll_keys(*((curr0->next))), @_vcc_intset_singleton(*((curr0->key)))))); 
            assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(SL#curr0, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(SL#curr0, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr0), ==(dll_list_len_next(curr0), unchecked+(dll_list_len_next(*((curr0->next))), 1))); 
            assume $non_null($phys_ptr_cast(SL#curr0, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(SL#curr0, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(SL#curr0, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll(last_prev), &&(&&(dll(*((last_prev->next))), ==>(@_vcc_ptr_neq_null(*((last_prev->next))), @_vcc_ptr_eq_pure(*((*((last_prev->next))->prev)), last_prev))), unchecked!(@_vcc_oset_in(last_prev, dll_reach(*((last_prev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#last_prev, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#last_prev, ^d_node)) && !$oset_in($phys_ptr_cast(L#last_prev, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll_reach(last_prev), @_vcc_oset_union(dll_reach(*((last_prev->next))), @_vcc_oset_singleton(last_prev)))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#last_prev, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#last_prev, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll_keys(last_prev), @_vcc_intset_union(dll_keys(*((last_prev->next))), @_vcc_intset_singleton(*((last_prev->key)))))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#last_prev, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#last_prev, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(last_prev), ==(dll_list_len_next(last_prev), unchecked+(dll_list_len_next(*((last_prev->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#last_prev, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#last_prev, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last_prev, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_keys(curr), @_vcc_intset_union(dll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#curr, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#curr, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_list_len_next(curr), unchecked+(dll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#curr, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll(list), &&(&&(dll(*((list->next))), ==>(@_vcc_ptr_neq_null(*((list->next))), @_vcc_ptr_eq_pure(*((*((list->next))->prev)), list))), unchecked!(@_vcc_oset_in(list, dll_reach(*((list->next)))))))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#list, ^d_node)) && !$oset_in($phys_ptr_cast(P#list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_reach(list), @_vcc_oset_union(dll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#list, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_keys(list), @_vcc_intset_union(dll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(P#list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(P#list, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_list_len_next(list), unchecked+(dll_list_len_next(*((list->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(P#list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_keys(curr), @_vcc_intset_union(dll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#curr, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#curr, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_list_len_next(curr), unchecked+(dll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#curr, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(curr), &&(@_vcc_mutable(@state, curr), @writes_check(curr))); 
            assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^d_node)) && $top_writable($s, #wrTime$2^5.3, $phys_ptr_cast(L#curr, ^d_node));
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
    }

  anon5:
    assume $full_stop_ext(#tok$2^14.3, $s);

  #break_1:
    // assume ==>(@_vcc_ptr_neq_null(last), ==(dll(last), &&(&&(dll(*((last->next))), ==>(@_vcc_ptr_neq_null(*((last->next))), @_vcc_ptr_eq_pure(*((*((last->next))->prev)), last))), unchecked!(@_vcc_oset_in(last, dll_reach(*((last->next)))))))); 
    assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#last, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#last, ^d_node)) && !$oset_in($phys_ptr_cast(L#last, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(last), ==(dll_reach(last), @_vcc_oset_union(dll_reach(*((last->next))), @_vcc_oset_singleton(last)))); 
    assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#last, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#last, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(last), ==(dll_keys(last), @_vcc_intset_union(dll_keys(*((last->next))), @_vcc_intset_singleton(*((last->key)))))); 
    assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#last, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#last, ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(last), ==(dll_list_len_next(last), unchecked+(dll_list_len_next(*((last->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#last, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#last, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#last, ^d_node), ^d_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(L#curr, ^d_node)) && !$oset_in($phys_ptr_cast(L#curr, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(L#curr, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_keys(curr), @_vcc_intset_union(dll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(L#curr, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(L#curr, ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_list_len_next(curr), unchecked+(dll_list_len_next(*((curr->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#curr, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(L#curr, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(L#curr, ^d_node), ^d_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll(list), &&(&&(dll(*((list->next))), ==>(@_vcc_ptr_neq_null(*((list->next))), @_vcc_ptr_eq_pure(*((*((list->next))->prev)), list))), unchecked!(@_vcc_oset_in(list, dll_reach(*((list->next)))))))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(P#list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(P#list, ^d_node)) && !$oset_in($phys_ptr_cast(P#list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_reach(list), @_vcc_oset_union(dll_reach(*((list->next))), @_vcc_oset_singleton(list)))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(P#list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(P#list, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_keys(list), @_vcc_intset_union(dll_keys(*((list->next))), @_vcc_intset_singleton(*((list->key)))))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(P#list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(P#list, ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(list), ==(dll_list_len_next(list), unchecked+(dll_list_len_next(*((list->next))), 1))); 
    assume $non_null($phys_ptr_cast(P#list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(P#list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node)), 1);
    // return last; 
    $result := $phys_ptr_cast(L#last, ^d_node);
    assume true;
    assert $position_marker();
    goto #exit;

  anon6:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$2^26.5: $token;

const unique #tok$2^25.5: $token;

const unique #tok$2^14.3: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^5.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cglibc?5Cglist?5Cg_list_reverse.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cglibc?5Cglist?5Cg_list_reverse.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cglibc?5Cglist?5Cdryad_dll_lseg_defs.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cglibc?5Cglist?5Cdryad_dll_lseg_defs.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^d_node);
