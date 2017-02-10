
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
b0201 : bool,
b0202 : bool,
b0203 : bool,
b0204 : bool,
b0205 : bool,
b0206 : bool,
b0207 : bool,
b0208 : bool,
b0209 : bool,
b0210 : bool,
b0211 : bool,
b0212 : bool,
b0213 : bool,
b0214 : bool,
b0215 : bool,
b0216 : bool,
b0217 : bool,
b0218 : bool,
b0219 : bool,
b0220 : bool,
b0221 : bool,
b0222 : bool,
b0223 : bool,
b0224 : bool,
b0225 : bool,
b0226 : bool,
b0227 : bool,
b0228 : bool,
b0229 : bool,
b0230 : bool,
b0231 : bool,
b0232 : bool,
b0233 : bool,
b0234 : bool,
b0235 : bool,
b0236 : bool,
b0237 : bool
) : bool;

axiom $arch_ptr_size == 8;

axiom $arch_spec_ptr_start == $max.u8;

const unique ^$##thread_id: $ctype;

axiom $def_math_type(^$##thread_id);

type $##thread_id;

const unique ^$##club: $ctype;

axiom $def_math_type(^$##club);

type $##club;

const unique ^d_node: $ctype;

axiom $is_span_sequential(^d_node);

axiom $def_struct_type(^d_node, 24, false, false);

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2(#s1, #s2, #p, ^d_node) } $inv2(#s1, #s2, #p, ^d_node) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2_without_lemmas(#s1, #s2, #p, ^d_node) } $inv2_without_lemmas(#s1, #s2, #p, ^d_node) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall p: $ptr, q: $ptr, s: $state :: { $in(q, $composite_extent(s, p, ^d_node)) } $in(q, $composite_extent(s, p, ^d_node)) == (q == p));

const unique d_node.key: $field;

axiom $def_phys_field(^d_node, d_node.key, ^^i4, false, 0);

const unique d_node.prev: $field;

axiom $def_phys_field(^d_node, d_node.prev, $ptr_to(^d_node), false, 8);

const unique d_node.next: $field;

axiom $def_phys_field(^d_node, d_node.next, $ptr_to(^d_node), false, 16);

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

const unique ^$#g_list_index.c..36776#3: $ctype;

axiom $def_fnptr_type(^$#g_list_index.c..36776#3);

type $#g_list_index.c..36776#3;

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

function F#dll(#s: $state, SP#hd: $ptr) : bool;

const unique cf#dll: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#dll(#s, SP#hd) } 1 < $decreases_level ==> $is_null($phys_ptr_cast(SP#hd, ^d_node)) ==> F#dll(#s, SP#hd));

axiom $function_arg_type(cf#dll, 0, ^^bool);

axiom $function_arg_type(cf#dll, 1, $ptr_to(^d_node));

procedure dll(SP#hd: $ptr) returns ($result: bool);
  ensures $is_null($phys_ptr_cast(SP#hd, ^d_node)) ==> $result;
  free ensures $result == F#dll($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#dll_reach(#s: $state, SP#hd: $ptr) : $oset;

const unique cf#dll_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#dll_reach(#s, SP#hd) } 1 < $decreases_level ==> ($non_null($phys_ptr_cast(SP#hd, ^d_node)) ==> $oset_in($phys_ptr_cast(SP#hd, ^d_node), F#dll_reach(#s, SP#hd))) && ($is_null($phys_ptr_cast(SP#hd, ^d_node)) ==> F#dll_reach(#s, SP#hd) == $oset_empty()));

axiom $function_arg_type(cf#dll_reach, 0, ^$#oset);

axiom $function_arg_type(cf#dll_reach, 1, $ptr_to(^d_node));

procedure dll_reach(SP#hd: $ptr) returns ($result: $oset);
  ensures ($non_null($phys_ptr_cast(SP#hd, ^d_node)) ==> $oset_in($phys_ptr_cast(SP#hd, ^d_node), $result)) && ($is_null($phys_ptr_cast(SP#hd, ^d_node)) ==> $result == $oset_empty());
  free ensures $result == F#dll_reach($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#dll_keys(#s: $state, SP#hd: $ptr) : $intset;

const unique cf#dll_keys: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#dll_keys(#s, SP#hd) } 1 < $decreases_level ==> ($non_null($phys_ptr_cast(SP#hd, ^d_node)) ==> $intset_in($rd_inv(#s, d_node.key, $phys_ptr_cast(SP#hd, ^d_node)), F#dll_keys(#s, SP#hd))) && ($is_null($phys_ptr_cast(SP#hd, ^d_node)) ==> F#dll_keys(#s, SP#hd) == $intset_empty()));

axiom $function_arg_type(cf#dll_keys, 0, ^$#intset);

axiom $function_arg_type(cf#dll_keys, 1, $ptr_to(^d_node));

procedure dll_keys(SP#hd: $ptr) returns ($result: $intset);
  ensures $non_null($phys_ptr_cast(SP#hd, ^d_node)) ==> $intset_in($rd_inv($s, d_node.key, $phys_ptr_cast(SP#hd, ^d_node)), $result);
  ensures $is_null($phys_ptr_cast(SP#hd, ^d_node)) ==> $result == $intset_empty();
  free ensures $result == F#dll_keys($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#dll_list_len_next(#s: $state, SP#x: $ptr) : int;

const unique cf#dll_list_len_next: $pure_function;

axiom (forall #s: $state, SP#x: $ptr :: { F#dll_list_len_next(#s, SP#x) } 1 < $decreases_level ==> $in_range_nat(F#dll_list_len_next(#s, SP#x)) && ($non_null($phys_ptr_cast(SP#x, ^d_node)) ==> F#dll_list_len_next(#s, SP#x) > 0) && ($is_null($phys_ptr_cast(SP#x, ^d_node)) ==> F#dll_list_len_next(#s, SP#x) == 0));

axiom $function_arg_type(cf#dll_list_len_next, 0, ^^nat);

axiom $function_arg_type(cf#dll_list_len_next, 1, $ptr_to(^d_node));

procedure dll_list_len_next(SP#x: $ptr) returns ($result: int);
  free ensures $in_range_nat($result);
  ensures $non_null($phys_ptr_cast(SP#x, ^d_node)) ==> $result > 0;
  ensures $is_null($phys_ptr_cast(SP#x, ^d_node)) ==> $result == 0;
  free ensures $result == F#dll_list_len_next($s, SP#x);
  free ensures $call_transition(old($s), $s);



function F#dll_lseg(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : bool;

const unique cf#dll_lseg: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#dll_lseg(#s, SP#hd, SP#tl) } 1 < $decreases_level ==>
true
&& ($phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg(#s, SP#hd, SP#tl))
&& ($is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> F#dll_lseg(#s, SP#hd, SP#tl) == F#dll(#s, $phys_ptr_cast(SP#hd, ^d_node)))
);

/*
   lseg(x,y) ==> disjoint( lseg_reach(x,y), singleton(y) )
*/
axiom (forall #s: $state, SP#x: $ptr, SP#y: $ptr ::
{ F#dll_lseg(#s, SP#x, SP#y) }
( true
&& F#dll_lseg(#s, SP#x, SP#y)
) ==> ( true
&& $oset_disjoint( F#dll_lseg_reach(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)), $oset_singleton($phys_ptr_cast(SP#y, ^d_node)) )
));

/*
   lseg(x,y) && list(y)
// && lseg_keys(x,y) <= list_keys(y)
   ==>
   list(x) &&
   list_reach(x) == union( lseg_reach(x,y), list_reach(y) )
   list_keys(x)  == union( lseg_keys(x,y),  list_keys(y) )
   list_len(x)   == lseg_len(x,y) + list_len(y)
*/
axiom (forall #s: $state, SP#x: $ptr, SP#y: $ptr ::
{ F#dll_lseg(#s, SP#x, SP#y) }
( true
&& F#dll_lseg(#s, SP#x, SP#y)
&& F#dll(#s, $phys_ptr_cast(SP#y, ^d_node))
) ==> ( true
&& F#dll(#s, $phys_ptr_cast(SP#x, ^d_node))
&& F#dll_reach(#s, $phys_ptr_cast(SP#x, ^d_node))
   == $oset_union(F#dll_lseg_reach(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)), F#dll_reach(#s, $phys_ptr_cast(SP#y, ^d_node)))
&& F#dll_keys(#s, $phys_ptr_cast(SP#x, ^d_node))
   == $intset_union(F#dll_lseg_keys(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)), F#dll_keys(#s, $phys_ptr_cast(SP#y, ^d_node)))
&& F#dll_list_len_next(#s, $phys_ptr_cast(SP#x, ^d_node))
   == $unchk_add(^^nat, F#dll_lseg_len_next(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)), F#dll_list_len_next(#s, $phys_ptr_cast(SP#y, ^d_node)))
));

/*
   lseg(x,y) && y != null
   && y->next != y && y->next != x && y->next \not\in lseg_reach(x,y)
   && y->next != null ==> y->next->prev == y
// && lseg_keys(x,y) <= singleton(y)
   ==>
   lseg(x,y->next) &&
   lseg_reach(x,y->next) == union( lseg_reach(x,y), singleton(y) )
   lseg_keys(x,y->next)  == union( lseg_keys(x,y),  singleton(y->key) )
   lseg_len(x,y->next)   == lseg_len(x,y) + 1
*/
axiom (forall #s: $state, SP#x: $ptr, SP#y: $ptr ::
{ F#dll_lseg(#s, SP#x, SP#y) }
( true
&& F#dll_lseg(#s, SP#x, SP#y)
&& $non_null($phys_ptr_cast(SP#y, ^d_node))
&& $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node) != $phys_ptr_cast(SP#x, ^d_node)
&& $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node) != $phys_ptr_cast(SP#y, ^d_node)
&& !$oset_in($rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node), F#dll_lseg_reach(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)))
&& ( $non_null($rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node))
     ==> ($rd_phys_ptr(#s, d_node.prev, $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(SP#y, ^d_node)))
) ==> ( true
&& F#dll_lseg(#s, $phys_ptr_cast(SP#x, ^d_node), $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node))
&& F#dll_lseg_reach(#s, $phys_ptr_cast(SP#x, ^d_node), $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node))
   == $oset_union(F#dll_lseg_reach(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)), $oset_singleton($phys_ptr_cast(SP#y, ^d_node)))
&& F#dll_lseg_keys(#s, $phys_ptr_cast(SP#x, ^d_node), $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node))
   == $intset_union(F#dll_lseg_keys(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)), $intset_singleton($rd_inv(#s, d_node.key, $phys_ptr_cast(SP#y, ^d_node))))
&& F#dll_lseg_len_next(#s, $phys_ptr_cast(SP#x, ^d_node), $rd_phys_ptr(#s, d_node.next, $phys_ptr_cast(SP#y, ^d_node), ^d_node))
   == $unchk_add(^^nat, F#dll_lseg_len_next(#s, $phys_ptr_cast(SP#x, ^d_node), $phys_ptr_cast(SP#y, ^d_node)), 1)
));


axiom $function_arg_type(cf#dll_lseg, 0, ^^bool);

axiom $function_arg_type(cf#dll_lseg, 1, $ptr_to(^d_node));

axiom $function_arg_type(cf#dll_lseg, 2, $ptr_to(^d_node));

procedure dll_lseg(SP#hd: $ptr, SP#tl: $ptr) returns ($result: bool);
  ensures $phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> $result;
  ensures $is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> $result == F#dll($s, $phys_ptr_cast(SP#hd, ^d_node));
  free ensures $result == F#dll_lseg($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#dll_lseg_reach(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : $oset;

const unique cf#dll_lseg_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#dll_lseg_reach(#s, SP#hd, SP#tl) } 1 < $decreases_level ==>
true
&& ($phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg_reach(#s, SP#hd, SP#tl) == $oset_empty())
&& ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node)
   ==> $oset_in($phys_ptr_cast(SP#hd, ^d_node), F#dll_lseg_reach(#s, SP#hd, SP#tl)))
&& ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $is_null($phys_ptr_cast(SP#tl, ^d_node))
   ==> F#dll_lseg_reach(#s, SP#hd, SP#tl) == F#dll_reach(#s, $phys_ptr_cast(SP#hd, ^d_node)))
);

axiom $function_arg_type(cf#dll_lseg_reach, 0, ^$#oset);

axiom $function_arg_type(cf#dll_lseg_reach, 1, $ptr_to(^d_node));

axiom $function_arg_type(cf#dll_lseg_reach, 2, $ptr_to(^d_node));

procedure dll_lseg_reach(SP#hd: $ptr, SP#tl: $ptr) returns ($result: $oset);
  ensures $phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> $result == $oset_empty();
  ensures $non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $oset_in($phys_ptr_cast(SP#hd, ^d_node), $result);
  ensures $is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> $result == F#dll_reach($s, $phys_ptr_cast(SP#hd, ^d_node));
  free ensures $result == F#dll_lseg_reach($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#dll_lseg_keys(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : $intset;

const unique cf#dll_lseg_keys: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#dll_lseg_keys(#s, SP#hd, SP#tl) } 1 < $decreases_level ==>
true
&& ($phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg_keys(#s, SP#hd, SP#tl) == $intset_empty())
&& ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node)
   ==> $intset_in($rd_inv(#s, d_node.key, $phys_ptr_cast(SP#hd, ^d_node)), F#dll_lseg_keys(#s, SP#hd, SP#tl)))
&& ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $is_null($phys_ptr_cast(SP#tl, ^d_node))
   ==> F#dll_lseg_keys(#s, SP#hd, SP#tl) == F#dll_keys(#s, $phys_ptr_cast(SP#hd, ^d_node)))
);

axiom $function_arg_type(cf#dll_lseg_keys, 0, ^$#intset);

axiom $function_arg_type(cf#dll_lseg_keys, 1, $ptr_to(^d_node));

axiom $function_arg_type(cf#dll_lseg_keys, 2, $ptr_to(^d_node));

procedure dll_lseg_keys(SP#hd: $ptr, SP#tl: $ptr) returns ($result: $intset);
  ensures $non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node) ==> $intset_in($rd_inv($s, d_node.key, $phys_ptr_cast(SP#hd, ^d_node)), $result);
  ensures $phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> $result == $intset_empty();
  ensures $is_null($phys_ptr_cast(SP#tl, ^d_node)) ==> $result == F#dll_keys($s, $phys_ptr_cast(SP#hd, ^d_node));
  free ensures $result == F#dll_lseg_keys($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#dll_lseg_len_next(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : int;

const unique cf#dll_lseg_len_next: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#dll_lseg_len_next(#s, SP#hd, SP#tl) } 1 < $decreases_level ==>
true
&& $in_range_nat(F#dll_lseg_len_next(#s, SP#hd, SP#tl))
&& ($phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> F#dll_lseg_len_next(#s, SP#hd, SP#tl) == 0)
&& ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node)
   ==> F#dll_lseg_len_next(#s, SP#hd, SP#tl) > 0)
&& ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $is_null($phys_ptr_cast(SP#tl, ^d_node))
   ==> F#dll_lseg_len_next(#s, SP#hd, SP#tl) == F#dll_list_len_next(#s, $phys_ptr_cast(SP#hd, ^d_node)))
);

axiom $function_arg_type(cf#dll_lseg_len_next, 0, ^^nat);

axiom $function_arg_type(cf#dll_lseg_len_next, 1, $ptr_to(^d_node));

axiom $function_arg_type(cf#dll_lseg_len_next, 2, $ptr_to(^d_node));

procedure dll_lseg_len_next(SP#hd: $ptr, SP#tl: $ptr) returns ($result: int);
  free ensures $in_range_nat($result);
  ensures $phys_ptr_cast(SP#hd, ^d_node) == $phys_ptr_cast(SP#tl, ^d_node) ==> $result == 0;
  ensures ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $phys_ptr_cast(SP#hd, ^d_node) != $phys_ptr_cast(SP#tl, ^d_node)) ==> $result > 0;
  ensures ($non_null($phys_ptr_cast(SP#hd, ^d_node)) && $is_null($phys_ptr_cast(SP#tl, ^d_node))) ==> $result == F#dll_list_len_next($s, $phys_ptr_cast(SP#hd, ^d_node));
  free ensures $result == F#dll_lseg_len_next($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



procedure g_list_index(P#list: $ptr, P#data: int) returns ($result: int, OP#ret_list: $ptr);
  requires F#dll($s, $phys_ptr_cast(P#list, ^d_node));
  requires F#dll_list_len_next($s, $phys_ptr_cast(P#list, ^d_node)) < 2147483647;
  free requires -1 == $unchk_sub(^^i4, 0, 1);
  modifies $s, $cev_pc;
  free ensures $in_range_i4($result);
  ensures F#dll($s, $phys_ptr_cast(P#list, ^d_node));
  ensures F#dll($s, $phys_ptr_cast(OP#ret_list, ^d_node));
  ensures $intset_in(P#data, F#dll_keys($s, $phys_ptr_cast(P#list, ^d_node))) == ($result >= 0);
  ensures !$intset_in(P#data, F#dll_keys($s, $phys_ptr_cast(P#list, ^d_node))) == ($result == -1);
  ensures F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(OP#ret_list, ^d_node));
  ensures $oset_disjoint(F#dll_lseg_reach($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(OP#ret_list, ^d_node)), F#dll_reach($s, $phys_ptr_cast(OP#ret_list, ^d_node)));
  ensures $non_null($phys_ptr_cast(OP#ret_list, ^d_node)) ==> F#dll_lseg_len_next($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(OP#ret_list, ^d_node)) == $result;
  ensures $non_null($phys_ptr_cast(OP#ret_list, ^d_node)) ==> $rd_inv($s, d_node.key, $phys_ptr_cast(OP#ret_list, ^d_node)) == P#data;
  free ensures -1 == $unchk_sub(^^i4, 0, 1);
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation g_list_index(P#list: $ptr, P#data: int) returns ($result: int, OP#ret_list: $ptr)
{
  var stmtexpr0#2: $ptr;
  var SL#list0: $ptr;
  var loopState#16: $state;
  var L#i: int where $in_range_i4(L#i);
  var stmtexpr1#4: $oset;
  var stmtexpr0#3: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var local.list: $ptr;
  var #wrTime$3^5.3: int;
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
var p0201 : bool;
var p0202 : bool;
var p0203 : bool;
var p0204 : bool;
var p0205 : bool;
var p0206 : bool;
var p0207 : bool;
var p0208 : bool;
var p0209 : bool;
var p0210 : bool;
var p0211 : bool;
var p0212 : bool;
var p0213 : bool;
var p0214 : bool;
var p0215 : bool;
var p0216 : bool;
var p0217 : bool;
var p0218 : bool;
var p0219 : bool;
var p0220 : bool;
var p0221 : bool;
var p0222 : bool;
var p0223 : bool;
var p0224 : bool;
var p0225 : bool;
var p0226 : bool;
var p0227 : bool;
var p0228 : bool;
var p0229 : bool;
var p0230 : bool;
var p0231 : bool;
var p0232 : bool;
var p0233 : bool;
var p0234 : bool;
var p0235 : bool;
var p0236 : bool;

// INV:PTR: P#list, OP#ret_list, local.list
// INV:INT: P#data, L#i
// INV:LST: dll2
// INV:OLD: loopState#16

  anon140:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$3^5.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$3^5.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$3^5.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @in_range_i4(data); 
    assume $in_range_i4(P#data);
    // assume true
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    // struct d_node* local.list; 
    // local.list := list; 
    local.list := $phys_ptr_cast(P#list, ^d_node);
    // assume ==(-1, unchecked-(0, 1)); 
    assume -1 == $unchk_sub(^^i4, 0, 1);
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := dll_reach(local.list); 
    call SL#_dryad_G0 := dll_reach($phys_ptr_cast(local.list, ^d_node));
    assume $full_stop_ext(#tok$4^0.0, $s);
    // _math \oset stmtexpr0#3; 
    // stmtexpr0#3 := _dryad_G0; 
    stmtexpr0#3 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#4; 
    // stmtexpr1#4 := _dryad_G1; 
    stmtexpr1#4 := SL#_dryad_G1;
    // assume ==(glob_reach(), _dryad_G1); 
    assume F#glob_reach() == SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll(local.list), &&(&&(dll(*((local.list->next))), ==>(@_vcc_ptr_neq_null(*((local.list->next))), @_vcc_ptr_eq_pure(*((*((local.list->next))->prev)), local.list))), unchecked!(@_vcc_oset_in(local.list, dll_reach(*((local.list->next)))))))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(local.list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(local.list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_reach(local.list), @_vcc_oset_union(dll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(local.list, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_keys(local.list), @_vcc_intset_union(dll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_list_len_next(local.list), unchecked+(dll_list_len_next(*((local.list->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), 1);
    // int32_t i; 
    // assume ==>(@_vcc_ptr_neq_null(local.list), &&(@_vcc_mutable(@state, local.list), @writes_check(local.list))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> $mutable($s, $phys_ptr_cast(local.list, ^d_node)) && $top_writable($s, #wrTime$3^5.3, $phys_ptr_cast(local.list, ^d_node));
    // ret_list := local.list; 
    OP#ret_list := $phys_ptr_cast(local.list, ^d_node);
    // var int32_t i
    // i := 0; 
    L#i := 0;
    loopState#16 := $s;
    assume true;
	
p0000 := (F#dll($s,$phys_ptr_cast(P#list,^d_node)));
p0001 := (F#dll($s,$phys_ptr_cast(OP#ret_list,^d_node)));
p0002 := (F#dll($s,$phys_ptr_cast(local.list,^d_node)));
p0003 := (F#dll_lseg($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)));
p0004 := (F#dll_lseg($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)));
p0005 := (F#dll_lseg($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)));
p0006 := (F#dll_lseg($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)));
p0007 := (F#dll_lseg($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)));
p0008 := (F#dll_lseg($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)));
p0009 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0010 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0011 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0012 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0013 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0014 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0015 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0016 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0017 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0018 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0019 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0020 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0021 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0022 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0023 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0024 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0025 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0026 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0027 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0028 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0029 := ($oset_disjoint($oset_singleton($phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0030 := ($oset_disjoint($oset_singleton($phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0031 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0032 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0033 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0034 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0035 := ($oset_disjoint($oset_singleton($phys_ptr_cast(OP#ret_list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0036 := ($oset_disjoint($oset_singleton($phys_ptr_cast(OP#ret_list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0037 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0038 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0039 := ($non_null($phys_ptr_cast(P#list,^d_node)));
p0040 := ($non_null($phys_ptr_cast(OP#ret_list,^d_node)));
p0041 := ($non_null($phys_ptr_cast(local.list,^d_node)));
p0042 := ($is_null($phys_ptr_cast(P#list,^d_node)));
p0043 := ($is_null($phys_ptr_cast(OP#ret_list,^d_node)));
p0044 := ($is_null($phys_ptr_cast(local.list,^d_node)));
p0045 := (($phys_ptr_cast(P#list,^d_node) == $phys_ptr_cast(OP#ret_list,^d_node)));
p0046 := (($phys_ptr_cast(P#list,^d_node) == $phys_ptr_cast(local.list,^d_node)));
p0047 := (($phys_ptr_cast(OP#ret_list,^d_node) == $phys_ptr_cast(P#list,^d_node)));
p0048 := (($phys_ptr_cast(OP#ret_list,^d_node) == $phys_ptr_cast(local.list,^d_node)));
p0049 := (($phys_ptr_cast(local.list,^d_node) == $phys_ptr_cast(P#list,^d_node)));
p0050 := (($phys_ptr_cast(local.list,^d_node) == $phys_ptr_cast(OP#ret_list,^d_node)));
p0051 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node))));
p0052 := (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(OP#ret_list,^d_node),^d_node))));
p0053 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node))));
p0054 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node))));
p0055 := (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(OP#ret_list,^d_node),^d_node))));
p0056 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node))));
p0057 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node) == $phys_ptr_cast(OP#ret_list,^d_node))));
p0058 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node) == $phys_ptr_cast(local.list,^d_node))));
p0059 := (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(OP#ret_list,^d_node),^d_node) == $phys_ptr_cast(P#list,^d_node))));
p0060 := (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(OP#ret_list,^d_node),^d_node) == $phys_ptr_cast(local.list,^d_node))));
p0061 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node) == $phys_ptr_cast(P#list,^d_node))));
p0062 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node) == $phys_ptr_cast(OP#ret_list,^d_node))));
p0063 := ((!($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
p0064 := ((!($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
p0065 := ((!($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))))));
p0066 := ((!($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))))));
p0067 := ((!($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
p0068 := ((!($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
p0069 := ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))))));
p0070 := ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))))));
p0071 := ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))))));
p0072 := ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))))));
p0073 := ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node))))));
p0074 := ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node))))));
p0075 := ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node))))));
p0076 := ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node))))));
p0077 := ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))))));
p0078 := ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))))));
p0079 := ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))))));
p0080 := ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))))));
p0081 := ($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))));
p0082 := ($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))));
p0083 := ($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0084 := ($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0085 := ($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))));
p0086 := ($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))));
p0087 := ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0088 := ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0089 := ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0090 := ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0091 := ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0092 := ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0093 := ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0094 := ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0095 := ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0096 := ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0097 := ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0098 := ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0099 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0100 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))));
p0101 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))));
p0102 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))));
p0103 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))));
p0104 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0105 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0106 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0107 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0108 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0109 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0110 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0111 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0112 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0113 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0114 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0115 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0116 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0117 := ((F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0118 := ((F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0119 := ((F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0120 := ((F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0121 := ((F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0122 := ((F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0123 := ((F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0124 := ((F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0125 := ((F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0126 := ((F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0127 := ((F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0128 := ((F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0129 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0130 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0131 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0132 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0133 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0134 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0135 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0136 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0137 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0138 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0139 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0140 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0141 := ((P#data < 2147483647));
p0142 := ((L#i < 2147483647));
p0143 := ((P#data < 2147483647));
p0144 := ((L#i < 2147483647));
p0145 := ((P#data < 2147483647));
p0146 := ((L#i < 2147483647));
p0147 := ((P#data < 4294967295));
p0148 := ((L#i < 4294967295));
p0149 := ((P#data < 4294967295));
p0150 := ((L#i < 4294967295));
p0151 := ((P#data < 4294967295));
p0152 := ((L#i < 4294967295));
p0153 := ((P#data >= 0));
p0154 := ((L#i >= 0));
p0155 := ((P#data >= 0));
p0156 := ((L#i >= 0));
p0157 := ((P#data >= 0));
p0158 := ((L#i >= 0));
p0159 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) < P#data)));
p0160 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) < L#i)));
p0161 := (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) < P#data)));
p0162 := (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) < L#i)));
p0163 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) < P#data)));
p0164 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) < L#i)));
p0165 := ((($non_null($phys_ptr_cast(P#list,^d_node)) && $non_null($phys_ptr_cast(OP#ret_list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0166 := ((($non_null($phys_ptr_cast(P#list,^d_node)) && $non_null($phys_ptr_cast(local.list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)))));
p0167 := ((($non_null($phys_ptr_cast(OP#ret_list,^d_node)) && $non_null($phys_ptr_cast(P#list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)))));
p0168 := ((($non_null($phys_ptr_cast(OP#ret_list,^d_node)) && $non_null($phys_ptr_cast(local.list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)))));
p0169 := ((($non_null($phys_ptr_cast(local.list,^d_node)) && $non_null($phys_ptr_cast(P#list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)))));
p0170 := ((($non_null($phys_ptr_cast(local.list,^d_node)) && $non_null($phys_ptr_cast(OP#ret_list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0171 := ((($non_null($phys_ptr_cast(P#list,^d_node)) && $non_null($phys_ptr_cast(OP#ret_list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0172 := ((($non_null($phys_ptr_cast(P#list,^d_node)) && $non_null($phys_ptr_cast(local.list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)))));
p0173 := ((($non_null($phys_ptr_cast(OP#ret_list,^d_node)) && $non_null($phys_ptr_cast(P#list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)))));
p0174 := ((($non_null($phys_ptr_cast(OP#ret_list,^d_node)) && $non_null($phys_ptr_cast(local.list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)))));
p0175 := ((($non_null($phys_ptr_cast(local.list,^d_node)) && $non_null($phys_ptr_cast(P#list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)))));
p0176 := ((($non_null($phys_ptr_cast(local.list,^d_node)) && $non_null($phys_ptr_cast(OP#ret_list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0177 := ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == P#data));
p0178 := ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == L#i));
p0179 := ((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) == P#data));
p0180 := ((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) == L#i));
p0181 := ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == P#data));
p0182 := ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == L#i));
p0183 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == P#data));
p0184 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == L#i));
p0185 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == P#data));
p0186 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == L#i));
p0187 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)) == P#data));
p0188 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)) == L#i));
p0189 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)) == P#data));
p0190 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)) == L#i));
p0191 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == P#data));
p0192 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == L#i));
p0193 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == P#data));
p0194 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == L#i));
p0195 := ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == (P#data - L#i)));
p0196 := ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == (L#i - P#data)));
p0197 := ((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) == (P#data - L#i)));
p0198 := ((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) == (L#i - P#data)));
p0199 := ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == (P#data - L#i)));
p0200 := ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == (L#i - P#data)));
p0201 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == (P#data - L#i)));
p0202 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == (L#i - P#data)));
p0203 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == (P#data - L#i)));
p0204 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == (L#i - P#data)));
p0205 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)) == (P#data - L#i)));
p0206 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)) == (L#i - P#data)));
p0207 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)) == (P#data - L#i)));
p0208 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)) == (L#i - P#data)));
p0209 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == (P#data - L#i)));
p0210 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == (L#i - P#data)));
p0211 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == (P#data - L#i)));
p0212 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == (L#i - P#data)));
p0213 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == P#data));
p0214 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == L#i));
p0215 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == P#data));
p0216 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == L#i));
p0217 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == P#data));
p0218 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == L#i));
p0219 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == P#data));
p0220 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == L#i));
p0221 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == P#data));
p0222 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == L#i));
p0223 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == P#data));
p0224 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == L#i));
p0225 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == (P#data - L#i)));
p0226 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == (L#i - P#data)));
p0227 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == (P#data - L#i)));
p0228 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == (L#i - P#data)));
p0229 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == (P#data - L#i)));
p0230 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == (L#i - P#data)));
p0231 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == (P#data - L#i)));
p0232 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == (L#i - P#data)));
p0233 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == (P#data - L#i)));
p0234 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == (L#i - P#data)));
p0235 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == (P#data - L#i)));
p0236 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == (L#i - P#data)));

    while (true)


invariant (p0000 == (F#dll($s,$phys_ptr_cast(P#list,^d_node))));
invariant (p0001 == (F#dll($s,$phys_ptr_cast(OP#ret_list,^d_node))));
invariant (p0002 == (F#dll($s,$phys_ptr_cast(local.list,^d_node))));
invariant (p0003 == (F#dll_lseg($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
invariant (p0004 == (F#dll_lseg($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))));
invariant (p0005 == (F#dll_lseg($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node))));
invariant (p0006 == (F#dll_lseg($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node))));
invariant (p0007 == (F#dll_lseg($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))));
invariant (p0008 == (F#dll_lseg($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
invariant (p0009 == ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0010 == ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)))));
invariant (p0011 == ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)))));
invariant (p0012 == ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)))));
invariant (p0013 == ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)))));
invariant (p0014 == ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0015 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0016 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)))));
invariant (p0017 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)))));
invariant (p0018 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)))));
invariant (p0019 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)))));
invariant (p0020 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0021 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)))));
invariant (p0022 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0023 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)))));
invariant (p0024 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)))));
invariant (p0025 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0026 == ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)))));
invariant (p0027 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0028 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)))));
invariant (p0029 == ($oset_disjoint($oset_singleton($phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)))));
invariant (p0030 == ($oset_disjoint($oset_singleton($phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)))));
invariant (p0031 == ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)))));
invariant (p0032 == ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0033 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)))));
invariant (p0034 == ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0035 == ($oset_disjoint($oset_singleton($phys_ptr_cast(OP#ret_list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)))));
invariant (p0036 == ($oset_disjoint($oset_singleton($phys_ptr_cast(OP#ret_list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)))));
invariant (p0037 == ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0038 == ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)))));
invariant (p0039 == ($non_null($phys_ptr_cast(P#list,^d_node))));
invariant (p0040 == ($non_null($phys_ptr_cast(OP#ret_list,^d_node))));
invariant (p0041 == ($non_null($phys_ptr_cast(local.list,^d_node))));
invariant (p0042 == ($is_null($phys_ptr_cast(P#list,^d_node))));
invariant (p0043 == ($is_null($phys_ptr_cast(OP#ret_list,^d_node))));
invariant (p0044 == ($is_null($phys_ptr_cast(local.list,^d_node))));
invariant (p0045 == (($phys_ptr_cast(P#list,^d_node) == $phys_ptr_cast(OP#ret_list,^d_node))));
invariant (p0046 == (($phys_ptr_cast(P#list,^d_node) == $phys_ptr_cast(local.list,^d_node))));
invariant (p0047 == (($phys_ptr_cast(OP#ret_list,^d_node) == $phys_ptr_cast(P#list,^d_node))));
invariant (p0048 == (($phys_ptr_cast(OP#ret_list,^d_node) == $phys_ptr_cast(local.list,^d_node))));
invariant (p0049 == (($phys_ptr_cast(local.list,^d_node) == $phys_ptr_cast(P#list,^d_node))));
invariant (p0050 == (($phys_ptr_cast(local.list,^d_node) == $phys_ptr_cast(OP#ret_list,^d_node))));
invariant (p0051 == (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node)))));
invariant (p0052 == (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(OP#ret_list,^d_node),^d_node)))));
invariant (p0053 == (($non_null($phys_ptr_cast(local.list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node)))));
invariant (p0054 == (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node)))));
invariant (p0055 == (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(OP#ret_list,^d_node),^d_node)))));
invariant (p0056 == (($non_null($phys_ptr_cast(local.list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node)))));
invariant (p0057 == (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node) == $phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0058 == (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node) == $phys_ptr_cast(local.list,^d_node)))));
invariant (p0059 == (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(OP#ret_list,^d_node),^d_node) == $phys_ptr_cast(P#list,^d_node)))));
invariant (p0060 == (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(OP#ret_list,^d_node),^d_node) == $phys_ptr_cast(local.list,^d_node)))));
invariant (p0061 == (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node) == $phys_ptr_cast(P#list,^d_node)))));
invariant (p0062 == (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node) == $phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0063 == ((!($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))))));
invariant (p0064 == ((!($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))))));
invariant (p0065 == ((!($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))))));
invariant (p0066 == ((!($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))))));
invariant (p0067 == ((!($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))))));
invariant (p0068 == ((!($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))))));
invariant (p0069 == ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)))))));
invariant (p0070 == ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)))))));
invariant (p0071 == ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)))))));
invariant (p0072 == ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)))))));
invariant (p0073 == ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)))))));
invariant (p0074 == ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)))))));
invariant (p0075 == ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)))))));
invariant (p0076 == ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)))))));
invariant (p0077 == ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)))))));
invariant (p0078 == ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)))))));
invariant (p0079 == ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)))))));
invariant (p0080 == ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)))))));
invariant (p0081 == ($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
invariant (p0082 == ($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
invariant (p0083 == ($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0084 == ($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0085 == ($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
invariant (p0086 == ($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
invariant (p0087 == ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0088 == ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0089 == ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)))));
invariant (p0090 == ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)))));
invariant (p0091 == ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)))));
invariant (p0092 == ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)))));
invariant (p0093 == ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)))));
invariant (p0094 == ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)))));
invariant (p0095 == ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)))));
invariant (p0096 == ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)))));
invariant (p0097 == ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0098 == ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0099 == ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0100 == ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
invariant (p0101 == ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
invariant (p0102 == ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
invariant (p0103 == ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
invariant (p0104 == ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0105 == ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)))));
invariant (p0106 == ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0107 == ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)))));
invariant (p0108 == ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)))));
invariant (p0109 == ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)))));
invariant (p0110 == ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)))));
invariant (p0111 == ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
invariant (p0112 == ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))))));
invariant (p0113 == ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
invariant (p0114 == ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
invariant (p0115 == ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))))));
invariant (p0116 == ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
invariant (p0117 == ((F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))))));
invariant (p0118 == ((F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
invariant (p0119 == ((F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
invariant (p0120 == ((F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
invariant (p0121 == ((F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
invariant (p0122 == ((F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))))));
invariant (p0123 == ((F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))))));
invariant (p0124 == ((F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
invariant (p0125 == ((F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
invariant (p0126 == ((F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
invariant (p0127 == ((F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
invariant (p0128 == ((F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))))));
invariant (p0129 == ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))))));
invariant (p0130 == ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
invariant (p0131 == ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
invariant (p0132 == ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
invariant (p0133 == ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
invariant (p0134 == ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))))));
invariant (p0135 == ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))))));
invariant (p0136 == ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
invariant (p0137 == ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
invariant (p0138 == ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
invariant (p0139 == ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
invariant (p0140 == ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))))));
invariant (p0141 == ((P#data < 2147483647)));
invariant (p0142 == ((L#i < 2147483647)));
invariant (p0143 == ((P#data < 2147483647)));
invariant (p0144 == ((L#i < 2147483647)));
invariant (p0145 == ((P#data < 2147483647)));
invariant (p0146 == ((L#i < 2147483647)));
invariant (p0147 == ((P#data < 4294967295)));
invariant (p0148 == ((L#i < 4294967295)));
invariant (p0149 == ((P#data < 4294967295)));
invariant (p0150 == ((L#i < 4294967295)));
invariant (p0151 == ((P#data < 4294967295)));
invariant (p0152 == ((L#i < 4294967295)));
invariant (p0153 == ((P#data >= 0)));
invariant (p0154 == ((L#i >= 0)));
invariant (p0155 == ((P#data >= 0)));
invariant (p0156 == ((L#i >= 0)));
invariant (p0157 == ((P#data >= 0)));
invariant (p0158 == ((L#i >= 0)));
invariant (p0159 == (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) < P#data))));
invariant (p0160 == (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) < L#i))));
invariant (p0161 == (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) < P#data))));
invariant (p0162 == (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) < L#i))));
invariant (p0163 == (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) < P#data))));
invariant (p0164 == (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) < L#i))));
invariant (p0165 == ((($non_null($phys_ptr_cast(P#list,^d_node)) && $non_null($phys_ptr_cast(OP#ret_list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node))))));
invariant (p0166 == ((($non_null($phys_ptr_cast(P#list,^d_node)) && $non_null($phys_ptr_cast(local.list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node))))));
invariant (p0167 == ((($non_null($phys_ptr_cast(OP#ret_list,^d_node)) && $non_null($phys_ptr_cast(P#list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node))))));
invariant (p0168 == ((($non_null($phys_ptr_cast(OP#ret_list,^d_node)) && $non_null($phys_ptr_cast(local.list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node))))));
invariant (p0169 == ((($non_null($phys_ptr_cast(local.list,^d_node)) && $non_null($phys_ptr_cast(P#list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node))))));
invariant (p0170 == ((($non_null($phys_ptr_cast(local.list,^d_node)) && $non_null($phys_ptr_cast(OP#ret_list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node))))));
invariant (p0171 == ((($non_null($phys_ptr_cast(P#list,^d_node)) && $non_null($phys_ptr_cast(OP#ret_list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node))))));
invariant (p0172 == ((($non_null($phys_ptr_cast(P#list,^d_node)) && $non_null($phys_ptr_cast(local.list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node))))));
invariant (p0173 == ((($non_null($phys_ptr_cast(OP#ret_list,^d_node)) && $non_null($phys_ptr_cast(P#list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node))))));
invariant (p0174 == ((($non_null($phys_ptr_cast(OP#ret_list,^d_node)) && $non_null($phys_ptr_cast(local.list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node))))));
invariant (p0175 == ((($non_null($phys_ptr_cast(local.list,^d_node)) && $non_null($phys_ptr_cast(P#list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node))))));
invariant (p0176 == ((($non_null($phys_ptr_cast(local.list,^d_node)) && $non_null($phys_ptr_cast(OP#ret_list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node))))));
invariant (p0177 == ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == P#data)));
invariant (p0178 == ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == L#i)));
invariant (p0179 == ((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) == P#data)));
invariant (p0180 == ((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) == L#i)));
invariant (p0181 == ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == P#data)));
invariant (p0182 == ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == L#i)));
invariant (p0183 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == P#data)));
invariant (p0184 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == L#i)));
invariant (p0185 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == P#data)));
invariant (p0186 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == L#i)));
invariant (p0187 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)) == P#data)));
invariant (p0188 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)) == L#i)));
invariant (p0189 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)) == P#data)));
invariant (p0190 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)) == L#i)));
invariant (p0191 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == P#data)));
invariant (p0192 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == L#i)));
invariant (p0193 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == P#data)));
invariant (p0194 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == L#i)));
invariant (p0195 == ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == (P#data - L#i))));
invariant (p0196 == ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == (L#i - P#data))));
invariant (p0197 == ((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) == (P#data - L#i))));
invariant (p0198 == ((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) == (L#i - P#data))));
invariant (p0199 == ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == (P#data - L#i))));
invariant (p0200 == ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == (L#i - P#data))));
invariant (p0201 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == (P#data - L#i))));
invariant (p0202 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == (L#i - P#data))));
invariant (p0203 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == (P#data - L#i))));
invariant (p0204 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == (L#i - P#data))));
invariant (p0205 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)) == (P#data - L#i))));
invariant (p0206 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)) == (L#i - P#data))));
invariant (p0207 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)) == (P#data - L#i))));
invariant (p0208 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)) == (L#i - P#data))));
invariant (p0209 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == (P#data - L#i))));
invariant (p0210 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == (L#i - P#data))));
invariant (p0211 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == (P#data - L#i))));
invariant (p0212 == ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == (L#i - P#data))));
invariant (p0213 == (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == P#data)));
invariant (p0214 == (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == L#i)));
invariant (p0215 == (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == P#data)));
invariant (p0216 == (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == L#i)));
invariant (p0217 == (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == P#data)));
invariant (p0218 == (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == L#i)));
invariant (p0219 == (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == P#data)));
invariant (p0220 == (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == L#i)));
invariant (p0221 == (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == P#data)));
invariant (p0222 == (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == L#i)));
invariant (p0223 == (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == P#data)));
invariant (p0224 == (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == L#i)));
invariant (p0225 == (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == (P#data - L#i))));
invariant (p0226 == (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == (L#i - P#data))));
invariant (p0227 == (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == (P#data - L#i))));
invariant (p0228 == (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == (L#i - P#data))));
invariant (p0229 == (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == (P#data - L#i))));
invariant (p0230 == (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == (L#i - P#data))));
invariant (p0231 == (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == (P#data - L#i))));
invariant (p0232 == (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == (L#i - P#data))));
invariant (p0233 == (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == (P#data - L#i))));
invariant (p0234 == (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == (L#i - P#data))));
invariant (p0235 == (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == (P#data - L#i))));
invariant (p0236 == (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == (L#i - P#data))));

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
p0201,
p0202,
p0203,
p0204,
p0205,
p0206,
p0207,
p0208,
p0209,
p0210,
p0211,
p0212,
p0213,
p0214,
p0215,
p0216,
p0217,
p0218,
p0219,
p0220,
p0221,
p0222,
p0223,
p0224,
p0225,
p0226,
p0227,
p0228,
p0229,
p0230,
p0231,
p0232,
p0233,
p0234,
p0235,
p0236,
true
);


      invariant $non_null($phys_ptr_cast(local.list, ^d_node)) ==> $mutable($s, $phys_ptr_cast(local.list, ^d_node));
      invariant $non_null($phys_ptr_cast(local.list, ^d_node)) ==> $top_writable($s, #wrTime$3^5.3, $phys_ptr_cast(local.list, ^d_node));
    {
      anon139:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#16, $s);
        assume $full_stop_ext(#tok$3^23.3, $s);
        // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
        assume $meta_eq(loopState#16, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(local.list)) ...
        if ($non_null($phys_ptr_cast(local.list, ^d_node)))
        {
          anon136:
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll(local.list), &&(&&(dll(*((local.list->next))), ==>(@_vcc_ptr_neq_null(*((local.list->next))), @_vcc_ptr_eq_pure(*((*((local.list->next))->prev)), local.list))), unchecked!(@_vcc_oset_in(local.list, dll_reach(*((local.list->next)))))))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(local.list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(local.list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_reach(local.list), @_vcc_oset_union(dll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(local.list, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_keys(local.list), @_vcc_intset_union(dll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_list_len_next(local.list), unchecked+(dll_list_len_next(*((local.list->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg(list, local.list), &&(dll_lseg(*((list->next)), local.list), unchecked!(@_vcc_oset_in(list, dll_lseg_reach(*((list->next)), local.list)))))); 
            assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(P#list, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg_reach(list, local.list), @_vcc_oset_union(dll_lseg_reach(*((list->next)), local.list), @_vcc_oset_singleton(list)))); 
            assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)), $oset_singleton($phys_ptr_cast(P#list, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg_keys(list, local.list), @_vcc_intset_union(dll_lseg_keys(*((list->next)), local.list), @_vcc_intset_singleton(*((list->key)))))); 
            assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg_keys($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_lseg_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(P#list, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg_len_next(list, local.list), unchecked+(dll_lseg_len_next(*((list->next)), local.list), 1))); 
            assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg_len_next($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_lseg_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)), 1);
            // assert @reads_check_normal((local.list->key)); 
            assert $thread_local($s, $phys_ptr_cast(local.list, ^d_node));
            assume true;
            // if (==(*((local.list->key)), data)) ...
            if ($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node)) == P#data)
            {
              anon134:
                // return i; 
                $result := L#i;
                assume true;
                assert $position_marker();
                goto #exit;
            }
            else
            {
              anon135:
                // assert @_vcc_possibly_unreachable; 
                assert {:PossiblyUnreachable true} true;
            }

          anon137:
            // assert @in_range_i4(+(i, 1)); 
            assert $in_range_i4(L#i + 1);
            // i := +(i, 1); 
            L#i := L#i + 1;
            // struct d_node* list0; 
            // list0 := local.list; 
            SL#list0 := $phys_ptr_cast(local.list, ^d_node);
            // struct d_node* stmtexpr0#2; 
            // stmtexpr0#2 := list0; 
            stmtexpr0#2 := $phys_ptr_cast(SL#list0, ^d_node);
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll(local.list), &&(&&(dll(*((local.list->next))), ==>(@_vcc_ptr_neq_null(*((local.list->next))), @_vcc_ptr_eq_pure(*((*((local.list->next))->prev)), local.list))), unchecked!(@_vcc_oset_in(local.list, dll_reach(*((local.list->next)))))))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(local.list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(local.list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_reach(local.list), @_vcc_oset_union(dll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(local.list, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_keys(local.list), @_vcc_intset_union(dll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_list_len_next(local.list), unchecked+(dll_list_len_next(*((local.list->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_pure(local.list, *((local.list->next))), ==(dll_lseg(local.list, *((local.list->next))), &&(dll_lseg(*((local.list->next)), *((local.list->next))), unchecked!(@_vcc_oset_in(local.list, dll_lseg_reach(*((local.list->next)), *((local.list->next)))))))); 
            assume $phys_ptr_cast(local.list, ^d_node) != $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(local.list, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) && !$oset_in($phys_ptr_cast(local.list, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_pure(local.list, *((local.list->next))), ==(dll_lseg_reach(local.list, *((local.list->next))), @_vcc_oset_union(dll_lseg_reach(*((local.list->next)), *((local.list->next))), @_vcc_oset_singleton(local.list)))); 
            assume $phys_ptr_cast(local.list, ^d_node) != $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(local.list, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(local.list, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_pure(local.list, *((local.list->next))), ==(dll_lseg_keys(local.list, *((local.list->next))), @_vcc_intset_union(dll_lseg_keys(*((local.list->next)), *((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
            assume $phys_ptr_cast(local.list, ^d_node) != $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node) ==> F#dll_lseg_keys($s, $phys_ptr_cast(local.list, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) == $intset_union(F#dll_lseg_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_pure(local.list, *((local.list->next))), ==(dll_lseg_len_next(local.list, *((local.list->next))), unchecked+(dll_lseg_len_next(*((local.list->next)), *((local.list->next))), 1))); 
            assume $phys_ptr_cast(local.list, ^d_node) != $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node) ==> F#dll_lseg_len_next($s, $phys_ptr_cast(local.list, ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) == $unchk_add(^^nat, F#dll_lseg_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), 1);
            // assert @reads_check_normal((local.list->next)); 
            assert $thread_local($s, $phys_ptr_cast(local.list, ^d_node));
            // local.list := *((local.list->next)); 
            local.list := $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node);
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll(local.list), &&(&&(dll(*((local.list->next))), ==>(@_vcc_ptr_neq_null(*((local.list->next))), @_vcc_ptr_eq_pure(*((*((local.list->next))->prev)), local.list))), unchecked!(@_vcc_oset_in(local.list, dll_reach(*((local.list->next)))))))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(local.list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(local.list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_reach(local.list), @_vcc_oset_union(dll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(local.list, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_keys(local.list), @_vcc_intset_union(dll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_list_len_next(local.list), unchecked+(dll_list_len_next(*((local.list->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll(local.list), &&(&&(dll(*((local.list->next))), ==>(@_vcc_ptr_neq_null(*((local.list->next))), @_vcc_ptr_eq_pure(*((*((local.list->next))->prev)), local.list))), unchecked!(@_vcc_oset_in(local.list, dll_reach(*((local.list->next)))))))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(local.list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(local.list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_reach(local.list), @_vcc_oset_union(dll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(local.list, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_keys(local.list), @_vcc_intset_union(dll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_list_len_next(local.list), unchecked+(dll_list_len_next(*((local.list->next))), 1))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), 1);
            // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg(list, local.list), &&(dll_lseg(*((list->next)), local.list), unchecked!(@_vcc_oset_in(list, dll_lseg_reach(*((list->next)), local.list)))))); 
            assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == (F#dll_lseg($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(P#list, ^d_node), F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg_reach(list, local.list), @_vcc_oset_union(dll_lseg_reach(*((list->next)), local.list), @_vcc_oset_singleton(list)))); 
            assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg_reach($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_lseg_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)), $oset_singleton($phys_ptr_cast(P#list, ^d_node)));
            // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg_keys(list, local.list), @_vcc_intset_union(dll_lseg_keys(*((list->next)), local.list), @_vcc_intset_singleton(*((list->key)))))); 
            assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg_keys($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_lseg_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(P#list, ^d_node))));
            // assume ==>(@_vcc_ptr_neq_pure(list, local.list), ==(dll_lseg_len_next(list, local.list), unchecked+(dll_lseg_len_next(*((list->next)), local.list), 1))); 
            assume $phys_ptr_cast(P#list, ^d_node) != $phys_ptr_cast(local.list, ^d_node) ==> F#dll_lseg_len_next($s, $phys_ptr_cast(P#list, ^d_node), $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_lseg_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(P#list, ^d_node), ^d_node), $phys_ptr_cast(local.list, ^d_node)), 1);
            // ret_list := local.list; 
            OP#ret_list := $phys_ptr_cast(local.list, ^d_node);
            // assume ==>(@_vcc_ptr_neq_null(local.list), &&(@_vcc_mutable(@state, local.list), @writes_check(local.list))); 
            assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> $mutable($s, $phys_ptr_cast(local.list, ^d_node)) && $top_writable($s, #wrTime$3^5.3, $phys_ptr_cast(local.list, ^d_node));
        }
        else
        {
          anon138:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // goto #break_1; 
            goto #break_1;
        }

      #continue_1:
        assume true;
p0000 := (F#dll($s,$phys_ptr_cast(P#list,^d_node)));
p0001 := (F#dll($s,$phys_ptr_cast(OP#ret_list,^d_node)));
p0002 := (F#dll($s,$phys_ptr_cast(local.list,^d_node)));
p0003 := (F#dll_lseg($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)));
p0004 := (F#dll_lseg($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)));
p0005 := (F#dll_lseg($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)));
p0006 := (F#dll_lseg($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)));
p0007 := (F#dll_lseg($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)));
p0008 := (F#dll_lseg($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)));
p0009 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0010 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0011 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0012 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0013 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0014 := ($oset_disjoint(F#dll_reach($s,$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0015 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0016 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0017 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0018 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0019 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0020 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0021 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0022 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0023 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0024 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0025 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0026 := ($oset_disjoint(F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0027 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0028 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0029 := ($oset_disjoint($oset_singleton($phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0030 := ($oset_disjoint($oset_singleton($phys_ptr_cast(OP#ret_list,^d_node)),F#dll_reach($s,$phys_ptr_cast(local.list,^d_node))));
p0031 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(P#list,^d_node))));
p0032 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_reach($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0033 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0034 := ($oset_disjoint($oset_singleton($phys_ptr_cast(P#list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0035 := ($oset_disjoint($oset_singleton($phys_ptr_cast(OP#ret_list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0036 := ($oset_disjoint($oset_singleton($phys_ptr_cast(OP#ret_list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0037 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0038 := ($oset_disjoint($oset_singleton($phys_ptr_cast(local.list,^d_node)),F#dll_lseg_reach($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0039 := ($non_null($phys_ptr_cast(P#list,^d_node)));
p0040 := ($non_null($phys_ptr_cast(OP#ret_list,^d_node)));
p0041 := ($non_null($phys_ptr_cast(local.list,^d_node)));
p0042 := ($is_null($phys_ptr_cast(P#list,^d_node)));
p0043 := ($is_null($phys_ptr_cast(OP#ret_list,^d_node)));
p0044 := ($is_null($phys_ptr_cast(local.list,^d_node)));
p0045 := (($phys_ptr_cast(P#list,^d_node) == $phys_ptr_cast(OP#ret_list,^d_node)));
p0046 := (($phys_ptr_cast(P#list,^d_node) == $phys_ptr_cast(local.list,^d_node)));
p0047 := (($phys_ptr_cast(OP#ret_list,^d_node) == $phys_ptr_cast(P#list,^d_node)));
p0048 := (($phys_ptr_cast(OP#ret_list,^d_node) == $phys_ptr_cast(local.list,^d_node)));
p0049 := (($phys_ptr_cast(local.list,^d_node) == $phys_ptr_cast(P#list,^d_node)));
p0050 := (($phys_ptr_cast(local.list,^d_node) == $phys_ptr_cast(OP#ret_list,^d_node)));
p0051 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node))));
p0052 := (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(OP#ret_list,^d_node),^d_node))));
p0053 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> $non_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node))));
p0054 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node))));
p0055 := (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(OP#ret_list,^d_node),^d_node))));
p0056 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> $is_null($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node))));
p0057 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node) == $phys_ptr_cast(OP#ret_list,^d_node))));
p0058 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(P#list,^d_node),^d_node) == $phys_ptr_cast(local.list,^d_node))));
p0059 := (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(OP#ret_list,^d_node),^d_node) == $phys_ptr_cast(P#list,^d_node))));
p0060 := (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(OP#ret_list,^d_node),^d_node) == $phys_ptr_cast(local.list,^d_node))));
p0061 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node) == $phys_ptr_cast(P#list,^d_node))));
p0062 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_phys_ptr($s,d_node.next,$phys_ptr_cast(local.list,^d_node),^d_node) == $phys_ptr_cast(OP#ret_list,^d_node))));
p0063 := ((!($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
p0064 := ((!($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))))));
p0065 := ((!($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))))));
p0066 := ((!($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))))));
p0067 := ((!($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
p0068 := ((!($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))))));
p0069 := ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))))));
p0070 := ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))))));
p0071 := ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))))));
p0072 := ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))))));
p0073 := ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node))))));
p0074 := ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node))))));
p0075 := ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node))))));
p0076 := ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node))))));
p0077 := ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))))));
p0078 := ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))))));
p0079 := ((!($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))))));
p0080 := ((!($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))))));
p0081 := ($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))));
p0082 := ($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))));
p0083 := ($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0084 := ($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0085 := ($intset_in(P#data,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))));
p0086 := ($intset_in(L#i,F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))));
p0087 := ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0088 := ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0089 := ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0090 := ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0091 := ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0092 := ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0093 := ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0094 := ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0095 := ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0096 := ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0097 := ($intset_in(P#data,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0098 := ($intset_in(L#i,F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0099 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0100 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))));
p0101 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))));
p0102 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(local.list,^d_node))));
p0103 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(P#list,^d_node))));
p0104 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node))));
p0105 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0106 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0107 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node))));
p0108 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0109 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node))));
p0110 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == F#dll_lseg_keys($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node))));
p0111 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0112 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0113 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0114 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0115 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0116 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0117 := ((F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0118 := ((F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0119 := ((F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0120 := ((F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0121 := ((F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0122 := ((F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0123 := ((F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0124 := ((F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0125 := ((F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0126 := ((F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0127 := ((F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0128 := ((F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0129 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0130 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0131 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0132 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0133 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0134 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0135 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0136 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(P#list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0137 := ((F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0138 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(OP#ret_list,^d_node)),F#dll_keys($s,$phys_ptr_cast(local.list,^d_node)))));
p0139 := ((F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)))));
p0140 := ((F#dll_keys($s,$phys_ptr_cast(P#list,^d_node)) == $intset_union(F#dll_keys(loopState#16,$phys_ptr_cast(local.list,^d_node)),F#dll_keys($s,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0141 := ((P#data < 2147483647));
p0142 := ((L#i < 2147483647));
p0143 := ((P#data < 2147483647));
p0144 := ((L#i < 2147483647));
p0145 := ((P#data < 2147483647));
p0146 := ((L#i < 2147483647));
p0147 := ((P#data < 4294967295));
p0148 := ((L#i < 4294967295));
p0149 := ((P#data < 4294967295));
p0150 := ((L#i < 4294967295));
p0151 := ((P#data < 4294967295));
p0152 := ((L#i < 4294967295));
p0153 := ((P#data >= 0));
p0154 := ((L#i >= 0));
p0155 := ((P#data >= 0));
p0156 := ((L#i >= 0));
p0157 := ((P#data >= 0));
p0158 := ((L#i >= 0));
p0159 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) < P#data)));
p0160 := (($non_null($phys_ptr_cast(P#list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) < L#i)));
p0161 := (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) < P#data)));
p0162 := (($non_null($phys_ptr_cast(OP#ret_list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) < L#i)));
p0163 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) < P#data)));
p0164 := (($non_null($phys_ptr_cast(local.list,^d_node)) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) < L#i)));
p0165 := ((($non_null($phys_ptr_cast(P#list,^d_node)) && $non_null($phys_ptr_cast(OP#ret_list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0166 := ((($non_null($phys_ptr_cast(P#list,^d_node)) && $non_null($phys_ptr_cast(local.list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)))));
p0167 := ((($non_null($phys_ptr_cast(OP#ret_list,^d_node)) && $non_null($phys_ptr_cast(P#list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)))));
p0168 := ((($non_null($phys_ptr_cast(OP#ret_list,^d_node)) && $non_null($phys_ptr_cast(local.list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)))));
p0169 := ((($non_null($phys_ptr_cast(local.list,^d_node)) && $non_null($phys_ptr_cast(P#list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)))));
p0170 := ((($non_null($phys_ptr_cast(local.list,^d_node)) && $non_null($phys_ptr_cast(OP#ret_list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) <= $rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0171 := ((($non_null($phys_ptr_cast(P#list,^d_node)) && $non_null($phys_ptr_cast(OP#ret_list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0172 := ((($non_null($phys_ptr_cast(P#list,^d_node)) && $non_null($phys_ptr_cast(local.list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)))));
p0173 := ((($non_null($phys_ptr_cast(OP#ret_list,^d_node)) && $non_null($phys_ptr_cast(P#list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)))));
p0174 := ((($non_null($phys_ptr_cast(OP#ret_list,^d_node)) && $non_null($phys_ptr_cast(local.list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)))));
p0175 := ((($non_null($phys_ptr_cast(local.list,^d_node)) && $non_null($phys_ptr_cast(P#list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(P#list,^d_node)))));
p0176 := ((($non_null($phys_ptr_cast(local.list,^d_node)) && $non_null($phys_ptr_cast(OP#ret_list,^d_node))) ==> ($rd_inv($s,d_node.key,$phys_ptr_cast(local.list,^d_node)) == $rd_inv($s,d_node.key,$phys_ptr_cast(OP#ret_list,^d_node)))));
p0177 := ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == P#data));
p0178 := ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == L#i));
p0179 := ((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) == P#data));
p0180 := ((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) == L#i));
p0181 := ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == P#data));
p0182 := ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == L#i));
p0183 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == P#data));
p0184 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == L#i));
p0185 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == P#data));
p0186 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == L#i));
p0187 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)) == P#data));
p0188 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)) == L#i));
p0189 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)) == P#data));
p0190 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)) == L#i));
p0191 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == P#data));
p0192 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == L#i));
p0193 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == P#data));
p0194 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == L#i));
p0195 := ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == (P#data - L#i)));
p0196 := ((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) == (L#i - P#data)));
p0197 := ((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) == (P#data - L#i)));
p0198 := ((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) == (L#i - P#data)));
p0199 := ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == (P#data - L#i)));
p0200 := ((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) == (L#i - P#data)));
p0201 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == (P#data - L#i)));
p0202 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == (L#i - P#data)));
p0203 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == (P#data - L#i)));
p0204 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(P#list,^d_node),$phys_ptr_cast(local.list,^d_node)) == (L#i - P#data)));
p0205 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)) == (P#data - L#i)));
p0206 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(P#list,^d_node)) == (L#i - P#data)));
p0207 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)) == (P#data - L#i)));
p0208 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node),$phys_ptr_cast(local.list,^d_node)) == (L#i - P#data)));
p0209 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == (P#data - L#i)));
p0210 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(P#list,^d_node)) == (L#i - P#data)));
p0211 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == (P#data - L#i)));
p0212 := ((F#dll_lseg_len_next($s,$phys_ptr_cast(local.list,^d_node),$phys_ptr_cast(OP#ret_list,^d_node)) == (L#i - P#data)));
p0213 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == P#data));
p0214 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == L#i));
p0215 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == P#data));
p0216 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == L#i));
p0217 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == P#data));
p0218 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == L#i));
p0219 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == P#data));
p0220 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == L#i));
p0221 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == P#data));
p0222 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == L#i));
p0223 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == P#data));
p0224 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == L#i));
p0225 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == (P#data - L#i)));
p0226 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == (L#i - P#data)));
p0227 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == (P#data - L#i)));
p0228 := (((F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == (L#i - P#data)));
p0229 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == (P#data - L#i)));
p0230 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == (L#i - P#data)));
p0231 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == (P#data - L#i)));
p0232 := (((F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node))) == (L#i - P#data)));
p0233 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == (P#data - L#i)));
p0234 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(P#list,^d_node))) == (L#i - P#data)));
p0235 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == (P#data - L#i)));
p0236 := (((F#dll_list_len_next($s,$phys_ptr_cast(local.list,^d_node)) - F#dll_list_len_next($s,$phys_ptr_cast(OP#ret_list,^d_node))) == (L#i - P#data)));

    }

  anon141:
    assume $full_stop_ext(#tok$3^23.3, $s);

  #break_1:
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll(local.list), &&(&&(dll(*((local.list->next))), ==>(@_vcc_ptr_neq_null(*((local.list->next))), @_vcc_ptr_eq_pure(*((*((local.list->next))->prev)), local.list))), unchecked!(@_vcc_oset_in(local.list, dll_reach(*((local.list->next)))))))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll($s, $phys_ptr_cast(local.list, ^d_node)) == (F#dll($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) && ($non_null($rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)) ==> $rd_phys_ptr($s, d_node.prev, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node), ^d_node) == $phys_ptr_cast(local.list, ^d_node)) && !$oset_in($phys_ptr_cast(local.list, ^d_node), F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_reach(local.list), @_vcc_oset_union(dll_reach(*((local.list->next))), @_vcc_oset_singleton(local.list)))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_reach($s, $phys_ptr_cast(local.list, ^d_node)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $oset_singleton($phys_ptr_cast(local.list, ^d_node)));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_keys(local.list), @_vcc_intset_union(dll_keys(*((local.list->next))), @_vcc_intset_singleton(*((local.list->key)))))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_keys($s, $phys_ptr_cast(local.list, ^d_node)) == $intset_union(F#dll_keys($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), $intset_singleton($rd_inv($s, d_node.key, $phys_ptr_cast(local.list, ^d_node))));
    // assume ==>(@_vcc_ptr_neq_null(local.list), ==(dll_list_len_next(local.list), unchecked+(dll_list_len_next(*((local.list->next))), 1))); 
    assume $non_null($phys_ptr_cast(local.list, ^d_node)) ==> F#dll_list_len_next($s, $phys_ptr_cast(local.list, ^d_node)) == $unchk_add(^^nat, F#dll_list_len_next($s, $rd_phys_ptr($s, d_node.next, $phys_ptr_cast(local.list, ^d_node), ^d_node)), 1);
    // return -1; 
    $result := -1;
    assume true;
    assert $position_marker();
    goto #exit;

  anon142:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$3^23.3: $token;

const unique #tok$4^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(4, #file^?3Cno?20file?3E);

const unique #tok$3^5.3: $token;

const unique #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad_Bin?5CTests?5Cglist?5Cg_list_index.c: $token;

axiom $file_name_is(3, #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad_Bin?5CTests?5Cglist?5Cg_list_index.c);

const unique #file^c?3A?5Cusers?5Cdaniel?5Cworkspace?5Cvcdryad_bin?5Ctests?5Cglist?5Cdryad_dll_lseg_defs.h: $token;

axiom $file_name_is(2, #file^c?3A?5Cusers?5Cdaniel?5Cworkspace?5Cvcdryad_bin?5Ctests?5Cglist?5Cdryad_dll_lseg_defs.h);

const unique #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad?5Cvcc?5CHost?5Cbin?5CHeaders?5Cvccp.h: $token;

axiom $file_name_is(1, #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad?5Cvcc?5CHost?5Cbin?5CHeaders?5Cvccp.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^d_node);

