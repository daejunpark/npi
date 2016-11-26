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

const unique ^$#sls_dispose.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#sls_dispose.c..36263#3);

type $#sls_dispose.c..36263#3;

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



procedure sls_dispose(P#lst: $ptr) returns (OP#ALL_REACH: $oset);
  requires F#srtl($s, $phys_ptr_cast(P#lst, ^s_node));
  modifies $s, $cev_pc;
  ensures OP#ALL_REACH == $oset_empty();
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation sls_dispose(P#lst: $ptr) returns (OP#ALL_REACH: $oset)
{
  var stmtexpr2#4: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr1#3: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr0#2: $ptr;
  var SL#lst0: $ptr;
  var L#curr: $ptr;
  var loopState#0: $state;
  var stmtexpr1#6: $oset;
  var stmtexpr0#5: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var local.lst: $ptr;
  var #wrTime$2^3.3: int;
  var #stackframe: int;

  anon4:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$2^3.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$2^3.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$2^3.3, (lambda #p: $ptr :: false));
    // assume true
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
    // _math \oset stmtexpr0#5; 
    // stmtexpr0#5 := _dryad_G0; 
    stmtexpr0#5 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#6; 
    // stmtexpr1#6 := _dryad_G1; 
    stmtexpr1#6 := SL#_dryad_G1;
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
    // assume ==>(@_vcc_ptr_neq_null(local.lst), &&(@_vcc_mutable(@state, local.lst), @writes_check(local.lst))); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.lst, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.lst, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(local.lst), @_vcc_is_malloc_root(@state, local.lst)); 
    assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> $is_malloc_root($s, $phys_ptr_cast(local.lst, ^s_node));
    // ALL_REACH := srtl_reach(local.lst); 
    call OP#ALL_REACH := srtl_reach($phys_ptr_cast(local.lst, ^s_node));
    assume $full_stop_ext(#tok$2^10.23, $s);
    loopState#0 := $s;
    assume true;
    while (true)
      invariant F#srtl($s, $phys_ptr_cast(local.lst, ^s_node));
      invariant OP#ALL_REACH == F#srtl_reach($s, $phys_ptr_cast(local.lst, ^s_node));
      invariant $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.lst, ^s_node));
      invariant $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.lst, ^s_node));
      invariant $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> $is_malloc_root($s, $phys_ptr_cast(local.lst, ^s_node));
    {
      anon3:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#0, $s);
        assume $full_stop_ext(#tok$2^12.3, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(local.lst)) ...
        if ($non_null($phys_ptr_cast(local.lst, ^s_node)))
        {
          anon1:
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
            // struct s_node* curr; 
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
            // assert sll_lseg(local.lst, local.lst); 
            assert F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
            // assume sll_lseg(local.lst, local.lst); 
            assume F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
            // assert srtl_lseg(local.lst, local.lst); 
            assert F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
            // assume srtl_lseg(local.lst, local.lst); 
            assume F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $phys_ptr_cast(local.lst, ^s_node));
            // struct s_node* lst0; 
            // lst0 := local.lst; 
            SL#lst0 := $phys_ptr_cast(local.lst, ^s_node);
            // struct s_node* stmtexpr0#2; 
            // stmtexpr0#2 := lst0; 
            stmtexpr0#2 := $phys_ptr_cast(SL#lst0, ^s_node);
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
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, *((local.lst->next)))), ==(sll_lseg(local.lst, *((local.lst->next))), &&(sll_lseg(*((local.lst->next)), *((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, sll_lseg_reach(*((local.lst->next)), *((local.lst->next)))))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, *((local.lst->next)))), ==(sll_lseg_reach(local.lst, *((local.lst->next))), @_vcc_oset_union(sll_lseg_reach(*((local.lst->next)), *((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, *((local.lst->next)))), ==(sll_lseg_keys(local.lst, *((local.lst->next))), @_vcc_intset_union(sll_lseg_keys(*((local.lst->next)), *((local.lst->next))), @_vcc_intset_singleton(*((local.lst->key)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(local.lst, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, *((local.lst->next)))), ==(sll_lseg_len_next(local.lst, *((local.lst->next))), unchecked+(sll_lseg_len_next(*((local.lst->next)), *((local.lst->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(local.lst, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), 1);
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, *((local.lst->next)))), @_vcc_ptr_neq_pure(*((local.lst->next)), *((local.lst->next)))), ==(sll_lseg_max_key(local.lst, *((local.lst->next))), @\int_max(*((local.lst->key)), sll_lseg_max_key(*((local.lst->next)), *((local.lst->next)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(local.lst, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, *((local.lst->next)))), @_vcc_ptr_neq_pure(*((local.lst->next)), *((local.lst->next)))), ==(sll_lseg_min_key(local.lst, *((local.lst->next))), @\int_min(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), *((local.lst->next)))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(local.lst, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, *((local.lst->next)))), @_vcc_ptr_neq_pure(*((local.lst->next)), *((local.lst->next)))), ==(srtl_lseg(local.lst, *((local.lst->next))), &&(&&(srtl_lseg(*((local.lst->next)), *((local.lst->next))), unchecked!(@_vcc_oset_in(local.lst, srtl_lseg_reach(*((local.lst->next)), *((local.lst->next)))))), <=(*((local.lst->key)), sll_lseg_min_key(*((local.lst->next)), *((local.lst->next))))))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(local.lst, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.lst, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.lst, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.lst), @_vcc_ptr_neq_pure(local.lst, *((local.lst->next)))), ==(srtl_lseg_reach(local.lst, *((local.lst->next))), @_vcc_oset_union(srtl_lseg_reach(*((local.lst->next)), *((local.lst->next))), @_vcc_oset_singleton(local.lst)))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) && $phys_ptr_cast(local.lst, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(local.lst, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.lst, ^s_node)));
            // assert @reads_check_normal((local.lst->next)); 
            assert $thread_local($s, $phys_ptr_cast(local.lst, ^s_node));
            // local.lst := *((local.lst->next)); 
            local.lst := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.lst, ^s_node), ^s_node);
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
            // assume ==>(@_vcc_ptr_neq_null(local.lst), &&(@_vcc_mutable(@state, local.lst), @writes_check(local.lst))); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.lst, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(local.lst), @_vcc_is_malloc_root(@state, local.lst)); 
            assume $non_null($phys_ptr_cast(local.lst, ^s_node)) ==> $is_malloc_root($s, $phys_ptr_cast(local.lst, ^s_node));
            // _math \state _dryad_S0; 
            // _dryad_S0 := @_vcc_current_state(@state); 
            SL#_dryad_S0 := $current_state($s);
            // _math \state stmtexpr1#3; 
            // stmtexpr1#3 := _dryad_S0; 
            stmtexpr1#3 := SL#_dryad_S0;
            // void function
            // assert @writes_check(curr); 
            assert $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#curr, ^s_node));
            // assert @writes_check(@_vcc_extent(@state, curr)); 
            assert (forall #writes$2^22.5: $ptr :: { $dont_instantiate(#writes$2^22.5) } $set_in(#writes$2^22.5, $extent($s, $phys_ptr_cast(L#curr, ^s_node))) ==> $top_writable($s, #wrTime$2^3.3, #writes$2^22.5));
            // stmt _vcc_free(curr); 
            call $free($phys_ptr_cast(L#curr, ^s_node));
            assume $full_stop_ext(#tok$2^22.5, $s);
            // _math \state _dryad_S1; 
            // _dryad_S1 := @_vcc_current_state(@state); 
            SL#_dryad_S1 := $current_state($s);
            // _math \state stmtexpr2#4; 
            // stmtexpr2#4 := _dryad_S1; 
            stmtexpr2#4 := SL#_dryad_S1;
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(lst0)))), ==(old(_dryad_S0, sll_keys(lst0)), old(_dryad_S1, sll_keys(lst0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(SL#lst0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(lst0)))), ==(old(_dryad_S0, sll_list_len_next(lst0)), old(_dryad_S1, sll_list_len_next(lst0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(SL#lst0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, rsrtl_reach(lst0)))), ==(old(_dryad_S0, rsrtl(lst0)), old(_dryad_S1, rsrtl(lst0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(SL#lst0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, rsrtl_reach(lst0)))), ==(old(_dryad_S0, rsrtl_reach(lst0)), old(_dryad_S1, rsrtl_reach(lst0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(SL#lst0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(lst0)))), ==(old(_dryad_S0, sll(lst0)), old(_dryad_S1, sll(lst0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(SL#lst0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(lst0)))), ==(old(_dryad_S0, sll_reach(lst0)), old(_dryad_S1, sll_reach(lst0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(SL#lst0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(lst0)))), ==(old(_dryad_S0, sll_max_key(lst0)), old(_dryad_S1, sll_max_key(lst0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(SL#lst0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(lst0)))), ==(old(_dryad_S0, sll_min_key(lst0)), old(_dryad_S1, sll_min_key(lst0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(SL#lst0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, srtl_reach(lst0)))), ==(old(_dryad_S0, srtl(lst0)), old(_dryad_S1, srtl(lst0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(SL#lst0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, srtl_reach(lst0)))), ==(old(_dryad_S0, srtl_reach(lst0)), old(_dryad_S1, srtl_reach(lst0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#lst0, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(SL#lst0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(local.lst)))), ==(old(_dryad_S0, sll_keys(local.lst)), old(_dryad_S1, sll_keys(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(local.lst)))), ==(old(_dryad_S0, sll_list_len_next(local.lst)), old(_dryad_S1, sll_list_len_next(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, rsrtl_reach(local.lst)))), ==(old(_dryad_S0, rsrtl(local.lst)), old(_dryad_S1, rsrtl(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, rsrtl_reach(local.lst)))), ==(old(_dryad_S0, rsrtl_reach(local.lst)), old(_dryad_S1, rsrtl_reach(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(local.lst)))), ==(old(_dryad_S0, sll(local.lst)), old(_dryad_S1, sll(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(local.lst)))), ==(old(_dryad_S0, sll_reach(local.lst)), old(_dryad_S1, sll_reach(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(local.lst)))), ==(old(_dryad_S0, sll_max_key(local.lst)), old(_dryad_S1, sll_max_key(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(local.lst)))), ==(old(_dryad_S0, sll_min_key(local.lst)), old(_dryad_S1, sll_min_key(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, srtl_reach(local.lst)))), ==(old(_dryad_S0, srtl(local.lst)), old(_dryad_S1, srtl(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, srtl_reach(local.lst)))), ==(old(_dryad_S0, srtl_reach(local.lst)), old(_dryad_S1, srtl_reach(local.lst)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(local.lst, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(local.lst, ^s_node));
            // ALL_REACH := @_vcc_oset_diff(ALL_REACH, @_vcc_oset_singleton(curr)); 
            OP#ALL_REACH := $oset_diff(OP#ALL_REACH, $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
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
    assume $full_stop_ext(#tok$2^12.3, $s);

  #break_1:
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
    // return; 
    assume true;
    assert $position_marker();
    goto #exit;

  #exit:
}



axiom (forall Q#__vcc_state$1^687.9#tc2#1643: $state, Q#x$1^687.9#dt1#1618: $ptr :: {:weight 10} { F#srtl(Q#__vcc_state$1^687.9#tc2#1643, $phys_ptr_cast(Q#x$1^687.9#dt1#1618, ^s_node)) } { F#sll(Q#__vcc_state$1^687.9#tc2#1643, $phys_ptr_cast(Q#x$1^687.9#dt1#1618, ^s_node)) } $good_state(Q#__vcc_state$1^687.9#tc2#1643) && true ==> F#srtl(Q#__vcc_state$1^687.9#tc2#1643, $phys_ptr_cast(Q#x$1^687.9#dt1#1618, ^s_node)) ==> F#sll(Q#__vcc_state$1^687.9#tc2#1643, $phys_ptr_cast(Q#x$1^687.9#dt1#1618, ^s_node)));

axiom (forall Q#__vcc_state$1^688.9#tc2#1644: $state, Q#x$1^688.9#dt1#1619: $ptr :: {:weight 10} { F#rsrtl(Q#__vcc_state$1^688.9#tc2#1644, $phys_ptr_cast(Q#x$1^688.9#dt1#1619, ^s_node)) } { F#sll(Q#__vcc_state$1^688.9#tc2#1644, $phys_ptr_cast(Q#x$1^688.9#dt1#1619, ^s_node)) } $good_state(Q#__vcc_state$1^688.9#tc2#1644) && true ==> F#rsrtl(Q#__vcc_state$1^688.9#tc2#1644, $phys_ptr_cast(Q#x$1^688.9#dt1#1619, ^s_node)) ==> F#sll(Q#__vcc_state$1^688.9#tc2#1644, $phys_ptr_cast(Q#x$1^688.9#dt1#1619, ^s_node)));

axiom (forall Q#__vcc_state$1^689.9#tc2#1645: $state, Q#x$1^689.9#dt1#1620: $ptr :: {:weight 10} { F#sll_reach(Q#__vcc_state$1^689.9#tc2#1645, $phys_ptr_cast(Q#x$1^689.9#dt1#1620, ^s_node)) } { F#srtl_reach(Q#__vcc_state$1^689.9#tc2#1645, $phys_ptr_cast(Q#x$1^689.9#dt1#1620, ^s_node)) } $good_state(Q#__vcc_state$1^689.9#tc2#1645) && true ==> F#sll_reach(Q#__vcc_state$1^689.9#tc2#1645, $phys_ptr_cast(Q#x$1^689.9#dt1#1620, ^s_node)) == F#srtl_reach(Q#__vcc_state$1^689.9#tc2#1645, $phys_ptr_cast(Q#x$1^689.9#dt1#1620, ^s_node)));

axiom (forall Q#__vcc_state$1^690.9#tc2#1646: $state, Q#x$1^690.9#dt1#1621: $ptr :: {:weight 10} { F#srtl_reach(Q#__vcc_state$1^690.9#tc2#1646, $phys_ptr_cast(Q#x$1^690.9#dt1#1621, ^s_node)) } { F#rsrtl_reach(Q#__vcc_state$1^690.9#tc2#1646, $phys_ptr_cast(Q#x$1^690.9#dt1#1621, ^s_node)) } $good_state(Q#__vcc_state$1^690.9#tc2#1646) && true ==> F#srtl_reach(Q#__vcc_state$1^690.9#tc2#1646, $phys_ptr_cast(Q#x$1^690.9#dt1#1621, ^s_node)) == F#rsrtl_reach(Q#__vcc_state$1^690.9#tc2#1646, $phys_ptr_cast(Q#x$1^690.9#dt1#1621, ^s_node)));

axiom (forall Q#__vcc_state$1^691.9#tc2#1647: $state, Q#x$1^691.9#dt1#1622: $ptr, Q#y$1^691.9#dt1#1623: $ptr :: {:weight 10} { F#sll_lseg_reach(Q#__vcc_state$1^691.9#tc2#1647, $phys_ptr_cast(Q#x$1^691.9#dt1#1622, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1623, ^s_node)) } { F#srtl_lseg_reach(Q#__vcc_state$1^691.9#tc2#1647, $phys_ptr_cast(Q#x$1^691.9#dt1#1622, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1623, ^s_node)) } $good_state(Q#__vcc_state$1^691.9#tc2#1647) && true ==> F#sll_lseg_reach(Q#__vcc_state$1^691.9#tc2#1647, $phys_ptr_cast(Q#x$1^691.9#dt1#1622, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1623, ^s_node)) == F#srtl_lseg_reach(Q#__vcc_state$1^691.9#tc2#1647, $phys_ptr_cast(Q#x$1^691.9#dt1#1622, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1623, ^s_node)));

const unique l#public: $label;

axiom $type_code_is(2, ^$#state_t);

const unique #tok$2^22.5: $token;

const unique #tok$2^12.3: $token;

const unique #tok$2^10.23: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^3.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cgrass?5Csls?5Csls_dispose.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cgrass?5Csls?5Csls_dispose.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cgrass?5Csls?5Cdryad_sls.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cgrass?5Csls?5Cdryad_sls.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^s_node);
