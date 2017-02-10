
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
b0022 : bool,
b0023 : bool,
b0024 : bool,
b0025 : bool,
b0026 : bool,
b0027 : bool,
b0028 : bool,
b0029 : bool,
b0030 : bool,
b0031 : bool,
b0032 : bool,
b0033 : bool,
b0034 : bool,
b0035 : bool,
b0036 : bool,
b0037 : bool,
b0038 : bool,
b0039 : bool,
b0040 : bool,
b0041 : bool,
b0042 : bool,
b0043 : bool,
b0044 : bool,
b0045 : bool,
b0046 : bool,
b0047 : bool,
b0048 : bool,
b0049 : bool,
b0050 : bool,
b0051 : bool,
b0052 : bool,
b0053 : bool,
b0054 : bool,
b0055 : bool,
b0056 : bool,
b0057 : bool,
b0058 : bool,
b0059 : bool,
b0060 : bool,
b0061 : bool,
b0062 : bool,
b0063 : bool,
b0064 : bool,
b0065 : bool,
b0066 : bool,
b0067 : bool,
b0068 : bool,
b0069 : bool,
b0070 : bool,
b0071 : bool,
b0072 : bool,
b0073 : bool,
b0074 : bool,
b0075 : bool,
b0076 : bool,
b0077 : bool,
b0078 : bool,
b0079 : bool,
b0080 : bool,
b0081 : bool,
b0082 : bool,
b0083 : bool,
b0084 : bool,
b0085 : bool,
b0086 : bool,
b0087 : bool,
b0088 : bool,
b0089 : bool,
b0090 : bool,
b0091 : bool,
b0092 : bool,
b0093 : bool,
b0094 : bool,
b0095 : bool,
b0096 : bool,
b0097 : bool,
b0098 : bool,
b0099 : bool,
b0100 : bool,
b0101 : bool,
b0102 : bool,
b0103 : bool,
b0104 : bool,
b0105 : bool,
b0106 : bool,
b0107 : bool,
b0108 : bool,
b0109 : bool,
b0110 : bool,
b0111 : bool,
b0112 : bool,
b0113 : bool,
b0114 : bool,
b0115 : bool,
b0116 : bool,
b0117 : bool
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

const unique ^$#g_slist_reverse.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#g_slist_reverse.c..36263#3);

type $#g_slist_reverse.c..36263#3;

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



