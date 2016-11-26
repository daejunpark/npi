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

const unique ^$#sls_remove.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#sls_remove.c..36263#3);

type $#sls_remove.c..36263#3;

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



procedure sls_remove(P#lst: $ptr, P#value: int) returns ($result: $ptr);
  requires F#srtl($s, $phys_ptr_cast(P#lst, ^s_node));
  modifies $s, $cev_pc;
  ensures F#srtl($s, $phys_ptr_cast($result, ^s_node));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation sls_remove(P#lst: $ptr, P#value: int) returns ($result: $ptr)
{
  var stmtexpr1#10: $state;
  var _dryad_S1#3: $state;
  var stmtexpr0#9: $state;
  var _dryad_S0#2: $state;
  var stmtexpr2#8: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr1#7: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr0#6: $ptr;
  var curr0#1: $ptr;
  var L#curr_next: $ptr;
  var stmtexpr0#5: $ptr;
  var curr0#0: $ptr;
  var ite#2: bool;
  var stmtexpr0#4: $ptr;
  var SL#curr0: $ptr;
  var ite#1: bool;
  var loopState#0: $state;
  var L#curr: $ptr;
  var L#prv: $ptr;
  var stmtexpr1#12: $oset;
  var stmtexpr0#11: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var local.lst: $ptr;
  var #wrTime$2^3.3: int;
  var #stackframe: int;

  anon14:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$2^3.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$2^3.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$2^3.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @in_range_i4(value); 
    assume $in_range_i4(P#value);
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    // struct s_node* local.lst; 
    // local.lst := lst; 
    local.lst := $phys_ptr_cast(P#lst, ^s_node);
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := srtl_reach(local.lst); 
    call SL#_dryad_G0 := srtl_reach($phys_ptr_cast(local.lst, ^s_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _math \oset stmtexpr0#11; 
    // stmtexpr0#11 := _dryad_G0; 
    stmtexpr0#11 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#12; 
    // stmtexpr1#12 := _dryad_G1; 
    stmtexpr1#12 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_keys(local.lst), @_vcc_intset_union(sll_keys(*((local.lst->next))), @_vcc_intset_singleton(*((local.lst->key)))))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.lst, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_list_len_next(local.lst), unchecked+(sll_list_len_next(*((local.lst->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.lst, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(rsrtl(local.lst), &&(&&(rsrtl(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, rsrtl_reach(*((local.lst->next)))))), >=(*((local.lst->key)), sll_max_key(*((local.lst->next))))))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(rsrtl_reach(local.lst), @_vcc_oset_union(rsrtl_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll(local.lst), &&(sll(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, sll_reach(*((local.lst->next)))))))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_reach(local.lst), @_vcc_oset_union(sll_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(sll_max_key(local.lst), @\int_max(*((local.lst->key)), sll_max_key(*((local.lst->next)))))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.lst, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(sll_min_key(local.lst), @\int_min(*((local.lst->key)), sll_min_key(*((local.lst->next)))))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.lst, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(srtl(local.lst), &&(&&(srtl(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, srtl_reach(*((local.lst->next)))))), <=(*((local.lst->key)), sll_min_key(*((local.lst->next))))))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(srtl_reach(local.lst), @_vcc_oset_union(srtl_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
    // struct s_node* prv; 
    // struct s_node* curr; 
    // assume ==>(@_vcc_ptr_neq_null(local.lst), &&(@_vcc_mutable(@state, local.lst), @writes_check(local.lst))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.lst, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.lst, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(local.lst), @_vcc_is_malloc_root(@state, local.lst)); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> $is_malloc_root($s, $phys_ptr_cast(local.lst, ^s_node));
    // curr := local.lst; 
    L#curr := $phys_ptr_cast(local.lst, ^s_node);
    // assert sll_lseg(curr, curr); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
    // assume sll_lseg(curr, curr); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
    // assert srtl_lseg(curr, curr); 
    assert F#srtl_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
    // assume srtl_lseg(curr, curr); 
    assume F#srtl_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
    // assert sll_lseg(prv, prv); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#prv, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
    // assume sll_lseg(prv, prv); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#prv, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
    // assert srtl_lseg(prv, prv); 
    assert F#srtl_lseg($s, $phys_ptr_cast(L#prv, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
    // assume srtl_lseg(prv, prv); 
    assume F#srtl_lseg($s, $phys_ptr_cast(L#prv, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
    // assert sll_lseg(local.lst, local.lst); 
    assert F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
    // assume sll_lseg(local.lst, local.lst); 
    assume F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
    // assert srtl_lseg(local.lst, local.lst); 
    assert F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
    // assume srtl_lseg(local.lst, local.lst); 
    assume F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
    // prv := (struct s_node*)@null; 
    L#prv := $phys_ptr_cast($null, ^s_node);
    // assert sll_lseg(curr, curr); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
    // assume sll_lseg(curr, curr); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
    // assert srtl_lseg(curr, curr); 
    assert F#srtl_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
    // assume srtl_lseg(curr, curr); 
    assume F#srtl_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
    // assert sll_lseg(prv, prv); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#prv, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
    // assume sll_lseg(prv, prv); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#prv, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
    // assert srtl_lseg(prv, prv); 
    assert F#srtl_lseg($s, $phys_ptr_cast(L#prv, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
    // assume srtl_lseg(prv, prv); 
    assume F#srtl_lseg($s, $phys_ptr_cast(L#prv, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
    // assert sll_lseg(local.lst, local.lst); 
    assert F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
    // assume sll_lseg(local.lst, local.lst); 
    assume F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
    // assert srtl_lseg(local.lst, local.lst); 
    assert F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
    // assume srtl_lseg(local.lst, local.lst); 
    assume F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_keys(prv), @_vcc_intset_union(sll_keys(*((prv->next))), @_vcc_intset_singleton(*((prv->key)))))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prv, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_list_len_next(prv), unchecked+(sll_list_len_next(*((prv->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prv, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(rsrtl(prv), &&(&&(rsrtl(*((prv->next))), unchecked!(@_vcc_oset_in(prv, rsrtl_reach(*((prv->next)))))), >=(*((prv->key)), sll_max_key(*((prv->next))))))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(rsrtl_reach(prv), @_vcc_oset_union(rsrtl_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll(prv), &&(sll(*((prv->next))), unchecked!(@_vcc_oset_in(prv, sll_reach(*((prv->next)))))))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_reach(prv), @_vcc_oset_union(sll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(sll_max_key(prv), @\int_max(*((prv->key)), sll_max_key(*((prv->next)))))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#prv, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(sll_min_key(prv), @\int_min(*((prv->key)), sll_min_key(*((prv->next)))))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#prv, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(srtl(prv), &&(&&(srtl(*((prv->next))), unchecked!(@_vcc_oset_in(prv, srtl_reach(*((prv->next)))))), <=(*((prv->key)), sll_min_key(*((prv->next))))))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(srtl_reach(prv), @_vcc_oset_union(srtl_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
    loopState#0 := $s;
    assume true;
    while (true)
      invariant F#srtl($s, $phys_ptr_cast(local.lst, ^s_node));
      invariant F#srtl($s, $phys_ptr_cast(L#curr, ^s_node));
      invariant F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
      invariant $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node) == $phys_ptr_cast(L#curr, ^s_node);
      invariant $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)));
      invariant $oset_disjoint(F#srtl_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)), F#srtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)));
      invariant F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
      invariant $oset_disjoint(F#srtl_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)), F#srtl_reach($s, $phys_ptr_cast(L#prv, ^s_node)));
      invariant $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)) <= $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node));
      invariant $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^s_node));
      invariant $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#curr, ^s_node));
      invariant $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $is_malloc_root($s, $phys_ptr_cast(L#curr, ^s_node));
    {
      anon5:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#0, $s);
        assume $full_stop_ext(#tok$2^12.3, $s);
        // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
        assume $meta_eq(loopState#0, $s);
        // _Bool ite#1; 
        assume true;
        // if (@_vcc_ptr_neq_null(curr)) ...
        if ($non_null($phys_ptr_cast(L#curr, ^s_node)))
        {
          anon1:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // assert @reads_check_normal((curr->key)); 
            assert $thread_local($s, $phys_ptr_cast(L#curr, ^s_node));
            // ite#1 := <(*((curr->key)), value); 
            ite#1 := $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) < P#value;
        }
        else
        {
          anon2:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // ite#1 := false; 
            ite#1 := false;
        }

      anon6:
        assume true;
        // if (ite#1) ...
        if (ite#1)
        {
          anon3:
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_list_len_next(curr), unchecked+(sll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(rsrtl(curr), &&(&&(rsrtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, rsrtl_reach(*((curr->next)))))), >=(*((curr->key)), sll_max_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(rsrtl_reach(curr), @_vcc_oset_union(rsrtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union(sll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_max_key(curr), @\int_max(*((curr->key)), sll_max_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_min_key(curr), @\int_min(*((curr->key)), sll_min_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(srtl(curr), &&(&&(srtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, srtl_reach(*((curr->next)))))), <=(*((curr->key)), sll_min_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(srtl_reach(curr), @_vcc_oset_union(srtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_keys(prv), @_vcc_intset_union(sll_keys(*((prv->next))), @_vcc_intset_singleton(*((prv->key)))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prv, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_list_len_next(prv), unchecked+(sll_list_len_next(*((prv->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prv, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(rsrtl(prv), &&(&&(rsrtl(*((prv->next))), unchecked!(@_vcc_oset_in(prv, rsrtl_reach(*((prv->next)))))), >=(*((prv->key)), sll_max_key(*((prv->next))))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(rsrtl_reach(prv), @_vcc_oset_union(rsrtl_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll(prv), &&(sll(*((prv->next))), unchecked!(@_vcc_oset_in(prv, sll_reach(*((prv->next)))))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_reach(prv), @_vcc_oset_union(sll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(sll_max_key(prv), @\int_max(*((prv->key)), sll_max_key(*((prv->next)))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#prv, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(sll_min_key(prv), @\int_min(*((prv->key)), sll_min_key(*((prv->next)))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#prv, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(srtl(prv), &&(&&(srtl(*((prv->next))), unchecked!(@_vcc_oset_in(prv, srtl_reach(*((prv->next)))))), <=(*((prv->key)), sll_min_key(*((prv->next))))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(srtl_reach(prv), @_vcc_oset_union(srtl_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_keys(local.lst), @_vcc_intset_union(sll_keys(*((local.lst->next))), @_vcc_intset_singleton(*((local.lst->key)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.lst, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_list_len_next(local.lst), unchecked+(sll_list_len_next(*((local.lst->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.lst, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(rsrtl(local.lst), &&(&&(rsrtl(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, rsrtl_reach(*((local.lst->next)))))), >=(*((local.lst->key)), sll_max_key(*((local.lst->next))))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(rsrtl_reach(local.lst), @_vcc_oset_union(rsrtl_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll(local.lst), &&(sll(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, sll_reach(*((local.lst->next)))))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_reach(local.lst), @_vcc_oset_union(sll_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(sll_max_key(local.lst), @\int_max(*((local.lst->key)), sll_max_key(*((local.lst->next)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.lst, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(sll_min_key(local.lst), @\int_min(*((local.lst->key)), sll_min_key(*((local.lst->next)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.lst, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(srtl(local.lst), &&(&&(srtl(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, srtl_reach(*((local.lst->next)))))), <=(*((local.lst->key)), sll_min_key(*((local.lst->next))))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(srtl_reach(local.lst), @_vcc_oset_union(srtl_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), ==(sll_lseg(local.lst, prv), &&(sll_lseg(*((local.lst->next)), prv), unchecked!(@_vcc_oset_in(local.lst, sll_lseg_reach(*((local.lst->next)), prv)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), ==(sll_lseg_reach(local.lst, prv), @_vcc_oset_union(sll_lseg_reach(*((local.lst->next)), prv), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), ==(sll_lseg_keys(local.lst, prv), @_vcc_intset_union(sll_lseg_keys(*((local.lst->next)), prv), @_vcc_intset_singleton(*((local.lst->key)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), ==(sll_lseg_len_next(local.lst, prv), unchecked+(sll_lseg_len_next(*((local.lst->next)), prv), 1))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)), 1);
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), @_vcc_ptr_neq_pure(*((local.lst->next)), prv)), ==(sll_lseg_max_key(local.lst, prv), @\int_max(*((local.lst->key)), sll_lseg_max_key(*((local.lst->next)), prv)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), @_vcc_ptr_neq_pure(*((local.lst->next)), prv)), ==(sll_lseg_min_key(local.lst, prv), @\int_min(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), prv)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), @_vcc_ptr_neq_pure(*((local.lst->next)), prv)), ==(srtl_lseg(local.lst, prv), &&(&&(srtl_lseg(*((local.lst->next)), prv), unchecked!(@_vcc_oset_in(local.lst, srtl_lseg_reach(*((local.lst->next)), prv)))), <=(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), prv))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), ==(srtl_lseg_reach(local.lst, prv), @_vcc_oset_union(srtl_lseg_reach(*((local.lst->next)), prv), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg(local.lst, curr), &&(sll_lseg(*((local.lst->next)), curr), unchecked!(@_vcc_oset_in(local.lst, sll_lseg_reach(*((local.lst->next)), curr)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_reach(local.lst, curr), @_vcc_oset_union(sll_lseg_reach(*((local.lst->next)), curr), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_keys(local.lst, curr), @_vcc_intset_union(sll_lseg_keys(*((local.lst->next)), curr), @_vcc_intset_singleton(*((local.lst->key)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_len_next(local.lst, curr), unchecked+(sll_lseg_len_next(*((local.lst->next)), curr), 1))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), 1);
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(sll_lseg_max_key(local.lst, curr), @\int_max(*((local.lst->key)), sll_lseg_max_key(*((local.lst->next)), curr)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(sll_lseg_min_key(local.lst, curr), @\int_min(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), curr)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(srtl_lseg(local.lst, curr), &&(&&(srtl_lseg(*((local.lst->next)), curr), unchecked!(@_vcc_oset_in(local.lst, srtl_lseg_reach(*((local.lst->next)), curr)))), <=(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), curr))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(srtl_lseg_reach(local.lst, curr), @_vcc_oset_union(srtl_lseg_reach(*((local.lst->next)), curr), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // prv := curr; 
            L#prv := $phys_ptr_cast(L#curr, ^s_node);
            // assert sll_lseg(curr, curr); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume sll_lseg(curr, curr); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assert srtl_lseg(curr, curr); 
            assert F#srtl_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume srtl_lseg(curr, curr); 
            assume F#srtl_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assert sll_lseg(prv, prv); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#prv, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
            // assume sll_lseg(prv, prv); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#prv, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
            // assert srtl_lseg(prv, prv); 
            assert F#srtl_lseg($s, $phys_ptr_cast(L#prv, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
            // assume srtl_lseg(prv, prv); 
            assume F#srtl_lseg($s, $phys_ptr_cast(L#prv, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
            // assert sll_lseg(local.lst, local.lst); 
            assert F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
            // assume sll_lseg(local.lst, local.lst); 
            assume F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
            // assert srtl_lseg(local.lst, local.lst); 
            assert F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
            // assume srtl_lseg(local.lst, local.lst); 
            assume F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
            // struct s_node* curr0; 
            // curr0 := curr; 
            SL#curr0 := $phys_ptr_cast(L#curr, ^s_node);
            // struct s_node* stmtexpr0#4; 
            // stmtexpr0#4 := curr0; 
            stmtexpr0#4 := $phys_ptr_cast(SL#curr0, ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_list_len_next(curr), unchecked+(sll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(rsrtl(curr), &&(&&(rsrtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, rsrtl_reach(*((curr->next)))))), >=(*((curr->key)), sll_max_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(rsrtl_reach(curr), @_vcc_oset_union(rsrtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union(sll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_max_key(curr), @\int_max(*((curr->key)), sll_max_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_min_key(curr), @\int_min(*((curr->key)), sll_min_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(srtl(curr), &&(&&(srtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, srtl_reach(*((curr->next)))))), <=(*((curr->key)), sll_min_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(srtl_reach(curr), @_vcc_oset_union(srtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_pure(curr, *((curr->next)))), ==(sll_lseg(curr, *((curr->next))), &&(sll_lseg(*((curr->next)), *((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_lseg_reach(*((curr->next)), *((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $phys_ptr_cast(L#curr, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_pure(curr, *((curr->next)))), ==(sll_lseg_reach(curr, *((curr->next))), @_vcc_oset_union(sll_lseg_reach(*((curr->next)), *((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $phys_ptr_cast(L#curr, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#curr, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_pure(curr, *((curr->next)))), ==(sll_lseg_keys(curr, *((curr->next))), @_vcc_intset_union(sll_lseg_keys(*((curr->next)), *((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $phys_ptr_cast(L#curr, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#curr, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_pure(curr, *((curr->next)))), ==(sll_lseg_len_next(curr, *((curr->next))), unchecked+(sll_lseg_len_next(*((curr->next)), *((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $phys_ptr_cast(L#curr, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(L#curr, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), 1);
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_pure(curr, *((curr->next)))), @_vcc_ptr_neq_pure(*((curr->next)), *((curr->next)))), ==(sll_lseg_max_key(curr, *((curr->next))), @\int_max(*((curr->key)), sll_lseg_max_key(*((curr->next)), *((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $phys_ptr_cast(L#curr, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(L#curr, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_pure(curr, *((curr->next)))), @_vcc_ptr_neq_pure(*((curr->next)), *((curr->next)))), ==(sll_lseg_min_key(curr, *((curr->next))), @\int_min(*((curr->key)), sll_lseg_min_key(*((curr->next)), *((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $phys_ptr_cast(L#curr, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(L#curr, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_pure(curr, *((curr->next)))), @_vcc_ptr_neq_pure(*((curr->next)), *((curr->next)))), ==(srtl_lseg(curr, *((curr->next))), &&(&&(srtl_lseg(*((curr->next)), *((curr->next))), unchecked!(@_vcc_oset_in(curr, srtl_lseg_reach(*((curr->next)), *((curr->next)))))), <=(*((curr->key)), sll_lseg_min_key(*((curr->next)), *((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $phys_ptr_cast(L#curr, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_pure(curr, *((curr->next)))), ==(srtl_lseg_reach(curr, *((curr->next))), @_vcc_oset_union(srtl_lseg_reach(*((curr->next)), *((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $phys_ptr_cast(L#curr, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(L#curr, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assert @reads_check_normal((curr->next)); 
            assert $thread_local($s, $phys_ptr_cast(L#curr, ^s_node));
            // curr := *((curr->next)); 
            L#curr := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_list_len_next(curr), unchecked+(sll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(rsrtl(curr), &&(&&(rsrtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, rsrtl_reach(*((curr->next)))))), >=(*((curr->key)), sll_max_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(rsrtl_reach(curr), @_vcc_oset_union(rsrtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union(sll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_max_key(curr), @\int_max(*((curr->key)), sll_max_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_min_key(curr), @\int_min(*((curr->key)), sll_min_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(srtl(curr), &&(&&(srtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, srtl_reach(*((curr->next)))))), <=(*((curr->key)), sll_min_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(srtl_reach(curr), @_vcc_oset_union(srtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_list_len_next(curr), unchecked+(sll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(rsrtl(curr), &&(&&(rsrtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, rsrtl_reach(*((curr->next)))))), >=(*((curr->key)), sll_max_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(rsrtl_reach(curr), @_vcc_oset_union(rsrtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union(sll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_max_key(curr), @\int_max(*((curr->key)), sll_max_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_min_key(curr), @\int_min(*((curr->key)), sll_min_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(srtl(curr), &&(&&(srtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, srtl_reach(*((curr->next)))))), <=(*((curr->key)), sll_min_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(srtl_reach(curr), @_vcc_oset_union(srtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg(local.lst, curr), &&(sll_lseg(*((local.lst->next)), curr), unchecked!(@_vcc_oset_in(local.lst, sll_lseg_reach(*((local.lst->next)), curr)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_reach(local.lst, curr), @_vcc_oset_union(sll_lseg_reach(*((local.lst->next)), curr), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_keys(local.lst, curr), @_vcc_intset_union(sll_lseg_keys(*((local.lst->next)), curr), @_vcc_intset_singleton(*((local.lst->key)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_len_next(local.lst, curr), unchecked+(sll_lseg_len_next(*((local.lst->next)), curr), 1))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), 1);
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(sll_lseg_max_key(local.lst, curr), @\int_max(*((local.lst->key)), sll_lseg_max_key(*((local.lst->next)), curr)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(sll_lseg_min_key(local.lst, curr), @\int_min(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), curr)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(srtl_lseg(local.lst, curr), &&(&&(srtl_lseg(*((local.lst->next)), curr), unchecked!(@_vcc_oset_in(local.lst, srtl_lseg_reach(*((local.lst->next)), curr)))), <=(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), curr))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(srtl_lseg_reach(local.lst, curr), @_vcc_oset_union(srtl_lseg_reach(*((local.lst->next)), curr), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), &&(@_vcc_mutable(@state, curr), @writes_check(curr))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(curr), @_vcc_is_malloc_root(@state, curr)); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $is_malloc_root($s, $phys_ptr_cast(L#curr, ^s_node));
        }
        else
        {
          anon4:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // goto #break_3; 
            goto #break_3;
        }

      #continue_3:
        assume true;
    }

  anon15:
    assume $full_stop_ext(#tok$2^12.3, $s);

  #break_3:
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
    assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_list_len_next(curr), unchecked+(sll_list_len_next(*((curr->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(rsrtl(curr), &&(&&(rsrtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, rsrtl_reach(*((curr->next)))))), >=(*((curr->key)), sll_max_key(*((curr->next))))))); 
    assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(rsrtl_reach(curr), @_vcc_oset_union(rsrtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
    assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
    assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union(sll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
    assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_max_key(curr), @\int_max(*((curr->key)), sll_max_key(*((curr->next)))))); 
    assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_min_key(curr), @\int_min(*((curr->key)), sll_min_key(*((curr->next)))))); 
    assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(srtl(curr), &&(&&(srtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, srtl_reach(*((curr->next)))))), <=(*((curr->key)), sll_min_key(*((curr->next))))))); 
    assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(srtl_reach(curr), @_vcc_oset_union(srtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
    assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_keys(prv), @_vcc_intset_union(sll_keys(*((prv->next))), @_vcc_intset_singleton(*((prv->key)))))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prv, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_list_len_next(prv), unchecked+(sll_list_len_next(*((prv->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prv, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(rsrtl(prv), &&(&&(rsrtl(*((prv->next))), unchecked!(@_vcc_oset_in(prv, rsrtl_reach(*((prv->next)))))), >=(*((prv->key)), sll_max_key(*((prv->next))))))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(rsrtl_reach(prv), @_vcc_oset_union(rsrtl_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll(prv), &&(sll(*((prv->next))), unchecked!(@_vcc_oset_in(prv, sll_reach(*((prv->next)))))))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_reach(prv), @_vcc_oset_union(sll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(sll_max_key(prv), @\int_max(*((prv->key)), sll_max_key(*((prv->next)))))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#prv, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(sll_min_key(prv), @\int_min(*((prv->key)), sll_min_key(*((prv->next)))))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#prv, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(srtl(prv), &&(&&(srtl(*((prv->next))), unchecked!(@_vcc_oset_in(prv, srtl_reach(*((prv->next)))))), <=(*((prv->key)), sll_min_key(*((prv->next))))))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(prv), ==(srtl_reach(prv), @_vcc_oset_union(srtl_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
    assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_keys(local.lst), @_vcc_intset_union(sll_keys(*((local.lst->next))), @_vcc_intset_singleton(*((local.lst->key)))))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.lst, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_list_len_next(local.lst), unchecked+(sll_list_len_next(*((local.lst->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.lst, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(rsrtl(local.lst), &&(&&(rsrtl(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, rsrtl_reach(*((local.lst->next)))))), >=(*((local.lst->key)), sll_max_key(*((local.lst->next))))))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(rsrtl_reach(local.lst), @_vcc_oset_union(rsrtl_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll(local.lst), &&(sll(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, sll_reach(*((local.lst->next)))))))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_reach(local.lst), @_vcc_oset_union(sll_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(sll_max_key(local.lst), @\int_max(*((local.lst->key)), sll_max_key(*((local.lst->next)))))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.lst, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(sll_min_key(local.lst), @\int_min(*((local.lst->key)), sll_min_key(*((local.lst->next)))))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.lst, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(srtl(local.lst), &&(&&(srtl(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, srtl_reach(*((local.lst->next)))))), <=(*((local.lst->key)), sll_min_key(*((local.lst->next))))))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(srtl_reach(local.lst), @_vcc_oset_union(srtl_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
    // _Bool ite#2; 
    assume true;
    // if (@_vcc_ptr_neq_null(curr)) ...
    if ($non_null($phys_ptr_cast(L#curr, ^s_node)))
    {
      anon7:
        // assert @_vcc_possibly_unreachable; 
        assert {:PossiblyUnreachable true} true;
        // assert @reads_check_normal((curr->key)); 
        assert $thread_local($s, $phys_ptr_cast(L#curr, ^s_node));
        // ite#2 := ==(*((curr->key)), value); 
        ite#2 := $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) == P#value;
    }
    else
    {
      anon8:
        // assert @_vcc_possibly_unreachable; 
        assert {:PossiblyUnreachable true} true;
        // ite#2 := false; 
        ite#2 := false;
    }

  anon16:
    assume true;
    // if (ite#2) ...
    if (ite#2)
    {
      anon11:
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_list_len_next(curr), unchecked+(sll_list_len_next(*((curr->next))), 1))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(rsrtl(curr), &&(&&(rsrtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, rsrtl_reach(*((curr->next)))))), >=(*((curr->key)), sll_max_key(*((curr->next))))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(rsrtl_reach(curr), @_vcc_oset_union(rsrtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union(sll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_max_key(curr), @\int_max(*((curr->key)), sll_max_key(*((curr->next)))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_min_key(curr), @\int_min(*((curr->key)), sll_min_key(*((curr->next)))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(srtl(curr), &&(&&(srtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, srtl_reach(*((curr->next)))))), <=(*((curr->key)), sll_min_key(*((curr->next))))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(srtl_reach(curr), @_vcc_oset_union(srtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_keys(prv), @_vcc_intset_union(sll_keys(*((prv->next))), @_vcc_intset_singleton(*((prv->key)))))); 
        assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prv, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_list_len_next(prv), unchecked+(sll_list_len_next(*((prv->next))), 1))); 
        assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prv, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(rsrtl(prv), &&(&&(rsrtl(*((prv->next))), unchecked!(@_vcc_oset_in(prv, rsrtl_reach(*((prv->next)))))), >=(*((prv->key)), sll_max_key(*((prv->next))))))); 
        assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(prv), ==(rsrtl_reach(prv), @_vcc_oset_union(rsrtl_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
        assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll(prv), &&(sll(*((prv->next))), unchecked!(@_vcc_oset_in(prv, sll_reach(*((prv->next)))))))); 
        assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_reach(prv), @_vcc_oset_union(sll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
        assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(sll_max_key(prv), @\int_max(*((prv->key)), sll_max_key(*((prv->next)))))); 
        assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#prv, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(sll_min_key(prv), @\int_min(*((prv->key)), sll_min_key(*((prv->next)))))); 
        assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#prv, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(srtl(prv), &&(&&(srtl(*((prv->next))), unchecked!(@_vcc_oset_in(prv, srtl_reach(*((prv->next)))))), <=(*((prv->key)), sll_min_key(*((prv->next))))))); 
        assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(prv), ==(srtl_reach(prv), @_vcc_oset_union(srtl_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
        assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_keys(local.lst), @_vcc_intset_union(sll_keys(*((local.lst->next))), @_vcc_intset_singleton(*((local.lst->key)))))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.lst, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_list_len_next(local.lst), unchecked+(sll_list_len_next(*((local.lst->next))), 1))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.lst, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(rsrtl(local.lst), &&(&&(rsrtl(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, rsrtl_reach(*((local.lst->next)))))), >=(*((local.lst->key)), sll_max_key(*((local.lst->next))))))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(rsrtl_reach(local.lst), @_vcc_oset_union(rsrtl_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll(local.lst), &&(sll(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, sll_reach(*((local.lst->next)))))))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_reach(local.lst), @_vcc_oset_union(sll_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(sll_max_key(local.lst), @\int_max(*((local.lst->key)), sll_max_key(*((local.lst->next)))))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.lst, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(sll_min_key(local.lst), @\int_min(*((local.lst->key)), sll_min_key(*((local.lst->next)))))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.lst, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(srtl(local.lst), &&(&&(srtl(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, srtl_reach(*((local.lst->next)))))), <=(*((local.lst->key)), sll_min_key(*((local.lst->next))))))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(srtl_reach(local.lst), @_vcc_oset_union(srtl_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), ==(sll_lseg(local.lst, prv), &&(sll_lseg(*((local.lst->next)), prv), unchecked!(@_vcc_oset_in(local.lst, sll_lseg_reach(*((local.lst->next)), prv)))))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node))));
        // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), ==(sll_lseg_reach(local.lst, prv), @_vcc_oset_union(sll_lseg_reach(*((local.lst->next)), prv), @_vcc_oset_singleton(local.lst)))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), ==(sll_lseg_keys(local.lst, prv), @_vcc_intset_union(sll_lseg_keys(*((local.lst->next)), prv), @_vcc_intset_singleton(*((local.lst->key)))))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
        // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), ==(sll_lseg_len_next(local.lst, prv), unchecked+(sll_lseg_len_next(*((local.lst->next)), prv), 1))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)), 1);
        // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), @_vcc_ptr_neq_pure(*((local.lst->next)), prv)), ==(sll_lseg_max_key(local.lst, prv), @\int_max(*((local.lst->key)), sll_lseg_max_key(*((local.lst->next)), prv)))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)));
        // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), @_vcc_ptr_neq_pure(*((local.lst->next)), prv)), ==(sll_lseg_min_key(local.lst, prv), @\int_min(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), prv)))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)));
        // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), @_vcc_ptr_neq_pure(*((local.lst->next)), prv)), ==(srtl_lseg(local.lst, prv), &&(&&(srtl_lseg(*((local.lst->next)), prv), unchecked!(@_vcc_oset_in(local.lst, srtl_lseg_reach(*((local.lst->next)), prv)))), <=(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), prv))))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), ==(srtl_lseg_reach(local.lst, prv), @_vcc_oset_union(srtl_lseg_reach(*((local.lst->next)), prv), @_vcc_oset_singleton(local.lst)))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg(local.lst, curr), &&(sll_lseg(*((local.lst->next)), curr), unchecked!(@_vcc_oset_in(local.lst, sll_lseg_reach(*((local.lst->next)), curr)))))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
        // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_reach(local.lst, curr), @_vcc_oset_union(sll_lseg_reach(*((local.lst->next)), curr), @_vcc_oset_singleton(local.lst)))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_keys(local.lst, curr), @_vcc_intset_union(sll_lseg_keys(*((local.lst->next)), curr), @_vcc_intset_singleton(*((local.lst->key)))))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
        // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_len_next(local.lst, curr), unchecked+(sll_lseg_len_next(*((local.lst->next)), curr), 1))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), 1);
        // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(sll_lseg_max_key(local.lst, curr), @\int_max(*((local.lst->key)), sll_lseg_max_key(*((local.lst->next)), curr)))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
        // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(sll_lseg_min_key(local.lst, curr), @\int_min(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), curr)))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
        // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(srtl_lseg(local.lst, curr), &&(&&(srtl_lseg(*((local.lst->next)), curr), unchecked!(@_vcc_oset_in(local.lst, srtl_lseg_reach(*((local.lst->next)), curr)))), <=(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), curr))))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(srtl_lseg_reach(local.lst, curr), @_vcc_oset_union(srtl_lseg_reach(*((local.lst->next)), curr), @_vcc_oset_singleton(local.lst)))); 
        assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
        assume true;
        // if (@_vcc_ptr_eq_null(prv)) ...
        if ($is_null($phys_ptr_cast(L#prv, ^s_node)))
        {
          anon9:
            // struct s_node* curr0#0; 
            // curr0#0 := curr; 
            curr0#0 := $phys_ptr_cast(L#curr, ^s_node);
            // struct s_node* stmtexpr0#5; 
            // stmtexpr0#5 := curr0#0; 
            stmtexpr0#5 := $phys_ptr_cast(curr0#0, ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_list_len_next(curr), unchecked+(sll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(rsrtl(curr), &&(&&(rsrtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, rsrtl_reach(*((curr->next)))))), >=(*((curr->key)), sll_max_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(rsrtl_reach(curr), @_vcc_oset_union(rsrtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union(sll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_max_key(curr), @\int_max(*((curr->key)), sll_max_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_min_key(curr), @\int_min(*((curr->key)), sll_min_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(srtl(curr), &&(&&(srtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, srtl_reach(*((curr->next)))))), <=(*((curr->key)), sll_min_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(srtl_reach(curr), @_vcc_oset_union(srtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assert @reads_check_normal((curr->next)); 
            assert $thread_local($s, $phys_ptr_cast(L#curr, ^s_node));
            // local.lst := *((curr->next)); 
            local.lst := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_keys(local.lst), @_vcc_intset_union(sll_keys(*((local.lst->next))), @_vcc_intset_singleton(*((local.lst->key)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.lst, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_list_len_next(local.lst), unchecked+(sll_list_len_next(*((local.lst->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.lst, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(rsrtl(local.lst), &&(&&(rsrtl(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, rsrtl_reach(*((local.lst->next)))))), >=(*((local.lst->key)), sll_max_key(*((local.lst->next))))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(rsrtl_reach(local.lst), @_vcc_oset_union(rsrtl_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll(local.lst), &&(sll(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, sll_reach(*((local.lst->next)))))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_reach(local.lst), @_vcc_oset_union(sll_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(sll_max_key(local.lst), @\int_max(*((local.lst->key)), sll_max_key(*((local.lst->next)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.lst, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(sll_min_key(local.lst), @\int_min(*((local.lst->key)), sll_min_key(*((local.lst->next)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.lst, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(srtl(local.lst), &&(&&(srtl(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, srtl_reach(*((local.lst->next)))))), <=(*((local.lst->key)), sll_min_key(*((local.lst->next))))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(srtl_reach(local.lst), @_vcc_oset_union(srtl_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_list_len_next(curr), unchecked+(sll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(rsrtl(curr), &&(&&(rsrtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, rsrtl_reach(*((curr->next)))))), >=(*((curr->key)), sll_max_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(rsrtl_reach(curr), @_vcc_oset_union(rsrtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union(sll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_max_key(curr), @\int_max(*((curr->key)), sll_max_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_min_key(curr), @\int_min(*((curr->key)), sll_min_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(srtl(curr), &&(&&(srtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, srtl_reach(*((curr->next)))))), <=(*((curr->key)), sll_min_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(srtl_reach(curr), @_vcc_oset_union(srtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
        }
        else
        {
          anon10:
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_list_len_next(curr), unchecked+(sll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(rsrtl(curr), &&(&&(rsrtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, rsrtl_reach(*((curr->next)))))), >=(*((curr->key)), sll_max_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(rsrtl_reach(curr), @_vcc_oset_union(rsrtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union(sll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_max_key(curr), @\int_max(*((curr->key)), sll_max_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_min_key(curr), @\int_min(*((curr->key)), sll_min_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(srtl(curr), &&(&&(srtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, srtl_reach(*((curr->next)))))), <=(*((curr->key)), sll_min_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(srtl_reach(curr), @_vcc_oset_union(srtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_keys(prv), @_vcc_intset_union(sll_keys(*((prv->next))), @_vcc_intset_singleton(*((prv->key)))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prv, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_list_len_next(prv), unchecked+(sll_list_len_next(*((prv->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prv, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(rsrtl(prv), &&(&&(rsrtl(*((prv->next))), unchecked!(@_vcc_oset_in(prv, rsrtl_reach(*((prv->next)))))), >=(*((prv->key)), sll_max_key(*((prv->next))))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(rsrtl_reach(prv), @_vcc_oset_union(rsrtl_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll(prv), &&(sll(*((prv->next))), unchecked!(@_vcc_oset_in(prv, sll_reach(*((prv->next)))))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_reach(prv), @_vcc_oset_union(sll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(sll_max_key(prv), @\int_max(*((prv->key)), sll_max_key(*((prv->next)))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#prv, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(sll_min_key(prv), @\int_min(*((prv->key)), sll_min_key(*((prv->next)))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#prv, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(srtl(prv), &&(&&(srtl(*((prv->next))), unchecked!(@_vcc_oset_in(prv, srtl_reach(*((prv->next)))))), <=(*((prv->key)), sll_min_key(*((prv->next))))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(srtl_reach(prv), @_vcc_oset_union(srtl_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_keys(local.lst), @_vcc_intset_union(sll_keys(*((local.lst->next))), @_vcc_intset_singleton(*((local.lst->key)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.lst, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_list_len_next(local.lst), unchecked+(sll_list_len_next(*((local.lst->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.lst, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(rsrtl(local.lst), &&(&&(rsrtl(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, rsrtl_reach(*((local.lst->next)))))), >=(*((local.lst->key)), sll_max_key(*((local.lst->next))))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(rsrtl_reach(local.lst), @_vcc_oset_union(rsrtl_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll(local.lst), &&(sll(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, sll_reach(*((local.lst->next)))))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_reach(local.lst), @_vcc_oset_union(sll_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(sll_max_key(local.lst), @\int_max(*((local.lst->key)), sll_max_key(*((local.lst->next)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.lst, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(sll_min_key(local.lst), @\int_min(*((local.lst->key)), sll_min_key(*((local.lst->next)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.lst, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(srtl(local.lst), &&(&&(srtl(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, srtl_reach(*((local.lst->next)))))), <=(*((local.lst->key)), sll_min_key(*((local.lst->next))))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(srtl_reach(local.lst), @_vcc_oset_union(srtl_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), ==(sll_lseg(local.lst, prv), &&(sll_lseg(*((local.lst->next)), prv), unchecked!(@_vcc_oset_in(local.lst, sll_lseg_reach(*((local.lst->next)), prv)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), ==(sll_lseg_reach(local.lst, prv), @_vcc_oset_union(sll_lseg_reach(*((local.lst->next)), prv), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), ==(sll_lseg_keys(local.lst, prv), @_vcc_intset_union(sll_lseg_keys(*((local.lst->next)), prv), @_vcc_intset_singleton(*((local.lst->key)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), ==(sll_lseg_len_next(local.lst, prv), unchecked+(sll_lseg_len_next(*((local.lst->next)), prv), 1))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)), 1);
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), @_vcc_ptr_neq_pure(*((local.lst->next)), prv)), ==(sll_lseg_max_key(local.lst, prv), @\int_max(*((local.lst->key)), sll_lseg_max_key(*((local.lst->next)), prv)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), @_vcc_ptr_neq_pure(*((local.lst->next)), prv)), ==(sll_lseg_min_key(local.lst, prv), @\int_min(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), prv)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), @_vcc_ptr_neq_pure(*((local.lst->next)), prv)), ==(srtl_lseg(local.lst, prv), &&(&&(srtl_lseg(*((local.lst->next)), prv), unchecked!(@_vcc_oset_in(local.lst, srtl_lseg_reach(*((local.lst->next)), prv)))), <=(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), prv))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, prv)), ==(srtl_lseg_reach(local.lst, prv), @_vcc_oset_union(srtl_lseg_reach(*((local.lst->next)), prv), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#prv, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#prv, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg(local.lst, curr), &&(sll_lseg(*((local.lst->next)), curr), unchecked!(@_vcc_oset_in(local.lst, sll_lseg_reach(*((local.lst->next)), curr)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_reach(local.lst, curr), @_vcc_oset_union(sll_lseg_reach(*((local.lst->next)), curr), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_keys(local.lst, curr), @_vcc_intset_union(sll_lseg_keys(*((local.lst->next)), curr), @_vcc_intset_singleton(*((local.lst->key)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_len_next(local.lst, curr), unchecked+(sll_lseg_len_next(*((local.lst->next)), curr), 1))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), 1);
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(sll_lseg_max_key(local.lst, curr), @\int_max(*((local.lst->key)), sll_lseg_max_key(*((local.lst->next)), curr)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(sll_lseg_min_key(local.lst, curr), @\int_min(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), curr)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(srtl_lseg(local.lst, curr), &&(&&(srtl_lseg(*((local.lst->next)), curr), unchecked!(@_vcc_oset_in(local.lst, srtl_lseg_reach(*((local.lst->next)), curr)))), <=(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), curr))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(srtl_lseg_reach(local.lst, curr), @_vcc_oset_union(srtl_lseg_reach(*((local.lst->next)), curr), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // struct s_node* curr_next; 
            // struct s_node* curr0#1; 
            // curr0#1 := curr; 
            curr0#1 := $phys_ptr_cast(L#curr, ^s_node);
            // struct s_node* stmtexpr0#6; 
            // stmtexpr0#6 := curr0#1; 
            stmtexpr0#6 := $phys_ptr_cast(curr0#1, ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_list_len_next(curr), unchecked+(sll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(rsrtl(curr), &&(&&(rsrtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, rsrtl_reach(*((curr->next)))))), >=(*((curr->key)), sll_max_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(rsrtl_reach(curr), @_vcc_oset_union(rsrtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union(sll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_max_key(curr), @\int_max(*((curr->key)), sll_max_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_min_key(curr), @\int_min(*((curr->key)), sll_min_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(srtl(curr), &&(&&(srtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, srtl_reach(*((curr->next)))))), <=(*((curr->key)), sll_min_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(srtl_reach(curr), @_vcc_oset_union(srtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assert @reads_check_normal((curr->next)); 
            assert $thread_local($s, $phys_ptr_cast(L#curr, ^s_node));
            // curr_next := *((curr->next)); 
            L#curr_next := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(sll_keys(curr_next), @_vcc_intset_union(sll_keys(*((curr_next->next))), @_vcc_intset_singleton(*((curr_next->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(sll_list_len_next(curr_next), unchecked+(sll_list_len_next(*((curr_next->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(curr_next), @_vcc_ptr_neq_null(*((curr_next->next)))), ==(rsrtl(curr_next), &&(&&(rsrtl(*((curr_next->next))), unchecked!(@_vcc_oset_in(curr_next, rsrtl_reach(*((curr_next->next)))))), >=(*((curr_next->key)), sll_max_key(*((curr_next->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr_next, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr_next, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(rsrtl_reach(curr_next), @_vcc_oset_union(rsrtl_reach(*((curr_next->next))), @_vcc_oset_singleton(curr_next)))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr_next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(sll(curr_next), &&(sll(*((curr_next->next))), unchecked!(@_vcc_oset_in(curr_next, sll_reach(*((curr_next->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr_next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr_next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(sll_reach(curr_next), @_vcc_oset_union(sll_reach(*((curr_next->next))), @_vcc_oset_singleton(curr_next)))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr_next, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr_next), @_vcc_ptr_neq_null(*((curr_next->next)))), ==(sll_max_key(curr_next), @\int_max(*((curr_next->key)), sll_max_key(*((curr_next->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr_next), @_vcc_ptr_neq_null(*((curr_next->next)))), ==(sll_min_key(curr_next), @\int_min(*((curr_next->key)), sll_min_key(*((curr_next->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr_next), @_vcc_ptr_neq_null(*((curr_next->next)))), ==(srtl(curr_next), &&(&&(srtl(*((curr_next->next))), unchecked!(@_vcc_oset_in(curr_next, srtl_reach(*((curr_next->next)))))), <=(*((curr_next->key)), sll_min_key(*((curr_next->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr_next, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr_next, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(srtl_reach(curr_next), @_vcc_oset_union(srtl_reach(*((curr_next->next))), @_vcc_oset_singleton(curr_next)))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr_next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_list_len_next(curr), unchecked+(sll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(rsrtl(curr), &&(&&(rsrtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, rsrtl_reach(*((curr->next)))))), >=(*((curr->key)), sll_max_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(rsrtl_reach(curr), @_vcc_oset_union(rsrtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union(sll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_max_key(curr), @\int_max(*((curr->key)), sll_max_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_min_key(curr), @\int_min(*((curr->key)), sll_min_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(srtl(curr), &&(&&(srtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, srtl_reach(*((curr->next)))))), <=(*((curr->key)), sll_min_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(srtl_reach(curr), @_vcc_oset_union(srtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // _math \state _dryad_S0; 
            // _dryad_S0 := @_vcc_current_state(@state); 
            SL#_dryad_S0 := $current_state($s);
            // _math \state stmtexpr1#7; 
            // stmtexpr1#7 := _dryad_S0; 
            stmtexpr1#7 := SL#_dryad_S0;
            // assert @prim_writes_check((prv->next)); 
            assert $writable_prim($s, #wrTime$2^3.3, $dot($phys_ptr_cast(L#prv, ^s_node), s_node.next));
            // *(prv->next) := curr_next; 
            call $write_int(s_node.next, $phys_ptr_cast(L#prv, ^s_node), $ptr_to_int($phys_ptr_cast(L#curr_next, ^s_node)));
            assume $full_stop_ext(#tok$2^37.7, $s);
            // _math \state _dryad_S1; 
            // _dryad_S1 := @_vcc_current_state(@state); 
            SL#_dryad_S1 := $current_state($s);
            // _math \state stmtexpr2#8; 
            // stmtexpr2#8 := _dryad_S1; 
            stmtexpr2#8 := SL#_dryad_S1;
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr0#1)))), ==(old(_dryad_S0, sll_keys(curr0#1)), old(_dryad_S1, sll_keys(curr0#1)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(curr0#1, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr0#1)))), ==(old(_dryad_S0, sll_list_len_next(curr0#1)), old(_dryad_S1, sll_list_len_next(curr0#1)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(curr0#1, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, rsrtl_reach(curr0#1)))), ==(old(_dryad_S0, rsrtl(curr0#1)), old(_dryad_S1, rsrtl(curr0#1)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(curr0#1, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, rsrtl_reach(curr0#1)))), ==(old(_dryad_S0, rsrtl_reach(curr0#1)), old(_dryad_S1, rsrtl_reach(curr0#1)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(curr0#1, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr0#1)))), ==(old(_dryad_S0, sll(curr0#1)), old(_dryad_S1, sll(curr0#1)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(curr0#1, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr0#1)))), ==(old(_dryad_S0, sll_reach(curr0#1)), old(_dryad_S1, sll_reach(curr0#1)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(curr0#1, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr0#1)))), ==(old(_dryad_S0, sll_max_key(curr0#1)), old(_dryad_S1, sll_max_key(curr0#1)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(curr0#1, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr0#1)))), ==(old(_dryad_S0, sll_min_key(curr0#1)), old(_dryad_S1, sll_min_key(curr0#1)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(curr0#1, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, srtl_reach(curr0#1)))), ==(old(_dryad_S0, srtl(curr0#1)), old(_dryad_S1, srtl(curr0#1)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(curr0#1, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, srtl_reach(curr0#1)))), ==(old(_dryad_S0, srtl_reach(curr0#1)), old(_dryad_S1, srtl_reach(curr0#1)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(curr0#1, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(curr0#1, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr_next)))), ==(old(_dryad_S0, sll_keys(curr_next)), old(_dryad_S1, sll_keys(curr_next)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#curr_next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr_next)))), ==(old(_dryad_S0, sll_list_len_next(curr_next)), old(_dryad_S1, sll_list_len_next(curr_next)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#curr_next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, rsrtl_reach(curr_next)))), ==(old(_dryad_S0, rsrtl(curr_next)), old(_dryad_S1, rsrtl(curr_next)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(L#curr_next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, rsrtl_reach(curr_next)))), ==(old(_dryad_S0, rsrtl_reach(curr_next)), old(_dryad_S1, rsrtl_reach(curr_next)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(L#curr_next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr_next)))), ==(old(_dryad_S0, sll(curr_next)), old(_dryad_S1, sll(curr_next)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#curr_next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr_next)))), ==(old(_dryad_S0, sll_reach(curr_next)), old(_dryad_S1, sll_reach(curr_next)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#curr_next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr_next)))), ==(old(_dryad_S0, sll_max_key(curr_next)), old(_dryad_S1, sll_max_key(curr_next)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(L#curr_next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr_next)))), ==(old(_dryad_S0, sll_min_key(curr_next)), old(_dryad_S1, sll_min_key(curr_next)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(L#curr_next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, srtl_reach(curr_next)))), ==(old(_dryad_S0, srtl(curr_next)), old(_dryad_S1, srtl(curr_next)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(L#curr_next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, srtl_reach(curr_next)))), ==(old(_dryad_S0, srtl_reach(curr_next)), old(_dryad_S1, srtl_reach(curr_next)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr_next, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(L#curr_next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr)))), ==(old(_dryad_S0, sll_keys(curr)), old(_dryad_S1, sll_keys(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr)))), ==(old(_dryad_S0, sll_list_len_next(curr)), old(_dryad_S1, sll_list_len_next(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, rsrtl_reach(curr)))), ==(old(_dryad_S0, rsrtl(curr)), old(_dryad_S1, rsrtl(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, rsrtl_reach(curr)))), ==(old(_dryad_S0, rsrtl_reach(curr)), old(_dryad_S1, rsrtl_reach(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr)))), ==(old(_dryad_S0, sll(curr)), old(_dryad_S1, sll(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr)))), ==(old(_dryad_S0, sll_reach(curr)), old(_dryad_S1, sll_reach(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr)))), ==(old(_dryad_S0, sll_max_key(curr)), old(_dryad_S1, sll_max_key(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(curr)))), ==(old(_dryad_S0, sll_min_key(curr)), old(_dryad_S1, sll_min_key(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, srtl_reach(curr)))), ==(old(_dryad_S0, srtl(curr)), old(_dryad_S1, srtl(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, srtl_reach(curr)))), ==(old(_dryad_S0, srtl_reach(curr)), old(_dryad_S1, srtl_reach(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#curr, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(local.lst)))), ==(old(_dryad_S0, sll_keys(local.lst)), old(_dryad_S1, sll_keys(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(local.lst)))), ==(old(_dryad_S0, sll_list_len_next(local.lst)), old(_dryad_S1, sll_list_len_next(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, rsrtl_reach(local.lst)))), ==(old(_dryad_S0, rsrtl(local.lst)), old(_dryad_S1, rsrtl(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, rsrtl_reach(local.lst)))), ==(old(_dryad_S0, rsrtl_reach(local.lst)), old(_dryad_S1, rsrtl_reach(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(local.lst)))), ==(old(_dryad_S0, sll(local.lst)), old(_dryad_S1, sll(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(local.lst)))), ==(old(_dryad_S0, sll_reach(local.lst)), old(_dryad_S1, sll_reach(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(local.lst)))), ==(old(_dryad_S0, sll_max_key(local.lst)), old(_dryad_S1, sll_max_key(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_reach(local.lst)))), ==(old(_dryad_S0, sll_min_key(local.lst)), old(_dryad_S1, sll_min_key(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, srtl_reach(local.lst)))), ==(old(_dryad_S0, srtl(local.lst)), old(_dryad_S1, srtl(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, srtl_reach(local.lst)))), ==(old(_dryad_S0, srtl_reach(local.lst)), old(_dryad_S1, srtl_reach(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0, sll_lseg(local.lst, prv)), old(_dryad_S1, sll_lseg(local.lst, prv)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0, sll_lseg_reach(local.lst, prv)), old(_dryad_S1, sll_lseg_reach(local.lst, prv)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0, sll_lseg_keys(local.lst, prv)), old(_dryad_S1, sll_lseg_keys(local.lst, prv)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0, sll_lseg_len_next(local.lst, prv)), old(_dryad_S1, sll_lseg_len_next(local.lst, prv)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0, sll_lseg_max_key(local.lst, prv)), old(_dryad_S1, sll_lseg_max_key(local.lst, prv)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg_max_key(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg_max_key(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0, sll_lseg_min_key(local.lst, prv)), old(_dryad_S1, sll_lseg_min_key(local.lst, prv)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg_min_key(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg_min_key(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, srtl_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0, srtl_lseg(local.lst, prv)), old(_dryad_S1, srtl_lseg(local.lst, prv)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#srtl_lseg(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#srtl_lseg(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, srtl_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0, srtl_lseg_reach(local.lst, prv)), old(_dryad_S1, srtl_lseg_reach(local.lst, prv)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#srtl_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#srtl_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, sll_lseg(local.lst, curr)), old(_dryad_S1, sll_lseg(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, sll_lseg_reach(local.lst, curr)), old(_dryad_S1, sll_lseg_reach(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, sll_lseg_keys(local.lst, curr)), old(_dryad_S1, sll_lseg_keys(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, sll_lseg_len_next(local.lst, curr)), old(_dryad_S1, sll_lseg_len_next(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, sll_lseg_max_key(local.lst, curr)), old(_dryad_S1, sll_lseg_max_key(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_max_key(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_max_key(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, sll_lseg_min_key(local.lst, curr)), old(_dryad_S1, sll_lseg_min_key(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_min_key(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_min_key(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, srtl_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, srtl_lseg(local.lst, curr)), old(_dryad_S1, srtl_lseg(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#srtl_lseg(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#srtl_lseg(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, srtl_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, srtl_lseg_reach(local.lst, curr)), old(_dryad_S1, srtl_lseg_reach(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#srtl_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#srtl_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, sll_lseg(local.lst, curr)), old(_dryad_S1, sll_lseg(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, sll_lseg_reach(local.lst, curr)), old(_dryad_S1, sll_lseg_reach(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, sll_lseg_keys(local.lst, curr)), old(_dryad_S1, sll_lseg_keys(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, sll_lseg_len_next(local.lst, curr)), old(_dryad_S1, sll_lseg_len_next(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, sll_lseg_max_key(local.lst, curr)), old(_dryad_S1, sll_lseg_max_key(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_max_key(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_max_key(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, sll_lseg_min_key(local.lst, curr)), old(_dryad_S1, sll_lseg_min_key(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_min_key(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_min_key(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, srtl_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, srtl_lseg(local.lst, curr)), old(_dryad_S1, srtl_lseg(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#srtl_lseg(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#srtl_lseg(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prv, old(_dryad_S0, srtl_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0, srtl_lseg_reach(local.lst, curr)), old(_dryad_S1, srtl_lseg_reach(local.lst, curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#srtl_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#srtl_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(prv, curr0#1)), ==(*((curr0#1->key)), old(_dryad_S0, *((curr0#1->key))))); 
            assume !($phys_ptr_cast(L#prv, ^s_node) == $phys_ptr_cast(curr0#1, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(curr0#1, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(curr0#1, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(prv, curr0#1)), @_vcc_ptr_eq_pure(*((curr0#1->next)), old(_dryad_S0, *((curr0#1->next))))); 
            assume !($phys_ptr_cast(L#prv, ^s_node) == $phys_ptr_cast(curr0#1, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(prv, curr_next)), ==(*((curr_next->key)), old(_dryad_S0, *((curr_next->key))))); 
            assume !($phys_ptr_cast(L#prv, ^s_node) == $phys_ptr_cast(L#curr_next, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(prv, curr_next)), @_vcc_ptr_eq_pure(*((curr_next->next)), old(_dryad_S0, *((curr_next->next))))); 
            assume !($phys_ptr_cast(L#prv, ^s_node) == $phys_ptr_cast(L#curr_next, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(prv, curr)), ==(*((curr->key)), old(_dryad_S0, *((curr->key))))); 
            assume !($phys_ptr_cast(L#prv, ^s_node) == $phys_ptr_cast(L#curr, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(prv, curr)), @_vcc_ptr_eq_pure(*((curr->next)), old(_dryad_S0, *((curr->next))))); 
            assume !($phys_ptr_cast(L#prv, ^s_node) == $phys_ptr_cast(L#curr, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(prv, local.lst)), ==(*((local.lst->key)), old(_dryad_S0, *((local.lst->key))))); 
            assume !($phys_ptr_cast(L#prv, ^s_node) == $phys_ptr_cast(local.lst, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(prv, local.lst)), @_vcc_ptr_eq_pure(*((local.lst->next)), old(_dryad_S0, *((local.lst->next))))); 
            assume !($phys_ptr_cast(L#prv, ^s_node) == $phys_ptr_cast(local.lst, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(curr0#1), ==(sll_keys(curr0#1), @_vcc_intset_union(sll_keys(*((curr0#1->next))), @_vcc_intset_singleton(*((curr0#1->key)))))); 
            assume $non_null($phys_ptr_cast(curr0#1, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(curr0#1, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(curr0#1, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr0#1), ==(sll_list_len_next(curr0#1), unchecked+(sll_list_len_next(*((curr0#1->next))), 1))); 
            assume $non_null($phys_ptr_cast(curr0#1, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(curr0#1, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(curr0#1), @_vcc_ptr_neq_null(*((curr0#1->next)))), ==(rsrtl(curr0#1), &&(&&(rsrtl(*((curr0#1->next))), unchecked!(@_vcc_oset_in(curr0#1, rsrtl_reach(*((curr0#1->next)))))), >=(*((curr0#1->key)), sll_max_key(*((curr0#1->next))))))); 
            assume $non_null($phys_ptr_cast(curr0#1, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(curr0#1, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(curr0#1, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(curr0#1, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr0#1), ==(rsrtl_reach(curr0#1), @_vcc_oset_union(rsrtl_reach(*((curr0#1->next))), @_vcc_oset_singleton(curr0#1)))); 
            assume $non_null($phys_ptr_cast(curr0#1, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(curr0#1, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(curr0#1, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr0#1), ==(sll(curr0#1), &&(sll(*((curr0#1->next))), unchecked!(@_vcc_oset_in(curr0#1, sll_reach(*((curr0#1->next)))))))); 
            assume $non_null($phys_ptr_cast(curr0#1, ^s_node)) ==> F#sll($s, $phys_ptr_cast(curr0#1, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(curr0#1, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr0#1), ==(sll_reach(curr0#1), @_vcc_oset_union(sll_reach(*((curr0#1->next))), @_vcc_oset_singleton(curr0#1)))); 
            assume $non_null($phys_ptr_cast(curr0#1, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(curr0#1, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(curr0#1, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr0#1), @_vcc_ptr_neq_null(*((curr0#1->next)))), ==(sll_max_key(curr0#1), @\int_max(*((curr0#1->key)), sll_max_key(*((curr0#1->next)))))); 
            assume $non_null($phys_ptr_cast(curr0#1, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(curr0#1, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(curr0#1, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr0#1), @_vcc_ptr_neq_null(*((curr0#1->next)))), ==(sll_min_key(curr0#1), @\int_min(*((curr0#1->key)), sll_min_key(*((curr0#1->next)))))); 
            assume $non_null($phys_ptr_cast(curr0#1, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(curr0#1, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(curr0#1, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr0#1), @_vcc_ptr_neq_null(*((curr0#1->next)))), ==(srtl(curr0#1), &&(&&(srtl(*((curr0#1->next))), unchecked!(@_vcc_oset_in(curr0#1, srtl_reach(*((curr0#1->next)))))), <=(*((curr0#1->key)), sll_min_key(*((curr0#1->next))))))); 
            assume $non_null($phys_ptr_cast(curr0#1, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(curr0#1, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(curr0#1, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(curr0#1, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr0#1), ==(srtl_reach(curr0#1), @_vcc_oset_union(srtl_reach(*((curr0#1->next))), @_vcc_oset_singleton(curr0#1)))); 
            assume $non_null($phys_ptr_cast(curr0#1, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(curr0#1, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(curr0#1, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(curr0#1, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(sll_keys(curr_next), @_vcc_intset_union(sll_keys(*((curr_next->next))), @_vcc_intset_singleton(*((curr_next->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(sll_list_len_next(curr_next), unchecked+(sll_list_len_next(*((curr_next->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(curr_next), @_vcc_ptr_neq_null(*((curr_next->next)))), ==(rsrtl(curr_next), &&(&&(rsrtl(*((curr_next->next))), unchecked!(@_vcc_oset_in(curr_next, rsrtl_reach(*((curr_next->next)))))), >=(*((curr_next->key)), sll_max_key(*((curr_next->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr_next, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr_next, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(rsrtl_reach(curr_next), @_vcc_oset_union(rsrtl_reach(*((curr_next->next))), @_vcc_oset_singleton(curr_next)))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr_next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(sll(curr_next), &&(sll(*((curr_next->next))), unchecked!(@_vcc_oset_in(curr_next, sll_reach(*((curr_next->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr_next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr_next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(sll_reach(curr_next), @_vcc_oset_union(sll_reach(*((curr_next->next))), @_vcc_oset_singleton(curr_next)))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr_next, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr_next), @_vcc_ptr_neq_null(*((curr_next->next)))), ==(sll_max_key(curr_next), @\int_max(*((curr_next->key)), sll_max_key(*((curr_next->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr_next), @_vcc_ptr_neq_null(*((curr_next->next)))), ==(sll_min_key(curr_next), @\int_min(*((curr_next->key)), sll_min_key(*((curr_next->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr_next), @_vcc_ptr_neq_null(*((curr_next->next)))), ==(srtl(curr_next), &&(&&(srtl(*((curr_next->next))), unchecked!(@_vcc_oset_in(curr_next, srtl_reach(*((curr_next->next)))))), <=(*((curr_next->key)), sll_min_key(*((curr_next->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr_next, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr_next, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(srtl_reach(curr_next), @_vcc_oset_union(srtl_reach(*((curr_next->next))), @_vcc_oset_singleton(curr_next)))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr_next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_list_len_next(curr), unchecked+(sll_list_len_next(*((curr->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(rsrtl(curr), &&(&&(rsrtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, rsrtl_reach(*((curr->next)))))), >=(*((curr->key)), sll_max_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(rsrtl_reach(curr), @_vcc_oset_union(rsrtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union(sll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_max_key(curr), @\int_max(*((curr->key)), sll_max_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_min_key(curr), @\int_min(*((curr->key)), sll_min_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(srtl(curr), &&(&&(srtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, srtl_reach(*((curr->next)))))), <=(*((curr->key)), sll_min_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(srtl_reach(curr), @_vcc_oset_union(srtl_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_keys(local.lst), @_vcc_intset_union(sll_keys(*((local.lst->next))), @_vcc_intset_singleton(*((local.lst->key)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.lst, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_list_len_next(local.lst), unchecked+(sll_list_len_next(*((local.lst->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.lst, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(rsrtl(local.lst), &&(&&(rsrtl(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, rsrtl_reach(*((local.lst->next)))))), >=(*((local.lst->key)), sll_max_key(*((local.lst->next))))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(rsrtl_reach(local.lst), @_vcc_oset_union(rsrtl_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll(local.lst), &&(sll(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, sll_reach(*((local.lst->next)))))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(sll_reach(local.lst), @_vcc_oset_union(sll_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(sll_max_key(local.lst), @\int_max(*((local.lst->key)), sll_max_key(*((local.lst->next)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.lst, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(sll_min_key(local.lst), @\int_min(*((local.lst->key)), sll_min_key(*((local.lst->next)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.lst, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_null(*((local.lst->next)))), ==(srtl(local.lst), &&(&&(srtl(*((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, srtl_reach(*((local.lst->next)))))), <=(*((local.lst->key)), sll_min_key(*((local.lst->next))))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.lst, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), ==(srtl_reach(local.lst), @_vcc_oset_union(srtl_reach(*((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.lst, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_keys(prv), @_vcc_intset_union(sll_keys(*((prv->next))), @_vcc_intset_singleton(*((prv->key)))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prv, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_list_len_next(prv), unchecked+(sll_list_len_next(*((prv->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prv, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(rsrtl(prv), &&(&&(rsrtl(*((prv->next))), unchecked!(@_vcc_oset_in(prv, rsrtl_reach(*((prv->next)))))), >=(*((prv->key)), sll_max_key(*((prv->next))))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(rsrtl_reach(prv), @_vcc_oset_union(rsrtl_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll(prv), &&(sll(*((prv->next))), unchecked!(@_vcc_oset_in(prv, sll_reach(*((prv->next)))))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(sll_reach(prv), @_vcc_oset_union(sll_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(sll_max_key(prv), @\int_max(*((prv->key)), sll_max_key(*((prv->next)))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#prv, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(sll_min_key(prv), @\int_min(*((prv->key)), sll_min_key(*((prv->next)))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#prv, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prv), @_vcc_ptr_neq_null(*((prv->next)))), ==(srtl(prv), &&(&&(srtl(*((prv->next))), unchecked!(@_vcc_oset_in(prv, srtl_reach(*((prv->next)))))), <=(*((prv->key)), sll_min_key(*((prv->next))))))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#prv, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prv, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prv, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prv), ==(srtl_reach(prv), @_vcc_oset_union(srtl_reach(*((prv->next))), @_vcc_oset_singleton(prv)))); 
            assume $non_null($phys_ptr_cast(L#prv, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#prv, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prv, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prv, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(sll_keys(curr_next), @_vcc_intset_union(sll_keys(*((curr_next->next))), @_vcc_intset_singleton(*((curr_next->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(sll_list_len_next(curr_next), unchecked+(sll_list_len_next(*((curr_next->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(curr_next), @_vcc_ptr_neq_null(*((curr_next->next)))), ==(rsrtl(curr_next), &&(&&(rsrtl(*((curr_next->next))), unchecked!(@_vcc_oset_in(curr_next, rsrtl_reach(*((curr_next->next)))))), >=(*((curr_next->key)), sll_max_key(*((curr_next->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr_next, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr_next, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(rsrtl_reach(curr_next), @_vcc_oset_union(rsrtl_reach(*((curr_next->next))), @_vcc_oset_singleton(curr_next)))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr_next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(sll(curr_next), &&(sll(*((curr_next->next))), unchecked!(@_vcc_oset_in(curr_next, sll_reach(*((curr_next->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr_next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr_next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(sll_reach(curr_next), @_vcc_oset_union(sll_reach(*((curr_next->next))), @_vcc_oset_singleton(curr_next)))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr_next, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr_next), @_vcc_ptr_neq_null(*((curr_next->next)))), ==(sll_max_key(curr_next), @\int_max(*((curr_next->key)), sll_max_key(*((curr_next->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr_next), @_vcc_ptr_neq_null(*((curr_next->next)))), ==(sll_min_key(curr_next), @\int_min(*((curr_next->key)), sll_min_key(*((curr_next->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr_next), @_vcc_ptr_neq_null(*((curr_next->next)))), ==(srtl(curr_next), &&(&&(srtl(*((curr_next->next))), unchecked!(@_vcc_oset_in(curr_next, srtl_reach(*((curr_next->next)))))), <=(*((curr_next->key)), sll_min_key(*((curr_next->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr_next, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr_next, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr_next, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr_next), ==(srtl_reach(curr_next), @_vcc_oset_union(srtl_reach(*((curr_next->next))), @_vcc_oset_singleton(curr_next)))); 
            assume $non_null($phys_ptr_cast(L#curr_next, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#curr_next, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr_next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#curr_next, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg(local.lst, curr), &&(sll_lseg(*((local.lst->next)), curr), unchecked!(@_vcc_oset_in(local.lst, sll_lseg_reach(*((local.lst->next)), curr)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_reach(local.lst, curr), @_vcc_oset_union(sll_lseg_reach(*((local.lst->next)), curr), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_keys(local.lst, curr), @_vcc_intset_union(sll_lseg_keys(*((local.lst->next)), curr), @_vcc_intset_singleton(*((local.lst->key)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_len_next(local.lst, curr), unchecked+(sll_lseg_len_next(*((local.lst->next)), curr), 1))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), 1);
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(sll_lseg_max_key(local.lst, curr), @\int_max(*((local.lst->key)), sll_lseg_max_key(*((local.lst->next)), curr)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(sll_lseg_min_key(local.lst, curr), @\int_min(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), curr)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(srtl_lseg(local.lst, curr), &&(&&(srtl_lseg(*((local.lst->next)), curr), unchecked!(@_vcc_oset_in(local.lst, srtl_lseg_reach(*((local.lst->next)), curr)))), <=(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), curr))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(srtl_lseg_reach(local.lst, curr), @_vcc_oset_union(srtl_lseg_reach(*((local.lst->next)), curr), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg(local.lst, curr), &&(sll_lseg(*((local.lst->next)), curr), unchecked!(@_vcc_oset_in(local.lst, sll_lseg_reach(*((local.lst->next)), curr)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_reach(local.lst, curr), @_vcc_oset_union(sll_lseg_reach(*((local.lst->next)), curr), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_keys(local.lst, curr), @_vcc_intset_union(sll_lseg_keys(*((local.lst->next)), curr), @_vcc_intset_singleton(*((local.lst->key)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(sll_lseg_len_next(local.lst, curr), unchecked+(sll_lseg_len_next(*((local.lst->next)), curr), 1))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), 1);
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(sll_lseg_max_key(local.lst, curr), @\int_max(*((local.lst->key)), sll_lseg_max_key(*((local.lst->next)), curr)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(sll_lseg_min_key(local.lst, curr), @\int_min(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), curr)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), @_vcc_ptr_neq_pure(*((local.lst->next)), curr)), ==(srtl_lseg(local.lst, curr), &&(&&(srtl_lseg(*((local.lst->next)), curr), unchecked!(@_vcc_oset_in(local.lst, srtl_lseg_reach(*((local.lst->next)), curr)))), <=(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), curr))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, curr)), ==(srtl_lseg_reach(local.lst, curr), @_vcc_oset_union(srtl_lseg_reach(*((local.lst->next)), curr), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
        }

      anon12:
        // _math \state _dryad_S0#2; 
        // _dryad_S0#2 := @_vcc_current_state(@state); 
        _dryad_S0#2 := $current_state($s);
        // _math \state stmtexpr0#9; 
        // stmtexpr0#9 := _dryad_S0#2; 
        stmtexpr0#9 := _dryad_S0#2;
        // void function
        // assert @writes_check(curr); 
        assert $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#curr, ^s_node));
        // assert @writes_check(@_vcc_extent(@state, curr)); 
        assert (forall #writes$2^39.5: $ptr :: { $dont_instantiate(#writes$2^39.5) } $set_in(#writes$2^39.5, $extent($s, $phys_ptr_cast(L#curr, ^s_node))) ==> $top_writable($s, #wrTime$2^3.3, #writes$2^39.5));
        // stmt _vcc_free(curr); 
        call $free($phys_ptr_cast(L#curr, ^s_node));
        assume $full_stop_ext(#tok$2^39.5, $s);
        // _math \state _dryad_S1#3; 
        // _dryad_S1#3 := @_vcc_current_state(@state); 
        _dryad_S1#3 := $current_state($s);
        // _math \state stmtexpr1#10; 
        // stmtexpr1#10 := _dryad_S1#3; 
        stmtexpr1#10 := _dryad_S1#3;
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_reach(prv)))), ==(old(_dryad_S0#2, sll_keys(prv)), old(_dryad_S1#3, sll_keys(prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_keys(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node)) == F#sll_keys(_dryad_S1#3, $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_reach(prv)))), ==(old(_dryad_S0#2, sll_list_len_next(prv)), old(_dryad_S1#3, sll_list_len_next(prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_list_len_next(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node)) == F#sll_list_len_next(_dryad_S1#3, $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, rsrtl_reach(prv)))), ==(old(_dryad_S0#2, rsrtl(prv)), old(_dryad_S1#3, rsrtl(prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node))) ==> F#rsrtl(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node)) == F#rsrtl(_dryad_S1#3, $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, rsrtl_reach(prv)))), ==(old(_dryad_S0#2, rsrtl_reach(prv)), old(_dryad_S1#3, rsrtl_reach(prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node))) ==> F#rsrtl_reach(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node)) == F#rsrtl_reach(_dryad_S1#3, $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_reach(prv)))), ==(old(_dryad_S0#2, sll(prv)), old(_dryad_S1#3, sll(prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node)) == F#sll(_dryad_S1#3, $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_reach(prv)))), ==(old(_dryad_S0#2, sll_reach(prv)), old(_dryad_S1#3, sll_reach(prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_reach(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node)) == F#sll_reach(_dryad_S1#3, $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_reach(prv)))), ==(old(_dryad_S0#2, sll_max_key(prv)), old(_dryad_S1#3, sll_max_key(prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_max_key(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node)) == F#sll_max_key(_dryad_S1#3, $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_reach(prv)))), ==(old(_dryad_S0#2, sll_min_key(prv)), old(_dryad_S1#3, sll_min_key(prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_min_key(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node)) == F#sll_min_key(_dryad_S1#3, $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, srtl_reach(prv)))), ==(old(_dryad_S0#2, srtl(prv)), old(_dryad_S1#3, srtl(prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node))) ==> F#srtl(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node)) == F#srtl(_dryad_S1#3, $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, srtl_reach(prv)))), ==(old(_dryad_S0#2, srtl_reach(prv)), old(_dryad_S1#3, srtl_reach(prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node))) ==> F#srtl_reach(_dryad_S0#2, $phys_ptr_cast(L#prv, ^s_node)) == F#srtl_reach(_dryad_S1#3, $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_reach(local.lst)))), ==(old(_dryad_S0#2, sll_keys(local.lst)), old(_dryad_S1#3, sll_keys(local.lst)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll_keys(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node)) == F#sll_keys(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_reach(local.lst)))), ==(old(_dryad_S0#2, sll_list_len_next(local.lst)), old(_dryad_S1#3, sll_list_len_next(local.lst)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll_list_len_next(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node)) == F#sll_list_len_next(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, rsrtl_reach(local.lst)))), ==(old(_dryad_S0#2, rsrtl(local.lst)), old(_dryad_S1#3, rsrtl(local.lst)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node))) ==> F#rsrtl(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node)) == F#rsrtl(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, rsrtl_reach(local.lst)))), ==(old(_dryad_S0#2, rsrtl_reach(local.lst)), old(_dryad_S1#3, rsrtl_reach(local.lst)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node))) ==> F#rsrtl_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node)) == F#rsrtl_reach(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_reach(local.lst)))), ==(old(_dryad_S0#2, sll(local.lst)), old(_dryad_S1#3, sll(local.lst)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node)) == F#sll(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_reach(local.lst)))), ==(old(_dryad_S0#2, sll_reach(local.lst)), old(_dryad_S1#3, sll_reach(local.lst)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node)) == F#sll_reach(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_reach(local.lst)))), ==(old(_dryad_S0#2, sll_max_key(local.lst)), old(_dryad_S1#3, sll_max_key(local.lst)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll_max_key(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node)) == F#sll_max_key(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_reach(local.lst)))), ==(old(_dryad_S0#2, sll_min_key(local.lst)), old(_dryad_S1#3, sll_min_key(local.lst)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll_min_key(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node)) == F#sll_min_key(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, srtl_reach(local.lst)))), ==(old(_dryad_S0#2, srtl(local.lst)), old(_dryad_S1#3, srtl(local.lst)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node))) ==> F#srtl(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node)) == F#srtl(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, srtl_reach(local.lst)))), ==(old(_dryad_S0#2, srtl_reach(local.lst)), old(_dryad_S1#3, srtl_reach(local.lst)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node))) ==> F#srtl_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node)) == F#srtl_reach(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, sll_lseg(local.lst, prv)), old(_dryad_S1#3, sll_lseg(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, sll_lseg_reach(local.lst, prv)), old(_dryad_S1#3, sll_lseg_reach(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg_reach(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, sll_lseg_keys(local.lst, prv)), old(_dryad_S1#3, sll_lseg_keys(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg_keys(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg_keys(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, sll_lseg_len_next(local.lst, prv)), old(_dryad_S1#3, sll_lseg_len_next(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg_len_next(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg_len_next(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, sll_lseg_max_key(local.lst, prv)), old(_dryad_S1#3, sll_lseg_max_key(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg_max_key(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg_max_key(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, sll_lseg_min_key(local.lst, prv)), old(_dryad_S1#3, sll_lseg_min_key(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg_min_key(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg_min_key(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, srtl_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, srtl_lseg(local.lst, prv)), old(_dryad_S1#3, srtl_lseg(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#srtl_lseg(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#srtl_lseg(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, srtl_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, srtl_lseg_reach(local.lst, prv)), old(_dryad_S1#3, srtl_lseg_reach(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#srtl_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#srtl_lseg_reach(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, sll_lseg(local.lst, curr)), old(_dryad_S1#3, sll_lseg(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, sll_lseg_reach(local.lst, curr)), old(_dryad_S1#3, sll_lseg_reach(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_reach(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, sll_lseg_keys(local.lst, curr)), old(_dryad_S1#3, sll_lseg_keys(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_keys(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_keys(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, sll_lseg_len_next(local.lst, curr)), old(_dryad_S1#3, sll_lseg_len_next(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_len_next(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_len_next(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, sll_lseg_max_key(local.lst, curr)), old(_dryad_S1#3, sll_lseg_max_key(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_max_key(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_max_key(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, sll_lseg_min_key(local.lst, curr)), old(_dryad_S1#3, sll_lseg_min_key(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_min_key(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_min_key(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, srtl_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, srtl_lseg(local.lst, curr)), old(_dryad_S1#3, srtl_lseg(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#srtl_lseg(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#srtl_lseg(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, srtl_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, srtl_lseg_reach(local.lst, curr)), old(_dryad_S1#3, srtl_lseg_reach(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#srtl_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#srtl_lseg_reach(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, sll_lseg(local.lst, prv)), old(_dryad_S1#3, sll_lseg(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, sll_lseg_reach(local.lst, prv)), old(_dryad_S1#3, sll_lseg_reach(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg_reach(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, sll_lseg_keys(local.lst, prv)), old(_dryad_S1#3, sll_lseg_keys(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg_keys(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg_keys(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, sll_lseg_len_next(local.lst, prv)), old(_dryad_S1#3, sll_lseg_len_next(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg_len_next(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg_len_next(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, sll_lseg_max_key(local.lst, prv)), old(_dryad_S1#3, sll_lseg_max_key(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg_max_key(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg_max_key(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, sll_lseg_min_key(local.lst, prv)), old(_dryad_S1#3, sll_lseg_min_key(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#sll_lseg_min_key(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#sll_lseg_min_key(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, srtl_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, srtl_lseg(local.lst, prv)), old(_dryad_S1#3, srtl_lseg(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#srtl_lseg(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#srtl_lseg(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, srtl_lseg_reach(local.lst, prv)))), ==(old(_dryad_S0#2, srtl_lseg_reach(local.lst, prv)), old(_dryad_S1#3, srtl_lseg_reach(local.lst, prv)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node))) ==> F#srtl_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node)) == F#srtl_lseg_reach(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#prv, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, sll_lseg(local.lst, curr)), old(_dryad_S1#3, sll_lseg(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, sll_lseg_reach(local.lst, curr)), old(_dryad_S1#3, sll_lseg_reach(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_reach(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, sll_lseg_keys(local.lst, curr)), old(_dryad_S1#3, sll_lseg_keys(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_keys(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_keys(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, sll_lseg_len_next(local.lst, curr)), old(_dryad_S1#3, sll_lseg_len_next(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_len_next(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_len_next(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, sll_lseg_max_key(local.lst, curr)), old(_dryad_S1#3, sll_lseg_max_key(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_max_key(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_max_key(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, sll_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, sll_lseg_min_key(local.lst, curr)), old(_dryad_S1#3, sll_lseg_min_key(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_min_key(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_min_key(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, srtl_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, srtl_lseg(local.lst, curr)), old(_dryad_S1#3, srtl_lseg(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#srtl_lseg(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#srtl_lseg(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#2, srtl_lseg_reach(local.lst, curr)))), ==(old(_dryad_S0#2, srtl_lseg_reach(local.lst, curr)), old(_dryad_S1#3, srtl_lseg_reach(local.lst, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#srtl_lseg_reach(_dryad_S0#2, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#srtl_lseg_reach(_dryad_S1#3, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
    }
    else
    {
      anon13:
        // assert @_vcc_possibly_unreachable; 
        assert {:PossiblyUnreachable true} true;
    }

  anon17:
    // return local.lst; 
    $result := $phys_ptr_cast(local.lst, ^s_node);
    assume true;
    assert $position_marker();
    goto #exit;

  anon18:
    // skip

  #exit:
}



axiom (forall Q#__vcc_state$1^687.9#tc2#1659: $state, Q#x$1^687.9#dt1#1620: $ptr :: {:weight 10} { F#srtl(Q#__vcc_state$1^687.9#tc2#1659, $phys_ptr_cast(Q#x$1^687.9#dt1#1620, ^s_node)) } { F#sll(Q#__vcc_state$1^687.9#tc2#1659, $phys_ptr_cast(Q#x$1^687.9#dt1#1620, ^s_node)) } $good_state(Q#__vcc_state$1^687.9#tc2#1659) && true ==> F#srtl(Q#__vcc_state$1^687.9#tc2#1659, $phys_ptr_cast(Q#x$1^687.9#dt1#1620, ^s_node)) ==> F#sll(Q#__vcc_state$1^687.9#tc2#1659, $phys_ptr_cast(Q#x$1^687.9#dt1#1620, ^s_node)));

axiom (forall Q#__vcc_state$1^688.9#tc2#1660: $state, Q#x$1^688.9#dt1#1621: $ptr :: {:weight 10} { F#rsrtl(Q#__vcc_state$1^688.9#tc2#1660, $phys_ptr_cast(Q#x$1^688.9#dt1#1621, ^s_node)) } { F#sll(Q#__vcc_state$1^688.9#tc2#1660, $phys_ptr_cast(Q#x$1^688.9#dt1#1621, ^s_node)) } $good_state(Q#__vcc_state$1^688.9#tc2#1660) && true ==> F#rsrtl(Q#__vcc_state$1^688.9#tc2#1660, $phys_ptr_cast(Q#x$1^688.9#dt1#1621, ^s_node)) ==> F#sll(Q#__vcc_state$1^688.9#tc2#1660, $phys_ptr_cast(Q#x$1^688.9#dt1#1621, ^s_node)));

axiom (forall Q#__vcc_state$1^689.9#tc2#1661: $state, Q#x$1^689.9#dt1#1622: $ptr :: {:weight 10} { F#sll_reach(Q#__vcc_state$1^689.9#tc2#1661, $phys_ptr_cast(Q#x$1^689.9#dt1#1622, ^s_node)) } { F#srtl_reach(Q#__vcc_state$1^689.9#tc2#1661, $phys_ptr_cast(Q#x$1^689.9#dt1#1622, ^s_node)) } $good_state(Q#__vcc_state$1^689.9#tc2#1661) && true ==> F#sll_reach(Q#__vcc_state$1^689.9#tc2#1661, $phys_ptr_cast(Q#x$1^689.9#dt1#1622, ^s_node)) == F#srtl_reach(Q#__vcc_state$1^689.9#tc2#1661, $phys_ptr_cast(Q#x$1^689.9#dt1#1622, ^s_node)));

axiom (forall Q#__vcc_state$1^690.9#tc2#1662: $state, Q#x$1^690.9#dt1#1623: $ptr :: {:weight 10} { F#srtl_reach(Q#__vcc_state$1^690.9#tc2#1662, $phys_ptr_cast(Q#x$1^690.9#dt1#1623, ^s_node)) } { F#rsrtl_reach(Q#__vcc_state$1^690.9#tc2#1662, $phys_ptr_cast(Q#x$1^690.9#dt1#1623, ^s_node)) } $good_state(Q#__vcc_state$1^690.9#tc2#1662) && true ==> F#srtl_reach(Q#__vcc_state$1^690.9#tc2#1662, $phys_ptr_cast(Q#x$1^690.9#dt1#1623, ^s_node)) == F#rsrtl_reach(Q#__vcc_state$1^690.9#tc2#1662, $phys_ptr_cast(Q#x$1^690.9#dt1#1623, ^s_node)));

axiom (forall Q#__vcc_state$1^691.9#tc2#1663: $state, Q#x$1^691.9#dt1#1624: $ptr, Q#y$1^691.9#dt1#1625: $ptr :: {:weight 10} { F#sll_lseg_reach(Q#__vcc_state$1^691.9#tc2#1663, $phys_ptr_cast(Q#x$1^691.9#dt1#1624, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1625, ^s_node)) } { F#srtl_lseg_reach(Q#__vcc_state$1^691.9#tc2#1663, $phys_ptr_cast(Q#x$1^691.9#dt1#1624, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1625, ^s_node)) } $good_state(Q#__vcc_state$1^691.9#tc2#1663) && true ==> F#sll_lseg_reach(Q#__vcc_state$1^691.9#tc2#1663, $phys_ptr_cast(Q#x$1^691.9#dt1#1624, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1625, ^s_node)) == F#srtl_lseg_reach(Q#__vcc_state$1^691.9#tc2#1663, $phys_ptr_cast(Q#x$1^691.9#dt1#1624, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1625, ^s_node)));

const unique l#public: $label;

axiom $type_code_is(2, ^$#state_t);

const unique #tok$2^39.5: $token;

const unique #tok$2^37.7: $token;

const unique #tok$2^12.3: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^3.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cgrass?5Csls?5Csls_remove.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cgrass?5Csls?5Csls_remove.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cgrass?5Csls?5Cdryad_sls.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cgrass?5Csls?5Cdryad_sls.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^s_node);
