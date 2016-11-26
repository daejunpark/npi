
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

const unique ^$#reverse_sorted.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#reverse_sorted.c..36263#3);

type $#reverse_sorted.c..36263#3;

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



procedure reverse_sorted(P#l: $ptr) returns ($result: $ptr);
  requires F#srtl($s, $phys_ptr_cast(P#l, ^s_node));
  modifies $s, $cev_pc;
  ensures F#rsrtl($s, $phys_ptr_cast($result, ^s_node));
  ensures F#sll_keys($s, $phys_ptr_cast($result, ^s_node)) == F#sll_keys(old($s), $phys_ptr_cast(P#l, ^s_node));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation reverse_sorted(P#l: $ptr) returns ($result: $ptr)
{
  var stmtexpr2#4: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr1#3: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr0#2: $ptr;
  var SL#l0: $ptr;
  var L#t: $ptr;
  var loopState#0: $state;
  var L#r: $ptr;
  var stmtexpr1#6: $oset;
  var stmtexpr0#5: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var local.l: $ptr;
  var #wrTime$2^3.3: int;
  var #stackframe: int;

// INV:PTR: P#l, L#r, local.l
// INV:INT:
// INV:LST: srtl
// INV:LST3: rsrtl

  anon4:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$2^3.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$2^3.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$2^3.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    // struct s_node* local.l; 
    // local.l := l; 
    local.l := $phys_ptr_cast(P#l, ^s_node);
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := srtl_reach(local.l); 
    call SL#_dryad_G0 := srtl_reach($phys_ptr_cast(local.l, ^s_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _math \oset stmtexpr0#5; 
    // stmtexpr0#5 := _dryad_G0; 
    stmtexpr0#5 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#6; 
    // stmtexpr1#6 := _dryad_G1; 
    stmtexpr1#6 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_keys(local.l), @_vcc_intset_union(sll_keys(*((local.l->next))), @_vcc_intset_singleton(*((local.l->key)))))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_list_len_next(local.l), unchecked+(sll_list_len_next(*((local.l->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(rsrtl(local.l), &&(&&(rsrtl(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, rsrtl_reach(*((local.l->next)))))), >=(*((local.l->key)), sll_max_key(*((local.l->next))))))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.l), ==(rsrtl_reach(local.l), @_vcc_oset_union(rsrtl_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll(local.l), &&(sll(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, sll_reach(*((local.l->next)))))))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_reach(local.l), @_vcc_oset_union(sll_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(sll_max_key(local.l), @\int_max(*((local.l->key)), sll_max_key(*((local.l->next)))))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(sll_min_key(local.l), @\int_min(*((local.l->key)), sll_min_key(*((local.l->next)))))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(srtl(local.l), &&(&&(srtl(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, srtl_reach(*((local.l->next)))))), <=(*((local.l->key)), sll_min_key(*((local.l->next))))))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.l), ==(srtl_reach(local.l), @_vcc_oset_union(srtl_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
    // struct s_node* r; 
    // assume ==>(@_vcc_ptr_neq_null(local.l), &&(@_vcc_mutable(@state, local.l), @writes_check(local.l))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.l, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.l, ^s_node));
    // r := (struct s_node*)@null; 
    L#r := $phys_ptr_cast($null, ^s_node);
    // assert sll_lseg(r, r); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#r, ^s_node), $phys_ptr_cast(L#r, ^s_node));
    // assume sll_lseg(r, r); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#r, ^s_node), $phys_ptr_cast(L#r, ^s_node));
    // assert srtl_lseg(r, r); 
    assert F#srtl_lseg($s, $phys_ptr_cast(L#r, ^s_node), $phys_ptr_cast(L#r, ^s_node));
    // assume srtl_lseg(r, r); 
    assume F#srtl_lseg($s, $phys_ptr_cast(L#r, ^s_node), $phys_ptr_cast(L#r, ^s_node));
    // assert sll_lseg(local.l, local.l); 
    assert F#sll_lseg($s, $phys_ptr_cast(local.l, ^s_node), $phys_ptr_cast(local.l, ^s_node));
    // assume sll_lseg(local.l, local.l); 
    assume F#sll_lseg($s, $phys_ptr_cast(local.l, ^s_node), $phys_ptr_cast(local.l, ^s_node));
    // assert srtl_lseg(local.l, local.l); 
    assert F#srtl_lseg($s, $phys_ptr_cast(local.l, ^s_node), $phys_ptr_cast(local.l, ^s_node));
    // assume srtl_lseg(local.l, local.l); 
    assume F#srtl_lseg($s, $phys_ptr_cast(local.l, ^s_node), $phys_ptr_cast(local.l, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(sll_keys(r), @_vcc_intset_union(sll_keys(*((r->next))), @_vcc_intset_singleton(*((r->key)))))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#r, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(sll_list_len_next(r), unchecked+(sll_list_len_next(*((r->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#r, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(rsrtl(r), &&(&&(rsrtl(*((r->next))), unchecked!(@_vcc_oset_in(r, rsrtl_reach(*((r->next)))))), >=(*((r->key)), sll_max_key(*((r->next))))))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#r, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#r, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(rsrtl_reach(r), @_vcc_oset_union(rsrtl_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#r, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#r, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(sll(r), &&(sll(*((r->next))), unchecked!(@_vcc_oset_in(r, sll_reach(*((r->next)))))))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#r, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#r, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(sll_reach(r), @_vcc_oset_union(sll_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#r, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#r, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(sll_max_key(r), @\int_max(*((r->key)), sll_max_key(*((r->next)))))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#r, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(sll_min_key(r), @\int_min(*((r->key)), sll_min_key(*((r->next)))))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#r, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(srtl(r), &&(&&(srtl(*((r->next))), unchecked!(@_vcc_oset_in(r, srtl_reach(*((r->next)))))), <=(*((r->key)), sll_min_key(*((r->next))))))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#r, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#r, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(srtl_reach(r), @_vcc_oset_union(srtl_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#r, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#r, ^s_node)));
    loopState#0 := $s;
    assume true;
// INV:LOOPHEAD
    while (true)
invariant b0000 ==> (F#srtl($s,$phys_ptr_cast(P#l,^s_node)));
invariant b0001 ==> (F#srtl($s,$phys_ptr_cast(L#r,^s_node)));
invariant b0002 ==> (F#srtl($s,$phys_ptr_cast(local.l,^s_node)));
invariant b0003 ==> (F#rsrtl($s,$phys_ptr_cast(P#l,^s_node)));
invariant b0004 ==> (F#rsrtl($s,$phys_ptr_cast(L#r,^s_node)));
invariant b0005 ==> (F#rsrtl($s,$phys_ptr_cast(local.l,^s_node)));
invariant b0006 ==> ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)),F#rsrtl_reach($s,$phys_ptr_cast(L#r,^s_node))));
invariant b0007 ==> ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(P#l,^s_node)),F#rsrtl_reach($s,$phys_ptr_cast(local.l,^s_node))));
invariant b0008 ==> ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#r,^s_node)),F#rsrtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
invariant b0009 ==> ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(L#r,^s_node)),F#rsrtl_reach($s,$phys_ptr_cast(local.l,^s_node))));
invariant b0010 ==> ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(local.l,^s_node)),F#rsrtl_reach($s,$phys_ptr_cast(P#l,^s_node))));
invariant b0011 ==> ($oset_disjoint(F#srtl_reach($s,$phys_ptr_cast(local.l,^s_node)),F#rsrtl_reach($s,$phys_ptr_cast(L#r,^s_node))));
invariant b0012 ==> ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#r,^s_node))));
invariant b0013 ==> ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_keys($s,$phys_ptr_cast(local.l,^s_node))));
invariant b0014 ==> ((F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))));
invariant b0015 ==> ((F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)) == F#sll_keys($s,$phys_ptr_cast(local.l,^s_node))));
invariant b0016 ==> ((F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)) == F#sll_keys($s,$phys_ptr_cast(P#l,^s_node))));
invariant b0017 ==> ((F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)) == F#sll_keys($s,$phys_ptr_cast(L#r,^s_node))));
invariant b0018 ==> ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(local.l,^s_node))));
invariant b0019 ==> ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(L#r,^s_node))));
invariant b0020 ==> ((F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(local.l,^s_node))));
invariant b0021 ==> ((F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(P#l,^s_node))));
invariant b0022 ==> ((F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#r,^s_node))));
invariant b0023 ==> ((F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)) == F#sll_lseg_keys($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(P#l,^s_node))));
invariant b0024 ==> ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)))));
invariant b0025 ==> ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)))));
invariant b0026 ==> ((F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)))));
invariant b0027 ==> ((F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
invariant b0028 ==> ((F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)))));
invariant b0029 ==> ((F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
invariant b0030 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)))));
invariant b0031 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)))));
invariant b0032 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(L#r,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
invariant b0033 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(L#r,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)))));
invariant b0034 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(local.l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
invariant b0035 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(local.l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)))));
invariant b0036 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)))));
invariant b0037 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)))));
invariant b0038 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(L#r,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
invariant b0039 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(L#r,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)))));
invariant b0040 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(local.l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
invariant b0041 ==> ((F#sll_keys(loopState#0,$phys_ptr_cast(local.l,^s_node)) == $intset_union(F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)))));
invariant b0042 ==> ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)))));
invariant b0043 ==> ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)))));
invariant b0044 ==> ((F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#r,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
invariant b0045 ==> ((F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#r,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)))));
invariant b0046 ==> ((F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.l,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
invariant b0047 ==> ((F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)))));
invariant b0048 ==> ((F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)))));
invariant b0049 ==> ((F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(P#l,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)))));
invariant b0050 ==> ((F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#r,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
invariant b0051 ==> ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(L#r,^s_node)),F#sll_keys($s,$phys_ptr_cast(local.l,^s_node)))));
invariant b0052 ==> ((F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.l,^s_node)),F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)))));
invariant b0053 ==> ((F#sll_keys($s,$phys_ptr_cast(P#l,^s_node)) == $intset_union(F#sll_keys(loopState#0,$phys_ptr_cast(local.l,^s_node)),F#sll_keys($s,$phys_ptr_cast(L#r,^s_node)))));
invariant b0054 ==> ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)))));
invariant b0055 ==> ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)))));
invariant b0056 ==> ((($non_null($phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
invariant b0057 ==> ((($non_null($phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)))));
invariant b0058 ==> ((($non_null($phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
invariant b0059 ==> ((($non_null($phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)))));
invariant b0060 ==> ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)))));
invariant b0061 ==> ((($non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)))));
invariant b0062 ==> ((($non_null($phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
invariant b0063 ==> ((($non_null($phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)))));
invariant b0064 ==> ((($non_null($phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
invariant b0065 ==> ((($non_null($phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)) == $rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)))));
invariant b0066 ==> (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)))));
invariant b0067 ==> (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)))));
invariant b0068 ==> (((F#srtl($s,$phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#r,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
invariant b0069 ==> (((F#srtl($s,$phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(L#r,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)))));
invariant b0070 ==> (((F#srtl($s,$phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(local.l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
invariant b0071 ==> (((F#srtl($s,$phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> (F#sll_max_key($s,$phys_ptr_cast(local.l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)))));
invariant b0072 ==> (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#r,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#r,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)))));
invariant b0073 ==> (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(local.l,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(local.l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)))));
invariant b0074 ==> (((F#srtl_lseg($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#r,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
invariant b0075 ==> (((F#srtl_lseg($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(local.l,^s_node)) && ($phys_ptr_cast(L#r,^s_node) != $phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(local.l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)))));
invariant b0076 ==> (((F#srtl_lseg($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(local.l,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
invariant b0077 ==> (((F#srtl_lseg($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(L#r,^s_node)) && ($phys_ptr_cast(local.l,^s_node) != $phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(L#r,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)))));
invariant b0078 ==> (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#r,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#r,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)))));
invariant b0079 ==> (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(local.l,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(local.l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)))));
invariant b0080 ==> (((F#srtl_lseg($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#r,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)))));
invariant b0081 ==> (((F#srtl_lseg($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(local.l,^s_node)) && ($phys_ptr_cast(L#r,^s_node) != $phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(local.l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
invariant b0082 ==> (((F#srtl_lseg($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(local.l,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(P#l,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)))));
invariant b0083 ==> (((F#srtl_lseg($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(L#r,^s_node)) && ($phys_ptr_cast(local.l,^s_node) != $phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> (F#sll_lseg_max_key($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(L#r,^s_node)) <= $rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)))));
invariant b0084 ==> (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#l,^s_node)))));
invariant b0085 ==> (((F#srtl($s,$phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(P#l,^s_node)))));
invariant b0086 ==> (((F#srtl($s,$phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#r,^s_node)))));
invariant b0087 ==> (((F#srtl($s,$phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(L#r,^s_node)))));
invariant b0088 ==> (((F#srtl($s,$phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(local.l,^s_node)))));
invariant b0089 ==> (((F#srtl($s,$phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)) <= F#sll_min_key($s,$phys_ptr_cast(local.l,^s_node)))));
invariant b0090 ==> (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#r,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#r,^s_node)))));
invariant b0091 ==> (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(local.l,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(local.l,^s_node)))));
invariant b0092 ==> (((F#srtl_lseg($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#r,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(P#l,^s_node)))));
invariant b0093 ==> (((F#srtl_lseg($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(local.l,^s_node)) && ($phys_ptr_cast(L#r,^s_node) != $phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(local.l,^s_node)))));
invariant b0094 ==> (((F#srtl_lseg($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(local.l,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(P#l,^s_node)))));
invariant b0095 ==> (((F#srtl_lseg($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(L#r,^s_node)) && ($phys_ptr_cast(local.l,^s_node) != $phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(L#r,^s_node)))));
invariant b0096 ==> (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#r,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(L#r,^s_node)))));
invariant b0097 ==> (((F#srtl_lseg($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(local.l,^s_node)) && ($phys_ptr_cast(P#l,^s_node) != $phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(P#l,^s_node),$phys_ptr_cast(local.l,^s_node)))));
invariant b0098 ==> (((F#srtl_lseg($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(L#r,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(local.l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(local.l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(P#l,^s_node)))));
invariant b0099 ==> (((F#srtl_lseg($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(local.l,^s_node)) && ($phys_ptr_cast(L#r,^s_node) != $phys_ptr_cast(local.l,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(L#r,^s_node),$phys_ptr_cast(local.l,^s_node)))));
invariant b0100 ==> (((F#srtl_lseg($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(P#l,^s_node)) && ($phys_ptr_cast(local.l,^s_node) != $phys_ptr_cast(P#l,^s_node)) && $non_null($phys_ptr_cast(L#r,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(L#r,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(P#l,^s_node)))));
invariant b0101 ==> (((F#srtl_lseg($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(L#r,^s_node)) && ($phys_ptr_cast(local.l,^s_node) != $phys_ptr_cast(L#r,^s_node)) && $non_null($phys_ptr_cast(P#l,^s_node))) ==> ($rd_inv($s,s_node.key,$phys_ptr_cast(P#l,^s_node)) <= F#sll_lseg_min_key($s,$phys_ptr_cast(local.l,^s_node),$phys_ptr_cast(L#r,^s_node)))));

      invariant $non_null($phys_ptr_cast(local.l, ^s_node)) ==> $non_null($phys_ptr_cast(local.l, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.l, ^s_node));
      invariant $non_null($phys_ptr_cast(local.l, ^s_node)) ==> $non_null($phys_ptr_cast(local.l, ^s_node)) ==> $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.l, ^s_node));
    {
      anon3:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#0, $s);
        assume $full_stop_ext(#tok$2^12.2, $s);
        // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
        assume $meta_eq(loopState#0, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(local.l)) ...
        if ($non_null($phys_ptr_cast(local.l, ^s_node)))
        {
          anon1:
            // assume ==>(@_vcc_ptr_neq_null(r), ==(sll_keys(r), @_vcc_intset_union(sll_keys(*((r->next))), @_vcc_intset_singleton(*((r->key)))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#r, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(sll_list_len_next(r), unchecked+(sll_list_len_next(*((r->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#r, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(rsrtl(r), &&(&&(rsrtl(*((r->next))), unchecked!(@_vcc_oset_in(r, rsrtl_reach(*((r->next)))))), >=(*((r->key)), sll_max_key(*((r->next))))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#r, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#r, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(rsrtl_reach(r), @_vcc_oset_union(rsrtl_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#r, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#r, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(sll(r), &&(sll(*((r->next))), unchecked!(@_vcc_oset_in(r, sll_reach(*((r->next)))))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#r, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#r, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(sll_reach(r), @_vcc_oset_union(sll_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#r, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#r, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(sll_max_key(r), @\int_max(*((r->key)), sll_max_key(*((r->next)))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#r, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(sll_min_key(r), @\int_min(*((r->key)), sll_min_key(*((r->next)))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#r, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(srtl(r), &&(&&(srtl(*((r->next))), unchecked!(@_vcc_oset_in(r, srtl_reach(*((r->next)))))), <=(*((r->key)), sll_min_key(*((r->next))))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#r, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#r, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(srtl_reach(r), @_vcc_oset_union(srtl_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#r, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#r, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_keys(local.l), @_vcc_intset_union(sll_keys(*((local.l->next))), @_vcc_intset_singleton(*((local.l->key)))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_list_len_next(local.l), unchecked+(sll_list_len_next(*((local.l->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(rsrtl(local.l), &&(&&(rsrtl(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, rsrtl_reach(*((local.l->next)))))), >=(*((local.l->key)), sll_max_key(*((local.l->next))))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(rsrtl_reach(local.l), @_vcc_oset_union(rsrtl_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll(local.l), &&(sll(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, sll_reach(*((local.l->next)))))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_reach(local.l), @_vcc_oset_union(sll_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(sll_max_key(local.l), @\int_max(*((local.l->key)), sll_max_key(*((local.l->next)))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(sll_min_key(local.l), @\int_min(*((local.l->key)), sll_min_key(*((local.l->next)))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(srtl(local.l), &&(&&(srtl(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, srtl_reach(*((local.l->next)))))), <=(*((local.l->key)), sll_min_key(*((local.l->next))))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(srtl_reach(local.l), @_vcc_oset_union(srtl_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
            // struct s_node* t; 
            // struct s_node* l0; 
            // l0 := local.l; 
            SL#l0 := $phys_ptr_cast(local.l, ^s_node);
            // struct s_node* stmtexpr0#2; 
            // stmtexpr0#2 := l0; 
            stmtexpr0#2 := $phys_ptr_cast(SL#l0, ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_keys(local.l), @_vcc_intset_union(sll_keys(*((local.l->next))), @_vcc_intset_singleton(*((local.l->key)))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_list_len_next(local.l), unchecked+(sll_list_len_next(*((local.l->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(rsrtl(local.l), &&(&&(rsrtl(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, rsrtl_reach(*((local.l->next)))))), >=(*((local.l->key)), sll_max_key(*((local.l->next))))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(rsrtl_reach(local.l), @_vcc_oset_union(rsrtl_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll(local.l), &&(sll(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, sll_reach(*((local.l->next)))))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_reach(local.l), @_vcc_oset_union(sll_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(sll_max_key(local.l), @\int_max(*((local.l->key)), sll_max_key(*((local.l->next)))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(sll_min_key(local.l), @\int_min(*((local.l->key)), sll_min_key(*((local.l->next)))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(srtl(local.l), &&(&&(srtl(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, srtl_reach(*((local.l->next)))))), <=(*((local.l->key)), sll_min_key(*((local.l->next))))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(srtl_reach(local.l), @_vcc_oset_union(srtl_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
            // assert @reads_check_normal((local.l->next)); 
            assert $thread_local($s, $phys_ptr_cast(local.l, ^s_node));
            // t := *((local.l->next)); 
            L#t := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(t), ==(sll_keys(t), @_vcc_intset_union(sll_keys(*((t->next))), @_vcc_intset_singleton(*((t->key)))))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#t, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#t, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(t), ==(sll_list_len_next(t), unchecked+(sll_list_len_next(*((t->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#t, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(t), @_vcc_ptr_neq_null(*((t->next)))), ==(rsrtl(t), &&(&&(rsrtl(*((t->next))), unchecked!(@_vcc_oset_in(t, rsrtl_reach(*((t->next)))))), >=(*((t->key)), sll_max_key(*((t->next))))))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#t, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#t, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#t, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(t), ==(rsrtl_reach(t), @_vcc_oset_union(rsrtl_reach(*((t->next))), @_vcc_oset_singleton(t)))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#t, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#t, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(t), ==(sll(t), &&(sll(*((t->next))), unchecked!(@_vcc_oset_in(t, sll_reach(*((t->next)))))))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#t, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#t, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(t), ==(sll_reach(t), @_vcc_oset_union(sll_reach(*((t->next))), @_vcc_oset_singleton(t)))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#t, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#t, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(t), @_vcc_ptr_neq_null(*((t->next)))), ==(sll_max_key(t), @\int_max(*((t->key)), sll_max_key(*((t->next)))))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#t, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#t, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(t), @_vcc_ptr_neq_null(*((t->next)))), ==(sll_min_key(t), @\int_min(*((t->key)), sll_min_key(*((t->next)))))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#t, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#t, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(t), @_vcc_ptr_neq_null(*((t->next)))), ==(srtl(t), &&(&&(srtl(*((t->next))), unchecked!(@_vcc_oset_in(t, srtl_reach(*((t->next)))))), <=(*((t->key)), sll_min_key(*((t->next))))))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#t, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#t, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#t, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(t), ==(srtl_reach(t), @_vcc_oset_union(srtl_reach(*((t->next))), @_vcc_oset_singleton(t)))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#t, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#t, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_keys(local.l), @_vcc_intset_union(sll_keys(*((local.l->next))), @_vcc_intset_singleton(*((local.l->key)))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_list_len_next(local.l), unchecked+(sll_list_len_next(*((local.l->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(rsrtl(local.l), &&(&&(rsrtl(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, rsrtl_reach(*((local.l->next)))))), >=(*((local.l->key)), sll_max_key(*((local.l->next))))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(rsrtl_reach(local.l), @_vcc_oset_union(rsrtl_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll(local.l), &&(sll(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, sll_reach(*((local.l->next)))))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_reach(local.l), @_vcc_oset_union(sll_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(sll_max_key(local.l), @\int_max(*((local.l->key)), sll_max_key(*((local.l->next)))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(sll_min_key(local.l), @\int_min(*((local.l->key)), sll_min_key(*((local.l->next)))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(srtl(local.l), &&(&&(srtl(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, srtl_reach(*((local.l->next)))))), <=(*((local.l->key)), sll_min_key(*((local.l->next))))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(srtl_reach(local.l), @_vcc_oset_union(srtl_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
            // _math \state _dryad_S0; 
            // _dryad_S0 := @_vcc_current_state(@state); 
            SL#_dryad_S0 := $current_state($s);
            // _math \state stmtexpr1#3; 
            // stmtexpr1#3 := _dryad_S0; 
            stmtexpr1#3 := SL#_dryad_S0;
            // assert @prim_writes_check((local.l->next)); 
            assert $writable_prim($s, #wrTime$2^3.3, $dot($phys_ptr_cast(local.l, ^s_node), s_node.next));
            // *(local.l->next) := r; 
            call $write_int(s_node.next, $phys_ptr_cast(local.l, ^s_node), $ptr_to_int($phys_ptr_cast(L#r, ^s_node)));
            assume $full_stop_ext(#tok$2^22.3, $s);
            // _math \state _dryad_S1; 
            // _dryad_S1 := @_vcc_current_state(@state); 
            SL#_dryad_S1 := $current_state($s);
            // _math \state stmtexpr2#4; 
            // stmtexpr2#4 := _dryad_S1; 
            stmtexpr2#4 := SL#_dryad_S1;
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(l0)))), ==(old(_dryad_S0, sll_keys(l0)), old(_dryad_S1, sll_keys(l0)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(l0)))), ==(old(_dryad_S0, sll_list_len_next(l0)), old(_dryad_S1, sll_list_len_next(l0)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, rsrtl_reach(l0)))), ==(old(_dryad_S0, rsrtl(l0)), old(_dryad_S1, rsrtl(l0)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, rsrtl_reach(l0)))), ==(old(_dryad_S0, rsrtl_reach(l0)), old(_dryad_S1, rsrtl_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(l0)))), ==(old(_dryad_S0, sll(l0)), old(_dryad_S1, sll(l0)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(l0)))), ==(old(_dryad_S0, sll_reach(l0)), old(_dryad_S1, sll_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(l0)))), ==(old(_dryad_S0, sll_max_key(l0)), old(_dryad_S1, sll_max_key(l0)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(l0)))), ==(old(_dryad_S0, sll_min_key(l0)), old(_dryad_S1, sll_min_key(l0)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, srtl_reach(l0)))), ==(old(_dryad_S0, srtl(l0)), old(_dryad_S1, srtl(l0)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, srtl_reach(l0)))), ==(old(_dryad_S0, srtl_reach(l0)), old(_dryad_S1, srtl_reach(l0)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(SL#l0, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(t)))), ==(old(_dryad_S0, sll_keys(t)), old(_dryad_S1, sll_keys(t)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#t, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(t)))), ==(old(_dryad_S0, sll_list_len_next(t)), old(_dryad_S1, sll_list_len_next(t)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#t, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, rsrtl_reach(t)))), ==(old(_dryad_S0, rsrtl(t)), old(_dryad_S1, rsrtl(t)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(L#t, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, rsrtl_reach(t)))), ==(old(_dryad_S0, rsrtl_reach(t)), old(_dryad_S1, rsrtl_reach(t)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(L#t, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(t)))), ==(old(_dryad_S0, sll(t)), old(_dryad_S1, sll(t)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#t, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(t)))), ==(old(_dryad_S0, sll_reach(t)), old(_dryad_S1, sll_reach(t)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#t, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(t)))), ==(old(_dryad_S0, sll_max_key(t)), old(_dryad_S1, sll_max_key(t)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(L#t, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(t)))), ==(old(_dryad_S0, sll_min_key(t)), old(_dryad_S1, sll_min_key(t)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(L#t, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, srtl_reach(t)))), ==(old(_dryad_S0, srtl(t)), old(_dryad_S1, srtl(t)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(L#t, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, srtl_reach(t)))), ==(old(_dryad_S0, srtl_reach(t)), old(_dryad_S1, srtl_reach(t)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#t, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(L#t, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(r)))), ==(old(_dryad_S0, sll_keys(r)), old(_dryad_S1, sll_keys(r)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#r, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(r)))), ==(old(_dryad_S0, sll_list_len_next(r)), old(_dryad_S1, sll_list_len_next(r)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node))) ==> F#sll_list_len_next(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node)) == F#sll_list_len_next(SL#_dryad_S1, $phys_ptr_cast(L#r, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, rsrtl_reach(r)))), ==(old(_dryad_S0, rsrtl(r)), old(_dryad_S1, rsrtl(r)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node))) ==> F#rsrtl(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node)) == F#rsrtl(SL#_dryad_S1, $phys_ptr_cast(L#r, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, rsrtl_reach(r)))), ==(old(_dryad_S0, rsrtl_reach(r)), old(_dryad_S1, rsrtl_reach(r)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node))) ==> F#rsrtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node)) == F#rsrtl_reach(SL#_dryad_S1, $phys_ptr_cast(L#r, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(r)))), ==(old(_dryad_S0, sll(r)), old(_dryad_S1, sll(r)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#r, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(r)))), ==(old(_dryad_S0, sll_reach(r)), old(_dryad_S1, sll_reach(r)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#r, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(r)))), ==(old(_dryad_S0, sll_max_key(r)), old(_dryad_S1, sll_max_key(r)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node))) ==> F#sll_max_key(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node)) == F#sll_max_key(SL#_dryad_S1, $phys_ptr_cast(L#r, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, sll_reach(r)))), ==(old(_dryad_S0, sll_min_key(r)), old(_dryad_S1, sll_min_key(r)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node))) ==> F#sll_min_key(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node)) == F#sll_min_key(SL#_dryad_S1, $phys_ptr_cast(L#r, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, srtl_reach(r)))), ==(old(_dryad_S0, srtl(r)), old(_dryad_S1, srtl(r)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node))) ==> F#srtl(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node)) == F#srtl(SL#_dryad_S1, $phys_ptr_cast(L#r, ^s_node));
            // assume ==>(unchecked!(@_vcc_oset_in(local.l, old(_dryad_S0, srtl_reach(r)))), ==(old(_dryad_S0, srtl_reach(r)), old(_dryad_S1, srtl_reach(r)))); 
            assume !$oset_in($phys_ptr_cast(local.l, ^s_node), F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node))) ==> F#srtl_reach(SL#_dryad_S0, $phys_ptr_cast(L#r, ^s_node)) == F#srtl_reach(SL#_dryad_S1, $phys_ptr_cast(L#r, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(local.l, l0)), ==(*((l0->key)), old(_dryad_S0, *((l0->key))))); 
            assume !($phys_ptr_cast(local.l, ^s_node) == $phys_ptr_cast(SL#l0, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(SL#l0, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(SL#l0, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(local.l, l0)), @_vcc_ptr_eq_pure(*((l0->next)), old(_dryad_S0, *((l0->next))))); 
            assume !($phys_ptr_cast(local.l, ^s_node) == $phys_ptr_cast(SL#l0, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(SL#l0, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(local.l, t)), ==(*((t->key)), old(_dryad_S0, *((t->key))))); 
            assume !($phys_ptr_cast(local.l, ^s_node) == $phys_ptr_cast(L#t, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#t, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(L#t, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(local.l, t)), @_vcc_ptr_eq_pure(*((t->next)), old(_dryad_S0, *((t->next))))); 
            assume !($phys_ptr_cast(local.l, ^s_node) == $phys_ptr_cast(L#t, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node);
            // assume ==>(!(@_vcc_ptr_eq_pure(local.l, r)), ==(*((r->key)), old(_dryad_S0, *((r->key))))); 
            assume !($phys_ptr_cast(local.l, ^s_node) == $phys_ptr_cast(L#r, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(L#r, ^s_node));
            // assume ==>(!(@_vcc_ptr_eq_pure(local.l, r)), @_vcc_ptr_eq_pure(*((r->next)), old(_dryad_S0, *((r->next))))); 
            assume !($phys_ptr_cast(local.l, ^s_node) == $phys_ptr_cast(L#r, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node);
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
            // assume ==>(@_vcc_ptr_neq_null(t), ==(sll_keys(t), @_vcc_intset_union(sll_keys(*((t->next))), @_vcc_intset_singleton(*((t->key)))))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#t, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#t, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(t), ==(sll_list_len_next(t), unchecked+(sll_list_len_next(*((t->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#t, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(t), @_vcc_ptr_neq_null(*((t->next)))), ==(rsrtl(t), &&(&&(rsrtl(*((t->next))), unchecked!(@_vcc_oset_in(t, rsrtl_reach(*((t->next)))))), >=(*((t->key)), sll_max_key(*((t->next))))))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#t, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#t, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#t, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(t), ==(rsrtl_reach(t), @_vcc_oset_union(rsrtl_reach(*((t->next))), @_vcc_oset_singleton(t)))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#t, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#t, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(t), ==(sll(t), &&(sll(*((t->next))), unchecked!(@_vcc_oset_in(t, sll_reach(*((t->next)))))))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#t, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#t, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(t), ==(sll_reach(t), @_vcc_oset_union(sll_reach(*((t->next))), @_vcc_oset_singleton(t)))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#t, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#t, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(t), @_vcc_ptr_neq_null(*((t->next)))), ==(sll_max_key(t), @\int_max(*((t->key)), sll_max_key(*((t->next)))))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#t, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#t, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(t), @_vcc_ptr_neq_null(*((t->next)))), ==(sll_min_key(t), @\int_min(*((t->key)), sll_min_key(*((t->next)))))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#t, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#t, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(t), @_vcc_ptr_neq_null(*((t->next)))), ==(srtl(t), &&(&&(srtl(*((t->next))), unchecked!(@_vcc_oset_in(t, srtl_reach(*((t->next)))))), <=(*((t->key)), sll_min_key(*((t->next))))))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#t, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#t, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#t, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(t), ==(srtl_reach(t), @_vcc_oset_union(srtl_reach(*((t->next))), @_vcc_oset_singleton(t)))); 
            assume $non_null($phys_ptr_cast(L#t, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#t, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#t, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#t, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(sll_keys(r), @_vcc_intset_union(sll_keys(*((r->next))), @_vcc_intset_singleton(*((r->key)))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#r, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(sll_list_len_next(r), unchecked+(sll_list_len_next(*((r->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#r, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(rsrtl(r), &&(&&(rsrtl(*((r->next))), unchecked!(@_vcc_oset_in(r, rsrtl_reach(*((r->next)))))), >=(*((r->key)), sll_max_key(*((r->next))))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#r, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#r, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(rsrtl_reach(r), @_vcc_oset_union(rsrtl_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#r, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#r, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(sll(r), &&(sll(*((r->next))), unchecked!(@_vcc_oset_in(r, sll_reach(*((r->next)))))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#r, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#r, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(sll_reach(r), @_vcc_oset_union(sll_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#r, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#r, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(sll_max_key(r), @\int_max(*((r->key)), sll_max_key(*((r->next)))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#r, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(sll_min_key(r), @\int_min(*((r->key)), sll_min_key(*((r->next)))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#r, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(srtl(r), &&(&&(srtl(*((r->next))), unchecked!(@_vcc_oset_in(r, srtl_reach(*((r->next)))))), <=(*((r->key)), sll_min_key(*((r->next))))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#r, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#r, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(srtl_reach(r), @_vcc_oset_union(srtl_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#r, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#r, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_keys(local.l), @_vcc_intset_union(sll_keys(*((local.l->next))), @_vcc_intset_singleton(*((local.l->key)))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_list_len_next(local.l), unchecked+(sll_list_len_next(*((local.l->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(rsrtl(local.l), &&(&&(rsrtl(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, rsrtl_reach(*((local.l->next)))))), >=(*((local.l->key)), sll_max_key(*((local.l->next))))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(rsrtl_reach(local.l), @_vcc_oset_union(rsrtl_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll(local.l), &&(sll(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, sll_reach(*((local.l->next)))))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_reach(local.l), @_vcc_oset_union(sll_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(sll_max_key(local.l), @\int_max(*((local.l->key)), sll_max_key(*((local.l->next)))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(sll_min_key(local.l), @\int_min(*((local.l->key)), sll_min_key(*((local.l->next)))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(srtl(local.l), &&(&&(srtl(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, srtl_reach(*((local.l->next)))))), <=(*((local.l->key)), sll_min_key(*((local.l->next))))))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.l), ==(srtl_reach(local.l), @_vcc_oset_union(srtl_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(sll_keys(r), @_vcc_intset_union(sll_keys(*((r->next))), @_vcc_intset_singleton(*((r->key)))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#r, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(sll_list_len_next(r), unchecked+(sll_list_len_next(*((r->next))), 1))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#r, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), 1);
            // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(rsrtl(r), &&(&&(rsrtl(*((r->next))), unchecked!(@_vcc_oset_in(r, rsrtl_reach(*((r->next)))))), >=(*((r->key)), sll_max_key(*((r->next))))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#r, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#r, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(rsrtl_reach(r), @_vcc_oset_union(rsrtl_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#r, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#r, ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(sll(r), &&(sll(*((r->next))), unchecked!(@_vcc_oset_in(r, sll_reach(*((r->next)))))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#r, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#r, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(sll_reach(r), @_vcc_oset_union(sll_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#r, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#r, ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(sll_max_key(r), @\int_max(*((r->key)), sll_max_key(*((r->next)))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#r, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(sll_min_key(r), @\int_min(*((r->key)), sll_min_key(*((r->next)))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#r, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
            // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(srtl(r), &&(&&(srtl(*((r->next))), unchecked!(@_vcc_oset_in(r, srtl_reach(*((r->next)))))), <=(*((r->key)), sll_min_key(*((r->next))))))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#r, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#r, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
            // assume ==>(@_vcc_ptr_neq_null(r), ==(srtl_reach(r), @_vcc_oset_union(srtl_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
            assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#r, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#r, ^s_node)));
            // r := local.l; 
            L#r := $phys_ptr_cast(local.l, ^s_node);
            // assert sll_lseg(l0, l0); 
            assert F#sll_lseg($s, $phys_ptr_cast(SL#l0, ^s_node), $phys_ptr_cast(SL#l0, ^s_node));
            // assume sll_lseg(l0, l0); 
            assume F#sll_lseg($s, $phys_ptr_cast(SL#l0, ^s_node), $phys_ptr_cast(SL#l0, ^s_node));
            // assert srtl_lseg(l0, l0); 
            assert F#srtl_lseg($s, $phys_ptr_cast(SL#l0, ^s_node), $phys_ptr_cast(SL#l0, ^s_node));
            // assume srtl_lseg(l0, l0); 
            assume F#srtl_lseg($s, $phys_ptr_cast(SL#l0, ^s_node), $phys_ptr_cast(SL#l0, ^s_node));
            // assert sll_lseg(t, t); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#t, ^s_node), $phys_ptr_cast(L#t, ^s_node));
            // assume sll_lseg(t, t); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#t, ^s_node), $phys_ptr_cast(L#t, ^s_node));
            // assert srtl_lseg(t, t); 
            assert F#srtl_lseg($s, $phys_ptr_cast(L#t, ^s_node), $phys_ptr_cast(L#t, ^s_node));
            // assume srtl_lseg(t, t); 
            assume F#srtl_lseg($s, $phys_ptr_cast(L#t, ^s_node), $phys_ptr_cast(L#t, ^s_node));
            // assert sll_lseg(r, r); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#r, ^s_node), $phys_ptr_cast(L#r, ^s_node));
            // assume sll_lseg(r, r); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#r, ^s_node), $phys_ptr_cast(L#r, ^s_node));
            // assert srtl_lseg(r, r); 
            assert F#srtl_lseg($s, $phys_ptr_cast(L#r, ^s_node), $phys_ptr_cast(L#r, ^s_node));
            // assume srtl_lseg(r, r); 
            assume F#srtl_lseg($s, $phys_ptr_cast(L#r, ^s_node), $phys_ptr_cast(L#r, ^s_node));
            // assert sll_lseg(local.l, local.l); 
            assert F#sll_lseg($s, $phys_ptr_cast(local.l, ^s_node), $phys_ptr_cast(local.l, ^s_node));
            // assume sll_lseg(local.l, local.l); 
            assume F#sll_lseg($s, $phys_ptr_cast(local.l, ^s_node), $phys_ptr_cast(local.l, ^s_node));
            // assert srtl_lseg(local.l, local.l); 
            assert F#srtl_lseg($s, $phys_ptr_cast(local.l, ^s_node), $phys_ptr_cast(local.l, ^s_node));
            // assume srtl_lseg(local.l, local.l); 
            assume F#srtl_lseg($s, $phys_ptr_cast(local.l, ^s_node), $phys_ptr_cast(local.l, ^s_node));
            // local.l := t; 
            local.l := $phys_ptr_cast(L#t, ^s_node);
            // assert sll_lseg(l0, l0); 
            assert F#sll_lseg($s, $phys_ptr_cast(SL#l0, ^s_node), $phys_ptr_cast(SL#l0, ^s_node));
            // assume sll_lseg(l0, l0); 
            assume F#sll_lseg($s, $phys_ptr_cast(SL#l0, ^s_node), $phys_ptr_cast(SL#l0, ^s_node));
            // assert srtl_lseg(l0, l0); 
            assert F#srtl_lseg($s, $phys_ptr_cast(SL#l0, ^s_node), $phys_ptr_cast(SL#l0, ^s_node));
            // assume srtl_lseg(l0, l0); 
            assume F#srtl_lseg($s, $phys_ptr_cast(SL#l0, ^s_node), $phys_ptr_cast(SL#l0, ^s_node));
            // assert sll_lseg(t, t); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#t, ^s_node), $phys_ptr_cast(L#t, ^s_node));
            // assume sll_lseg(t, t); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#t, ^s_node), $phys_ptr_cast(L#t, ^s_node));
            // assert srtl_lseg(t, t); 
            assert F#srtl_lseg($s, $phys_ptr_cast(L#t, ^s_node), $phys_ptr_cast(L#t, ^s_node));
            // assume srtl_lseg(t, t); 
            assume F#srtl_lseg($s, $phys_ptr_cast(L#t, ^s_node), $phys_ptr_cast(L#t, ^s_node));
            // assert sll_lseg(r, r); 
            assert F#sll_lseg($s, $phys_ptr_cast(L#r, ^s_node), $phys_ptr_cast(L#r, ^s_node));
            // assume sll_lseg(r, r); 
            assume F#sll_lseg($s, $phys_ptr_cast(L#r, ^s_node), $phys_ptr_cast(L#r, ^s_node));
            // assert srtl_lseg(r, r); 
            assert F#srtl_lseg($s, $phys_ptr_cast(L#r, ^s_node), $phys_ptr_cast(L#r, ^s_node));
            // assume srtl_lseg(r, r); 
            assume F#srtl_lseg($s, $phys_ptr_cast(L#r, ^s_node), $phys_ptr_cast(L#r, ^s_node));
            // assert sll_lseg(local.l, local.l); 
            assert F#sll_lseg($s, $phys_ptr_cast(local.l, ^s_node), $phys_ptr_cast(local.l, ^s_node));
            // assume sll_lseg(local.l, local.l); 
            assume F#sll_lseg($s, $phys_ptr_cast(local.l, ^s_node), $phys_ptr_cast(local.l, ^s_node));
            // assert srtl_lseg(local.l, local.l); 
            assert F#srtl_lseg($s, $phys_ptr_cast(local.l, ^s_node), $phys_ptr_cast(local.l, ^s_node));
            // assume srtl_lseg(local.l, local.l); 
            assume F#srtl_lseg($s, $phys_ptr_cast(local.l, ^s_node), $phys_ptr_cast(local.l, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(local.l), &&(@_vcc_mutable(@state, local.l), @writes_check(local.l))); 
            assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> $mutable($s, $phys_ptr_cast(local.l, ^s_node)) && $top_writable($s, #wrTime$2^3.3, $phys_ptr_cast(local.l, ^s_node));
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
    assume $full_stop_ext(#tok$2^12.2, $s);

  #break_1:
    // assume ==>(@_vcc_ptr_neq_null(r), ==(sll_keys(r), @_vcc_intset_union(sll_keys(*((r->next))), @_vcc_intset_singleton(*((r->key)))))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#r, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(sll_list_len_next(r), unchecked+(sll_list_len_next(*((r->next))), 1))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(L#r, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(rsrtl(r), &&(&&(rsrtl(*((r->next))), unchecked!(@_vcc_oset_in(r, rsrtl_reach(*((r->next)))))), >=(*((r->key)), sll_max_key(*((r->next))))))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(L#r, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#r, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(rsrtl_reach(r), @_vcc_oset_union(rsrtl_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(L#r, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#r, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(sll(r), &&(sll(*((r->next))), unchecked!(@_vcc_oset_in(r, sll_reach(*((r->next)))))))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#r, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#r, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(sll_reach(r), @_vcc_oset_union(sll_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#r, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#r, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(sll_max_key(r), @\int_max(*((r->key)), sll_max_key(*((r->next)))))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(L#r, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(sll_min_key(r), @\int_min(*((r->key)), sll_min_key(*((r->next)))))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(L#r, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(r), @_vcc_ptr_neq_null(*((r->next)))), ==(srtl(r), &&(&&(srtl(*((r->next))), unchecked!(@_vcc_oset_in(r, srtl_reach(*((r->next)))))), <=(*((r->key)), sll_min_key(*((r->next))))))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(L#r, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#r, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(L#r, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(srtl_reach(r), @_vcc_oset_union(srtl_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
    assume $non_null($phys_ptr_cast(L#r, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(L#r, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#r, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(L#r, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_keys(local.l), @_vcc_intset_union(sll_keys(*((local.l->next))), @_vcc_intset_singleton(*((local.l->key)))))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(local.l, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_list_len_next(local.l), unchecked+(sll_list_len_next(*((local.l->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_list_len_next($s, $phys_ptr_cast(local.l, ^s_node)) == $unchk_add(^^nat, F#sll_list_len_next($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), 1);
    // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(rsrtl(local.l), &&(&&(rsrtl(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, rsrtl_reach(*((local.l->next)))))), >=(*((local.l->key)), sll_max_key(*((local.l->next))))))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#rsrtl($s, $phys_ptr_cast(local.l, ^s_node)) == (F#rsrtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)) >= F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.l), ==(rsrtl_reach(local.l), @_vcc_oset_union(rsrtl_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#rsrtl_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#rsrtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll(local.l), &&(sll(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, sll_reach(*((local.l->next)))))))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll($s, $phys_ptr_cast(local.l, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.l), ==(sll_reach(local.l), @_vcc_oset_union(sll_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(sll_max_key(local.l), @\int_max(*((local.l->key)), sll_max_key(*((local.l->next)))))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#sll_max_key($s, $phys_ptr_cast(local.l, ^s_node)) == $int_max($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)), F#sll_max_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(sll_min_key(local.l), @\int_min(*((local.l->key)), sll_min_key(*((local.l->next)))))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#sll_min_key($s, $phys_ptr_cast(local.l, ^s_node)) == $int_min($rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)), F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
    // assume ==>(&&(@_vcc_ptr_neq_null(local.l), @_vcc_ptr_neq_null(*((local.l->next)))), ==(srtl(local.l), &&(&&(srtl(*((local.l->next))), unchecked!(@_vcc_oset_in(local.l, srtl_reach(*((local.l->next)))))), <=(*((local.l->key)), sll_min_key(*((local.l->next))))))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) && $non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) ==> F#srtl($s, $phys_ptr_cast(local.l, ^s_node)) == (F#srtl($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(local.l, ^s_node), F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node))) && $rd_inv($s, s_node.key, $phys_ptr_cast(local.l, ^s_node)) <= F#sll_min_key($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.l), ==(srtl_reach(local.l), @_vcc_oset_union(srtl_reach(*((local.l->next))), @_vcc_oset_singleton(local.l)))); 
    assume $non_null($phys_ptr_cast(local.l, ^s_node)) ==> F#srtl_reach($s, $phys_ptr_cast(local.l, ^s_node)) == $oset_union(F#srtl_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(local.l, ^s_node), ^s_node)), $oset_singleton($phys_ptr_cast(local.l, ^s_node)));
    // return r; 
    $result := $phys_ptr_cast(L#r, ^s_node);
    assume true;
    assert $position_marker();
    goto #exit;

  anon6:
    // skip

  #exit:
}



axiom (forall Q#__vcc_state$1^687.9#tc2#1643: $state, Q#x$1^687.9#dt1#1618: $ptr :: {:weight 10} { F#srtl(Q#__vcc_state$1^687.9#tc2#1643, $phys_ptr_cast(Q#x$1^687.9#dt1#1618, ^s_node)) } { F#sll(Q#__vcc_state$1^687.9#tc2#1643, $phys_ptr_cast(Q#x$1^687.9#dt1#1618, ^s_node)) } $good_state(Q#__vcc_state$1^687.9#tc2#1643) && true ==> F#srtl(Q#__vcc_state$1^687.9#tc2#1643, $phys_ptr_cast(Q#x$1^687.9#dt1#1618, ^s_node)) ==> F#sll(Q#__vcc_state$1^687.9#tc2#1643, $phys_ptr_cast(Q#x$1^687.9#dt1#1618, ^s_node)));

axiom (forall Q#__vcc_state$1^688.9#tc2#1644: $state, Q#x$1^688.9#dt1#1619: $ptr :: {:weight 10} { F#rsrtl(Q#__vcc_state$1^688.9#tc2#1644, $phys_ptr_cast(Q#x$1^688.9#dt1#1619, ^s_node)) } { F#sll(Q#__vcc_state$1^688.9#tc2#1644, $phys_ptr_cast(Q#x$1^688.9#dt1#1619, ^s_node)) } $good_state(Q#__vcc_state$1^688.9#tc2#1644) && true ==> F#rsrtl(Q#__vcc_state$1^688.9#tc2#1644, $phys_ptr_cast(Q#x$1^688.9#dt1#1619, ^s_node)) ==> F#sll(Q#__vcc_state$1^688.9#tc2#1644, $phys_ptr_cast(Q#x$1^688.9#dt1#1619, ^s_node)));

axiom (forall Q#__vcc_state$1^689.9#tc2#1645: $state, Q#x$1^689.9#dt1#1620: $ptr :: {:weight 10} { F#sll_reach(Q#__vcc_state$1^689.9#tc2#1645, $phys_ptr_cast(Q#x$1^689.9#dt1#1620, ^s_node)) } { F#srtl_reach(Q#__vcc_state$1^689.9#tc2#1645, $phys_ptr_cast(Q#x$1^689.9#dt1#1620, ^s_node)) } $good_state(Q#__vcc_state$1^689.9#tc2#1645) && true ==> F#sll_reach(Q#__vcc_state$1^689.9#tc2#1645, $phys_ptr_cast(Q#x$1^689.9#dt1#1620, ^s_node)) == F#srtl_reach(Q#__vcc_state$1^689.9#tc2#1645, $phys_ptr_cast(Q#x$1^689.9#dt1#1620, ^s_node)));

axiom (forall Q#__vcc_state$1^690.9#tc2#1646: $state, Q#x$1^690.9#dt1#1621: $ptr :: {:weight 10} { F#srtl_reach(Q#__vcc_state$1^690.9#tc2#1646, $phys_ptr_cast(Q#x$1^690.9#dt1#1621, ^s_node)) } { F#rsrtl_reach(Q#__vcc_state$1^690.9#tc2#1646, $phys_ptr_cast(Q#x$1^690.9#dt1#1621, ^s_node)) } $good_state(Q#__vcc_state$1^690.9#tc2#1646) && true ==> F#srtl_reach(Q#__vcc_state$1^690.9#tc2#1646, $phys_ptr_cast(Q#x$1^690.9#dt1#1621, ^s_node)) == F#rsrtl_reach(Q#__vcc_state$1^690.9#tc2#1646, $phys_ptr_cast(Q#x$1^690.9#dt1#1621, ^s_node)));

axiom (forall Q#__vcc_state$1^691.9#tc2#1647: $state, Q#x$1^691.9#dt1#1622: $ptr, Q#y$1^691.9#dt1#1623: $ptr :: {:weight 10} { F#sll_lseg_reach(Q#__vcc_state$1^691.9#tc2#1647, $phys_ptr_cast(Q#x$1^691.9#dt1#1622, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1623, ^s_node)) } { F#srtl_lseg_reach(Q#__vcc_state$1^691.9#tc2#1647, $phys_ptr_cast(Q#x$1^691.9#dt1#1622, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1623, ^s_node)) } $good_state(Q#__vcc_state$1^691.9#tc2#1647) && true ==> F#sll_lseg_reach(Q#__vcc_state$1^691.9#tc2#1647, $phys_ptr_cast(Q#x$1^691.9#dt1#1622, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1623, ^s_node)) == F#srtl_lseg_reach(Q#__vcc_state$1^691.9#tc2#1647, $phys_ptr_cast(Q#x$1^691.9#dt1#1622, ^s_node), $phys_ptr_cast(Q#y$1^691.9#dt1#1623, ^s_node)));

const unique l#public: $label;

axiom $type_code_is(2, ^$#state_t);

const unique #tok$2^22.3: $token;

const unique #tok$2^12.2: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^3.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Csorted?2Dsll?5Creverse_sorted.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Csorted?2Dsll?5Creverse_sorted.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Csorted?2Dsll?5Cdryad_srtl.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Csorted?2Dsll?5Cdryad_srtl.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^s_node);

