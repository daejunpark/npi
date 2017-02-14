
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
b0117 : bool,
b0118 : bool,
b0119 : bool,
b0120 : bool,
b0121 : bool,
b0122 : bool,
b0123 : bool,
b0124 : bool,
b0125 : bool,
b0126 : bool,
b0127 : bool,
b0128 : bool,
b0129 : bool,
b0130 : bool,
b0131 : bool,
b0132 : bool,
b0133 : bool,
b0134 : bool,
b0135 : bool,
b0136 : bool,
b0137 : bool,
b0138 : bool,
b0139 : bool,
b0140 : bool
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

const unique ^$#g_slist_remove.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#g_slist_remove.c..36263#3);

type $#g_slist_remove.c..36263#3;

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



procedure g_slist_remove(P#list: $ptr, P#data: int) returns ($result: $ptr);
  requires F#sll($s, $phys_ptr_cast(P#list, ^s_node));
  modifies $s, $cev_pc;
  ensures F#sll($s, $phys_ptr_cast($result, ^s_node));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation g_slist_remove(P#list: $ptr, P#data: int) returns ($result: $ptr)
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
var p0117 : bool;
var p0118 : bool;
var p0119 : bool;
var p0120 : bool;
var p0121 : bool;
var p0122 : bool;
var p0123 : bool;
var p0124 : bool;
var p0125 : bool;
var p0126 : bool;
var p0127 : bool;
var p0128 : bool;
var p0129 : bool;
var p0130 : bool;
var p0131 : bool;
var p0132 : bool;
var p0133 : bool;
var p0134 : bool;
var p0135 : bool;
var p0136 : bool;
var p0137 : bool;
var p0138 : bool;
var p0139 : bool;

// INV:PTR: P#list, L#tmp, L#prev, local.list
// INV:INT: P#data
// INV:LST: sll

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
    // assume ==>(@_vcc_ptr_neq_null(local.list), &&(@_vcc_mutable(@state, local.list), @writes_check(local.list))); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.list, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.list, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(local.list), @_vcc_is_malloc_root(@state, local.list)); 
    assume $non_null($phys_ptr_cast(local.list, ^s_node)) ==> $is_malloc_root($s, $phys_ptr_cast(local.list, ^s_node));
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
p0000 := (F#sll($s,$phys_ptr_cast(P#list,^s_node)));
p0001 := (F#sll($s,$phys_ptr_cast(L#tmp,^s_node)));
p0002 := (F#sll($s,$phys_ptr_cast(L#prev,^s_node)));
p0003 := (F#sll($s,$phys_ptr_cast(local.list,^s_node)));
p0004 := (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node)));
p0005 := (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)));
p0006 := (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)));
p0007 := (F#sll_lseg($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node)));
p0008 := (F#sll_lseg($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node)));
p0009 := (F#sll_lseg($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node)));
p0010 := (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)));
p0011 := (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node)));
p0012 := (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)));
p0013 := (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)));
p0014 := (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node)));
p0015 := (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)));
p0016 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0017 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0018 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0019 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0020 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0021 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0022 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0023 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0024 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0025 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0026 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0027 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0028 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0029 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0030 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0031 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0032 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0033 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0034 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0035 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0036 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0037 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0038 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0039 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0040 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0041 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0042 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0043 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0044 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0045 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0046 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0047 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0048 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0049 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0050 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0051 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0052 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0053 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0054 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0055 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0056 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0057 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0058 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0059 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0060 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0061 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0062 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0063 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0064 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
p0065 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
p0066 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
p0067 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
p0068 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
p0069 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
p0070 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
p0071 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
p0072 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
p0073 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
p0074 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
p0075 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
p0076 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0077 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node)))));
p0078 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node)))));
p0079 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)))));
p0080 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node)))));
p0081 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0082 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0083 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)))));
p0084 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)))));
p0085 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)))));
p0086 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)))));
p0087 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0088 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node)))));
p0089 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)))));
p0090 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node)))));
p0091 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node)))));
p0092 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)))));
p0093 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node)))));
p0094 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node)))));
p0095 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0096 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node)))));
p0097 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0098 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)))));
p0099 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node)))));
p0100 := ($non_null($phys_ptr_cast(P#list,^s_node)));
p0101 := ($non_null($phys_ptr_cast(L#tmp,^s_node)));
p0102 := ($non_null($phys_ptr_cast(L#prev,^s_node)));
p0103 := ($non_null($phys_ptr_cast(local.list,^s_node)));
p0104 := ($is_null($phys_ptr_cast(P#list,^s_node)));
p0105 := ($is_null($phys_ptr_cast(L#tmp,^s_node)));
p0106 := ($is_null($phys_ptr_cast(L#prev,^s_node)));
p0107 := ($is_null($phys_ptr_cast(local.list,^s_node)));
p0108 := (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(L#tmp,^s_node)));
p0109 := (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
p0110 := (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(local.list,^s_node)));
p0111 := (($phys_ptr_cast(L#tmp,^s_node) == $phys_ptr_cast(P#list,^s_node)));
p0112 := (($phys_ptr_cast(L#tmp,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
p0113 := (($phys_ptr_cast(L#tmp,^s_node) == $phys_ptr_cast(local.list,^s_node)));
p0114 := (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(P#list,^s_node)));
p0115 := (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(L#tmp,^s_node)));
p0116 := (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(local.list,^s_node)));
p0117 := (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(P#list,^s_node)));
p0118 := (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(L#tmp,^s_node)));
p0119 := (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
p0120 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node))));
p0121 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#tmp,^s_node),^s_node))));
p0122 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node))));
p0123 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node))));
p0124 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node))));
p0125 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#tmp,^s_node),^s_node))));
p0126 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node))));
p0127 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node))));
p0128 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(L#tmp,^s_node))));
p0129 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));
p0130 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node))));
p0131 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#tmp,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node))));
p0132 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#tmp,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));
p0133 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#tmp,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node))));
p0134 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node))));
p0135 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(L#tmp,^s_node))));
p0136 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node))));
p0137 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node))));
p0138 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(L#tmp,^s_node))));
p0139 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));

    while (true)