procedure g_slist_reverse(P#list: $ptr) returns ($result: $ptr);
  requires F#sll($s, $phys_ptr_cast(P#list, ^s_node));
  modifies $s, $cev_pc;
  ensures F#sll($s, $phys_ptr_cast($result, ^s_node));
  ensures F#sll_keys($s, $phys_ptr_cast($result, ^s_node)) == F#sll_keys(old($s), $phys_ptr_cast(P#list, ^s_node));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation g_slist_reverse(P#list: $ptr) returns ($result: $ptr)
{
  var stmtexpr2#4: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr1#3: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr0#2: $ptr;
  var SL#list0: $ptr;
  var L#next: $ptr;
  var loopState#0: $state;
  var L#prev: $ptr;
  var stmtexpr1#6: $oset;
  var stmtexpr0#5: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var local.list: $ptr;
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
var p0022 : bool;
var p0023 : bool;
var p0024 : bool;
var p0025 : bool;
var p0026 : bool;
var p0027 : bool;
var p0028 : bool;
var p0029 : bool;
var p0030 : bool;
var p0031 : bool;
var p0032 : bool;
var p0033 : bool;
var p0034 : bool;
var p0035 : bool;
var p0036 : bool;
var p0037 : bool;
var p0038 : bool;
var p0039 : bool;
var p0040 : bool;
var p0041 : bool;
var p0042 : bool;
var p0043 : bool;
var p0044 : bool;
var p0045 : bool;
var p0046 : bool;
var p0047 : bool;
var p0048 : bool;
var p0049 : bool;
var p0050 : bool;
var p0051 : bool;
var p0052 : bool;
var p0053 : bool;
var p0054 : bool;
var p0055 : bool;
var p0056 : bool;
var p0057 : bool;
var p0058 : bool;
var p0059 : bool;
var p0060 : bool;
var p0061 : bool;
var p0062 : bool;
var p0063 : bool;
var p0064 : bool;
var p0065 : bool;
var p0066 : bool;
var p0067 : bool;
var p0068 : bool;
var p0069 : bool;
var p0070 : bool;
var p0071 : bool;
var p0072 : bool;
var p0073 : bool;
var p0074 : bool;
var p0075 : bool;
var p0076 : bool;
var p0077 : bool;
var p0078 : bool;
var p0079 : bool;
var p0080 : bool;
var p0081 : bool;
var p0082 : bool;
var p0083 : bool;
var p0084 : bool;
var p0085 : bool;
var p0086 : bool;
var p0087 : bool;
var p0088 : bool;
var p0089 : bool;
var p0090 : bool;
var p0091 : bool;
var p0092 : bool;
var p0093 : bool;
var p0094 : bool;
var p0095 : bool;
var p0096 : bool;
var p0097 : bool;
var p0098 : bool;
var p0099 : bool;
var p0100 : bool;
var p0101 : bool;
var p0102 : bool;
var p0103 : bool;
var p0104 : bool;
var p0105 : bool;
var p0106 : bool;
var p0107 : bool;
var p0108 : bool;
var p0109 : bool;
var p0110 : bool;
var p0111 : bool;
var p0112 : bool;
var p0113 : bool;
var p0114 : bool;
var p0115 : bool;
var p0116 : bool;

// INV:PTR: P#list, L#prev, local.list
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
    // struct s_node* local.list; 
    // local.list := list; 
    local.list := $phys_ptr_cast(P#list, ^s_node);
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := sll_reach(local.list); 
    call SL#_dryad_G0 := sll_reach($phys_ptr_cast(local.list, ^s_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _math \oset stmtexpr0#5; 
    // stmtexpr0#5 := _dryad_G0; 
    stmtexpr0#5 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#6; 
    // stmtexpr1#6 := _dryad_G1; 
    stmtexpr1#6 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_keys(local.list), @_vcc_intset_union(sll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_list_len_next(local.list), unchecked+(sll_list_len_next(*((local.list->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), 1);
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll(local.list), &&(sll(*((local.list->next))), unchecked!(@_vcc_oset_in(local.list, sll_reach(*((local.list->next)))))))); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_reach(local.list), @_vcc_oset_union(sll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
    // struct s_node* prev; 
    // assume ==>(@_vcc_ptr_neq_null(local.list), &&(@_vcc_mutable(@state, local.list), @writes_check(local.list))); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.list, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.list, ^s_node));
    // prev := (struct s_node*)@null; 
    L#prev := $phys_ptr_cast($null, ^s_node);
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
    loopState#0 := $s;
    assume true;
p0000 := (F#sll($s,$phys_ptr_cast(P#list,^s_node)));
p0001 := (F#sll($s,$phys_ptr_cast(L#prev,^s_node)));
p0002 := (F#sll($s,$phys_ptr_cast(local.list,^s_node)));
p0003 := (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)));
p0004 := (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)));
p0005 := (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)));
p0006 := (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)));
p0007 := (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)));
p0008 := (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)));
p0009 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0010 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0011 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0012 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0013 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0014 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0015 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0016 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0017 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0018 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0019 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0020 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0021 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0022 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0023 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0024 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0025 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0026 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0027 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0028 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0029 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0030 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0031 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0032 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0033 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node))));
p0034 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0035 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node))));
p0036 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node))));
p0037 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0038 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node))));
p0039 := ($non_null($phys_ptr_cast(P#list,^s_node)));
p0040 := ($non_null($phys_ptr_cast(L#prev,^s_node)));
p0041 := ($non_null($phys_ptr_cast(local.list,^s_node)));
p0042 := ($is_null($phys_ptr_cast(P#list,^s_node)));
p0043 := ($is_null($phys_ptr_cast(L#prev,^s_node)));
p0044 := ($is_null($phys_ptr_cast(local.list,^s_node)));
p0045 := (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
p0046 := (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(local.list,^s_node)));
p0047 := (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(P#list,^s_node)));
p0048 := (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(local.list,^s_node)));
p0049 := (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(P#list,^s_node)));
p0050 := (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
p0051 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node))));
p0052 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node))));
p0053 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node))));
p0054 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node))));
p0055 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node))));
p0056 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node))));
p0057 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));
p0058 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node))));
p0059 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node))));
p0060 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node))));
p0061 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node))));
p0062 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));
p0063 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))));
p0064 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))));
p0065 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))));
p0066 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))));
p0067 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))));
p0068 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))));
p0069 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node))));
p0070 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0071 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node))));
p0072 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node))));
p0073 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0074 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node))));
p0075 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0076 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0077 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0078 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0079 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0080 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0081 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0082 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0083 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0084 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0085 := ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0086 := ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0087 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0088 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0089 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0090 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0091 := ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0092 := ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0093 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0094 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0095 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0096 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0097 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0098 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0099 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0100 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0101 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0102 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0103 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0104 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0105 := ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0106 := ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)))));
p0107 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)))));
p0108 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)))));
p0109 := ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)))));
p0110 := ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0111 := ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0112 := ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)))));
p0113 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)))));
p0114 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)))));
p0115 := ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)))));
p0116 := ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));

    while (true)

