axiom $arch_ptr_size == 8;

axiom $arch_spec_ptr_start == $max.u8;

const unique ^$##thread_id: $ctype;

axiom $def_math_type(^$##thread_id);

type $##thread_id;

const unique ^$##club: $ctype;

axiom $def_math_type(^$##club);

type $##club;

const unique ^q_node: $ctype;

axiom $is_span_sequential(^q_node);

axiom $def_struct_type(^q_node, 8, false, false);

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2(#s1, #s2, #p, ^q_node) } $inv2(#s1, #s2, #p, ^q_node) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2_without_lemmas(#s1, #s2, #p, ^q_node) } $inv2_without_lemmas(#s1, #s2, #p, ^q_node) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall p: $ptr, q: $ptr, s: $state :: { $in(q, $composite_extent(s, p, ^q_node)) } $in(q, $composite_extent(s, p, ^q_node)) == (q == p));

const unique q_node.next: $field;

axiom $def_phys_field(^q_node, q_node.next, $ptr_to(^q_node), false, 0);

const unique ^q_head: $ctype;

axiom $is_span_sequential(^q_head);

axiom $def_struct_type(^q_head, 16, false, false);

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2(#s1, #s2, #p, ^q_head) } $inv2(#s1, #s2, #p, ^q_head) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2_without_lemmas(#s1, #s2, #p, ^q_head) } $inv2_without_lemmas(#s1, #s2, #p, ^q_head) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall p: $ptr, q: $ptr, s: $state :: { $in(q, $composite_extent(s, p, ^q_head)) } $in(q, $composite_extent(s, p, ^q_head)) == (q == p));

const unique q_head.first: $field;

axiom $def_phys_field(^q_head, q_head.first, $ptr_to(^q_node), false, 0);

const unique q_head.last: $field;

axiom $def_phys_field(^q_head, q_head.last, $ptr_to(^q_node), false, 8);

const unique ^$#_purecall_handler#1: $ctype;

axiom $def_fnptr_type(^$#_purecall_handler#1);

type $#_purecall_handler#1;

const unique ^$#_invalid_parameter_handler#2: $ctype;

axiom $def_fnptr_type(^$#_invalid_parameter_handler#2);

type $#_invalid_parameter_handler#2;

const unique ^$#bsd_squeue_remove_head.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#bsd_squeue_remove_head.c..36263#3);

type $#bsd_squeue_remove_head.c..36263#3;

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

axiom (forall #s: $state, SP#hd: $ptr :: { F#sll(#s, SP#hd) } 1 < $decreases_level ==> $is_null($phys_ptr_cast(SP#hd, ^q_node)) ==> F#sll(#s, SP#hd));

axiom $function_arg_type(cf#sll, 0, ^^bool);

axiom $function_arg_type(cf#sll, 1, $ptr_to(^q_node));

procedure sll(SP#hd: $ptr) returns ($result: bool);
  ensures $is_null($phys_ptr_cast(SP#hd, ^q_node)) ==> $result;
  free ensures $result == F#sll($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#sll_reach(#s: $state, SP#hd: $ptr) : $oset;

const unique cf#sll_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#sll_reach(#s, SP#hd) } 1 < $decreases_level ==> ($non_null($phys_ptr_cast(SP#hd, ^q_node)) ==> $oset_in($phys_ptr_cast(SP#hd, ^q_node), F#sll_reach(#s, SP#hd))) && ($is_null($phys_ptr_cast(SP#hd, ^q_node)) ==> F#sll_reach(#s, SP#hd) == $oset_empty()));

axiom $function_arg_type(cf#sll_reach, 0, ^$#oset);

axiom $function_arg_type(cf#sll_reach, 1, $ptr_to(^q_node));

procedure sll_reach(SP#hd: $ptr) returns ($result: $oset);
  ensures ($non_null($phys_ptr_cast(SP#hd, ^q_node)) ==> $oset_in($phys_ptr_cast(SP#hd, ^q_node), $result)) && ($is_null($phys_ptr_cast(SP#hd, ^q_node)) ==> $result == $oset_empty());
  free ensures $result == F#sll_reach($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#sll_list_len_next(#s: $state, SP#x: $ptr) : int;

const unique cf#sll_list_len_next: $pure_function;

axiom (forall #s: $state, SP#x: $ptr :: { F#sll_list_len_next(#s, SP#x) } 1 < $decreases_level ==> $in_range_nat(F#sll_list_len_next(#s, SP#x)) && ($non_null($phys_ptr_cast(SP#x, ^q_node)) ==> F#sll_list_len_next(#s, SP#x) > 0) && ($is_null($phys_ptr_cast(SP#x, ^q_node)) ==> F#sll_list_len_next(#s, SP#x) == 0));

axiom $function_arg_type(cf#sll_list_len_next, 0, ^^nat);

axiom $function_arg_type(cf#sll_list_len_next, 1, $ptr_to(^q_node));

procedure sll_list_len_next(SP#x: $ptr) returns ($result: int);
  free ensures $in_range_nat($result);
  ensures $non_null($phys_ptr_cast(SP#x, ^q_node)) ==> $result > 0;
  ensures $is_null($phys_ptr_cast(SP#x, ^q_node)) ==> $result == 0;
  free ensures $result == F#sll_list_len_next($s, SP#x);
  free ensures $call_transition(old($s), $s);



function F#sll_lseg(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : bool;

const unique cf#sll_lseg: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#sll_lseg(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($is_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> F#sll_lseg(#s, SP#hd, SP#tl)) && ($phys_ptr_cast(SP#hd, ^q_node) == $phys_ptr_cast(SP#tl, ^q_node) ==> F#sll_lseg(#s, SP#hd, SP#tl)) && ($is_null($phys_ptr_cast(SP#tl, ^q_node)) ==> F#sll_lseg(#s, SP#hd, SP#tl) == F#sll(#s, $phys_ptr_cast(SP#hd, ^q_node))) && (F#sll(#s, $phys_ptr_cast(SP#tl, ^q_node)) && $oset_disjoint(F#sll_reach(#s, $phys_ptr_cast(SP#tl, ^q_node)), F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^q_node), $phys_ptr_cast(SP#tl, ^q_node))) ==> F#sll(#s, $phys_ptr_cast(SP#hd, ^q_node))) && ($non_null($phys_ptr_cast(SP#hd, ^q_node)) && $non_null($phys_ptr_cast(SP#tl, ^q_node)) && F#sll(#s, $rd_phys_ptr(#s, q_node.next, $phys_ptr_cast(SP#tl, ^q_node), ^q_node)) && $oset_disjoint(F#sll_reach(#s, $rd_phys_ptr(#s, q_node.next, $phys_ptr_cast(SP#tl, ^q_node), ^q_node)), F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^q_node), $phys_ptr_cast(SP#tl, ^q_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^q_node), F#sll_reach(#s, $rd_phys_ptr(#s, q_node.next, $phys_ptr_cast(SP#tl, ^q_node), ^q_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^q_node), F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^q_node), $phys_ptr_cast(SP#tl, ^q_node))) ==> $oset_in($phys_ptr_cast(SP#tl, ^q_node), F#sll_reach(#s, $phys_ptr_cast(SP#hd, ^q_node))) && F#sll_lseg(#s, $phys_ptr_cast(SP#hd, ^q_node), $rd_phys_ptr(#s, q_node.next, $phys_ptr_cast(SP#tl, ^q_node), ^q_node)) && F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^q_node), $rd_phys_ptr(#s, q_node.next, $phys_ptr_cast(SP#tl, ^q_node), ^q_node)) == $oset_union($oset_singleton($phys_ptr_cast(SP#tl, ^q_node)), F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^q_node), $phys_ptr_cast(SP#tl, ^q_node)))));

axiom $function_arg_type(cf#sll_lseg, 0, ^^bool);

axiom $function_arg_type(cf#sll_lseg, 1, $ptr_to(^q_node));

axiom $function_arg_type(cf#sll_lseg, 2, $ptr_to(^q_node));

procedure sll_lseg(SP#hd: $ptr, SP#tl: $ptr) returns ($result: bool);
  ensures $is_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> $result;
  ensures $phys_ptr_cast(SP#hd, ^q_node) == $phys_ptr_cast(SP#tl, ^q_node) ==> $result;
  ensures $is_null($phys_ptr_cast(SP#tl, ^q_node)) ==> $result == F#sll($s, $phys_ptr_cast(SP#hd, ^q_node));
  ensures F#sll($s, $phys_ptr_cast(SP#tl, ^q_node)) && $oset_disjoint(F#sll_reach($s, $phys_ptr_cast(SP#tl, ^q_node)), F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^q_node), $phys_ptr_cast(SP#tl, ^q_node))) ==> F#sll($s, $phys_ptr_cast(SP#hd, ^q_node));
  ensures $non_null($phys_ptr_cast(SP#hd, ^q_node)) && $non_null($phys_ptr_cast(SP#tl, ^q_node)) && F#sll($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(SP#tl, ^q_node), ^q_node)) && $oset_disjoint(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(SP#tl, ^q_node), ^q_node)), F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^q_node), $phys_ptr_cast(SP#tl, ^q_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^q_node), F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(SP#tl, ^q_node), ^q_node))) && !$oset_in($phys_ptr_cast(SP#tl, ^q_node), F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^q_node), $phys_ptr_cast(SP#tl, ^q_node))) ==> $oset_in($phys_ptr_cast(SP#tl, ^q_node), F#sll_reach($s, $phys_ptr_cast(SP#hd, ^q_node))) && F#sll_lseg($s, $phys_ptr_cast(SP#hd, ^q_node), $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(SP#tl, ^q_node), ^q_node)) && F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^q_node), $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(SP#tl, ^q_node), ^q_node)) == $oset_union($oset_singleton($phys_ptr_cast(SP#tl, ^q_node)), F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^q_node), $phys_ptr_cast(SP#tl, ^q_node)));
  free ensures $result == F#sll_lseg($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#sll_lseg_reach(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : $oset;

const unique cf#sll_lseg_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#sll_lseg_reach(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($is_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> F#sll_lseg_reach(#s, SP#hd, SP#tl) == $oset_empty()) && ($phys_ptr_cast(SP#hd, ^q_node) == $phys_ptr_cast(SP#tl, ^q_node) ==> F#sll_lseg_reach(#s, SP#hd, SP#tl) == $oset_empty()) && ($non_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> $oset_in($phys_ptr_cast(SP#hd, ^q_node), F#sll_lseg_reach(#s, SP#hd, SP#tl))) && ($non_null($phys_ptr_cast(SP#hd, ^q_node)) && $is_null($phys_ptr_cast(SP#tl, ^q_node)) ==> F#sll_lseg_reach(#s, SP#hd, SP#tl) == F#sll_reach(#s, $phys_ptr_cast(SP#hd, ^q_node))));

axiom $function_arg_type(cf#sll_lseg_reach, 0, ^$#oset);

axiom $function_arg_type(cf#sll_lseg_reach, 1, $ptr_to(^q_node));

axiom $function_arg_type(cf#sll_lseg_reach, 2, $ptr_to(^q_node));

procedure sll_lseg_reach(SP#hd: $ptr, SP#tl: $ptr) returns ($result: $oset);
  ensures $is_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> $result == $oset_empty();
  ensures $phys_ptr_cast(SP#hd, ^q_node) == $phys_ptr_cast(SP#tl, ^q_node) ==> $result == $oset_empty();
  ensures $non_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> $oset_in($phys_ptr_cast(SP#hd, ^q_node), $result);
  ensures $non_null($phys_ptr_cast(SP#hd, ^q_node)) && $is_null($phys_ptr_cast(SP#tl, ^q_node)) ==> $result == F#sll_reach($s, $phys_ptr_cast(SP#hd, ^q_node));
  free ensures $result == F#sll_lseg_reach($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#sll_lseg_len_next(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : int;

const unique cf#sll_lseg_len_next: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#sll_lseg_len_next(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> $in_range_nat(F#sll_lseg_len_next(#s, SP#hd, SP#tl)) && ($phys_ptr_cast(SP#hd, ^q_node) == $phys_ptr_cast(SP#tl, ^q_node) ==> F#sll_lseg_len_next(#s, SP#hd, SP#tl) == 0) && ($is_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> F#sll_lseg_len_next(#s, SP#hd, SP#tl) == 0) && ($non_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> F#sll_lseg_len_next(#s, SP#hd, SP#tl) > 0) && ($non_null($phys_ptr_cast(SP#hd, ^q_node)) && $is_null($phys_ptr_cast(SP#tl, ^q_node)) ==> F#sll_lseg_len_next(#s, SP#hd, SP#tl) == F#sll_list_len_next(#s, $phys_ptr_cast(SP#hd, ^q_node))));

axiom $function_arg_type(cf#sll_lseg_len_next, 0, ^^nat);

axiom $function_arg_type(cf#sll_lseg_len_next, 1, $ptr_to(^q_node));

axiom $function_arg_type(cf#sll_lseg_len_next, 2, $ptr_to(^q_node));

procedure sll_lseg_len_next(SP#hd: $ptr, SP#tl: $ptr) returns ($result: int);
  free ensures $in_range_nat($result);
  ensures $phys_ptr_cast(SP#hd, ^q_node) == $phys_ptr_cast(SP#tl, ^q_node) ==> $result == 0;
  ensures $is_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> $result == 0;
  ensures $non_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> $result > 0;
  ensures $non_null($phys_ptr_cast(SP#hd, ^q_node)) && $is_null($phys_ptr_cast(SP#tl, ^q_node)) ==> $result == F#sll_list_len_next($s, $phys_ptr_cast(SP#hd, ^q_node));
  free ensures $result == F#sll_lseg_len_next($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#unfold_sll(#s: $state, SP#hd: $ptr) : bool;

const unique cf#unfold_sll: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#unfold_sll(#s, SP#hd) } F#unfold_sll(#s, SP#hd) == ($non_null($phys_ptr_cast(SP#hd, ^q_node)) ==> F#sll(#s, $phys_ptr_cast(SP#hd, ^q_node)) == (F#sll(#s, $rd_phys_ptr(#s, q_node.next, $phys_ptr_cast(SP#hd, ^q_node), ^q_node)) && !$oset_in($phys_ptr_cast(SP#hd, ^q_node), F#sll_reach(#s, $rd_phys_ptr(#s, q_node.next, $phys_ptr_cast(SP#hd, ^q_node), ^q_node))))));

axiom $function_arg_type(cf#unfold_sll, 0, ^^bool);

axiom $function_arg_type(cf#unfold_sll, 1, $ptr_to(^q_node));

procedure unfold_sll(SP#hd: $ptr) returns ($result: bool);
  ensures $result == ($non_null($phys_ptr_cast(SP#hd, ^q_node)) ==> F#sll($s, $phys_ptr_cast(SP#hd, ^q_node)) == (F#sll($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(SP#hd, ^q_node), ^q_node)) && !$oset_in($phys_ptr_cast(SP#hd, ^q_node), F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(SP#hd, ^q_node), ^q_node)))));
  free ensures $result == F#unfold_sll($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#unfold_sll_list_len_next(#s: $state, SP#hd: $ptr) : bool;

const unique cf#unfold_sll_list_len_next: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#unfold_sll_list_len_next(#s, SP#hd) } F#unfold_sll_list_len_next(#s, SP#hd) == ($non_null($phys_ptr_cast(SP#hd, ^q_node)) ==> F#sll_list_len_next(#s, $phys_ptr_cast(SP#hd, ^q_node)) == $unchk_add(^^nat, F#sll_list_len_next(#s, $rd_phys_ptr(#s, q_node.next, $phys_ptr_cast(SP#hd, ^q_node), ^q_node)), 1)));

axiom $function_arg_type(cf#unfold_sll_list_len_next, 0, ^^bool);

axiom $function_arg_type(cf#unfold_sll_list_len_next, 1, $ptr_to(^q_node));

procedure unfold_sll_list_len_next(SP#hd: $ptr) returns ($result: bool);
  ensures $result == ($non_null($phys_ptr_cast(SP#hd, ^q_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SP#hd, ^q_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(SP#hd, ^q_node), ^q_node)), 1));
  free ensures $result == F#unfold_sll_list_len_next($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#unfold_sll_all_bin(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : bool;

const unique cf#unfold_sll_all_bin: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#unfold_sll_all_bin(#s, SP#hd, SP#tl) } 1 < $decreases_level ==> ($non_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> F#sll_lseg(#s, $phys_ptr_cast(SP#hd, ^q_node), $phys_ptr_cast(SP#tl, ^q_node)) == (F#sll_lseg(#s, $rd_phys_ptr(#s, q_node.next, $phys_ptr_cast(SP#hd, ^q_node), ^q_node), $phys_ptr_cast(SP#tl, ^q_node)) && !$oset_in($phys_ptr_cast(SP#hd, ^q_node), F#sll_lseg_reach(#s, $rd_phys_ptr(#s, q_node.next, $phys_ptr_cast(SP#hd, ^q_node), ^q_node), $phys_ptr_cast(SP#tl, ^q_node))))) && ($non_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> F#sll_lseg_reach(#s, $phys_ptr_cast(SP#hd, ^q_node), $phys_ptr_cast(SP#tl, ^q_node)) == $oset_union(F#sll_lseg_reach(#s, $rd_phys_ptr(#s, q_node.next, $phys_ptr_cast(SP#hd, ^q_node), ^q_node), $phys_ptr_cast(SP#tl, ^q_node)), $oset_singleton($phys_ptr_cast(SP#hd, ^q_node)))) && ($non_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> F#sll_lseg_len_next(#s, $phys_ptr_cast(SP#hd, ^q_node), $phys_ptr_cast(SP#tl, ^q_node)) == $unchk_add(^^nat, F#sll_lseg_len_next(#s, $rd_phys_ptr(#s, q_node.next, $phys_ptr_cast(SP#hd, ^q_node), ^q_node), $phys_ptr_cast(SP#tl, ^q_node)), 1)));

axiom $function_arg_type(cf#unfold_sll_all_bin, 0, ^^bool);

axiom $function_arg_type(cf#unfold_sll_all_bin, 1, $ptr_to(^q_node));

axiom $function_arg_type(cf#unfold_sll_all_bin, 2, $ptr_to(^q_node));

procedure unfold_sll_all_bin(SP#hd: $ptr, SP#tl: $ptr) returns ($result: bool);
  ensures $non_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> F#sll_lseg($s, $phys_ptr_cast(SP#hd, ^q_node), $phys_ptr_cast(SP#tl, ^q_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(SP#hd, ^q_node), ^q_node), $phys_ptr_cast(SP#tl, ^q_node)) && !$oset_in($phys_ptr_cast(SP#hd, ^q_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(SP#hd, ^q_node), ^q_node), $phys_ptr_cast(SP#tl, ^q_node))));
  ensures $non_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(SP#hd, ^q_node), $phys_ptr_cast(SP#tl, ^q_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(SP#hd, ^q_node), ^q_node), $phys_ptr_cast(SP#tl, ^q_node)), $oset_singleton($phys_ptr_cast(SP#hd, ^q_node)));
  ensures $non_null($phys_ptr_cast(SP#hd, ^q_node)) && $phys_ptr_cast(SP#hd, ^q_node) != $phys_ptr_cast(SP#tl, ^q_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(SP#hd, ^q_node), $phys_ptr_cast(SP#tl, ^q_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(SP#hd, ^q_node), ^q_node), $phys_ptr_cast(SP#tl, ^q_node)), 1);
  free ensures $result == F#unfold_sll_all_bin($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



procedure simpleq_remove_head(P#head: $ptr) returns ($result: $ptr);
  requires $non_null($phys_ptr_cast(P#head, ^q_head));
  requires $non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node));
  requires $non_null($phys_ptr_cast(P#head, ^q_head)) ==> ($is_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> $is_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> $non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && $is_null($rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)) && F#sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && F#sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && F#sll_lseg($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && $oset_disjoint(F#sll_lseg_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)), F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)), F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))));
  modifies $s, $cev_pc;
  ensures $non_null($phys_ptr_cast(P#head, ^q_head)) ==> ($is_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> $is_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> $non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && $is_null($rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)) && F#sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && F#sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && F#sll_lseg($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && $oset_disjoint(F#sll_lseg_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)), F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)), F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation simpleq_remove_head(P#head: $ptr) returns ($result: $ptr)
{
  var stmtexpr1#4: $state;
  var SL#_dryad_S3: $state;
  var stmtexpr0#3: $state;
  var SL#_dryad_S2: $state;
  var stmtexpr5#10: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr4#9: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr3#8: $ptr;
  var SL#fst1: $ptr;
  var stmtexpr2#7: $ptr;
  var SL#head0: $ptr;
  var L#fst: $ptr;
  var L#fst_nxt: $ptr;
  var stmtexpr1#6: $oset;
  var stmtexpr0#5: $oset;
  var res_sll_reach#2: $oset;
  var ite#1: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$2^6.3: int;
  var #stackframe: int;

  anon5:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$2^6.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$2^6.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$2^6.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _math \oset ite#1; 
    assume true;
    // if (@_vcc_ptr_eq_null(head)) ...
    if ($is_null($phys_ptr_cast(P#head, ^q_head)))
    {
      anon1:
        // assert @_vcc_possibly_unreachable; 
        assert {:PossiblyUnreachable true} true;
        // ite#1 := @_vcc_oset_empty; 
        ite#1 := $oset_empty();
    }
    else
    {
      anon2:
        // assert @_vcc_possibly_unreachable; 
        assert {:PossiblyUnreachable true} true;
        // _math \oset res_sll_reach#2; 
        // res_sll_reach#2 := sll_reach(*((head->first))); 
        call res_sll_reach#2 := sll_reach($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node));
        assume $full_stop_ext(#tok$3^0.0, $s);
        // ite#1 := @_vcc_oset_union(@_vcc_oset_singleton(head), res_sll_reach#2); 
        ite#1 := $oset_union($oset_singleton($phys_ptr_cast(P#head, ^q_head)), res_sll_reach#2);
    }

  anon6:
    // _dryad_G0 := ite#1; 
    SL#_dryad_G0 := ite#1;
    // _math \oset stmtexpr0#5; 
    // stmtexpr0#5 := _dryad_G0; 
    stmtexpr0#5 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#6; 
    // stmtexpr1#6 := _dryad_G1; 
    stmtexpr1#6 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(head), &&(&&(==>(@_vcc_ptr_neq_null(*((head->first))), &&(&&(unfold_sll(*((head->first))), ==>(@_vcc_ptr_neq_null(*((head->first))), ==(sll_reach(*((head->first))), @_vcc_oset_union(sll_reach(*((*((head->first))->next))), @_vcc_oset_singleton(*((head->first))))))), unfold_sll_list_len_next(*((head->first))))), ==>(@_vcc_ptr_neq_null(*((head->last))), &&(&&(unfold_sll(*((head->last))), ==>(@_vcc_ptr_neq_null(*((head->last))), ==(sll_reach(*((head->last))), @_vcc_oset_union(sll_reach(*((*((head->last))->next))), @_vcc_oset_singleton(*((head->last))))))), unfold_sll_list_len_next(*((head->last)))))), ==>(@_vcc_ptr_neq_null(*((head->first))), unfold_sll_all_bin(*((head->first)), *((head->last)))))); 
    assume $non_null($phys_ptr_cast(P#head, ^q_head)) ==> ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll_all_bin($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
    // assume ==>(@_vcc_ptr_neq_null(head), &&(&&(==>(@_vcc_ptr_neq_null(*((head->first))), &&(&&(unfold_sll(*((head->first))), ==>(@_vcc_ptr_neq_null(*((head->first))), ==(sll_reach(*((head->first))), @_vcc_oset_union(sll_reach(*((*((head->first))->next))), @_vcc_oset_singleton(*((head->first))))))), unfold_sll_list_len_next(*((head->first))))), ==>(@_vcc_ptr_neq_null(*((head->last))), &&(&&(unfold_sll(*((head->last))), ==>(@_vcc_ptr_neq_null(*((head->last))), ==(sll_reach(*((head->last))), @_vcc_oset_union(sll_reach(*((*((head->last))->next))), @_vcc_oset_singleton(*((head->last))))))), unfold_sll_list_len_next(*((head->last)))))), ==>(@_vcc_ptr_neq_null(*((head->first))), unfold_sll_all_bin(*((head->first)), *((head->last)))))); 
    assume $non_null($phys_ptr_cast(P#head, ^q_head)) ==> ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll_all_bin($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(*((head->first))), @_vcc_ptr_neq_pure(*((head->first)), *((head->last)))), ==(sll_lseg(*((head->first)), *((head->last))), &&(sll_lseg(*((*((head->first))->next)), *((head->last))), unchecked!(@_vcc_oset_in(*((head->first)), sll_lseg_reach(*((*((head->first))->next)), *((head->last)))))))); 
    assume $non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node) != $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node) ==> F#sll_lseg($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && !$oset_in($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))));
    // assume ==>(&&(@_vcc_ptr_neq_null(*((head->first))), @_vcc_ptr_neq_pure(*((head->first)), *((head->last)))), ==(sll_lseg_reach(*((head->first)), *((head->last))), @_vcc_oset_union(sll_lseg_reach(*((*((head->first))->next)), *((head->last))), @_vcc_oset_singleton(*((head->first)))))); 
    assume $non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node) != $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node) ==> F#sll_lseg_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(*((head->first))), @_vcc_ptr_neq_pure(*((head->first)), *((head->last)))), ==(sll_lseg_len_next(*((head->first)), *((head->last))), unchecked+(sll_lseg_len_next(*((*((head->first))->next)), *((head->last))), 1))); 
    assume $non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node) != $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node) ==> F#sll_lseg_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)), 1);
    // struct q_node* fst_nxt; 
    // struct q_node* fst; 
    // assume ==>(@_vcc_ptr_neq_null(head), &&(@_vcc_mutable(@state, head), @writes_check(head))); 
    assume $non_null($phys_ptr_cast(P#head, ^q_head)) ==> $mutable($s, $phys_ptr_cast(P#head, ^q_head)) && $top_writable($s, #wrTime$2^6.3, $phys_ptr_cast(P#head, ^q_head));
    // struct q_head* head0; 
    // head0 := head; 
    SL#head0 := $phys_ptr_cast(P#head, ^q_head);
    // struct q_head* stmtexpr2#7; 
    // stmtexpr2#7 := head0; 
    stmtexpr2#7 := $phys_ptr_cast(SL#head0, ^q_head);
    // assume ==>(@_vcc_ptr_neq_null(head), &&(&&(==>(@_vcc_ptr_neq_null(*((head->first))), &&(&&(unfold_sll(*((head->first))), ==>(@_vcc_ptr_neq_null(*((head->first))), ==(sll_reach(*((head->first))), @_vcc_oset_union(sll_reach(*((*((head->first))->next))), @_vcc_oset_singleton(*((head->first))))))), unfold_sll_list_len_next(*((head->first))))), ==>(@_vcc_ptr_neq_null(*((head->last))), &&(&&(unfold_sll(*((head->last))), ==>(@_vcc_ptr_neq_null(*((head->last))), ==(sll_reach(*((head->last))), @_vcc_oset_union(sll_reach(*((*((head->last))->next))), @_vcc_oset_singleton(*((head->last))))))), unfold_sll_list_len_next(*((head->last)))))), ==>(@_vcc_ptr_neq_null(*((head->first))), unfold_sll_all_bin(*((head->first)), *((head->last)))))); 
    assume $non_null($phys_ptr_cast(P#head, ^q_head)) ==> ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll_all_bin($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
    // assume ==>(@_vcc_ptr_neq_null(head), &&(&&(==>(@_vcc_ptr_neq_null(*((head->first))), &&(&&(unfold_sll(*((head->first))), ==>(@_vcc_ptr_neq_null(*((head->first))), ==(sll_reach(*((head->first))), @_vcc_oset_union(sll_reach(*((*((head->first))->next))), @_vcc_oset_singleton(*((head->first))))))), unfold_sll_list_len_next(*((head->first))))), ==>(@_vcc_ptr_neq_null(*((head->last))), &&(&&(unfold_sll(*((head->last))), ==>(@_vcc_ptr_neq_null(*((head->last))), ==(sll_reach(*((head->last))), @_vcc_oset_union(sll_reach(*((*((head->last))->next))), @_vcc_oset_singleton(*((head->last))))))), unfold_sll_list_len_next(*((head->last)))))), ==>(@_vcc_ptr_neq_null(*((head->first))), unfold_sll_all_bin(*((head->first)), *((head->last)))))); 
    assume $non_null($phys_ptr_cast(P#head, ^q_head)) ==> ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll_all_bin($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
    // assert @reads_check_normal((head->first)); 
    assert $thread_local($s, $phys_ptr_cast(P#head, ^q_head));
    // fst := *((head->first)); 
    L#fst := $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node);
    // assume unfold_sll_list_len_next(fst); 
    assume F#unfold_sll_list_len_next($s, $phys_ptr_cast(L#fst, ^q_node));
    // assume unfold_sll(fst); 
    assume F#unfold_sll($s, $phys_ptr_cast(L#fst, ^q_node));
    // assume ==>(@_vcc_ptr_neq_null(fst), ==(sll_reach(fst), @_vcc_oset_union(sll_reach(*((fst->next))), @_vcc_oset_singleton(fst)))); 
    assume $non_null($phys_ptr_cast(L#fst, ^q_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#fst, ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(L#fst, ^q_node), ^q_node)), $oset_singleton($phys_ptr_cast(L#fst, ^q_node)));
    // assume ==>(@_vcc_ptr_neq_null(head), &&(&&(==>(@_vcc_ptr_neq_null(*((head->first))), &&(&&(unfold_sll(*((head->first))), ==>(@_vcc_ptr_neq_null(*((head->first))), ==(sll_reach(*((head->first))), @_vcc_oset_union(sll_reach(*((*((head->first))->next))), @_vcc_oset_singleton(*((head->first))))))), unfold_sll_list_len_next(*((head->first))))), ==>(@_vcc_ptr_neq_null(*((head->last))), &&(&&(unfold_sll(*((head->last))), ==>(@_vcc_ptr_neq_null(*((head->last))), ==(sll_reach(*((head->last))), @_vcc_oset_union(sll_reach(*((*((head->last))->next))), @_vcc_oset_singleton(*((head->last))))))), unfold_sll_list_len_next(*((head->last)))))), ==>(@_vcc_ptr_neq_null(*((head->first))), unfold_sll_all_bin(*((head->first)), *((head->last)))))); 
    assume $non_null($phys_ptr_cast(P#head, ^q_head)) ==> ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll_all_bin($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
    // assume ==>(@_vcc_ptr_neq_null(head), &&(&&(==>(@_vcc_ptr_neq_null(*((head->first))), &&(&&(unfold_sll(*((head->first))), ==>(@_vcc_ptr_neq_null(*((head->first))), ==(sll_reach(*((head->first))), @_vcc_oset_union(sll_reach(*((*((head->first))->next))), @_vcc_oset_singleton(*((head->first))))))), unfold_sll_list_len_next(*((head->first))))), ==>(@_vcc_ptr_neq_null(*((head->last))), &&(&&(unfold_sll(*((head->last))), ==>(@_vcc_ptr_neq_null(*((head->last))), ==(sll_reach(*((head->last))), @_vcc_oset_union(sll_reach(*((*((head->last))->next))), @_vcc_oset_singleton(*((head->last))))))), unfold_sll_list_len_next(*((head->last)))))), ==>(@_vcc_ptr_neq_null(*((head->first))), unfold_sll_all_bin(*((head->first)), *((head->last)))))); 
    assume $non_null($phys_ptr_cast(P#head, ^q_head)) ==> ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll_all_bin($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
    // assume ==>(@_vcc_ptr_neq_null(fst), &&(@_vcc_mutable(@state, fst), @writes_check(fst))); 
    assume $non_null($phys_ptr_cast(L#fst, ^q_node)) ==> $mutable($s, $phys_ptr_cast(L#fst, ^q_node)) && $top_writable($s, #wrTime$2^6.3, $phys_ptr_cast(L#fst, ^q_node));
    // struct q_node* fst1; 
    // fst1 := fst; 
    SL#fst1 := $phys_ptr_cast(L#fst, ^q_node);
    // struct q_node* stmtexpr3#8; 
    // stmtexpr3#8 := fst1; 
    stmtexpr3#8 := $phys_ptr_cast(SL#fst1, ^q_node);
    // assume unfold_sll_list_len_next(fst); 
    assume F#unfold_sll_list_len_next($s, $phys_ptr_cast(L#fst, ^q_node));
    // assume unfold_sll(fst); 
    assume F#unfold_sll($s, $phys_ptr_cast(L#fst, ^q_node));
    // assume ==>(@_vcc_ptr_neq_null(fst), ==(sll_reach(fst), @_vcc_oset_union(sll_reach(*((fst->next))), @_vcc_oset_singleton(fst)))); 
    assume $non_null($phys_ptr_cast(L#fst, ^q_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#fst, ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(L#fst, ^q_node), ^q_node)), $oset_singleton($phys_ptr_cast(L#fst, ^q_node)));
    // assert @reads_check_normal((fst->next)); 
    assert $thread_local($s, $phys_ptr_cast(L#fst, ^q_node));
    // fst_nxt := *((fst->next)); 
    L#fst_nxt := $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(L#fst, ^q_node), ^q_node);
    // assume unfold_sll_list_len_next(fst_nxt); 
    assume F#unfold_sll_list_len_next($s, $phys_ptr_cast(L#fst_nxt, ^q_node));
    // assume unfold_sll(fst_nxt); 
    assume F#unfold_sll($s, $phys_ptr_cast(L#fst_nxt, ^q_node));
    // assume ==>(@_vcc_ptr_neq_null(fst_nxt), ==(sll_reach(fst_nxt), @_vcc_oset_union(sll_reach(*((fst_nxt->next))), @_vcc_oset_singleton(fst_nxt)))); 
    assume $non_null($phys_ptr_cast(L#fst_nxt, ^q_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#fst_nxt, ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(L#fst_nxt, ^q_node), ^q_node)), $oset_singleton($phys_ptr_cast(L#fst_nxt, ^q_node)));
    // assume unfold_sll_list_len_next(fst); 
    assume F#unfold_sll_list_len_next($s, $phys_ptr_cast(L#fst, ^q_node));
    // assume unfold_sll(fst); 
    assume F#unfold_sll($s, $phys_ptr_cast(L#fst, ^q_node));
    // assume ==>(@_vcc_ptr_neq_null(fst), ==(sll_reach(fst), @_vcc_oset_union(sll_reach(*((fst->next))), @_vcc_oset_singleton(fst)))); 
    assume $non_null($phys_ptr_cast(L#fst, ^q_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#fst, ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(L#fst, ^q_node), ^q_node)), $oset_singleton($phys_ptr_cast(L#fst, ^q_node)));
    // _math \state _dryad_S0; 
    // _dryad_S0 := @_vcc_current_state(@state); 
    SL#_dryad_S0 := $current_state($s);
    // _math \state stmtexpr4#9; 
    // stmtexpr4#9 := _dryad_S0; 
    stmtexpr4#9 := SL#_dryad_S0;
    // assert @prim_writes_check((head->first)); 
    assert $writable_prim($s, #wrTime$2^6.3, $dot($phys_ptr_cast(P#head, ^q_head), q_head.first));
    // *(head->first) := fst_nxt; 
    call $write_int(q_head.first, $phys_ptr_cast(P#head, ^q_head), $ptr_to_int($phys_ptr_cast(L#fst_nxt, ^q_node)));
    assume $full_stop_ext(#tok$2^20.3, $s);
    // _math \state _dryad_S1; 
    // _dryad_S1 := @_vcc_current_state(@state); 
    SL#_dryad_S1 := $current_state($s);
    // _math \state stmtexpr5#10; 
    // stmtexpr5#10 := _dryad_S1; 
    stmtexpr5#10 := SL#_dryad_S1;
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(*((head->last)))))), ==(old(_dryad_S0, sll(*((head->last)))), old(_dryad_S1, sll(*((head->last)))))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
    // assume &&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(*((head->last)))))), ==(old(_dryad_S0, sll(*((head->last)))), old(_dryad_S1, sll(*((head->last)))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(*((head->last)))))), ==(old(_dryad_S0, sll_reach(*((head->last)))), old(_dryad_S1, sll_reach(*((head->last))))))); 
    assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_reach(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(*((head->last)))))), ==(old(_dryad_S0, sll_reach(*((head->last)))), old(_dryad_S1, sll_reach(*((head->last)))))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_reach(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(fst1)))), ==(old(_dryad_S0, sll(fst1)), old(_dryad_S1, sll(fst1)))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#fst1, ^q_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(SL#fst1, ^q_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(SL#fst1, ^q_node));
    // assume &&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(fst1)))), ==(old(_dryad_S0, sll(fst1)), old(_dryad_S1, sll(fst1)))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(fst1)))), ==(old(_dryad_S0, sll_reach(fst1)), old(_dryad_S1, sll_reach(fst1))))); 
    assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#fst1, ^q_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(SL#fst1, ^q_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(SL#fst1, ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#fst1, ^q_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#fst1, ^q_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(SL#fst1, ^q_node)));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(fst1)))), ==(old(_dryad_S0, sll_reach(fst1)), old(_dryad_S1, sll_reach(fst1)))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#fst1, ^q_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#fst1, ^q_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(SL#fst1, ^q_node));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(fst)))), ==(old(_dryad_S0, sll(fst)), old(_dryad_S1, sll(fst)))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node));
    // assume &&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(fst)))), ==(old(_dryad_S0, sll(fst)), old(_dryad_S1, sll(fst)))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(fst)))), ==(old(_dryad_S0, sll_reach(fst)), old(_dryad_S1, sll_reach(fst))))); 
    assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node)));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(fst)))), ==(old(_dryad_S0, sll_reach(fst)), old(_dryad_S1, sll_reach(fst)))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(fst_nxt)))), ==(old(_dryad_S0, sll(fst_nxt)), old(_dryad_S1, sll(fst_nxt)))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#fst_nxt, ^q_node));
    // assume &&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(fst_nxt)))), ==(old(_dryad_S0, sll(fst_nxt)), old(_dryad_S1, sll(fst_nxt)))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(fst_nxt)))), ==(old(_dryad_S0, sll_reach(fst_nxt)), old(_dryad_S1, sll_reach(fst_nxt))))); 
    assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#fst_nxt, ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#fst_nxt, ^q_node)));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_reach(fst_nxt)))), ==(old(_dryad_S0, sll_reach(fst_nxt)), old(_dryad_S1, sll_reach(fst_nxt)))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#fst_nxt, ^q_node));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((head->first))), *((head->last)))))), ==(old(_dryad_S0, sll_lseg(old(_dryad_S0, *((head->first))), *((head->last)))), old(_dryad_S1, sll_lseg(old(_dryad_S0, *((head->first))), *((head->last)))))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((head->first))), *((head->last)))))), ==(old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((head->first))), *((head->last)))), old(_dryad_S1, sll_lseg_reach(old(_dryad_S0, *((head->first))), *((head->last)))))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((head->first))), *((head->last)))))), ==(old(_dryad_S0, sll_lseg_len_next(old(_dryad_S0, *((head->first))), *((head->last)))), old(_dryad_S1, sll_lseg_len_next(old(_dryad_S0, *((head->first))), *((head->last)))))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
    // assume &&(&&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((head->first))), *((head->last)))))), ==(old(_dryad_S0, sll_lseg(old(_dryad_S0, *((head->first))), *((head->last)))), old(_dryad_S1, sll_lseg(old(_dryad_S0, *((head->first))), *((head->last)))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((head->first))), *((head->last)))))), ==(old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((head->first))), *((head->last)))), old(_dryad_S1, sll_lseg_reach(old(_dryad_S0, *((head->first))), *((head->last))))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((head->first))), *((head->last)))))), ==(old(_dryad_S0, sll_lseg_len_next(old(_dryad_S0, *((head->first))), *((head->last)))), old(_dryad_S1, sll_lseg_len_next(old(_dryad_S0, *((head->first))), *((head->last))))))); 
    assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))))), ==(old(_dryad_S0, sll_lseg(fst, *((head->last)))), old(_dryad_S1, sll_lseg(fst, *((head->last)))))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))))), ==(old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))), old(_dryad_S1, sll_lseg_reach(fst, *((head->last)))))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))))), ==(old(_dryad_S0, sll_lseg_len_next(fst, *((head->last)))), old(_dryad_S1, sll_lseg_len_next(fst, *((head->last)))))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
    // assume &&(&&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))))), ==(old(_dryad_S0, sll_lseg(fst, *((head->last)))), old(_dryad_S1, sll_lseg(fst, *((head->last)))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))))), ==(old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))), old(_dryad_S1, sll_lseg_reach(fst, *((head->last))))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))))), ==(old(_dryad_S0, sll_lseg_len_next(fst, *((head->last)))), old(_dryad_S1, sll_lseg_len_next(fst, *((head->last))))))); 
    assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))))), ==(old(_dryad_S0, sll_lseg(fst, *((head->last)))), old(_dryad_S1, sll_lseg(fst, *((head->last)))))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))))), ==(old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))), old(_dryad_S1, sll_lseg_reach(fst, *((head->last)))))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))))), ==(old(_dryad_S0, sll_lseg_len_next(fst, *((head->last)))), old(_dryad_S1, sll_lseg_len_next(fst, *((head->last)))))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
    // assume &&(&&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))))), ==(old(_dryad_S0, sll_lseg(fst, *((head->last)))), old(_dryad_S1, sll_lseg(fst, *((head->last)))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))))), ==(old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))), old(_dryad_S1, sll_lseg_reach(fst, *((head->last))))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst, *((head->last)))))), ==(old(_dryad_S0, sll_lseg_len_next(fst, *((head->last)))), old(_dryad_S1, sll_lseg_len_next(fst, *((head->last))))))); 
    assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst_nxt, *((head->last)))))), ==(old(_dryad_S0, sll_lseg(fst_nxt, *((head->last)))), old(_dryad_S1, sll_lseg(fst_nxt, *((head->last)))))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst_nxt, *((head->last)))))), ==(old(_dryad_S0, sll_lseg_reach(fst_nxt, *((head->last)))), old(_dryad_S1, sll_lseg_reach(fst_nxt, *((head->last)))))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
    // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst_nxt, *((head->last)))))), ==(old(_dryad_S0, sll_lseg_len_next(fst_nxt, *((head->last)))), old(_dryad_S1, sll_lseg_len_next(fst_nxt, *((head->last)))))); 
    assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
    // assume &&(&&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst_nxt, *((head->last)))))), ==(old(_dryad_S0, sll_lseg(fst_nxt, *((head->last)))), old(_dryad_S1, sll_lseg(fst_nxt, *((head->last)))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst_nxt, *((head->last)))))), ==(old(_dryad_S0, sll_lseg_reach(fst_nxt, *((head->last)))), old(_dryad_S1, sll_lseg_reach(fst_nxt, *((head->last))))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S0, sll_lseg_reach(fst_nxt, *((head->last)))))), ==(old(_dryad_S0, sll_lseg_len_next(fst_nxt, *((head->last)))), old(_dryad_S1, sll_lseg_len_next(fst_nxt, *((head->last))))))); 
    assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S1, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
    // assume ==>(!(@_vcc_ptr_eq_pure(head, head0)), @_vcc_ptr_eq_pure(*((head0->first)), old(_dryad_S0, *((head0->first))))); 
    assume !($phys_ptr_cast(P#head, ^q_head) == $phys_ptr_cast(SL#head0, ^q_head)) ==> $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node) == $rd_phys_ptr(SL#_dryad_S0, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node);
    // assume ==>(!(@_vcc_ptr_eq_pure(head, head0)), @_vcc_ptr_eq_pure(*((head0->last)), old(_dryad_S0, *((head0->last))))); 
    assume !($phys_ptr_cast(P#head, ^q_head) == $phys_ptr_cast(SL#head0, ^q_head)) ==> $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node) == $rd_phys_ptr(SL#_dryad_S0, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node);
    // assume unfold_sll_list_len_next(fst1); 
    assume F#unfold_sll_list_len_next($s, $phys_ptr_cast(SL#fst1, ^q_node));
    // assume unfold_sll(fst1); 
    assume F#unfold_sll($s, $phys_ptr_cast(SL#fst1, ^q_node));
    // assume ==>(@_vcc_ptr_neq_null(fst1), ==(sll_reach(fst1), @_vcc_oset_union(sll_reach(*((fst1->next))), @_vcc_oset_singleton(fst1)))); 
    assume $non_null($phys_ptr_cast(SL#fst1, ^q_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#fst1, ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(SL#fst1, ^q_node), ^q_node)), $oset_singleton($phys_ptr_cast(SL#fst1, ^q_node)));
    // assume ==>(@_vcc_ptr_neq_null(head0), &&(&&(==>(@_vcc_ptr_neq_null(*((head0->first))), &&(&&(unfold_sll(*((head0->first))), ==>(@_vcc_ptr_neq_null(*((head0->first))), ==(sll_reach(*((head0->first))), @_vcc_oset_union(sll_reach(*((*((head0->first))->next))), @_vcc_oset_singleton(*((head0->first))))))), unfold_sll_list_len_next(*((head0->first))))), ==>(@_vcc_ptr_neq_null(*((head0->last))), &&(&&(unfold_sll(*((head0->last))), ==>(@_vcc_ptr_neq_null(*((head0->last))), ==(sll_reach(*((head0->last))), @_vcc_oset_union(sll_reach(*((*((head0->last))->next))), @_vcc_oset_singleton(*((head0->last))))))), unfold_sll_list_len_next(*((head0->last)))))), ==>(@_vcc_ptr_neq_null(*((head0->first))), unfold_sll_all_bin(*((head0->first)), *((head0->last)))))); 
    assume $non_null($phys_ptr_cast(SL#head0, ^q_head)) ==> ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#unfold_sll_all_bin($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)));
    // assume ==>(@_vcc_ptr_neq_null(head0), &&(&&(==>(@_vcc_ptr_neq_null(*((head0->first))), &&(&&(unfold_sll(*((head0->first))), ==>(@_vcc_ptr_neq_null(*((head0->first))), ==(sll_reach(*((head0->first))), @_vcc_oset_union(sll_reach(*((*((head0->first))->next))), @_vcc_oset_singleton(*((head0->first))))))), unfold_sll_list_len_next(*((head0->first))))), ==>(@_vcc_ptr_neq_null(*((head0->last))), &&(&&(unfold_sll(*((head0->last))), ==>(@_vcc_ptr_neq_null(*((head0->last))), ==(sll_reach(*((head0->last))), @_vcc_oset_union(sll_reach(*((*((head0->last))->next))), @_vcc_oset_singleton(*((head0->last))))))), unfold_sll_list_len_next(*((head0->last)))))), ==>(@_vcc_ptr_neq_null(*((head0->first))), unfold_sll_all_bin(*((head0->first)), *((head0->last)))))); 
    assume $non_null($phys_ptr_cast(SL#head0, ^q_head)) ==> ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#unfold_sll_all_bin($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)));
    // assume unfold_sll_list_len_next(fst); 
    assume F#unfold_sll_list_len_next($s, $phys_ptr_cast(L#fst, ^q_node));
    // assume unfold_sll(fst); 
    assume F#unfold_sll($s, $phys_ptr_cast(L#fst, ^q_node));
    // assume ==>(@_vcc_ptr_neq_null(fst), ==(sll_reach(fst), @_vcc_oset_union(sll_reach(*((fst->next))), @_vcc_oset_singleton(fst)))); 
    assume $non_null($phys_ptr_cast(L#fst, ^q_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#fst, ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(L#fst, ^q_node), ^q_node)), $oset_singleton($phys_ptr_cast(L#fst, ^q_node)));
    // assume unfold_sll_list_len_next(fst_nxt); 
    assume F#unfold_sll_list_len_next($s, $phys_ptr_cast(L#fst_nxt, ^q_node));
    // assume unfold_sll(fst_nxt); 
    assume F#unfold_sll($s, $phys_ptr_cast(L#fst_nxt, ^q_node));
    // assume ==>(@_vcc_ptr_neq_null(fst_nxt), ==(sll_reach(fst_nxt), @_vcc_oset_union(sll_reach(*((fst_nxt->next))), @_vcc_oset_singleton(fst_nxt)))); 
    assume $non_null($phys_ptr_cast(L#fst_nxt, ^q_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#fst_nxt, ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(L#fst_nxt, ^q_node), ^q_node)), $oset_singleton($phys_ptr_cast(L#fst_nxt, ^q_node)));
    // assume ==>(@_vcc_ptr_neq_null(head), &&(&&(==>(@_vcc_ptr_neq_null(*((head->first))), &&(&&(unfold_sll(*((head->first))), ==>(@_vcc_ptr_neq_null(*((head->first))), ==(sll_reach(*((head->first))), @_vcc_oset_union(sll_reach(*((*((head->first))->next))), @_vcc_oset_singleton(*((head->first))))))), unfold_sll_list_len_next(*((head->first))))), ==>(@_vcc_ptr_neq_null(*((head->last))), &&(&&(unfold_sll(*((head->last))), ==>(@_vcc_ptr_neq_null(*((head->last))), ==(sll_reach(*((head->last))), @_vcc_oset_union(sll_reach(*((*((head->last))->next))), @_vcc_oset_singleton(*((head->last))))))), unfold_sll_list_len_next(*((head->last)))))), ==>(@_vcc_ptr_neq_null(*((head->first))), unfold_sll_all_bin(*((head->first)), *((head->last)))))); 
    assume $non_null($phys_ptr_cast(P#head, ^q_head)) ==> ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll_all_bin($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
    // assume ==>(@_vcc_ptr_neq_null(head), &&(&&(==>(@_vcc_ptr_neq_null(*((head->first))), &&(&&(unfold_sll(*((head->first))), ==>(@_vcc_ptr_neq_null(*((head->first))), ==(sll_reach(*((head->first))), @_vcc_oset_union(sll_reach(*((*((head->first))->next))), @_vcc_oset_singleton(*((head->first))))))), unfold_sll_list_len_next(*((head->first))))), ==>(@_vcc_ptr_neq_null(*((head->last))), &&(&&(unfold_sll(*((head->last))), ==>(@_vcc_ptr_neq_null(*((head->last))), ==(sll_reach(*((head->last))), @_vcc_oset_union(sll_reach(*((*((head->last))->next))), @_vcc_oset_singleton(*((head->last))))))), unfold_sll_list_len_next(*((head->last)))))), ==>(@_vcc_ptr_neq_null(*((head->first))), unfold_sll_all_bin(*((head->first)), *((head->last)))))); 
    assume $non_null($phys_ptr_cast(P#head, ^q_head)) ==> ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll_all_bin($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
    // assume unfold_sll_list_len_next(fst_nxt); 
    assume F#unfold_sll_list_len_next($s, $phys_ptr_cast(L#fst_nxt, ^q_node));
    // assume unfold_sll(fst_nxt); 
    assume F#unfold_sll($s, $phys_ptr_cast(L#fst_nxt, ^q_node));
    // assume ==>(@_vcc_ptr_neq_null(fst_nxt), ==(sll_reach(fst_nxt), @_vcc_oset_union(sll_reach(*((fst_nxt->next))), @_vcc_oset_singleton(fst_nxt)))); 
    assume $non_null($phys_ptr_cast(L#fst_nxt, ^q_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#fst_nxt, ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(L#fst_nxt, ^q_node), ^q_node)), $oset_singleton($phys_ptr_cast(L#fst_nxt, ^q_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(*((head->first))), @_vcc_ptr_neq_pure(*((head->first)), *((head->last)))), ==(sll_lseg(*((head->first)), *((head->last))), &&(sll_lseg(*((*((head->first))->next)), *((head->last))), unchecked!(@_vcc_oset_in(*((head->first)), sll_lseg_reach(*((*((head->first))->next)), *((head->last)))))))); 
    assume $non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node) != $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node) ==> F#sll_lseg($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && !$oset_in($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))));
    // assume ==>(&&(@_vcc_ptr_neq_null(*((head->first))), @_vcc_ptr_neq_pure(*((head->first)), *((head->last)))), ==(sll_lseg_reach(*((head->first)), *((head->last))), @_vcc_oset_union(sll_lseg_reach(*((*((head->first))->next)), *((head->last))), @_vcc_oset_singleton(*((head->first)))))); 
    assume $non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node) != $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node) ==> F#sll_lseg_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(*((head->first))), @_vcc_ptr_neq_pure(*((head->first)), *((head->last)))), ==(sll_lseg_len_next(*((head->first)), *((head->last))), unchecked+(sll_lseg_len_next(*((*((head->first))->next)), *((head->last))), 1))); 
    assume $non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node) != $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node) ==> F#sll_lseg_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)), 1);
    assume true;
    // if (@_vcc_ptr_eq_null(fst_nxt)) ...
    if ($is_null($phys_ptr_cast(L#fst_nxt, ^q_node)))
    {
      anon3:
        // _math \state _dryad_S2; 
        // _dryad_S2 := @_vcc_current_state(@state); 
        SL#_dryad_S2 := $current_state($s);
        // _math \state stmtexpr0#3; 
        // stmtexpr0#3 := _dryad_S2; 
        stmtexpr0#3 := SL#_dryad_S2;
        // assert @prim_writes_check((head->last)); 
        assert $writable_prim($s, #wrTime$2^6.3, $dot($phys_ptr_cast(P#head, ^q_head), q_head.last));
        // *(head->last) := fst_nxt; 
        call $write_int(q_head.last, $phys_ptr_cast(P#head, ^q_head), $ptr_to_int($phys_ptr_cast(L#fst_nxt, ^q_node)));
        assume $full_stop_ext(#tok$2^23.5, $s);
        // _math \state _dryad_S3; 
        // _dryad_S3 := @_vcc_current_state(@state); 
        SL#_dryad_S3 := $current_state($s);
        // _math \state stmtexpr1#4; 
        // stmtexpr1#4 := _dryad_S3; 
        stmtexpr1#4 := SL#_dryad_S3;
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(*((head->first)))))), ==(old(_dryad_S2, sll(*((head->first)))), old(_dryad_S3, sll(*((head->first)))))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node));
        // assume &&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(*((head->first)))))), ==(old(_dryad_S2, sll(*((head->first)))), old(_dryad_S3, sll(*((head->first)))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(*((head->first)))))), ==(old(_dryad_S2, sll_reach(*((head->first)))), old(_dryad_S3, sll_reach(*((head->first))))))); 
        assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_reach(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(*((head->first)))))), ==(old(_dryad_S2, sll_reach(*((head->first)))), old(_dryad_S3, sll_reach(*((head->first)))))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_reach(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(fst1)))), ==(old(_dryad_S2, sll(fst1)), old(_dryad_S3, sll(fst1)))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#fst1, ^q_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(SL#fst1, ^q_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(SL#fst1, ^q_node));
        // assume &&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(fst1)))), ==(old(_dryad_S2, sll(fst1)), old(_dryad_S3, sll(fst1)))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(fst1)))), ==(old(_dryad_S2, sll_reach(fst1)), old(_dryad_S3, sll_reach(fst1))))); 
        assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#fst1, ^q_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(SL#fst1, ^q_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(SL#fst1, ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#fst1, ^q_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#fst1, ^q_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(SL#fst1, ^q_node)));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(fst1)))), ==(old(_dryad_S2, sll_reach(fst1)), old(_dryad_S3, sll_reach(fst1)))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#fst1, ^q_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(SL#fst1, ^q_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(SL#fst1, ^q_node));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(fst)))), ==(old(_dryad_S2, sll(fst)), old(_dryad_S3, sll(fst)))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node));
        // assume &&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(fst)))), ==(old(_dryad_S2, sll(fst)), old(_dryad_S3, sll(fst)))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(fst)))), ==(old(_dryad_S2, sll_reach(fst)), old(_dryad_S3, sll_reach(fst))))); 
        assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node)));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(fst)))), ==(old(_dryad_S2, sll_reach(fst)), old(_dryad_S3, sll_reach(fst)))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(fst_nxt)))), ==(old(_dryad_S2, sll(fst_nxt)), old(_dryad_S3, sll(fst_nxt)))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(L#fst_nxt, ^q_node));
        // assume &&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(fst_nxt)))), ==(old(_dryad_S2, sll(fst_nxt)), old(_dryad_S3, sll(fst_nxt)))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(fst_nxt)))), ==(old(_dryad_S2, sll_reach(fst_nxt)), old(_dryad_S3, sll_reach(fst_nxt))))); 
        assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(L#fst_nxt, ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(L#fst_nxt, ^q_node)));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_reach(fst_nxt)))), ==(old(_dryad_S2, sll_reach(fst_nxt)), old(_dryad_S3, sll_reach(fst_nxt)))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(L#fst_nxt, ^q_node));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(*((head->first)), old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg(*((head->first)), old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg(*((head->first)), old(_dryad_S2, *((head->last))))))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(*((head->first)), old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_reach(*((head->first)), old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_reach(*((head->first)), old(_dryad_S2, *((head->last))))))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(*((head->first)), old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_len_next(*((head->first)), old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_len_next(*((head->first)), old(_dryad_S2, *((head->last))))))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
        // assume &&(&&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(*((head->first)), old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg(*((head->first)), old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg(*((head->first)), old(_dryad_S2, *((head->last))))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(*((head->first)), old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_reach(*((head->first)), old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_reach(*((head->first)), old(_dryad_S2, *((head->last)))))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(*((head->first)), old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_len_next(*((head->first)), old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_len_next(*((head->first)), old(_dryad_S2, *((head->last)))))))); 
        assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg(fst, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg(fst, old(_dryad_S2, *((head->last))))))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_len_next(fst, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_len_next(fst, old(_dryad_S2, *((head->last))))))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
        // assume &&(&&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg(fst, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg(fst, old(_dryad_S2, *((head->last))))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_reach(fst, old(_dryad_S2, *((head->last)))))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_len_next(fst, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_len_next(fst, old(_dryad_S2, *((head->last)))))))); 
        assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg(fst, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg(fst, old(_dryad_S2, *((head->last))))))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_len_next(fst, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_len_next(fst, old(_dryad_S2, *((head->last))))))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
        // assume &&(&&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg(fst, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg(fst, old(_dryad_S2, *((head->last))))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_reach(fst, old(_dryad_S2, *((head->last)))))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_len_next(fst, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_len_next(fst, old(_dryad_S2, *((head->last)))))))); 
        assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S2, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S3, $phys_ptr_cast(L#fst, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst_nxt, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg(fst_nxt, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg(fst_nxt, old(_dryad_S2, *((head->last))))))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S3, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst_nxt, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_reach(fst_nxt, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_reach(fst_nxt, old(_dryad_S2, *((head->last))))))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S3, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
        // assume ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst_nxt, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_len_next(fst_nxt, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_len_next(fst_nxt, old(_dryad_S2, *((head->last))))))); 
        assume !$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S3, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node));
        // assume &&(&&(==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst_nxt, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg(fst_nxt, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg(fst_nxt, old(_dryad_S2, *((head->last))))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst_nxt, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_reach(fst_nxt, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_reach(fst_nxt, old(_dryad_S2, *((head->last)))))))), ==>(unchecked!(@_vcc_oset_in(head, old(_dryad_S2, sll_lseg_reach(fst_nxt, old(_dryad_S2, *((head->last))))))), ==(old(_dryad_S2, sll_lseg_len_next(fst_nxt, old(_dryad_S2, *((head->last))))), old(_dryad_S3, sll_lseg_len_next(fst_nxt, old(_dryad_S2, *((head->last)))))))); 
        assume (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg(SL#_dryad_S3, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_reach(SL#_dryad_S3, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && (!$oset_in($phys_ptr_cast(P#head, ^q_head), F#sll_lseg_reach(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) ==> F#sll_lseg_len_next(SL#_dryad_S2, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == F#sll_lseg_len_next(SL#_dryad_S3, $phys_ptr_cast(L#fst_nxt, ^q_node), $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
        // assume ==>(!(@_vcc_ptr_eq_pure(head, head0)), @_vcc_ptr_eq_pure(*((head0->first)), old(_dryad_S2, *((head0->first))))); 
        assume !($phys_ptr_cast(P#head, ^q_head) == $phys_ptr_cast(SL#head0, ^q_head)) ==> $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node) == $rd_phys_ptr(SL#_dryad_S2, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node);
        // assume ==>(!(@_vcc_ptr_eq_pure(head, head0)), @_vcc_ptr_eq_pure(*((head0->last)), old(_dryad_S2, *((head0->last))))); 
        assume !($phys_ptr_cast(P#head, ^q_head) == $phys_ptr_cast(SL#head0, ^q_head)) ==> $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node) == $rd_phys_ptr(SL#_dryad_S2, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node);
        // assume unfold_sll_list_len_next(fst1); 
        assume F#unfold_sll_list_len_next($s, $phys_ptr_cast(SL#fst1, ^q_node));
        // assume unfold_sll(fst1); 
        assume F#unfold_sll($s, $phys_ptr_cast(SL#fst1, ^q_node));
        // assume ==>(@_vcc_ptr_neq_null(fst1), ==(sll_reach(fst1), @_vcc_oset_union(sll_reach(*((fst1->next))), @_vcc_oset_singleton(fst1)))); 
        assume $non_null($phys_ptr_cast(SL#fst1, ^q_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#fst1, ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(SL#fst1, ^q_node), ^q_node)), $oset_singleton($phys_ptr_cast(SL#fst1, ^q_node)));
        // assume ==>(@_vcc_ptr_neq_null(head0), &&(&&(==>(@_vcc_ptr_neq_null(*((head0->first))), &&(&&(unfold_sll(*((head0->first))), ==>(@_vcc_ptr_neq_null(*((head0->first))), ==(sll_reach(*((head0->first))), @_vcc_oset_union(sll_reach(*((*((head0->first))->next))), @_vcc_oset_singleton(*((head0->first))))))), unfold_sll_list_len_next(*((head0->first))))), ==>(@_vcc_ptr_neq_null(*((head0->last))), &&(&&(unfold_sll(*((head0->last))), ==>(@_vcc_ptr_neq_null(*((head0->last))), ==(sll_reach(*((head0->last))), @_vcc_oset_union(sll_reach(*((*((head0->last))->next))), @_vcc_oset_singleton(*((head0->last))))))), unfold_sll_list_len_next(*((head0->last)))))), ==>(@_vcc_ptr_neq_null(*((head0->first))), unfold_sll_all_bin(*((head0->first)), *((head0->last)))))); 
        assume $non_null($phys_ptr_cast(SL#head0, ^q_head)) ==> ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#unfold_sll_all_bin($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)));
        // assume ==>(@_vcc_ptr_neq_null(head0), &&(&&(==>(@_vcc_ptr_neq_null(*((head0->first))), &&(&&(unfold_sll(*((head0->first))), ==>(@_vcc_ptr_neq_null(*((head0->first))), ==(sll_reach(*((head0->first))), @_vcc_oset_union(sll_reach(*((*((head0->first))->next))), @_vcc_oset_singleton(*((head0->first))))))), unfold_sll_list_len_next(*((head0->first))))), ==>(@_vcc_ptr_neq_null(*((head0->last))), &&(&&(unfold_sll(*((head0->last))), ==>(@_vcc_ptr_neq_null(*((head0->last))), ==(sll_reach(*((head0->last))), @_vcc_oset_union(sll_reach(*((*((head0->last))->next))), @_vcc_oset_singleton(*((head0->last))))))), unfold_sll_list_len_next(*((head0->last)))))), ==>(@_vcc_ptr_neq_null(*((head0->first))), unfold_sll_all_bin(*((head0->first)), *((head0->last)))))); 
        assume $non_null($phys_ptr_cast(SL#head0, ^q_head)) ==> ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)) ==> F#unfold_sll_all_bin($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(SL#head0, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(SL#head0, ^q_head), ^q_node)));
        // assume unfold_sll_list_len_next(fst); 
        assume F#unfold_sll_list_len_next($s, $phys_ptr_cast(L#fst, ^q_node));
        // assume unfold_sll(fst); 
        assume F#unfold_sll($s, $phys_ptr_cast(L#fst, ^q_node));
        // assume ==>(@_vcc_ptr_neq_null(fst), ==(sll_reach(fst), @_vcc_oset_union(sll_reach(*((fst->next))), @_vcc_oset_singleton(fst)))); 
        assume $non_null($phys_ptr_cast(L#fst, ^q_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#fst, ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(L#fst, ^q_node), ^q_node)), $oset_singleton($phys_ptr_cast(L#fst, ^q_node)));
        // assume unfold_sll_list_len_next(fst_nxt); 
        assume F#unfold_sll_list_len_next($s, $phys_ptr_cast(L#fst_nxt, ^q_node));
        // assume unfold_sll(fst_nxt); 
        assume F#unfold_sll($s, $phys_ptr_cast(L#fst_nxt, ^q_node));
        // assume ==>(@_vcc_ptr_neq_null(fst_nxt), ==(sll_reach(fst_nxt), @_vcc_oset_union(sll_reach(*((fst_nxt->next))), @_vcc_oset_singleton(fst_nxt)))); 
        assume $non_null($phys_ptr_cast(L#fst_nxt, ^q_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#fst_nxt, ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(L#fst_nxt, ^q_node), ^q_node)), $oset_singleton($phys_ptr_cast(L#fst_nxt, ^q_node)));
        // assume ==>(@_vcc_ptr_neq_null(head), &&(&&(==>(@_vcc_ptr_neq_null(*((head->first))), &&(&&(unfold_sll(*((head->first))), ==>(@_vcc_ptr_neq_null(*((head->first))), ==(sll_reach(*((head->first))), @_vcc_oset_union(sll_reach(*((*((head->first))->next))), @_vcc_oset_singleton(*((head->first))))))), unfold_sll_list_len_next(*((head->first))))), ==>(@_vcc_ptr_neq_null(*((head->last))), &&(&&(unfold_sll(*((head->last))), ==>(@_vcc_ptr_neq_null(*((head->last))), ==(sll_reach(*((head->last))), @_vcc_oset_union(sll_reach(*((*((head->last))->next))), @_vcc_oset_singleton(*((head->last))))))), unfold_sll_list_len_next(*((head->last)))))), ==>(@_vcc_ptr_neq_null(*((head->first))), unfold_sll_all_bin(*((head->first)), *((head->last)))))); 
        assume $non_null($phys_ptr_cast(P#head, ^q_head)) ==> ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll_all_bin($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
        // assume ==>(@_vcc_ptr_neq_null(head), &&(&&(==>(@_vcc_ptr_neq_null(*((head->first))), &&(&&(unfold_sll(*((head->first))), ==>(@_vcc_ptr_neq_null(*((head->first))), ==(sll_reach(*((head->first))), @_vcc_oset_union(sll_reach(*((*((head->first))->next))), @_vcc_oset_singleton(*((head->first))))))), unfold_sll_list_len_next(*((head->first))))), ==>(@_vcc_ptr_neq_null(*((head->last))), &&(&&(unfold_sll(*((head->last))), ==>(@_vcc_ptr_neq_null(*((head->last))), ==(sll_reach(*((head->last))), @_vcc_oset_union(sll_reach(*((*((head->last))->next))), @_vcc_oset_singleton(*((head->last))))))), unfold_sll_list_len_next(*((head->last)))))), ==>(@_vcc_ptr_neq_null(*((head->first))), unfold_sll_all_bin(*((head->first)), *((head->last)))))); 
        assume $non_null($phys_ptr_cast(P#head, ^q_head)) ==> ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) && ($non_null($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#sll_reach($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node), ^q_node)), $oset_singleton($rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)))) && F#unfold_sll_list_len_next($s, $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node))) && ($non_null($rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node)) ==> F#unfold_sll_all_bin($s, $rd_phys_ptr($s, q_head.first, $phys_ptr_cast(P#head, ^q_head), ^q_node), $rd_phys_ptr($s, q_head.last, $phys_ptr_cast(P#head, ^q_head), ^q_node)));
        // assume unfold_sll_list_len_next(fst_nxt); 
        assume F#unfold_sll_list_len_next($s, $phys_ptr_cast(L#fst_nxt, ^q_node));
        // assume unfold_sll(fst_nxt); 
        assume F#unfold_sll($s, $phys_ptr_cast(L#fst_nxt, ^q_node));
        // assume ==>(@_vcc_ptr_neq_null(fst_nxt), ==(sll_reach(fst_nxt), @_vcc_oset_union(sll_reach(*((fst_nxt->next))), @_vcc_oset_singleton(fst_nxt)))); 
        assume $non_null($phys_ptr_cast(L#fst_nxt, ^q_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#fst_nxt, ^q_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, q_node.next, $phys_ptr_cast(L#fst_nxt, ^q_node), ^q_node)), $oset_singleton($phys_ptr_cast(L#fst_nxt, ^q_node)));
    }
    else
    {
      anon4:
        // assert @_vcc_possibly_unreachable; 
        assert {:PossiblyUnreachable true} true;
    }

  anon7:
    // return head; 
    $result := $phys_ptr_cast(P#head, ^q_head);
    assume true;
    assert $position_marker();
    goto #exit;

  anon8:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$2^23.5: $token;

const unique #tok$2^20.3: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^6.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cos?5Copenbsd?5Cbsd_squeue_remove_head.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cos?5Copenbsd?5Cbsd_squeue_remove_head.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cos?5Copenbsd?5Cdryad_bsd_queue.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cos?5Copenbsd?5Cdryad_bsd_queue.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^q_node);
