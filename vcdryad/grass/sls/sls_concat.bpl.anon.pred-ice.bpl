
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
b0140 : bool,
b0141 : bool,
b0142 : bool,
b0143 : bool,
b0144 : bool,
b0145 : bool,
b0146 : bool,
b0147 : bool,
b0148 : bool,
b0149 : bool,
b0150 : bool,
b0151 : bool,
b0152 : bool,
b0153 : bool
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

const unique ^$#sls_concat.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#sls_concat.c..36263#3);

type $#sls_concat.c..36263#3;

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



procedure sls_concat(P#a: $ptr, P#b: $ptr) returns ($result: $ptr);
  requires F#srtl($s, $phys_ptr_cast(P#a, ^s_node));
  requires F#srtl($s, $phys_ptr_cast(P#b, ^s_node));
  requires $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#a, ^s_node)) <= F#sll_min_key($s, $phys_ptr_cast(P#b, ^s_node));
  requires $oset_disjoint(F#srtl_reach($s, $phys_ptr_cast(P#a, ^s_node)), F#srtl_reach($s, $phys_ptr_cast(P#b, ^s_node)));
  modifies $s, $cev_pc;
  ensures F#srtl($s, $phys_ptr_cast($result, ^s_node));
  ensures F#sll_keys($s, $phys_ptr_cast($result, ^s_node)) == $intset_union(F#sll_keys(old($s), $phys_ptr_cast(P#a, ^s_node)), F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)));
  ensures F#sll_reach($s, $phys_ptr_cast($result, ^s_node)) == $oset_union(F#sll_reach(old($s), $phys_ptr_cast(P#a, ^s_node)), F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation sls_concat(P#a: $ptr, P#b: $ptr) returns ($result: $ptr)
{
  var stmtexpr1#6: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr0#5: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr0#4: $ptr;
  var SL#curr0: $ptr;
  var loopState#0: $state;
  var L#curr: $ptr;
  var stmtexpr1#8: $oset;
  var stmtexpr0#7: $oset;
  var res_srtl_reach#3: $oset;
  var res_srtl_reach#2: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
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
var p0140 : bool;
var p0141 : bool;
var p0142 : bool;
var p0143 : bool;
var p0144 : bool;
var p0145 : bool;
var p0146 : bool;
var p0147 : bool;
var p0148 : bool;
var p0149 : bool;
var p0150 : bool;
var p0151 : bool;
var p0152 : bool;

// INV:PTR: P#a, P#b, L#curr
// INV:INT:
// INV:LST: srtl

  anon7:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$2^3.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$2^3.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$2^3.3, (lambda #p: $ptr :: false));
    // assume true
    // assume true
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _math \oset res_srtl_reach#2; 
    // res_srtl_reach#2 := srtl_reach(a); 
    call res_srtl_reach#2 := srtl_reach($phys_ptr_cast(P#a, ^s_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _math \oset res_srtl_reach#3; 
    // res_srtl_reach#3 := srtl_reach(b); 
    call res_srtl_reach#3 := srtl_reach($phys_ptr_cast(P#b, ^s_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _dryad_G0 := @_vcc_oset_union(res_srtl_reach#2, res_srtl_reach#3); 
    SL#_dryad_G0 := $oset_union(res_srtl_reach#2, res_srtl_reach#3);
    // _math \oset stmtexpr0#7; 
    // stmtexpr0#7 := _dryad_G0; 
    stmtexpr0#7 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#8; 
    // stmtexpr1#8 := _dryad_G1; 
    stmtexpr1#8 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_list_len_next(b), unchecked+(sll_list_len_next(*((b->next))), 1))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#b, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(rsrtl(b), &&(&&(rsrtl(*((b->next))), unchecked!(@_vcc_oset_in(b, rsrtl_reach(*((b->next)))))), >=(*((b->key)), sll_max_key(*((b->next))))))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#b, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(b), ==(rsrtl_reach(b), @_vcc_oset_union(rsrtl_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union(sll_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(sll_max_key(b), @\int_max(*((b->key)), sll_max_key(*((b->next)))))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#b, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(sll_min_key(b), @\int_min(*((b->key)), sll_min_key(*((b->next)))))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#b, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(srtl(b), &&(&&(srtl(*((b->next))), unchecked!(@_vcc_oset_in(b, srtl_reach(*((b->next)))))), <=(*((b->key)), sll_min_key(*((b->next))))))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#b, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(b), ==(srtl_reach(b), @_vcc_oset_union(srtl_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_keys(a), @_vcc_intset_union(sll_keys(*((a->next))), @_vcc_intset_singleton(*((a->key)))))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#a, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_list_len_next(a), unchecked+(sll_list_len_next(*((a->next))), 1))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#a, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(rsrtl(a), &&(&&(rsrtl(*((a->next))), unchecked!(@_vcc_oset_in(a, rsrtl_reach(*((a->next)))))), >=(*((a->key)), sll_max_key(*((a->next))))))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#a, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(a), ==(rsrtl_reach(a), @_vcc_oset_union(rsrtl_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(a), ==(sll(a), &&(sll(*((a->next))), unchecked!(@_vcc_oset_in(a, sll_reach(*((a->next)))))))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#a, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_reach(a), @_vcc_oset_union(sll_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(sll_max_key(a), @\int_max(*((a->key)), sll_max_key(*((a->next)))))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#a, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(sll_min_key(a), @\int_min(*((a->key)), sll_min_key(*((a->next)))))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#a, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(srtl(a), &&(&&(srtl(*((a->next))), unchecked!(@_vcc_oset_in(a, srtl_reach(*((a->next)))))), <=(*((a->key)), sll_min_key(*((a->next))))))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#a, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(a), ==(srtl_reach(a), @_vcc_oset_union(srtl_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(a), &&(@_vcc_mutable(@state, a), @writes_check(a))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> $mutable($s, $phys_ptr_cast(P#a, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(P#a, ^s_node));
    assume true;
    // if (@_vcc_ptr_eq_null(a)) ...
    if ($is_null($phys_ptr_cast(P#a, ^s_node)))
    {
      anon1:
        // return b; 
        $result := $phys_ptr_cast(P#b, ^s_node);
        assume true;
        assert $position_marker();
        goto #exit;
    }
    else
    {
      anon5:
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_list_len_next(b), unchecked+(sll_list_len_next(*((b->next))), 1))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#b, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(rsrtl(b), &&(&&(rsrtl(*((b->next))), unchecked!(@_vcc_oset_in(b, rsrtl_reach(*((b->next)))))), >=(*((b->key)), sll_max_key(*((b->next))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#b, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(rsrtl_reach(b), @_vcc_oset_union(rsrtl_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union(sll_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(sll_max_key(b), @\int_max(*((b->key)), sll_max_key(*((b->next)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#b, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(sll_min_key(b), @\int_min(*((b->key)), sll_min_key(*((b->next)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#b, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(srtl(b), &&(&&(srtl(*((b->next))), unchecked!(@_vcc_oset_in(b, srtl_reach(*((b->next)))))), <=(*((b->key)), sll_min_key(*((b->next))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#b, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(srtl_reach(b), @_vcc_oset_union(srtl_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_keys(a), @_vcc_intset_union(sll_keys(*((a->next))), @_vcc_intset_singleton(*((a->key)))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#a, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_list_len_next(a), unchecked+(sll_list_len_next(*((a->next))), 1))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#a, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(rsrtl(a), &&(&&(rsrtl(*((a->next))), unchecked!(@_vcc_oset_in(a, rsrtl_reach(*((a->next)))))), >=(*((a->key)), sll_max_key(*((a->next))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#a, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(rsrtl_reach(a), @_vcc_oset_union(rsrtl_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll(a), &&(sll(*((a->next))), unchecked!(@_vcc_oset_in(a, sll_reach(*((a->next)))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#a, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_reach(a), @_vcc_oset_union(sll_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(sll_max_key(a), @\int_max(*((a->key)), sll_max_key(*((a->next)))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#a, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(sll_min_key(a), @\int_min(*((a->key)), sll_min_key(*((a->next)))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#a, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(srtl(a), &&(&&(srtl(*((a->next))), unchecked!(@_vcc_oset_in(a, srtl_reach(*((a->next)))))), <=(*((a->key)), sll_min_key(*((a->next))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#a, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(srtl_reach(a), @_vcc_oset_union(srtl_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
        // struct s_node* curr; 
        // var struct s_node* curr
        // curr := a; 
        L#curr := $phys_ptr_cast(P#a, ^s_node);
        // assert sll_lseg(curr, curr); 
        assert F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume sll_lseg(curr, curr); 
        assume F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assert srtl_lseg(curr, curr); 
        assert F#srtl_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume srtl_lseg(curr, curr); 
        assume F#srtl_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assert sll_lseg(b, b); 
        assert F#sll_lseg($s, $phys_ptr_cast(P#b, ^s_node), $phys_ptr_cast(P#b, ^s_node));
        // assume sll_lseg(b, b); 
        assume F#sll_lseg($s, $phys_ptr_cast(P#b, ^s_node), $phys_ptr_cast(P#b, ^s_node));
        // assert srtl_lseg(b, b); 
        assert F#srtl_lseg($s, $phys_ptr_cast(P#b, ^s_node), $phys_ptr_cast(P#b, ^s_node));
        // assume srtl_lseg(b, b); 
        assume F#srtl_lseg($s, $phys_ptr_cast(P#b, ^s_node), $phys_ptr_cast(P#b, ^s_node));
        // assert sll_lseg(a, a); 
        assert F#sll_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(P#a, ^s_node));
        // assume sll_lseg(a, a); 
        assume F#sll_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(P#a, ^s_node));
        // assert srtl_lseg(a, a); 
        assert F#srtl_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(P#a, ^s_node));
        // assume srtl_lseg(a, a); 
        assume F#srtl_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(P#a, ^s_node));
        loopState#0 := $s;
        assume true;
p0000 := (F#srtl($s,$phys_ptr_cast(P#a,^s_node)));
p0001 := (F#srtl($s,$phys_ptr_cast(P#b,^s_node)));
p0002 := (F#srtl($s,$phys_ptr_cast(L#curr,^s_node)));
p0003 := (F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)));
p0004 := (F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)));
p0005 := (F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)));
p0006 := (F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)));
p0007 := (F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)));
p0008 := (F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)));
p0009 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node))));
p0010 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node))));
p0011 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node))));
p0012 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node))));
p0013 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node))));
p0014 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node))));
p0015 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node))));
p0016 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node))));
p0017 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node))));
p0018 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node))));
p0019 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node))));
p0020 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node))));
p0021 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node))));
p0022 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node))));
p0023 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node))));
p0024 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node))));
p0025 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node))));
p0026 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node))));
p0027 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)))));
p0028 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)))));
p0029 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)))));
p0030 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)))));
p0031 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)))));
p0032 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)))));
p0033 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
p0034 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)))));
p0035 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
p0036 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)))));
p0037 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)))));
p0038 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)))));
p0039 := ($non_null($phys_ptr_cast(P#a,^s_node)));
p0040 := ($non_null($phys_ptr_cast(P#b,^s_node)));
p0041 := ($non_null($phys_ptr_cast(L#curr,^s_node)));
p0042 := ($is_null($phys_ptr_cast(P#a,^s_node)));
p0043 := ($is_null($phys_ptr_cast(P#b,^s_node)));
p0044 := ($is_null($phys_ptr_cast(L#curr,^s_node)));
p0045 := (($phys_ptr_cast(P#a,^s_node) == $phys_ptr_cast(P#b,^s_node)));
p0046 := (($phys_ptr_cast(P#a,^s_node) == $phys_ptr_cast(L#curr,^s_node)));
p0047 := (($phys_ptr_cast(P#b,^s_node) == $phys_ptr_cast(P#a,^s_node)));
p0048 := (($phys_ptr_cast(P#b,^s_node) == $phys_ptr_cast(L#curr,^s_node)));
p0049 := (($phys_ptr_cast(L#curr,^s_node) == $phys_ptr_cast(P#a,^s_node)));
p0050 := (($phys_ptr_cast(L#curr,^s_node) == $phys_ptr_cast(P#b,^s_node)));
p0051 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node))));
p0052 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node))));
p0053 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node))));
p0054 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node))));
p0055 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node))));
p0056 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node))));
p0057 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node) == $phys_ptr_cast(P#b,^s_node))));
p0058 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node) == $phys_ptr_cast(L#curr,^s_node))));
p0059 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node) == $phys_ptr_cast(P#a,^s_node))));
p0060 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node) == $phys_ptr_cast(L#curr,^s_node))));
p0061 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node) == $phys_ptr_cast(P#a,^s_node))));
p0062 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node) == $phys_ptr_cast(P#b,^s_node))));
p0063 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#b,^s_node))));
p0064 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node))));
p0065 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#a,^s_node))));
p0066 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node))));
p0067 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#a,^s_node))));
p0068 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#b,^s_node))));
p0069 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node))));
p0070 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node))));
p0071 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node))));
p0072 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node))));
p0073 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node))));
p0074 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node))));
p0075 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0076 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0077 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0078 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0079 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0080 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0081 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0082 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0083 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0084 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0085 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0086 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0087 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0088 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0089 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0090 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0091 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0092 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0093 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0094 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0095 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0096 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0097 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0098 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0099 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0100 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0101 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0102 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0103 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0104 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0105 := ((($non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0106 := ((($non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0107 := ((($non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0108 := ((($non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0109 := ((($non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0110 := ((($non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0111 := ((($non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0112 := ((($non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0113 := ((($non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0114 := ((($non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0115 := ((($non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0116 := ((($non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0117 := (((F#srtl($s,$phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0118 := (((F#srtl($s,$phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0119 := (((F#srtl($s,$phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0120 := (((F#srtl($s,$phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0121 := (((F#srtl($s,$phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0122 := (((F#srtl($s,$phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0123 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0124 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0125 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0126 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0127 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0128 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0129 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0130 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0131 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0132 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0133 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0134 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0135 := (((F#srtl($s,$phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#a,^s_node)))));
p0136 := (((F#srtl($s,$phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#a,^s_node)))));
p0137 := (((F#srtl($s,$phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#b,^s_node)))));
p0138 := (((F#srtl($s,$phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#b,^s_node)))));
p0139 := (((F#srtl($s,$phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#curr,^s_node)))));
p0140 := (((F#srtl($s,$phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#curr,^s_node)))));
p0141 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)))));
p0142 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
p0143 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)))));
p0144 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
p0145 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)))));
p0146 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)))));
p0147 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)))));
p0148 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
p0149 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)))));
p0150 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
p0151 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)))));
p0152 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)))));

        while (true)

invariant (p0000 == (F#srtl($s,$phys_ptr_cast(P#a,^s_node))));
invariant (p0001 == (F#srtl($s,$phys_ptr_cast(P#b,^s_node))));
invariant (p0002 == (F#srtl($s,$phys_ptr_cast(L#curr,^s_node))));
invariant (p0003 == (F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node))));
invariant (p0004 == (F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node))));
invariant (p0005 == (F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node))));
invariant (p0006 == (F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node))));
invariant (p0007 == (F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node))));
invariant (p0008 == (F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node))));
invariant (p0009 == ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)))));
invariant (p0010 == ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)))));
invariant (p0011 == ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)))));
invariant (p0012 == ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)))));
invariant (p0013 == ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)))));
invariant (p0014 == ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)))));
invariant (p0015 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)))));
invariant (p0016 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)))));
invariant (p0017 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)))));
invariant (p0018 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)))));
invariant (p0019 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)))));
invariant (p0020 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)))));
invariant (p0021 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)))));
invariant (p0022 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)))));
invariant (p0023 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)))));
invariant (p0024 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)))));
invariant (p0025 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)))));
invariant (p0026 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)))));
invariant (p0027 == (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0028 == (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0029 == (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0030 == (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0031 == (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0032 == (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0033 == (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0034 == (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node))))));
invariant (p0035 == (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0036 == (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node))))));
invariant (p0037 == (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node))))));
invariant (p0038 == (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node))))));
invariant (p0039 == ($non_null($phys_ptr_cast(P#a,^s_node))));
invariant (p0040 == ($non_null($phys_ptr_cast(P#b,^s_node))));
invariant (p0041 == ($non_null($phys_ptr_cast(L#curr,^s_node))));
invariant (p0042 == ($is_null($phys_ptr_cast(P#a,^s_node))));
invariant (p0043 == ($is_null($phys_ptr_cast(P#b,^s_node))));
invariant (p0044 == ($is_null($phys_ptr_cast(L#curr,^s_node))));
invariant (p0045 == (($phys_ptr_cast(P#a,^s_node) == $phys_ptr_cast(P#b,^s_node))));
invariant (p0046 == (($phys_ptr_cast(P#a,^s_node) == $phys_ptr_cast(L#curr,^s_node))));
invariant (p0047 == (($phys_ptr_cast(P#b,^s_node) == $phys_ptr_cast(P#a,^s_node))));
invariant (p0048 == (($phys_ptr_cast(P#b,^s_node) == $phys_ptr_cast(L#curr,^s_node))));
invariant (p0049 == (($phys_ptr_cast(L#curr,^s_node) == $phys_ptr_cast(P#a,^s_node))));
invariant (p0050 == (($phys_ptr_cast(L#curr,^s_node) == $phys_ptr_cast(P#b,^s_node))));
invariant (p0051 == (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node)))));
invariant (p0052 == (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node)))));
invariant (p0053 == (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node)))));
invariant (p0054 == (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node)))));
invariant (p0055 == (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node)))));
invariant (p0056 == (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node)))));
invariant (p0057 == (($non_null($phys_ptr_cast(P#a,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node) == $phys_ptr_cast(P#b,^s_node)))));
invariant (p0058 == (($non_null($phys_ptr_cast(P#a,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node) == $phys_ptr_cast(L#curr,^s_node)))));
invariant (p0059 == (($non_null($phys_ptr_cast(P#b,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node) == $phys_ptr_cast(P#a,^s_node)))));
invariant (p0060 == (($non_null($phys_ptr_cast(P#b,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node) == $phys_ptr_cast(L#curr,^s_node)))));
invariant (p0061 == (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node) == $phys_ptr_cast(P#a,^s_node)))));
invariant (p0062 == (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node) == $phys_ptr_cast(P#b,^s_node)))));
invariant (p0063 == ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
invariant (p0064 == ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
invariant (p0065 == ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
invariant (p0066 == ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
invariant (p0067 == ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
invariant (p0068 == ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
invariant (p0069 == ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
invariant (p0070 == ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)))));
invariant (p0071 == ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
invariant (p0072 == ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)))));
invariant (p0073 == ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)))));
invariant (p0074 == ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)))));
invariant (p0075 == ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0076 == ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0077 == ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0078 == ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0079 == ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0080 == ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0081 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0082 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0083 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0084 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0085 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0086 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0087 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0088 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0089 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0090 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0091 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0092 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0093 == ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0094 == ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0095 == ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0096 == ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0097 == ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0098 == ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0099 == ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0100 == ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0101 == ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0102 == ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0103 == ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0104 == ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0105 == ((($non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0106 == ((($non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0107 == ((($non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0108 == ((($non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0109 == ((($non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0110 == ((($non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0111 == ((($non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0112 == ((($non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0113 == ((($non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0114 == ((($non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0115 == ((($non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0116 == ((($non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0117 == (((F#srtl($s,$phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0118 == (((F#srtl($s,$phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0119 == (((F#srtl($s,$phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0120 == (((F#srtl($s,$phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0121 == (((F#srtl($s,$phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0122 == (((F#srtl($s,$phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0123 == (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0124 == (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0125 == (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0126 == (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0127 == (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0128 == (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0129 == (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0130 == (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0131 == (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0132 == (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0133 == (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0134 == (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0135 == (((F#srtl($s,$phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0136 == (((F#srtl($s,$phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#a,^s_node))))));
invariant (p0137 == (((F#srtl($s,$phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0138 == (((F#srtl($s,$phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#b,^s_node))))));
invariant (p0139 == (((F#srtl($s,$phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0140 == (((F#srtl($s,$phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0141 == (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node))))));
invariant (p0142 == (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0143 == (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node))))));
invariant (p0144 == (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0145 == (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node))))));
invariant (p0146 == (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node))))));
invariant (p0147 == (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node))))));
invariant (p0148 == (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0149 == (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node))))));
invariant (p0150 == (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node))))));
invariant (p0151 == (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node))))));
invariant (p0152 == (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node))))));

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
p0140,
p0141,
p0142,
p0143,
p0144,
p0145,
p0146,
p0147,
p0148,
p0149,
p0150,
p0151,
p0152,
true
);

          invariant $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^s_node));
          invariant $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#curr, ^s_node));
        {
          anon4:
            assume $writes_nothing(old($s), $s);
            assume $timestamp_post(loopState#0, $s);
            assume $full_stop_ext(#tok$2^19.5, $s);
            // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
            assume $meta_eq(loopState#0, $s);
            // assert @reads_check_normal((curr->next)); 
            assert $thread_local($s, $phys_ptr_cast(L#curr, ^s_node));
            assume true;
            // if (@_vcc_ptr_neq_null(*((curr->next)))) ...
            if ($non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)))
            {
              anon2:
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
                // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_list_len_next(b), unchecked+(sll_list_len_next(*((b->next))), 1))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#b, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(rsrtl(b), &&(&&(rsrtl(*((b->next))), unchecked!(@_vcc_oset_in(b, rsrtl_reach(*((b->next)))))), >=(*((b->key)), sll_max_key(*((b->next))))))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#b, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(b), ==(rsrtl_reach(b), @_vcc_oset_union(rsrtl_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union(sll_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(sll_max_key(b), @\int_max(*((b->key)), sll_max_key(*((b->next)))))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#b, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(sll_min_key(b), @\int_min(*((b->key)), sll_min_key(*((b->next)))))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#b, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(srtl(b), &&(&&(srtl(*((b->next))), unchecked!(@_vcc_oset_in(b, srtl_reach(*((b->next)))))), <=(*((b->key)), sll_min_key(*((b->next))))))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#b, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(b), ==(srtl_reach(b), @_vcc_oset_union(srtl_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_keys(a), @_vcc_intset_union(sll_keys(*((a->next))), @_vcc_intset_singleton(*((a->key)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#a, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_list_len_next(a), unchecked+(sll_list_len_next(*((a->next))), 1))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#a, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), 1);
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(rsrtl(a), &&(&&(rsrtl(*((a->next))), unchecked!(@_vcc_oset_in(a, rsrtl_reach(*((a->next)))))), >=(*((a->key)), sll_max_key(*((a->next))))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#a, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(a), ==(rsrtl_reach(a), @_vcc_oset_union(rsrtl_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(a), ==(sll(a), &&(sll(*((a->next))), unchecked!(@_vcc_oset_in(a, sll_reach(*((a->next)))))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#a, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_reach(a), @_vcc_oset_union(sll_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(sll_max_key(a), @\int_max(*((a->key)), sll_max_key(*((a->next)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#a, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(sll_min_key(a), @\int_min(*((a->key)), sll_min_key(*((a->next)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#a, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(srtl(a), &&(&&(srtl(*((a->next))), unchecked!(@_vcc_oset_in(a, srtl_reach(*((a->next)))))), <=(*((a->key)), sll_min_key(*((a->next))))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#a, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(a), ==(srtl_reach(a), @_vcc_oset_union(srtl_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg(a, curr), &&(sll_lseg(*((a->next)), curr), unchecked!(@_vcc_oset_in(a, sll_lseg_reach(*((a->next)), curr)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg_reach(a, curr), @_vcc_oset_union(sll_lseg_reach(*((a->next)), curr), @_vcc_oset_singleton(a)))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg_keys(a, curr), @_vcc_intset_union(sll_lseg_keys(*((a->next)), curr), @_vcc_intset_singleton(*((a->key)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg_len_next(a, curr), unchecked+(sll_lseg_len_next(*((a->next)), curr), 1))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), 1);
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), @_vcc_ptr_neq_pure(*((a->next)), curr)), ==(sll_lseg_max_key(a, curr), @\int_max(*((a->key)), sll_lseg_max_key(*((a->next)), curr)))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), @_vcc_ptr_neq_pure(*((a->next)), curr)), ==(sll_lseg_min_key(a, curr), @\int_min(*((a->key)), sll_lseg_min_key(*((a->next)), curr)))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), @_vcc_ptr_neq_pure(*((a->next)), curr)), ==(srtl_lseg(a, curr), &&(&&(srtl_lseg(*((a->next)), curr), unchecked!(@_vcc_oset_in(a, srtl_lseg_reach(*((a->next)), curr)))), <=(*((a->key)), sll_lseg_min_key(*((a->next)), curr))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(srtl_lseg_reach(a, curr), @_vcc_oset_union(srtl_lseg_reach(*((a->next)), curr), @_vcc_oset_singleton(a)))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
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
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg(a, curr), &&(sll_lseg(*((a->next)), curr), unchecked!(@_vcc_oset_in(a, sll_lseg_reach(*((a->next)), curr)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg_reach(a, curr), @_vcc_oset_union(sll_lseg_reach(*((a->next)), curr), @_vcc_oset_singleton(a)))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg_keys(a, curr), @_vcc_intset_union(sll_lseg_keys(*((a->next)), curr), @_vcc_intset_singleton(*((a->key)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg_len_next(a, curr), unchecked+(sll_lseg_len_next(*((a->next)), curr), 1))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), 1);
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), @_vcc_ptr_neq_pure(*((a->next)), curr)), ==(sll_lseg_max_key(a, curr), @\int_max(*((a->key)), sll_lseg_max_key(*((a->next)), curr)))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), @_vcc_ptr_neq_pure(*((a->next)), curr)), ==(sll_lseg_min_key(a, curr), @\int_min(*((a->key)), sll_lseg_min_key(*((a->next)), curr)))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
                // assume ==>(&&(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), @_vcc_ptr_neq_pure(*((a->next)), curr)), ==(srtl_lseg(a, curr), &&(&&(srtl_lseg(*((a->next)), curr), unchecked!(@_vcc_oset_in(a, srtl_lseg_reach(*((a->next)), curr)))), <=(*((a->key)), sll_lseg_min_key(*((a->next)), curr))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(srtl_lseg_reach(a, curr), @_vcc_oset_union(srtl_lseg_reach(*((a->next)), curr), @_vcc_oset_singleton(a)))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
                // assume ==>(@_vcc_ptr_neq_null(curr), &&(@_vcc_mutable(@state, curr), @writes_check(curr))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(L#curr, ^s_node));
            }
            else
            {
              anon3:
                // assert @_vcc_possibly_unreachable; 
                assert {:PossiblyUnreachable true} true;
                // goto #break_1; 
                goto #break_1;
            }

          #continue_1:
            assume true;
p0000 := (F#srtl($s,$phys_ptr_cast(P#a,^s_node)));
p0001 := (F#srtl($s,$phys_ptr_cast(P#b,^s_node)));
p0002 := (F#srtl($s,$phys_ptr_cast(L#curr,^s_node)));
p0003 := (F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)));
p0004 := (F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)));
p0005 := (F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)));
p0006 := (F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)));
p0007 := (F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)));
p0008 := (F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)));
p0009 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node))));
p0010 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node))));
p0011 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node))));
p0012 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node))));
p0013 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node))));
p0014 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node))));
p0015 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node))));
p0016 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node))));
p0017 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node))));
p0018 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node))));
p0019 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node))));
p0020 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node))));
p0021 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node))));
p0022 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node))));
p0023 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node))));
p0024 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node))));
p0025 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node))));
p0026 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node))));
p0027 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)))));
p0028 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)))));
p0029 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)))));
p0030 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#curr,^s_node)))));
p0031 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#a,^s_node)))));
p0032 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#b,^s_node)))));
p0033 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
p0034 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)))));
p0035 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
p0036 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)))));
p0037 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)))));
p0038 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)))));
p0039 := ($non_null($phys_ptr_cast(P#a,^s_node)));
p0040 := ($non_null($phys_ptr_cast(P#b,^s_node)));
p0041 := ($non_null($phys_ptr_cast(L#curr,^s_node)));
p0042 := ($is_null($phys_ptr_cast(P#a,^s_node)));
p0043 := ($is_null($phys_ptr_cast(P#b,^s_node)));
p0044 := ($is_null($phys_ptr_cast(L#curr,^s_node)));
p0045 := (($phys_ptr_cast(P#a,^s_node) == $phys_ptr_cast(P#b,^s_node)));
p0046 := (($phys_ptr_cast(P#a,^s_node) == $phys_ptr_cast(L#curr,^s_node)));
p0047 := (($phys_ptr_cast(P#b,^s_node) == $phys_ptr_cast(P#a,^s_node)));
p0048 := (($phys_ptr_cast(P#b,^s_node) == $phys_ptr_cast(L#curr,^s_node)));
p0049 := (($phys_ptr_cast(L#curr,^s_node) == $phys_ptr_cast(P#a,^s_node)));
p0050 := (($phys_ptr_cast(L#curr,^s_node) == $phys_ptr_cast(P#b,^s_node)));
p0051 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node))));
p0052 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node))));
p0053 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node))));
p0054 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node))));
p0055 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node))));
p0056 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node))));
p0057 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node) == $phys_ptr_cast(P#b,^s_node))));
p0058 := (($non_null($phys_ptr_cast(P#a,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node) == $phys_ptr_cast(L#curr,^s_node))));
p0059 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node) == $phys_ptr_cast(P#a,^s_node))));
p0060 := (($non_null($phys_ptr_cast(P#b,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node) == $phys_ptr_cast(L#curr,^s_node))));
p0061 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node) == $phys_ptr_cast(P#a,^s_node))));
p0062 := (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node) == $phys_ptr_cast(P#b,^s_node))));
p0063 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#b,^s_node))));
p0064 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node))));
p0065 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#a,^s_node))));
p0066 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node))));
p0067 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#a,^s_node))));
p0068 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#b,^s_node))));
p0069 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node))));
p0070 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node))));
p0071 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node))));
p0072 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node))));
p0073 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node))));
p0074 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node))));
p0075 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0076 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0077 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0078 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0079 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0080 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0081 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0082 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0083 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0084 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0085 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0086 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0087 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0088 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0089 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0090 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0091 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0092 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0093 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0094 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0095 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0096 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0097 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0098 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0099 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0100 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#a,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0101 := ((F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0102 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#b,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#curr,^s_node)))));
p0103 := ((F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)))));
p0104 := ((F#sll_keys($s,$phys_ptr_cast(P#a,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#curr,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#b,^s_node)))));
p0105 := ((($non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0106 := ((($non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0107 := ((($non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0108 := ((($non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0109 := ((($non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0110 := ((($non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0111 := ((($non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0112 := ((($non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0113 := ((($non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0114 := ((($non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0115 := ((($non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0116 := ((($non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0117 := (((F#srtl($s,$phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0118 := (((F#srtl($s,$phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0119 := (((F#srtl($s,$phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0120 := (((F#srtl($s,$phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0121 := (((F#srtl($s,$phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0122 := (((F#srtl($s,$phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0123 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0124 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0125 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0126 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0127 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0128 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0129 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0130 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0131 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)))));
p0132 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0133 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)))));
p0134 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)))));
p0135 := (((F#srtl($s,$phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#a,^s_node)))));
p0136 := (((F#srtl($s,$phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#a,^s_node)))));
p0137 := (((F#srtl($s,$phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#b,^s_node)))));
p0138 := (((F#srtl($s,$phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#b,^s_node)))));
p0139 := (((F#srtl($s,$phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#curr,^s_node)))));
p0140 := (((F#srtl($s,$phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#curr,^s_node)))));
p0141 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)))));
p0142 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
p0143 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)))));
p0144 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
p0145 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)))));
p0146 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)))));
p0147 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)))));
p0148 := (((F#srtl_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#a,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
p0149 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(L#curr,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#curr,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)))));
p0150 := (((F#srtl_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)) && ($phys_ptr_cast(P#b,^s_node) != $phys_ptr_cast(L#curr,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
p0151 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#a,^s_node)) && $non_null($phys_ptr_cast(P#b,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#b,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)))));
p0152 := (((F#srtl_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)) && ($phys_ptr_cast(L#curr,^s_node) != $phys_ptr_cast(P#b,^s_node)) && $non_null($phys_ptr_cast(P#a,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#a,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)))));

        }

      anon6:
        assume $full_stop_ext(#tok$2^19.5, $s);

      #break_1:
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
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_list_len_next(b), unchecked+(sll_list_len_next(*((b->next))), 1))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#b, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(rsrtl(b), &&(&&(rsrtl(*((b->next))), unchecked!(@_vcc_oset_in(b, rsrtl_reach(*((b->next)))))), >=(*((b->key)), sll_max_key(*((b->next))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#b, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(rsrtl_reach(b), @_vcc_oset_union(rsrtl_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union(sll_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(sll_max_key(b), @\int_max(*((b->key)), sll_max_key(*((b->next)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#b, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(sll_min_key(b), @\int_min(*((b->key)), sll_min_key(*((b->next)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#b, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(srtl(b), &&(&&(srtl(*((b->next))), unchecked!(@_vcc_oset_in(b, srtl_reach(*((b->next)))))), <=(*((b->key)), sll_min_key(*((b->next))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#b, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(srtl_reach(b), @_vcc_oset_union(srtl_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_keys(a), @_vcc_intset_union(sll_keys(*((a->next))), @_vcc_intset_singleton(*((a->key)))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#a, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_list_len_next(a), unchecked+(sll_list_len_next(*((a->next))), 1))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#a, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(rsrtl(a), &&(&&(rsrtl(*((a->next))), unchecked!(@_vcc_oset_in(a, rsrtl_reach(*((a->next)))))), >=(*((a->key)), sll_max_key(*((a->next))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#a, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(rsrtl_reach(a), @_vcc_oset_union(rsrtl_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll(a), &&(sll(*((a->next))), unchecked!(@_vcc_oset_in(a, sll_reach(*((a->next)))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#a, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_reach(a), @_vcc_oset_union(sll_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(sll_max_key(a), @\int_max(*((a->key)), sll_max_key(*((a->next)))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#a, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(sll_min_key(a), @\int_min(*((a->key)), sll_min_key(*((a->next)))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#a, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(srtl(a), &&(&&(srtl(*((a->next))), unchecked!(@_vcc_oset_in(a, srtl_reach(*((a->next)))))), <=(*((a->key)), sll_min_key(*((a->next))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#a, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(srtl_reach(a), @_vcc_oset_union(srtl_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
        // _math \state _dryad_S0; 
        // _dryad_S0 := @_vcc_current_state(@state); 
        SL#_dryad_S0 := $current_state($s);
        // _math \state stmtexpr0#5; 
        // stmtexpr0#5 := _dryad_S0; 
        stmtexpr0#5 := SL#_dryad_S0;
        // assert @prim_writes_check((curr->next)); 
        assert $writable_prim($s, #wrTime$2^3.3, $dot($phys_ptr_cast(L#curr, ^s_node), s_node.next));
        // *(curr->next) := b; 
        call $write_int(s_node.next, $phys_ptr_cast(L#curr, ^s_node), $ptr_to_int($phys_ptr_cast(P#b, ^s_node)));
        assume $full_stop_ext(#tok$2^32.5, $s);
        // _math \state _dryad_S1; 
        // _dryad_S1 := @_vcc_current_state(@state); 
        SL#_dryad_S1 := $current_state($s);
        // _math \state stmtexpr1#6; 
        // stmtexpr1#6 := _dryad_S1; 
        stmtexpr1#6 := SL#_dryad_S1;
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(b)))), ==(old(_dryad_S0, sll_keys(b)), old(_dryad_S1, sll_keys(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(b)))), ==(old(_dryad_S0, sll_list_len_next(b)), old(_dryad_S1, sll_list_len_next(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, rsrtl_reach(b)))), ==(old(_dryad_S0, rsrtl(b)), old(_dryad_S1, rsrtl(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, rsrtl_reach(b)))), ==(old(_dryad_S0, rsrtl_reach(b)), old(_dryad_S1, rsrtl_reach(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(b)))), ==(old(_dryad_S0, sll(b)), old(_dryad_S1, sll(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(b)))), ==(old(_dryad_S0, sll_reach(b)), old(_dryad_S1, sll_reach(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(b)))), ==(old(_dryad_S0, sll_max_key(b)), old(_dryad_S1, sll_max_key(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(b)))), ==(old(_dryad_S0, sll_min_key(b)), old(_dryad_S1, sll_min_key(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, srtl_reach(b)))), ==(old(_dryad_S0, srtl(b)), old(_dryad_S1, srtl(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, srtl_reach(b)))), ==(old(_dryad_S0, srtl_reach(b)), old(_dryad_S1, srtl_reach(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(a)))), ==(old(_dryad_S0, sll_keys(a)), old(_dryad_S1, sll_keys(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(a)))), ==(old(_dryad_S0, sll_list_len_next(a)), old(_dryad_S1, sll_list_len_next(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, rsrtl_reach(a)))), ==(old(_dryad_S0, rsrtl(a)), old(_dryad_S1, rsrtl(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, rsrtl_reach(a)))), ==(old(_dryad_S0, rsrtl_reach(a)), old(_dryad_S1, rsrtl_reach(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(a)))), ==(old(_dryad_S0, sll(a)), old(_dryad_S1, sll(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(a)))), ==(old(_dryad_S0, sll_reach(a)), old(_dryad_S1, sll_reach(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(a)))), ==(old(_dryad_S0, sll_max_key(a)), old(_dryad_S1, sll_max_key(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(a)))), ==(old(_dryad_S0, sll_min_key(a)), old(_dryad_S1, sll_min_key(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, srtl_reach(a)))), ==(old(_dryad_S0, srtl(a)), old(_dryad_S1, srtl(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, srtl_reach(a)))), ==(old(_dryad_S0, srtl_reach(a)), old(_dryad_S1, srtl_reach(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_lseg_reach(a, curr)))), ==(old(_dryad_S0, sll_lseg(a, curr)), old(_dryad_S1, sll_lseg(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_lseg_reach(a, curr)))), ==(old(_dryad_S0, sll_lseg_reach(a, curr)), old(_dryad_S1, sll_lseg_reach(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_lseg_reach(a, curr)))), ==(old(_dryad_S0, sll_lseg_keys(a, curr)), old(_dryad_S1, sll_lseg_keys(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_lseg_reach(a, curr)))), ==(old(_dryad_S0, sll_lseg_len_next(a, curr)), old(_dryad_S1, sll_lseg_len_next(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_len_next(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_len_next(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_lseg_reach(a, curr)))), ==(old(_dryad_S0, sll_lseg_max_key(a, curr)), old(_dryad_S1, sll_lseg_max_key(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_max_key(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_max_key(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_lseg_reach(a, curr)))), ==(old(_dryad_S0, sll_lseg_min_key(a, curr)), old(_dryad_S1, sll_lseg_min_key(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_min_key(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_min_key(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, srtl_lseg_reach(a, curr)))), ==(old(_dryad_S0, srtl_lseg(a, curr)), old(_dryad_S1, srtl_lseg(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#srtl_lseg(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#srtl_lseg(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, srtl_lseg_reach(a, curr)))), ==(old(_dryad_S0, srtl_lseg_reach(a, curr)), old(_dryad_S1, srtl_lseg_reach(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#srtl_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#srtl_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(curr, b)), ==(*((b->key)), old(_dryad_S0, *((b->key))))); 
        assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(P#b, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(curr, b)), @_vcc_ptr_eq_pure(*((b->next)), old(_dryad_S0, *((b->next))))); 
        assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(P#b, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node);
        // assume ==>(!(@_vcc_ptr_eq_pure(curr, a)), ==(*((a->key)), old(_dryad_S0, *((a->key))))); 
        assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(P#a, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(curr, a)), @_vcc_ptr_eq_pure(*((a->next)), old(_dryad_S0, *((a->next))))); 
        assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(P#a, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node);
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_list_len_next(b), unchecked+(sll_list_len_next(*((b->next))), 1))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#b, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(rsrtl(b), &&(&&(rsrtl(*((b->next))), unchecked!(@_vcc_oset_in(b, rsrtl_reach(*((b->next)))))), >=(*((b->key)), sll_max_key(*((b->next))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#b, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(rsrtl_reach(b), @_vcc_oset_union(rsrtl_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union(sll_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(sll_max_key(b), @\int_max(*((b->key)), sll_max_key(*((b->next)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#b, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(sll_min_key(b), @\int_min(*((b->key)), sll_min_key(*((b->next)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#b, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(srtl(b), &&(&&(srtl(*((b->next))), unchecked!(@_vcc_oset_in(b, srtl_reach(*((b->next)))))), <=(*((b->key)), sll_min_key(*((b->next))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#b, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(srtl_reach(b), @_vcc_oset_union(srtl_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_keys(a), @_vcc_intset_union(sll_keys(*((a->next))), @_vcc_intset_singleton(*((a->key)))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#a, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_list_len_next(a), unchecked+(sll_list_len_next(*((a->next))), 1))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#a, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(rsrtl(a), &&(&&(rsrtl(*((a->next))), unchecked!(@_vcc_oset_in(a, rsrtl_reach(*((a->next)))))), >=(*((a->key)), sll_max_key(*((a->next))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#a, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(rsrtl_reach(a), @_vcc_oset_union(rsrtl_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll(a), &&(sll(*((a->next))), unchecked!(@_vcc_oset_in(a, sll_reach(*((a->next)))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#a, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_reach(a), @_vcc_oset_union(sll_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(sll_max_key(a), @\int_max(*((a->key)), sll_max_key(*((a->next)))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#a, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(sll_min_key(a), @\int_min(*((a->key)), sll_min_key(*((a->next)))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#a, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_null(*((a->next)))), ==(srtl(a), &&(&&(srtl(*((a->next))), unchecked!(@_vcc_oset_in(a, srtl_reach(*((a->next)))))), <=(*((a->key)), sll_min_key(*((a->next))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#a, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(srtl_reach(a), @_vcc_oset_union(srtl_reach(*((a->next))), @_vcc_oset_singleton(a)))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#a, ^s_node)));
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
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_list_len_next(b), unchecked+(sll_list_len_next(*((b->next))), 1))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#b, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(rsrtl(b), &&(&&(rsrtl(*((b->next))), unchecked!(@_vcc_oset_in(b, rsrtl_reach(*((b->next)))))), >=(*((b->key)), sll_max_key(*((b->next))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#b, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(rsrtl_reach(b), @_vcc_oset_union(rsrtl_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union(sll_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(sll_max_key(b), @\int_max(*((b->key)), sll_max_key(*((b->next)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#b, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(sll_min_key(b), @\int_min(*((b->key)), sll_min_key(*((b->next)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#b, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(b), @_vcc_ptr_neq_null(*((b->next)))), ==(srtl(b), &&(&&(srtl(*((b->next))), unchecked!(@_vcc_oset_in(b, srtl_reach(*((b->next)))))), <=(*((b->key)), sll_min_key(*((b->next))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#b, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(srtl_reach(b), @_vcc_oset_union(srtl_reach(*((b->next))), @_vcc_oset_singleton(b)))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#b, ^s_node)));
        // return a; 
        $result := $phys_ptr_cast(P#a, ^s_node);
        assume true;
        assert $position_marker();
        goto #exit;
    }

  anon8:
    // skip

  #exit:
}



axiom (forall Q#__vcc_state$1^687.9#tc2#1644: $state, Q#x$1^687.9#dt1#1618: $ptr :: {:weight 10} { F#srtl(Q#__vcc_state$1^687.9#tc2#1644, $phys_ptr_cast(Q#x$1^687.9#dt1#1618, ^s_node)) } { F#sll(Q#__vcc_state$1^687.9#tc2#1644, $phys_ptr_cast(Q#x$1^687.9#dt1#1618, ^s_node)) } $good_state(Q#__vcc_state$1^687.9#tc2#1644) && true ==> F#srtl(Q#__vcc_state$1^687.9#tc2#1644, $phys_ptr_cast(Q#x$1^687.9#dt1#1618, ^s_node)) ==> F#sll(Q#__vcc_state$1^687.9#tc2#1644, $phys_ptr_cast(Q#x$1^687.9#dt1#1618, ^s_node)));

axiom (forall Q#__vcc_state$1^688.9#tc2#1645: $state, Q#x$1^688.9#dt1#1619: $ptr :: {:weight 10} { F#rsrtl(Q#__vcc_state$1^688.9#tc2#1645, $phys_ptr_cast(Q#x$1^688.9#dt1#1619, ^s_node)) } { F#sll(Q#__vcc_state$1^688.9#tc2#1645, $phys_ptr_cast(Q#x$1^688.9#dt1#1619, ^s_node)) } $good_state(Q#__vcc_state$1^688.9#tc2#1645) && true ==> F#rsrtl(Q#__vcc_state$1^688.9#tc2#1645, $phys_ptr_cast(Q#x$1^688.9#dt1#1619, ^s_node)) ==> F#sll(Q#__vcc_state$1^688.9#tc2#1645, $phys_ptr_cast(Q#x$1^688.9#dt1#1619, ^s_node)));

axiom (forall Q#__vcc_state$1^689.9#tc2#1646: $state, Q#x$1^689.9#dt1#1620: $ptr :: {:weight 10} { F#sll_reach(Q#__vcc_state$1^689.9#tc2#1646, $phys_ptr_cast(Q#x$1^689.9#dt1#1620, ^s_node)) } { F#srtl_reach(Q#__vcc_state$1^689.9#tc2#1646, $phys_ptr_cast(Q#x$1^689.9#dt1#1620, ^s_node)) } $good_state(Q#__vcc_state$1^689.9#tc2#1646) && true ==> F#sll_reach(Q#__vcc_state$1^689.9#tc2#1646, $phys_ptr_cast(Q#x$1^689.9#dt1#1620, ^s_node)) == F#srtl_reach(Q#__vcc_state$1^689.9#tc2#1646, $phys_ptr_cast(Q#x$1^689.9#dt1#1620, ^s_node)));

axiom (forall Q#__vcc_state$1^690.9#tc2#1647: $state, Q#x$1^690.9#dt1#1621: $ptr :: {:weight 10} { F#srtl_reach(Q#__vcc_state$1^690.9#tc2#1647, $phys_ptr_cast(Q#x$1^690.9#dt1#1621, ^s_node)) } { F#rsrtl_reach(Q#__vcc_state$1^690.9#tc2#1647, $phys_ptr_cast(Q#x$1^690.9#dt1#1621, ^s_node)) } $good_state(Q#__vcc_state$1^690.9#tc2#1647) && true ==> F#srtl_reach(Q#__vcc_state$1^690.9#tc2#1647, $phys_ptr_cast(Q#x$1^690.9#dt1#1621, ^s_node)) == F#rsrtl_reach(Q#__vcc_state$1^690.9#tc2#1647, $phys_ptr_cast(Q#x$1^690.9#dt1#1621, ^s_node)));

axiom (forall Q#__vcc_state$1^691.9#tc2#1648: $state, Q#x$1^691.9#dt1#1622: $ptr, Q#y$1^691.9#dt1#1623: $ptr :: {:weight 10} { F#sll_lseg_reach(Q#__vcc_state$1^691.9#tc2#1648, $phys_ptr_cast(Q#x$1^691.9#dt1#1622, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1623, ^s_node)) } { F#srtl_lseg_reach(Q#__vcc_state$1^691.9#tc2#1648, $phys_ptr_cast(Q#x$1^691.9#dt1#1622, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1623, ^s_node)) } $good_state(Q#__vcc_state$1^691.9#tc2#1648) && true ==> F#sll_lseg_reach(Q#__vcc_state$1^691.9#tc2#1648, $phys_ptr_cast(Q#x$1^691.9#dt1#1622, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1623, ^s_node)) == F#srtl_lseg_reach(Q#__vcc_state$1^691.9#tc2#1648, $phys_ptr_cast(Q#x$1^691.9#dt1#1622, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1623, ^s_node)));

const unique l#public: $label;

axiom $type_code_is(2, ^$#state_t);

const unique #tok$2^32.5: $token;

const unique #tok$2^19.5: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^3.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Cgrass?5Csls_concat.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Cgrass?5Csls_concat.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Cgrass?5Cdryad_sls.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Cgrass?5Cdryad_sls.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^s_node);

