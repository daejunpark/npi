
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
b0153 : bool,
b0154 : bool,
b0155 : bool,
b0156 : bool,
b0157 : bool,
b0158 : bool,
b0159 : bool,
b0160 : bool,
b0161 : bool,
b0162 : bool,
b0163 : bool,
b0164 : bool,
b0165 : bool,
b0166 : bool,
b0167 : bool,
b0168 : bool,
b0169 : bool,
b0170 : bool,
b0171 : bool,
b0172 : bool,
b0173 : bool,
b0174 : bool,
b0175 : bool,
b0176 : bool,
b0177 : bool,
b0178 : bool,
b0179 : bool,
b0180 : bool,
b0181 : bool,
b0182 : bool,
b0183 : bool,
b0184 : bool,
b0185 : bool,
b0186 : bool,
b0187 : bool,
b0188 : bool,
b0189 : bool,
b0190 : bool,
b0191 : bool,
b0192 : bool,
b0193 : bool,
b0194 : bool,
b0195 : bool,
b0196 : bool,
b0197 : bool,
b0198 : bool,
b0199 : bool,
b0200 : bool,
b0201 : bool
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

function F#glob_reach() : $oset;

const unique cf#glob_reach: $pure_function;

axiom $function_arg_type(cf#glob_reach, 0, ^$#oset);

procedure glob_reach() returns ($result: $oset);
  free ensures $result == F#glob_reach();
  free ensures $call_transition(old($s), $s);



const unique ^$#_purecall_handler#1: $ctype;

axiom $def_fnptr_type(^$#_purecall_handler#1);

type $#_purecall_handler#1;

const unique ^$#_invalid_parameter_handler#2: $ctype;

axiom $def_fnptr_type(^$#_invalid_parameter_handler#2);

type $#_invalid_parameter_handler#2;

const unique ^$#sorted_insert_iter.c..36265#3: $ctype;

axiom $def_fnptr_type(^$#sorted_insert_iter.c..36265#3);

type $#sorted_insert_iter.c..36265#3;

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



procedure sorted_insert_iter(P#l: $ptr, P#k: int) returns ($result: $ptr);
  requires F#srtl($s, $phys_ptr_cast(P#l, ^s_node));
  requires !$intset_in(P#k, F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)));
  modifies $s, $cev_pc;
  ensures F#srtl($s, $phys_ptr_cast($result, ^s_node));
  ensures F#sll_keys($s, $phys_ptr_cast($result, ^s_node)) == $intset_union(F#sll_keys(old($s), $phys_ptr_cast(P#l, ^s_node)), $intset_singleton(P#k));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation sorted_insert_iter(P#l: $ptr, P#k: int) returns ($result: $ptr)
{
  var stmtexpr11#29: $state;
  var SL#_dryad_S9: $state;
  var stmtexpr10#28: $state;
  var SL#_dryad_S8: $state;
  var stmtexpr9#27: $state;
  var SL#_dryad_S7: $state;
  var stmtexpr8#26: $state;
  var SL#_dryad_S6: $state;
  var stmtexpr7#25: $state;
  var _dryad_S5#11: $state;
  var stmtexpr6#24: $state;
  var _dryad_S4#10: $state;
  var stmtexpr5#23: $state;
  var _dryad_S3#9: $state;
  var stmtexpr4#22: $state;
  var _dryad_S2#8: $state;
  var stmtexpr3#21: $state;
  var _dryad_S1#7: $state;
  var stmtexpr2#20: $oset;
  var stmtexpr1#19: $state;
  var _dryad_S0#6: $state;
  var stmtexpr0#17: $ptr;
  var SL#next1: $ptr;
  var ite#1: bool;
  var loopState#0: $state;
  var stmtexpr0#18: $ptr;
  var SL#l0: $ptr;
  var L#prev: $ptr;
  var L#next: $ptr;
  var L#curr: $ptr;
  var stmtexpr6#16: $state;
  var _dryad_S5#5: $state;
  var stmtexpr5#15: $state;
  var _dryad_S4#4: $state;
  var stmtexpr4#14: $state;
  var _dryad_S3#3: $state;
  var stmtexpr3#13: $state;
  var _dryad_S2#2: $state;
  var stmtexpr2#12: $state;
  var _dryad_S1#1: $state;
  var stmtexpr1#11: $oset;
  var stmtexpr0#10: $state;
  var _dryad_S0#0: $state;
  var L#hd: $ptr;
  var stmtexpr6#9: $state;
  var SL#_dryad_S5: $state;
  var stmtexpr5#8: $state;
  var SL#_dryad_S4: $state;
  var stmtexpr4#7: $state;
  var SL#_dryad_S3: $state;
  var stmtexpr3#6: $state;
  var SL#_dryad_S2: $state;
  var stmtexpr2#5: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr1#4: $oset;
  var stmtexpr0#3: $state;
  var SL#_dryad_S0: $state;
  var L#tl: $ptr;
  var stmtexpr1#31: $oset;
  var stmtexpr0#30: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$3^4.3: int;
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
var p0153 : bool;
var p0154 : bool;
var p0155 : bool;
var p0156 : bool;
var p0157 : bool;
var p0158 : bool;
var p0159 : bool;
var p0160 : bool;
var p0161 : bool;
var p0162 : bool;
var p0163 : bool;
var p0164 : bool;
var p0165 : bool;
var p0166 : bool;
var p0167 : bool;
var p0168 : bool;
var p0169 : bool;
var p0170 : bool;
var p0171 : bool;
var p0172 : bool;
var p0173 : bool;
var p0174 : bool;
var p0175 : bool;
var p0176 : bool;
var p0177 : bool;
var p0178 : bool;
var p0179 : bool;
var p0180 : bool;
var p0181 : bool;
var p0182 : bool;
var p0183 : bool;
var p0184 : bool;
var p0185 : bool;
var p0186 : bool;
var p0187 : bool;
var p0188 : bool;
var p0189 : bool;
var p0190 : bool;
var p0191 : bool;
var p0192 : bool;
var p0193 : bool;
var p0194 : bool;
var p0195 : bool;
var p0196 : bool;
var p0197 : bool;
var p0198 : bool;
var p0199 : bool;
var p0200 : bool;

// INV:PTR: P#l, L#prev, L#next
// INV:INT: P#k
// INV:LST: srtl

  anon12:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$3^4.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$3^4.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$3^4.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @in_range_i4(k); 
    assume $in_range_i4(P#k);
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    // assume true
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := srtl_reach(l); 
    call SL#_dryad_G0 := srtl_reach($phys_ptr_cast(P#l, ^s_node));
    assume $full_stop_ext(#tok$4^0.0, $s);
    // _math \oset stmtexpr0#30; 
    // stmtexpr0#30 := _dryad_G0; 
    stmtexpr0#30 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#31; 
    // stmtexpr1#31 := _dryad_G1; 
    stmtexpr1#31 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(l), &&(@_vcc_mutable(@state, l), @writes_check(l))); 
    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> $mutable($s, $phys_ptr_cast(P#l, ^s_node)) && $top_writable($s, #wrTime$3^4.3, $phys_ptr_cast(P#l, ^s_node));
    assume true;
    // if (@_vcc_ptr_eq_null(l)) ...
    if ($is_null($phys_ptr_cast(P#l, ^s_node)))
    {
      anon1:
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
        // struct s_node* tl; 
        // _math \state _dryad_S0; 
        // _dryad_S0 := @_vcc_current_state(@state); 
        SL#_dryad_S0 := $current_state($s);
        // _math \state stmtexpr0#3; 
        // stmtexpr0#3 := _dryad_S0; 
        stmtexpr0#3 := SL#_dryad_S0;
        // tl := _vcc_alloc(@_vcc_typeof((struct s_node*)@null)); 
        call L#tl := $alloc(^s_node);
        assume $full_stop_ext(#tok$3^14.15, $s);
        // assume !(@_vcc_oset_in(tl, @_vcc_oset_union(_dryad_G0, _dryad_G1))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), $oset_union(SL#_dryad_G0, SL#_dryad_G1));
        // _dryad_G1 := @_vcc_oset_union(_dryad_G0, @_vcc_oset_singleton(tl)); 
        SL#_dryad_G1 := $oset_union(SL#_dryad_G0, $oset_singleton($phys_ptr_cast(L#tl, ^s_node)));
        // _math \oset stmtexpr1#4; 
        // stmtexpr1#4 := _dryad_G1; 
        stmtexpr1#4 := SL#_dryad_G1;
        // assume ==(glob_reach(), _dryad_G1); 
        assume F#glob_reach() == SL#_dryad_G1;
        // _math \state _dryad_S1; 
        // _dryad_S1 := @_vcc_current_state(@state); 
        SL#_dryad_S1 := $current_state($s);
        // _math \state stmtexpr2#5; 
        // stmtexpr2#5 := _dryad_S1; 
        stmtexpr2#5 := SL#_dryad_S1;
        // assume ==>(@_vcc_ptr_neq_null(tl), ==(sll_keys(tl), @_vcc_intset_union(sll_keys(*((tl->next))), @_vcc_intset_singleton(*((tl->key)))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tl, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tl, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(tl), ==(sll_list_len_next(tl), unchecked+(sll_list_len_next(*((tl->next))), 1))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tl, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(tl), @_vcc_ptr_neq_null(*((tl->next)))), ==(rsrtl(tl), &&(&&(rsrtl(*((tl->next))), unchecked!(@_vcc_oset_in(tl, rsrtl_reach(*((tl->next)))))), >=(*((tl->key)), sll_max_key(*((tl->next))))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#tl, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#tl, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(tl), ==(rsrtl_reach(tl), @_vcc_oset_union(rsrtl_reach(*((tl->next))), @_vcc_oset_singleton(tl)))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#tl, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tl, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(tl), ==(sll(tl), &&(sll(*((tl->next))), unchecked!(@_vcc_oset_in(tl, sll_reach(*((tl->next)))))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tl, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(tl), ==(sll_reach(tl), @_vcc_oset_union(sll_reach(*((tl->next))), @_vcc_oset_singleton(tl)))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tl, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tl, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(tl), @_vcc_ptr_neq_null(*((tl->next)))), ==(sll_max_key(tl), @\int_max(*((tl->key)), sll_max_key(*((tl->next)))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#tl, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#tl, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(tl), @_vcc_ptr_neq_null(*((tl->next)))), ==(sll_min_key(tl), @\int_min(*((tl->key)), sll_min_key(*((tl->next)))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#tl, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#tl, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(tl), @_vcc_ptr_neq_null(*((tl->next)))), ==(srtl(tl), &&(&&(srtl(*((tl->next))), unchecked!(@_vcc_oset_in(tl, srtl_reach(*((tl->next)))))), <=(*((tl->key)), sll_min_key(*((tl->next))))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#tl, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#tl, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(tl), ==(srtl_reach(tl), @_vcc_oset_union(srtl_reach(*((tl->next))), @_vcc_oset_singleton(tl)))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#tl, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tl, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S0, sll_reach(l)))), ==(old(_dryad_S0, sll_keys(l)), old(_dryad_S1, sll_keys(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S0, sll_reach(l)))), ==(old(_dryad_S0, sll_list_len_next(l)), old(_dryad_S1, sll_list_len_next(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S0, rsrtl_reach(l)))), ==(old(_dryad_S0, rsrtl(l)), old(_dryad_S1, rsrtl(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S0, rsrtl_reach(l)))), ==(old(_dryad_S0, rsrtl_reach(l)), old(_dryad_S1, rsrtl_reach(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S0, sll_reach(l)))), ==(old(_dryad_S0, sll(l)), old(_dryad_S1, sll(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S0, sll_reach(l)))), ==(old(_dryad_S0, sll_reach(l)), old(_dryad_S1, sll_reach(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S0, sll_reach(l)))), ==(old(_dryad_S0, sll_max_key(l)), old(_dryad_S1, sll_max_key(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S0, sll_reach(l)))), ==(old(_dryad_S0, sll_min_key(l)), old(_dryad_S1, sll_min_key(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S0, srtl_reach(l)))), ==(old(_dryad_S0, srtl(l)), old(_dryad_S1, srtl(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S0, srtl_reach(l)))), ==(old(_dryad_S0, srtl_reach(l)), old(_dryad_S1, srtl_reach(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(P#l, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(P#l, ^s_node));
        // assume @_vcc_ptr_neq_null(tl); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node));
        // _math \state _dryad_S2; 
        // _dryad_S2 := @_vcc_current_state(@state); 
        SL#_dryad_S2 := $current_state($s);
        // _math \state stmtexpr3#6; 
        // stmtexpr3#6 := _dryad_S2; 
        stmtexpr3#6 := SL#_dryad_S2;
        // assert @prim_writes_check((tl->key)); 
        assert $writable_prim($s, #wrTime$3^4.3, $dot($phys_ptr_cast(L#tl, ^s_node), s_node.key));
        // *(tl->key) := k; 
        call $write_int(s_node.key, $phys_ptr_cast(L#tl, ^s_node), P#k);
        assume $full_stop_ext(#tok$3^17.3, $s);
        // _math \state _dryad_S3; 
        // _dryad_S3 := @_vcc_current_state(@state); 
        SL#_dryad_S3 := $current_state($s);
        // _math \state stmtexpr4#7; 
        // stmtexpr4#7 := _dryad_S3; 
        stmtexpr4#7 := SL#_dryad_S3;
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, sll_reach(*((tl->next)))))), ==(old(_dryad_S2, sll_keys(*((tl->next)))), old(_dryad_S3, sll_keys(*((tl->next)))))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) ==> F#sll_keys(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) == F#sll_keys(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, sll_reach(*((tl->next)))))), ==(old(_dryad_S2, sll_list_len_next(*((tl->next)))), old(_dryad_S3, sll_list_len_next(*((tl->next)))))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, rsrtl_reach(*((tl->next)))))), ==(old(_dryad_S2, rsrtl(*((tl->next)))), old(_dryad_S3, rsrtl(*((tl->next)))))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#rsrtl_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) ==> F#rsrtl(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) == F#rsrtl(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, rsrtl_reach(*((tl->next)))))), ==(old(_dryad_S2, rsrtl_reach(*((tl->next)))), old(_dryad_S3, rsrtl_reach(*((tl->next)))))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#rsrtl_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) == F#rsrtl_reach(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, sll_reach(*((tl->next)))))), ==(old(_dryad_S2, sll(*((tl->next)))), old(_dryad_S3, sll(*((tl->next)))))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) ==> F#sll(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) == F#sll(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, sll_reach(*((tl->next)))))), ==(old(_dryad_S2, sll_reach(*((tl->next)))), old(_dryad_S3, sll_reach(*((tl->next)))))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) ==> F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) == F#sll_reach(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, sll_reach(*((tl->next)))))), ==(old(_dryad_S2, sll_max_key(*((tl->next)))), old(_dryad_S3, sll_max_key(*((tl->next)))))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) ==> F#sll_max_key(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) == F#sll_max_key(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, sll_reach(*((tl->next)))))), ==(old(_dryad_S2, sll_min_key(*((tl->next)))), old(_dryad_S3, sll_min_key(*((tl->next)))))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) ==> F#sll_min_key(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) == F#sll_min_key(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, srtl_reach(*((tl->next)))))), ==(old(_dryad_S2, srtl(*((tl->next)))), old(_dryad_S3, srtl(*((tl->next)))))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#srtl_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) ==> F#srtl(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) == F#srtl(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, srtl_reach(*((tl->next)))))), ==(old(_dryad_S2, srtl_reach(*((tl->next)))), old(_dryad_S3, srtl_reach(*((tl->next)))))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#srtl_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) ==> F#srtl_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) == F#srtl_reach(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node));
        // assume ==(old(_dryad_S2, sll_list_len_next(tl)), old(_dryad_S3, sll_list_len_next(tl))); 
        assume F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(L#tl, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(L#tl, ^s_node));
        // assume ==(old(_dryad_S2, rsrtl_reach(tl)), old(_dryad_S3, rsrtl_reach(tl))); 
        assume F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(L#tl, ^s_node)) == F#rsrtl_reach(SL#_dryad_S3, $phys_ptr_cast(L#tl, ^s_node));
        // assume ==(old(_dryad_S2, sll(tl)), old(_dryad_S3, sll(tl))); 
        assume F#sll(SL#_dryad_S2, $phys_ptr_cast(L#tl, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(L#tl, ^s_node));
        // assume ==(old(_dryad_S2, sll_reach(tl)), old(_dryad_S3, sll_reach(tl))); 
        assume F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(L#tl, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(L#tl, ^s_node));
        // assume ==(old(_dryad_S2, srtl_reach(tl)), old(_dryad_S3, srtl_reach(tl))); 
        assume F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(L#tl, ^s_node)) == F#srtl_reach(SL#_dryad_S3, $phys_ptr_cast(L#tl, ^s_node));
        // assume ==(old(_dryad_S2, sll_list_len_next(l)), old(_dryad_S3, sll_list_len_next(l))); 
        assume F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(P#l, ^s_node));
        // assume ==(old(_dryad_S2, rsrtl_reach(l)), old(_dryad_S3, rsrtl_reach(l))); 
        assume F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl_reach(SL#_dryad_S3, $phys_ptr_cast(P#l, ^s_node));
        // assume ==(old(_dryad_S2, sll(l)), old(_dryad_S3, sll(l))); 
        assume F#sll(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(P#l, ^s_node));
        // assume ==(old(_dryad_S2, sll_reach(l)), old(_dryad_S3, sll_reach(l))); 
        assume F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(P#l, ^s_node));
        // assume ==(old(_dryad_S2, srtl_reach(l)), old(_dryad_S3, srtl_reach(l))); 
        assume F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node)) == F#srtl_reach(SL#_dryad_S3, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, sll_reach(l)))), ==(old(_dryad_S2, sll_keys(l)), old(_dryad_S3, sll_keys(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_keys(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node)) == F#sll_keys(SL#_dryad_S3, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, sll_reach(l)))), ==(old(_dryad_S2, sll_list_len_next(l)), old(_dryad_S3, sll_list_len_next(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node)) == F#sll_list_len_next(SL#_dryad_S3, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, rsrtl_reach(l)))), ==(old(_dryad_S2, rsrtl(l)), old(_dryad_S3, rsrtl(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl(SL#_dryad_S3, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, rsrtl_reach(l)))), ==(old(_dryad_S2, rsrtl_reach(l)), old(_dryad_S3, rsrtl_reach(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl_reach(SL#_dryad_S3, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, sll_reach(l)))), ==(old(_dryad_S2, sll(l)), old(_dryad_S3, sll(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node)) == F#sll(SL#_dryad_S3, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, sll_reach(l)))), ==(old(_dryad_S2, sll_reach(l)), old(_dryad_S3, sll_reach(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node)) == F#sll_reach(SL#_dryad_S3, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, sll_reach(l)))), ==(old(_dryad_S2, sll_max_key(l)), old(_dryad_S3, sll_max_key(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_max_key(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node)) == F#sll_max_key(SL#_dryad_S3, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, sll_reach(l)))), ==(old(_dryad_S2, sll_min_key(l)), old(_dryad_S3, sll_min_key(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_min_key(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node)) == F#sll_min_key(SL#_dryad_S3, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, srtl_reach(l)))), ==(old(_dryad_S2, srtl(l)), old(_dryad_S3, srtl(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node)) == F#srtl(SL#_dryad_S3, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S2, srtl_reach(l)))), ==(old(_dryad_S2, srtl_reach(l)), old(_dryad_S3, srtl_reach(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl_reach(SL#_dryad_S2, $phys_ptr_cast(P#l, ^s_node)) == F#srtl_reach(SL#_dryad_S3, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(tl, l)), ==(*((l->key)), old(_dryad_S2, *((l->key))))); 
        assume !($phys_ptr_cast(L#tl, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) == $rd_inv(SL#_dryad_S2, s_node.key, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(tl, l)), @_vcc_ptr_eq_pure(*((l->next)), old(_dryad_S2, *((l->next))))); 
        assume !($phys_ptr_cast(L#tl, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S2, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node);
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(tl), ==(sll_keys(tl), @_vcc_intset_union(sll_keys(*((tl->next))), @_vcc_intset_singleton(*((tl->key)))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tl, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tl, ^s_node))));
        // assume ==>(&&(@_vcc_ptr_neq_null(tl), @_vcc_ptr_neq_null(*((tl->next)))), ==(rsrtl(tl), &&(&&(rsrtl(*((tl->next))), unchecked!(@_vcc_oset_in(tl, rsrtl_reach(*((tl->next)))))), >=(*((tl->key)), sll_max_key(*((tl->next))))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#tl, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#tl, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(tl), @_vcc_ptr_neq_null(*((tl->next)))), ==(sll_max_key(tl), @\int_max(*((tl->key)), sll_max_key(*((tl->next)))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#tl, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#tl, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(tl), @_vcc_ptr_neq_null(*((tl->next)))), ==(sll_min_key(tl), @\int_min(*((tl->key)), sll_min_key(*((tl->next)))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#tl, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#tl, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(tl), @_vcc_ptr_neq_null(*((tl->next)))), ==(srtl(tl), &&(&&(srtl(*((tl->next))), unchecked!(@_vcc_oset_in(tl, srtl_reach(*((tl->next)))))), <=(*((tl->key)), sll_min_key(*((tl->next))))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#tl, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#tl, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)));
        // _math \state _dryad_S4; 
        // _dryad_S4 := @_vcc_current_state(@state); 
        SL#_dryad_S4 := $current_state($s);
        // _math \state stmtexpr5#8; 
        // stmtexpr5#8 := _dryad_S4; 
        stmtexpr5#8 := SL#_dryad_S4;
        // assert @prim_writes_check((tl->next)); 
        assert $writable_prim($s, #wrTime$3^4.3, $dot($phys_ptr_cast(L#tl, ^s_node), s_node.next));
        // *(tl->next) := (struct s_node*)@null; 
        call $write_int(s_node.next, $phys_ptr_cast(L#tl, ^s_node), $ptr_to_int($phys_ptr_cast($null, ^s_node)));
        assume $full_stop_ext(#tok$3^18.3, $s);
        // _math \state _dryad_S5; 
        // _dryad_S5 := @_vcc_current_state(@state); 
        SL#_dryad_S5 := $current_state($s);
        // _math \state stmtexpr6#9; 
        // stmtexpr6#9 := _dryad_S5; 
        stmtexpr6#9 := SL#_dryad_S5;
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S4, sll_reach(l)))), ==(old(_dryad_S4, sll_keys(l)), old(_dryad_S5, sll_keys(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_keys(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node)) == F#sll_keys(SL#_dryad_S5, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S4, sll_reach(l)))), ==(old(_dryad_S4, sll_list_len_next(l)), old(_dryad_S5, sll_list_len_next(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node)) == F#sll_list_len_next(SL#_dryad_S5, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S4, rsrtl_reach(l)))), ==(old(_dryad_S4, rsrtl(l)), old(_dryad_S5, rsrtl(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#rsrtl_reach(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl(SL#_dryad_S5, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S4, rsrtl_reach(l)))), ==(old(_dryad_S4, rsrtl_reach(l)), old(_dryad_S5, rsrtl_reach(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#rsrtl_reach(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl_reach(SL#_dryad_S5, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S4, sll_reach(l)))), ==(old(_dryad_S4, sll(l)), old(_dryad_S5, sll(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node)) == F#sll(SL#_dryad_S5, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S4, sll_reach(l)))), ==(old(_dryad_S4, sll_reach(l)), old(_dryad_S5, sll_reach(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node)) == F#sll_reach(SL#_dryad_S5, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S4, sll_reach(l)))), ==(old(_dryad_S4, sll_max_key(l)), old(_dryad_S5, sll_max_key(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_max_key(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node)) == F#sll_max_key(SL#_dryad_S5, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S4, sll_reach(l)))), ==(old(_dryad_S4, sll_min_key(l)), old(_dryad_S5, sll_min_key(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_min_key(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node)) == F#sll_min_key(SL#_dryad_S5, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S4, srtl_reach(l)))), ==(old(_dryad_S4, srtl(l)), old(_dryad_S5, srtl(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#srtl_reach(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node)) == F#srtl(SL#_dryad_S5, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(tl, old(_dryad_S4, srtl_reach(l)))), ==(old(_dryad_S4, srtl_reach(l)), old(_dryad_S5, srtl_reach(l)))); 
        assume !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#srtl_reach(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl_reach(SL#_dryad_S4, $phys_ptr_cast(P#l, ^s_node)) == F#srtl_reach(SL#_dryad_S5, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(tl, l)), ==(*((l->key)), old(_dryad_S4, *((l->key))))); 
        assume !($phys_ptr_cast(L#tl, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) == $rd_inv(SL#_dryad_S4, s_node.key, $phys_ptr_cast(P#l, ^s_node));
        // assume ==>(!(@_vcc_ptr_eq_pure(tl, l)), @_vcc_ptr_eq_pure(*((l->next)), old(_dryad_S4, *((l->next))))); 
        assume !($phys_ptr_cast(L#tl, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S4, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node);
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(tl), ==(sll_keys(tl), @_vcc_intset_union(sll_keys(*((tl->next))), @_vcc_intset_singleton(*((tl->key)))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#tl, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#tl, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(tl), ==(sll_list_len_next(tl), unchecked+(sll_list_len_next(*((tl->next))), 1))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#tl, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(tl), @_vcc_ptr_neq_null(*((tl->next)))), ==(rsrtl(tl), &&(&&(rsrtl(*((tl->next))), unchecked!(@_vcc_oset_in(tl, rsrtl_reach(*((tl->next)))))), >=(*((tl->key)), sll_max_key(*((tl->next))))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#tl, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#tl, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(tl), ==(rsrtl_reach(tl), @_vcc_oset_union(rsrtl_reach(*((tl->next))), @_vcc_oset_singleton(tl)))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#tl, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tl, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(tl), ==(sll(tl), &&(sll(*((tl->next))), unchecked!(@_vcc_oset_in(tl, sll_reach(*((tl->next)))))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#tl, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(tl), ==(sll_reach(tl), @_vcc_oset_union(sll_reach(*((tl->next))), @_vcc_oset_singleton(tl)))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#tl, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tl, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(tl), @_vcc_ptr_neq_null(*((tl->next)))), ==(sll_max_key(tl), @\int_max(*((tl->key)), sll_max_key(*((tl->next)))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#tl, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#tl, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(tl), @_vcc_ptr_neq_null(*((tl->next)))), ==(sll_min_key(tl), @\int_min(*((tl->key)), sll_min_key(*((tl->next)))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#tl, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#tl, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(tl), @_vcc_ptr_neq_null(*((tl->next)))), ==(srtl(tl), &&(&&(srtl(*((tl->next))), unchecked!(@_vcc_oset_in(tl, srtl_reach(*((tl->next)))))), <=(*((tl->key)), sll_min_key(*((tl->next))))))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#tl, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#tl, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#tl, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(tl), ==(srtl_reach(tl), @_vcc_oset_union(srtl_reach(*((tl->next))), @_vcc_oset_singleton(tl)))); 
        assume $non_null($phys_ptr_cast(L#tl, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#tl, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#tl, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#tl, ^s_node)));
        // return tl; 
        $result := $phys_ptr_cast(L#tl, ^s_node);
        assume true;
        assert $position_marker();
        goto #exit;
    }
    else
    {
      anon11:
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
        // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
        assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
        // assert @reads_check_normal((l->key)); 
        assert $thread_local($s, $phys_ptr_cast(P#l, ^s_node));
        assume true;
        // if (<=(k, *((l->key)))) ...
        if (P#k <= $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)))
        {
          anon2:
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // struct s_node* hd; 
            // _math \state _dryad_S0#0; 
            // _dryad_S0#0 := @_vcc_current_state(@state); 
            _dryad_S0#0 := $current_state($s);
            // _math \state stmtexpr0#10; 
            // stmtexpr0#10 := _dryad_S0#0; 
            stmtexpr0#10 := _dryad_S0#0;
            // hd := _vcc_alloc(@_vcc_typeof((struct s_node*)@null)); 
            call L#hd := $alloc(^s_node);
            assume $full_stop_ext(#tok$3^24.16, $s);
            // assume !(@_vcc_oset_in(hd, @_vcc_oset_union(_dryad_G0, _dryad_G1))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), $oset_union(SL#_dryad_G0, SL#_dryad_G1));
            // _dryad_G1 := @_vcc_oset_union(_dryad_G0, @_vcc_oset_singleton(hd)); 
            SL#_dryad_G1 := $oset_union(SL#_dryad_G0, $oset_singleton($phys_ptr_cast(L#hd, ^s_node)));
            // _math \oset stmtexpr1#11; 
            // stmtexpr1#11 := _dryad_G1; 
            stmtexpr1#11 := SL#_dryad_G1;
            // assume ==(glob_reach(), _dryad_G1); 
            assume F#glob_reach() == SL#_dryad_G1;
            // _math \state _dryad_S1#1; 
            // _dryad_S1#1 := @_vcc_current_state(@state); 
            _dryad_S1#1 := $current_state($s);
            // _math \state stmtexpr2#12; 
            // stmtexpr2#12 := _dryad_S1#1; 
            stmtexpr2#12 := _dryad_S1#1;
            // assume ==>(@_vcc_ptr_neq_null(hd), ==(sll_keys(hd), @_vcc_intset_union(sll_keys(*((hd->next))), @_vcc_intset_singleton(*((hd->key)))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#hd, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#hd, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(hd), ==(sll_list_len_next(hd), unchecked+(sll_list_len_next(*((hd->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#hd, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(hd), @_vcc_ptr_neq_null(*((hd->next)))), ==(rsrtl(hd), &&(&&(rsrtl(*((hd->next))), unchecked!(@_vcc_oset_in(hd, rsrtl_reach(*((hd->next)))))), >=(*((hd->key)), sll_max_key(*((hd->next))))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#hd, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#hd, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(hd), ==(rsrtl_reach(hd), @_vcc_oset_union(rsrtl_reach(*((hd->next))), @_vcc_oset_singleton(hd)))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#hd, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#hd, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(hd), ==(sll(hd), &&(sll(*((hd->next))), unchecked!(@_vcc_oset_in(hd, sll_reach(*((hd->next)))))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#hd, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(hd), ==(sll_reach(hd), @_vcc_oset_union(sll_reach(*((hd->next))), @_vcc_oset_singleton(hd)))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#hd, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#hd, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(hd), @_vcc_ptr_neq_null(*((hd->next)))), ==(sll_max_key(hd), @\int_max(*((hd->key)), sll_max_key(*((hd->next)))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#hd, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#hd, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(hd), @_vcc_ptr_neq_null(*((hd->next)))), ==(sll_min_key(hd), @\int_min(*((hd->key)), sll_min_key(*((hd->next)))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#hd, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#hd, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(hd), @_vcc_ptr_neq_null(*((hd->next)))), ==(srtl(hd), &&(&&(srtl(*((hd->next))), unchecked!(@_vcc_oset_in(hd, srtl_reach(*((hd->next)))))), <=(*((hd->key)), sll_min_key(*((hd->next))))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#hd, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#hd, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(hd), ==(srtl_reach(hd), @_vcc_oset_union(srtl_reach(*((hd->next))), @_vcc_oset_singleton(hd)))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#hd, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#hd, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S0#0, sll_reach(l)))), ==(old(_dryad_S0#0, sll_keys(l)), old(_dryad_S1#1, sll_keys(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_keys(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node)) == F#sll_keys(_dryad_S1#1, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S0#0, sll_reach(l)))), ==(old(_dryad_S0#0, sll_list_len_next(l)), old(_dryad_S1#1, sll_list_len_next(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_list_len_next(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node)) == F#sll_list_len_next(_dryad_S1#1, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S0#0, rsrtl_reach(l)))), ==(old(_dryad_S0#0, rsrtl(l)), old(_dryad_S1#1, rsrtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#rsrtl_reach(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl(_dryad_S1#1, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S0#0, rsrtl_reach(l)))), ==(old(_dryad_S0#0, rsrtl_reach(l)), old(_dryad_S1#1, rsrtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#rsrtl_reach(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl_reach(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl_reach(_dryad_S1#1, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S0#0, sll_reach(l)))), ==(old(_dryad_S0#0, sll(l)), old(_dryad_S1#1, sll(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node)) == F#sll(_dryad_S1#1, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S0#0, sll_reach(l)))), ==(old(_dryad_S0#0, sll_reach(l)), old(_dryad_S1#1, sll_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_reach(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node)) == F#sll_reach(_dryad_S1#1, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S0#0, sll_reach(l)))), ==(old(_dryad_S0#0, sll_max_key(l)), old(_dryad_S1#1, sll_max_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_max_key(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node)) == F#sll_max_key(_dryad_S1#1, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S0#0, sll_reach(l)))), ==(old(_dryad_S0#0, sll_min_key(l)), old(_dryad_S1#1, sll_min_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_min_key(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node)) == F#sll_min_key(_dryad_S1#1, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S0#0, srtl_reach(l)))), ==(old(_dryad_S0#0, srtl(l)), old(_dryad_S1#1, srtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#srtl_reach(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node)) == F#srtl(_dryad_S1#1, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S0#0, srtl_reach(l)))), ==(old(_dryad_S0#0, srtl_reach(l)), old(_dryad_S1#1, srtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#srtl_reach(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl_reach(_dryad_S0#0, $phys_ptr_cast(P#l, ^s_node)) == F#srtl_reach(_dryad_S1#1, $phys_ptr_cast(P#l, ^s_node));
            // assume @_vcc_ptr_neq_null(hd); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node));
            // _math \state _dryad_S2#2; 
            // _dryad_S2#2 := @_vcc_current_state(@state); 
            _dryad_S2#2 := $current_state($s);
            // _math \state stmtexpr3#13; 
            // stmtexpr3#13 := _dryad_S2#2; 
            stmtexpr3#13 := _dryad_S2#2;
            // assert @prim_writes_check((hd->key)); 
            assert $writable_prim($s, #wrTime$3^4.3, $dot($phys_ptr_cast(L#hd, ^s_node), s_node.key));
            // *(hd->key) := k; 
            call $write_int(s_node.key, $phys_ptr_cast(L#hd, ^s_node), P#k);
            assume $full_stop_ext(#tok$3^27.4, $s);
            // _math \state _dryad_S3#3; 
            // _dryad_S3#3 := @_vcc_current_state(@state); 
            _dryad_S3#3 := $current_state($s);
            // _math \state stmtexpr4#14; 
            // stmtexpr4#14 := _dryad_S3#3; 
            stmtexpr4#14 := _dryad_S3#3;
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, sll_reach(*((hd->next)))))), ==(old(_dryad_S2#2, sll_keys(*((hd->next)))), old(_dryad_S3#3, sll_keys(*((hd->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) ==> F#sll_keys(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) == F#sll_keys(_dryad_S3#3, $rd_phys_ptr(_dryad_S3#3, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, sll_reach(*((hd->next)))))), ==(old(_dryad_S2#2, sll_list_len_next(*((hd->next)))), old(_dryad_S3#3, sll_list_len_next(*((hd->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) ==> F#sll_list_len_next(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) == F#sll_list_len_next(_dryad_S3#3, $rd_phys_ptr(_dryad_S3#3, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, rsrtl_reach(*((hd->next)))))), ==(old(_dryad_S2#2, rsrtl(*((hd->next)))), old(_dryad_S3#3, rsrtl(*((hd->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#rsrtl_reach(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) ==> F#rsrtl(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) == F#rsrtl(_dryad_S3#3, $rd_phys_ptr(_dryad_S3#3, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, rsrtl_reach(*((hd->next)))))), ==(old(_dryad_S2#2, rsrtl_reach(*((hd->next)))), old(_dryad_S3#3, rsrtl_reach(*((hd->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#rsrtl_reach(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) ==> F#rsrtl_reach(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) == F#rsrtl_reach(_dryad_S3#3, $rd_phys_ptr(_dryad_S3#3, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, sll_reach(*((hd->next)))))), ==(old(_dryad_S2#2, sll(*((hd->next)))), old(_dryad_S3#3, sll(*((hd->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) ==> F#sll(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) == F#sll(_dryad_S3#3, $rd_phys_ptr(_dryad_S3#3, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, sll_reach(*((hd->next)))))), ==(old(_dryad_S2#2, sll_reach(*((hd->next)))), old(_dryad_S3#3, sll_reach(*((hd->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) ==> F#sll_reach(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) == F#sll_reach(_dryad_S3#3, $rd_phys_ptr(_dryad_S3#3, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, sll_reach(*((hd->next)))))), ==(old(_dryad_S2#2, sll_max_key(*((hd->next)))), old(_dryad_S3#3, sll_max_key(*((hd->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) ==> F#sll_max_key(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) == F#sll_max_key(_dryad_S3#3, $rd_phys_ptr(_dryad_S3#3, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, sll_reach(*((hd->next)))))), ==(old(_dryad_S2#2, sll_min_key(*((hd->next)))), old(_dryad_S3#3, sll_min_key(*((hd->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) ==> F#sll_min_key(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) == F#sll_min_key(_dryad_S3#3, $rd_phys_ptr(_dryad_S3#3, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, srtl_reach(*((hd->next)))))), ==(old(_dryad_S2#2, srtl(*((hd->next)))), old(_dryad_S3#3, srtl(*((hd->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#srtl_reach(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) ==> F#srtl(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) == F#srtl(_dryad_S3#3, $rd_phys_ptr(_dryad_S3#3, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, srtl_reach(*((hd->next)))))), ==(old(_dryad_S2#2, srtl_reach(*((hd->next)))), old(_dryad_S3#3, srtl_reach(*((hd->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#srtl_reach(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) ==> F#srtl_reach(_dryad_S2#2, $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) == F#srtl_reach(_dryad_S3#3, $rd_phys_ptr(_dryad_S3#3, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node));
            // assume ==(old(_dryad_S2#2, sll_list_len_next(hd)), old(_dryad_S3#3, sll_list_len_next(hd))); 
            assume F#sll_list_len_next(_dryad_S2#2, $phys_ptr_cast(L#hd, ^s_node)) == F#sll_list_len_next(_dryad_S3#3, $phys_ptr_cast(L#hd, ^s_node));
            // assume ==(old(_dryad_S2#2, rsrtl_reach(hd)), old(_dryad_S3#3, rsrtl_reach(hd))); 
            assume F#rsrtl_reach(_dryad_S2#2, $phys_ptr_cast(L#hd, ^s_node)) == F#rsrtl_reach(_dryad_S3#3, $phys_ptr_cast(L#hd, ^s_node));
            // assume ==(old(_dryad_S2#2, sll(hd)), old(_dryad_S3#3, sll(hd))); 
            assume F#sll(_dryad_S2#2, $phys_ptr_cast(L#hd, ^s_node)) == F#sll(_dryad_S3#3, $phys_ptr_cast(L#hd, ^s_node));
            // assume ==(old(_dryad_S2#2, sll_reach(hd)), old(_dryad_S3#3, sll_reach(hd))); 
            assume F#sll_reach(_dryad_S2#2, $phys_ptr_cast(L#hd, ^s_node)) == F#sll_reach(_dryad_S3#3, $phys_ptr_cast(L#hd, ^s_node));
            // assume ==(old(_dryad_S2#2, srtl_reach(hd)), old(_dryad_S3#3, srtl_reach(hd))); 
            assume F#srtl_reach(_dryad_S2#2, $phys_ptr_cast(L#hd, ^s_node)) == F#srtl_reach(_dryad_S3#3, $phys_ptr_cast(L#hd, ^s_node));
            // assume ==(old(_dryad_S2#2, sll_list_len_next(l)), old(_dryad_S3#3, sll_list_len_next(l))); 
            assume F#sll_list_len_next(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node)) == F#sll_list_len_next(_dryad_S3#3, $phys_ptr_cast(P#l, ^s_node));
            // assume ==(old(_dryad_S2#2, rsrtl_reach(l)), old(_dryad_S3#3, rsrtl_reach(l))); 
            assume F#rsrtl_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl_reach(_dryad_S3#3, $phys_ptr_cast(P#l, ^s_node));
            // assume ==(old(_dryad_S2#2, sll(l)), old(_dryad_S3#3, sll(l))); 
            assume F#sll(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node)) == F#sll(_dryad_S3#3, $phys_ptr_cast(P#l, ^s_node));
            // assume ==(old(_dryad_S2#2, sll_reach(l)), old(_dryad_S3#3, sll_reach(l))); 
            assume F#sll_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node)) == F#sll_reach(_dryad_S3#3, $phys_ptr_cast(P#l, ^s_node));
            // assume ==(old(_dryad_S2#2, srtl_reach(l)), old(_dryad_S3#3, srtl_reach(l))); 
            assume F#srtl_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node)) == F#srtl_reach(_dryad_S3#3, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, sll_reach(l)))), ==(old(_dryad_S2#2, sll_keys(l)), old(_dryad_S3#3, sll_keys(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_keys(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node)) == F#sll_keys(_dryad_S3#3, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, sll_reach(l)))), ==(old(_dryad_S2#2, sll_list_len_next(l)), old(_dryad_S3#3, sll_list_len_next(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_list_len_next(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node)) == F#sll_list_len_next(_dryad_S3#3, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, rsrtl_reach(l)))), ==(old(_dryad_S2#2, rsrtl(l)), old(_dryad_S3#3, rsrtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#rsrtl_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl(_dryad_S3#3, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, rsrtl_reach(l)))), ==(old(_dryad_S2#2, rsrtl_reach(l)), old(_dryad_S3#3, rsrtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#rsrtl_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl_reach(_dryad_S3#3, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, sll_reach(l)))), ==(old(_dryad_S2#2, sll(l)), old(_dryad_S3#3, sll(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node)) == F#sll(_dryad_S3#3, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, sll_reach(l)))), ==(old(_dryad_S2#2, sll_reach(l)), old(_dryad_S3#3, sll_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node)) == F#sll_reach(_dryad_S3#3, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, sll_reach(l)))), ==(old(_dryad_S2#2, sll_max_key(l)), old(_dryad_S3#3, sll_max_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_max_key(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node)) == F#sll_max_key(_dryad_S3#3, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, sll_reach(l)))), ==(old(_dryad_S2#2, sll_min_key(l)), old(_dryad_S3#3, sll_min_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_min_key(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node)) == F#sll_min_key(_dryad_S3#3, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, srtl_reach(l)))), ==(old(_dryad_S2#2, srtl(l)), old(_dryad_S3#3, srtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#srtl_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node)) == F#srtl(_dryad_S3#3, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S2#2, srtl_reach(l)))), ==(old(_dryad_S2#2, srtl_reach(l)), old(_dryad_S3#3, srtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#srtl_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl_reach(_dryad_S2#2, $phys_ptr_cast(P#l, ^s_node)) == F#srtl_reach(_dryad_S3#3, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(hd, l)), ==(*((l->key)), old(_dryad_S2#2, *((l->key))))); 
            assume !($phys_ptr_cast(L#hd, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) == $rd_inv(_dryad_S2#2, s_node.key, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(hd, l)), @_vcc_ptr_eq_pure(*((l->next)), old(_dryad_S2#2, *((l->next))))); 
            assume !($phys_ptr_cast(L#hd, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) == $rd_phys_ptr(_dryad_S2#2, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(hd), ==(sll_keys(hd), @_vcc_intset_union(sll_keys(*((hd->next))), @_vcc_intset_singleton(*((hd->key)))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#hd, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#hd, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(hd), @_vcc_ptr_neq_null(*((hd->next)))), ==(rsrtl(hd), &&(&&(rsrtl(*((hd->next))), unchecked!(@_vcc_oset_in(hd, rsrtl_reach(*((hd->next)))))), >=(*((hd->key)), sll_max_key(*((hd->next))))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#hd, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#hd, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(hd), @_vcc_ptr_neq_null(*((hd->next)))), ==(sll_max_key(hd), @\int_max(*((hd->key)), sll_max_key(*((hd->next)))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#hd, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#hd, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(hd), @_vcc_ptr_neq_null(*((hd->next)))), ==(sll_min_key(hd), @\int_min(*((hd->key)), sll_min_key(*((hd->next)))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#hd, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#hd, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(hd), @_vcc_ptr_neq_null(*((hd->next)))), ==(srtl(hd), &&(&&(srtl(*((hd->next))), unchecked!(@_vcc_oset_in(hd, srtl_reach(*((hd->next)))))), <=(*((hd->key)), sll_min_key(*((hd->next))))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#hd, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#hd, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)));
            // _math \state _dryad_S4#4; 
            // _dryad_S4#4 := @_vcc_current_state(@state); 
            _dryad_S4#4 := $current_state($s);
            // _math \state stmtexpr5#15; 
            // stmtexpr5#15 := _dryad_S4#4; 
            stmtexpr5#15 := _dryad_S4#4;
            // assert @prim_writes_check((hd->next)); 
            assert $writable_prim($s, #wrTime$3^4.3, $dot($phys_ptr_cast(L#hd, ^s_node), s_node.next));
            // *(hd->next) := l; 
            call $write_int(s_node.next, $phys_ptr_cast(L#hd, ^s_node), $ptr_to_int($phys_ptr_cast(P#l, ^s_node)));
            assume $full_stop_ext(#tok$3^28.4, $s);
            // _math \state _dryad_S5#5; 
            // _dryad_S5#5 := @_vcc_current_state(@state); 
            _dryad_S5#5 := $current_state($s);
            // _math \state stmtexpr6#16; 
            // stmtexpr6#16 := _dryad_S5#5; 
            stmtexpr6#16 := _dryad_S5#5;
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S4#4, sll_reach(l)))), ==(old(_dryad_S4#4, sll_keys(l)), old(_dryad_S5#5, sll_keys(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_keys(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node)) == F#sll_keys(_dryad_S5#5, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S4#4, sll_reach(l)))), ==(old(_dryad_S4#4, sll_list_len_next(l)), old(_dryad_S5#5, sll_list_len_next(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_list_len_next(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node)) == F#sll_list_len_next(_dryad_S5#5, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S4#4, rsrtl_reach(l)))), ==(old(_dryad_S4#4, rsrtl(l)), old(_dryad_S5#5, rsrtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#rsrtl_reach(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl(_dryad_S5#5, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S4#4, rsrtl_reach(l)))), ==(old(_dryad_S4#4, rsrtl_reach(l)), old(_dryad_S5#5, rsrtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#rsrtl_reach(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl_reach(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl_reach(_dryad_S5#5, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S4#4, sll_reach(l)))), ==(old(_dryad_S4#4, sll(l)), old(_dryad_S5#5, sll(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node)) == F#sll(_dryad_S5#5, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S4#4, sll_reach(l)))), ==(old(_dryad_S4#4, sll_reach(l)), old(_dryad_S5#5, sll_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_reach(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node)) == F#sll_reach(_dryad_S5#5, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S4#4, sll_reach(l)))), ==(old(_dryad_S4#4, sll_max_key(l)), old(_dryad_S5#5, sll_max_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_max_key(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node)) == F#sll_max_key(_dryad_S5#5, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S4#4, sll_reach(l)))), ==(old(_dryad_S4#4, sll_min_key(l)), old(_dryad_S5#5, sll_min_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_min_key(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node)) == F#sll_min_key(_dryad_S5#5, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S4#4, srtl_reach(l)))), ==(old(_dryad_S4#4, srtl(l)), old(_dryad_S5#5, srtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#srtl_reach(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node)) == F#srtl(_dryad_S5#5, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(hd, old(_dryad_S4#4, srtl_reach(l)))), ==(old(_dryad_S4#4, srtl_reach(l)), old(_dryad_S5#5, srtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#srtl_reach(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl_reach(_dryad_S4#4, $phys_ptr_cast(P#l, ^s_node)) == F#srtl_reach(_dryad_S5#5, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(hd, l)), ==(*((l->key)), old(_dryad_S4#4, *((l->key))))); 
            assume !($phys_ptr_cast(L#hd, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) == $rd_inv(_dryad_S4#4, s_node.key, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(hd, l)), @_vcc_ptr_eq_pure(*((l->next)), old(_dryad_S4#4, *((l->next))))); 
            assume !($phys_ptr_cast(L#hd, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) == $rd_phys_ptr(_dryad_S4#4, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(hd), ==(sll_keys(hd), @_vcc_intset_union(sll_keys(*((hd->next))), @_vcc_intset_singleton(*((hd->key)))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#hd, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#hd, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(hd), ==(sll_list_len_next(hd), unchecked+(sll_list_len_next(*((hd->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#hd, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(hd), @_vcc_ptr_neq_null(*((hd->next)))), ==(rsrtl(hd), &&(&&(rsrtl(*((hd->next))), unchecked!(@_vcc_oset_in(hd, rsrtl_reach(*((hd->next)))))), >=(*((hd->key)), sll_max_key(*((hd->next))))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#hd, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#hd, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(hd), ==(rsrtl_reach(hd), @_vcc_oset_union(rsrtl_reach(*((hd->next))), @_vcc_oset_singleton(hd)))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#hd, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#hd, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(hd), ==(sll(hd), &&(sll(*((hd->next))), unchecked!(@_vcc_oset_in(hd, sll_reach(*((hd->next)))))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#hd, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(hd), ==(sll_reach(hd), @_vcc_oset_union(sll_reach(*((hd->next))), @_vcc_oset_singleton(hd)))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#hd, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#hd, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(hd), @_vcc_ptr_neq_null(*((hd->next)))), ==(sll_max_key(hd), @\int_max(*((hd->key)), sll_max_key(*((hd->next)))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#hd, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#hd, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(hd), @_vcc_ptr_neq_null(*((hd->next)))), ==(sll_min_key(hd), @\int_min(*((hd->key)), sll_min_key(*((hd->next)))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#hd, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#hd, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(hd), @_vcc_ptr_neq_null(*((hd->next)))), ==(srtl(hd), &&(&&(srtl(*((hd->next))), unchecked!(@_vcc_oset_in(hd, srtl_reach(*((hd->next)))))), <=(*((hd->key)), sll_min_key(*((hd->next))))))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#hd, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#hd, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#hd, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(hd), ==(srtl_reach(hd), @_vcc_oset_union(srtl_reach(*((hd->next))), @_vcc_oset_singleton(hd)))); 
            assume $non_null($phys_ptr_cast(L#hd, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#hd, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#hd, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#hd, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // return hd; 
            $result := $phys_ptr_cast(L#hd, ^s_node);
            assume true;
            assert $position_marker();
            goto #exit;
        }
        else
        {
          anon9:
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // struct s_node* curr; 
            // struct s_node* next; 
            // struct s_node* prev; 
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), &&(==(@_vcc_mutable(@state, l), @_vcc_mutable(@state, *((l->next)))), ==(@writes_check(l), @writes_check(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> $mutable($s, $phys_ptr_cast(P#l, ^s_node)) == $mutable($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && $top_writable($s, #wrTime$3^4.3, $phys_ptr_cast(P#l, ^s_node)) == $top_writable($s, #wrTime$3^4.3, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node));
            // prev := l; 
            L#prev := $phys_ptr_cast(P#l, ^s_node);
            // assert sll_lseg(prev, prev); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume sll_lseg(prev, prev); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assert srtl_lseg(prev, prev); 
            assert F#srtl_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume srtl_lseg(prev, prev); 
            assume F#srtl_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assert sll_lseg(next, next); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#next, ^s_node), $phys_ptr_cast(L#next, ^s_node));
            // assume sll_lseg(next, next); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#next, ^s_node), $phys_ptr_cast(L#next, ^s_node));
            // assert srtl_lseg(next, next); 
            assert F#srtl_lseg($s, $phys_ptr_cast(L#next, ^s_node), $phys_ptr_cast(L#next, ^s_node));
            // assume srtl_lseg(next, next); 
            assume F#srtl_lseg($s, $phys_ptr_cast(L#next, ^s_node), $phys_ptr_cast(L#next, ^s_node));
            // assert sll_lseg(curr, curr); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume sll_lseg(curr, curr); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assert srtl_lseg(curr, curr); 
            assert F#srtl_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assume srtl_lseg(curr, curr); 
            assume F#srtl_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
            // assert sll_lseg(l, l); 
            assert F#sll_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(P#l, ^s_node));
            // assume sll_lseg(l, l); 
            assume F#sll_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(P#l, ^s_node));
            // assert srtl_lseg(l, l); 
            assert F#srtl_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(P#l, ^s_node));
            // assume srtl_lseg(l, l); 
            assume F#srtl_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(P#l, ^s_node));
            // struct s_node* l0; 
            // l0 := l; 
            SL#l0 := $phys_ptr_cast(P#l, ^s_node);
            // struct s_node* stmtexpr0#18; 
            // stmtexpr0#18 := l0; 
            stmtexpr0#18 := $phys_ptr_cast(SL#l0, ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assert @reads_check_normal((l->next)); 
            assert $thread_local($s, $phys_ptr_cast(P#l, ^s_node));
            // next := *((l->next)); 
            L#next := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_keys(next), @_vcc_intset_union(sll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_list_len_next(next), unchecked+(sll_list_len_next(*((next->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(rsrtl(next), &&(&&(rsrtl(*((next->next))), unchecked!(@_vcc_oset_in(next, rsrtl_reach(*((next->next)))))), >=(*((next->key)), sll_max_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(rsrtl_reach(next), @_vcc_oset_union(rsrtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll(next), &&(sll(*((next->next))), unchecked!(@_vcc_oset_in(next, sll_reach(*((next->next)))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_reach(next), @_vcc_oset_union(sll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_max_key(next), @\int_max(*((next->key)), sll_max_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_min_key(next), @\int_min(*((next->key)), sll_min_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(srtl(next), &&(&&(srtl(*((next->next))), unchecked!(@_vcc_oset_in(next, srtl_reach(*((next->next)))))), <=(*((next->key)), sll_min_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(srtl_reach(next), @_vcc_oset_union(srtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            loopState#0 := $s;
            assume true;
p0000 := (F#srtl($s,$phys_ptr_cast(P#l,^s_node)));
p0001 := (F#srtl($s,$phys_ptr_cast(L#prev,^s_node)));
p0002 := (F#srtl($s,$phys_ptr_cast(L#next,^s_node)));
p0003 := (F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)));
p0004 := (F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)));
p0005 := (F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)));
p0006 := (F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)));
p0007 := (F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)));
p0008 := (F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)));
p0009 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0010 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0011 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0012 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0013 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0014 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0015 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0016 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0017 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0018 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0019 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0020 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0021 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0022 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0023 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0024 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0025 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0026 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0027 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0028 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0029 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0030 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0031 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0032 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0033 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#l,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node))));
p0034 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#l,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0035 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node))));
p0036 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node))));
p0037 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#next,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0038 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#next,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node))));
p0039 := ($non_null($phys_ptr_cast(P#l,^s_node)));
p0040 := ($non_null($phys_ptr_cast(L#prev,^s_node)));
p0041 := ($non_null($phys_ptr_cast(L#next,^s_node)));
p0042 := ($is_null($phys_ptr_cast(P#l,^s_node)));
p0043 := ($is_null($phys_ptr_cast(L#prev,^s_node)));
p0044 := ($is_null($phys_ptr_cast(L#next,^s_node)));
p0045 := (($phys_ptr_cast(P#l,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
p0046 := (($phys_ptr_cast(P#l,^s_node) == $phys_ptr_cast(L#next,^s_node)));
p0047 := (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(P#l,^s_node)));
p0048 := (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(L#next,^s_node)));
p0049 := (($phys_ptr_cast(L#next,^s_node) == $phys_ptr_cast(P#l,^s_node)));
p0050 := (($phys_ptr_cast(L#next,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
p0051 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node))));
p0052 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node))));
p0053 := (($non_null($phys_ptr_cast(L#next,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#next,^s_node),^s_node))));
p0054 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node))));
p0055 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node))));
p0056 := (($non_null($phys_ptr_cast(L#next,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#next,^s_node),^s_node))));
p0057 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));
p0058 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node) == $phys_ptr_cast(L#next,^s_node))));
p0059 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(P#l,^s_node))));
p0060 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(L#next,^s_node))));
p0061 := (($non_null($phys_ptr_cast(L#next,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#next,^s_node),^s_node) == $phys_ptr_cast(P#l,^s_node))));
p0062 := (($non_null($phys_ptr_cast(L#next,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#next,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));
p0063 := ((!($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))))));
p0064 := ((!($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
p0065 := ((!($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))))));
p0066 := ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node))))));
p0067 := ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node))))));
p0068 := ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node))))));
p0069 := ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node))))));
p0070 := ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node))))));
p0071 := ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node))))));
p0072 := ($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))));
p0073 := ($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))));
p0074 := ($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))));
p0075 := ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0076 := ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node))));
p0077 := ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node))));
p0078 := ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node))));
p0079 := ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node))));
p0080 := ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0081 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))));
p0082 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))));
p0083 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))));
p0084 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))));
p0085 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))));
p0086 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))));
p0087 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node))));
p0088 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0089 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node))));
p0090 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node))));
p0091 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0092 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node))));
p0093 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0094 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0095 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0096 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0097 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0098 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0099 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0100 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0101 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0102 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0103 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0104 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0105 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0106 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0107 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0108 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0109 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0110 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0111 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0112 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0113 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0114 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0115 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0116 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0117 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0118 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0119 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0120 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0121 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0122 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0123 := ((P#k < 2147483647));
p0124 := ((P#k < 2147483647));
p0125 := ((P#k < 2147483647));
p0126 := ((P#k < 4294967295));
p0127 := ((P#k < 4294967295));
p0128 := ((P#k < 4294967295));
p0129 := ((P#k >= 0));
p0130 := ((P#k >= 0));
p0131 := ((P#k >= 0));
p0132 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) < P#k)));
p0133 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) < P#k)));
p0134 := (($non_null($phys_ptr_cast(L#next,^s_node)) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) < P#k)));
p0135 := ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0136 := ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0137 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0138 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0139 := ((($non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0140 := ((($non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0141 := ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0142 := ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0143 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0144 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0145 := ((($non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0146 := ((($non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0147 := (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#l,^s_node)) <= P#k)));
p0148 := (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#prev,^s_node)) <= P#k)));
p0149 := (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#next,^s_node)) <= P#k)));
p0150 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= P#k)));
p0151 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) <= P#k)));
p0152 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) <= P#k)));
p0153 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) <= P#k)));
p0154 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) <= P#k)));
p0155 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= P#k)));
p0156 := (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (P#k <= F#sll_min_key($s,$phys_ptr_cast(P#l,^s_node)))));
p0157 := (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (P#k <= F#sll_min_key($s,$phys_ptr_cast(L#prev,^s_node)))));
p0158 := (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (P#k <= F#sll_min_key($s,$phys_ptr_cast(L#next,^s_node)))));
p0159 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0160 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)))));
p0161 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)))));
p0162 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)))));
p0163 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)))));
p0164 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0165 := (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0166 := (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0167 := (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0168 := (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0169 := (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0170 := (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0171 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0172 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0173 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0174 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0175 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0176 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0177 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0178 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0179 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0180 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0181 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0182 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0183 := (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#l,^s_node)))));
p0184 := (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#l,^s_node)))));
p0185 := (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#prev,^s_node)))));
p0186 := (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#prev,^s_node)))));
p0187 := (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#next,^s_node)))));
p0188 := (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#next,^s_node)))));
p0189 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0190 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)))));
p0191 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)))));
p0192 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)))));
p0193 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)))));
p0194 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0195 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0196 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)))));
p0197 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)))));
p0198 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)))));
p0199 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)))));
p0200 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)))));

            while (true)