invariant (p0000 == (F#sll($s,$phys_ptr_cast(P#list,^s_node))));
invariant (p0001 == (F#sll($s,$phys_ptr_cast(L#tmp,^s_node))));
invariant (p0002 == (F#sll($s,$phys_ptr_cast(L#prev,^s_node))));
invariant (p0003 == (F#sll($s,$phys_ptr_cast(local.list,^s_node))));
invariant (p0004 == (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node))));
invariant (p0005 == (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node))));
invariant (p0006 == (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node))));
invariant (p0007 == (F#sll_lseg($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node))));
invariant (p0008 == (F#sll_lseg($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node))));
invariant (p0009 == (F#sll_lseg($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node))));
invariant (p0010 == (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node))));
invariant (p0011 == (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node))));
invariant (p0012 == (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node))));
invariant (p0013 == (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node))));
invariant (p0014 == (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node))));
invariant (p0015 == (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node))));
invariant (p0016 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
invariant (p0017 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0018 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0019 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0020 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0021 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0022 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0023 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
invariant (p0024 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0025 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0026 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
invariant (p0027 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0028 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
invariant (p0029 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0030 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0031 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0032 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0033 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0034 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0035 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
invariant (p0036 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0037 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0038 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
invariant (p0039 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0040 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0041 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0042 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
invariant (p0043 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0044 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
invariant (p0045 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0046 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0047 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0048 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0049 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0050 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0051 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0052 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
invariant (p0053 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0054 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0055 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
invariant (p0056 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0057 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
invariant (p0058 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
invariant (p0059 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0060 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0061 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0062 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
invariant (p0063 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
invariant (p0064 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))))));
invariant (p0065 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0066 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0067 == (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0068 == (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0069 == (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0070 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0071 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))))));
invariant (p0072 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))))));
invariant (p0073 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))))));
invariant (p0074 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))))));
invariant (p0075 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0076 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0077 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node))))));
invariant (p0078 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node))))));
invariant (p0079 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node))))));
invariant (p0080 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node))))));
invariant (p0081 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0082 == (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0083 == (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node))))));
invariant (p0084 == (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node))))));
invariant (p0085 == (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node))))));
invariant (p0086 == (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node))))));
invariant (p0087 == (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0088 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node))))));
invariant (p0089 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node))))));
invariant (p0090 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node))))));
invariant (p0091 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node))))));
invariant (p0092 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node))))));
invariant (p0093 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node))))));
invariant (p0094 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node))))));
invariant (p0095 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0096 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node))))));
invariant (p0097 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0098 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node))))));
invariant (p0099 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node))))));
invariant (p0100 == ($non_null($phys_ptr_cast(P#list,^s_node))));
invariant (p0101 == ($non_null($phys_ptr_cast(L#tmp,^s_node))));
invariant (p0102 == ($non_null($phys_ptr_cast(L#prev,^s_node))));
invariant (p0103 == ($non_null($phys_ptr_cast(local.list,^s_node))));
invariant (p0104 == ($is_null($phys_ptr_cast(P#list,^s_node))));
invariant (p0105 == ($is_null($phys_ptr_cast(L#tmp,^s_node))));
invariant (p0106 == ($is_null($phys_ptr_cast(L#prev,^s_node))));
invariant (p0107 == ($is_null($phys_ptr_cast(local.list,^s_node))));
invariant (p0108 == (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(L#tmp,^s_node))));
invariant (p0109 == (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(L#prev,^s_node))));
invariant (p0110 == (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(local.list,^s_node))));
invariant (p0111 == (($phys_ptr_cast(L#tmp,^s_node) == $phys_ptr_cast(P#list,^s_node))));
invariant (p0112 == (($phys_ptr_cast(L#tmp,^s_node) == $phys_ptr_cast(L#prev,^s_node))));
invariant (p0113 == (($phys_ptr_cast(L#tmp,^s_node) == $phys_ptr_cast(local.list,^s_node))));
invariant (p0114 == (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(P#list,^s_node))));
invariant (p0115 == (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(L#tmp,^s_node))));
invariant (p0116 == (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(local.list,^s_node))));
invariant (p0117 == (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(P#list,^s_node))));
invariant (p0118 == (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(L#tmp,^s_node))));
invariant (p0119 == (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(L#prev,^s_node))));
invariant (p0120 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node)))));
invariant (p0121 == (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#tmp,^s_node),^s_node)))));
invariant (p0122 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node)))));
invariant (p0123 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node)))));
invariant (p0124 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node)))));
invariant (p0125 == (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#tmp,^s_node),^s_node)))));
invariant (p0126 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node)))));
invariant (p0127 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node)))));
invariant (p0128 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(L#tmp,^s_node)))));
invariant (p0129 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node)))));
invariant (p0130 == (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node)))));
invariant (p0131 == (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#tmp,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node)))));
invariant (p0132 == (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#tmp,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node)))));
invariant (p0133 == (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#tmp,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node)))));
invariant (p0134 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node)))));
invariant (p0135 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(L#tmp,^s_node)))));
invariant (p0136 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node)))));
invariant (p0137 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node)))));
invariant (p0138 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(L#tmp,^s_node)))));
invariant (p0139 == (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node)))));

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
p0117,
p0118,
p0119,
p0120,
p0121,
p0122,
p0123,
p0124,
p0125,
p0126,
p0127,
p0128,
p0129,
p0130,
p0131,
p0132,
p0133,
p0134,
p0135,
p0136,
p0137,
p0138,
p0139,
true
);

      invariant $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> $is_malloc_root($s, $phys_ptr_cast(L#tmp, ^s_node));
      invariant $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#tmp, ^s_node));
      invariant $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#tmp, ^s_node));
      invariant $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#prev, ^s_node));
      invariant $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#prev, ^s_node));
    {
      anon9:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#0, $s);
        assume $full_stop_ext(#tok$2^15.2, $s);
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
                    assume $full_stop_ext(#tok$2^33.5, $s);
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
                assert (forall #writes$2^38.4: $ptr :: { $dont_instantiate(#writes$2^38.4) } $set_in(#writes$2^38.4, $extent($s, $phys_ptr_cast(L#tmp, ^s_node))) ==> $top_writable($s, #wrTime$2^3.3, #writes$2^38.4));
                // stmt _vcc_free(tmp); 
                call $free($phys_ptr_cast(L#tmp, ^s_node));
                assume $full_stop_ext(#tok$2^38.4, $s);
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
                // goto #break_1; 
                goto #break_1;
            }
            else
            {
              anon5:
                // assert @_vcc_possibly_unreachable; 
                assert {:PossiblyUnreachable true} true;
            }

          anon7:
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
            // assume ==>(@_vcc_ptr_neq_null(tmp), @_vcc_is_malloc_root(@state, tmp)); 
            assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> $is_malloc_root($s, $phys_ptr_cast(L#tmp, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(tmp), &&(@_vcc_mutable(@state, tmp), @writes_check(tmp))); 
            assume $non_null($phys_ptr_cast(L#tmp, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#tmp, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#tmp, ^s_node));
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
p0000 := (F#sll($s,$phys_ptr_cast(P#list,^s_node)));
p0001 := (F#sll($s,$phys_ptr_cast(L#tmp,^s_node)));
p0002 := (F#sll($s,$phys_ptr_cast(L#prev,^s_node)));
p0003 := (F#sll($s,$phys_ptr_cast(local.list,^s_node)));
p0004 := (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node)));
p0005 := (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)));
p0006 := (F#sll_lseg($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)));
p0007 := (F#sll_lseg($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node)));
p0008 := (F#sll_lseg($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node)));
p0009 := (F#sll_lseg($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node)));
p0010 := (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)));
p0011 := (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node)));
p0012 := (F#sll_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)));
p0013 := (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)));
p0014 := (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node)));
p0015 := (F#sll_lseg($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)));
p0016 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0017 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0018 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0019 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0020 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0021 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0022 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0023 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0024 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0025 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0026 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0027 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0028 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0029 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0030 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0031 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0032 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0033 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0034 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0035 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0036 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0037 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0038 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0039 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0040 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0041 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0042 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0043 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0044 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0045 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0046 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0047 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0048 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0049 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0050 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0051 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0052 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0053 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0054 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0055 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node))));
p0056 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0057 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0058 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0059 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0060 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0061 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0062 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node))));
p0063 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node))));
p0064 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
p0065 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
p0066 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
p0067 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
p0068 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
p0069 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
p0070 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
p0071 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
p0072 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_reach($s,$phys_ptr_cast(local.list,^s_node)))));
p0073 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#list,^s_node)))));
p0074 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#tmp,^s_node)))));
p0075 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
p0076 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0077 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node)))));
p0078 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node)))));
p0079 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)))));
p0080 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node)))));
p0081 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0082 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0083 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)))));
p0084 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)))));
p0085 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(local.list,^s_node)))));
p0086 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)))));
p0087 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#tmp,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0088 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node)))));
p0089 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(local.list,^s_node)))));
p0090 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node)))));
p0091 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(local.list,^s_node)))));
p0092 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(P#list,^s_node)))));
p0093 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(local.list,^s_node),$phys_ptr_cast(L#tmp,^s_node)))));
p0094 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#tmp,^s_node)))));
p0095 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#list,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0096 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(P#list,^s_node)))));
p0097 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#tmp,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0098 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#list,^s_node)))));
p0099 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#tmp,^s_node)))));
p0100 := ($non_null($phys_ptr_cast(P#list,^s_node)));
p0101 := ($non_null($phys_ptr_cast(L#tmp,^s_node)));
p0102 := ($non_null($phys_ptr_cast(L#prev,^s_node)));
p0103 := ($non_null($phys_ptr_cast(local.list,^s_node)));
p0104 := ($is_null($phys_ptr_cast(P#list,^s_node)));
p0105 := ($is_null($phys_ptr_cast(L#tmp,^s_node)));
p0106 := ($is_null($phys_ptr_cast(L#prev,^s_node)));
p0107 := ($is_null($phys_ptr_cast(local.list,^s_node)));
p0108 := (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(L#tmp,^s_node)));
p0109 := (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
p0110 := (($phys_ptr_cast(P#list,^s_node) == $phys_ptr_cast(local.list,^s_node)));
p0111 := (($phys_ptr_cast(L#tmp,^s_node) == $phys_ptr_cast(P#list,^s_node)));
p0112 := (($phys_ptr_cast(L#tmp,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
p0113 := (($phys_ptr_cast(L#tmp,^s_node) == $phys_ptr_cast(local.list,^s_node)));
p0114 := (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(P#list,^s_node)));
p0115 := (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(L#tmp,^s_node)));
p0116 := (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(local.list,^s_node)));
p0117 := (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(P#list,^s_node)));
p0118 := (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(L#tmp,^s_node)));
p0119 := (($phys_ptr_cast(local.list,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
p0120 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node))));
p0121 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#tmp,^s_node),^s_node))));
p0122 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node))));
p0123 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node))));
p0124 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node))));
p0125 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#tmp,^s_node),^s_node))));
p0126 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node))));
p0127 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node))));
p0128 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(L#tmp,^s_node))));
p0129 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));
p0130 := (($non_null($phys_ptr_cast(P#list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#list,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node))));
p0131 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#tmp,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node))));
p0132 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#tmp,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));
p0133 := (($non_null($phys_ptr_cast(L#tmp,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#tmp,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node))));
p0134 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node))));
p0135 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(L#tmp,^s_node))));
p0136 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(local.list,^s_node))));
p0137 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(P#list,^s_node))));
p0138 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(L#tmp,^s_node))));
p0139 := (($non_null($phys_ptr_cast(local.list,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(local.list,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));

    }

  anon11:
    assume $full_stop_ext(#tok$2^15.2, $s);

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

const unique #tok$2^38.4: $token;

const unique #tok$2^33.5: $token;

const unique #tok$2^15.2: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^3.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Cgslist?5Cg_slist_remove.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Cgslist?5Cg_slist_remove.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Cgslist?5Cdryad_gslist_sll.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Cgslist?5Cdryad_gslist_sll.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^s_node);