invariant (p0000 == (F#sll($s,$phys_ptr_cast(P#list,^s_node))));
invariant (p0001 == (F#sll($s,$phys_ptr_cast(L#prev,^s_node))));
invariant (p0002 == (F#sll($s,$phys_ptr_cast(local.list,^s_node))));
invariant (p0003 == (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node))));
invariant (p0004 == (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node))));
invariant (p0005 == (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node))));
invariant (p0006 == (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node))));
invariant (p0007 == (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node))));
invariant (p0008 == (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node))));
invariant (p0009 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0010 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0011 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0012 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0013 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0014 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0015 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0016 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0017 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0018 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0019 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0020 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0021 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0022 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0023 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0024 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0025 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0026 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0027 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0028 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0029 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0030 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0031 == ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0032 == ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0033 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)))));
invariant (p0034 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0035 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)))));
invariant (p0036 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)))));
invariant (p0037 == ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0038 == ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)))));
invariant (p0039 == ($non_null($phys_ptr_cast(P#list,^s_node))));
invariant (p0040 == ($non_null($phys_ptr_cast(L#prev,^s_node))));
invariant (p0041 == ($non_null($phys_ptr_cast(local.list,^s_node))));
invariant (p0042 == ($is_null($phys_ptr_cast(P#list,^s_node))));
invariant (p0043 == ($is_null($phys_ptr_cast(L#prev,^s_node))));
invariant (p0044 == ($is_null($phys_ptr_cast(local.list,^s_node))));
invariant (p0045 == (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(L#prev,^s_node))));
invariant (p0046 == (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(local.list,^s_node))));
invariant (p0047 == (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(P#list,^s_node))));
invariant (p0048 == (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(local.list,^s_node))));
invariant (p0049 == (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(P#list,^s_node))));
invariant (p0050 == (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(L#prev,^s_node))));
invariant (p0051 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node)))));
invariant (p0052 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node)))));
invariant (p0053 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node)))));
invariant (p0054 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node)))));
invariant (p0055 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node)))));
invariant (p0056 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node)))));
invariant (p0057 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node)))));
invariant (p0058 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node)))));
invariant (p0059 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node)))));
invariant (p0060 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node)))));
invariant (p0061 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node)))));
invariant (p0062 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node)))));
invariant (p0063 == ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0064 == ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0065 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0066 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0067 == ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0068 == ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0069 == ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)))));
invariant (p0070 == ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0071 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)))));
invariant (p0072 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)))));
invariant (p0073 == ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0074 == ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)))));
invariant (p0075 == ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0076 == ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0077 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0078 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0079 == ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0080 == ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0081 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0082 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0083 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0084 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0085 == ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0086 == ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0087 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0088 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0089 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0090 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0091 == ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0092 == ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0093 == ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0094 == ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0095 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0096 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0097 == ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0098 == ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0099 == ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0100 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0101 == ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0102 == ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0103 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0104 == ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0105 == ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0106 == ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0107 == ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0108 == ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0109 == ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0110 == ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0111 == ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0112 == ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0113 == ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0114 == ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0115 == ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0116 == ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node))))));

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
p0022,
p0023,
p0024,
p0025,
p0026,
p0027,
p0028,
p0029,
p0030,
p0031,
p0032,
p0033,
p0034,
p0035,
p0036,
p0037,
p0038,
p0039,
p0040,
p0041,
p0042,
p0043,
p0044,
p0045,
p0046,
p0047,
p0048,
p0049,
p0050,
p0051,
p0052,
p0053,
p0054,
p0055,
p0056,
p0057,
p0058,
p0059,
p0060,
p0061,
p0062,
p0063,
p0064,
p0065,
p0066,
p0067,
p0068,
p0069,
p0070,
p0071,
p0072,
p0073,
p0074,
p0075,
p0076,
p0077,
p0078,
p0079,
p0080,
p0081,
p0082,
p0083,
p0084,
p0085,
p0086,
p0087,
p0088,
p0089,
p0090,
p0091,
p0092,
p0093,
p0094,
p0095,
p0096,
p0097,
p0098,
p0099,
p0100,
p0101,
p0102,
p0103,
p0104,
p0105,
p0106,
p0107,
p0108,
p0109,
p0110,
p0111,
p0112,
p0113,
p0114,
p0115,
p0116,
true
);

      invariant $non_null($phys_ptr_cast(local.list, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.list, ^s_node));
      invariant $non_null($phys_ptr_cast(local.list, ^s_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.list, ^s_node));
    {
      anon3:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#0, $s);
        assume $full_stop_ext(#tok$2^11.2, $s);
        // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
        assume $meta_eq(loopState#0, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(local.list)) ...
        if ($non_null($phys_ptr_cast(local.list, ^s_node)))
        {
          anon1:
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
            // struct s_node* next; 
            // assume ==>(&&(@_vcc_ptr_neq_null(local.list), @_vcc_ptr_neq_null(*((local.list->next)))), &&(==(@_vcc_mutable(@state, local.list), @_vcc_mutable(@state, *((local.list->next)))), ==(@writes_check(local.list), @writes_check(*((local.list->next)))))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.list, ^s_node)) == $mutable($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.list, ^s_node)) == $top_writable($s, #wrTime$2^3.3, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node));
            // struct s_node* list0; 
            // list0 := local.list; 
            SL#list0 := $phys_ptr_cast(local.list, ^s_node);
            // struct s_node* stmtexpr0#2; 
            // stmtexpr0#2 := list0; 
            stmtexpr0#2 := $phys_ptr_cast(SL#list0, ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_keys(local.list), @_vcc_intset_union(sll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_list_len_next(local.list), unchecked+(sll_list_len_next(*((local.list->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll(local.list), &&(sll(*((local.list->next))), unchecked!(@_vcc_oset_in(local.list, sll_reach(*((local.list->next)))))))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_reach(local.list), @_vcc_oset_union(sll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
            // assert @reads_check_normal((local.list->next)); 
            assert $thread_local($s, $phys_ptr_cast(local.list, ^s_node));
            // next := *((local.list->next)); 
            L#next := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_keys(next), @_vcc_intset_union(sll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_list_len_next(next), unchecked+(sll_list_len_next(*((next->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll(next), &&(sll(*((next->next))), unchecked!(@_vcc_oset_in(next, sll_reach(*((next->next)))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_reach(next), @_vcc_oset_union(sll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_keys(local.list), @_vcc_intset_union(sll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.list, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.list, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_list_len_next(local.list), unchecked+(sll_list_len_next(*((local.list->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.list, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll(local.list), &&(sll(*((local.list->next))), unchecked!(@_vcc_oset_in(local.list, sll_reach(*((local.list->next)))))))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.list, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(sll_reach(local.list), @_vcc_oset_union(sll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
            assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.list, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.list, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.list, ^s_node)));
            // _math \state _dryad_S0; 
            // _dryad_S0 := @_vcc_current_state(@state); 
            SL#_dryad_S0 := $current_state($s);
            // _math \state stmtexpr1#3; 
            // stmtexpr1#3 := _dryad_S0; 
            stmtexpr1#3 := SL#_dryad_S0;
            // assert @prim_writes_check((local.list->next)); 
            assert $writable_prim($s, #wrTime$2^3.3, $dot($phys_ptr_cast(local.list, ^s_node), s_node.next));
            // *(local.list->next) := prev; 
            call $write_int(s_node.next, $phys_ptr_cast(local.list, ^s_node), $ptr_to_int($phys_ptr_cast(L#prev, ^s_node)));
            assume $full_stop_ext(#tok$2^19.3, $s);
            // _math \state _dryad_S1; 
            // _dryad_S1 := @_vcc_current_state(@state); 
            SL#_dryad_S1 := $current_state($s);
            // _math \state stmtexpr2#4; 
            // stmtexpr2#4 := _dryad_S1; 
            stmtexpr2#4 := SL#_dryad_S1;
            // assume ==>(unchecked!(@_vcc_oset_in(local.list, old(_dryad_S0, sll_reach(list0)))), ==(old(_dryad_S0, sll_keys(list0)), old(_dryad_S1, sll_keys(list0)))); 
            assume !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#list0, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(SL#list0, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(SL#list0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.list, old(_dryad_S0, sll_reach(list0)))), ==(old(_dryad_S0, sll_list_len_next(list0)), old(_dryad_S1, sll_list_len_next(list0)))); 
            assume !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#list0, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(SL#list0, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(SL#list0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.list, old(_dryad_S0, sll_reach(list0)))), ==(old(_dryad_S0, sll(list0)), old(_dryad_S1, sll(list0)))); 
            assume !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#list0, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(SL#list0, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(SL#list0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.list, old(_dryad_S0, sll_reach(list0)))), ==(old(_dryad_S0, sll_reach(list0)), old(_dryad_S1, sll_reach(list0)))); 
            assume !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#list0, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#list0, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(SL#list0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.list, old(_dryad_S0, sll_reach(next)))), ==(old(_dryad_S0, sll_keys(next)), old(_dryad_S1, sll_keys(next)))); 
            assume !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.list, old(_dryad_S0, sll_reach(next)))), ==(old(_dryad_S0, sll_list_len_next(next)), old(_dryad_S1, sll_list_len_next(next)))); 
            assume !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.list, old(_dryad_S0, sll_reach(next)))), ==(old(_dryad_S0, sll(next)), old(_dryad_S1, sll(next)))); 
            assume !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.list, old(_dryad_S0, sll_reach(next)))), ==(old(_dryad_S0, sll_reach(next)), old(_dryad_S1, sll_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#next, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.list, old(_dryad_S0, sll_reach(prev)))), ==(old(_dryad_S0, sll_keys(prev)), old(_dryad_S1, sll_keys(prev)))); 
            assume !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.list, old(_dryad_S0, sll_reach(prev)))), ==(old(_dryad_S0, sll_list_len_next(prev)), old(_dryad_S1, sll_list_len_next(prev)))); 
            assume !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.list, old(_dryad_S0, sll_reach(prev)))), ==(old(_dryad_S0, sll(prev)), old(_dryad_S1, sll(prev)))); 
            assume !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#prev, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.list, old(_dryad_S0, sll_reach(prev)))), ==(old(_dryad_S0, sll_reach(prev)), old(_dryad_S1, sll_reach(prev)))); 
            assume !$oset_in($phys_ptr_cast(local.list, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(local.list, list0)), ==(*((list0->key)), old(_dryad_S0, *((list0->key))))); 
            assume !($phys_ptr_cast(local.list, ^s_node) == $phys_ptr_cast(SL#list0, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(SL#list0, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(SL#list0, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(local.list, list0)), @_vcc_ptr_eq_pure(*((list0->next)), old(_dryad_S0, *((list0->next))))); 
            assume !($phys_ptr_cast(local.list, ^s_node) == $phys_ptr_cast(SL#list0, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#list0, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(SL#list0, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(local.list, next)), ==(*((next->key)), old(_dryad_S0, *((next->key))))); 
            assume !($phys_ptr_cast(local.list, ^s_node) == $phys_ptr_cast(L#next, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(local.list, next)), @_vcc_ptr_eq_pure(*((next->next)), old(_dryad_S0, *((next->next))))); 
            assume !($phys_ptr_cast(local.list, ^s_node) == $phys_ptr_cast(L#next, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(local.list, prev)), ==(*((prev->key)), old(_dryad_S0, *((prev->key))))); 
            assume !($phys_ptr_cast(local.list, ^s_node) == $phys_ptr_cast(L#prev, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(local.list, prev)), @_vcc_ptr_eq_pure(*((prev->next)), old(_dryad_S0, *((prev->next))))); 
            assume !($phys_ptr_cast(local.list, ^s_node) == $phys_ptr_cast(L#prev, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(list0), ==(sll_keys(list0), @_vcc_intset_union(sll_keys(*((list0->next))), @_vcc_intset_singleton(*((list0->key)))))); 
            assume $non_null($phys_ptr_cast(SL#list0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#list0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#list0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#list0, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(list0), ==(sll_list_len_next(list0), unchecked+(sll_list_len_next(*((list0->next))), 1))); 
            assume $non_null($phys_ptr_cast(SL#list0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#list0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#list0, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(list0), ==(sll(list0), &&(sll(*((list0->next))), unchecked!(@_vcc_oset_in(list0, sll_reach(*((list0->next)))))))); 
            assume $non_null($phys_ptr_cast(SL#list0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#list0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#list0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#list0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#list0, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(list0), ==(sll_reach(list0), @_vcc_oset_union(sll_reach(*((list0->next))), @_vcc_oset_singleton(list0)))); 
            assume $non_null($phys_ptr_cast(SL#list0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#list0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#list0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#list0, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_keys(next), @_vcc_intset_union(sll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_list_len_next(next), unchecked+(sll_list_len_next(*((next->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll(next), &&(sll(*((next->next))), unchecked!(@_vcc_oset_in(next, sll_reach(*((next->next)))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_reach(next), @_vcc_oset_union(sll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
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
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // prev := local.list; 
            L#prev := $phys_ptr_cast(local.list, ^s_node);
            // assert sll_lseg(list0, list0); 
            assert F#sll_lseg($s, $phys_ptr_cast(SL#list0, ^s_node), $phys_ptr_cast(SL#list0, ^s_node));
            // assume sll_lseg(list0, list0); 
            assume F#sll_lseg($s, $phys_ptr_cast(SL#list0, ^s_node), $phys_ptr_cast(SL#list0, ^s_node));
            // assert sll_lseg(next, next); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#next, ^s_node), $phys_ptr_cast(L#next, ^s_node));
            // assume sll_lseg(next, next); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#next, ^s_node), $phys_ptr_cast(L#next, ^s_node));
            // assert sll_lseg(prev, prev); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume sll_lseg(prev, prev); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assert sll_lseg(local.list, local.list); 
            assert F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(local.list, ^s_node));
            // assume sll_lseg(local.list, local.list); 
            assume F#sll_lseg($s, $phys_ptr_cast(local.list, ^s_node), $phys_ptr_cast(local.list, ^s_node));
            // local.list := next; 
            local.list := $phys_ptr_cast(L#next, ^s_node);
            // assert sll_lseg(list0, list0); 
            assert F#sll_lseg($s, $phys_ptr_cast(SL#list0, ^s_node), $phys_ptr_cast(SL#list0, ^s_node));
            // assume sll_lseg(list0, list0); 
            assume F#sll_lseg($s, $phys_ptr_cast(SL#list0, ^s_node), $phys_ptr_cast(SL#list0, ^s_node));
            // assert sll_lseg(next, next); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#next, ^s_node), $phys_ptr_cast(L#next, ^s_node));
            // assume sll_lseg(next, next); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#next, ^s_node), $phys_ptr_cast(L#next, ^s_node));
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
          anon2:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // goto #break_1; 
            goto #break_1;
        }

      #continue_1:
        assume true;
p0000 := (F#sll($s,$phys_ptr_cast(P#list,^s_node)));
p0001 := (F#sll($s,$phys_ptr_cast(L#prev,^s_node)));
p0002 := (F#sll($s,$phys_ptr_cast(local.list,^s_node)));
p0003 := (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)));
p0004 := (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)));
p0005 := (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)));
p0006 := (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)));
p0007 := (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)));
p0008 := (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)));
p0009 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0010 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0011 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0012 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0013 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0014 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0015 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0016 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0017 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0018 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0019 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0020 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0021 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0022 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0023 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0024 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0025 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0026 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0027 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0028 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0029 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0030 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0031 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0032 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0033 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node))));
p0034 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0035 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node))));
p0036 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node))));
p0037 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0038 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node))));
p0039 := ($non_null($phys_ptr_cast(P#list,^s_node)));
p0040 := ($non_null($phys_ptr_cast(L#prev,^s_node)));
p0041 := ($non_null($phys_ptr_cast(local.list,^s_node)));
p0042 := ($is_null($phys_ptr_cast(P#list,^s_node)));
p0043 := ($is_null($phys_ptr_cast(L#prev,^s_node)));
p0044 := ($is_null($phys_ptr_cast(local.list,^s_node)));
p0045 := (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
p0046 := (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(local.list,^s_node)));
p0047 := (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(P#list,^s_node)));
p0048 := (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(local.list,^s_node)));
p0049 := (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(P#list,^s_node)));
p0050 := (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
p0051 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node))));
p0052 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node))));
p0053 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node))));
p0054 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node))));
p0055 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node))));
p0056 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node))));
p0057 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));
p0058 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node))));
p0059 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node))));
p0060 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node))));
p0061 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node))));
p0062 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));
p0063 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))));
p0064 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))));
p0065 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))));
p0066 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))));
p0067 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))));
p0068 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))));
p0069 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node))));
p0070 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0071 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node))));
p0072 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node))));
p0073 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0074 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node))));
p0075 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0076 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0077 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0078 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0079 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0080 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0081 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0082 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0083 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0084 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0085 := ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0086 := ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0087 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0088 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0089 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0090 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0091 := ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0092 := ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0093 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0094 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0095 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0096 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0097 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0098 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0099 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0100 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0101 := ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0102 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
p0103 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
p0104 := ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0105 := ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0106 := ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)))));
p0107 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)))));
p0108 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)))));
p0109 := ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)))));
p0110 := ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0111 := ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0112 := ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)))));
p0113 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)))));
p0114 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)))));
p0115 := ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)))));
p0116 := ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));

    }

  anon5:
    assume $full_stop_ext(#tok$2^11.2, $s);

  #break_1:
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
    // return prev; 
    $result := $phys_ptr_cast(L#prev, ^s_node);
    assume true;
    assert $position_marker();
    goto #exit;

  anon6:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$2^19.3: $token;

const unique #tok$2^11.2: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^3.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Cgslist?5Cg_slist_reverse.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Cgslist?5Cg_slist_reverse.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Cgslist?5Cdryad_gslist_sll.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Cgslist?5Cdryad_gslist_sll.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^s_node);