invariant (p0000 == (F#srtl($s,$phys_ptr_cast(P#l,^s_node))));
invariant (p0001 == (F#srtl($s,$phys_ptr_cast(L#prev,^s_node))));
invariant (p0002 == (F#srtl($s,$phys_ptr_cast(L#next,^s_node))));
invariant (p0003 == (F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node))));
invariant (p0004 == (F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node))));
invariant (p0005 == (F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node))));
invariant (p0006 == (F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node))));
invariant (p0007 == (F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node))));
invariant (p0008 == (F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node))));
invariant (p0009 == ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0010 == ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node)))));
invariant (p0011 == ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)))));
invariant (p0012 == ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node)))));
invariant (p0013 == ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)))));
invariant (p0014 == ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0015 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0016 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node)))));
invariant (p0017 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)))));
invariant (p0018 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node)))));
invariant (p0019 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)))));
invariant (p0020 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0021 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node)))));
invariant (p0022 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0023 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node)))));
invariant (p0024 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)))));
invariant (p0025 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0026 == ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)))));
invariant (p0027 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0028 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node)))));
invariant (p0029 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)))));
invariant (p0030 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node)))));
invariant (p0031 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)))));
invariant (p0032 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0033 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#l,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)))));
invariant (p0034 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#l,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0035 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)))));
invariant (p0036 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)))));
invariant (p0037 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#next,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0038 == ($oset_disjoint($oset_singleton($phys_ptr_cast(L#next,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)))));
invariant (p0039 == ($non_null($phys_ptr_cast(P#l,^s_node))));
invariant (p0040 == ($non_null($phys_ptr_cast(L#prev,^s_node))));
invariant (p0041 == ($non_null($phys_ptr_cast(L#next,^s_node))));
invariant (p0042 == ($is_null($phys_ptr_cast(P#l,^s_node))));
invariant (p0043 == ($is_null($phys_ptr_cast(L#prev,^s_node))));
invariant (p0044 == ($is_null($phys_ptr_cast(L#next,^s_node))));
invariant (p0045 == (($phys_ptr_cast(P#l,^s_node) == $phys_ptr_cast(L#prev,^s_node))));
invariant (p0046 == (($phys_ptr_cast(P#l,^s_node) == $phys_ptr_cast(L#next,^s_node))));
invariant (p0047 == (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(P#l,^s_node))));
invariant (p0048 == (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(L#next,^s_node))));
invariant (p0049 == (($phys_ptr_cast(L#next,^s_node) == $phys_ptr_cast(P#l,^s_node))));
invariant (p0050 == (($phys_ptr_cast(L#next,^s_node) == $phys_ptr_cast(L#prev,^s_node))));
invariant (p0051 == (($non_null($phys_ptr_cast(P#l,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node)))));
invariant (p0052 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node)))));
invariant (p0053 == (($non_null($phys_ptr_cast(L#next,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#next,^s_node),^s_node)))));
invariant (p0054 == (($non_null($phys_ptr_cast(P#l,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node)))));
invariant (p0055 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node)))));
invariant (p0056 == (($non_null($phys_ptr_cast(L#next,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#next,^s_node),^s_node)))));
invariant (p0057 == (($non_null($phys_ptr_cast(P#l,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node)))));
invariant (p0058 == (($non_null($phys_ptr_cast(P#l,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node) == $phys_ptr_cast(L#next,^s_node)))));
invariant (p0059 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(P#l,^s_node)))));
invariant (p0060 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(L#next,^s_node)))));
invariant (p0061 == (($non_null($phys_ptr_cast(L#next,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#next,^s_node),^s_node) == $phys_ptr_cast(P#l,^s_node)))));
invariant (p0062 == (($non_null($phys_ptr_cast(L#next,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#next,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node)))));
invariant (p0063 == ((!($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))))));
invariant (p0064 == ((!($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))))));
invariant (p0065 == ((!($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))))));
invariant (p0066 == ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)))))));
invariant (p0067 == ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)))))));
invariant (p0068 == ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)))))));
invariant (p0069 == ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)))))));
invariant (p0070 == ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)))))));
invariant (p0071 == ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)))))));
invariant (p0072 == ($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
invariant (p0073 == ($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0074 == ($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
invariant (p0075 == ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0076 == ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)))));
invariant (p0077 == ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)))));
invariant (p0078 == ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)))));
invariant (p0079 == ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)))));
invariant (p0080 == ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0081 == ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0082 == ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
invariant (p0083 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
invariant (p0084 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
invariant (p0085 == ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
invariant (p0086 == ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0087 == ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)))));
invariant (p0088 == ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0089 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)))));
invariant (p0090 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)))));
invariant (p0091 == ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
invariant (p0092 == ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)))));
invariant (p0093 == ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0094 == ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0095 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0096 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0097 == ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0098 == ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0099 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0100 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0101 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0102 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0103 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0104 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0105 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0106 == ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0107 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0108 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0109 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0110 == ((F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0111 == ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0112 == ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0113 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0114 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0115 == ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0116 == ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0117 == ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0118 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0119 == ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0120 == ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0121 == ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0122 == ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0123 == ((P#k < 2147483647)));
invariant (p0124 == ((P#k < 2147483647)));
invariant (p0125 == ((P#k < 2147483647)));
invariant (p0126 == ((P#k < 4294967295)));
invariant (p0127 == ((P#k < 4294967295)));
invariant (p0128 == ((P#k < 4294967295)));
invariant (p0129 == ((P#k >= 0)));
invariant (p0130 == ((P#k >= 0)));
invariant (p0131 == ((P#k >= 0)));
invariant (p0132 == (($non_null($phys_ptr_cast(P#l,^s_node)) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) < P#k))));
invariant (p0133 == (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) < P#k))));
invariant (p0134 == (($non_null($phys_ptr_cast(L#next,^s_node)) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) < P#k))));
invariant (p0135 == ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0136 == ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0137 == ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0138 == ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0139 == ((($non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0140 == ((($non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0141 == ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0142 == ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0143 == ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0144 == ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0145 == ((($non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0146 == ((($non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0147 == (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#l,^s_node)) <= P#k))));
invariant (p0148 == (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#prev,^s_node)) <= P#k))));
invariant (p0149 == (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#next,^s_node)) <= P#k))));
invariant (p0150 == (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= P#k))));
invariant (p0151 == (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) <= P#k))));
invariant (p0152 == (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) <= P#k))));
invariant (p0153 == (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) <= P#k))));
invariant (p0154 == (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) <= P#k))));
invariant (p0155 == (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= P#k))));
invariant (p0156 == (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (P#k <= F#sll_min_key($s,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0157 == (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (P#k <= F#sll_min_key($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0158 == (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (P#k <= F#sll_min_key($s,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0159 == (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0160 == (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node))))));
invariant (p0161 == (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node))))));
invariant (p0162 == (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node))))));
invariant (p0163 == (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node))))));
invariant (p0164 == (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0165 == (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0166 == (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0167 == (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0168 == (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0169 == (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0170 == (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0171 == (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0172 == (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0173 == (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0174 == (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0175 == (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0176 == (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0177 == (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0178 == (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0179 == (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0180 == (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0181 == (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0182 == (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0183 == (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0184 == (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#l,^s_node))))));
invariant (p0185 == (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0186 == (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0187 == (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0188 == (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#next,^s_node))))));
invariant (p0189 == (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0190 == (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node))))));
invariant (p0191 == (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node))))));
invariant (p0192 == (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node))))));
invariant (p0193 == (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node))))));
invariant (p0194 == (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0195 == (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node))))));
invariant (p0196 == (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node))))));
invariant (p0197 == (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node))))));
invariant (p0198 == (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node))))));
invariant (p0199 == (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node))))));
invariant (p0200 == (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node))))));

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
p0153,
p0154,
p0155,
p0156,
p0157,
p0158,
p0159,
p0160,
p0161,
p0162,
p0163,
p0164,
p0165,
p0166,
p0167,
p0168,
p0169,
p0170,
p0171,
p0172,
p0173,
p0174,
p0175,
p0176,
p0177,
p0178,
p0179,
p0180,
p0181,
p0182,
p0183,
p0184,
p0185,
p0186,
p0187,
p0188,
p0189,
p0190,
p0191,
p0192,
p0193,
p0194,
p0195,
p0196,
p0197,
p0198,
p0199,
p0200,
true
);

              invariant $non_null($phys_ptr_cast(L#next, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#next, ^s_node));
              invariant $non_null($phys_ptr_cast(L#next, ^s_node)) ==> $top_writable($s, #wrTime$3^4.3, $phys_ptr_cast(L#next, ^s_node));
              invariant $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#prev, ^s_node));
              invariant $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> $top_writable($s, #wrTime$3^4.3, $phys_ptr_cast(L#prev, ^s_node));
            {
              anon7:
                assume $writes_nothing(old($s), $s);
                assume $timestamp_post(loopState#0, $s);
                assume $full_stop_ext(#tok$3^37.4, $s);
                // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
                assume $meta_eq(loopState#0, $s);
                // _Bool ite#1; 
                assume true;
                // if (@_vcc_ptr_neq_null(next)) ...
                if ($non_null($phys_ptr_cast(L#next, ^s_node)))
                {
                  anon3:
                    // assert @_vcc_possibly_unreachable; 
                    assert {:PossiblyUnreachable true} true;
                    // assert @reads_check_normal((next->key)); 
                    assert $thread_local($s, $phys_ptr_cast(L#next, ^s_node));
                    // ite#1 := >(k, *((next->key))); 
                    ite#1 := P#k > $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node));
                }
                else
                {
                  anon4:
                    // assert @_vcc_possibly_unreachable; 
                    assert {:PossiblyUnreachable true} true;
                    // ite#1 := false; 
                    ite#1 := false;
                }

              anon8:
                assume true;
                // if (ite#1) ...
                if (ite#1)
                {
                  anon5:
                    // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_keys(l0), @_vcc_intset_union(sll_keys(*((l0->next))), @_vcc_intset_singleton(*((l0->key)))))); 
                    assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#l0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_list_len_next(l0), unchecked+(sll_list_len_next(*((l0->next))), 1))); 
                    assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#l0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), 1);
                    // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(rsrtl(l0), &&(&&(rsrtl(*((l0->next))), unchecked!(@_vcc_oset_in(l0, rsrtl_reach(*((l0->next)))))), >=(*((l0->key)), sll_max_key(*((l0->next))))))); 
                    assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(l0), ==(rsrtl_reach(l0), @_vcc_oset_union(rsrtl_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
                    assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll(l0), &&(sll(*((l0->next))), unchecked!(@_vcc_oset_in(l0, sll_reach(*((l0->next)))))))); 
                    assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_reach(l0), @_vcc_oset_union(sll_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
                    assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(sll_max_key(l0), @\int_max(*((l0->key)), sll_max_key(*((l0->next)))))); 
                    assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(SL#l0, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(sll_min_key(l0), @\int_min(*((l0->key)), sll_min_key(*((l0->next)))))); 
                    assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(SL#l0, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(srtl(l0), &&(&&(srtl(*((l0->next))), unchecked!(@_vcc_oset_in(l0, srtl_reach(*((l0->next)))))), <=(*((l0->key)), sll_min_key(*((l0->next))))))); 
                    assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(l0), ==(srtl_reach(l0), @_vcc_oset_union(srtl_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
                    assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
                    // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(rsrtl(prev), &&(&&(rsrtl(*((prev->next))), unchecked!(@_vcc_oset_in(prev, rsrtl_reach(*((prev->next)))))), >=(*((prev->key)), sll_max_key(*((prev->next))))))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(prev), ==(rsrtl_reach(prev), @_vcc_oset_union(rsrtl_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(sll_max_key(prev), @\int_max(*((prev->key)), sll_max_key(*((prev->next)))))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#prev, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(sll_min_key(prev), @\int_min(*((prev->key)), sll_min_key(*((prev->next)))))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#prev, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(srtl(prev), &&(&&(srtl(*((prev->next))), unchecked!(@_vcc_oset_in(prev, srtl_reach(*((prev->next)))))), <=(*((prev->key)), sll_min_key(*((prev->next))))))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(prev), ==(srtl_reach(prev), @_vcc_oset_union(srtl_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
                    assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_keys(next), @_vcc_intset_union(sll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_list_len_next(next), unchecked+(sll_list_len_next(*((next->next))), 1))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(rsrtl(next), &&(&&(rsrtl(*((next->next))), unchecked!(@_vcc_oset_in(next, rsrtl_reach(*((next->next)))))), >=(*((next->key)), sll_max_key(*((next->next))))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(rsrtl_reach(next), @_vcc_oset_union(rsrtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll(next), &&(sll(*((next->next))), unchecked!(@_vcc_oset_in(next, sll_reach(*((next->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_reach(next), @_vcc_oset_union(sll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_max_key(next), @\int_max(*((next->key)), sll_max_key(*((next->next)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_min_key(next), @\int_min(*((next->key)), sll_min_key(*((next->next)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(srtl(next), &&(&&(srtl(*((next->next))), unchecked!(@_vcc_oset_in(next, srtl_reach(*((next->next)))))), <=(*((next->key)), sll_min_key(*((next->next))))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(srtl_reach(next), @_vcc_oset_union(srtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
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
                    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
                    // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg(l, prev), &&(sll_lseg(*((l->next)), prev), unchecked!(@_vcc_oset_in(l, sll_lseg_reach(*((l->next)), prev)))))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node))));
                    // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg_reach(l, prev), @_vcc_oset_union(sll_lseg_reach(*((l->next)), prev), @_vcc_oset_singleton(l)))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg_keys(l, prev), @_vcc_intset_union(sll_lseg_keys(*((l->next)), prev), @_vcc_intset_singleton(*((l->key)))))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
                    // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg_len_next(l, prev), unchecked+(sll_lseg_len_next(*((l->next)), prev), 1))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), 1);
                    // assume ==>(&&(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), @_vcc_ptr_neq_pure(*((l->next)), prev)), ==(sll_lseg_max_key(l, prev), @\int_max(*((l->key)), sll_lseg_max_key(*((l->next)), prev)))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)));
                    // assume ==>(&&(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), @_vcc_ptr_neq_pure(*((l->next)), prev)), ==(sll_lseg_min_key(l, prev), @\int_min(*((l->key)), sll_lseg_min_key(*((l->next)), prev)))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)));
                    // assume ==>(&&(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), @_vcc_ptr_neq_pure(*((l->next)), prev)), ==(srtl_lseg(l, prev), &&(&&(srtl_lseg(*((l->next)), prev), unchecked!(@_vcc_oset_in(l, srtl_lseg_reach(*((l->next)), prev)))), <=(*((l->key)), sll_lseg_min_key(*((l->next)), prev))))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(srtl_lseg_reach(l, prev), @_vcc_oset_union(srtl_lseg_reach(*((l->next)), prev), @_vcc_oset_singleton(l)))); 
                    assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), &&(==(@_vcc_mutable(@state, next), @_vcc_mutable(@state, *((next->next)))), ==(@writes_check(next), @writes_check(*((next->next)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#next, ^s_node)) == $mutable($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && $top_writable($s, #wrTime$3^4.3, $phys_ptr_cast(L#next, ^s_node)) == $top_writable($s, #wrTime$3^4.3, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node));
                    // prev := next; 
                    L#prev := $phys_ptr_cast(L#next, ^s_node);
                    // assert sll_lseg(l0, l0); 
                    assert F#sll_lseg($s, $phys_ptr_cast(SL#l0, ^s_node), $phys_ptr_cast(SL#l0, ^s_node));
                    // assume sll_lseg(l0, l0); 
                    assume F#sll_lseg($s, $phys_ptr_cast(SL#l0, ^s_node), $phys_ptr_cast(SL#l0, ^s_node));
                    // assert srtl_lseg(l0, l0); 
                    assert F#srtl_lseg($s, $phys_ptr_cast(SL#l0, ^s_node), $phys_ptr_cast(SL#l0, ^s_node));
                    // assume srtl_lseg(l0, l0); 
                    assume F#srtl_lseg($s, $phys_ptr_cast(SL#l0, ^s_node), $phys_ptr_cast(SL#l0, ^s_node));
                    // assert sll_lseg(prev, prev); 
                    assert F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                    // assume sll_lseg(prev, prev); 
                    assume F#sll_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                    // assert srtl_lseg(prev, prev); 
                    assert F#srtl_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                    // assume srtl_lseg(prev, prev); 
                    assume F#srtl_lseg($s, $phys_ptr_cast(L#prev, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
                    // assert sll_lseg(next, next); 
                    assert F#sll_lseg($s, $phys_ptr_cast(L#next, ^s_node), $phys_ptr_cast(L#next, ^s_node));
                    // assume sll_lseg(next, next); 
                    assume F#sll_lseg($s, $phys_ptr_cast(L#next, ^s_node), $phys_ptr_cast(L#next, ^s_node));
                    // assert srtl_lseg(next, next); 
                    assert F#srtl_lseg($s, $phys_ptr_cast(L#next, ^s_node), $phys_ptr_cast(L#next, ^s_node));
                    // assume srtl_lseg(next, next); 
                    assume F#srtl_lseg($s, $phys_ptr_cast(L#next, ^s_node), $phys_ptr_cast(L#next, ^s_node));
                    // assert sll_lseg(curr, curr); 
                    assert F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
                    // assume sll_lseg(curr, curr); 
                    assume F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
                    // assert srtl_lseg(curr, curr); 
                    assert F#srtl_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
                    // assume srtl_lseg(curr, curr); 
                    assume F#srtl_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
                    // assert sll_lseg(l, l); 
                    assert F#sll_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(P#l, ^s_node));
                    // assume sll_lseg(l, l); 
                    assume F#sll_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(P#l, ^s_node));
                    // assert srtl_lseg(l, l); 
                    assert F#srtl_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(P#l, ^s_node));
                    // assume srtl_lseg(l, l); 
                    assume F#srtl_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(P#l, ^s_node));
                    // struct s_node* next1; 
                    // next1 := next; 
                    SL#next1 := $phys_ptr_cast(L#next, ^s_node);
                    // struct s_node* stmtexpr0#17; 
                    // stmtexpr0#17 := next1; 
                    stmtexpr0#17 := $phys_ptr_cast(SL#next1, ^s_node);
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_keys(next), @_vcc_intset_union(sll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_list_len_next(next), unchecked+(sll_list_len_next(*((next->next))), 1))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(rsrtl(next), &&(&&(rsrtl(*((next->next))), unchecked!(@_vcc_oset_in(next, rsrtl_reach(*((next->next)))))), >=(*((next->key)), sll_max_key(*((next->next))))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(rsrtl_reach(next), @_vcc_oset_union(rsrtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll(next), &&(sll(*((next->next))), unchecked!(@_vcc_oset_in(next, sll_reach(*((next->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_reach(next), @_vcc_oset_union(sll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_max_key(next), @\int_max(*((next->key)), sll_max_key(*((next->next)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_min_key(next), @\int_min(*((next->key)), sll_min_key(*((next->next)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(srtl(next), &&(&&(srtl(*((next->next))), unchecked!(@_vcc_oset_in(next, srtl_reach(*((next->next)))))), <=(*((next->key)), sll_min_key(*((next->next))))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(srtl_reach(next), @_vcc_oset_union(srtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_pure(next, *((next->next)))), ==(sll_lseg(next, *((next->next))), &&(sll_lseg(*((next->next)), *((next->next))), unchecked!(@_vcc_oset_in(next, sll_lseg_reach(*((next->next)), *((next->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $phys_ptr_cast(L#next, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#next, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_pure(next, *((next->next)))), ==(sll_lseg_reach(next, *((next->next))), @_vcc_oset_union(sll_lseg_reach(*((next->next)), *((next->next))), @_vcc_oset_singleton(next)))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $phys_ptr_cast(L#next, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#next, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_pure(next, *((next->next)))), ==(sll_lseg_keys(next, *((next->next))), @_vcc_intset_union(sll_lseg_keys(*((next->next)), *((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $phys_ptr_cast(L#next, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#next, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_pure(next, *((next->next)))), ==(sll_lseg_len_next(next, *((next->next))), unchecked+(sll_lseg_len_next(*((next->next)), *((next->next))), 1))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $phys_ptr_cast(L#next, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(L#next, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
                    // assume ==>(&&(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_pure(next, *((next->next)))), @_vcc_ptr_neq_pure(*((next->next)), *((next->next)))), ==(sll_lseg_max_key(next, *((next->next))), @\int_max(*((next->key)), sll_lseg_max_key(*((next->next)), *((next->next)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $phys_ptr_cast(L#next, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(L#next, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(&&(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_pure(next, *((next->next)))), @_vcc_ptr_neq_pure(*((next->next)), *((next->next)))), ==(sll_lseg_min_key(next, *((next->next))), @\int_min(*((next->key)), sll_lseg_min_key(*((next->next)), *((next->next)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $phys_ptr_cast(L#next, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(L#next, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(&&(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_pure(next, *((next->next)))), @_vcc_ptr_neq_pure(*((next->next)), *((next->next)))), ==(srtl_lseg(next, *((next->next))), &&(&&(srtl_lseg(*((next->next)), *((next->next))), unchecked!(@_vcc_oset_in(next, srtl_lseg_reach(*((next->next)), *((next->next)))))), <=(*((next->key)), sll_lseg_min_key(*((next->next)), *((next->next))))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $phys_ptr_cast(L#next, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(L#next, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_pure(next, *((next->next)))), ==(srtl_lseg_reach(next, *((next->next))), @_vcc_oset_union(srtl_lseg_reach(*((next->next)), *((next->next))), @_vcc_oset_singleton(next)))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $phys_ptr_cast(L#next, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(L#next, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
                    // assert @reads_check_normal((next->next)); 
                    assert $thread_local($s, $phys_ptr_cast(L#next, ^s_node));
                    // next := *((next->next)); 
                    L#next := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node);
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_keys(next), @_vcc_intset_union(sll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_list_len_next(next), unchecked+(sll_list_len_next(*((next->next))), 1))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(rsrtl(next), &&(&&(rsrtl(*((next->next))), unchecked!(@_vcc_oset_in(next, rsrtl_reach(*((next->next)))))), >=(*((next->key)), sll_max_key(*((next->next))))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(rsrtl_reach(next), @_vcc_oset_union(rsrtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll(next), &&(sll(*((next->next))), unchecked!(@_vcc_oset_in(next, sll_reach(*((next->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_reach(next), @_vcc_oset_union(sll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_max_key(next), @\int_max(*((next->key)), sll_max_key(*((next->next)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_min_key(next), @\int_min(*((next->key)), sll_min_key(*((next->next)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(srtl(next), &&(&&(srtl(*((next->next))), unchecked!(@_vcc_oset_in(next, srtl_reach(*((next->next)))))), <=(*((next->key)), sll_min_key(*((next->next))))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(srtl_reach(next), @_vcc_oset_union(srtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_keys(next), @_vcc_intset_union(sll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_list_len_next(next), unchecked+(sll_list_len_next(*((next->next))), 1))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(rsrtl(next), &&(&&(rsrtl(*((next->next))), unchecked!(@_vcc_oset_in(next, rsrtl_reach(*((next->next)))))), >=(*((next->key)), sll_max_key(*((next->next))))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(rsrtl_reach(next), @_vcc_oset_union(rsrtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll(next), &&(sll(*((next->next))), unchecked!(@_vcc_oset_in(next, sll_reach(*((next->next)))))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_reach(next), @_vcc_oset_union(sll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_max_key(next), @\int_max(*((next->key)), sll_max_key(*((next->next)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_min_key(next), @\int_min(*((next->key)), sll_min_key(*((next->next)))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(srtl(next), &&(&&(srtl(*((next->next))), unchecked!(@_vcc_oset_in(next, srtl_reach(*((next->next)))))), <=(*((next->key)), sll_min_key(*((next->next))))))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
                    // assume ==>(@_vcc_ptr_neq_null(next), ==(srtl_reach(next), @_vcc_oset_union(srtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
                    assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
                }
                else
                {
                  anon6:
                    // assert @_vcc_possibly_unreachable; 
                    assert {:PossiblyUnreachable true} true;
                    // goto #break_2; 
                    goto #break_2;
                }

              #continue_2:
                assume true;
p0000 := (F#srtl($s,$phys_ptr_cast(P#l,^s_node)));
p0001 := (F#srtl($s,$phys_ptr_cast(L#prev,^s_node)));
p0002 := (F#srtl($s,$phys_ptr_cast(L#next,^s_node)));
p0003 := (F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)));
p0004 := (F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)));
p0005 := (F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)));
p0006 := (F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)));
p0007 := (F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)));
p0008 := (F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)));
p0009 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0010 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0011 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0012 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0013 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0014 := ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0015 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0016 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0017 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0018 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0019 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0020 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0021 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0022 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0023 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0024 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0025 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0026 := ($oset_disjoint(F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0027 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0028 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#l,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0029 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0030 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#next,^s_node))));
p0031 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
p0032 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#next,^s_node)),F#srtl_reach($s,$phys_ptr_cast(L#prev,^s_node))));
p0033 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#l,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node))));
p0034 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#l,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0035 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node))));
p0036 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#prev,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node))));
p0037 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#next,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0038 := ($oset_disjoint($oset_singleton($phys_ptr_cast(L#next,^s_node)),F#srtl_lseg_reach($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node))));
p0039 := ($non_null($phys_ptr_cast(P#l,^s_node)));
p0040 := ($non_null($phys_ptr_cast(L#prev,^s_node)));
p0041 := ($non_null($phys_ptr_cast(L#next,^s_node)));
p0042 := ($is_null($phys_ptr_cast(P#l,^s_node)));
p0043 := ($is_null($phys_ptr_cast(L#prev,^s_node)));
p0044 := ($is_null($phys_ptr_cast(L#next,^s_node)));
p0045 := (($phys_ptr_cast(P#l,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
p0046 := (($phys_ptr_cast(P#l,^s_node) == $phys_ptr_cast(L#next,^s_node)));
p0047 := (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(P#l,^s_node)));
p0048 := (($phys_ptr_cast(L#prev,^s_node) == $phys_ptr_cast(L#next,^s_node)));
p0049 := (($phys_ptr_cast(L#next,^s_node) == $phys_ptr_cast(P#l,^s_node)));
p0050 := (($phys_ptr_cast(L#next,^s_node) == $phys_ptr_cast(L#prev,^s_node)));
p0051 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node))));
p0052 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node))));
p0053 := (($non_null($phys_ptr_cast(L#next,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#next,^s_node),^s_node))));
p0054 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node))));
p0055 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node))));
p0056 := (($non_null($phys_ptr_cast(L#next,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#next,^s_node),^s_node))));
p0057 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));
p0058 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#l,^s_node),^s_node) == $phys_ptr_cast(L#next,^s_node))));
p0059 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(P#l,^s_node))));
p0060 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#prev,^s_node),^s_node) == $phys_ptr_cast(L#next,^s_node))));
p0061 := (($non_null($phys_ptr_cast(L#next,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#next,^s_node),^s_node) == $phys_ptr_cast(P#l,^s_node))));
p0062 := (($non_null($phys_ptr_cast(L#next,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#next,^s_node),^s_node) == $phys_ptr_cast(L#prev,^s_node))));
p0063 := ((!($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))))));
p0064 := ((!($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))))));
p0065 := ((!($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))))));
p0066 := ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node))))));
p0067 := ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node))))));
p0068 := ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node))))));
p0069 := ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node))))));
p0070 := ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node))))));
p0071 := ((!($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node))))));
p0072 := ($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))));
p0073 := ($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))));
p0074 := ($intset_in(P#k,F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))));
p0075 := ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0076 := ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node))));
p0077 := ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node))));
p0078 := ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node))));
p0079 := ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node))));
p0080 := ($intset_in(P#k,F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0081 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))));
p0082 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))));
p0083 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))));
p0084 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#next,^s_node))));
p0085 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))));
p0086 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node))));
p0087 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node))));
p0088 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0089 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node))));
p0090 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node))));
p0091 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node))));
p0092 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node))));
p0093 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0094 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0095 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0096 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0097 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0098 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0099 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0100 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0101 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0102 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0103 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0104 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0105 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0106 := ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0107 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0108 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0109 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0110 := ((F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0111 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0112 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0113 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0114 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0115 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0116 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0117 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0118 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0119 := ((F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0120 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#prev,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#next,^s_node)))));
p0121 := ((F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
p0122 := ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#next,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#prev,^s_node)))));
p0123 := ((P#k < 2147483647));
p0124 := ((P#k < 2147483647));
p0125 := ((P#k < 2147483647));
p0126 := ((P#k < 4294967295));
p0127 := ((P#k < 4294967295));
p0128 := ((P#k < 4294967295));
p0129 := ((P#k >= 0));
p0130 := ((P#k >= 0));
p0131 := ((P#k >= 0));
p0132 := (($non_null($phys_ptr_cast(P#l,^s_node)) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) < P#k)));
p0133 := (($non_null($phys_ptr_cast(L#prev,^s_node)) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) < P#k)));
p0134 := (($non_null($phys_ptr_cast(L#next,^s_node)) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) < P#k)));
p0135 := ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0136 := ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0137 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0138 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0139 := ((($non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0140 := ((($non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0141 := ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0142 := ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0143 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0144 := ((($non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0145 := ((($non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0146 := ((($non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0147 := (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#l,^s_node)) <= P#k)));
p0148 := (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#prev,^s_node)) <= P#k)));
p0149 := (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#next,^s_node)) <= P#k)));
p0150 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= P#k)));
p0151 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) <= P#k)));
p0152 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) <= P#k)));
p0153 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) <= P#k)));
p0154 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) <= P#k)));
p0155 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= P#k)));
p0156 := (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (P#k <= F#sll_min_key($s,$phys_ptr_cast(P#l,^s_node)))));
p0157 := (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (P#k <= F#sll_min_key($s,$phys_ptr_cast(L#prev,^s_node)))));
p0158 := (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (P#k <= F#sll_min_key($s,$phys_ptr_cast(L#next,^s_node)))));
p0159 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0160 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)))));
p0161 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)))));
p0162 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)))));
p0163 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)))));
p0164 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node))) ==> (P#k <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0165 := (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0166 := (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0167 := (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0168 := (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0169 := (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0170 := (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0171 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0172 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0173 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0174 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0175 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0176 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0177 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0178 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0179 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)))));
p0180 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0181 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)))));
p0182 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
p0183 := (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#l,^s_node)))));
p0184 := (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#l,^s_node)))));
p0185 := (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#prev,^s_node)))));
p0186 := (((F#srtl($s,$phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#prev,^s_node)))));
p0187 := (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#next,^s_node)))));
p0188 := (((F#srtl($s,$phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#next,^s_node)))));
p0189 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0190 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)))));
p0191 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)))));
p0192 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)))));
p0193 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)))));
p0194 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0195 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#prev,^s_node)))));
p0196 := (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#next,^s_node)))));
p0197 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#next,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#next,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(P#l,^s_node)))));
p0198 := (((F#srtl_lseg($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)) && ($phys_ptr_cast(L#prev,^s_node) != $phys_ptr_cast(L#next,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#prev,^s_node),$phys_ptr_cast(L#next,^s_node)))));
p0199 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#prev,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#prev,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(P#l,^s_node)))));
p0200 := (((F#srtl_lseg($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)) && ($phys_ptr_cast(L#next,^s_node) != $phys_ptr_cast(L#prev,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#next,^s_node),$phys_ptr_cast(L#prev,^s_node)))));

            }

          anon10:
            assume $full_stop_ext(#tok$3^37.4, $s);

          #break_2:
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_keys(l0), @_vcc_intset_union(sll_keys(*((l0->next))), @_vcc_intset_singleton(*((l0->key)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#l0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_list_len_next(l0), unchecked+(sll_list_len_next(*((l0->next))), 1))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#l0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(rsrtl(l0), &&(&&(rsrtl(*((l0->next))), unchecked!(@_vcc_oset_in(l0, rsrtl_reach(*((l0->next)))))), >=(*((l0->key)), sll_max_key(*((l0->next))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(rsrtl_reach(l0), @_vcc_oset_union(rsrtl_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll(l0), &&(sll(*((l0->next))), unchecked!(@_vcc_oset_in(l0, sll_reach(*((l0->next)))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_reach(l0), @_vcc_oset_union(sll_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(sll_max_key(l0), @\int_max(*((l0->key)), sll_max_key(*((l0->next)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(SL#l0, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(sll_min_key(l0), @\int_min(*((l0->key)), sll_min_key(*((l0->next)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(SL#l0, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(srtl(l0), &&(&&(srtl(*((l0->next))), unchecked!(@_vcc_oset_in(l0, srtl_reach(*((l0->next)))))), <=(*((l0->key)), sll_min_key(*((l0->next))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(srtl_reach(l0), @_vcc_oset_union(srtl_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(rsrtl(prev), &&(&&(rsrtl(*((prev->next))), unchecked!(@_vcc_oset_in(prev, rsrtl_reach(*((prev->next)))))), >=(*((prev->key)), sll_max_key(*((prev->next))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(rsrtl_reach(prev), @_vcc_oset_union(rsrtl_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(sll_max_key(prev), @\int_max(*((prev->key)), sll_max_key(*((prev->next)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#prev, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(sll_min_key(prev), @\int_min(*((prev->key)), sll_min_key(*((prev->next)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#prev, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(srtl(prev), &&(&&(srtl(*((prev->next))), unchecked!(@_vcc_oset_in(prev, srtl_reach(*((prev->next)))))), <=(*((prev->key)), sll_min_key(*((prev->next))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(srtl_reach(prev), @_vcc_oset_union(srtl_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_keys(next), @_vcc_intset_union(sll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_list_len_next(next), unchecked+(sll_list_len_next(*((next->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(rsrtl(next), &&(&&(rsrtl(*((next->next))), unchecked!(@_vcc_oset_in(next, rsrtl_reach(*((next->next)))))), >=(*((next->key)), sll_max_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(rsrtl_reach(next), @_vcc_oset_union(rsrtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll(next), &&(sll(*((next->next))), unchecked!(@_vcc_oset_in(next, sll_reach(*((next->next)))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_reach(next), @_vcc_oset_union(sll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_max_key(next), @\int_max(*((next->key)), sll_max_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_min_key(next), @\int_min(*((next->key)), sll_min_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(srtl(next), &&(&&(srtl(*((next->next))), unchecked!(@_vcc_oset_in(next, srtl_reach(*((next->next)))))), <=(*((next->key)), sll_min_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(srtl_reach(next), @_vcc_oset_union(srtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
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
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // _math \state _dryad_S0#6; 
            // _dryad_S0#6 := @_vcc_current_state(@state); 
            _dryad_S0#6 := $current_state($s);
            // _math \state stmtexpr1#19; 
            // stmtexpr1#19 := _dryad_S0#6; 
            stmtexpr1#19 := _dryad_S0#6;
            // curr := _vcc_alloc(@_vcc_typeof((struct s_node*)@null)); 
            call L#curr := $alloc(^s_node);
            assume $full_stop_ext(#tok$3^60.18, $s);
            // assume !(@_vcc_oset_in(curr, @_vcc_oset_union(_dryad_G0, _dryad_G1))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), $oset_union(SL#_dryad_G0, SL#_dryad_G1));
            // _dryad_G1 := @_vcc_oset_union(_dryad_G0, @_vcc_oset_singleton(curr)); 
            SL#_dryad_G1 := $oset_union(SL#_dryad_G0, $oset_singleton($phys_ptr_cast(L#curr, ^s_node)));
            // _math \oset stmtexpr2#20; 
            // stmtexpr2#20 := _dryad_G1; 
            stmtexpr2#20 := SL#_dryad_G1;
            // assume ==(glob_reach(), _dryad_G1); 
            assume F#glob_reach() == SL#_dryad_G1;
            // _math \state _dryad_S1#7; 
            // _dryad_S1#7 := @_vcc_current_state(@state); 
            _dryad_S1#7 := $current_state($s);
            // _math \state stmtexpr3#21; 
            // stmtexpr3#21 := _dryad_S1#7; 
            stmtexpr3#21 := _dryad_S1#7;
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_keys(l0), @_vcc_intset_union(sll_keys(*((l0->next))), @_vcc_intset_singleton(*((l0->key)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#l0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_list_len_next(l0), unchecked+(sll_list_len_next(*((l0->next))), 1))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#l0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(rsrtl(l0), &&(&&(rsrtl(*((l0->next))), unchecked!(@_vcc_oset_in(l0, rsrtl_reach(*((l0->next)))))), >=(*((l0->key)), sll_max_key(*((l0->next))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(rsrtl_reach(l0), @_vcc_oset_union(rsrtl_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll(l0), &&(sll(*((l0->next))), unchecked!(@_vcc_oset_in(l0, sll_reach(*((l0->next)))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_reach(l0), @_vcc_oset_union(sll_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(sll_max_key(l0), @\int_max(*((l0->key)), sll_max_key(*((l0->next)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(SL#l0, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(sll_min_key(l0), @\int_min(*((l0->key)), sll_min_key(*((l0->next)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(SL#l0, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(srtl(l0), &&(&&(srtl(*((l0->next))), unchecked!(@_vcc_oset_in(l0, srtl_reach(*((l0->next)))))), <=(*((l0->key)), sll_min_key(*((l0->next))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(srtl_reach(l0), @_vcc_oset_union(srtl_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(rsrtl(prev), &&(&&(rsrtl(*((prev->next))), unchecked!(@_vcc_oset_in(prev, rsrtl_reach(*((prev->next)))))), >=(*((prev->key)), sll_max_key(*((prev->next))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(rsrtl_reach(prev), @_vcc_oset_union(rsrtl_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(sll_max_key(prev), @\int_max(*((prev->key)), sll_max_key(*((prev->next)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#prev, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(sll_min_key(prev), @\int_min(*((prev->key)), sll_min_key(*((prev->next)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#prev, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(srtl(prev), &&(&&(srtl(*((prev->next))), unchecked!(@_vcc_oset_in(prev, srtl_reach(*((prev->next)))))), <=(*((prev->key)), sll_min_key(*((prev->next))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(srtl_reach(prev), @_vcc_oset_union(srtl_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_keys(next), @_vcc_intset_union(sll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_list_len_next(next), unchecked+(sll_list_len_next(*((next->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(rsrtl(next), &&(&&(rsrtl(*((next->next))), unchecked!(@_vcc_oset_in(next, rsrtl_reach(*((next->next)))))), >=(*((next->key)), sll_max_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(rsrtl_reach(next), @_vcc_oset_union(rsrtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll(next), &&(sll(*((next->next))), unchecked!(@_vcc_oset_in(next, sll_reach(*((next->next)))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_reach(next), @_vcc_oset_union(sll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_max_key(next), @\int_max(*((next->key)), sll_max_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_min_key(next), @\int_min(*((next->key)), sll_min_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(srtl(next), &&(&&(srtl(*((next->next))), unchecked!(@_vcc_oset_in(next, srtl_reach(*((next->next)))))), <=(*((next->key)), sll_min_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(srtl_reach(next), @_vcc_oset_union(srtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
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
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg(l, prev), &&(sll_lseg(*((l->next)), prev), unchecked!(@_vcc_oset_in(l, sll_lseg_reach(*((l->next)), prev)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg_reach(l, prev), @_vcc_oset_union(sll_lseg_reach(*((l->next)), prev), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg_keys(l, prev), @_vcc_intset_union(sll_lseg_keys(*((l->next)), prev), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg_len_next(l, prev), unchecked+(sll_lseg_len_next(*((l->next)), prev), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), 1);
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), @_vcc_ptr_neq_pure(*((l->next)), prev)), ==(sll_lseg_max_key(l, prev), @\int_max(*((l->key)), sll_lseg_max_key(*((l->next)), prev)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), @_vcc_ptr_neq_pure(*((l->next)), prev)), ==(sll_lseg_min_key(l, prev), @\int_min(*((l->key)), sll_lseg_min_key(*((l->next)), prev)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), @_vcc_ptr_neq_pure(*((l->next)), prev)), ==(srtl_lseg(l, prev), &&(&&(srtl_lseg(*((l->next)), prev), unchecked!(@_vcc_oset_in(l, srtl_lseg_reach(*((l->next)), prev)))), <=(*((l->key)), sll_lseg_min_key(*((l->next)), prev))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(srtl_lseg_reach(l, prev), @_vcc_oset_union(srtl_lseg_reach(*((l->next)), prev), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(l0)))), ==(old(_dryad_S0#6, sll_keys(l0)), old(_dryad_S1#7, sll_keys(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_keys(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_keys(_dryad_S1#7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(l0)))), ==(old(_dryad_S0#6, sll_list_len_next(l0)), old(_dryad_S1#7, sll_list_len_next(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_list_len_next(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_list_len_next(_dryad_S1#7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, rsrtl_reach(l0)))), ==(old(_dryad_S0#6, rsrtl(l0)), old(_dryad_S1#7, rsrtl(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#rsrtl(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node)) == F#rsrtl(_dryad_S1#7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, rsrtl_reach(l0)))), ==(old(_dryad_S0#6, rsrtl_reach(l0)), old(_dryad_S1#7, rsrtl_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#rsrtl_reach(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node)) == F#rsrtl_reach(_dryad_S1#7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(l0)))), ==(old(_dryad_S0#6, sll(l0)), old(_dryad_S1#7, sll(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll(_dryad_S1#7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(l0)))), ==(old(_dryad_S0#6, sll_reach(l0)), old(_dryad_S1#7, sll_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_reach(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_reach(_dryad_S1#7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(l0)))), ==(old(_dryad_S0#6, sll_max_key(l0)), old(_dryad_S1#7, sll_max_key(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_max_key(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_max_key(_dryad_S1#7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(l0)))), ==(old(_dryad_S0#6, sll_min_key(l0)), old(_dryad_S1#7, sll_min_key(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_min_key(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_min_key(_dryad_S1#7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, srtl_reach(l0)))), ==(old(_dryad_S0#6, srtl(l0)), old(_dryad_S1#7, srtl(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#srtl(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node)) == F#srtl(_dryad_S1#7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, srtl_reach(l0)))), ==(old(_dryad_S0#6, srtl_reach(l0)), old(_dryad_S1#7, srtl_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#srtl_reach(_dryad_S0#6, $phys_ptr_cast(SL#l0, ^s_node)) == F#srtl_reach(_dryad_S1#7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(prev)))), ==(old(_dryad_S0#6, sll_keys(prev)), old(_dryad_S1#7, sll_keys(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_keys(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_keys(_dryad_S1#7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(prev)))), ==(old(_dryad_S0#6, sll_list_len_next(prev)), old(_dryad_S1#7, sll_list_len_next(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_list_len_next(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_list_len_next(_dryad_S1#7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, rsrtl_reach(prev)))), ==(old(_dryad_S0#6, rsrtl(prev)), old(_dryad_S1#7, rsrtl(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#rsrtl(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node)) == F#rsrtl(_dryad_S1#7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, rsrtl_reach(prev)))), ==(old(_dryad_S0#6, rsrtl_reach(prev)), old(_dryad_S1#7, rsrtl_reach(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#rsrtl_reach(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node)) == F#rsrtl_reach(_dryad_S1#7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(prev)))), ==(old(_dryad_S0#6, sll(prev)), old(_dryad_S1#7, sll(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node)) == F#sll(_dryad_S1#7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(prev)))), ==(old(_dryad_S0#6, sll_reach(prev)), old(_dryad_S1#7, sll_reach(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_reach(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_reach(_dryad_S1#7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(prev)))), ==(old(_dryad_S0#6, sll_max_key(prev)), old(_dryad_S1#7, sll_max_key(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_max_key(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_max_key(_dryad_S1#7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(prev)))), ==(old(_dryad_S0#6, sll_min_key(prev)), old(_dryad_S1#7, sll_min_key(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_min_key(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_min_key(_dryad_S1#7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, srtl_reach(prev)))), ==(old(_dryad_S0#6, srtl(prev)), old(_dryad_S1#7, srtl(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node)) == F#srtl(_dryad_S1#7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, srtl_reach(prev)))), ==(old(_dryad_S0#6, srtl_reach(prev)), old(_dryad_S1#7, srtl_reach(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl_reach(_dryad_S0#6, $phys_ptr_cast(L#prev, ^s_node)) == F#srtl_reach(_dryad_S1#7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(next)))), ==(old(_dryad_S0#6, sll_keys(next)), old(_dryad_S1#7, sll_keys(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_keys(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node)) == F#sll_keys(_dryad_S1#7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(next)))), ==(old(_dryad_S0#6, sll_list_len_next(next)), old(_dryad_S1#7, sll_list_len_next(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_list_len_next(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node)) == F#sll_list_len_next(_dryad_S1#7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, rsrtl_reach(next)))), ==(old(_dryad_S0#6, rsrtl(next)), old(_dryad_S1#7, rsrtl(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node))) ==> F#rsrtl(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node)) == F#rsrtl(_dryad_S1#7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, rsrtl_reach(next)))), ==(old(_dryad_S0#6, rsrtl_reach(next)), old(_dryad_S1#7, rsrtl_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node))) ==> F#rsrtl_reach(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node)) == F#rsrtl_reach(_dryad_S1#7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(next)))), ==(old(_dryad_S0#6, sll(next)), old(_dryad_S1#7, sll(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node)) == F#sll(_dryad_S1#7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(next)))), ==(old(_dryad_S0#6, sll_reach(next)), old(_dryad_S1#7, sll_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_reach(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node)) == F#sll_reach(_dryad_S1#7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(next)))), ==(old(_dryad_S0#6, sll_max_key(next)), old(_dryad_S1#7, sll_max_key(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_max_key(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node)) == F#sll_max_key(_dryad_S1#7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(next)))), ==(old(_dryad_S0#6, sll_min_key(next)), old(_dryad_S1#7, sll_min_key(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_min_key(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node)) == F#sll_min_key(_dryad_S1#7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, srtl_reach(next)))), ==(old(_dryad_S0#6, srtl(next)), old(_dryad_S1#7, srtl(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node))) ==> F#srtl(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node)) == F#srtl(_dryad_S1#7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, srtl_reach(next)))), ==(old(_dryad_S0#6, srtl_reach(next)), old(_dryad_S1#7, srtl_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node))) ==> F#srtl_reach(_dryad_S0#6, $phys_ptr_cast(L#next, ^s_node)) == F#srtl_reach(_dryad_S1#7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(l)))), ==(old(_dryad_S0#6, sll_keys(l)), old(_dryad_S1#7, sll_keys(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_keys(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node)) == F#sll_keys(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(l)))), ==(old(_dryad_S0#6, sll_list_len_next(l)), old(_dryad_S1#7, sll_list_len_next(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_list_len_next(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node)) == F#sll_list_len_next(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, rsrtl_reach(l)))), ==(old(_dryad_S0#6, rsrtl(l)), old(_dryad_S1#7, rsrtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, rsrtl_reach(l)))), ==(old(_dryad_S0#6, rsrtl_reach(l)), old(_dryad_S1#7, rsrtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl_reach(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(l)))), ==(old(_dryad_S0#6, sll(l)), old(_dryad_S1#7, sll(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node)) == F#sll(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(l)))), ==(old(_dryad_S0#6, sll_reach(l)), old(_dryad_S1#7, sll_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node)) == F#sll_reach(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(l)))), ==(old(_dryad_S0#6, sll_max_key(l)), old(_dryad_S1#7, sll_max_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_max_key(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node)) == F#sll_max_key(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_reach(l)))), ==(old(_dryad_S0#6, sll_min_key(l)), old(_dryad_S1#7, sll_min_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_min_key(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node)) == F#sll_min_key(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, srtl_reach(l)))), ==(old(_dryad_S0#6, srtl(l)), old(_dryad_S1#7, srtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node)) == F#srtl(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, srtl_reach(l)))), ==(old(_dryad_S0#6, srtl_reach(l)), old(_dryad_S1#7, srtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node)) == F#srtl_reach(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_lseg_reach(l, prev)))), ==(old(_dryad_S0#6, sll_lseg(l, prev)), old(_dryad_S1#7, sll_lseg(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_lseg_reach(l, prev)))), ==(old(_dryad_S0#6, sll_lseg_reach(l, prev)), old(_dryad_S1#7, sll_lseg_reach(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_reach(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_lseg_reach(l, prev)))), ==(old(_dryad_S0#6, sll_lseg_keys(l, prev)), old(_dryad_S1#7, sll_lseg_keys(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_keys(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_keys(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_lseg_reach(l, prev)))), ==(old(_dryad_S0#6, sll_lseg_len_next(l, prev)), old(_dryad_S1#7, sll_lseg_len_next(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_len_next(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_len_next(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_lseg_reach(l, prev)))), ==(old(_dryad_S0#6, sll_lseg_max_key(l, prev)), old(_dryad_S1#7, sll_lseg_max_key(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_max_key(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_max_key(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, sll_lseg_reach(l, prev)))), ==(old(_dryad_S0#6, sll_lseg_min_key(l, prev)), old(_dryad_S1#7, sll_lseg_min_key(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_min_key(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_min_key(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, srtl_lseg_reach(l, prev)))), ==(old(_dryad_S0#6, srtl_lseg(l, prev)), old(_dryad_S1#7, srtl_lseg(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl_lseg(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#srtl_lseg(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0#6, srtl_lseg_reach(l, prev)))), ==(old(_dryad_S0#6, srtl_lseg_reach(l, prev)), old(_dryad_S1#7, srtl_lseg_reach(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl_lseg_reach(_dryad_S0#6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#srtl_lseg_reach(_dryad_S1#7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume @_vcc_ptr_neq_null(curr); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node));
            // _math \state _dryad_S2#8; 
            // _dryad_S2#8 := @_vcc_current_state(@state); 
            _dryad_S2#8 := $current_state($s);
            // _math \state stmtexpr4#22; 
            // stmtexpr4#22 := _dryad_S2#8; 
            stmtexpr4#22 := _dryad_S2#8;
            // assert @prim_writes_check((curr->next)); 
            assert $writable_prim($s, #wrTime$3^4.3, $dot($phys_ptr_cast(L#curr, ^s_node), s_node.next));
            // *(curr->next) := (struct s_node*)@null; 
            call $write_int(s_node.next, $phys_ptr_cast(L#curr, ^s_node), $ptr_to_int($phys_ptr_cast($null, ^s_node)));
            assume $full_stop_ext(#tok$3^62.7, $s);
            // _math \state _dryad_S3#9; 
            // _dryad_S3#9 := @_vcc_current_state(@state); 
            _dryad_S3#9 := $current_state($s);
            // _math \state stmtexpr5#23; 
            // stmtexpr5#23 := _dryad_S3#9; 
            stmtexpr5#23 := _dryad_S3#9;
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(l0)))), ==(old(_dryad_S2#8, sll_keys(l0)), old(_dryad_S3#9, sll_keys(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_keys(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_keys(_dryad_S3#9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(l0)))), ==(old(_dryad_S2#8, sll_list_len_next(l0)), old(_dryad_S3#9, sll_list_len_next(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_list_len_next(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_list_len_next(_dryad_S3#9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, rsrtl_reach(l0)))), ==(old(_dryad_S2#8, rsrtl(l0)), old(_dryad_S3#9, rsrtl(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#rsrtl(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node)) == F#rsrtl(_dryad_S3#9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, rsrtl_reach(l0)))), ==(old(_dryad_S2#8, rsrtl_reach(l0)), old(_dryad_S3#9, rsrtl_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#rsrtl_reach(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node)) == F#rsrtl_reach(_dryad_S3#9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(l0)))), ==(old(_dryad_S2#8, sll(l0)), old(_dryad_S3#9, sll(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll(_dryad_S3#9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(l0)))), ==(old(_dryad_S2#8, sll_reach(l0)), old(_dryad_S3#9, sll_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_reach(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_reach(_dryad_S3#9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(l0)))), ==(old(_dryad_S2#8, sll_max_key(l0)), old(_dryad_S3#9, sll_max_key(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_max_key(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_max_key(_dryad_S3#9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(l0)))), ==(old(_dryad_S2#8, sll_min_key(l0)), old(_dryad_S3#9, sll_min_key(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_min_key(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_min_key(_dryad_S3#9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, srtl_reach(l0)))), ==(old(_dryad_S2#8, srtl(l0)), old(_dryad_S3#9, srtl(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#srtl(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node)) == F#srtl(_dryad_S3#9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, srtl_reach(l0)))), ==(old(_dryad_S2#8, srtl_reach(l0)), old(_dryad_S3#9, srtl_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#srtl_reach(_dryad_S2#8, $phys_ptr_cast(SL#l0, ^s_node)) == F#srtl_reach(_dryad_S3#9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(prev)))), ==(old(_dryad_S2#8, sll_keys(prev)), old(_dryad_S3#9, sll_keys(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_keys(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_keys(_dryad_S3#9, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(prev)))), ==(old(_dryad_S2#8, sll_list_len_next(prev)), old(_dryad_S3#9, sll_list_len_next(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_list_len_next(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_list_len_next(_dryad_S3#9, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, rsrtl_reach(prev)))), ==(old(_dryad_S2#8, rsrtl(prev)), old(_dryad_S3#9, rsrtl(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node))) ==> F#rsrtl(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node)) == F#rsrtl(_dryad_S3#9, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, rsrtl_reach(prev)))), ==(old(_dryad_S2#8, rsrtl_reach(prev)), old(_dryad_S3#9, rsrtl_reach(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node))) ==> F#rsrtl_reach(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node)) == F#rsrtl_reach(_dryad_S3#9, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(prev)))), ==(old(_dryad_S2#8, sll(prev)), old(_dryad_S3#9, sll(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node)) == F#sll(_dryad_S3#9, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(prev)))), ==(old(_dryad_S2#8, sll_reach(prev)), old(_dryad_S3#9, sll_reach(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_reach(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_reach(_dryad_S3#9, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(prev)))), ==(old(_dryad_S2#8, sll_max_key(prev)), old(_dryad_S3#9, sll_max_key(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_max_key(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_max_key(_dryad_S3#9, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(prev)))), ==(old(_dryad_S2#8, sll_min_key(prev)), old(_dryad_S3#9, sll_min_key(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_min_key(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_min_key(_dryad_S3#9, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, srtl_reach(prev)))), ==(old(_dryad_S2#8, srtl(prev)), old(_dryad_S3#9, srtl(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node)) == F#srtl(_dryad_S3#9, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, srtl_reach(prev)))), ==(old(_dryad_S2#8, srtl_reach(prev)), old(_dryad_S3#9, srtl_reach(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl_reach(_dryad_S2#8, $phys_ptr_cast(L#prev, ^s_node)) == F#srtl_reach(_dryad_S3#9, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(next)))), ==(old(_dryad_S2#8, sll_keys(next)), old(_dryad_S3#9, sll_keys(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_keys(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node)) == F#sll_keys(_dryad_S3#9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(next)))), ==(old(_dryad_S2#8, sll_list_len_next(next)), old(_dryad_S3#9, sll_list_len_next(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_list_len_next(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node)) == F#sll_list_len_next(_dryad_S3#9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, rsrtl_reach(next)))), ==(old(_dryad_S2#8, rsrtl(next)), old(_dryad_S3#9, rsrtl(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node))) ==> F#rsrtl(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node)) == F#rsrtl(_dryad_S3#9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, rsrtl_reach(next)))), ==(old(_dryad_S2#8, rsrtl_reach(next)), old(_dryad_S3#9, rsrtl_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node))) ==> F#rsrtl_reach(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node)) == F#rsrtl_reach(_dryad_S3#9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(next)))), ==(old(_dryad_S2#8, sll(next)), old(_dryad_S3#9, sll(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node)) == F#sll(_dryad_S3#9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(next)))), ==(old(_dryad_S2#8, sll_reach(next)), old(_dryad_S3#9, sll_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_reach(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node)) == F#sll_reach(_dryad_S3#9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(next)))), ==(old(_dryad_S2#8, sll_max_key(next)), old(_dryad_S3#9, sll_max_key(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_max_key(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node)) == F#sll_max_key(_dryad_S3#9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(next)))), ==(old(_dryad_S2#8, sll_min_key(next)), old(_dryad_S3#9, sll_min_key(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_min_key(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node)) == F#sll_min_key(_dryad_S3#9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, srtl_reach(next)))), ==(old(_dryad_S2#8, srtl(next)), old(_dryad_S3#9, srtl(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node))) ==> F#srtl(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node)) == F#srtl(_dryad_S3#9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, srtl_reach(next)))), ==(old(_dryad_S2#8, srtl_reach(next)), old(_dryad_S3#9, srtl_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node))) ==> F#srtl_reach(_dryad_S2#8, $phys_ptr_cast(L#next, ^s_node)) == F#srtl_reach(_dryad_S3#9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(l)))), ==(old(_dryad_S2#8, sll_keys(l)), old(_dryad_S3#9, sll_keys(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_keys(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node)) == F#sll_keys(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(l)))), ==(old(_dryad_S2#8, sll_list_len_next(l)), old(_dryad_S3#9, sll_list_len_next(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_list_len_next(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node)) == F#sll_list_len_next(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, rsrtl_reach(l)))), ==(old(_dryad_S2#8, rsrtl(l)), old(_dryad_S3#9, rsrtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, rsrtl_reach(l)))), ==(old(_dryad_S2#8, rsrtl_reach(l)), old(_dryad_S3#9, rsrtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl_reach(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(l)))), ==(old(_dryad_S2#8, sll(l)), old(_dryad_S3#9, sll(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node)) == F#sll(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(l)))), ==(old(_dryad_S2#8, sll_reach(l)), old(_dryad_S3#9, sll_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node)) == F#sll_reach(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(l)))), ==(old(_dryad_S2#8, sll_max_key(l)), old(_dryad_S3#9, sll_max_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_max_key(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node)) == F#sll_max_key(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_reach(l)))), ==(old(_dryad_S2#8, sll_min_key(l)), old(_dryad_S3#9, sll_min_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_min_key(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node)) == F#sll_min_key(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, srtl_reach(l)))), ==(old(_dryad_S2#8, srtl(l)), old(_dryad_S3#9, srtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node)) == F#srtl(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, srtl_reach(l)))), ==(old(_dryad_S2#8, srtl_reach(l)), old(_dryad_S3#9, srtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node)) == F#srtl_reach(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_lseg_reach(l, prev)))), ==(old(_dryad_S2#8, sll_lseg(l, prev)), old(_dryad_S3#9, sll_lseg(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_lseg_reach(l, prev)))), ==(old(_dryad_S2#8, sll_lseg_reach(l, prev)), old(_dryad_S3#9, sll_lseg_reach(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_reach(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_lseg_reach(l, prev)))), ==(old(_dryad_S2#8, sll_lseg_keys(l, prev)), old(_dryad_S3#9, sll_lseg_keys(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_keys(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_keys(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_lseg_reach(l, prev)))), ==(old(_dryad_S2#8, sll_lseg_len_next(l, prev)), old(_dryad_S3#9, sll_lseg_len_next(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_len_next(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_len_next(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_lseg_reach(l, prev)))), ==(old(_dryad_S2#8, sll_lseg_max_key(l, prev)), old(_dryad_S3#9, sll_lseg_max_key(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_max_key(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_max_key(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, sll_lseg_reach(l, prev)))), ==(old(_dryad_S2#8, sll_lseg_min_key(l, prev)), old(_dryad_S3#9, sll_lseg_min_key(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_min_key(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_min_key(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, srtl_lseg_reach(l, prev)))), ==(old(_dryad_S2#8, srtl_lseg(l, prev)), old(_dryad_S3#9, srtl_lseg(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl_lseg(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#srtl_lseg(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S2#8, srtl_lseg_reach(l, prev)))), ==(old(_dryad_S2#8, srtl_lseg_reach(l, prev)), old(_dryad_S3#9, srtl_lseg_reach(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl_lseg_reach(_dryad_S2#8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#srtl_lseg_reach(_dryad_S3#9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, l0)), ==(*((l0->key)), old(_dryad_S2#8, *((l0->key))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(SL#l0, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) == $rd_inv(_dryad_S2#8, s_node.key, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, l0)), @_vcc_ptr_eq_pure(*((l0->next)), old(_dryad_S2#8, *((l0->next))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(SL#l0, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node) == $rd_phys_ptr(_dryad_S2#8, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, prev)), ==(*((prev->key)), old(_dryad_S2#8, *((prev->key))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(L#prev, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) == $rd_inv(_dryad_S2#8, s_node.key, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, prev)), @_vcc_ptr_eq_pure(*((prev->next)), old(_dryad_S2#8, *((prev->next))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(L#prev, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node) == $rd_phys_ptr(_dryad_S2#8, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, next)), ==(*((next->key)), old(_dryad_S2#8, *((next->key))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(L#next, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) == $rd_inv(_dryad_S2#8, s_node.key, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, next)), @_vcc_ptr_eq_pure(*((next->next)), old(_dryad_S2#8, *((next->next))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(L#next, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) == $rd_phys_ptr(_dryad_S2#8, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, l)), ==(*((l->key)), old(_dryad_S2#8, *((l->key))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) == $rd_inv(_dryad_S2#8, s_node.key, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, l)), @_vcc_ptr_eq_pure(*((l->next)), old(_dryad_S2#8, *((l->next))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) == $rd_phys_ptr(_dryad_S2#8, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_keys(l0), @_vcc_intset_union(sll_keys(*((l0->next))), @_vcc_intset_singleton(*((l0->key)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#l0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_list_len_next(l0), unchecked+(sll_list_len_next(*((l0->next))), 1))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#l0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(rsrtl(l0), &&(&&(rsrtl(*((l0->next))), unchecked!(@_vcc_oset_in(l0, rsrtl_reach(*((l0->next)))))), >=(*((l0->key)), sll_max_key(*((l0->next))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(rsrtl_reach(l0), @_vcc_oset_union(rsrtl_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll(l0), &&(sll(*((l0->next))), unchecked!(@_vcc_oset_in(l0, sll_reach(*((l0->next)))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_reach(l0), @_vcc_oset_union(sll_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(sll_max_key(l0), @\int_max(*((l0->key)), sll_max_key(*((l0->next)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(SL#l0, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(sll_min_key(l0), @\int_min(*((l0->key)), sll_min_key(*((l0->next)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(SL#l0, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(srtl(l0), &&(&&(srtl(*((l0->next))), unchecked!(@_vcc_oset_in(l0, srtl_reach(*((l0->next)))))), <=(*((l0->key)), sll_min_key(*((l0->next))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(srtl_reach(l0), @_vcc_oset_union(srtl_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(rsrtl(prev), &&(&&(rsrtl(*((prev->next))), unchecked!(@_vcc_oset_in(prev, rsrtl_reach(*((prev->next)))))), >=(*((prev->key)), sll_max_key(*((prev->next))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(rsrtl_reach(prev), @_vcc_oset_union(rsrtl_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(sll_max_key(prev), @\int_max(*((prev->key)), sll_max_key(*((prev->next)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#prev, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(sll_min_key(prev), @\int_min(*((prev->key)), sll_min_key(*((prev->next)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#prev, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(srtl(prev), &&(&&(srtl(*((prev->next))), unchecked!(@_vcc_oset_in(prev, srtl_reach(*((prev->next)))))), <=(*((prev->key)), sll_min_key(*((prev->next))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(srtl_reach(prev), @_vcc_oset_union(srtl_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_keys(next), @_vcc_intset_union(sll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_list_len_next(next), unchecked+(sll_list_len_next(*((next->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(rsrtl(next), &&(&&(rsrtl(*((next->next))), unchecked!(@_vcc_oset_in(next, rsrtl_reach(*((next->next)))))), >=(*((next->key)), sll_max_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(rsrtl_reach(next), @_vcc_oset_union(rsrtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll(next), &&(sll(*((next->next))), unchecked!(@_vcc_oset_in(next, sll_reach(*((next->next)))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_reach(next), @_vcc_oset_union(sll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_max_key(next), @\int_max(*((next->key)), sll_max_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_min_key(next), @\int_min(*((next->key)), sll_min_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(srtl(next), &&(&&(srtl(*((next->next))), unchecked!(@_vcc_oset_in(next, srtl_reach(*((next->next)))))), <=(*((next->key)), sll_min_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(srtl_reach(next), @_vcc_oset_union(srtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
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
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg(l, prev), &&(sll_lseg(*((l->next)), prev), unchecked!(@_vcc_oset_in(l, sll_lseg_reach(*((l->next)), prev)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg_reach(l, prev), @_vcc_oset_union(sll_lseg_reach(*((l->next)), prev), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg_keys(l, prev), @_vcc_intset_union(sll_lseg_keys(*((l->next)), prev), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg_len_next(l, prev), unchecked+(sll_lseg_len_next(*((l->next)), prev), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), 1);
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), @_vcc_ptr_neq_pure(*((l->next)), prev)), ==(sll_lseg_max_key(l, prev), @\int_max(*((l->key)), sll_lseg_max_key(*((l->next)), prev)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), @_vcc_ptr_neq_pure(*((l->next)), prev)), ==(sll_lseg_min_key(l, prev), @\int_min(*((l->key)), sll_lseg_min_key(*((l->next)), prev)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), @_vcc_ptr_neq_pure(*((l->next)), prev)), ==(srtl_lseg(l, prev), &&(&&(srtl_lseg(*((l->next)), prev), unchecked!(@_vcc_oset_in(l, srtl_lseg_reach(*((l->next)), prev)))), <=(*((l->key)), sll_lseg_min_key(*((l->next)), prev))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(srtl_lseg_reach(l, prev), @_vcc_oset_union(srtl_lseg_reach(*((l->next)), prev), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // _math \state _dryad_S4#10; 
            // _dryad_S4#10 := @_vcc_current_state(@state); 
            _dryad_S4#10 := $current_state($s);
            // _math \state stmtexpr6#24; 
            // stmtexpr6#24 := _dryad_S4#10; 
            stmtexpr6#24 := _dryad_S4#10;
            // assert @prim_writes_check((curr->key)); 
            assert $writable_prim($s, #wrTime$3^4.3, $dot($phys_ptr_cast(L#curr, ^s_node), s_node.key));
            // *(curr->key) := k; 
            call $write_int(s_node.key, $phys_ptr_cast(L#curr, ^s_node), P#k);
            assume $full_stop_ext(#tok$3^63.4, $s);
            // _math \state _dryad_S5#11; 
            // _dryad_S5#11 := @_vcc_current_state(@state); 
            _dryad_S5#11 := $current_state($s);
            // _math \state stmtexpr7#25; 
            // stmtexpr7#25 := _dryad_S5#11; 
            stmtexpr7#25 := _dryad_S5#11;
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(*((curr->next)))))), ==(old(_dryad_S4#10, sll_keys(*((curr->next)))), old(_dryad_S5#11, sll_keys(*((curr->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) ==> F#sll_keys(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == F#sll_keys(_dryad_S5#11, $rd_phys_ptr(_dryad_S5#11, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(*((curr->next)))))), ==(old(_dryad_S4#10, sll_list_len_next(*((curr->next)))), old(_dryad_S5#11, sll_list_len_next(*((curr->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) ==> F#sll_list_len_next(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == F#sll_list_len_next(_dryad_S5#11, $rd_phys_ptr(_dryad_S5#11, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, rsrtl_reach(*((curr->next)))))), ==(old(_dryad_S4#10, rsrtl(*((curr->next)))), old(_dryad_S5#11, rsrtl(*((curr->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) ==> F#rsrtl(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == F#rsrtl(_dryad_S5#11, $rd_phys_ptr(_dryad_S5#11, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, rsrtl_reach(*((curr->next)))))), ==(old(_dryad_S4#10, rsrtl_reach(*((curr->next)))), old(_dryad_S5#11, rsrtl_reach(*((curr->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) ==> F#rsrtl_reach(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == F#rsrtl_reach(_dryad_S5#11, $rd_phys_ptr(_dryad_S5#11, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(*((curr->next)))))), ==(old(_dryad_S4#10, sll(*((curr->next)))), old(_dryad_S5#11, sll(*((curr->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) ==> F#sll(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == F#sll(_dryad_S5#11, $rd_phys_ptr(_dryad_S5#11, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(*((curr->next)))))), ==(old(_dryad_S4#10, sll_reach(*((curr->next)))), old(_dryad_S5#11, sll_reach(*((curr->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) ==> F#sll_reach(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == F#sll_reach(_dryad_S5#11, $rd_phys_ptr(_dryad_S5#11, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(*((curr->next)))))), ==(old(_dryad_S4#10, sll_max_key(*((curr->next)))), old(_dryad_S5#11, sll_max_key(*((curr->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) ==> F#sll_max_key(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == F#sll_max_key(_dryad_S5#11, $rd_phys_ptr(_dryad_S5#11, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(*((curr->next)))))), ==(old(_dryad_S4#10, sll_min_key(*((curr->next)))), old(_dryad_S5#11, sll_min_key(*((curr->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) ==> F#sll_min_key(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == F#sll_min_key(_dryad_S5#11, $rd_phys_ptr(_dryad_S5#11, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, srtl_reach(*((curr->next)))))), ==(old(_dryad_S4#10, srtl(*((curr->next)))), old(_dryad_S5#11, srtl(*((curr->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) ==> F#srtl(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == F#srtl(_dryad_S5#11, $rd_phys_ptr(_dryad_S5#11, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, srtl_reach(*((curr->next)))))), ==(old(_dryad_S4#10, srtl_reach(*((curr->next)))), old(_dryad_S5#11, srtl_reach(*((curr->next)))))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) ==> F#srtl_reach(_dryad_S4#10, $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == F#srtl_reach(_dryad_S5#11, $rd_phys_ptr(_dryad_S5#11, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node));
            // assume ==(old(_dryad_S4#10, sll_list_len_next(l0)), old(_dryad_S5#11, sll_list_len_next(l0))); 
            assume F#sll_list_len_next(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_list_len_next(_dryad_S5#11, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==(old(_dryad_S4#10, rsrtl_reach(l0)), old(_dryad_S5#11, rsrtl_reach(l0))); 
            assume F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node)) == F#rsrtl_reach(_dryad_S5#11, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==(old(_dryad_S4#10, sll(l0)), old(_dryad_S5#11, sll(l0))); 
            assume F#sll(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll(_dryad_S5#11, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==(old(_dryad_S4#10, sll_reach(l0)), old(_dryad_S5#11, sll_reach(l0))); 
            assume F#sll_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_reach(_dryad_S5#11, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==(old(_dryad_S4#10, srtl_reach(l0)), old(_dryad_S5#11, srtl_reach(l0))); 
            assume F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node)) == F#srtl_reach(_dryad_S5#11, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==(old(_dryad_S4#10, sll_list_len_next(prev)), old(_dryad_S5#11, sll_list_len_next(prev))); 
            assume F#sll_list_len_next(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_list_len_next(_dryad_S5#11, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==(old(_dryad_S4#10, rsrtl_reach(prev)), old(_dryad_S5#11, rsrtl_reach(prev))); 
            assume F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node)) == F#rsrtl_reach(_dryad_S5#11, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==(old(_dryad_S4#10, sll(prev)), old(_dryad_S5#11, sll(prev))); 
            assume F#sll(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node)) == F#sll(_dryad_S5#11, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==(old(_dryad_S4#10, sll_reach(prev)), old(_dryad_S5#11, sll_reach(prev))); 
            assume F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_reach(_dryad_S5#11, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==(old(_dryad_S4#10, srtl_reach(prev)), old(_dryad_S5#11, srtl_reach(prev))); 
            assume F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node)) == F#srtl_reach(_dryad_S5#11, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==(old(_dryad_S4#10, sll_list_len_next(next)), old(_dryad_S5#11, sll_list_len_next(next))); 
            assume F#sll_list_len_next(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node)) == F#sll_list_len_next(_dryad_S5#11, $phys_ptr_cast(L#next, ^s_node));
            // assume ==(old(_dryad_S4#10, rsrtl_reach(next)), old(_dryad_S5#11, rsrtl_reach(next))); 
            assume F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node)) == F#rsrtl_reach(_dryad_S5#11, $phys_ptr_cast(L#next, ^s_node));
            // assume ==(old(_dryad_S4#10, sll(next)), old(_dryad_S5#11, sll(next))); 
            assume F#sll(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node)) == F#sll(_dryad_S5#11, $phys_ptr_cast(L#next, ^s_node));
            // assume ==(old(_dryad_S4#10, sll_reach(next)), old(_dryad_S5#11, sll_reach(next))); 
            assume F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node)) == F#sll_reach(_dryad_S5#11, $phys_ptr_cast(L#next, ^s_node));
            // assume ==(old(_dryad_S4#10, srtl_reach(next)), old(_dryad_S5#11, srtl_reach(next))); 
            assume F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node)) == F#srtl_reach(_dryad_S5#11, $phys_ptr_cast(L#next, ^s_node));
            // assume ==(old(_dryad_S4#10, sll_list_len_next(curr)), old(_dryad_S5#11, sll_list_len_next(curr))); 
            assume F#sll_list_len_next(_dryad_S4#10, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_list_len_next(_dryad_S5#11, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==(old(_dryad_S4#10, rsrtl_reach(curr)), old(_dryad_S5#11, rsrtl_reach(curr))); 
            assume F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(L#curr, ^s_node)) == F#rsrtl_reach(_dryad_S5#11, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==(old(_dryad_S4#10, sll(curr)), old(_dryad_S5#11, sll(curr))); 
            assume F#sll(_dryad_S4#10, $phys_ptr_cast(L#curr, ^s_node)) == F#sll(_dryad_S5#11, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==(old(_dryad_S4#10, sll_reach(curr)), old(_dryad_S5#11, sll_reach(curr))); 
            assume F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_reach(_dryad_S5#11, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==(old(_dryad_S4#10, srtl_reach(curr)), old(_dryad_S5#11, srtl_reach(curr))); 
            assume F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(L#curr, ^s_node)) == F#srtl_reach(_dryad_S5#11, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==(old(_dryad_S4#10, sll_list_len_next(l)), old(_dryad_S5#11, sll_list_len_next(l))); 
            assume F#sll_list_len_next(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node)) == F#sll_list_len_next(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node));
            // assume ==(old(_dryad_S4#10, rsrtl_reach(l)), old(_dryad_S5#11, rsrtl_reach(l))); 
            assume F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl_reach(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node));
            // assume ==(old(_dryad_S4#10, sll(l)), old(_dryad_S5#11, sll(l))); 
            assume F#sll(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node)) == F#sll(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node));
            // assume ==(old(_dryad_S4#10, sll_reach(l)), old(_dryad_S5#11, sll_reach(l))); 
            assume F#sll_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node)) == F#sll_reach(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node));
            // assume ==(old(_dryad_S4#10, srtl_reach(l)), old(_dryad_S5#11, srtl_reach(l))); 
            assume F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node)) == F#srtl_reach(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(l0)))), ==(old(_dryad_S4#10, sll_keys(l0)), old(_dryad_S5#11, sll_keys(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_keys(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_keys(_dryad_S5#11, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(l0)))), ==(old(_dryad_S4#10, sll_list_len_next(l0)), old(_dryad_S5#11, sll_list_len_next(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_list_len_next(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_list_len_next(_dryad_S5#11, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, rsrtl_reach(l0)))), ==(old(_dryad_S4#10, rsrtl(l0)), old(_dryad_S5#11, rsrtl(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#rsrtl(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node)) == F#rsrtl(_dryad_S5#11, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, rsrtl_reach(l0)))), ==(old(_dryad_S4#10, rsrtl_reach(l0)), old(_dryad_S5#11, rsrtl_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node)) == F#rsrtl_reach(_dryad_S5#11, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(l0)))), ==(old(_dryad_S4#10, sll(l0)), old(_dryad_S5#11, sll(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll(_dryad_S5#11, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(l0)))), ==(old(_dryad_S4#10, sll_reach(l0)), old(_dryad_S5#11, sll_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_reach(_dryad_S5#11, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(l0)))), ==(old(_dryad_S4#10, sll_max_key(l0)), old(_dryad_S5#11, sll_max_key(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_max_key(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_max_key(_dryad_S5#11, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(l0)))), ==(old(_dryad_S4#10, sll_min_key(l0)), old(_dryad_S5#11, sll_min_key(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_min_key(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_min_key(_dryad_S5#11, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, srtl_reach(l0)))), ==(old(_dryad_S4#10, srtl(l0)), old(_dryad_S5#11, srtl(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#srtl(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node)) == F#srtl(_dryad_S5#11, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, srtl_reach(l0)))), ==(old(_dryad_S4#10, srtl_reach(l0)), old(_dryad_S5#11, srtl_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(SL#l0, ^s_node)) == F#srtl_reach(_dryad_S5#11, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(prev)))), ==(old(_dryad_S4#10, sll_keys(prev)), old(_dryad_S5#11, sll_keys(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_keys(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_keys(_dryad_S5#11, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(prev)))), ==(old(_dryad_S4#10, sll_list_len_next(prev)), old(_dryad_S5#11, sll_list_len_next(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_list_len_next(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_list_len_next(_dryad_S5#11, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, rsrtl_reach(prev)))), ==(old(_dryad_S4#10, rsrtl(prev)), old(_dryad_S5#11, rsrtl(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node))) ==> F#rsrtl(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node)) == F#rsrtl(_dryad_S5#11, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, rsrtl_reach(prev)))), ==(old(_dryad_S4#10, rsrtl_reach(prev)), old(_dryad_S5#11, rsrtl_reach(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node))) ==> F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node)) == F#rsrtl_reach(_dryad_S5#11, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(prev)))), ==(old(_dryad_S4#10, sll(prev)), old(_dryad_S5#11, sll(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node)) == F#sll(_dryad_S5#11, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(prev)))), ==(old(_dryad_S4#10, sll_reach(prev)), old(_dryad_S5#11, sll_reach(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_reach(_dryad_S5#11, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(prev)))), ==(old(_dryad_S4#10, sll_max_key(prev)), old(_dryad_S5#11, sll_max_key(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_max_key(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_max_key(_dryad_S5#11, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(prev)))), ==(old(_dryad_S4#10, sll_min_key(prev)), old(_dryad_S5#11, sll_min_key(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_min_key(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_min_key(_dryad_S5#11, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, srtl_reach(prev)))), ==(old(_dryad_S4#10, srtl(prev)), old(_dryad_S5#11, srtl(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node)) == F#srtl(_dryad_S5#11, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, srtl_reach(prev)))), ==(old(_dryad_S4#10, srtl_reach(prev)), old(_dryad_S5#11, srtl_reach(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(L#prev, ^s_node)) == F#srtl_reach(_dryad_S5#11, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(next)))), ==(old(_dryad_S4#10, sll_keys(next)), old(_dryad_S5#11, sll_keys(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_keys(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node)) == F#sll_keys(_dryad_S5#11, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(next)))), ==(old(_dryad_S4#10, sll_list_len_next(next)), old(_dryad_S5#11, sll_list_len_next(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_list_len_next(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node)) == F#sll_list_len_next(_dryad_S5#11, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, rsrtl_reach(next)))), ==(old(_dryad_S4#10, rsrtl(next)), old(_dryad_S5#11, rsrtl(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node))) ==> F#rsrtl(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node)) == F#rsrtl(_dryad_S5#11, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, rsrtl_reach(next)))), ==(old(_dryad_S4#10, rsrtl_reach(next)), old(_dryad_S5#11, rsrtl_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node))) ==> F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node)) == F#rsrtl_reach(_dryad_S5#11, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(next)))), ==(old(_dryad_S4#10, sll(next)), old(_dryad_S5#11, sll(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node)) == F#sll(_dryad_S5#11, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(next)))), ==(old(_dryad_S4#10, sll_reach(next)), old(_dryad_S5#11, sll_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node)) == F#sll_reach(_dryad_S5#11, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(next)))), ==(old(_dryad_S4#10, sll_max_key(next)), old(_dryad_S5#11, sll_max_key(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_max_key(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node)) == F#sll_max_key(_dryad_S5#11, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(next)))), ==(old(_dryad_S4#10, sll_min_key(next)), old(_dryad_S5#11, sll_min_key(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_min_key(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node)) == F#sll_min_key(_dryad_S5#11, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, srtl_reach(next)))), ==(old(_dryad_S4#10, srtl(next)), old(_dryad_S5#11, srtl(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node))) ==> F#srtl(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node)) == F#srtl(_dryad_S5#11, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, srtl_reach(next)))), ==(old(_dryad_S4#10, srtl_reach(next)), old(_dryad_S5#11, srtl_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node))) ==> F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(L#next, ^s_node)) == F#srtl_reach(_dryad_S5#11, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(l)))), ==(old(_dryad_S4#10, sll_keys(l)), old(_dryad_S5#11, sll_keys(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_keys(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node)) == F#sll_keys(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(l)))), ==(old(_dryad_S4#10, sll_list_len_next(l)), old(_dryad_S5#11, sll_list_len_next(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_list_len_next(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node)) == F#sll_list_len_next(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, rsrtl_reach(l)))), ==(old(_dryad_S4#10, rsrtl(l)), old(_dryad_S5#11, rsrtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, rsrtl_reach(l)))), ==(old(_dryad_S4#10, rsrtl_reach(l)), old(_dryad_S5#11, rsrtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl_reach(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(l)))), ==(old(_dryad_S4#10, sll(l)), old(_dryad_S5#11, sll(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node)) == F#sll(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(l)))), ==(old(_dryad_S4#10, sll_reach(l)), old(_dryad_S5#11, sll_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node)) == F#sll_reach(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(l)))), ==(old(_dryad_S4#10, sll_max_key(l)), old(_dryad_S5#11, sll_max_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_max_key(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node)) == F#sll_max_key(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_reach(l)))), ==(old(_dryad_S4#10, sll_min_key(l)), old(_dryad_S5#11, sll_min_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_min_key(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node)) == F#sll_min_key(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, srtl_reach(l)))), ==(old(_dryad_S4#10, srtl(l)), old(_dryad_S5#11, srtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node)) == F#srtl(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, srtl_reach(l)))), ==(old(_dryad_S4#10, srtl_reach(l)), old(_dryad_S5#11, srtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node)) == F#srtl_reach(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_lseg_reach(l, prev)))), ==(old(_dryad_S4#10, sll_lseg(l, prev)), old(_dryad_S5#11, sll_lseg(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_lseg_reach(l, prev)))), ==(old(_dryad_S4#10, sll_lseg_reach(l, prev)), old(_dryad_S5#11, sll_lseg_reach(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_reach(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_lseg_reach(l, prev)))), ==(old(_dryad_S4#10, sll_lseg_keys(l, prev)), old(_dryad_S5#11, sll_lseg_keys(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_keys(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_keys(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_lseg_reach(l, prev)))), ==(old(_dryad_S4#10, sll_lseg_len_next(l, prev)), old(_dryad_S5#11, sll_lseg_len_next(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_len_next(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_len_next(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_lseg_reach(l, prev)))), ==(old(_dryad_S4#10, sll_lseg_max_key(l, prev)), old(_dryad_S5#11, sll_lseg_max_key(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_max_key(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_max_key(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, sll_lseg_reach(l, prev)))), ==(old(_dryad_S4#10, sll_lseg_min_key(l, prev)), old(_dryad_S5#11, sll_lseg_min_key(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_min_key(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_min_key(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, srtl_lseg_reach(l, prev)))), ==(old(_dryad_S4#10, srtl_lseg(l, prev)), old(_dryad_S5#11, srtl_lseg(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl_lseg(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#srtl_lseg(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S4#10, srtl_lseg_reach(l, prev)))), ==(old(_dryad_S4#10, srtl_lseg_reach(l, prev)), old(_dryad_S5#11, srtl_lseg_reach(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl_lseg_reach(_dryad_S4#10, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#srtl_lseg_reach(_dryad_S5#11, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, l0)), ==(*((l0->key)), old(_dryad_S4#10, *((l0->key))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(SL#l0, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) == $rd_inv(_dryad_S4#10, s_node.key, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, l0)), @_vcc_ptr_eq_pure(*((l0->next)), old(_dryad_S4#10, *((l0->next))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(SL#l0, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node) == $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, prev)), ==(*((prev->key)), old(_dryad_S4#10, *((prev->key))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(L#prev, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) == $rd_inv(_dryad_S4#10, s_node.key, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, prev)), @_vcc_ptr_eq_pure(*((prev->next)), old(_dryad_S4#10, *((prev->next))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(L#prev, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node) == $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, next)), ==(*((next->key)), old(_dryad_S4#10, *((next->key))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(L#next, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) == $rd_inv(_dryad_S4#10, s_node.key, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, next)), @_vcc_ptr_eq_pure(*((next->next)), old(_dryad_S4#10, *((next->next))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(L#next, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) == $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, l)), ==(*((l->key)), old(_dryad_S4#10, *((l->key))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) == $rd_inv(_dryad_S4#10, s_node.key, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, l)), @_vcc_ptr_eq_pure(*((l->next)), old(_dryad_S4#10, *((l->next))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) == $rd_phys_ptr(_dryad_S4#10, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_keys(l0), @_vcc_intset_union(sll_keys(*((l0->next))), @_vcc_intset_singleton(*((l0->key)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#l0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_list_len_next(l0), unchecked+(sll_list_len_next(*((l0->next))), 1))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#l0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(rsrtl(l0), &&(&&(rsrtl(*((l0->next))), unchecked!(@_vcc_oset_in(l0, rsrtl_reach(*((l0->next)))))), >=(*((l0->key)), sll_max_key(*((l0->next))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(rsrtl_reach(l0), @_vcc_oset_union(rsrtl_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll(l0), &&(sll(*((l0->next))), unchecked!(@_vcc_oset_in(l0, sll_reach(*((l0->next)))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_reach(l0), @_vcc_oset_union(sll_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(sll_max_key(l0), @\int_max(*((l0->key)), sll_max_key(*((l0->next)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(SL#l0, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(sll_min_key(l0), @\int_min(*((l0->key)), sll_min_key(*((l0->next)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(SL#l0, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(srtl(l0), &&(&&(srtl(*((l0->next))), unchecked!(@_vcc_oset_in(l0, srtl_reach(*((l0->next)))))), <=(*((l0->key)), sll_min_key(*((l0->next))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(srtl_reach(l0), @_vcc_oset_union(srtl_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(rsrtl(prev), &&(&&(rsrtl(*((prev->next))), unchecked!(@_vcc_oset_in(prev, rsrtl_reach(*((prev->next)))))), >=(*((prev->key)), sll_max_key(*((prev->next))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(rsrtl_reach(prev), @_vcc_oset_union(rsrtl_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(sll_max_key(prev), @\int_max(*((prev->key)), sll_max_key(*((prev->next)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#prev, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(sll_min_key(prev), @\int_min(*((prev->key)), sll_min_key(*((prev->next)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#prev, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(srtl(prev), &&(&&(srtl(*((prev->next))), unchecked!(@_vcc_oset_in(prev, srtl_reach(*((prev->next)))))), <=(*((prev->key)), sll_min_key(*((prev->next))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(srtl_reach(prev), @_vcc_oset_union(srtl_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_keys(next), @_vcc_intset_union(sll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_list_len_next(next), unchecked+(sll_list_len_next(*((next->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(rsrtl(next), &&(&&(rsrtl(*((next->next))), unchecked!(@_vcc_oset_in(next, rsrtl_reach(*((next->next)))))), >=(*((next->key)), sll_max_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(rsrtl_reach(next), @_vcc_oset_union(rsrtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll(next), &&(sll(*((next->next))), unchecked!(@_vcc_oset_in(next, sll_reach(*((next->next)))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_reach(next), @_vcc_oset_union(sll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_max_key(next), @\int_max(*((next->key)), sll_max_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_min_key(next), @\int_min(*((next->key)), sll_min_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(srtl(next), &&(&&(srtl(*((next->next))), unchecked!(@_vcc_oset_in(next, srtl_reach(*((next->next)))))), <=(*((next->key)), sll_min_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(srtl_reach(next), @_vcc_oset_union(srtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(rsrtl(curr), &&(&&(rsrtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, rsrtl_reach(*((curr->next)))))), >=(*((curr->key)), sll_max_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_max_key(curr), @\int_max(*((curr->key)), sll_max_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(sll_min_key(curr), @\int_min(*((curr->key)), sll_min_key(*((curr->next)))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#curr, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_null(*((curr->next)))), ==(srtl(curr), &&(&&(srtl(*((curr->next))), unchecked!(@_vcc_oset_in(curr, srtl_reach(*((curr->next)))))), <=(*((curr->key)), sll_min_key(*((curr->next))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg(l, prev), &&(sll_lseg(*((l->next)), prev), unchecked!(@_vcc_oset_in(l, sll_lseg_reach(*((l->next)), prev)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg_reach(l, prev), @_vcc_oset_union(sll_lseg_reach(*((l->next)), prev), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg_keys(l, prev), @_vcc_intset_union(sll_lseg_keys(*((l->next)), prev), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg_len_next(l, prev), unchecked+(sll_lseg_len_next(*((l->next)), prev), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), 1);
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), @_vcc_ptr_neq_pure(*((l->next)), prev)), ==(sll_lseg_max_key(l, prev), @\int_max(*((l->key)), sll_lseg_max_key(*((l->next)), prev)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), @_vcc_ptr_neq_pure(*((l->next)), prev)), ==(sll_lseg_min_key(l, prev), @\int_min(*((l->key)), sll_lseg_min_key(*((l->next)), prev)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), @_vcc_ptr_neq_pure(*((l->next)), prev)), ==(srtl_lseg(l, prev), &&(&&(srtl_lseg(*((l->next)), prev), unchecked!(@_vcc_oset_in(l, srtl_lseg_reach(*((l->next)), prev)))), <=(*((l->key)), sll_lseg_min_key(*((l->next)), prev))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(srtl_lseg_reach(l, prev), @_vcc_oset_union(srtl_lseg_reach(*((l->next)), prev), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // _math \state _dryad_S6; 
            // _dryad_S6 := @_vcc_current_state(@state); 
            SL#_dryad_S6 := $current_state($s);
            // _math \state stmtexpr8#26; 
            // stmtexpr8#26 := _dryad_S6; 
            stmtexpr8#26 := SL#_dryad_S6;
            // assert @prim_writes_check((curr->next)); 
            assert $writable_prim($s, #wrTime$3^4.3, $dot($phys_ptr_cast(L#curr, ^s_node), s_node.next));
            // *(curr->next) := next; 
            call $write_int(s_node.next, $phys_ptr_cast(L#curr, ^s_node), $ptr_to_int($phys_ptr_cast(L#next, ^s_node)));
            assume $full_stop_ext(#tok$3^64.4, $s);
            // _math \state _dryad_S7; 
            // _dryad_S7 := @_vcc_current_state(@state); 
            SL#_dryad_S7 := $current_state($s);
            // _math \state stmtexpr9#27; 
            // stmtexpr9#27 := _dryad_S7; 
            stmtexpr9#27 := SL#_dryad_S7;
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(l0)))), ==(old(_dryad_S6, sll_keys(l0)), old(_dryad_S7, sll_keys(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_keys(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_keys(SL#_dryad_S7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(l0)))), ==(old(_dryad_S6, sll_list_len_next(l0)), old(_dryad_S7, sll_list_len_next(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_list_len_next(SL#_dryad_S7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, rsrtl_reach(l0)))), ==(old(_dryad_S6, rsrtl(l0)), old(_dryad_S7, rsrtl(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#rsrtl(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node)) == F#rsrtl(SL#_dryad_S7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, rsrtl_reach(l0)))), ==(old(_dryad_S6, rsrtl_reach(l0)), old(_dryad_S7, rsrtl_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node)) == F#rsrtl_reach(SL#_dryad_S7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(l0)))), ==(old(_dryad_S6, sll(l0)), old(_dryad_S7, sll(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll(SL#_dryad_S7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(l0)))), ==(old(_dryad_S6, sll_reach(l0)), old(_dryad_S7, sll_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_reach(SL#_dryad_S7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(l0)))), ==(old(_dryad_S6, sll_max_key(l0)), old(_dryad_S7, sll_max_key(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_max_key(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_max_key(SL#_dryad_S7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(l0)))), ==(old(_dryad_S6, sll_min_key(l0)), old(_dryad_S7, sll_min_key(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_min_key(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_min_key(SL#_dryad_S7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, srtl_reach(l0)))), ==(old(_dryad_S6, srtl(l0)), old(_dryad_S7, srtl(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#srtl(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node)) == F#srtl(SL#_dryad_S7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, srtl_reach(l0)))), ==(old(_dryad_S6, srtl_reach(l0)), old(_dryad_S7, srtl_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#srtl_reach(SL#_dryad_S6, $phys_ptr_cast(SL#l0, ^s_node)) == F#srtl_reach(SL#_dryad_S7, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(prev)))), ==(old(_dryad_S6, sll_keys(prev)), old(_dryad_S7, sll_keys(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_keys(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_keys(SL#_dryad_S7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(prev)))), ==(old(_dryad_S6, sll_list_len_next(prev)), old(_dryad_S7, sll_list_len_next(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_list_len_next(SL#_dryad_S7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, rsrtl_reach(prev)))), ==(old(_dryad_S6, rsrtl(prev)), old(_dryad_S7, rsrtl(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#rsrtl(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node)) == F#rsrtl(SL#_dryad_S7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, rsrtl_reach(prev)))), ==(old(_dryad_S6, rsrtl_reach(prev)), old(_dryad_S7, rsrtl_reach(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node)) == F#rsrtl_reach(SL#_dryad_S7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(prev)))), ==(old(_dryad_S6, sll(prev)), old(_dryad_S7, sll(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node)) == F#sll(SL#_dryad_S7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(prev)))), ==(old(_dryad_S6, sll_reach(prev)), old(_dryad_S7, sll_reach(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_reach(SL#_dryad_S7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(prev)))), ==(old(_dryad_S6, sll_max_key(prev)), old(_dryad_S7, sll_max_key(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_max_key(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_max_key(SL#_dryad_S7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(prev)))), ==(old(_dryad_S6, sll_min_key(prev)), old(_dryad_S7, sll_min_key(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_min_key(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node)) == F#sll_min_key(SL#_dryad_S7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, srtl_reach(prev)))), ==(old(_dryad_S6, srtl(prev)), old(_dryad_S7, srtl(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node)) == F#srtl(SL#_dryad_S7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, srtl_reach(prev)))), ==(old(_dryad_S6, srtl_reach(prev)), old(_dryad_S7, srtl_reach(prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl_reach(SL#_dryad_S6, $phys_ptr_cast(L#prev, ^s_node)) == F#srtl_reach(SL#_dryad_S7, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(next)))), ==(old(_dryad_S6, sll_keys(next)), old(_dryad_S7, sll_keys(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_keys(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node)) == F#sll_keys(SL#_dryad_S7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(next)))), ==(old(_dryad_S6, sll_list_len_next(next)), old(_dryad_S7, sll_list_len_next(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node)) == F#sll_list_len_next(SL#_dryad_S7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, rsrtl_reach(next)))), ==(old(_dryad_S6, rsrtl(next)), old(_dryad_S7, rsrtl(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node))) ==> F#rsrtl(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node)) == F#rsrtl(SL#_dryad_S7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, rsrtl_reach(next)))), ==(old(_dryad_S6, rsrtl_reach(next)), old(_dryad_S7, rsrtl_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node)) == F#rsrtl_reach(SL#_dryad_S7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(next)))), ==(old(_dryad_S6, sll(next)), old(_dryad_S7, sll(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node)) == F#sll(SL#_dryad_S7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(next)))), ==(old(_dryad_S6, sll_reach(next)), old(_dryad_S7, sll_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node)) == F#sll_reach(SL#_dryad_S7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(next)))), ==(old(_dryad_S6, sll_max_key(next)), old(_dryad_S7, sll_max_key(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_max_key(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node)) == F#sll_max_key(SL#_dryad_S7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(next)))), ==(old(_dryad_S6, sll_min_key(next)), old(_dryad_S7, sll_min_key(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_min_key(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node)) == F#sll_min_key(SL#_dryad_S7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, srtl_reach(next)))), ==(old(_dryad_S6, srtl(next)), old(_dryad_S7, srtl(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node))) ==> F#srtl(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node)) == F#srtl(SL#_dryad_S7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, srtl_reach(next)))), ==(old(_dryad_S6, srtl_reach(next)), old(_dryad_S7, srtl_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node))) ==> F#srtl_reach(SL#_dryad_S6, $phys_ptr_cast(L#next, ^s_node)) == F#srtl_reach(SL#_dryad_S7, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(l)))), ==(old(_dryad_S6, sll_keys(l)), old(_dryad_S7, sll_keys(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_keys(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node)) == F#sll_keys(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(l)))), ==(old(_dryad_S6, sll_list_len_next(l)), old(_dryad_S7, sll_list_len_next(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node)) == F#sll_list_len_next(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, rsrtl_reach(l)))), ==(old(_dryad_S6, rsrtl(l)), old(_dryad_S7, rsrtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, rsrtl_reach(l)))), ==(old(_dryad_S6, rsrtl_reach(l)), old(_dryad_S7, rsrtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#rsrtl_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl_reach(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(l)))), ==(old(_dryad_S6, sll(l)), old(_dryad_S7, sll(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node)) == F#sll(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(l)))), ==(old(_dryad_S6, sll_reach(l)), old(_dryad_S7, sll_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node)) == F#sll_reach(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(l)))), ==(old(_dryad_S6, sll_max_key(l)), old(_dryad_S7, sll_max_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_max_key(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node)) == F#sll_max_key(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_reach(l)))), ==(old(_dryad_S6, sll_min_key(l)), old(_dryad_S7, sll_min_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_min_key(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node)) == F#sll_min_key(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, srtl_reach(l)))), ==(old(_dryad_S6, srtl(l)), old(_dryad_S7, srtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node)) == F#srtl(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, srtl_reach(l)))), ==(old(_dryad_S6, srtl_reach(l)), old(_dryad_S7, srtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node)) == F#srtl_reach(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_lseg_reach(l, prev)))), ==(old(_dryad_S6, sll_lseg(l, prev)), old(_dryad_S7, sll_lseg(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_lseg_reach(l, prev)))), ==(old(_dryad_S6, sll_lseg_reach(l, prev)), old(_dryad_S7, sll_lseg_reach(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_lseg_reach(l, prev)))), ==(old(_dryad_S6, sll_lseg_keys(l, prev)), old(_dryad_S7, sll_lseg_keys(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_lseg_reach(l, prev)))), ==(old(_dryad_S6, sll_lseg_len_next(l, prev)), old(_dryad_S7, sll_lseg_len_next(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_len_next(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_len_next(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_lseg_reach(l, prev)))), ==(old(_dryad_S6, sll_lseg_max_key(l, prev)), old(_dryad_S7, sll_lseg_max_key(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_max_key(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_max_key(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, sll_lseg_reach(l, prev)))), ==(old(_dryad_S6, sll_lseg_min_key(l, prev)), old(_dryad_S7, sll_lseg_min_key(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_min_key(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_min_key(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, srtl_lseg_reach(l, prev)))), ==(old(_dryad_S6, srtl_lseg(l, prev)), old(_dryad_S7, srtl_lseg(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl_lseg(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#srtl_lseg(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S6, srtl_lseg_reach(l, prev)))), ==(old(_dryad_S6, srtl_lseg_reach(l, prev)), old(_dryad_S7, srtl_lseg_reach(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#srtl_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl_lseg_reach(SL#_dryad_S6, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#srtl_lseg_reach(SL#_dryad_S7, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, l0)), ==(*((l0->key)), old(_dryad_S6, *((l0->key))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(SL#l0, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) == $rd_inv(SL#_dryad_S6, s_node.key, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, l0)), @_vcc_ptr_eq_pure(*((l0->next)), old(_dryad_S6, *((l0->next))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(SL#l0, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S6, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, prev)), ==(*((prev->key)), old(_dryad_S6, *((prev->key))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(L#prev, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) == $rd_inv(SL#_dryad_S6, s_node.key, $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, prev)), @_vcc_ptr_eq_pure(*((prev->next)), old(_dryad_S6, *((prev->next))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(L#prev, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S6, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, next)), ==(*((next->key)), old(_dryad_S6, *((next->key))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(L#next, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) == $rd_inv(SL#_dryad_S6, s_node.key, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, next)), @_vcc_ptr_eq_pure(*((next->next)), old(_dryad_S6, *((next->next))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(L#next, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S6, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, l)), ==(*((l->key)), old(_dryad_S6, *((l->key))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) == $rd_inv(SL#_dryad_S6, s_node.key, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(curr, l)), @_vcc_ptr_eq_pure(*((l->next)), old(_dryad_S6, *((l->next))))); 
            assume !($phys_ptr_cast(L#curr, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S6, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_keys(l0), @_vcc_intset_union(sll_keys(*((l0->next))), @_vcc_intset_singleton(*((l0->key)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#l0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_list_len_next(l0), unchecked+(sll_list_len_next(*((l0->next))), 1))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#l0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(rsrtl(l0), &&(&&(rsrtl(*((l0->next))), unchecked!(@_vcc_oset_in(l0, rsrtl_reach(*((l0->next)))))), >=(*((l0->key)), sll_max_key(*((l0->next))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(rsrtl_reach(l0), @_vcc_oset_union(rsrtl_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll(l0), &&(sll(*((l0->next))), unchecked!(@_vcc_oset_in(l0, sll_reach(*((l0->next)))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_reach(l0), @_vcc_oset_union(sll_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(sll_max_key(l0), @\int_max(*((l0->key)), sll_max_key(*((l0->next)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(SL#l0, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(sll_min_key(l0), @\int_min(*((l0->key)), sll_min_key(*((l0->next)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(SL#l0, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(srtl(l0), &&(&&(srtl(*((l0->next))), unchecked!(@_vcc_oset_in(l0, srtl_reach(*((l0->next)))))), <=(*((l0->key)), sll_min_key(*((l0->next))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(srtl_reach(l0), @_vcc_oset_union(srtl_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(rsrtl(prev), &&(&&(rsrtl(*((prev->next))), unchecked!(@_vcc_oset_in(prev, rsrtl_reach(*((prev->next)))))), >=(*((prev->key)), sll_max_key(*((prev->next))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(rsrtl_reach(prev), @_vcc_oset_union(rsrtl_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(sll_max_key(prev), @\int_max(*((prev->key)), sll_max_key(*((prev->next)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#prev, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(sll_min_key(prev), @\int_min(*((prev->key)), sll_min_key(*((prev->next)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#prev, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(srtl(prev), &&(&&(srtl(*((prev->next))), unchecked!(@_vcc_oset_in(prev, srtl_reach(*((prev->next)))))), <=(*((prev->key)), sll_min_key(*((prev->next))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(srtl_reach(prev), @_vcc_oset_union(srtl_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_keys(next), @_vcc_intset_union(sll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_list_len_next(next), unchecked+(sll_list_len_next(*((next->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(rsrtl(next), &&(&&(rsrtl(*((next->next))), unchecked!(@_vcc_oset_in(next, rsrtl_reach(*((next->next)))))), >=(*((next->key)), sll_max_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(rsrtl_reach(next), @_vcc_oset_union(rsrtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll(next), &&(sll(*((next->next))), unchecked!(@_vcc_oset_in(next, sll_reach(*((next->next)))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_reach(next), @_vcc_oset_union(sll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_max_key(next), @\int_max(*((next->key)), sll_max_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_min_key(next), @\int_min(*((next->key)), sll_min_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(srtl(next), &&(&&(srtl(*((next->next))), unchecked!(@_vcc_oset_in(next, srtl_reach(*((next->next)))))), <=(*((next->key)), sll_min_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(srtl_reach(next), @_vcc_oset_union(srtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
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
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_keys(next), @_vcc_intset_union(sll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_list_len_next(next), unchecked+(sll_list_len_next(*((next->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(rsrtl(next), &&(&&(rsrtl(*((next->next))), unchecked!(@_vcc_oset_in(next, rsrtl_reach(*((next->next)))))), >=(*((next->key)), sll_max_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(rsrtl_reach(next), @_vcc_oset_union(rsrtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll(next), &&(sll(*((next->next))), unchecked!(@_vcc_oset_in(next, sll_reach(*((next->next)))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_reach(next), @_vcc_oset_union(sll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_max_key(next), @\int_max(*((next->key)), sll_max_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_min_key(next), @\int_min(*((next->key)), sll_min_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(srtl(next), &&(&&(srtl(*((next->next))), unchecked!(@_vcc_oset_in(next, srtl_reach(*((next->next)))))), <=(*((next->key)), sll_min_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(srtl_reach(next), @_vcc_oset_union(srtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg(l, prev), &&(sll_lseg(*((l->next)), prev), unchecked!(@_vcc_oset_in(l, sll_lseg_reach(*((l->next)), prev)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg_reach(l, prev), @_vcc_oset_union(sll_lseg_reach(*((l->next)), prev), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg_keys(l, prev), @_vcc_intset_union(sll_lseg_keys(*((l->next)), prev), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(sll_lseg_len_next(l, prev), unchecked+(sll_lseg_len_next(*((l->next)), prev), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_len_next($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_lseg_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), 1);
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), @_vcc_ptr_neq_pure(*((l->next)), prev)), ==(sll_lseg_max_key(l, prev), @\int_max(*((l->key)), sll_lseg_max_key(*((l->next)), prev)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_max_key($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_lseg_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), @_vcc_ptr_neq_pure(*((l->next)), prev)), ==(sll_lseg_min_key(l, prev), @\int_min(*((l->key)), sll_lseg_min_key(*((l->next)), prev)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#sll_lseg_min_key($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), @_vcc_ptr_neq_pure(*((l->next)), prev)), ==(srtl_lseg(l, prev), &&(&&(srtl_lseg(*((l->next)), prev), unchecked!(@_vcc_oset_in(l, srtl_lseg_reach(*((l->next)), prev)))), <=(*((l->key)), sll_lseg_min_key(*((l->next)), prev))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) && $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#srtl_lseg($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == (F#srtl_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_lseg_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_pure(l, prev)), ==(srtl_lseg_reach(l, prev), @_vcc_oset_union(srtl_lseg_reach(*((l->next)), prev), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $phys_ptr_cast(P#l, ^s_node) != $phys_ptr_cast(L#prev, ^s_node) ==> F#srtl_lseg_reach($s, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#srtl_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node), $phys_ptr_cast(L#prev, ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // _math \state _dryad_S8; 
            // _dryad_S8 := @_vcc_current_state(@state); 
            SL#_dryad_S8 := $current_state($s);
            // _math \state stmtexpr10#28; 
            // stmtexpr10#28 := _dryad_S8; 
            stmtexpr10#28 := SL#_dryad_S8;
            // assert @prim_writes_check((prev->next)); 
            assert $writable_prim($s, #wrTime$3^4.3, $dot($phys_ptr_cast(L#prev, ^s_node), s_node.next));
            // *(prev->next) := curr; 
            call $write_int(s_node.next, $phys_ptr_cast(L#prev, ^s_node), $ptr_to_int($phys_ptr_cast(L#curr, ^s_node)));
            assume $full_stop_ext(#tok$3^65.4, $s);
            // _math \state _dryad_S9; 
            // _dryad_S9 := @_vcc_current_state(@state); 
            SL#_dryad_S9 := $current_state($s);
            // _math \state stmtexpr11#29; 
            // stmtexpr11#29 := _dryad_S9; 
            stmtexpr11#29 := SL#_dryad_S9;
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(l0)))), ==(old(_dryad_S8, sll_keys(l0)), old(_dryad_S9, sll_keys(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_keys(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_keys(SL#_dryad_S9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(l0)))), ==(old(_dryad_S8, sll_list_len_next(l0)), old(_dryad_S9, sll_list_len_next(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_list_len_next(SL#_dryad_S9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, rsrtl_reach(l0)))), ==(old(_dryad_S8, rsrtl(l0)), old(_dryad_S9, rsrtl(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#rsrtl_reach(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#rsrtl(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node)) == F#rsrtl(SL#_dryad_S9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, rsrtl_reach(l0)))), ==(old(_dryad_S8, rsrtl_reach(l0)), old(_dryad_S9, rsrtl_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#rsrtl_reach(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node)) == F#rsrtl_reach(SL#_dryad_S9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(l0)))), ==(old(_dryad_S8, sll(l0)), old(_dryad_S9, sll(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll(SL#_dryad_S9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(l0)))), ==(old(_dryad_S8, sll_reach(l0)), old(_dryad_S9, sll_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_reach(SL#_dryad_S9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(l0)))), ==(old(_dryad_S8, sll_max_key(l0)), old(_dryad_S9, sll_max_key(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_max_key(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_max_key(SL#_dryad_S9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(l0)))), ==(old(_dryad_S8, sll_min_key(l0)), old(_dryad_S9, sll_min_key(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_min_key(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_min_key(SL#_dryad_S9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, srtl_reach(l0)))), ==(old(_dryad_S8, srtl(l0)), old(_dryad_S9, srtl(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_reach(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#srtl(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node)) == F#srtl(SL#_dryad_S9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, srtl_reach(l0)))), ==(old(_dryad_S8, srtl_reach(l0)), old(_dryad_S9, srtl_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_reach(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#srtl_reach(SL#_dryad_S8, $phys_ptr_cast(SL#l0, ^s_node)) == F#srtl_reach(SL#_dryad_S9, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(next)))), ==(old(_dryad_S8, sll_keys(next)), old(_dryad_S9, sll_keys(next)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_keys(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node)) == F#sll_keys(SL#_dryad_S9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(next)))), ==(old(_dryad_S8, sll_list_len_next(next)), old(_dryad_S9, sll_list_len_next(next)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node)) == F#sll_list_len_next(SL#_dryad_S9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, rsrtl_reach(next)))), ==(old(_dryad_S8, rsrtl(next)), old(_dryad_S9, rsrtl(next)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#rsrtl_reach(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node))) ==> F#rsrtl(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node)) == F#rsrtl(SL#_dryad_S9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, rsrtl_reach(next)))), ==(old(_dryad_S8, rsrtl_reach(next)), old(_dryad_S9, rsrtl_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#rsrtl_reach(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node)) == F#rsrtl_reach(SL#_dryad_S9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(next)))), ==(old(_dryad_S8, sll(next)), old(_dryad_S9, sll(next)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node)) == F#sll(SL#_dryad_S9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(next)))), ==(old(_dryad_S8, sll_reach(next)), old(_dryad_S9, sll_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node)) == F#sll_reach(SL#_dryad_S9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(next)))), ==(old(_dryad_S8, sll_max_key(next)), old(_dryad_S9, sll_max_key(next)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_max_key(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node)) == F#sll_max_key(SL#_dryad_S9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(next)))), ==(old(_dryad_S8, sll_min_key(next)), old(_dryad_S9, sll_min_key(next)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node))) ==> F#sll_min_key(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node)) == F#sll_min_key(SL#_dryad_S9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, srtl_reach(next)))), ==(old(_dryad_S8, srtl(next)), old(_dryad_S9, srtl(next)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_reach(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node))) ==> F#srtl(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node)) == F#srtl(SL#_dryad_S9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, srtl_reach(next)))), ==(old(_dryad_S8, srtl_reach(next)), old(_dryad_S9, srtl_reach(next)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_reach(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node))) ==> F#srtl_reach(SL#_dryad_S8, $phys_ptr_cast(L#next, ^s_node)) == F#srtl_reach(SL#_dryad_S9, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(curr)))), ==(old(_dryad_S8, sll_keys(curr)), old(_dryad_S9, sll_keys(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_keys(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_keys(SL#_dryad_S9, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(curr)))), ==(old(_dryad_S8, sll_list_len_next(curr)), old(_dryad_S9, sll_list_len_next(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_list_len_next(SL#_dryad_S9, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, rsrtl_reach(curr)))), ==(old(_dryad_S8, rsrtl(curr)), old(_dryad_S9, rsrtl(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#rsrtl_reach(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node))) ==> F#rsrtl(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node)) == F#rsrtl(SL#_dryad_S9, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, rsrtl_reach(curr)))), ==(old(_dryad_S8, rsrtl_reach(curr)), old(_dryad_S9, rsrtl_reach(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#rsrtl_reach(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node)) == F#rsrtl_reach(SL#_dryad_S9, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(curr)))), ==(old(_dryad_S8, sll(curr)), old(_dryad_S9, sll(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node)) == F#sll(SL#_dryad_S9, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(curr)))), ==(old(_dryad_S8, sll_reach(curr)), old(_dryad_S9, sll_reach(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_reach(SL#_dryad_S9, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(curr)))), ==(old(_dryad_S8, sll_max_key(curr)), old(_dryad_S9, sll_max_key(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_max_key(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_max_key(SL#_dryad_S9, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(curr)))), ==(old(_dryad_S8, sll_min_key(curr)), old(_dryad_S9, sll_min_key(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_min_key(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node)) == F#sll_min_key(SL#_dryad_S9, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, srtl_reach(curr)))), ==(old(_dryad_S8, srtl(curr)), old(_dryad_S9, srtl(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_reach(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node))) ==> F#srtl(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node)) == F#srtl(SL#_dryad_S9, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, srtl_reach(curr)))), ==(old(_dryad_S8, srtl_reach(curr)), old(_dryad_S9, srtl_reach(curr)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_reach(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node))) ==> F#srtl_reach(SL#_dryad_S8, $phys_ptr_cast(L#curr, ^s_node)) == F#srtl_reach(SL#_dryad_S9, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(l)))), ==(old(_dryad_S8, sll_keys(l)), old(_dryad_S9, sll_keys(l)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_keys(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node)) == F#sll_keys(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(l)))), ==(old(_dryad_S8, sll_list_len_next(l)), old(_dryad_S9, sll_list_len_next(l)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node)) == F#sll_list_len_next(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, rsrtl_reach(l)))), ==(old(_dryad_S8, rsrtl(l)), old(_dryad_S9, rsrtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#rsrtl_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, rsrtl_reach(l)))), ==(old(_dryad_S8, rsrtl_reach(l)), old(_dryad_S9, rsrtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#rsrtl_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node)) == F#rsrtl_reach(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(l)))), ==(old(_dryad_S8, sll(l)), old(_dryad_S9, sll(l)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node)) == F#sll(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(l)))), ==(old(_dryad_S8, sll_reach(l)), old(_dryad_S9, sll_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node)) == F#sll_reach(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(l)))), ==(old(_dryad_S8, sll_max_key(l)), old(_dryad_S9, sll_max_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_max_key(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node)) == F#sll_max_key(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_reach(l)))), ==(old(_dryad_S8, sll_min_key(l)), old(_dryad_S9, sll_min_key(l)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node))) ==> F#sll_min_key(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node)) == F#sll_min_key(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, srtl_reach(l)))), ==(old(_dryad_S8, srtl(l)), old(_dryad_S9, srtl(l)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node)) == F#srtl(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, srtl_reach(l)))), ==(old(_dryad_S8, srtl_reach(l)), old(_dryad_S9, srtl_reach(l)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node))) ==> F#srtl_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node)) == F#srtl_reach(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_lseg_reach(l, prev)))), ==(old(_dryad_S8, sll_lseg(l, prev)), old(_dryad_S9, sll_lseg(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_lseg_reach(l, prev)))), ==(old(_dryad_S8, sll_lseg_reach(l, prev)), old(_dryad_S9, sll_lseg_reach(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_lseg_reach(l, prev)))), ==(old(_dryad_S8, sll_lseg_keys(l, prev)), old(_dryad_S9, sll_lseg_keys(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_lseg_reach(l, prev)))), ==(old(_dryad_S8, sll_lseg_len_next(l, prev)), old(_dryad_S9, sll_lseg_len_next(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_len_next(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_len_next(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_lseg_reach(l, prev)))), ==(old(_dryad_S8, sll_lseg_max_key(l, prev)), old(_dryad_S9, sll_lseg_max_key(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_max_key(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_max_key(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, sll_lseg_reach(l, prev)))), ==(old(_dryad_S8, sll_lseg_min_key(l, prev)), old(_dryad_S9, sll_lseg_min_key(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_lseg_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#sll_lseg_min_key(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#sll_lseg_min_key(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, srtl_lseg_reach(l, prev)))), ==(old(_dryad_S8, srtl_lseg(l, prev)), old(_dryad_S9, srtl_lseg(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_lseg_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl_lseg(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#srtl_lseg(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(prev, old(_dryad_S8, srtl_lseg_reach(l, prev)))), ==(old(_dryad_S8, srtl_lseg_reach(l, prev)), old(_dryad_S9, srtl_lseg_reach(l, prev)))); 
            assume !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_lseg_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node))) ==> F#srtl_lseg_reach(SL#_dryad_S8, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node)) == F#srtl_lseg_reach(SL#_dryad_S9, $phys_ptr_cast(P#l, ^s_node), $phys_ptr_cast(L#prev, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(prev, l0)), ==(*((l0->key)), old(_dryad_S8, *((l0->key))))); 
            assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(SL#l0, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) == $rd_inv(SL#_dryad_S8, s_node.key, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(prev, l0)), @_vcc_ptr_eq_pure(*((l0->next)), old(_dryad_S8, *((l0->next))))); 
            assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(SL#l0, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S8, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(prev, next)), ==(*((next->key)), old(_dryad_S8, *((next->key))))); 
            assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(L#next, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) == $rd_inv(SL#_dryad_S8, s_node.key, $phys_ptr_cast(L#next, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(prev, next)), @_vcc_ptr_eq_pure(*((next->next)), old(_dryad_S8, *((next->next))))); 
            assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(L#next, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S8, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(prev, curr)), ==(*((curr->key)), old(_dryad_S8, *((curr->key))))); 
            assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(L#curr, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node)) == $rd_inv(SL#_dryad_S8, s_node.key, $phys_ptr_cast(L#curr, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(prev, curr)), @_vcc_ptr_eq_pure(*((curr->next)), old(_dryad_S8, *((curr->next))))); 
            assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(L#curr, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S8, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(prev, l)), ==(*((l->key)), old(_dryad_S8, *((l->key))))); 
            assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) == $rd_inv(SL#_dryad_S8, s_node.key, $phys_ptr_cast(P#l, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(prev, l)), @_vcc_ptr_eq_pure(*((l->next)), old(_dryad_S8, *((l->next))))); 
            assume !($phys_ptr_cast(L#prev, ^s_node) == $phys_ptr_cast(P#l, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S8, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_keys(l0), @_vcc_intset_union(sll_keys(*((l0->next))), @_vcc_intset_singleton(*((l0->key)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#l0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_list_len_next(l0), unchecked+(sll_list_len_next(*((l0->next))), 1))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(SL#l0, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(rsrtl(l0), &&(&&(rsrtl(*((l0->next))), unchecked!(@_vcc_oset_in(l0, rsrtl_reach(*((l0->next)))))), >=(*((l0->key)), sll_max_key(*((l0->next))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(rsrtl_reach(l0), @_vcc_oset_union(rsrtl_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll(l0), &&(sll(*((l0->next))), unchecked!(@_vcc_oset_in(l0, sll_reach(*((l0->next)))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(sll_reach(l0), @_vcc_oset_union(sll_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(sll_max_key(l0), @\int_max(*((l0->key)), sll_max_key(*((l0->next)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(SL#l0, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(sll_min_key(l0), @\int_min(*((l0->key)), sll_min_key(*((l0->next)))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(SL#l0, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l0), @_vcc_ptr_neq_null(*((l0->next)))), ==(srtl(l0), &&(&&(srtl(*((l0->next))), unchecked!(@_vcc_oset_in(l0, srtl_reach(*((l0->next)))))), <=(*((l0->key)), sll_min_key(*((l0->next))))))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(SL#l0, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#l0, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l0), ==(srtl_reach(l0), @_vcc_oset_union(srtl_reach(*((l0->next))), @_vcc_oset_singleton(l0)))); 
            assume $non_null($phys_ptr_cast(SL#l0, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(SL#l0, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(SL#l0, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_keys(next), @_vcc_intset_union(sll_keys(*((next->next))), @_vcc_intset_singleton(*((next->key)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#next, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_list_len_next(next), unchecked+(sll_list_len_next(*((next->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#next, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(rsrtl(next), &&(&&(rsrtl(*((next->next))), unchecked!(@_vcc_oset_in(next, rsrtl_reach(*((next->next)))))), >=(*((next->key)), sll_max_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(rsrtl_reach(next), @_vcc_oset_union(rsrtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll(next), &&(sll(*((next->next))), unchecked!(@_vcc_oset_in(next, sll_reach(*((next->next)))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#next, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(sll_reach(next), @_vcc_oset_union(sll_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_max_key(next), @\int_max(*((next->key)), sll_max_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(sll_min_key(next), @\int_min(*((next->key)), sll_min_key(*((next->next)))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#next, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(next), @_vcc_ptr_neq_null(*((next->next)))), ==(srtl(next), &&(&&(srtl(*((next->next))), unchecked!(@_vcc_oset_in(next, srtl_reach(*((next->next)))))), <=(*((next->key)), sll_min_key(*((next->next))))))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#next, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#next, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#next, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(next), ==(srtl_reach(next), @_vcc_oset_union(srtl_reach(*((next->next))), @_vcc_oset_singleton(next)))); 
            assume $non_null($phys_ptr_cast(L#next, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#next, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#next, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#next, ^s_node)));
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
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_keys(l), @_vcc_intset_union(sll_keys(*((l->next))), @_vcc_intset_singleton(*((l->key)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_list_len_next(l), unchecked+(sll_list_len_next(*((l->next))), 1))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(P#l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(rsrtl(l), &&(&&(rsrtl(*((l->next))), unchecked!(@_vcc_oset_in(l, rsrtl_reach(*((l->next)))))), >=(*((l->key)), sll_max_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(rsrtl_reach(l), @_vcc_oset_union(rsrtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll(l), &&(sll(*((l->next))), unchecked!(@_vcc_oset_in(l, sll_reach(*((l->next)))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(sll_reach(l), @_vcc_oset_union(sll_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_max_key(l), @\int_max(*((l->key)), sll_max_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(sll_min_key(l), @\int_min(*((l->key)), sll_min_key(*((l->next)))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(P#l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(l), @_vcc_ptr_neq_null(*((l->next)))), ==(srtl(l), &&(&&(srtl(*((l->next))), unchecked!(@_vcc_oset_in(l, srtl_reach(*((l->next)))))), <=(*((l->key)), sll_min_key(*((l->next))))))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(P#l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(P#l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(l), ==(srtl_reach(l), @_vcc_oset_union(srtl_reach(*((l->next))), @_vcc_oset_singleton(l)))); 
            assume $non_null($phys_ptr_cast(P#l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(P#l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(P#l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_keys(prev), @_vcc_intset_union(sll_keys(*((prev->next))), @_vcc_intset_singleton(*((prev->key)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#prev, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_list_len_next(prev), unchecked+(sll_list_len_next(*((prev->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#prev, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(rsrtl(prev), &&(&&(rsrtl(*((prev->next))), unchecked!(@_vcc_oset_in(prev, rsrtl_reach(*((prev->next)))))), >=(*((prev->key)), sll_max_key(*((prev->next))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(rsrtl_reach(prev), @_vcc_oset_union(rsrtl_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll(prev), &&(sll(*((prev->next))), unchecked!(@_vcc_oset_in(prev, sll_reach(*((prev->next)))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(sll_reach(prev), @_vcc_oset_union(sll_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(sll_max_key(prev), @\int_max(*((prev->key)), sll_max_key(*((prev->next)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#prev, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(sll_min_key(prev), @\int_min(*((prev->key)), sll_min_key(*((prev->next)))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#prev, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(prev), @_vcc_ptr_neq_null(*((prev->next)))), ==(srtl(prev), &&(&&(srtl(*((prev->next))), unchecked!(@_vcc_oset_in(prev, srtl_reach(*((prev->next)))))), <=(*((prev->key)), sll_min_key(*((prev->next))))))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#prev, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#prev, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#prev, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(prev), ==(srtl_reach(prev), @_vcc_oset_union(srtl_reach(*((prev->next))), @_vcc_oset_singleton(prev)))); 
            assume $non_null($phys_ptr_cast(L#prev, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#prev, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#prev, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#prev, ^s_node)));
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
            // return l; 
            $result := $phys_ptr_cast(P#l, ^s_node);
            assume true;
            assert $position_marker();
            goto #exit;
        }
    }

  anon13:
    // skip

  #exit:
}



axiom (forall Q#__vcc_state$2^687.9#tc2#1704: $state, Q#x$2^687.9#dt1#1622: $ptr :: {:weight 10} { F#srtl(Q#__vcc_state$2^687.9#tc2#1704, $phys_ptr_cast(Q#x$2^687.9#dt1#1622, ^s_node)) } { F#sll(Q#__vcc_state$2^687.9#tc2#1704, $phys_ptr_cast(Q#x$2^687.9#dt1#1622, ^s_node)) } $good_state(Q#__vcc_state$2^687.9#tc2#1704) && true ==> F#srtl(Q#__vcc_state$2^687.9#tc2#1704, $phys_ptr_cast(Q#x$2^687.9#dt1#1622, ^s_node)) ==> F#sll(Q#__vcc_state$2^687.9#tc2#1704, $phys_ptr_cast(Q#x$2^687.9#dt1#1622, ^s_node)));

axiom (forall Q#__vcc_state$2^688.9#tc2#1705: $state, Q#x$2^688.9#dt1#1623: $ptr :: {:weight 10} { F#rsrtl(Q#__vcc_state$2^688.9#tc2#1705, $phys_ptr_cast(Q#x$2^688.9#dt1#1623, ^s_node)) } { F#sll(Q#__vcc_state$2^688.9#tc2#1705, $phys_ptr_cast(Q#x$2^688.9#dt1#1623, ^s_node)) } $good_state(Q#__vcc_state$2^688.9#tc2#1705) && true ==> F#rsrtl(Q#__vcc_state$2^688.9#tc2#1705, $phys_ptr_cast(Q#x$2^688.9#dt1#1623, ^s_node)) ==> F#sll(Q#__vcc_state$2^688.9#tc2#1705, $phys_ptr_cast(Q#x$2^688.9#dt1#1623, ^s_node)));

axiom (forall Q#__vcc_state$2^689.9#tc2#1706: $state, Q#x$2^689.9#dt1#1624: $ptr :: {:weight 10} { F#sll_reach(Q#__vcc_state$2^689.9#tc2#1706, $phys_ptr_cast(Q#x$2^689.9#dt1#1624, ^s_node)) } { F#srtl_reach(Q#__vcc_state$2^689.9#tc2#1706, $phys_ptr_cast(Q#x$2^689.9#dt1#1624, ^s_node)) } $good_state(Q#__vcc_state$2^689.9#tc2#1706) && true ==> F#sll_reach(Q#__vcc_state$2^689.9#tc2#1706, $phys_ptr_cast(Q#x$2^689.9#dt1#1624, ^s_node)) == F#srtl_reach(Q#__vcc_state$2^689.9#tc2#1706, $phys_ptr_cast(Q#x$2^689.9#dt1#1624, ^s_node)));

axiom (forall Q#__vcc_state$2^690.9#tc2#1707: $state, Q#x$2^690.9#dt1#1625: $ptr :: {:weight 10} { F#srtl_reach(Q#__vcc_state$2^690.9#tc2#1707, $phys_ptr_cast(Q#x$2^690.9#dt1#1625, ^s_node)) } { F#rsrtl_reach(Q#__vcc_state$2^690.9#tc2#1707, $phys_ptr_cast(Q#x$2^690.9#dt1#1625, ^s_node)) } $good_state(Q#__vcc_state$2^690.9#tc2#1707) && true ==> F#srtl_reach(Q#__vcc_state$2^690.9#tc2#1707, $phys_ptr_cast(Q#x$2^690.9#dt1#1625, ^s_node)) == F#rsrtl_reach(Q#__vcc_state$2^690.9#tc2#1707, $phys_ptr_cast(Q#x$2^690.9#dt1#1625, ^s_node)));

axiom (forall Q#__vcc_state$2^691.9#tc2#1708: $state, Q#x$2^691.9#dt1#1626: $ptr, Q#y$2^691.9#dt1#1627: $ptr :: {:weight 10} { F#sll_lseg_reach(Q#__vcc_state$2^691.9#tc2#1708, $phys_ptr_cast(Q#x$2^691.9#dt1#1626, ^s_node), $phys_ptr_cast(Q#y$2^691.9#dt1#1627, ^s_node)) } { F#srtl_lseg_reach(Q#__vcc_state$2^691.9#tc2#1708, $phys_ptr_cast(Q#x$2^691.9#dt1#1626, ^s_node), $phys_ptr_cast(Q#y$2^691.9#dt1#1627, ^s_node)) } $good_state(Q#__vcc_state$2^691.9#tc2#1708) && true ==> F#sll_lseg_reach(Q#__vcc_state$2^691.9#tc2#1708, $phys_ptr_cast(Q#x$2^691.9#dt1#1626, ^s_node), $phys_ptr_cast(Q#y$2^691.9#dt1#1627, ^s_node)) == F#srtl_lseg_reach(Q#__vcc_state$2^691.9#tc2#1708, $phys_ptr_cast(Q#x$2^691.9#dt1#1626, ^s_node), $phys_ptr_cast(Q#y$2^691.9#dt1#1627, ^s_node)));

const unique l#public: $label;

axiom $type_code_is(2, ^$#state_t);

const unique #tok$3^65.4: $token;

const unique #tok$3^64.4: $token;

const unique #tok$3^63.4: $token;

const unique #tok$3^62.7: $token;

const unique #tok$3^60.18: $token;

const unique #tok$3^37.4: $token;

const unique #tok$3^28.4: $token;

const unique #tok$3^27.4: $token;

const unique #tok$3^24.16: $token;

const unique #tok$3^18.3: $token;

const unique #tok$3^17.3: $token;

const unique #tok$3^14.15: $token;

const unique #tok$4^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(4, #file^?3Cno?20file?3E);

const unique #tok$3^4.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Csorted?2Dsll?5Csorted_insert_iter.c: $token;

axiom $file_name_is(3, #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Csorted?2Dsll?5Csorted_insert_iter.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Csorted?2Dsll?5Cdryad_srtl.h: $token;

axiom $file_name_is(2, #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Csorted?2Dsll?5Cdryad_srtl.h);

const unique #file^Z?3A?5CInvariantSynthesis?5CVCDryad?2Dbin?5CHeaders?5Cvccp.h: $token;

axiom $file_name_is(1, #file^Z?3A?5CInvariantSynthesis?5CVCDryad?2Dbin?5CHeaders?5Cvccp.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^s_node);

