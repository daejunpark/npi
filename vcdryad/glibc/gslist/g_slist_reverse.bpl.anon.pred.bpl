
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
const {:existential true} b0088 : bool;
const {:existential true} b0089 : bool;
const {:existential true} b0090 : bool;
const {:existential true} b0091 : bool;
const {:existential true} b0092 : bool;
const {:existential true} b0093 : bool;
const {:existential true} b0094 : bool;
const {:existential true} b0095 : bool;
const {:existential true} b0096 : bool;
const {:existential true} b0097 : bool;
const {:existential true} b0098 : bool;
const {:existential true} b0099 : bool;
const {:existential true} b0100 : bool;
const {:existential true} b0101 : bool;
const {:existential true} b0102 : bool;
const {:existential true} b0103 : bool;
const {:existential true} b0104 : bool;
const {:existential true} b0105 : bool;
const {:existential true} b0106 : bool;
const {:existential true} b0107 : bool;
const {:existential true} b0108 : bool;
const {:existential true} b0109 : bool;
const {:existential true} b0110 : bool;
const {:existential true} b0111 : bool;
const {:existential true} b0112 : bool;
const {:existential true} b0113 : bool;
const {:existential true} b0114 : bool;
const {:existential true} b0115 : bool;
const {:existential true} b0116 : bool;

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
// INV:LOOPHEAD
    while (true)
invariant b0000 ==> (F#sll($s,$phys_ptr_cast(P#list,^s_node)));
invariant b0001 ==> (F#sll($s,$phys_ptr_cast(L#prev,^s_node)));
invariant b0002 ==> (F#sll($s,$phys_ptr_cast(local.list,^s_node)));
invariant b0003 ==> (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)));
invariant b0004 ==> (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)));
invariant b0005 ==> (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)));
invariant b0006 ==> (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)));
invariant b0007 ==> (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)));
invariant b0008 ==> (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)));
invariant b0009 ==> ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
invariant b0010 ==> ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
invariant b0011 ==> ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
invariant b0012 ==> ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
invariant b0013 ==> ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
invariant b0014 ==> ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
invariant b0015 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
invariant b0016 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
invariant b0017 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
invariant b0018 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
invariant b0019 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
invariant b0020 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
invariant b0021 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
invariant b0022 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
invariant b0023 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
invariant b0024 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
invariant b0025 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
invariant b0026 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
invariant b0027 ==> (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant b0028 ==> (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant b0029 ==> (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant b0030 ==> (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant b0031 ==> (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant b0032 ==> (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant b0033 ==> (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)))));
invariant b0034 ==> (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
invariant b0035 ==> (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)))));
invariant b0036 ==> (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)))));
invariant b0037 ==> (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
invariant b0038 ==> (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)))));
invariant b0039 ==> ($non_null($phys_ptr_cast(P#list,^s_node)));
invariant b0040 ==> ($non_null($phys_ptr_cast(L#prev,^s_node)));
invariant b0041 ==> ($non_null($phys_ptr_cast(local.list,^s_node)));
invariant b0042 ==> ($is_null($phys_ptr_cast(P#list,^s_node)));
invariant b0043 ==> ($is_null($phys_ptr_cast(L#prev,^s_node)));
invariant b0044 ==> ($is_null($phys_ptr_cast(local.list,^s_node)));
invariant b0045 ==> (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
invariant b0046 ==> (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(local.list,^s_node)));
invariant b0047 ==> (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(P#list,^s_node)));
invariant b0048 ==> (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(local.list,^s_node)));
invariant b0049 ==> (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(P#list,^s_node)));
invariant b0050 ==> (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
invariant b0051 ==> (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node))));
invariant b0052 ==> (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node))));
invariant b0053 ==> (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node))));
invariant b0054 ==> (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node))));
invariant b0055 ==> (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node))));
invariant b0056 ==> (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node))));
invariant b0057 ==> (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));
invariant b0058 ==> (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node))));
invariant b0059 ==> (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node))));
invariant b0060 ==> (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node))));
invariant b0061 ==> (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node))));
invariant b0062 ==> (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));
invariant b0063 ==> ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))));
invariant b0064 ==> ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))));
invariant b0065 ==> ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))));
invariant b0066 ==> ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_keys($s,$phys_ptr_cast(local.list,^s_node))));
invariant b0067 ==> ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#list,^s_node))));
invariant b0068 ==> ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))));
invariant b0069 ==> ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node))));
invariant b0070 ==> ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node))));
invariant b0071 ==> ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node))));
invariant b0072 ==> ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node))));
invariant b0073 ==> ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node))));
invariant b0074 ==> ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node))));
invariant b0075 ==> ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
invariant b0076 ==> ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant b0077 ==> ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
invariant b0078 ==> ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
invariant b0079 ==> ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant b0080 ==> ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
invariant b0081 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant b0082 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
invariant b0083 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
invariant b0084 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
invariant b0085 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
invariant b0086 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant b0087 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant b0088 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
invariant b0089 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
invariant b0090 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
invariant b0091 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
invariant b0092 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant b0093 ==> ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant b0094 ==> ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
invariant b0095 ==> ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
invariant b0096 ==> ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
invariant b0097 ==> ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
invariant b0098 ==> ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant b0099 ==> ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant b0100 ==> ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#list,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
invariant b0101 ==> ((F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
invariant b0102 ==> ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.list,^s_node)))));
invariant b0103 ==> ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)))));
invariant b0104 ==> ((F#sll_keys($s,$phys_ptr_cast(P#list,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.list,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant b0105 ==> ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
invariant b0106 ==> ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)))));
invariant b0107 ==> ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)))));
invariant b0108 ==> ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)))));
invariant b0109 ==> ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)))));
invariant b0110 ==> ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
invariant b0111 ==> ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
invariant b0112 ==> ((($non_null($phys_ptr_cast(P#list,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)))));
invariant b0113 ==> ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)))));
invariant b0114 ==> ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(local.list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)))));
invariant b0115 ==> ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(P#list,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#list,^s_node)))));
invariant b0116 ==> ((($non_null($phys_ptr_cast(local.list,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.list,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));

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
// INV:LOOPTAIL
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

