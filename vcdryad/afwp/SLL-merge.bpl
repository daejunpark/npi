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

const unique ^$#SLL_merge.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#SLL_merge.c..36263#3);

type $#SLL_merge.c..36263#3;

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

function F##int_max(SP#x: int, SP#y: int) : int;

const unique cf##int_max: $pure_function;

axiom (forall SP#x: int, SP#y: int :: { F##int_max(SP#x, SP#y) } $in_range_i4(F##int_max(SP#x, SP#y)));

axiom $function_arg_type(cf##int_max, 0, ^^i4);

axiom $function_arg_type(cf##int_max, 1, ^^i4);

axiom $function_arg_type(cf##int_max, 2, ^^i4);

procedure #int_max(SP#x: int, SP#y: int) returns ($result: int);
  free ensures $in_range_i4($result);
  free ensures $result == F##int_max(SP#x, SP#y);
  free ensures $call_transition(old($s), $s);



function F##int_min(SP#x: int, SP#y: int) : int;

const unique cf##int_min: $pure_function;

axiom (forall SP#x: int, SP#y: int :: { F##int_min(SP#x, SP#y) } $in_range_i4(F##int_min(SP#x, SP#y)));

axiom $function_arg_type(cf##int_min, 0, ^^i4);

axiom $function_arg_type(cf##int_min, 1, ^^i4);

axiom $function_arg_type(cf##int_min, 2, ^^i4);

procedure #int_min(SP#x: int, SP#y: int) returns ($result: int);
  free ensures $in_range_i4($result);
  free ensures $result == F##int_min(SP#x, SP#y);
  free ensures $call_transition(old($s), $s);



function F#sll(#s: $state, SP#hd: $ptr) : bool;

const unique cf#sll: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#sll(#s, SP#hd) } 1 < $decreases_level ==> $is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> F#sll(#s, SP#hd));

axiom $function_arg_type(cf#sll, 0, ^^bool);

axiom $function_arg_type(cf#sll, 1, $ptr_to(^s_node));

procedure sll(SP#hd: $ptr) returns ($result: bool);
  ensures $is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $result;
  free ensures $result == F#sll($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#srtl(#s: $state, SP#hd: $ptr) : bool;

const unique cf#srtl: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#srtl(#s, SP#hd) } 1 < $decreases_level ==> ($is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> F#srtl(#s, SP#hd)) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#hd, ^s_node), ^s_node)) ==> F#srtl(#s, SP#hd)));

axiom $function_arg_type(cf#srtl, 0, ^^bool);

axiom $function_arg_type(cf#srtl, 1, $ptr_to(^s_node));

procedure srtl(SP#hd: $ptr) returns ($result: bool);
  ensures $is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $result;
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#hd, ^s_node), ^s_node)) ==> $result;
  free ensures $result == F#srtl($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#rsrtl(#s: $state, SP#hd: $ptr) : bool;

const unique cf#rsrtl: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#rsrtl(#s, SP#hd) } 1 < $decreases_level ==> ($is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> F#rsrtl(#s, SP#hd)) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#hd, ^s_node), ^s_node)) ==> F#rsrtl(#s, SP#hd)));

axiom $function_arg_type(cf#rsrtl, 0, ^^bool);

axiom $function_arg_type(cf#rsrtl, 1, $ptr_to(^s_node));

procedure rsrtl(SP#hd: $ptr) returns ($result: bool);
  ensures $is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $result;
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#hd, ^s_node), ^s_node)) ==> $result;
  free ensures $result == F#rsrtl($s, SP#hd);
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



function F#srtl_reach(#s: $state, SP#hd: $ptr) : $oset;

const unique cf#srtl_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#srtl_reach(#s, SP#hd) } 1 < $decreases_level ==> ($non_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $oset_in($phys_ptr_cast(SP#hd, ^s_node), F#srtl_reach(#s, SP#hd))) && ($is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> F#srtl_reach(#s, SP#hd) == $oset_empty()));

axiom $function_arg_type(cf#srtl_reach, 0, ^$#oset);

axiom $function_arg_type(cf#srtl_reach, 1, $ptr_to(^s_node));

procedure srtl_reach(SP#hd: $ptr) returns ($result: $oset);
  ensures ($non_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $oset_in($phys_ptr_cast(SP#hd, ^s_node), $result)) && ($is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $result == $oset_empty());
  free ensures $result == F#srtl_reach($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#rsrtl_reach(#s: $state, SP#hd: $ptr) : $oset;

const unique cf#rsrtl_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#rsrtl_reach(#s, SP#hd) } 1 < $decreases_level ==> ($non_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $oset_in($phys_ptr_cast(SP#hd, ^s_node), F#rsrtl_reach(#s, SP#hd))) && ($is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> F#rsrtl_reach(#s, SP#hd) == $oset_empty()));

axiom $function_arg_type(cf#rsrtl_reach, 0, ^$#oset);

axiom $function_arg_type(cf#rsrtl_reach, 1, $ptr_to(^s_node));

procedure rsrtl_reach(SP#hd: $ptr) returns ($result: $oset);
  ensures ($non_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $oset_in($phys_ptr_cast(SP#hd, ^s_node), $result)) && ($is_null($phys_ptr_cast(SP#hd, ^s_node)) ==> $result == $oset_empty());
  free ensures $result == F#rsrtl_reach($s, SP#hd);
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



function F#sll_min_key(#s: $state, SP#hd: $ptr) : int;

const unique cf#sll_min_key: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#sll_min_key(#s, SP#hd) } 1 < $decreases_level ==> $in_range_i4(F#sll_min_key(#s, SP#hd)) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#hd, ^s_node), ^s_node)) ==> F#sll_min_key(#s, SP#hd) == $rd_inv(#s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node))));

axiom $function_arg_type(cf#sll_min_key, 0, ^^i4);

axiom $function_arg_type(cf#sll_min_key, 1, $ptr_to(^s_node));

procedure sll_min_key(SP#hd: $ptr) returns ($result: int);
  free ensures $in_range_i4($result);
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#hd, ^s_node), ^s_node)) ==> $result == $rd_inv($s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node));
  free ensures $result == F#sll_min_key($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#sll_max_key(#s: $state, SP#hd: $ptr) : int;

const unique cf#sll_max_key: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#sll_max_key(#s, SP#hd) } 1 < $decreases_level ==> $in_range_i4(F#sll_max_key(#s, SP#hd)) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#hd, ^s_node), ^s_node)) ==> F#sll_max_key(#s, SP#hd) == $rd_inv(#s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node))));

axiom $function_arg_type(cf#sll_max_key, 0, ^^i4);

axiom $function_arg_type(cf#sll_max_key, 1, $ptr_to(^s_node));

procedure sll_max_key(SP#hd: $ptr) returns ($result: int);
  free ensures $in_range_i4($result);
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#hd, ^s_node), ^s_node)) ==> $result == $rd_inv($s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node));
  free ensures $result == F#sll_max_key($s, SP#hd);
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



function F#srtl_lseg(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : bool;

const unique cf#srtl_lseg: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#srtl_lseg(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> F#srtl_lseg(#s, SP#hd, SP#tl) == F#srtl(#s, $phys_ptr_cast(SP#hd, ^s_node))) && ($phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> F#srtl_lseg(#s, SP#hd, SP#tl)) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) && $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#hd, ^s_node), ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> F#srtl_lseg(#s, SP#hd, SP#tl)) && (F#srtl_lseg(#s, SP#hd, SP#tl) ==> $oset_disjoint(F#srtl_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), $oset_singleton($phys_ptr_cast(SP#tl, ^s_node)))) && (F#srtl_lseg(#s, SP#hd, SP#tl) && F#srtl(#s, $phys_ptr_cast(SP#tl, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) && $non_null($phys_ptr_cast(SP#tl, ^s_node)) && F#sll_lseg_max_key(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)) <= F#sll_min_key(#s, $phys_ptr_cast(SP#tl, ^s_node)) ==> F#srtl(#s, $phys_ptr_cast(SP#hd, ^s_node)) && F#srtl_reach(#s, $phys_ptr_cast(SP#hd, ^s_node)) == $oset_union(F#srtl_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), F#srtl_reach(#s, $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_keys(#s, $phys_ptr_cast(SP#hd, ^s_node)) == $intset_union(F#sll_lseg_keys(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), F#sll_keys(#s, $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_list_len_next(#s, $phys_ptr_cast(SP#hd, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), F#sll_list_len_next(#s, $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_min_key(#s, $phys_ptr_cast(SP#hd, ^s_node)) == F#sll_lseg_min_key(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)) && F#sll_max_key(#s, $phys_ptr_cast(SP#hd, ^s_node)) == F#sll_max_key(#s, $phys_ptr_cast(SP#tl, ^s_node))) && (F#srtl_lseg(#s, SP#hd, SP#tl) && $non_null($phys_ptr_cast(SP#tl, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) && $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) && !$oset_in($rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node), F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_lseg_max_key(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)) <= $rd_inv(#s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node)) ==> F#srtl_lseg(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) && F#srtl_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $oset_union(F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), $oset_singleton($phys_ptr_cast(SP#tl, ^s_node))) && F#sll_lseg_keys(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $intset_union(F#sll_lseg_keys(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), $intset_singleton($rd_inv(#s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node)))) && F#sll_lseg_len_next(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), 1) && F#sll_lseg_min_key(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == F#sll_lseg_min_key(#s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)) && F#sll_lseg_max_key(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $rd_inv(#s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node))) && (F#srtl_lseg(#s, SP#hd, SP#tl) && $non_null($phys_ptr_cast(SP#tl, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) && $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> F#srtl_lseg(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) && F#srtl_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $oset_singleton($phys_ptr_cast(SP#tl, ^s_node)) && F#sll_lseg_keys(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $intset_singleton($rd_inv(#s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_lseg_len_next(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == 1 && F#sll_lseg_min_key(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $rd_inv(#s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node)) && F#sll_lseg_max_key(#s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $rd_inv(#s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node))));

axiom $function_arg_type(cf#srtl_lseg, 0, ^^bool);

axiom $function_arg_type(cf#srtl_lseg, 1, $ptr_to(^s_node));

axiom $function_arg_type(cf#srtl_lseg, 2, $ptr_to(^s_node));

procedure srtl_lseg(SP#hd: $ptr, SP#tl: $ptr) returns ($result: bool);
  ensures $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> $result == F#srtl($s, $phys_ptr_cast(SP#hd, ^s_node));
  ensures $phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> $result;
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#hd, ^s_node), ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> $result;
  ensures $result ==> $oset_disjoint(F#srtl_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), $oset_singleton($phys_ptr_cast(SP#tl, ^s_node)));
  ensures $result && F#srtl($s, $phys_ptr_cast(SP#tl, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) && $non_null($phys_ptr_cast(SP#tl, ^s_node)) && F#sll_lseg_max_key($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)) <= F#sll_min_key($s, $phys_ptr_cast(SP#tl, ^s_node)) ==> F#srtl($s, $phys_ptr_cast(SP#hd, ^s_node)) && F#srtl_reach($s, $phys_ptr_cast(SP#hd, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), F#srtl_reach($s, $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_keys($s, $phys_ptr_cast(SP#hd, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), F#sll_keys($s, $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_list_len_next($s, $phys_ptr_cast(SP#hd, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), F#sll_list_len_next($s, $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_min_key($s, $phys_ptr_cast(SP#hd, ^s_node)) == F#sll_lseg_min_key($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)) && F#sll_max_key($s, $phys_ptr_cast(SP#hd, ^s_node)) == F#sll_max_key($s, $phys_ptr_cast(SP#tl, ^s_node));
  ensures $result && $non_null($phys_ptr_cast(SP#tl, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) && !$oset_in($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node), F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_lseg_max_key($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)) <= $rd_inv($s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node)) ==> F#srtl_lseg($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) && F#srtl_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $oset_union(F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), $oset_singleton($phys_ptr_cast(SP#tl, ^s_node))) && F#sll_lseg_keys($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $intset_union(F#sll_lseg_keys($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node)))) && F#sll_lseg_len_next($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)), 1) && F#sll_lseg_min_key($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == F#sll_lseg_min_key($s, $phys_ptr_cast(SP#hd, ^s_node), $phys_ptr_cast(SP#tl, ^s_node)) && F#sll_lseg_max_key($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $rd_inv($s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node));
  ensures $result && $non_null($phys_ptr_cast(SP#tl, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) && F#srtl_lseg_reach($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $oset_singleton($phys_ptr_cast(SP#tl, ^s_node)) && F#sll_lseg_keys($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node))) && F#sll_lseg_len_next($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == 1 && F#sll_lseg_min_key($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $rd_inv($s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node)) && F#sll_lseg_max_key($s, $phys_ptr_cast(SP#hd, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#tl, ^s_node), ^s_node)) == $rd_inv($s, s_node.key, $phys_ptr_cast(SP#tl, ^s_node));
  free ensures $result == F#srtl_lseg($s, SP#hd, SP#tl);
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



function F#srtl_lseg_reach(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : $oset;

const unique cf#srtl_lseg_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#srtl_lseg_reach(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> F#srtl_lseg_reach(#s, SP#hd, SP#tl) == F#srtl_reach(#s, $phys_ptr_cast(SP#hd, ^s_node))) && ($phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> F#srtl_lseg_reach(#s, SP#hd, SP#tl) == $oset_empty()) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $oset_in($phys_ptr_cast(SP#hd, ^s_node), F#srtl_lseg_reach(#s, SP#hd, SP#tl))));

axiom $function_arg_type(cf#srtl_lseg_reach, 0, ^$#oset);

axiom $function_arg_type(cf#srtl_lseg_reach, 1, $ptr_to(^s_node));

axiom $function_arg_type(cf#srtl_lseg_reach, 2, $ptr_to(^s_node));

procedure srtl_lseg_reach(SP#hd: $ptr, SP#tl: $ptr) returns ($result: $oset);
  ensures $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> $result == F#srtl_reach($s, $phys_ptr_cast(SP#hd, ^s_node));
  ensures $phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> $result == $oset_empty();
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $oset_in($phys_ptr_cast(SP#hd, ^s_node), $result);
  free ensures $result == F#srtl_lseg_reach($s, SP#hd, SP#tl);
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



function F#sll_lseg_min_key(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : int;

const unique cf#sll_lseg_min_key: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#sll_lseg_min_key(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> $in_range_i4(F#sll_lseg_min_key(#s, SP#hd, SP#tl)) && ($is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> F#sll_lseg_min_key(#s, SP#hd, SP#tl) == F#sll_min_key(#s, $phys_ptr_cast(SP#hd, ^s_node))) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) && $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#hd, ^s_node), ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg_min_key(#s, SP#hd, SP#tl) == $rd_inv(#s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node))));

axiom $function_arg_type(cf#sll_lseg_min_key, 0, ^^i4);

axiom $function_arg_type(cf#sll_lseg_min_key, 1, $ptr_to(^s_node));

axiom $function_arg_type(cf#sll_lseg_min_key, 2, $ptr_to(^s_node));

procedure sll_lseg_min_key(SP#hd: $ptr, SP#tl: $ptr) returns ($result: int);
  free ensures $in_range_i4($result);
  ensures $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> $result == F#sll_min_key($s, $phys_ptr_cast(SP#hd, ^s_node));
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#hd, ^s_node), ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> $result == $rd_inv($s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node));
  free ensures $result == F#sll_lseg_min_key($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#sll_lseg_max_key(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : int;

const unique cf#sll_lseg_max_key: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#sll_lseg_max_key(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> $in_range_i4(F#sll_lseg_max_key(#s, SP#hd, SP#tl)) && ($is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> F#sll_lseg_max_key(#s, SP#hd, SP#tl) == F#sll_max_key(#s, $phys_ptr_cast(SP#hd, ^s_node))) && ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) && $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#hd, ^s_node), ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg_max_key(#s, SP#hd, SP#tl) == $rd_inv(#s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node))));

axiom $function_arg_type(cf#sll_lseg_max_key, 0, ^^i4);

axiom $function_arg_type(cf#sll_lseg_max_key, 1, $ptr_to(^s_node));

axiom $function_arg_type(cf#sll_lseg_max_key, 2, $ptr_to(^s_node));

procedure sll_lseg_max_key(SP#hd: $ptr, SP#tl: $ptr) returns ($result: int);
  free ensures $in_range_i4($result);
  ensures $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> $result == F#sll_max_key($s, $phys_ptr_cast(SP#hd, ^s_node));
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SP#hd, ^s_node), ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> $result == $rd_inv($s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node));
  free ensures $result == F#sll_lseg_max_key($s, SP#hd, SP#tl);
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



procedure SLL_merge(P#i: $ptr, P#j: $ptr) returns ($result: $ptr);
  requires F#srtl($s, $phys_ptr_cast(P#i, ^s_node));
  requires F#srtl($s, $phys_ptr_cast(P#j, ^s_node));
  requires $non_null($phys_ptr_cast(P#i, ^s_node));
  requires $non_null($phys_ptr_cast(P#j, ^s_node));
  requires $rd_inv($s, s_node.key, $phys_ptr_cast(P#i, ^s_node)) <= $rd_inv($s, s_node.key, $phys_ptr_cast(P#j, ^s_node));
  requires $oset_disjoint(F#srtl_reach($s, $phys_ptr_cast(P#i, ^s_node)), F#srtl_reach($s, $phys_ptr_cast(P#j, ^s_node)));
  modifies $s, $cev_pc;
  ensures F#srtl($s, $phys_ptr_cast($result, ^s_node));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation SLL_merge(P#i: $ptr, P#j: $ptr) returns ($result: $ptr)
{
  var stmtexpr4#10: $state;
  var SL#_dryad_S3: $state;
  var stmtexpr3#9: $state;
  var SL#_dryad_S2: $state;
  var stmtexpr2#8: $ptr;
  var SL#j2: $ptr;
  var stmtexpr1#7: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr0#6: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr0#5: $ptr;
  var SL#i1: $ptr;
  var ite#1: bool;
  var loopState#0: $state;
  var stmtexpr2#13: $ptr;
  var SL#i0: $ptr;
  var L#h: $ptr;
  var L#k: $ptr;
  var stmtexpr1#12: $oset;
  var stmtexpr0#11: $oset;
  var res_srtl_reach#4: $oset;
  var res_srtl_reach#3: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var local.i: $ptr;
  var local.j: $ptr;
  var #wrTime$2^3.3: int;
  var #stackframe: int;

  anon9:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$2^3.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$2^3.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$2^3.3, (lambda #p: $ptr :: false));
    // assume true
    // assume true
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    // struct s_node* local.j; 
    // local.j := j; 
    local.j := $phys_ptr_cast(P#j, ^s_node);
    // struct s_node* local.i; 
    // local.i := i; 
    local.i := $phys_ptr_cast(P#i, ^s_node);
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _math \oset res_srtl_reach#3; 
    // res_srtl_reach#3 := srtl_reach(local.i); 
    call res_srtl_reach#3 := srtl_reach($phys_ptr_cast(local.i, ^s_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _math \oset res_srtl_reach#4; 
    // res_srtl_reach#4 := srtl_reach(local.j); 
    call res_srtl_reach#4 := srtl_reach($phys_ptr_cast(local.j, ^s_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _dryad_G0 := @_vcc_oset_union(res_srtl_reach#3, res_srtl_reach#4); 
    SL#_dryad_G0 := $oset_union(res_srtl_reach#3, res_srtl_reach#4);
    // _math \oset stmtexpr0#11; 
    // stmtexpr0#11 := _dryad_G0; 
    stmtexpr0#11 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#12; 
    // stmtexpr1#12 := _dryad_G1; 
    stmtexpr1#12 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_keys(local.j), @_vcc_intset_union(sll_keys(*((local.j->next))), @_vcc_intset_singleton(*((local.j->key)))))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_list_len_next(local.j), unchecked+(sll_list_len_next(*((local.j->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.j, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(rsrtl(local.j), &&(&&(rsrtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, rsrtl_reach(*((local.j->next)))))), >=(*((local.j->key)), sll_max_key(*((local.j->next))))))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.j), ==(rsrtl_reach(local.j), @_vcc_oset_union(rsrtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll(local.j), &&(sll(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, sll_reach(*((local.j->next)))))))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_reach(local.j), @_vcc_oset_union(sll_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_max_key(local.j), @\int_max(*((local.j->key)), sll_max_key(*((local.j->next)))))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_min_key(local.j), @\int_min(*((local.j->key)), sll_min_key(*((local.j->next)))))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(srtl(local.j), &&(&&(srtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, srtl_reach(*((local.j->next)))))), <=(*((local.j->key)), sll_min_key(*((local.j->next))))))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.j), ==(srtl_reach(local.j), @_vcc_oset_union(srtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_keys(local.i), @_vcc_intset_union(sll_keys(*((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_list_len_next(local.i), unchecked+(sll_list_len_next(*((local.i->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(rsrtl(local.i), &&(&&(rsrtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, rsrtl_reach(*((local.i->next)))))), >=(*((local.i->key)), sll_max_key(*((local.i->next))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(rsrtl_reach(local.i), @_vcc_oset_union(rsrtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll(local.i), &&(sll(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_reach(*((local.i->next)))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_reach(local.i), @_vcc_oset_union(sll_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_max_key(local.i), @\int_max(*((local.i->key)), sll_max_key(*((local.i->next)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_min_key(local.i), @\int_min(*((local.i->key)), sll_min_key(*((local.i->next)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(srtl(local.i), &&(&&(srtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_reach(*((local.i->next)))))), <=(*((local.i->key)), sll_min_key(*((local.i->next))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(srtl_reach(local.i), @_vcc_oset_union(srtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // struct s_node* k; 
    // struct s_node* h; 
    // assume ==>(@_vcc_ptr_neq_null(local.i), &&(@_vcc_mutable(@state, local.i), @writes_check(local.i))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.i, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.i, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(local.j), &&(@_vcc_mutable(@state, local.j), @writes_check(local.j))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.j, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.j, ^s_node));
    // h := local.i; 
    L#h := $phys_ptr_cast(local.i, ^s_node);
    // assert sll_lseg(h, h); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
    // assume sll_lseg(h, h); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
    // assert srtl_lseg(h, h); 
    assert F#srtl_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
    // assume srtl_lseg(h, h); 
    assume F#srtl_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
    // assert sll_lseg(k, k); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
    // assume sll_lseg(k, k); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
    // assert srtl_lseg(k, k); 
    assert F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
    // assume srtl_lseg(k, k); 
    assume F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
    // assert sll_lseg(local.j, local.j); 
    assert F#sll_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
    // assume sll_lseg(local.j, local.j); 
    assume F#sll_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
    // assert srtl_lseg(local.j, local.j); 
    assert F#srtl_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
    // assume srtl_lseg(local.j, local.j); 
    assume F#srtl_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
    // assert sll_lseg(local.i, local.i); 
    assert F#sll_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
    // assume sll_lseg(local.i, local.i); 
    assume F#sll_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
    // assert srtl_lseg(local.i, local.i); 
    assert F#srtl_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
    // assume srtl_lseg(local.i, local.i); 
    assume F#srtl_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
    // k := (struct s_node*)@null; 
    L#k := $phys_ptr_cast($null, ^s_node);
    // assert sll_lseg(h, h); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
    // assume sll_lseg(h, h); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
    // assert srtl_lseg(h, h); 
    assert F#srtl_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
    // assume srtl_lseg(h, h); 
    assume F#srtl_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
    // assert sll_lseg(k, k); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
    // assume sll_lseg(k, k); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
    // assert srtl_lseg(k, k); 
    assert F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
    // assume srtl_lseg(k, k); 
    assume F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
    // assert sll_lseg(local.j, local.j); 
    assert F#sll_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
    // assume sll_lseg(local.j, local.j); 
    assume F#sll_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
    // assert srtl_lseg(local.j, local.j); 
    assert F#srtl_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
    // assume srtl_lseg(local.j, local.j); 
    assume F#srtl_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
    // assert sll_lseg(local.i, local.i); 
    assert F#sll_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
    // assume sll_lseg(local.i, local.i); 
    assume F#sll_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
    // assert srtl_lseg(local.i, local.i); 
    assert F#srtl_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
    // assume srtl_lseg(local.i, local.i); 
    assume F#srtl_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_keys(k), @_vcc_intset_union(sll_keys(*((k->next))), @_vcc_intset_singleton(*((k->key)))))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#k, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_list_len_next(k), unchecked+(sll_list_len_next(*((k->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#k, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(rsrtl(k), &&(&&(rsrtl(*((k->next))), unchecked!(@_vcc_oset_in(k, rsrtl_reach(*((k->next)))))), >=(*((k->key)), sll_max_key(*((k->next))))))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#k, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(k), ==(rsrtl_reach(k), @_vcc_oset_union(rsrtl_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(k), ==(sll(k), &&(sll(*((k->next))), unchecked!(@_vcc_oset_in(k, sll_reach(*((k->next)))))))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#k, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_reach(k), @_vcc_oset_union(sll_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(sll_max_key(k), @\int_max(*((k->key)), sll_max_key(*((k->next)))))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#k, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(sll_min_key(k), @\int_min(*((k->key)), sll_min_key(*((k->next)))))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#k, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(srtl(k), &&(&&(srtl(*((k->next))), unchecked!(@_vcc_oset_in(k, srtl_reach(*((k->next)))))), <=(*((k->key)), sll_min_key(*((k->next))))))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#k, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(k), ==(srtl_reach(k), @_vcc_oset_union(srtl_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
    // k := local.i; 
    L#k := $phys_ptr_cast(local.i, ^s_node);
    // assert sll_lseg(h, h); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
    // assume sll_lseg(h, h); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
    // assert srtl_lseg(h, h); 
    assert F#srtl_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
    // assume srtl_lseg(h, h); 
    assume F#srtl_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
    // assert sll_lseg(k, k); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
    // assume sll_lseg(k, k); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
    // assert srtl_lseg(k, k); 
    assert F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
    // assume srtl_lseg(k, k); 
    assume F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
    // assert sll_lseg(local.j, local.j); 
    assert F#sll_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
    // assume sll_lseg(local.j, local.j); 
    assume F#sll_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
    // assert srtl_lseg(local.j, local.j); 
    assert F#srtl_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
    // assume srtl_lseg(local.j, local.j); 
    assume F#srtl_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
    // assert sll_lseg(local.i, local.i); 
    assert F#sll_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
    // assume sll_lseg(local.i, local.i); 
    assume F#sll_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
    // assert srtl_lseg(local.i, local.i); 
    assert F#srtl_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
    // assume srtl_lseg(local.i, local.i); 
    assume F#srtl_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
    // struct s_node* i0; 
    // i0 := local.i; 
    SL#i0 := $phys_ptr_cast(local.i, ^s_node);
    // struct s_node* stmtexpr2#13; 
    // stmtexpr2#13 := i0; 
    stmtexpr2#13 := $phys_ptr_cast(SL#i0, ^s_node);
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_keys(local.i), @_vcc_intset_union(sll_keys(*((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_list_len_next(local.i), unchecked+(sll_list_len_next(*((local.i->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(rsrtl(local.i), &&(&&(rsrtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, rsrtl_reach(*((local.i->next)))))), >=(*((local.i->key)), sll_max_key(*((local.i->next))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(rsrtl_reach(local.i), @_vcc_oset_union(rsrtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll(local.i), &&(sll(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_reach(*((local.i->next)))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_reach(local.i), @_vcc_oset_union(sll_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_max_key(local.i), @\int_max(*((local.i->key)), sll_max_key(*((local.i->next)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_min_key(local.i), @\int_min(*((local.i->key)), sll_min_key(*((local.i->next)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(srtl(local.i), &&(&&(srtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_reach(*((local.i->next)))))), <=(*((local.i->key)), sll_min_key(*((local.i->next))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(srtl_reach(local.i), @_vcc_oset_union(srtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), ==(sll_lseg(local.i, *((local.i->next))), &&(sll_lseg(*((local.i->next)), *((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_lseg_reach(*((local.i->next)), *((local.i->next)))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), ==(sll_lseg_reach(local.i, *((local.i->next))), @_vcc_oset_union(sll_lseg_reach(*((local.i->next)), *((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), ==(sll_lseg_keys(local.i, *((local.i->next))), @_vcc_intset_union(sll_lseg_keys(*((local.i->next)), *((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), ==(sll_lseg_len_next(local.i, *((local.i->next))), unchecked+(sll_lseg_len_next(*((local.i->next)), *((local.i->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
    // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), @_vcc_ptr_neq_pure(*((local.i->next)), *((local.i->next)))), ==(sll_lseg_max_key(local.i, *((local.i->next))), @\int_max(*((local.i->key)), sll_lseg_max_key(*((local.i->next)), *((local.i->next)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), @_vcc_ptr_neq_pure(*((local.i->next)), *((local.i->next)))), ==(sll_lseg_min_key(local.i, *((local.i->next))), @\int_min(*((local.i->key)), sll_lseg_min_key(*((local.i->next)), *((local.i->next)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), @_vcc_ptr_neq_pure(*((local.i->next)), *((local.i->next)))), ==(srtl_lseg(local.i, *((local.i->next))), &&(&&(srtl_lseg(*((local.i->next)), *((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_lseg_reach(*((local.i->next)), *((local.i->next)))))), <=(*((local.i->key)), sll_lseg_min_key(*((local.i->next)), *((local.i->next))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), ==(srtl_lseg_reach(local.i, *((local.i->next))), @_vcc_oset_union(srtl_lseg_reach(*((local.i->next)), *((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // assert @reads_check_normal((local.i->next)); 
    assert $thread_local($s, $phys_ptr_cast(local.i, ^s_node));
    // local.i := *((local.i->next)); 
    local.i := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node);
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_keys(local.i), @_vcc_intset_union(sll_keys(*((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_list_len_next(local.i), unchecked+(sll_list_len_next(*((local.i->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(rsrtl(local.i), &&(&&(rsrtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, rsrtl_reach(*((local.i->next)))))), >=(*((local.i->key)), sll_max_key(*((local.i->next))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(rsrtl_reach(local.i), @_vcc_oset_union(rsrtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll(local.i), &&(sll(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_reach(*((local.i->next)))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_reach(local.i), @_vcc_oset_union(sll_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_max_key(local.i), @\int_max(*((local.i->key)), sll_max_key(*((local.i->next)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_min_key(local.i), @\int_min(*((local.i->key)), sll_min_key(*((local.i->next)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(srtl(local.i), &&(&&(srtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_reach(*((local.i->next)))))), <=(*((local.i->key)), sll_min_key(*((local.i->next))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(srtl_reach(local.i), @_vcc_oset_union(srtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_keys(local.i), @_vcc_intset_union(sll_keys(*((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_list_len_next(local.i), unchecked+(sll_list_len_next(*((local.i->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(rsrtl(local.i), &&(&&(rsrtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, rsrtl_reach(*((local.i->next)))))), >=(*((local.i->key)), sll_max_key(*((local.i->next))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(rsrtl_reach(local.i), @_vcc_oset_union(rsrtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll(local.i), &&(sll(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_reach(*((local.i->next)))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_reach(local.i), @_vcc_oset_union(sll_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_max_key(local.i), @\int_max(*((local.i->key)), sll_max_key(*((local.i->next)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_min_key(local.i), @\int_min(*((local.i->key)), sll_min_key(*((local.i->next)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(srtl(local.i), &&(&&(srtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_reach(*((local.i->next)))))), <=(*((local.i->key)), sll_min_key(*((local.i->next))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(srtl_reach(local.i), @_vcc_oset_union(srtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), &&(@_vcc_mutable(@state, local.i), @writes_check(local.i))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.i, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.i, ^s_node));
    loopState#0 := $s;
    assume true;
    while (true)
      invariant F#srtl_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
      invariant F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node));
      invariant F#srtl($s, $phys_ptr_cast(local.i, ^s_node));
      invariant F#srtl($s, $phys_ptr_cast(local.j, ^s_node));
      invariant $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) == $phys_ptr_cast(local.i, ^s_node);
      invariant $oset_disjoint(F#srtl_lseg_reach($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
      invariant $oset_disjoint(F#srtl_lseg_reach($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)), F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)));
      invariant $oset_disjoint(F#srtl_lseg_reach($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)), F#srtl_reach($s, $phys_ptr_cast(local.j, ^s_node)));
      invariant $oset_disjoint($oset_singleton($phys_ptr_cast(L#k, ^s_node)), F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)));
      invariant $oset_disjoint($oset_singleton($phys_ptr_cast(L#k, ^s_node)), F#srtl_reach($s, $phys_ptr_cast(local.j, ^s_node)));
      invariant $oset_disjoint(F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)), F#srtl_reach($s, $phys_ptr_cast(local.j, ^s_node)));
      invariant $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) <= $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node));
      invariant $non_null($phys_ptr_cast(local.i, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) <= F#sll_min_key($s, $phys_ptr_cast(local.i, ^s_node));
      invariant $non_null($phys_ptr_cast(local.j, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) <= F#sll_min_key($s, $phys_ptr_cast(local.j, ^s_node));
      invariant $non_null($phys_ptr_cast(L#k, ^s_node));
      invariant $non_null($phys_ptr_cast(local.i, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.i, ^s_node));
      invariant $non_null($phys_ptr_cast(local.i, ^s_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.i, ^s_node));
      invariant $non_null($phys_ptr_cast(local.j, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.j, ^s_node));
      invariant $non_null($phys_ptr_cast(local.j, ^s_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.j, ^s_node));
    {
      anon8:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#0, $s);
        assume $full_stop_ext(#tok$2^22.3, $s);
        // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
        assume $meta_eq(loopState#0, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(local.i)) ...
        if ($non_null($phys_ptr_cast(local.i, ^s_node)))
        {
          anon5:
            // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_keys(i0), @_vcc_intset_union(sll_keys(*((i0->next))), @_vcc_intset_singleton(*((i0->key)))))); 
            assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#i0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_list_len_next(i0), unchecked+(sll_list_len_next(*((i0->next))), 1))); 
            assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#i0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(rsrtl(i0), &&(&&(rsrtl(*((i0->next))), unchecked!(@_vcc_oset_in(i0, rsrtl_reach(*((i0->next)))))), >=(*((i0->key)), sll_max_key(*((i0->next))))))); 
            assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(i0), ==(rsrtl_reach(i0), @_vcc_oset_union(rsrtl_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
            assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll(i0), &&(sll(*((i0->next))), unchecked!(@_vcc_oset_in(i0, sll_reach(*((i0->next)))))))); 
            assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_reach(i0), @_vcc_oset_union(sll_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
            assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(sll_max_key(i0), @\int_max(*((i0->key)), sll_max_key(*((i0->next)))))); 
            assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(SL#i0, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(sll_min_key(i0), @\int_min(*((i0->key)), sll_min_key(*((i0->next)))))); 
            assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(SL#i0, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(srtl(i0), &&(&&(srtl(*((i0->next))), unchecked!(@_vcc_oset_in(i0, srtl_reach(*((i0->next)))))), <=(*((i0->key)), sll_min_key(*((i0->next))))))); 
            assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(i0), ==(srtl_reach(i0), @_vcc_oset_union(srtl_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
            assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_keys(h), @_vcc_intset_union(sll_keys(*((h->next))), @_vcc_intset_singleton(*((h->key)))))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#h, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_list_len_next(h), unchecked+(sll_list_len_next(*((h->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#h, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(rsrtl(h), &&(&&(rsrtl(*((h->next))), unchecked!(@_vcc_oset_in(h, rsrtl_reach(*((h->next)))))), >=(*((h->key)), sll_max_key(*((h->next))))))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#h, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(h), ==(rsrtl_reach(h), @_vcc_oset_union(rsrtl_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(h), ==(sll(h), &&(sll(*((h->next))), unchecked!(@_vcc_oset_in(h, sll_reach(*((h->next)))))))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#h, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_reach(h), @_vcc_oset_union(sll_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(sll_max_key(h), @\int_max(*((h->key)), sll_max_key(*((h->next)))))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#h, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(sll_min_key(h), @\int_min(*((h->key)), sll_min_key(*((h->next)))))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#h, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(srtl(h), &&(&&(srtl(*((h->next))), unchecked!(@_vcc_oset_in(h, srtl_reach(*((h->next)))))), <=(*((h->key)), sll_min_key(*((h->next))))))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#h, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(h), ==(srtl_reach(h), @_vcc_oset_union(srtl_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_keys(k), @_vcc_intset_union(sll_keys(*((k->next))), @_vcc_intset_singleton(*((k->key)))))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#k, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_list_len_next(k), unchecked+(sll_list_len_next(*((k->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#k, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(rsrtl(k), &&(&&(rsrtl(*((k->next))), unchecked!(@_vcc_oset_in(k, rsrtl_reach(*((k->next)))))), >=(*((k->key)), sll_max_key(*((k->next))))))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#k, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(k), ==(rsrtl_reach(k), @_vcc_oset_union(rsrtl_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(k), ==(sll(k), &&(sll(*((k->next))), unchecked!(@_vcc_oset_in(k, sll_reach(*((k->next)))))))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#k, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_reach(k), @_vcc_oset_union(sll_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(sll_max_key(k), @\int_max(*((k->key)), sll_max_key(*((k->next)))))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#k, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(sll_min_key(k), @\int_min(*((k->key)), sll_min_key(*((k->next)))))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#k, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(srtl(k), &&(&&(srtl(*((k->next))), unchecked!(@_vcc_oset_in(k, srtl_reach(*((k->next)))))), <=(*((k->key)), sll_min_key(*((k->next))))))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#k, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(k), ==(srtl_reach(k), @_vcc_oset_union(srtl_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_keys(local.j), @_vcc_intset_union(sll_keys(*((local.j->next))), @_vcc_intset_singleton(*((local.j->key)))))); 
            assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_list_len_next(local.j), unchecked+(sll_list_len_next(*((local.j->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.j, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(rsrtl(local.j), &&(&&(rsrtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, rsrtl_reach(*((local.j->next)))))), >=(*((local.j->key)), sll_max_key(*((local.j->next))))))); 
            assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.j), ==(rsrtl_reach(local.j), @_vcc_oset_union(rsrtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
            assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll(local.j), &&(sll(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, sll_reach(*((local.j->next)))))))); 
            assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_reach(local.j), @_vcc_oset_union(sll_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
            assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_max_key(local.j), @\int_max(*((local.j->key)), sll_max_key(*((local.j->next)))))); 
            assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_min_key(local.j), @\int_min(*((local.j->key)), sll_min_key(*((local.j->next)))))); 
            assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(srtl(local.j), &&(&&(srtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, srtl_reach(*((local.j->next)))))), <=(*((local.j->key)), sll_min_key(*((local.j->next))))))); 
            assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.j), ==(srtl_reach(local.j), @_vcc_oset_union(srtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
            assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_keys(local.i), @_vcc_intset_union(sll_keys(*((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
            assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_list_len_next(local.i), unchecked+(sll_list_len_next(*((local.i->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(rsrtl(local.i), &&(&&(rsrtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, rsrtl_reach(*((local.i->next)))))), >=(*((local.i->key)), sll_max_key(*((local.i->next))))))); 
            assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.i), ==(rsrtl_reach(local.i), @_vcc_oset_union(rsrtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
            assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll(local.i), &&(sll(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_reach(*((local.i->next)))))))); 
            assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_reach(local.i), @_vcc_oset_union(sll_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
            assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_max_key(local.i), @\int_max(*((local.i->key)), sll_max_key(*((local.i->next)))))); 
            assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_min_key(local.i), @\int_min(*((local.i->key)), sll_min_key(*((local.i->next)))))); 
            assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(srtl(local.i), &&(&&(srtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_reach(*((local.i->next)))))), <=(*((local.i->key)), sll_min_key(*((local.i->next))))))); 
            assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.i), ==(srtl_reach(local.i), @_vcc_oset_union(srtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
            assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg(k, local.i), &&(sll_lseg(*((k->next)), local.i), unchecked!(@_vcc_oset_in(k, sll_lseg_reach(*((k->next)), local.i)))))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg_reach(k, local.i), @_vcc_oset_union(sll_lseg_reach(*((k->next)), local.i), @_vcc_oset_singleton(k)))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg_keys(k, local.i), @_vcc_intset_union(sll_lseg_keys(*((k->next)), local.i), @_vcc_intset_singleton(*((k->key)))))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg_len_next(k, local.i), unchecked+(sll_lseg_len_next(*((k->next)), local.i), 1))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), 1);
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), @_vcc_ptr_neq_pure(*((k->next)), local.i)), ==(sll_lseg_max_key(k, local.i), @\int_max(*((k->key)), sll_lseg_max_key(*((k->next)), local.i)))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), @_vcc_ptr_neq_pure(*((k->next)), local.i)), ==(sll_lseg_min_key(k, local.i), @\int_min(*((k->key)), sll_lseg_min_key(*((k->next)), local.i)))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), @_vcc_ptr_neq_pure(*((k->next)), local.i)), ==(srtl_lseg(k, local.i), &&(&&(srtl_lseg(*((k->next)), local.i), unchecked!(@_vcc_oset_in(k, srtl_lseg_reach(*((k->next)), local.i)))), <=(*((k->key)), sll_lseg_min_key(*((k->next)), local.i))))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(srtl_lseg_reach(k, local.i), @_vcc_oset_union(srtl_lseg_reach(*((k->next)), local.i), @_vcc_oset_singleton(k)))); 
            assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), ==(sll_lseg(h, k), &&(sll_lseg(*((h->next)), k), unchecked!(@_vcc_oset_in(h, sll_lseg_reach(*((h->next)), k)))))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), ==(sll_lseg_reach(h, k), @_vcc_oset_union(sll_lseg_reach(*((h->next)), k), @_vcc_oset_singleton(h)))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), ==(sll_lseg_keys(h, k), @_vcc_intset_union(sll_lseg_keys(*((h->next)), k), @_vcc_intset_singleton(*((h->key)))))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), ==(sll_lseg_len_next(h, k), unchecked+(sll_lseg_len_next(*((h->next)), k), 1))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)), 1);
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), @_vcc_ptr_neq_pure(*((h->next)), k)), ==(sll_lseg_max_key(h, k), @\int_max(*((h->key)), sll_lseg_max_key(*((h->next)), k)))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), @_vcc_ptr_neq_pure(*((h->next)), k)), ==(sll_lseg_min_key(h, k), @\int_min(*((h->key)), sll_lseg_min_key(*((h->next)), k)))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), @_vcc_ptr_neq_pure(*((h->next)), k)), ==(srtl_lseg(h, k), &&(&&(srtl_lseg(*((h->next)), k), unchecked!(@_vcc_oset_in(h, srtl_lseg_reach(*((h->next)), k)))), <=(*((h->key)), sll_lseg_min_key(*((h->next)), k))))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), ==(srtl_lseg_reach(h, k), @_vcc_oset_union(srtl_lseg_reach(*((h->next)), k), @_vcc_oset_singleton(h)))); 
            assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
            // _Bool ite#1; 
            assume true;
            // if (@_vcc_ptr_eq_null(local.j)) ...
            if ($is_null($phys_ptr_cast(local.j, ^s_node)))
            {
              anon1:
                // assert @_vcc_possibly_unreachable; 
                assert {:PossiblyUnreachable true} true;
                // ite#1 := true; 
                ite#1 := true;
            }
            else
            {
              anon2:
                // assert @_vcc_possibly_unreachable; 
                assert {:PossiblyUnreachable true} true;
                // assert @reads_check_normal((local.i->key)); 
                assert $thread_local($s, $phys_ptr_cast(local.i, ^s_node));
                // assert @reads_check_normal((local.j->key)); 
                assert $thread_local($s, $phys_ptr_cast(local.j, ^s_node));
                // ite#1 := <=(*((local.i->key)), *((local.j->key))); 
                ite#1 := $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node));
            }

          anon6:
            assume true;
            // if (ite#1) ...
            if (ite#1)
            {
              anon3:
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_keys(i0), @_vcc_intset_union(sll_keys(*((i0->next))), @_vcc_intset_singleton(*((i0->key)))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#i0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_list_len_next(i0), unchecked+(sll_list_len_next(*((i0->next))), 1))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#i0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(rsrtl(i0), &&(&&(rsrtl(*((i0->next))), unchecked!(@_vcc_oset_in(i0, rsrtl_reach(*((i0->next)))))), >=(*((i0->key)), sll_max_key(*((i0->next))))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(rsrtl_reach(i0), @_vcc_oset_union(rsrtl_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll(i0), &&(sll(*((i0->next))), unchecked!(@_vcc_oset_in(i0, sll_reach(*((i0->next)))))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_reach(i0), @_vcc_oset_union(sll_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(sll_max_key(i0), @\int_max(*((i0->key)), sll_max_key(*((i0->next)))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(SL#i0, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(sll_min_key(i0), @\int_min(*((i0->key)), sll_min_key(*((i0->next)))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(SL#i0, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(srtl(i0), &&(&&(srtl(*((i0->next))), unchecked!(@_vcc_oset_in(i0, srtl_reach(*((i0->next)))))), <=(*((i0->key)), sll_min_key(*((i0->next))))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(srtl_reach(i0), @_vcc_oset_union(srtl_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_keys(h), @_vcc_intset_union(sll_keys(*((h->next))), @_vcc_intset_singleton(*((h->key)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#h, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_list_len_next(h), unchecked+(sll_list_len_next(*((h->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#h, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(rsrtl(h), &&(&&(rsrtl(*((h->next))), unchecked!(@_vcc_oset_in(h, rsrtl_reach(*((h->next)))))), >=(*((h->key)), sll_max_key(*((h->next))))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#h, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(rsrtl_reach(h), @_vcc_oset_union(rsrtl_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll(h), &&(sll(*((h->next))), unchecked!(@_vcc_oset_in(h, sll_reach(*((h->next)))))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#h, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_reach(h), @_vcc_oset_union(sll_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(sll_max_key(h), @\int_max(*((h->key)), sll_max_key(*((h->next)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#h, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(sll_min_key(h), @\int_min(*((h->key)), sll_min_key(*((h->next)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#h, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(srtl(h), &&(&&(srtl(*((h->next))), unchecked!(@_vcc_oset_in(h, srtl_reach(*((h->next)))))), <=(*((h->key)), sll_min_key(*((h->next))))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#h, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(srtl_reach(h), @_vcc_oset_union(srtl_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_keys(k), @_vcc_intset_union(sll_keys(*((k->next))), @_vcc_intset_singleton(*((k->key)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#k, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_list_len_next(k), unchecked+(sll_list_len_next(*((k->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#k, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(rsrtl(k), &&(&&(rsrtl(*((k->next))), unchecked!(@_vcc_oset_in(k, rsrtl_reach(*((k->next)))))), >=(*((k->key)), sll_max_key(*((k->next))))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#k, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(rsrtl_reach(k), @_vcc_oset_union(rsrtl_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll(k), &&(sll(*((k->next))), unchecked!(@_vcc_oset_in(k, sll_reach(*((k->next)))))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#k, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_reach(k), @_vcc_oset_union(sll_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(sll_max_key(k), @\int_max(*((k->key)), sll_max_key(*((k->next)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#k, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(sll_min_key(k), @\int_min(*((k->key)), sll_min_key(*((k->next)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#k, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(srtl(k), &&(&&(srtl(*((k->next))), unchecked!(@_vcc_oset_in(k, srtl_reach(*((k->next)))))), <=(*((k->key)), sll_min_key(*((k->next))))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#k, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(srtl_reach(k), @_vcc_oset_union(srtl_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_keys(local.j), @_vcc_intset_union(sll_keys(*((local.j->next))), @_vcc_intset_singleton(*((local.j->key)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_list_len_next(local.j), unchecked+(sll_list_len_next(*((local.j->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.j, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(rsrtl(local.j), &&(&&(rsrtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, rsrtl_reach(*((local.j->next)))))), >=(*((local.j->key)), sll_max_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(rsrtl_reach(local.j), @_vcc_oset_union(rsrtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll(local.j), &&(sll(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, sll_reach(*((local.j->next)))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_reach(local.j), @_vcc_oset_union(sll_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_max_key(local.j), @\int_max(*((local.j->key)), sll_max_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_min_key(local.j), @\int_min(*((local.j->key)), sll_min_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(srtl(local.j), &&(&&(srtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, srtl_reach(*((local.j->next)))))), <=(*((local.j->key)), sll_min_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(srtl_reach(local.j), @_vcc_oset_union(srtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_keys(local.i), @_vcc_intset_union(sll_keys(*((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_list_len_next(local.i), unchecked+(sll_list_len_next(*((local.i->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(rsrtl(local.i), &&(&&(rsrtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, rsrtl_reach(*((local.i->next)))))), >=(*((local.i->key)), sll_max_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(rsrtl_reach(local.i), @_vcc_oset_union(rsrtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll(local.i), &&(sll(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_reach(*((local.i->next)))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_reach(local.i), @_vcc_oset_union(sll_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_max_key(local.i), @\int_max(*((local.i->key)), sll_max_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_min_key(local.i), @\int_min(*((local.i->key)), sll_min_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(srtl(local.i), &&(&&(srtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_reach(*((local.i->next)))))), <=(*((local.i->key)), sll_min_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(srtl_reach(local.i), @_vcc_oset_union(srtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg(k, local.i), &&(sll_lseg(*((k->next)), local.i), unchecked!(@_vcc_oset_in(k, sll_lseg_reach(*((k->next)), local.i)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg_reach(k, local.i), @_vcc_oset_union(sll_lseg_reach(*((k->next)), local.i), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg_keys(k, local.i), @_vcc_intset_union(sll_lseg_keys(*((k->next)), local.i), @_vcc_intset_singleton(*((k->key)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg_len_next(k, local.i), unchecked+(sll_lseg_len_next(*((k->next)), local.i), 1))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), 1);
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), @_vcc_ptr_neq_pure(*((k->next)), local.i)), ==(sll_lseg_max_key(k, local.i), @\int_max(*((k->key)), sll_lseg_max_key(*((k->next)), local.i)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), @_vcc_ptr_neq_pure(*((k->next)), local.i)), ==(sll_lseg_min_key(k, local.i), @\int_min(*((k->key)), sll_lseg_min_key(*((k->next)), local.i)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), @_vcc_ptr_neq_pure(*((k->next)), local.i)), ==(srtl_lseg(k, local.i), &&(&&(srtl_lseg(*((k->next)), local.i), unchecked!(@_vcc_oset_in(k, srtl_lseg_reach(*((k->next)), local.i)))), <=(*((k->key)), sll_lseg_min_key(*((k->next)), local.i))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(srtl_lseg_reach(k, local.i), @_vcc_oset_union(srtl_lseg_reach(*((k->next)), local.i), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), ==(sll_lseg(h, k), &&(sll_lseg(*((h->next)), k), unchecked!(@_vcc_oset_in(h, sll_lseg_reach(*((h->next)), k)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), ==(sll_lseg_reach(h, k), @_vcc_oset_union(sll_lseg_reach(*((h->next)), k), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), ==(sll_lseg_keys(h, k), @_vcc_intset_union(sll_lseg_keys(*((h->next)), k), @_vcc_intset_singleton(*((h->key)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), ==(sll_lseg_len_next(h, k), unchecked+(sll_lseg_len_next(*((h->next)), k), 1))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)), 1);
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), @_vcc_ptr_neq_pure(*((h->next)), k)), ==(sll_lseg_max_key(h, k), @\int_max(*((h->key)), sll_lseg_max_key(*((h->next)), k)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), @_vcc_ptr_neq_pure(*((h->next)), k)), ==(sll_lseg_min_key(h, k), @\int_min(*((h->key)), sll_lseg_min_key(*((h->next)), k)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), @_vcc_ptr_neq_pure(*((h->next)), k)), ==(srtl_lseg(h, k), &&(&&(srtl_lseg(*((h->next)), k), unchecked!(@_vcc_oset_in(h, srtl_lseg_reach(*((h->next)), k)))), <=(*((h->key)), sll_lseg_min_key(*((h->next)), k))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), ==(srtl_lseg_reach(h, k), @_vcc_oset_union(srtl_lseg_reach(*((h->next)), k), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // k := local.i; 
                L#k := $phys_ptr_cast(local.i, ^s_node);
                // assert sll_lseg(i0, i0); 
                assert F#sll_lseg($s, $phys_ptr_cast(SL#i0, ^s_node), $phys_ptr_cast(SL#i0, ^s_node));
                // assume sll_lseg(i0, i0); 
                assume F#sll_lseg($s, $phys_ptr_cast(SL#i0, ^s_node), $phys_ptr_cast(SL#i0, ^s_node));
                // assert srtl_lseg(i0, i0); 
                assert F#srtl_lseg($s, $phys_ptr_cast(SL#i0, ^s_node), $phys_ptr_cast(SL#i0, ^s_node));
                // assume srtl_lseg(i0, i0); 
                assume F#srtl_lseg($s, $phys_ptr_cast(SL#i0, ^s_node), $phys_ptr_cast(SL#i0, ^s_node));
                // assert sll_lseg(h, h); 
                assert F#sll_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
                // assume sll_lseg(h, h); 
                assume F#sll_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
                // assert srtl_lseg(h, h); 
                assert F#srtl_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
                // assume srtl_lseg(h, h); 
                assume F#srtl_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
                // assert sll_lseg(k, k); 
                assert F#sll_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume sll_lseg(k, k); 
                assume F#sll_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assert srtl_lseg(k, k); 
                assert F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume srtl_lseg(k, k); 
                assume F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assert sll_lseg(local.j, local.j); 
                assert F#sll_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
                // assume sll_lseg(local.j, local.j); 
                assume F#sll_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
                // assert srtl_lseg(local.j, local.j); 
                assert F#srtl_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
                // assume srtl_lseg(local.j, local.j); 
                assume F#srtl_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
                // assert sll_lseg(local.i, local.i); 
                assert F#sll_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // assume sll_lseg(local.i, local.i); 
                assume F#sll_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // assert srtl_lseg(local.i, local.i); 
                assert F#srtl_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // assume srtl_lseg(local.i, local.i); 
                assume F#srtl_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // struct s_node* i1; 
                // i1 := local.i; 
                SL#i1 := $phys_ptr_cast(local.i, ^s_node);
                // struct s_node* stmtexpr0#5; 
                // stmtexpr0#5 := i1; 
                stmtexpr0#5 := $phys_ptr_cast(SL#i1, ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_keys(local.i), @_vcc_intset_union(sll_keys(*((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_list_len_next(local.i), unchecked+(sll_list_len_next(*((local.i->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(rsrtl(local.i), &&(&&(rsrtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, rsrtl_reach(*((local.i->next)))))), >=(*((local.i->key)), sll_max_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(rsrtl_reach(local.i), @_vcc_oset_union(rsrtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll(local.i), &&(sll(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_reach(*((local.i->next)))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_reach(local.i), @_vcc_oset_union(sll_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_max_key(local.i), @\int_max(*((local.i->key)), sll_max_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_min_key(local.i), @\int_min(*((local.i->key)), sll_min_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(srtl(local.i), &&(&&(srtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_reach(*((local.i->next)))))), <=(*((local.i->key)), sll_min_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(srtl_reach(local.i), @_vcc_oset_union(srtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), ==(sll_lseg(local.i, *((local.i->next))), &&(sll_lseg(*((local.i->next)), *((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_lseg_reach(*((local.i->next)), *((local.i->next)))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), ==(sll_lseg_reach(local.i, *((local.i->next))), @_vcc_oset_union(sll_lseg_reach(*((local.i->next)), *((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), ==(sll_lseg_keys(local.i, *((local.i->next))), @_vcc_intset_union(sll_lseg_keys(*((local.i->next)), *((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), ==(sll_lseg_len_next(local.i, *((local.i->next))), unchecked+(sll_lseg_len_next(*((local.i->next)), *((local.i->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), @_vcc_ptr_neq_pure(*((local.i->next)), *((local.i->next)))), ==(sll_lseg_max_key(local.i, *((local.i->next))), @\int_max(*((local.i->key)), sll_lseg_max_key(*((local.i->next)), *((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), @_vcc_ptr_neq_pure(*((local.i->next)), *((local.i->next)))), ==(sll_lseg_min_key(local.i, *((local.i->next))), @\int_min(*((local.i->key)), sll_lseg_min_key(*((local.i->next)), *((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), @_vcc_ptr_neq_pure(*((local.i->next)), *((local.i->next)))), ==(srtl_lseg(local.i, *((local.i->next))), &&(&&(srtl_lseg(*((local.i->next)), *((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_lseg_reach(*((local.i->next)), *((local.i->next)))))), <=(*((local.i->key)), sll_lseg_min_key(*((local.i->next)), *((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_pure(local.i, *((local.i->next)))), ==(srtl_lseg_reach(local.i, *((local.i->next))), @_vcc_oset_union(srtl_lseg_reach(*((local.i->next)), *((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $phys_ptr_cast(local.i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(local.i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assert @reads_check_normal((local.i->next)); 
                assert $thread_local($s, $phys_ptr_cast(local.i, ^s_node));
                // local.i := *((local.i->next)); 
                local.i := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_keys(local.i), @_vcc_intset_union(sll_keys(*((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_list_len_next(local.i), unchecked+(sll_list_len_next(*((local.i->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(rsrtl(local.i), &&(&&(rsrtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, rsrtl_reach(*((local.i->next)))))), >=(*((local.i->key)), sll_max_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(rsrtl_reach(local.i), @_vcc_oset_union(rsrtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll(local.i), &&(sll(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_reach(*((local.i->next)))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_reach(local.i), @_vcc_oset_union(sll_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_max_key(local.i), @\int_max(*((local.i->key)), sll_max_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_min_key(local.i), @\int_min(*((local.i->key)), sll_min_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(srtl(local.i), &&(&&(srtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_reach(*((local.i->next)))))), <=(*((local.i->key)), sll_min_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(srtl_reach(local.i), @_vcc_oset_union(srtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_keys(local.i), @_vcc_intset_union(sll_keys(*((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_list_len_next(local.i), unchecked+(sll_list_len_next(*((local.i->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(rsrtl(local.i), &&(&&(rsrtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, rsrtl_reach(*((local.i->next)))))), >=(*((local.i->key)), sll_max_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(rsrtl_reach(local.i), @_vcc_oset_union(rsrtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll(local.i), &&(sll(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_reach(*((local.i->next)))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_reach(local.i), @_vcc_oset_union(sll_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_max_key(local.i), @\int_max(*((local.i->key)), sll_max_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_min_key(local.i), @\int_min(*((local.i->key)), sll_min_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(srtl(local.i), &&(&&(srtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_reach(*((local.i->next)))))), <=(*((local.i->key)), sll_min_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(srtl_reach(local.i), @_vcc_oset_union(srtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg(k, local.i), &&(sll_lseg(*((k->next)), local.i), unchecked!(@_vcc_oset_in(k, sll_lseg_reach(*((k->next)), local.i)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg_reach(k, local.i), @_vcc_oset_union(sll_lseg_reach(*((k->next)), local.i), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg_keys(k, local.i), @_vcc_intset_union(sll_lseg_keys(*((k->next)), local.i), @_vcc_intset_singleton(*((k->key)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg_len_next(k, local.i), unchecked+(sll_lseg_len_next(*((k->next)), local.i), 1))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), 1);
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), @_vcc_ptr_neq_pure(*((k->next)), local.i)), ==(sll_lseg_max_key(k, local.i), @\int_max(*((k->key)), sll_lseg_max_key(*((k->next)), local.i)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), @_vcc_ptr_neq_pure(*((k->next)), local.i)), ==(sll_lseg_min_key(k, local.i), @\int_min(*((k->key)), sll_lseg_min_key(*((k->next)), local.i)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), @_vcc_ptr_neq_pure(*((k->next)), local.i)), ==(srtl_lseg(k, local.i), &&(&&(srtl_lseg(*((k->next)), local.i), unchecked!(@_vcc_oset_in(k, srtl_lseg_reach(*((k->next)), local.i)))), <=(*((k->key)), sll_lseg_min_key(*((k->next)), local.i))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(srtl_lseg_reach(k, local.i), @_vcc_oset_union(srtl_lseg_reach(*((k->next)), local.i), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), &&(@_vcc_mutable(@state, local.i), @writes_check(local.i))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.i, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.i, ^s_node));
            }
            else
            {
              anon4:
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_keys(i0), @_vcc_intset_union(sll_keys(*((i0->next))), @_vcc_intset_singleton(*((i0->key)))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#i0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_list_len_next(i0), unchecked+(sll_list_len_next(*((i0->next))), 1))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#i0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(rsrtl(i0), &&(&&(rsrtl(*((i0->next))), unchecked!(@_vcc_oset_in(i0, rsrtl_reach(*((i0->next)))))), >=(*((i0->key)), sll_max_key(*((i0->next))))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(rsrtl_reach(i0), @_vcc_oset_union(rsrtl_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll(i0), &&(sll(*((i0->next))), unchecked!(@_vcc_oset_in(i0, sll_reach(*((i0->next)))))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_reach(i0), @_vcc_oset_union(sll_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(sll_max_key(i0), @\int_max(*((i0->key)), sll_max_key(*((i0->next)))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(SL#i0, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(sll_min_key(i0), @\int_min(*((i0->key)), sll_min_key(*((i0->next)))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(SL#i0, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(srtl(i0), &&(&&(srtl(*((i0->next))), unchecked!(@_vcc_oset_in(i0, srtl_reach(*((i0->next)))))), <=(*((i0->key)), sll_min_key(*((i0->next))))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(srtl_reach(i0), @_vcc_oset_union(srtl_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_keys(h), @_vcc_intset_union(sll_keys(*((h->next))), @_vcc_intset_singleton(*((h->key)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#h, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_list_len_next(h), unchecked+(sll_list_len_next(*((h->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#h, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(rsrtl(h), &&(&&(rsrtl(*((h->next))), unchecked!(@_vcc_oset_in(h, rsrtl_reach(*((h->next)))))), >=(*((h->key)), sll_max_key(*((h->next))))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#h, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(rsrtl_reach(h), @_vcc_oset_union(rsrtl_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll(h), &&(sll(*((h->next))), unchecked!(@_vcc_oset_in(h, sll_reach(*((h->next)))))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#h, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_reach(h), @_vcc_oset_union(sll_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(sll_max_key(h), @\int_max(*((h->key)), sll_max_key(*((h->next)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#h, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(sll_min_key(h), @\int_min(*((h->key)), sll_min_key(*((h->next)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#h, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(srtl(h), &&(&&(srtl(*((h->next))), unchecked!(@_vcc_oset_in(h, srtl_reach(*((h->next)))))), <=(*((h->key)), sll_min_key(*((h->next))))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#h, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(srtl_reach(h), @_vcc_oset_union(srtl_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_keys(k), @_vcc_intset_union(sll_keys(*((k->next))), @_vcc_intset_singleton(*((k->key)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#k, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_list_len_next(k), unchecked+(sll_list_len_next(*((k->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#k, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(rsrtl(k), &&(&&(rsrtl(*((k->next))), unchecked!(@_vcc_oset_in(k, rsrtl_reach(*((k->next)))))), >=(*((k->key)), sll_max_key(*((k->next))))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#k, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(rsrtl_reach(k), @_vcc_oset_union(rsrtl_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll(k), &&(sll(*((k->next))), unchecked!(@_vcc_oset_in(k, sll_reach(*((k->next)))))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#k, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_reach(k), @_vcc_oset_union(sll_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(sll_max_key(k), @\int_max(*((k->key)), sll_max_key(*((k->next)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#k, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(sll_min_key(k), @\int_min(*((k->key)), sll_min_key(*((k->next)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#k, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(srtl(k), &&(&&(srtl(*((k->next))), unchecked!(@_vcc_oset_in(k, srtl_reach(*((k->next)))))), <=(*((k->key)), sll_min_key(*((k->next))))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#k, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(srtl_reach(k), @_vcc_oset_union(srtl_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_keys(local.j), @_vcc_intset_union(sll_keys(*((local.j->next))), @_vcc_intset_singleton(*((local.j->key)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_list_len_next(local.j), unchecked+(sll_list_len_next(*((local.j->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.j, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(rsrtl(local.j), &&(&&(rsrtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, rsrtl_reach(*((local.j->next)))))), >=(*((local.j->key)), sll_max_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(rsrtl_reach(local.j), @_vcc_oset_union(rsrtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll(local.j), &&(sll(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, sll_reach(*((local.j->next)))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_reach(local.j), @_vcc_oset_union(sll_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_max_key(local.j), @\int_max(*((local.j->key)), sll_max_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_min_key(local.j), @\int_min(*((local.j->key)), sll_min_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(srtl(local.j), &&(&&(srtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, srtl_reach(*((local.j->next)))))), <=(*((local.j->key)), sll_min_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(srtl_reach(local.j), @_vcc_oset_union(srtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_keys(local.i), @_vcc_intset_union(sll_keys(*((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_list_len_next(local.i), unchecked+(sll_list_len_next(*((local.i->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(rsrtl(local.i), &&(&&(rsrtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, rsrtl_reach(*((local.i->next)))))), >=(*((local.i->key)), sll_max_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(rsrtl_reach(local.i), @_vcc_oset_union(rsrtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll(local.i), &&(sll(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_reach(*((local.i->next)))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_reach(local.i), @_vcc_oset_union(sll_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_max_key(local.i), @\int_max(*((local.i->key)), sll_max_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_min_key(local.i), @\int_min(*((local.i->key)), sll_min_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(srtl(local.i), &&(&&(srtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_reach(*((local.i->next)))))), <=(*((local.i->key)), sll_min_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(srtl_reach(local.i), @_vcc_oset_union(srtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg(k, local.i), &&(sll_lseg(*((k->next)), local.i), unchecked!(@_vcc_oset_in(k, sll_lseg_reach(*((k->next)), local.i)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg_reach(k, local.i), @_vcc_oset_union(sll_lseg_reach(*((k->next)), local.i), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg_keys(k, local.i), @_vcc_intset_union(sll_lseg_keys(*((k->next)), local.i), @_vcc_intset_singleton(*((k->key)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg_len_next(k, local.i), unchecked+(sll_lseg_len_next(*((k->next)), local.i), 1))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), 1);
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), @_vcc_ptr_neq_pure(*((k->next)), local.i)), ==(sll_lseg_max_key(k, local.i), @\int_max(*((k->key)), sll_lseg_max_key(*((k->next)), local.i)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), @_vcc_ptr_neq_pure(*((k->next)), local.i)), ==(sll_lseg_min_key(k, local.i), @\int_min(*((k->key)), sll_lseg_min_key(*((k->next)), local.i)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), @_vcc_ptr_neq_pure(*((k->next)), local.i)), ==(srtl_lseg(k, local.i), &&(&&(srtl_lseg(*((k->next)), local.i), unchecked!(@_vcc_oset_in(k, srtl_lseg_reach(*((k->next)), local.i)))), <=(*((k->key)), sll_lseg_min_key(*((k->next)), local.i))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(srtl_lseg_reach(k, local.i), @_vcc_oset_union(srtl_lseg_reach(*((k->next)), local.i), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), ==(sll_lseg(h, k), &&(sll_lseg(*((h->next)), k), unchecked!(@_vcc_oset_in(h, sll_lseg_reach(*((h->next)), k)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), ==(sll_lseg_reach(h, k), @_vcc_oset_union(sll_lseg_reach(*((h->next)), k), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), ==(sll_lseg_keys(h, k), @_vcc_intset_union(sll_lseg_keys(*((h->next)), k), @_vcc_intset_singleton(*((h->key)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), ==(sll_lseg_len_next(h, k), unchecked+(sll_lseg_len_next(*((h->next)), k), 1))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)), 1);
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), @_vcc_ptr_neq_pure(*((h->next)), k)), ==(sll_lseg_max_key(h, k), @\int_max(*((h->key)), sll_lseg_max_key(*((h->next)), k)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), @_vcc_ptr_neq_pure(*((h->next)), k)), ==(sll_lseg_min_key(h, k), @\int_min(*((h->key)), sll_lseg_min_key(*((h->next)), k)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), @_vcc_ptr_neq_pure(*((h->next)), k)), ==(srtl_lseg(h, k), &&(&&(srtl_lseg(*((h->next)), k), unchecked!(@_vcc_oset_in(h, srtl_lseg_reach(*((h->next)), k)))), <=(*((h->key)), sll_lseg_min_key(*((h->next)), k))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, k)), ==(srtl_lseg_reach(h, k), @_vcc_oset_union(srtl_lseg_reach(*((h->next)), k), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $phys_ptr_cast(L#h, ^s_node) != $phys_ptr_cast(L#k, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node), $phys_ptr_cast(L#k, ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // _math \state _dryad_S0; 
                // _dryad_S0 := @_vcc_current_state(@state); 
                SL#_dryad_S0 := $current_state($s);
                // _math \state stmtexpr0#6; 
                // stmtexpr0#6 := _dryad_S0; 
                stmtexpr0#6 := SL#_dryad_S0;
                // assert @prim_writes_check((k->next)); 
                assert $writable_prim($s, #wrTime$2^3.3, $dot($phys_ptr_cast(L#k, ^s_node), s_node.next));
                // *(k->next) := local.j; 
                call $write_int(s_node.next, $phys_ptr_cast(L#k, ^s_node), $ptr_to_int($phys_ptr_cast(local.j, ^s_node)));
                assume $full_stop_ext(#tok$2^51.7, $s);
                // _math \state _dryad_S1; 
                // _dryad_S1 := @_vcc_current_state(@state); 
                SL#_dryad_S1 := $current_state($s);
                // _math \state stmtexpr1#7; 
                // stmtexpr1#7 := _dryad_S1; 
                stmtexpr1#7 := SL#_dryad_S1;
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(i0)))), ==(old(_dryad_S0, sll_keys(i0)), old(_dryad_S1, sll_keys(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(i0)))), ==(old(_dryad_S0, sll_list_len_next(i0)), old(_dryad_S1, sll_list_len_next(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, rsrtl_reach(i0)))), ==(old(_dryad_S0, rsrtl(i0)), old(_dryad_S1, rsrtl(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, rsrtl_reach(i0)))), ==(old(_dryad_S0, rsrtl_reach(i0)), old(_dryad_S1, rsrtl_reach(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(i0)))), ==(old(_dryad_S0, sll(i0)), old(_dryad_S1, sll(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(i0)))), ==(old(_dryad_S0, sll_reach(i0)), old(_dryad_S1, sll_reach(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(i0)))), ==(old(_dryad_S0, sll_max_key(i0)), old(_dryad_S1, sll_max_key(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(i0)))), ==(old(_dryad_S0, sll_min_key(i0)), old(_dryad_S1, sll_min_key(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, srtl_reach(i0)))), ==(old(_dryad_S0, srtl(i0)), old(_dryad_S1, srtl(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, srtl_reach(i0)))), ==(old(_dryad_S0, srtl_reach(i0)), old(_dryad_S1, srtl_reach(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(h)))), ==(old(_dryad_S0, sll_keys(h)), old(_dryad_S1, sll_keys(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(h)))), ==(old(_dryad_S0, sll_list_len_next(h)), old(_dryad_S1, sll_list_len_next(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, rsrtl_reach(h)))), ==(old(_dryad_S0, rsrtl(h)), old(_dryad_S1, rsrtl(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, rsrtl_reach(h)))), ==(old(_dryad_S0, rsrtl_reach(h)), old(_dryad_S1, rsrtl_reach(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(h)))), ==(old(_dryad_S0, sll(h)), old(_dryad_S1, sll(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(h)))), ==(old(_dryad_S0, sll_reach(h)), old(_dryad_S1, sll_reach(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(h)))), ==(old(_dryad_S0, sll_max_key(h)), old(_dryad_S1, sll_max_key(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(h)))), ==(old(_dryad_S0, sll_min_key(h)), old(_dryad_S1, sll_min_key(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, srtl_reach(h)))), ==(old(_dryad_S0, srtl(h)), old(_dryad_S1, srtl(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, srtl_reach(h)))), ==(old(_dryad_S0, srtl_reach(h)), old(_dryad_S1, srtl_reach(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(local.j)))), ==(old(_dryad_S0, sll_keys(local.j)), old(_dryad_S1, sll_keys(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(local.j)))), ==(old(_dryad_S0, sll_list_len_next(local.j)), old(_dryad_S1, sll_list_len_next(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, rsrtl_reach(local.j)))), ==(old(_dryad_S0, rsrtl(local.j)), old(_dryad_S1, rsrtl(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, rsrtl_reach(local.j)))), ==(old(_dryad_S0, rsrtl_reach(local.j)), old(_dryad_S1, rsrtl_reach(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(local.j)))), ==(old(_dryad_S0, sll(local.j)), old(_dryad_S1, sll(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(local.j)))), ==(old(_dryad_S0, sll_reach(local.j)), old(_dryad_S1, sll_reach(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(local.j)))), ==(old(_dryad_S0, sll_max_key(local.j)), old(_dryad_S1, sll_max_key(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(local.j)))), ==(old(_dryad_S0, sll_min_key(local.j)), old(_dryad_S1, sll_min_key(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, srtl_reach(local.j)))), ==(old(_dryad_S0, srtl(local.j)), old(_dryad_S1, srtl(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, srtl_reach(local.j)))), ==(old(_dryad_S0, srtl_reach(local.j)), old(_dryad_S1, srtl_reach(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.j, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(local.i)))), ==(old(_dryad_S0, sll_keys(local.i)), old(_dryad_S1, sll_keys(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(local.i)))), ==(old(_dryad_S0, sll_list_len_next(local.i)), old(_dryad_S1, sll_list_len_next(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, rsrtl_reach(local.i)))), ==(old(_dryad_S0, rsrtl(local.i)), old(_dryad_S1, rsrtl(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, rsrtl_reach(local.i)))), ==(old(_dryad_S0, rsrtl_reach(local.i)), old(_dryad_S1, rsrtl_reach(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(local.i)))), ==(old(_dryad_S0, sll(local.i)), old(_dryad_S1, sll(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(local.i)))), ==(old(_dryad_S0, sll_reach(local.i)), old(_dryad_S1, sll_reach(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(local.i)))), ==(old(_dryad_S0, sll_max_key(local.i)), old(_dryad_S1, sll_max_key(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_reach(local.i)))), ==(old(_dryad_S0, sll_min_key(local.i)), old(_dryad_S1, sll_min_key(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, srtl_reach(local.i)))), ==(old(_dryad_S0, srtl(local.i)), old(_dryad_S1, srtl(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, srtl_reach(local.i)))), ==(old(_dryad_S0, srtl_reach(local.i)), old(_dryad_S1, srtl_reach(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.i, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((k->next))), local.i)))), ==(old(_dryad_S0, sll_lseg(old(_dryad_S0, *((k->next))), local.i)), old(_dryad_S1, sll_lseg(old(_dryad_S0, *((k->next))), local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((k->next))), local.i)))), ==(old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((k->next))), local.i)), old(_dryad_S1, sll_lseg_reach(old(_dryad_S0, *((k->next))), local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((k->next))), local.i)))), ==(old(_dryad_S0, sll_lseg_keys(old(_dryad_S0, *((k->next))), local.i)), old(_dryad_S1, sll_lseg_keys(old(_dryad_S0, *((k->next))), local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((k->next))), local.i)))), ==(old(_dryad_S0, sll_lseg_len_next(old(_dryad_S0, *((k->next))), local.i)), old(_dryad_S1, sll_lseg_len_next(old(_dryad_S0, *((k->next))), local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((k->next))), local.i)))), ==(old(_dryad_S0, sll_lseg_max_key(old(_dryad_S0, *((k->next))), local.i)), old(_dryad_S1, sll_lseg_max_key(old(_dryad_S0, *((k->next))), local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_lseg_max_key(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) == F#sll_lseg_max_key(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((k->next))), local.i)))), ==(old(_dryad_S0, sll_lseg_min_key(old(_dryad_S0, *((k->next))), local.i)), old(_dryad_S1, sll_lseg_min_key(old(_dryad_S0, *((k->next))), local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_lseg_min_key(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) == F#sll_lseg_min_key(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, srtl_lseg_reach(old(_dryad_S0, *((k->next))), local.i)))), ==(old(_dryad_S0, srtl_lseg(old(_dryad_S0, *((k->next))), local.i)), old(_dryad_S1, srtl_lseg(old(_dryad_S0, *((k->next))), local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))) ==> F#srtl_lseg(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) == F#srtl_lseg(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, srtl_lseg_reach(old(_dryad_S0, *((k->next))), local.i)))), ==(old(_dryad_S0, srtl_lseg_reach(old(_dryad_S0, *((k->next))), local.i)), old(_dryad_S1, srtl_lseg_reach(old(_dryad_S0, *((k->next))), local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))) ==> F#srtl_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) == F#srtl_lseg_reach(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_lseg_reach(h, k)))), ==(old(_dryad_S0, sll_lseg(h, k)), old(_dryad_S1, sll_lseg(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_lseg_reach(h, k)))), ==(old(_dryad_S0, sll_lseg_reach(h, k)), old(_dryad_S1, sll_lseg_reach(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_lseg_reach(h, k)))), ==(old(_dryad_S0, sll_lseg_keys(h, k)), old(_dryad_S1, sll_lseg_keys(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_lseg_reach(h, k)))), ==(old(_dryad_S0, sll_lseg_len_next(h, k)), old(_dryad_S1, sll_lseg_len_next(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_lseg_reach(h, k)))), ==(old(_dryad_S0, sll_lseg_max_key(h, k)), old(_dryad_S1, sll_lseg_max_key(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#sll_lseg_max_key(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#sll_lseg_max_key(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, sll_lseg_reach(h, k)))), ==(old(_dryad_S0, sll_lseg_min_key(h, k)), old(_dryad_S1, sll_lseg_min_key(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#sll_lseg_min_key(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#sll_lseg_min_key(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, srtl_lseg_reach(h, k)))), ==(old(_dryad_S0, srtl_lseg(h, k)), old(_dryad_S1, srtl_lseg(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#srtl_lseg(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#srtl_lseg(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S0, srtl_lseg_reach(h, k)))), ==(old(_dryad_S0, srtl_lseg_reach(h, k)), old(_dryad_S1, srtl_lseg_reach(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#srtl_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#srtl_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(k, i0)), ==(*((i0->key)), old(_dryad_S0, *((i0->key))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(SL#i0, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(k, i0)), @_vcc_ptr_eq_pure(*((i0->next)), old(_dryad_S0, *((i0->next))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(SL#i0, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(k, h)), ==(*((h->key)), old(_dryad_S0, *((h->key))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(L#h, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(k, h)), @_vcc_ptr_eq_pure(*((h->next)), old(_dryad_S0, *((h->next))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(L#h, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(k, local.j)), ==(*((local.j->key)), old(_dryad_S0, *((local.j->key))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(local.j, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(k, local.j)), @_vcc_ptr_eq_pure(*((local.j->next)), old(_dryad_S0, *((local.j->next))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(local.j, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(k, local.i)), ==(*((local.i->key)), old(_dryad_S0, *((local.i->key))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(local.i, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(k, local.i)), @_vcc_ptr_eq_pure(*((local.i->next)), old(_dryad_S0, *((local.i->next))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(local.i, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_keys(i0), @_vcc_intset_union(sll_keys(*((i0->next))), @_vcc_intset_singleton(*((i0->key)))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#i0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_list_len_next(i0), unchecked+(sll_list_len_next(*((i0->next))), 1))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#i0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(rsrtl(i0), &&(&&(rsrtl(*((i0->next))), unchecked!(@_vcc_oset_in(i0, rsrtl_reach(*((i0->next)))))), >=(*((i0->key)), sll_max_key(*((i0->next))))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(rsrtl_reach(i0), @_vcc_oset_union(rsrtl_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll(i0), &&(sll(*((i0->next))), unchecked!(@_vcc_oset_in(i0, sll_reach(*((i0->next)))))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_reach(i0), @_vcc_oset_union(sll_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(sll_max_key(i0), @\int_max(*((i0->key)), sll_max_key(*((i0->next)))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(SL#i0, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(sll_min_key(i0), @\int_min(*((i0->key)), sll_min_key(*((i0->next)))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(SL#i0, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(srtl(i0), &&(&&(srtl(*((i0->next))), unchecked!(@_vcc_oset_in(i0, srtl_reach(*((i0->next)))))), <=(*((i0->key)), sll_min_key(*((i0->next))))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(srtl_reach(i0), @_vcc_oset_union(srtl_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_keys(h), @_vcc_intset_union(sll_keys(*((h->next))), @_vcc_intset_singleton(*((h->key)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#h, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_list_len_next(h), unchecked+(sll_list_len_next(*((h->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#h, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(rsrtl(h), &&(&&(rsrtl(*((h->next))), unchecked!(@_vcc_oset_in(h, rsrtl_reach(*((h->next)))))), >=(*((h->key)), sll_max_key(*((h->next))))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#h, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(rsrtl_reach(h), @_vcc_oset_union(rsrtl_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll(h), &&(sll(*((h->next))), unchecked!(@_vcc_oset_in(h, sll_reach(*((h->next)))))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#h, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_reach(h), @_vcc_oset_union(sll_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(sll_max_key(h), @\int_max(*((h->key)), sll_max_key(*((h->next)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#h, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(sll_min_key(h), @\int_min(*((h->key)), sll_min_key(*((h->next)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#h, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(srtl(h), &&(&&(srtl(*((h->next))), unchecked!(@_vcc_oset_in(h, srtl_reach(*((h->next)))))), <=(*((h->key)), sll_min_key(*((h->next))))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#h, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(srtl_reach(h), @_vcc_oset_union(srtl_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_keys(local.j), @_vcc_intset_union(sll_keys(*((local.j->next))), @_vcc_intset_singleton(*((local.j->key)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_list_len_next(local.j), unchecked+(sll_list_len_next(*((local.j->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.j, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(rsrtl(local.j), &&(&&(rsrtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, rsrtl_reach(*((local.j->next)))))), >=(*((local.j->key)), sll_max_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(rsrtl_reach(local.j), @_vcc_oset_union(rsrtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll(local.j), &&(sll(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, sll_reach(*((local.j->next)))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_reach(local.j), @_vcc_oset_union(sll_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_max_key(local.j), @\int_max(*((local.j->key)), sll_max_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_min_key(local.j), @\int_min(*((local.j->key)), sll_min_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(srtl(local.j), &&(&&(srtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, srtl_reach(*((local.j->next)))))), <=(*((local.j->key)), sll_min_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(srtl_reach(local.j), @_vcc_oset_union(srtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_keys(local.i), @_vcc_intset_union(sll_keys(*((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_list_len_next(local.i), unchecked+(sll_list_len_next(*((local.i->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(rsrtl(local.i), &&(&&(rsrtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, rsrtl_reach(*((local.i->next)))))), >=(*((local.i->key)), sll_max_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(rsrtl_reach(local.i), @_vcc_oset_union(rsrtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll(local.i), &&(sll(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_reach(*((local.i->next)))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_reach(local.i), @_vcc_oset_union(sll_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_max_key(local.i), @\int_max(*((local.i->key)), sll_max_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_min_key(local.i), @\int_min(*((local.i->key)), sll_min_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(srtl(local.i), &&(&&(srtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_reach(*((local.i->next)))))), <=(*((local.i->key)), sll_min_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(srtl_reach(local.i), @_vcc_oset_union(srtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_keys(k), @_vcc_intset_union(sll_keys(*((k->next))), @_vcc_intset_singleton(*((k->key)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#k, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_list_len_next(k), unchecked+(sll_list_len_next(*((k->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#k, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(rsrtl(k), &&(&&(rsrtl(*((k->next))), unchecked!(@_vcc_oset_in(k, rsrtl_reach(*((k->next)))))), >=(*((k->key)), sll_max_key(*((k->next))))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#k, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(rsrtl_reach(k), @_vcc_oset_union(rsrtl_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll(k), &&(sll(*((k->next))), unchecked!(@_vcc_oset_in(k, sll_reach(*((k->next)))))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#k, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_reach(k), @_vcc_oset_union(sll_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(sll_max_key(k), @\int_max(*((k->key)), sll_max_key(*((k->next)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#k, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(sll_min_key(k), @\int_min(*((k->key)), sll_min_key(*((k->next)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#k, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(srtl(k), &&(&&(srtl(*((k->next))), unchecked!(@_vcc_oset_in(k, srtl_reach(*((k->next)))))), <=(*((k->key)), sll_min_key(*((k->next))))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#k, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(srtl_reach(k), @_vcc_oset_union(srtl_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_keys(local.j), @_vcc_intset_union(sll_keys(*((local.j->next))), @_vcc_intset_singleton(*((local.j->key)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_list_len_next(local.j), unchecked+(sll_list_len_next(*((local.j->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.j, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(rsrtl(local.j), &&(&&(rsrtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, rsrtl_reach(*((local.j->next)))))), >=(*((local.j->key)), sll_max_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(rsrtl_reach(local.j), @_vcc_oset_union(rsrtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll(local.j), &&(sll(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, sll_reach(*((local.j->next)))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_reach(local.j), @_vcc_oset_union(sll_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_max_key(local.j), @\int_max(*((local.j->key)), sll_max_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_min_key(local.j), @\int_min(*((local.j->key)), sll_min_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(srtl(local.j), &&(&&(srtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, srtl_reach(*((local.j->next)))))), <=(*((local.j->key)), sll_min_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(srtl_reach(local.j), @_vcc_oset_union(srtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg(k, local.i), &&(sll_lseg(*((k->next)), local.i), unchecked!(@_vcc_oset_in(k, sll_lseg_reach(*((k->next)), local.i)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg_reach(k, local.i), @_vcc_oset_union(sll_lseg_reach(*((k->next)), local.i), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg_keys(k, local.i), @_vcc_intset_union(sll_lseg_keys(*((k->next)), local.i), @_vcc_intset_singleton(*((k->key)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(sll_lseg_len_next(k, local.i), unchecked+(sll_lseg_len_next(*((k->next)), local.i), 1))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), 1);
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), @_vcc_ptr_neq_pure(*((k->next)), local.i)), ==(sll_lseg_max_key(k, local.i), @\int_max(*((k->key)), sll_lseg_max_key(*((k->next)), local.i)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), @_vcc_ptr_neq_pure(*((k->next)), local.i)), ==(sll_lseg_min_key(k, local.i), @\int_min(*((k->key)), sll_lseg_min_key(*((k->next)), local.i)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), @_vcc_ptr_neq_pure(*((k->next)), local.i)), ==(srtl_lseg(k, local.i), &&(&&(srtl_lseg(*((k->next)), local.i), unchecked!(@_vcc_oset_in(k, srtl_lseg_reach(*((k->next)), local.i)))), <=(*((k->key)), sll_lseg_min_key(*((k->next)), local.i))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_pure(k, local.i)), ==(srtl_lseg_reach(k, local.i), @_vcc_oset_union(srtl_lseg_reach(*((k->next)), local.i), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $phys_ptr_cast(L#k, ^s_node) != $phys_ptr_cast(local.i, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node), $phys_ptr_cast(local.i, ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // k := local.j; 
                L#k := $phys_ptr_cast(local.j, ^s_node);
                // assert sll_lseg(i0, i0); 
                assert F#sll_lseg($s, $phys_ptr_cast(SL#i0, ^s_node), $phys_ptr_cast(SL#i0, ^s_node));
                // assume sll_lseg(i0, i0); 
                assume F#sll_lseg($s, $phys_ptr_cast(SL#i0, ^s_node), $phys_ptr_cast(SL#i0, ^s_node));
                // assert srtl_lseg(i0, i0); 
                assert F#srtl_lseg($s, $phys_ptr_cast(SL#i0, ^s_node), $phys_ptr_cast(SL#i0, ^s_node));
                // assume srtl_lseg(i0, i0); 
                assume F#srtl_lseg($s, $phys_ptr_cast(SL#i0, ^s_node), $phys_ptr_cast(SL#i0, ^s_node));
                // assert sll_lseg(h, h); 
                assert F#sll_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
                // assume sll_lseg(h, h); 
                assume F#sll_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
                // assert srtl_lseg(h, h); 
                assert F#srtl_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
                // assume srtl_lseg(h, h); 
                assume F#srtl_lseg($s, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#h, ^s_node));
                // assert sll_lseg(k, k); 
                assert F#sll_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume sll_lseg(k, k); 
                assume F#sll_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assert srtl_lseg(k, k); 
                assert F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume srtl_lseg(k, k); 
                assume F#srtl_lseg($s, $phys_ptr_cast(L#k, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assert sll_lseg(local.j, local.j); 
                assert F#sll_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
                // assume sll_lseg(local.j, local.j); 
                assume F#sll_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
                // assert srtl_lseg(local.j, local.j); 
                assert F#srtl_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
                // assume srtl_lseg(local.j, local.j); 
                assume F#srtl_lseg($s, $phys_ptr_cast(local.j, ^s_node), $phys_ptr_cast(local.j, ^s_node));
                // assert sll_lseg(local.i, local.i); 
                assert F#sll_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // assume sll_lseg(local.i, local.i); 
                assume F#sll_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // assert srtl_lseg(local.i, local.i); 
                assert F#srtl_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // assume srtl_lseg(local.i, local.i); 
                assume F#srtl_lseg($s, $phys_ptr_cast(local.i, ^s_node), $phys_ptr_cast(local.i, ^s_node));
                // struct s_node* j2; 
                // j2 := local.j; 
                SL#j2 := $phys_ptr_cast(local.j, ^s_node);
                // struct s_node* stmtexpr2#8; 
                // stmtexpr2#8 := j2; 
                stmtexpr2#8 := $phys_ptr_cast(SL#j2, ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_keys(local.j), @_vcc_intset_union(sll_keys(*((local.j->next))), @_vcc_intset_singleton(*((local.j->key)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_list_len_next(local.j), unchecked+(sll_list_len_next(*((local.j->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.j, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(rsrtl(local.j), &&(&&(rsrtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, rsrtl_reach(*((local.j->next)))))), >=(*((local.j->key)), sll_max_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(rsrtl_reach(local.j), @_vcc_oset_union(rsrtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll(local.j), &&(sll(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, sll_reach(*((local.j->next)))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_reach(local.j), @_vcc_oset_union(sll_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_max_key(local.j), @\int_max(*((local.j->key)), sll_max_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_min_key(local.j), @\int_min(*((local.j->key)), sll_min_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(srtl(local.j), &&(&&(srtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, srtl_reach(*((local.j->next)))))), <=(*((local.j->key)), sll_min_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(srtl_reach(local.j), @_vcc_oset_union(srtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_pure(local.j, *((local.j->next)))), ==(sll_lseg(local.j, *((local.j->next))), &&(sll_lseg(*((local.j->next)), *((local.j->next))), unchecked!(@_vcc_oset_in(local.j, sll_lseg_reach(*((local.j->next)), *((local.j->next)))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $phys_ptr_cast(local.j, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.j, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_pure(local.j, *((local.j->next)))), ==(sll_lseg_reach(local.j, *((local.j->next))), @_vcc_oset_union(sll_lseg_reach(*((local.j->next)), *((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $phys_ptr_cast(local.j, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.j, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_pure(local.j, *((local.j->next)))), ==(sll_lseg_keys(local.j, *((local.j->next))), @_vcc_intset_union(sll_lseg_keys(*((local.j->next)), *((local.j->next))), @_vcc_intset_singleton(*((local.j->key)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $phys_ptr_cast(local.j, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.j, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_pure(local.j, *((local.j->next)))), ==(sll_lseg_len_next(local.j, *((local.j->next))), unchecked+(sll_lseg_len_next(*((local.j->next)), *((local.j->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $phys_ptr_cast(local.j, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.j, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), 1);
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_pure(local.j, *((local.j->next)))), @_vcc_ptr_neq_pure(*((local.j->next)), *((local.j->next)))), ==(sll_lseg_max_key(local.j, *((local.j->next))), @\int_max(*((local.j->key)), sll_lseg_max_key(*((local.j->next)), *((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $phys_ptr_cast(local.j, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(local.j, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_pure(local.j, *((local.j->next)))), @_vcc_ptr_neq_pure(*((local.j->next)), *((local.j->next)))), ==(sll_lseg_min_key(local.j, *((local.j->next))), @\int_min(*((local.j->key)), sll_lseg_min_key(*((local.j->next)), *((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $phys_ptr_cast(local.j, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(local.j, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_pure(local.j, *((local.j->next)))), @_vcc_ptr_neq_pure(*((local.j->next)), *((local.j->next)))), ==(srtl_lseg(local.j, *((local.j->next))), &&(&&(srtl_lseg(*((local.j->next)), *((local.j->next))), unchecked!(@_vcc_oset_in(local.j, srtl_lseg_reach(*((local.j->next)), *((local.j->next)))))), <=(*((local.j->key)), sll_lseg_min_key(*((local.j->next)), *((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $phys_ptr_cast(local.j, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(local.j, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_pure(local.j, *((local.j->next)))), ==(srtl_lseg_reach(local.j, *((local.j->next))), @_vcc_oset_union(srtl_lseg_reach(*((local.j->next)), *((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $phys_ptr_cast(local.j, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(local.j, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assert @reads_check_normal((local.j->next)); 
                assert $thread_local($s, $phys_ptr_cast(local.j, ^s_node));
                // local.j := *((local.j->next)); 
                local.j := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_keys(local.j), @_vcc_intset_union(sll_keys(*((local.j->next))), @_vcc_intset_singleton(*((local.j->key)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_list_len_next(local.j), unchecked+(sll_list_len_next(*((local.j->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.j, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(rsrtl(local.j), &&(&&(rsrtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, rsrtl_reach(*((local.j->next)))))), >=(*((local.j->key)), sll_max_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(rsrtl_reach(local.j), @_vcc_oset_union(rsrtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll(local.j), &&(sll(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, sll_reach(*((local.j->next)))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_reach(local.j), @_vcc_oset_union(sll_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_max_key(local.j), @\int_max(*((local.j->key)), sll_max_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_min_key(local.j), @\int_min(*((local.j->key)), sll_min_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(srtl(local.j), &&(&&(srtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, srtl_reach(*((local.j->next)))))), <=(*((local.j->key)), sll_min_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(srtl_reach(local.j), @_vcc_oset_union(srtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_keys(local.j), @_vcc_intset_union(sll_keys(*((local.j->next))), @_vcc_intset_singleton(*((local.j->key)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_list_len_next(local.j), unchecked+(sll_list_len_next(*((local.j->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.j, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(rsrtl(local.j), &&(&&(rsrtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, rsrtl_reach(*((local.j->next)))))), >=(*((local.j->key)), sll_max_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(rsrtl_reach(local.j), @_vcc_oset_union(rsrtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll(local.j), &&(sll(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, sll_reach(*((local.j->next)))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_reach(local.j), @_vcc_oset_union(sll_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_max_key(local.j), @\int_max(*((local.j->key)), sll_max_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_min_key(local.j), @\int_min(*((local.j->key)), sll_min_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(srtl(local.j), &&(&&(srtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, srtl_reach(*((local.j->next)))))), <=(*((local.j->key)), sll_min_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(srtl_reach(local.j), @_vcc_oset_union(srtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), &&(@_vcc_mutable(@state, local.j), @writes_check(local.j))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.j, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.j, ^s_node));
                // _math \state _dryad_S2; 
                // _dryad_S2 := @_vcc_current_state(@state); 
                SL#_dryad_S2 := $current_state($s);
                // _math \state stmtexpr3#9; 
                // stmtexpr3#9 := _dryad_S2; 
                stmtexpr3#9 := SL#_dryad_S2;
                // assert @prim_writes_check((k->next)); 
                assert $writable_prim($s, #wrTime$2^3.3, $dot($phys_ptr_cast(L#k, ^s_node), s_node.next));
                // *(k->next) := local.i; 
                call $write_int(s_node.next, $phys_ptr_cast(L#k, ^s_node), $ptr_to_int($phys_ptr_cast(local.i, ^s_node)));
                assume $full_stop_ext(#tok$2^55.7, $s);
                // _math \state _dryad_S3; 
                // _dryad_S3 := @_vcc_current_state(@state); 
                SL#_dryad_S3 := $current_state($s);
                // _math \state stmtexpr4#10; 
                // stmtexpr4#10 := _dryad_S3; 
                stmtexpr4#10 := SL#_dryad_S3;
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(j2)))), ==(old(_dryad_S2, sll_keys(j2)), old(_dryad_S3, sll_keys(j2)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node))) ==> F#sll_keys(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node)) == F#sll_keys(SL#_dryad_S3, $phys_ptr_cast(SL#j2, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(j2)))), ==(old(_dryad_S2, sll_list_len_next(j2)), old(_dryad_S3, sll_list_len_next(j2)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(SL#j2, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, rsrtl_reach(j2)))), ==(old(_dryad_S2, rsrtl(j2)), old(_dryad_S3, rsrtl(j2)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node))) ==> F#rsrtl(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node)) == F#rsrtl(SL#_dryad_S3, $phys_ptr_cast(SL#j2, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, rsrtl_reach(j2)))), ==(old(_dryad_S2, rsrtl_reach(j2)), old(_dryad_S3, rsrtl_reach(j2)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node)) == F#rsrtl_reach(SL#_dryad_S3, $phys_ptr_cast(SL#j2, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(j2)))), ==(old(_dryad_S2, sll(j2)), old(_dryad_S3, sll(j2)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(SL#j2, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(j2)))), ==(old(_dryad_S2, sll_reach(j2)), old(_dryad_S3, sll_reach(j2)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(SL#j2, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(j2)))), ==(old(_dryad_S2, sll_max_key(j2)), old(_dryad_S3, sll_max_key(j2)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node))) ==> F#sll_max_key(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node)) == F#sll_max_key(SL#_dryad_S3, $phys_ptr_cast(SL#j2, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(j2)))), ==(old(_dryad_S2, sll_min_key(j2)), old(_dryad_S3, sll_min_key(j2)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node))) ==> F#sll_min_key(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node)) == F#sll_min_key(SL#_dryad_S3, $phys_ptr_cast(SL#j2, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, srtl_reach(j2)))), ==(old(_dryad_S2, srtl(j2)), old(_dryad_S3, srtl(j2)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node))) ==> F#srtl(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node)) == F#srtl(SL#_dryad_S3, $phys_ptr_cast(SL#j2, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, srtl_reach(j2)))), ==(old(_dryad_S2, srtl_reach(j2)), old(_dryad_S3, srtl_reach(j2)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node))) ==> F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(SL#j2, ^s_node)) == F#srtl_reach(SL#_dryad_S3, $phys_ptr_cast(SL#j2, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(i0)))), ==(old(_dryad_S2, sll_keys(i0)), old(_dryad_S3, sll_keys(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#sll_keys(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node)) == F#sll_keys(SL#_dryad_S3, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(i0)))), ==(old(_dryad_S2, sll_list_len_next(i0)), old(_dryad_S3, sll_list_len_next(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, rsrtl_reach(i0)))), ==(old(_dryad_S2, rsrtl(i0)), old(_dryad_S3, rsrtl(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#rsrtl(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node)) == F#rsrtl(SL#_dryad_S3, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, rsrtl_reach(i0)))), ==(old(_dryad_S2, rsrtl_reach(i0)), old(_dryad_S3, rsrtl_reach(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node)) == F#rsrtl_reach(SL#_dryad_S3, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(i0)))), ==(old(_dryad_S2, sll(i0)), old(_dryad_S3, sll(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(i0)))), ==(old(_dryad_S2, sll_reach(i0)), old(_dryad_S3, sll_reach(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(i0)))), ==(old(_dryad_S2, sll_max_key(i0)), old(_dryad_S3, sll_max_key(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#sll_max_key(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node)) == F#sll_max_key(SL#_dryad_S3, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(i0)))), ==(old(_dryad_S2, sll_min_key(i0)), old(_dryad_S3, sll_min_key(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#sll_min_key(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node)) == F#sll_min_key(SL#_dryad_S3, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, srtl_reach(i0)))), ==(old(_dryad_S2, srtl(i0)), old(_dryad_S3, srtl(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#srtl(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node)) == F#srtl(SL#_dryad_S3, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, srtl_reach(i0)))), ==(old(_dryad_S2, srtl_reach(i0)), old(_dryad_S3, srtl_reach(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(SL#i0, ^s_node)) == F#srtl_reach(SL#_dryad_S3, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(h)))), ==(old(_dryad_S2, sll_keys(h)), old(_dryad_S3, sll_keys(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node))) ==> F#sll_keys(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node)) == F#sll_keys(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(h)))), ==(old(_dryad_S2, sll_list_len_next(h)), old(_dryad_S3, sll_list_len_next(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, rsrtl_reach(h)))), ==(old(_dryad_S2, rsrtl(h)), old(_dryad_S3, rsrtl(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node))) ==> F#rsrtl(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node)) == F#rsrtl(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, rsrtl_reach(h)))), ==(old(_dryad_S2, rsrtl_reach(h)), old(_dryad_S3, rsrtl_reach(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node)) == F#rsrtl_reach(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(h)))), ==(old(_dryad_S2, sll(h)), old(_dryad_S3, sll(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(h)))), ==(old(_dryad_S2, sll_reach(h)), old(_dryad_S3, sll_reach(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(h)))), ==(old(_dryad_S2, sll_max_key(h)), old(_dryad_S3, sll_max_key(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node))) ==> F#sll_max_key(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node)) == F#sll_max_key(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(h)))), ==(old(_dryad_S2, sll_min_key(h)), old(_dryad_S3, sll_min_key(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node))) ==> F#sll_min_key(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node)) == F#sll_min_key(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, srtl_reach(h)))), ==(old(_dryad_S2, srtl(h)), old(_dryad_S3, srtl(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node))) ==> F#srtl(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node)) == F#srtl(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, srtl_reach(h)))), ==(old(_dryad_S2, srtl_reach(h)), old(_dryad_S3, srtl_reach(h)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node))) ==> F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node)) == F#srtl_reach(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(local.j)))), ==(old(_dryad_S2, sll_keys(local.j)), old(_dryad_S3, sll_keys(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node))) ==> F#sll_keys(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node)) == F#sll_keys(SL#_dryad_S3, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(local.j)))), ==(old(_dryad_S2, sll_list_len_next(local.j)), old(_dryad_S3, sll_list_len_next(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, rsrtl_reach(local.j)))), ==(old(_dryad_S2, rsrtl(local.j)), old(_dryad_S3, rsrtl(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node))) ==> F#rsrtl(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node)) == F#rsrtl(SL#_dryad_S3, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, rsrtl_reach(local.j)))), ==(old(_dryad_S2, rsrtl_reach(local.j)), old(_dryad_S3, rsrtl_reach(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node)) == F#rsrtl_reach(SL#_dryad_S3, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(local.j)))), ==(old(_dryad_S2, sll(local.j)), old(_dryad_S3, sll(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(local.j)))), ==(old(_dryad_S2, sll_reach(local.j)), old(_dryad_S3, sll_reach(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(local.j)))), ==(old(_dryad_S2, sll_max_key(local.j)), old(_dryad_S3, sll_max_key(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node))) ==> F#sll_max_key(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node)) == F#sll_max_key(SL#_dryad_S3, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(local.j)))), ==(old(_dryad_S2, sll_min_key(local.j)), old(_dryad_S3, sll_min_key(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node))) ==> F#sll_min_key(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node)) == F#sll_min_key(SL#_dryad_S3, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, srtl_reach(local.j)))), ==(old(_dryad_S2, srtl(local.j)), old(_dryad_S3, srtl(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node))) ==> F#srtl(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node)) == F#srtl(SL#_dryad_S3, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, srtl_reach(local.j)))), ==(old(_dryad_S2, srtl_reach(local.j)), old(_dryad_S3, srtl_reach(local.j)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node))) ==> F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(local.j, ^s_node)) == F#srtl_reach(SL#_dryad_S3, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(local.i)))), ==(old(_dryad_S2, sll_keys(local.i)), old(_dryad_S3, sll_keys(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_keys(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node)) == F#sll_keys(SL#_dryad_S3, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(local.i)))), ==(old(_dryad_S2, sll_list_len_next(local.i)), old(_dryad_S3, sll_list_len_next(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, rsrtl_reach(local.i)))), ==(old(_dryad_S2, rsrtl(local.i)), old(_dryad_S3, rsrtl(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node))) ==> F#rsrtl(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node)) == F#rsrtl(SL#_dryad_S3, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, rsrtl_reach(local.i)))), ==(old(_dryad_S2, rsrtl_reach(local.i)), old(_dryad_S3, rsrtl_reach(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node)) == F#rsrtl_reach(SL#_dryad_S3, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(local.i)))), ==(old(_dryad_S2, sll(local.i)), old(_dryad_S3, sll(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(local.i)))), ==(old(_dryad_S2, sll_reach(local.i)), old(_dryad_S3, sll_reach(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(local.i)))), ==(old(_dryad_S2, sll_max_key(local.i)), old(_dryad_S3, sll_max_key(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_max_key(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node)) == F#sll_max_key(SL#_dryad_S3, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_reach(local.i)))), ==(old(_dryad_S2, sll_min_key(local.i)), old(_dryad_S3, sll_min_key(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node))) ==> F#sll_min_key(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node)) == F#sll_min_key(SL#_dryad_S3, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, srtl_reach(local.i)))), ==(old(_dryad_S2, srtl(local.i)), old(_dryad_S3, srtl(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node))) ==> F#srtl(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node)) == F#srtl(SL#_dryad_S3, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, srtl_reach(local.i)))), ==(old(_dryad_S2, srtl_reach(local.i)), old(_dryad_S3, srtl_reach(local.i)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node))) ==> F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(local.i, ^s_node)) == F#srtl_reach(SL#_dryad_S3, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_lseg_reach(h, k)))), ==(old(_dryad_S2, sll_lseg(h, k)), old(_dryad_S3, sll_lseg(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#sll_lseg(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#sll_lseg(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_lseg_reach(h, k)))), ==(old(_dryad_S2, sll_lseg_reach(h, k)), old(_dryad_S3, sll_lseg_reach(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_lseg_reach(h, k)))), ==(old(_dryad_S2, sll_lseg_keys(h, k)), old(_dryad_S3, sll_lseg_keys(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_lseg_reach(h, k)))), ==(old(_dryad_S2, sll_lseg_len_next(h, k)), old(_dryad_S3, sll_lseg_len_next(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#sll_lseg_len_next(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#sll_lseg_len_next(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_lseg_reach(h, k)))), ==(old(_dryad_S2, sll_lseg_max_key(h, k)), old(_dryad_S3, sll_lseg_max_key(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#sll_lseg_max_key(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#sll_lseg_max_key(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, sll_lseg_reach(h, k)))), ==(old(_dryad_S2, sll_lseg_min_key(h, k)), old(_dryad_S3, sll_lseg_min_key(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#sll_lseg_min_key(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#sll_lseg_min_key(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, srtl_lseg_reach(h, k)))), ==(old(_dryad_S2, srtl_lseg(h, k)), old(_dryad_S3, srtl_lseg(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#srtl_lseg(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#srtl_lseg(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(k, old(_dryad_S2, srtl_lseg_reach(h, k)))), ==(old(_dryad_S2, srtl_lseg_reach(h, k)), old(_dryad_S3, srtl_lseg_reach(h, k)))); 
                assume !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node))) ==> F#srtl_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node)) == F#srtl_lseg_reach(SL#_dryad_S3, $phys_ptr_cast(L#h, ^s_node), $phys_ptr_cast(L#k, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(k, j2)), ==(*((j2->key)), old(_dryad_S2, *((j2->key))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(SL#j2, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(SL#j2, ^s_node)) == $rd_inv(SL#_dryad_S2, s_node.key, $phys_ptr_cast(SL#j2, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(k, j2)), @_vcc_ptr_eq_pure(*((j2->next)), old(_dryad_S2, *((j2->next))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(SL#j2, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(k, i0)), ==(*((i0->key)), old(_dryad_S2, *((i0->key))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(SL#i0, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)) == $rd_inv(SL#_dryad_S2, s_node.key, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(k, i0)), @_vcc_ptr_eq_pure(*((i0->next)), old(_dryad_S2, *((i0->next))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(SL#i0, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(k, h)), ==(*((h->key)), old(_dryad_S2, *((h->key))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(L#h, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) == $rd_inv(SL#_dryad_S2, s_node.key, $phys_ptr_cast(L#h, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(k, h)), @_vcc_ptr_eq_pure(*((h->next)), old(_dryad_S2, *((h->next))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(L#h, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(k, local.j)), ==(*((local.j->key)), old(_dryad_S2, *((local.j->key))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(local.j, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) == $rd_inv(SL#_dryad_S2, s_node.key, $phys_ptr_cast(local.j, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(k, local.j)), @_vcc_ptr_eq_pure(*((local.j->next)), old(_dryad_S2, *((local.j->next))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(local.j, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(k, local.i)), ==(*((local.i->key)), old(_dryad_S2, *((local.i->key))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(local.i, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) == $rd_inv(SL#_dryad_S2, s_node.key, $phys_ptr_cast(local.i, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(k, local.i)), @_vcc_ptr_eq_pure(*((local.i->next)), old(_dryad_S2, *((local.i->next))))); 
                assume !($phys_ptr_cast(L#k, ^s_node) == $phys_ptr_cast(local.i, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(j2), ==(sll_keys(j2), @_vcc_intset_union(sll_keys(*((j2->next))), @_vcc_intset_singleton(*((j2->key)))))); 
                assume $non_null($phys_ptr_cast(SL#j2, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#j2, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#j2, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(j2), ==(sll_list_len_next(j2), unchecked+(sll_list_len_next(*((j2->next))), 1))); 
                assume $non_null($phys_ptr_cast(SL#j2, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#j2, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(j2), @_vcc_ptr_neq_null(*((j2->next)))), ==(rsrtl(j2), &&(&&(rsrtl(*((j2->next))), unchecked!(@_vcc_oset_in(j2, rsrtl_reach(*((j2->next)))))), >=(*((j2->key)), sll_max_key(*((j2->next))))))); 
                assume $non_null($phys_ptr_cast(SL#j2, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(SL#j2, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#j2, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#j2, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(j2), ==(rsrtl_reach(j2), @_vcc_oset_union(rsrtl_reach(*((j2->next))), @_vcc_oset_singleton(j2)))); 
                assume $non_null($phys_ptr_cast(SL#j2, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(SL#j2, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#j2, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(j2), ==(sll(j2), &&(sll(*((j2->next))), unchecked!(@_vcc_oset_in(j2, sll_reach(*((j2->next)))))))); 
                assume $non_null($phys_ptr_cast(SL#j2, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#j2, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#j2, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(j2), ==(sll_reach(j2), @_vcc_oset_union(sll_reach(*((j2->next))), @_vcc_oset_singleton(j2)))); 
                assume $non_null($phys_ptr_cast(SL#j2, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#j2, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#j2, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(j2), @_vcc_ptr_neq_null(*((j2->next)))), ==(sll_max_key(j2), @\int_max(*((j2->key)), sll_max_key(*((j2->next)))))); 
                assume $non_null($phys_ptr_cast(SL#j2, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(SL#j2, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(SL#j2, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(j2), @_vcc_ptr_neq_null(*((j2->next)))), ==(sll_min_key(j2), @\int_min(*((j2->key)), sll_min_key(*((j2->next)))))); 
                assume $non_null($phys_ptr_cast(SL#j2, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(SL#j2, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(SL#j2, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(j2), @_vcc_ptr_neq_null(*((j2->next)))), ==(srtl(j2), &&(&&(srtl(*((j2->next))), unchecked!(@_vcc_oset_in(j2, srtl_reach(*((j2->next)))))), <=(*((j2->key)), sll_min_key(*((j2->next))))))); 
                assume $non_null($phys_ptr_cast(SL#j2, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(SL#j2, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#j2, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#j2, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(j2), ==(srtl_reach(j2), @_vcc_oset_union(srtl_reach(*((j2->next))), @_vcc_oset_singleton(j2)))); 
                assume $non_null($phys_ptr_cast(SL#j2, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(SL#j2, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#j2, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#j2, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_keys(i0), @_vcc_intset_union(sll_keys(*((i0->next))), @_vcc_intset_singleton(*((i0->key)))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#i0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_list_len_next(i0), unchecked+(sll_list_len_next(*((i0->next))), 1))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#i0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(rsrtl(i0), &&(&&(rsrtl(*((i0->next))), unchecked!(@_vcc_oset_in(i0, rsrtl_reach(*((i0->next)))))), >=(*((i0->key)), sll_max_key(*((i0->next))))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(rsrtl_reach(i0), @_vcc_oset_union(rsrtl_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll(i0), &&(sll(*((i0->next))), unchecked!(@_vcc_oset_in(i0, sll_reach(*((i0->next)))))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_reach(i0), @_vcc_oset_union(sll_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(sll_max_key(i0), @\int_max(*((i0->key)), sll_max_key(*((i0->next)))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(SL#i0, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(sll_min_key(i0), @\int_min(*((i0->key)), sll_min_key(*((i0->next)))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(SL#i0, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(srtl(i0), &&(&&(srtl(*((i0->next))), unchecked!(@_vcc_oset_in(i0, srtl_reach(*((i0->next)))))), <=(*((i0->key)), sll_min_key(*((i0->next))))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(srtl_reach(i0), @_vcc_oset_union(srtl_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_keys(h), @_vcc_intset_union(sll_keys(*((h->next))), @_vcc_intset_singleton(*((h->key)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#h, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_list_len_next(h), unchecked+(sll_list_len_next(*((h->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#h, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(rsrtl(h), &&(&&(rsrtl(*((h->next))), unchecked!(@_vcc_oset_in(h, rsrtl_reach(*((h->next)))))), >=(*((h->key)), sll_max_key(*((h->next))))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#h, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(rsrtl_reach(h), @_vcc_oset_union(rsrtl_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll(h), &&(sll(*((h->next))), unchecked!(@_vcc_oset_in(h, sll_reach(*((h->next)))))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#h, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_reach(h), @_vcc_oset_union(sll_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(sll_max_key(h), @\int_max(*((h->key)), sll_max_key(*((h->next)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#h, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(sll_min_key(h), @\int_min(*((h->key)), sll_min_key(*((h->next)))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#h, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(srtl(h), &&(&&(srtl(*((h->next))), unchecked!(@_vcc_oset_in(h, srtl_reach(*((h->next)))))), <=(*((h->key)), sll_min_key(*((h->next))))))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#h, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(srtl_reach(h), @_vcc_oset_union(srtl_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
                assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_keys(local.j), @_vcc_intset_union(sll_keys(*((local.j->next))), @_vcc_intset_singleton(*((local.j->key)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_list_len_next(local.j), unchecked+(sll_list_len_next(*((local.j->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.j, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(rsrtl(local.j), &&(&&(rsrtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, rsrtl_reach(*((local.j->next)))))), >=(*((local.j->key)), sll_max_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(rsrtl_reach(local.j), @_vcc_oset_union(rsrtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll(local.j), &&(sll(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, sll_reach(*((local.j->next)))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_reach(local.j), @_vcc_oset_union(sll_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_max_key(local.j), @\int_max(*((local.j->key)), sll_max_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_min_key(local.j), @\int_min(*((local.j->key)), sll_min_key(*((local.j->next)))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(srtl(local.j), &&(&&(srtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, srtl_reach(*((local.j->next)))))), <=(*((local.j->key)), sll_min_key(*((local.j->next))))))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.j), ==(srtl_reach(local.j), @_vcc_oset_union(srtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
                assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_keys(local.i), @_vcc_intset_union(sll_keys(*((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_list_len_next(local.i), unchecked+(sll_list_len_next(*((local.i->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(rsrtl(local.i), &&(&&(rsrtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, rsrtl_reach(*((local.i->next)))))), >=(*((local.i->key)), sll_max_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(rsrtl_reach(local.i), @_vcc_oset_union(rsrtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll(local.i), &&(sll(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_reach(*((local.i->next)))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_reach(local.i), @_vcc_oset_union(sll_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_max_key(local.i), @\int_max(*((local.i->key)), sll_max_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_min_key(local.i), @\int_min(*((local.i->key)), sll_min_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(srtl(local.i), &&(&&(srtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_reach(*((local.i->next)))))), <=(*((local.i->key)), sll_min_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(srtl_reach(local.i), @_vcc_oset_union(srtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_keys(k), @_vcc_intset_union(sll_keys(*((k->next))), @_vcc_intset_singleton(*((k->key)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#k, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_list_len_next(k), unchecked+(sll_list_len_next(*((k->next))), 1))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#k, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(rsrtl(k), &&(&&(rsrtl(*((k->next))), unchecked!(@_vcc_oset_in(k, rsrtl_reach(*((k->next)))))), >=(*((k->key)), sll_max_key(*((k->next))))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#k, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(rsrtl_reach(k), @_vcc_oset_union(rsrtl_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll(k), &&(sll(*((k->next))), unchecked!(@_vcc_oset_in(k, sll_reach(*((k->next)))))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#k, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_reach(k), @_vcc_oset_union(sll_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(sll_max_key(k), @\int_max(*((k->key)), sll_max_key(*((k->next)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#k, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(sll_min_key(k), @\int_min(*((k->key)), sll_min_key(*((k->next)))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#k, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(srtl(k), &&(&&(srtl(*((k->next))), unchecked!(@_vcc_oset_in(k, srtl_reach(*((k->next)))))), <=(*((k->key)), sll_min_key(*((k->next))))))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#k, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(k), ==(srtl_reach(k), @_vcc_oset_union(srtl_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
                assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_keys(local.i), @_vcc_intset_union(sll_keys(*((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_list_len_next(local.i), unchecked+(sll_list_len_next(*((local.i->next))), 1))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(rsrtl(local.i), &&(&&(rsrtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, rsrtl_reach(*((local.i->next)))))), >=(*((local.i->key)), sll_max_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(rsrtl_reach(local.i), @_vcc_oset_union(rsrtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll(local.i), &&(sll(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_reach(*((local.i->next)))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_reach(local.i), @_vcc_oset_union(sll_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_max_key(local.i), @\int_max(*((local.i->key)), sll_max_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_min_key(local.i), @\int_min(*((local.i->key)), sll_min_key(*((local.i->next)))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(srtl(local.i), &&(&&(srtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_reach(*((local.i->next)))))), <=(*((local.i->key)), sll_min_key(*((local.i->next))))))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(local.i), ==(srtl_reach(local.i), @_vcc_oset_union(srtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
                assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
            }
        }
        else
        {
          anon7:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // goto #break_2; 
            goto #break_2;
        }

      #continue_2:
        assume true;
    }

  anon10:
    assume $full_stop_ext(#tok$2^22.3, $s);

  #break_2:
    // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_keys(i0), @_vcc_intset_union(sll_keys(*((i0->next))), @_vcc_intset_singleton(*((i0->key)))))); 
    assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#i0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_list_len_next(i0), unchecked+(sll_list_len_next(*((i0->next))), 1))); 
    assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#i0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(rsrtl(i0), &&(&&(rsrtl(*((i0->next))), unchecked!(@_vcc_oset_in(i0, rsrtl_reach(*((i0->next)))))), >=(*((i0->key)), sll_max_key(*((i0->next))))))); 
    assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(i0), ==(rsrtl_reach(i0), @_vcc_oset_union(rsrtl_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
    assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll(i0), &&(sll(*((i0->next))), unchecked!(@_vcc_oset_in(i0, sll_reach(*((i0->next)))))))); 
    assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_reach(i0), @_vcc_oset_union(sll_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
    assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(sll_max_key(i0), @\int_max(*((i0->key)), sll_max_key(*((i0->next)))))); 
    assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(SL#i0, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(sll_min_key(i0), @\int_min(*((i0->key)), sll_min_key(*((i0->next)))))); 
    assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(SL#i0, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(i0), @_vcc_ptr_neq_null(*((i0->next)))), ==(srtl(i0), &&(&&(srtl(*((i0->next))), unchecked!(@_vcc_oset_in(i0, srtl_reach(*((i0->next)))))), <=(*((i0->key)), sll_min_key(*((i0->next))))))); 
    assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(i0), ==(srtl_reach(i0), @_vcc_oset_union(srtl_reach(*((i0->next))), @_vcc_oset_singleton(i0)))); 
    assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#i0, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_keys(h), @_vcc_intset_union(sll_keys(*((h->next))), @_vcc_intset_singleton(*((h->key)))))); 
    assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#h, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_list_len_next(h), unchecked+(sll_list_len_next(*((h->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#h, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(rsrtl(h), &&(&&(rsrtl(*((h->next))), unchecked!(@_vcc_oset_in(h, rsrtl_reach(*((h->next)))))), >=(*((h->key)), sll_max_key(*((h->next))))))); 
    assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#h, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(h), ==(rsrtl_reach(h), @_vcc_oset_union(rsrtl_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
    assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(h), ==(sll(h), &&(sll(*((h->next))), unchecked!(@_vcc_oset_in(h, sll_reach(*((h->next)))))))); 
    assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#h, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_reach(h), @_vcc_oset_union(sll_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
    assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(sll_max_key(h), @\int_max(*((h->key)), sll_max_key(*((h->next)))))); 
    assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#h, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(sll_min_key(h), @\int_min(*((h->key)), sll_min_key(*((h->next)))))); 
    assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#h, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_null(*((h->next)))), ==(srtl(h), &&(&&(srtl(*((h->next))), unchecked!(@_vcc_oset_in(h, srtl_reach(*((h->next)))))), <=(*((h->key)), sll_min_key(*((h->next))))))); 
    assume $non_null($phys_ptr_cast(L#h, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#h, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#h, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#h, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(h), ==(srtl_reach(h), @_vcc_oset_union(srtl_reach(*((h->next))), @_vcc_oset_singleton(h)))); 
    assume $non_null($phys_ptr_cast(L#h, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#h, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#h, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#h, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_keys(k), @_vcc_intset_union(sll_keys(*((k->next))), @_vcc_intset_singleton(*((k->key)))))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#k, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_list_len_next(k), unchecked+(sll_list_len_next(*((k->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#k, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(rsrtl(k), &&(&&(rsrtl(*((k->next))), unchecked!(@_vcc_oset_in(k, rsrtl_reach(*((k->next)))))), >=(*((k->key)), sll_max_key(*((k->next))))))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#k, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(k), ==(rsrtl_reach(k), @_vcc_oset_union(rsrtl_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(k), ==(sll(k), &&(sll(*((k->next))), unchecked!(@_vcc_oset_in(k, sll_reach(*((k->next)))))))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#k, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(k), ==(sll_reach(k), @_vcc_oset_union(sll_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(sll_max_key(k), @\int_max(*((k->key)), sll_max_key(*((k->next)))))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#k, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(sll_min_key(k), @\int_min(*((k->key)), sll_min_key(*((k->next)))))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#k, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(k), @_vcc_ptr_neq_null(*((k->next)))), ==(srtl(k), &&(&&(srtl(*((k->next))), unchecked!(@_vcc_oset_in(k, srtl_reach(*((k->next)))))), <=(*((k->key)), sll_min_key(*((k->next))))))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#k, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#k, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#k, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(k), ==(srtl_reach(k), @_vcc_oset_union(srtl_reach(*((k->next))), @_vcc_oset_singleton(k)))); 
    assume $non_null($phys_ptr_cast(L#k, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#k, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#k, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#k, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_keys(local.j), @_vcc_intset_union(sll_keys(*((local.j->next))), @_vcc_intset_singleton(*((local.j->key)))))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_list_len_next(local.j), unchecked+(sll_list_len_next(*((local.j->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.j, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(rsrtl(local.j), &&(&&(rsrtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, rsrtl_reach(*((local.j->next)))))), >=(*((local.j->key)), sll_max_key(*((local.j->next))))))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.j), ==(rsrtl_reach(local.j), @_vcc_oset_union(rsrtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll(local.j), &&(sll(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, sll_reach(*((local.j->next)))))))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.j), ==(sll_reach(local.j), @_vcc_oset_union(sll_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_max_key(local.j), @\int_max(*((local.j->key)), sll_max_key(*((local.j->next)))))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(sll_min_key(local.j), @\int_min(*((local.j->key)), sll_min_key(*((local.j->next)))))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.j, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.j), @_vcc_ptr_neq_null(*((local.j->next)))), ==(srtl(local.j), &&(&&(srtl(*((local.j->next))), unchecked!(@_vcc_oset_in(local.j, srtl_reach(*((local.j->next)))))), <=(*((local.j->key)), sll_min_key(*((local.j->next))))))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.j, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.j, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.j, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.j), ==(srtl_reach(local.j), @_vcc_oset_union(srtl_reach(*((local.j->next))), @_vcc_oset_singleton(local.j)))); 
    assume $non_null($phys_ptr_cast(local.j, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.j, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.j, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.j, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_keys(local.i), @_vcc_intset_union(sll_keys(*((local.i->next))), @_vcc_intset_singleton(*((local.i->key)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_list_len_next(local.i), unchecked+(sll_list_len_next(*((local.i->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.i, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(rsrtl(local.i), &&(&&(rsrtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, rsrtl_reach(*((local.i->next)))))), >=(*((local.i->key)), sll_max_key(*((local.i->next))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(rsrtl_reach(local.i), @_vcc_oset_union(rsrtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll(local.i), &&(sll(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, sll_reach(*((local.i->next)))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(sll_reach(local.i), @_vcc_oset_union(sll_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_max_key(local.i), @\int_max(*((local.i->key)), sll_max_key(*((local.i->next)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(sll_min_key(local.i), @\int_min(*((local.i->key)), sll_min_key(*((local.i->next)))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.i, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.i), @_vcc_ptr_neq_null(*((local.i->next)))), ==(srtl(local.i), &&(&&(srtl(*((local.i->next))), unchecked!(@_vcc_oset_in(local.i, srtl_reach(*((local.i->next)))))), <=(*((local.i->key)), sll_min_key(*((local.i->next))))))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.i, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.i, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.i, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.i), ==(srtl_reach(local.i), @_vcc_oset_union(srtl_reach(*((local.i->next))), @_vcc_oset_singleton(local.i)))); 
    assume $non_null($phys_ptr_cast(local.i, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.i, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.i, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.i, ^s_node)));
    // return h; 
    $result := $phys_ptr_cast(L#h, ^s_node);
    assume true;
    assert $position_marker();
    goto #exit;

  anon11:
    // skip

  #exit:
}



axiom (forall Q#__vcc_state$1^687.9#tc2#1656: $state, Q#x$1^687.9#dt1#1619: $ptr :: {:weight 10} { F#srtl(Q#__vcc_state$1^687.9#tc2#1656, $phys_ptr_cast(Q#x$1^687.9#dt1#1619, ^s_node)) } { F#sll(Q#__vcc_state$1^687.9#tc2#1656, $phys_ptr_cast(Q#x$1^687.9#dt1#1619, ^s_node)) } $good_state(Q#__vcc_state$1^687.9#tc2#1656) && true ==> F#srtl(Q#__vcc_state$1^687.9#tc2#1656, $phys_ptr_cast(Q#x$1^687.9#dt1#1619, ^s_node)) ==> F#sll(Q#__vcc_state$1^687.9#tc2#1656, $phys_ptr_cast(Q#x$1^687.9#dt1#1619, ^s_node)));

axiom (forall Q#__vcc_state$1^688.9#tc2#1657: $state, Q#x$1^688.9#dt1#1620: $ptr :: {:weight 10} { F#rsrtl(Q#__vcc_state$1^688.9#tc2#1657, $phys_ptr_cast(Q#x$1^688.9#dt1#1620, ^s_node)) } { F#sll(Q#__vcc_state$1^688.9#tc2#1657, $phys_ptr_cast(Q#x$1^688.9#dt1#1620, ^s_node)) } $good_state(Q#__vcc_state$1^688.9#tc2#1657) && true ==> F#rsrtl(Q#__vcc_state$1^688.9#tc2#1657, $phys_ptr_cast(Q#x$1^688.9#dt1#1620, ^s_node)) ==> F#sll(Q#__vcc_state$1^688.9#tc2#1657, $phys_ptr_cast(Q#x$1^688.9#dt1#1620, ^s_node)));

axiom (forall Q#__vcc_state$1^689.9#tc2#1658: $state, Q#x$1^689.9#dt1#1621: $ptr :: {:weight 10} { F#sll_reach(Q#__vcc_state$1^689.9#tc2#1658, $phys_ptr_cast(Q#x$1^689.9#dt1#1621, ^s_node)) } { F#srtl_reach(Q#__vcc_state$1^689.9#tc2#1658, $phys_ptr_cast(Q#x$1^689.9#dt1#1621, ^s_node)) } $good_state(Q#__vcc_state$1^689.9#tc2#1658) && true ==> F#sll_reach(Q#__vcc_state$1^689.9#tc2#1658, $phys_ptr_cast(Q#x$1^689.9#dt1#1621, ^s_node)) == F#srtl_reach(Q#__vcc_state$1^689.9#tc2#1658, $phys_ptr_cast(Q#x$1^689.9#dt1#1621, ^s_node)));

axiom (forall Q#__vcc_state$1^690.9#tc2#1659: $state, Q#x$1^690.9#dt1#1622: $ptr :: {:weight 10} { F#srtl_reach(Q#__vcc_state$1^690.9#tc2#1659, $phys_ptr_cast(Q#x$1^690.9#dt1#1622, ^s_node)) } { F#rsrtl_reach(Q#__vcc_state$1^690.9#tc2#1659, $phys_ptr_cast(Q#x$1^690.9#dt1#1622, ^s_node)) } $good_state(Q#__vcc_state$1^690.9#tc2#1659) && true ==> F#srtl_reach(Q#__vcc_state$1^690.9#tc2#1659, $phys_ptr_cast(Q#x$1^690.9#dt1#1622, ^s_node)) == F#rsrtl_reach(Q#__vcc_state$1^690.9#tc2#1659, $phys_ptr_cast(Q#x$1^690.9#dt1#1622, ^s_node)));

axiom (forall Q#__vcc_state$1^691.9#tc2#1660: $state, Q#x$1^691.9#dt1#1623: $ptr, Q#y$1^691.9#dt1#1624: $ptr :: {:weight 10} { F#sll_lseg_reach(Q#__vcc_state$1^691.9#tc2#1660, $phys_ptr_cast(Q#x$1^691.9#dt1#1623, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1624, ^s_node)) } { F#srtl_lseg_reach(Q#__vcc_state$1^691.9#tc2#1660, $phys_ptr_cast(Q#x$1^691.9#dt1#1623, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1624, ^s_node)) } $good_state(Q#__vcc_state$1^691.9#tc2#1660) && true ==> F#sll_lseg_reach(Q#__vcc_state$1^691.9#tc2#1660, $phys_ptr_cast(Q#x$1^691.9#dt1#1623, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1624, ^s_node)) == F#srtl_lseg_reach(Q#__vcc_state$1^691.9#tc2#1660, $phys_ptr_cast(Q#x$1^691.9#dt1#1623, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1624, ^s_node)));

const unique l#public: $label;

axiom $type_code_is(2, ^$#state_t);

const unique #tok$2^55.7: $token;

const unique #tok$2^51.7: $token;

const unique #tok$2^22.3: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^3.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cafwp?5CSLL?2Dmerge.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cafwp?5CSLL?2Dmerge.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cafwp?5Cdryad_SRTL.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cafwp?5Cdryad_SRTL.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^s_node);
