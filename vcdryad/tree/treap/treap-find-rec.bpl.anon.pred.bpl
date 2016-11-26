
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

axiom $arch_ptr_size == 8;

axiom $arch_spec_ptr_start == $max.u8;

const unique ^$##thread_id: $ctype;

axiom $def_math_type(^$##thread_id);

type $##thread_id;

const unique ^$##club: $ctype;

axiom $def_math_type(^$##club);

type $##club;

const unique ^b_node: $ctype;

axiom $is_span_sequential(^b_node);

axiom $def_struct_type(^b_node, 24, false, false);

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2(#s1, #s2, #p, ^b_node) } $inv2(#s1, #s2, #p, ^b_node) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2_without_lemmas(#s1, #s2, #p, ^b_node) } $inv2_without_lemmas(#s1, #s2, #p, ^b_node) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall p: $ptr, q: $ptr, s: $state :: { $in(q, $composite_extent(s, p, ^b_node)) } $in(q, $composite_extent(s, p, ^b_node)) == (q == p));

const unique b_node.left: $field;

axiom $def_phys_field(^b_node, b_node.left, $ptr_to(^b_node), false, 0);

const unique b_node.right: $field;

axiom $def_phys_field(^b_node, b_node.right, $ptr_to(^b_node), false, 8);

const unique b_node.key: $field;

axiom $def_phys_field(^b_node, b_node.key, ^^i4, false, 16);

const unique b_node.prio: $field;

axiom $def_phys_field(^b_node, b_node.prio, ^^i4, false, 20);

const unique ^$#_purecall_handler#1: $ctype;

axiom $def_fnptr_type(^$#_purecall_handler#1);

type $#_purecall_handler#1;

const unique ^$#_invalid_parameter_handler#2: $ctype;

axiom $def_fnptr_type(^$#_invalid_parameter_handler#2);

type $#_invalid_parameter_handler#2;

const unique ^$#treap_find_rec.c..36261#3: $ctype;

axiom $def_fnptr_type(^$#treap_find_rec.c..36261#3);

type $#treap_find_rec.c..36261#3;

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



function F#treap(#s: $state, SP#root: $ptr) : bool;

const unique cf#treap: $pure_function;

axiom (forall #s: $state, SP#root: $ptr :: { F#treap(#s, SP#root) } 1 < $decreases_level ==> $is_null($phys_ptr_cast(SP#root, ^b_node)) ==> F#treap(#s, SP#root));

axiom $function_arg_type(cf#treap, 0, ^^bool);

axiom $function_arg_type(cf#treap, 1, $ptr_to(^b_node));

procedure treap(SP#root: $ptr) returns ($result: bool);
  ensures $is_null($phys_ptr_cast(SP#root, ^b_node)) ==> $result;
  free ensures $result == F#treap($s, SP#root);
  free ensures $call_transition(old($s), $s);



function F#treap_reach(#s: $state, SP#root: $ptr) : $oset;

const unique cf#treap_reach: $pure_function;

axiom (forall #s: $state, SP#root: $ptr :: { F#treap_reach(#s, SP#root) } 1 < $decreases_level ==> ($non_null($phys_ptr_cast(SP#root, ^b_node)) ==> $oset_in($phys_ptr_cast(SP#root, ^b_node), F#treap_reach(#s, SP#root))) && ($is_null($phys_ptr_cast(SP#root, ^b_node)) ==> F#treap_reach(#s, SP#root) == $oset_empty()));

axiom $function_arg_type(cf#treap_reach, 0, ^$#oset);

axiom $function_arg_type(cf#treap_reach, 1, $ptr_to(^b_node));

procedure treap_reach(SP#root: $ptr) returns ($result: $oset);
  ensures $non_null($phys_ptr_cast(SP#root, ^b_node)) ==> $oset_in($phys_ptr_cast(SP#root, ^b_node), $result);
  ensures $is_null($phys_ptr_cast(SP#root, ^b_node)) ==> $result == $oset_empty();
  free ensures $result == F#treap_reach($s, SP#root);
  free ensures $call_transition(old($s), $s);



function F#treap_keys(#s: $state, SP#root: $ptr) : $intset;

const unique cf#treap_keys: $pure_function;

axiom (forall #s: $state, SP#root: $ptr :: { F#treap_keys(#s, SP#root) } 1 < $decreases_level ==> ($non_null($phys_ptr_cast(SP#root, ^b_node)) ==> $intset_in($rd_inv(#s, b_node.key, $phys_ptr_cast(SP#root, ^b_node)), F#treap_keys(#s, SP#root))) && ($is_null($phys_ptr_cast(SP#root, ^b_node)) ==> F#treap_keys(#s, SP#root) == $intset_empty()));

axiom $function_arg_type(cf#treap_keys, 0, ^$#intset);

axiom $function_arg_type(cf#treap_keys, 1, $ptr_to(^b_node));

procedure treap_keys(SP#root: $ptr) returns ($result: $intset);
  ensures $non_null($phys_ptr_cast(SP#root, ^b_node)) ==> $intset_in($rd_inv($s, b_node.key, $phys_ptr_cast(SP#root, ^b_node)), $result);
  ensures $is_null($phys_ptr_cast(SP#root, ^b_node)) ==> $result == $intset_empty();
  free ensures $result == F#treap_keys($s, SP#root);
  free ensures $call_transition(old($s), $s);



function F#treap_prios(#s: $state, SP#root: $ptr) : $intset;

const unique cf#treap_prios: $pure_function;

axiom (forall #s: $state, SP#root: $ptr :: { F#treap_prios(#s, SP#root) } 1 < $decreases_level ==> ($non_null($phys_ptr_cast(SP#root, ^b_node)) ==> $intset_in($rd_inv(#s, b_node.prio, $phys_ptr_cast(SP#root, ^b_node)), F#treap_prios(#s, SP#root))) && ($is_null($phys_ptr_cast(SP#root, ^b_node)) ==> F#treap_prios(#s, SP#root) == $intset_empty()));

axiom $function_arg_type(cf#treap_prios, 0, ^$#intset);

axiom $function_arg_type(cf#treap_prios, 1, $ptr_to(^b_node));

procedure treap_prios(SP#root: $ptr) returns ($result: $intset);
  ensures $non_null($phys_ptr_cast(SP#root, ^b_node)) ==> $intset_in($rd_inv($s, b_node.prio, $phys_ptr_cast(SP#root, ^b_node)), $result);
  ensures $is_null($phys_ptr_cast(SP#root, ^b_node)) ==> $result == $intset_empty();
  free ensures $result == F#treap_prios($s, SP#root);
  free ensures $call_transition(old($s), $s);



function F#treap_min_key(#s: $state, SP#root: $ptr) : int;

const unique cf#treap_min_key: $pure_function;

axiom (forall #s: $state, SP#root: $ptr :: { F#treap_min_key(#s, SP#root) } 1 < $decreases_level ==> $in_range_i4(F#treap_min_key(#s, SP#root)) && ($non_null($phys_ptr_cast(SP#root, ^b_node)) && $is_null($rd_phys_ptr(#s, b_node.left, $phys_ptr_cast(SP#root, ^b_node), ^b_node)) && $is_null($rd_phys_ptr(#s, b_node.right, $phys_ptr_cast(SP#root, ^b_node), ^b_node)) ==> F#treap_min_key(#s, SP#root) == $rd_inv(#s, b_node.key, $phys_ptr_cast(SP#root, ^b_node))));

axiom $function_arg_type(cf#treap_min_key, 0, ^^i4);

axiom $function_arg_type(cf#treap_min_key, 1, $ptr_to(^b_node));

procedure treap_min_key(SP#root: $ptr) returns ($result: int);
  free ensures $in_range_i4($result);
  ensures $non_null($phys_ptr_cast(SP#root, ^b_node)) && $is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(SP#root, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(SP#root, ^b_node), ^b_node)) ==> $result == $rd_inv($s, b_node.key, $phys_ptr_cast(SP#root, ^b_node));
  free ensures $result == F#treap_min_key($s, SP#root);
  free ensures $call_transition(old($s), $s);



function F#treap_max_key(#s: $state, SP#root: $ptr) : int;

const unique cf#treap_max_key: $pure_function;

axiom (forall #s: $state, SP#root: $ptr :: { F#treap_max_key(#s, SP#root) } 1 < $decreases_level ==> $in_range_i4(F#treap_max_key(#s, SP#root)) && ($non_null($phys_ptr_cast(SP#root, ^b_node)) && $is_null($rd_phys_ptr(#s, b_node.left, $phys_ptr_cast(SP#root, ^b_node), ^b_node)) && $is_null($rd_phys_ptr(#s, b_node.right, $phys_ptr_cast(SP#root, ^b_node), ^b_node)) ==> F#treap_max_key(#s, SP#root) == $rd_inv(#s, b_node.key, $phys_ptr_cast(SP#root, ^b_node))));

axiom $function_arg_type(cf#treap_max_key, 0, ^^i4);

axiom $function_arg_type(cf#treap_max_key, 1, $ptr_to(^b_node));

procedure treap_max_key(SP#root: $ptr) returns ($result: int);
  free ensures $in_range_i4($result);
  ensures $non_null($phys_ptr_cast(SP#root, ^b_node)) && $is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(SP#root, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(SP#root, ^b_node), ^b_node)) ==> $result == $rd_inv($s, b_node.key, $phys_ptr_cast(SP#root, ^b_node));
  free ensures $result == F#treap_max_key($s, SP#root);
  free ensures $call_transition(old($s), $s);



function F#treap_max_prio(#s: $state, SP#root: $ptr) : int;

const unique cf#treap_max_prio: $pure_function;

axiom (forall #s: $state, SP#root: $ptr :: { F#treap_max_prio(#s, SP#root) } 1 < $decreases_level ==> $in_range_i4(F#treap_max_prio(#s, SP#root)) && ($non_null($phys_ptr_cast(SP#root, ^b_node)) && $is_null($rd_phys_ptr(#s, b_node.left, $phys_ptr_cast(SP#root, ^b_node), ^b_node)) && $is_null($rd_phys_ptr(#s, b_node.right, $phys_ptr_cast(SP#root, ^b_node), ^b_node)) ==> F#treap_max_prio(#s, SP#root) == $rd_inv(#s, b_node.prio, $phys_ptr_cast(SP#root, ^b_node))));

axiom $function_arg_type(cf#treap_max_prio, 0, ^^i4);

axiom $function_arg_type(cf#treap_max_prio, 1, $ptr_to(^b_node));

procedure treap_max_prio(SP#root: $ptr) returns ($result: int);
  free ensures $in_range_i4($result);
  ensures $non_null($phys_ptr_cast(SP#root, ^b_node)) && $is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(SP#root, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(SP#root, ^b_node), ^b_node)) ==> $result == $rd_inv($s, b_node.prio, $phys_ptr_cast(SP#root, ^b_node));
  free ensures $result == F#treap_max_prio($s, SP#root);
  free ensures $call_transition(old($s), $s);



procedure treap_find_rec(P#x: $ptr, P#k: int) returns ($result: int);
  requires F#treap($s, $phys_ptr_cast(P#x, ^b_node));
  modifies $s, $cev_pc;
  free ensures $in_range_i4($result);
  ensures F#treap($s, $phys_ptr_cast(P#x, ^b_node));
  ensures ($result == 0) == !$intset_in(P#k, F#treap_keys($s, $phys_ptr_cast(P#x, ^b_node)));
  ensures ($result == 1) == $intset_in(P#k, F#treap_keys($s, $phys_ptr_cast(P#x, ^b_node)));
ensures b0000 ==> (F#treap($s,$phys_ptr_cast(P#x,^b_node)));
ensures b0001 ==> ((F#treap_reach($s,$phys_ptr_cast(P#x,^b_node)) == F#treap_reach(old($s),$phys_ptr_cast(P#x,^b_node))));
ensures b0002 ==> ($non_null($phys_ptr_cast(P#x,^b_node)));
ensures b0003 ==> ($is_null($phys_ptr_cast(P#x,^b_node)));
ensures b0004 ==> (($non_null($phys_ptr_cast(P#x,^b_node)) ==> $non_null($rd_phys_ptr($s,b_node.left,$phys_ptr_cast(P#x,^b_node),^b_node))));
ensures b0005 ==> (($non_null($phys_ptr_cast(P#x,^b_node)) ==> $is_null($rd_phys_ptr($s,b_node.left,$phys_ptr_cast(P#x,^b_node),^b_node))));
ensures b0006 ==> (($non_null($phys_ptr_cast(P#x,^b_node)) ==> $non_null($rd_phys_ptr($s,b_node.right,$phys_ptr_cast(P#x,^b_node),^b_node))));
ensures b0007 ==> (($non_null($phys_ptr_cast(P#x,^b_node)) ==> $is_null($rd_phys_ptr($s,b_node.right,$phys_ptr_cast(P#x,^b_node),^b_node))));
ensures b0008 ==> ((F#treap_keys($s,$phys_ptr_cast(P#x,^b_node)) == F#treap_keys(old($s),$phys_ptr_cast(P#x,^b_node))));
ensures b0009 ==> ((F#treap_keys($s,$phys_ptr_cast(P#x,^b_node)) == $intset_union(F#treap_keys(old($s),$phys_ptr_cast(P#x,^b_node)),$intset_singleton(P#k))));
ensures b0010 ==> ((F#treap_keys($s,$phys_ptr_cast(P#x,^b_node)) == $intset_union(F#treap_keys(old($s),$phys_ptr_cast(P#x,^b_node)),$intset_singleton($result))));
ensures b0011 ==> ((F#treap_keys(old($s),$phys_ptr_cast(P#x,^b_node)) == $intset_union(F#treap_keys($s,$phys_ptr_cast(P#x,^b_node)),$intset_singleton(P#k))));
ensures b0012 ==> ((F#treap_keys(old($s),$phys_ptr_cast(P#x,^b_node)) == $intset_union(F#treap_keys($s,$phys_ptr_cast(P#x,^b_node)),$intset_singleton($result))));
ensures b0013 ==> ((P#k < 2147483647));
ensures b0014 ==> (($result < 2147483647));
ensures b0015 ==> ((P#k < 4294967295));
ensures b0016 ==> (($result < 4294967295));
ensures b0017 ==> ((P#k >= 0));
ensures b0018 ==> (($result >= 0));
ensures b0019 ==> (($rd_inv($s,b_node.key,$phys_ptr_cast(P#x,^b_node)) < P#k));
ensures b0020 ==> (($rd_inv($s,b_node.key,$phys_ptr_cast(P#x,^b_node)) < $result));
ensures b0021 ==> ((F#treap_min_key($s,$phys_ptr_cast(P#x,^b_node)) == F#treap_min_key(old($s),$phys_ptr_cast(P#x,^b_node))));
ensures b0022 ==> ((F#treap_max_key($s,$phys_ptr_cast(P#x,^b_node)) == F#treap_max_key(old($s),$phys_ptr_cast(P#x,^b_node))));
ensures b0023 ==> ((F#treap_prios($s,$phys_ptr_cast(P#x,^b_node)) == F#treap_prios(old($s),$phys_ptr_cast(P#x,^b_node))));
ensures b0024 ==> ((F#treap_max_prio($s,$phys_ptr_cast(P#x,^b_node)) == F#treap_max_prio(old($s),$phys_ptr_cast(P#x,^b_node))));

  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);

// INV:PTR: P#x
// INV:INT: P#k, $result
// INV:LST: treap


implementation treap_find_rec(P#x: $ptr, P#k: int) returns ($result: int)
{
  var stmtexpr1#4: $state;
  var _dryad_S1#2: $state;
  var stmtexpr0#3: $state;
  var _dryad_S0#1: $state;
  var r#0: int where $in_range_i4(r#0);
  var stmtexpr1#2: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr0#1: $state;
  var SL#_dryad_S0: $state;
  var L#r: int where $in_range_i4(L#r);
  var stmtexpr1#6: $oset;
  var stmtexpr0#5: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$2^5.3: int;
  var #stackframe: int;

  anon7:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$2^5.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$2^5.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$2^5.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @in_range_i4(k); 
    assume $in_range_i4(P#k);
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := treap_reach(x); 
    call SL#_dryad_G0 := treap_reach($phys_ptr_cast(P#x, ^b_node));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _math \oset stmtexpr0#5; 
    // stmtexpr0#5 := _dryad_G0; 
    stmtexpr0#5 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#6; 
    // stmtexpr1#6 := _dryad_G1; 
    stmtexpr1#6 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(x), ==(treap(x), &&(&&(&&(&&(&&(&&(&&(&&(&&(&&(&&(treap(*((x->left))), treap(*((x->right)))), unchecked!(@_vcc_oset_in(x, @_vcc_oset_union(treap_reach(*((x->left))), treap_reach(*((x->right))))))), unchecked!(@_vcc_intset_in(*((x->key)), @_vcc_intset_union(treap_keys(*((x->left))), treap_keys(*((x->right))))))), unchecked!(@_vcc_intset_in(*((x->prio)), @_vcc_intset_union(treap_prios(*((x->left))), treap_prios(*((x->right))))))), @_vcc_oset_disjoint(treap_reach(*((x->left))), treap_reach(*((x->right))))), @_vcc_intset_disjoint(treap_keys(*((x->left))), treap_keys(*((x->right))))), @_vcc_intset_disjoint(treap_prios(*((x->left))), treap_prios(*((x->right))))), ==>(@_vcc_ptr_neq_null(*((x->left))), <(treap_max_key(*((x->left))), *((x->key))))), ==>(@_vcc_ptr_neq_null(*((x->right))), <(*((x->key)), treap_min_key(*((x->right)))))), ==>(@_vcc_ptr_neq_null(*((x->left))), <(treap_max_prio(*((x->left))), *((x->prio))))), ==>(@_vcc_ptr_neq_null(*((x->right))), <(treap_max_prio(*((x->right))), *((x->prio))))))); 
    assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap($s, $phys_ptr_cast(P#x, ^b_node)) == (F#treap($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && F#treap($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && !$oset_in($phys_ptr_cast(P#x, ^b_node), $oset_union(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && !$intset_in($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $intset_union(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && !$intset_in($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), $intset_union(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && $oset_disjoint(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && $intset_disjoint(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && $intset_disjoint(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> $rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)) < F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))));
    // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_reach(x), @_vcc_oset_union(@_vcc_oset_singleton(x), @_vcc_oset_union(treap_reach(*((x->left))), treap_reach(*((x->right))))))); 
    assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_reach($s, $phys_ptr_cast(P#x, ^b_node)) == $oset_union($oset_singleton($phys_ptr_cast(P#x, ^b_node)), $oset_union(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
    // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_keys(x), @_vcc_intset_union(@_vcc_intset_singleton(*((x->key))), @_vcc_intset_union(treap_keys(*((x->left))), treap_keys(*((x->right))))))); 
    assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_keys($s, $phys_ptr_cast(P#x, ^b_node)) == $intset_union($intset_singleton($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node))), $intset_union(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
    // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), @\int_max(treap_max_key(*((x->left))), treap_max_key(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), treap_max_key(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), treap_max_key(*((x->right)))))))); 
    assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $int_max(F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
    // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), @\int_max(treap_max_prio(*((x->left))), treap_max_prio(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), treap_max_prio(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), treap_max_prio(*((x->right)))))))); 
    assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), $int_max(F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
    // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), @\int_min(treap_min_key(*((x->left))), treap_min_key(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), treap_min_key(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), treap_min_key(*((x->right)))))))); 
    assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $int_min(F#treap_min_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
    // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_prios(x), @_vcc_intset_union(@_vcc_intset_singleton(*((x->prio))), @_vcc_intset_union(treap_prios(*((x->left))), treap_prios(*((x->right))))))); 
    assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_prios($s, $phys_ptr_cast(P#x, ^b_node)) == $intset_union($intset_singleton($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))), $intset_union(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
    // assume ==>(@_vcc_ptr_neq_null(x), &&(@_vcc_mutable(@state, x), @writes_check(x))); 
    assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> $mutable($s, $phys_ptr_cast(P#x, ^b_node)) && $top_writable($s, #wrTime$2^5.3, $phys_ptr_cast(P#x, ^b_node));
    assume true;
    // if (@_vcc_ptr_eq_null(x)) ...
    if ($is_null($phys_ptr_cast(P#x, ^b_node)))
    {
      anon1:
        // return 0; 
        $result := 0;
        assume true;
        assert $position_marker();
        goto #exit;
    }
    else
    {
      anon6:
        // assume ==>(@_vcc_ptr_neq_null(x), ==(treap(x), &&(&&(&&(&&(&&(&&(&&(&&(&&(&&(&&(treap(*((x->left))), treap(*((x->right)))), unchecked!(@_vcc_oset_in(x, @_vcc_oset_union(treap_reach(*((x->left))), treap_reach(*((x->right))))))), unchecked!(@_vcc_intset_in(*((x->key)), @_vcc_intset_union(treap_keys(*((x->left))), treap_keys(*((x->right))))))), unchecked!(@_vcc_intset_in(*((x->prio)), @_vcc_intset_union(treap_prios(*((x->left))), treap_prios(*((x->right))))))), @_vcc_oset_disjoint(treap_reach(*((x->left))), treap_reach(*((x->right))))), @_vcc_intset_disjoint(treap_keys(*((x->left))), treap_keys(*((x->right))))), @_vcc_intset_disjoint(treap_prios(*((x->left))), treap_prios(*((x->right))))), ==>(@_vcc_ptr_neq_null(*((x->left))), <(treap_max_key(*((x->left))), *((x->key))))), ==>(@_vcc_ptr_neq_null(*((x->right))), <(*((x->key)), treap_min_key(*((x->right)))))), ==>(@_vcc_ptr_neq_null(*((x->left))), <(treap_max_prio(*((x->left))), *((x->prio))))), ==>(@_vcc_ptr_neq_null(*((x->right))), <(treap_max_prio(*((x->right))), *((x->prio))))))); 
        assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap($s, $phys_ptr_cast(P#x, ^b_node)) == (F#treap($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && F#treap($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && !$oset_in($phys_ptr_cast(P#x, ^b_node), $oset_union(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && !$intset_in($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $intset_union(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && !$intset_in($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), $intset_union(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && $oset_disjoint(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && $intset_disjoint(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && $intset_disjoint(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> $rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)) < F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))));
        // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_reach(x), @_vcc_oset_union(@_vcc_oset_singleton(x), @_vcc_oset_union(treap_reach(*((x->left))), treap_reach(*((x->right))))))); 
        assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_reach($s, $phys_ptr_cast(P#x, ^b_node)) == $oset_union($oset_singleton($phys_ptr_cast(P#x, ^b_node)), $oset_union(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
        // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_keys(x), @_vcc_intset_union(@_vcc_intset_singleton(*((x->key))), @_vcc_intset_union(treap_keys(*((x->left))), treap_keys(*((x->right))))))); 
        assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_keys($s, $phys_ptr_cast(P#x, ^b_node)) == $intset_union($intset_singleton($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node))), $intset_union(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
        // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), @\int_max(treap_max_key(*((x->left))), treap_max_key(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), treap_max_key(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), treap_max_key(*((x->right)))))))); 
        assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $int_max(F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
        // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), @\int_max(treap_max_prio(*((x->left))), treap_max_prio(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), treap_max_prio(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), treap_max_prio(*((x->right)))))))); 
        assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), $int_max(F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
        // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), @\int_min(treap_min_key(*((x->left))), treap_min_key(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), treap_min_key(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), treap_min_key(*((x->right)))))))); 
        assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $int_min(F#treap_min_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
        // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_prios(x), @_vcc_intset_union(@_vcc_intset_singleton(*((x->prio))), @_vcc_intset_union(treap_prios(*((x->left))), treap_prios(*((x->right))))))); 
        assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_prios($s, $phys_ptr_cast(P#x, ^b_node)) == $intset_union($intset_singleton($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))), $intset_union(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
        // assert @reads_check_normal((x->key)); 
        assert $thread_local($s, $phys_ptr_cast(P#x, ^b_node));
        assume true;
        // if (==(k, *((x->key)))) ...
        if (P#k == $rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)))
        {
          anon2:
            // return 1; 
            $result := 1;
            assume true;
            assert $position_marker();
            goto #exit;
        }
        else
        {
          anon5:
            // assert @reads_check_normal((x->key)); 
            assert $thread_local($s, $phys_ptr_cast(P#x, ^b_node));
            assume true;
            // if (<(k, *((x->key)))) ...
            if (P#k < $rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)))
            {
              anon3:
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap(x), &&(&&(&&(&&(&&(&&(&&(&&(&&(&&(&&(treap(*((x->left))), treap(*((x->right)))), unchecked!(@_vcc_oset_in(x, @_vcc_oset_union(treap_reach(*((x->left))), treap_reach(*((x->right))))))), unchecked!(@_vcc_intset_in(*((x->key)), @_vcc_intset_union(treap_keys(*((x->left))), treap_keys(*((x->right))))))), unchecked!(@_vcc_intset_in(*((x->prio)), @_vcc_intset_union(treap_prios(*((x->left))), treap_prios(*((x->right))))))), @_vcc_oset_disjoint(treap_reach(*((x->left))), treap_reach(*((x->right))))), @_vcc_intset_disjoint(treap_keys(*((x->left))), treap_keys(*((x->right))))), @_vcc_intset_disjoint(treap_prios(*((x->left))), treap_prios(*((x->right))))), ==>(@_vcc_ptr_neq_null(*((x->left))), <(treap_max_key(*((x->left))), *((x->key))))), ==>(@_vcc_ptr_neq_null(*((x->right))), <(*((x->key)), treap_min_key(*((x->right)))))), ==>(@_vcc_ptr_neq_null(*((x->left))), <(treap_max_prio(*((x->left))), *((x->prio))))), ==>(@_vcc_ptr_neq_null(*((x->right))), <(treap_max_prio(*((x->right))), *((x->prio))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap($s, $phys_ptr_cast(P#x, ^b_node)) == (F#treap($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && F#treap($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && !$oset_in($phys_ptr_cast(P#x, ^b_node), $oset_union(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && !$intset_in($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $intset_union(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && !$intset_in($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), $intset_union(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && $oset_disjoint(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && $intset_disjoint(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && $intset_disjoint(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> $rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)) < F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_reach(x), @_vcc_oset_union(@_vcc_oset_singleton(x), @_vcc_oset_union(treap_reach(*((x->left))), treap_reach(*((x->right))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_reach($s, $phys_ptr_cast(P#x, ^b_node)) == $oset_union($oset_singleton($phys_ptr_cast(P#x, ^b_node)), $oset_union(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_keys(x), @_vcc_intset_union(@_vcc_intset_singleton(*((x->key))), @_vcc_intset_union(treap_keys(*((x->left))), treap_keys(*((x->right))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_keys($s, $phys_ptr_cast(P#x, ^b_node)) == $intset_union($intset_singleton($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node))), $intset_union(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), @\int_max(treap_max_key(*((x->left))), treap_max_key(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), treap_max_key(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), treap_max_key(*((x->right)))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $int_max(F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), @\int_max(treap_max_prio(*((x->left))), treap_max_prio(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), treap_max_prio(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), treap_max_prio(*((x->right)))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), $int_max(F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), @\int_min(treap_min_key(*((x->left))), treap_min_key(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), treap_min_key(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), treap_min_key(*((x->right)))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $int_min(F#treap_min_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_prios(x), @_vcc_intset_union(@_vcc_intset_singleton(*((x->prio))), @_vcc_intset_union(treap_prios(*((x->left))), treap_prios(*((x->right))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_prios($s, $phys_ptr_cast(P#x, ^b_node)) == $intset_union($intset_singleton($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))), $intset_union(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // int32_t r; 
                // _math \state _dryad_S0; 
                // _dryad_S0 := @_vcc_current_state(@state); 
                SL#_dryad_S0 := $current_state($s);
                // _math \state stmtexpr0#1; 
                // stmtexpr0#1 := _dryad_S0; 
                stmtexpr0#1 := SL#_dryad_S0;
                // non-pure function
                // assert @reads_check_normal((x->left)); 
                assert $thread_local($s, $phys_ptr_cast(P#x, ^b_node));
                // r := treap_find_rec(*((x->left)), k); 
                call L#r := treap_find_rec($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node), P#k);
                assume $full_stop_ext(#tok$2^26.17, $s);
                // _math \state _dryad_S1; 
                // _dryad_S1 := @_vcc_current_state(@state); 
                SL#_dryad_S1 := $current_state($s);
                // _math \state stmtexpr1#2; 
                // stmtexpr1#2 := _dryad_S1; 
                stmtexpr1#2 := SL#_dryad_S1;
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap(x), &&(&&(&&(&&(&&(&&(&&(&&(&&(&&(&&(treap(*((x->left))), treap(*((x->right)))), unchecked!(@_vcc_oset_in(x, @_vcc_oset_union(treap_reach(*((x->left))), treap_reach(*((x->right))))))), unchecked!(@_vcc_intset_in(*((x->key)), @_vcc_intset_union(treap_keys(*((x->left))), treap_keys(*((x->right))))))), unchecked!(@_vcc_intset_in(*((x->prio)), @_vcc_intset_union(treap_prios(*((x->left))), treap_prios(*((x->right))))))), @_vcc_oset_disjoint(treap_reach(*((x->left))), treap_reach(*((x->right))))), @_vcc_intset_disjoint(treap_keys(*((x->left))), treap_keys(*((x->right))))), @_vcc_intset_disjoint(treap_prios(*((x->left))), treap_prios(*((x->right))))), ==>(@_vcc_ptr_neq_null(*((x->left))), <(treap_max_key(*((x->left))), *((x->key))))), ==>(@_vcc_ptr_neq_null(*((x->right))), <(*((x->key)), treap_min_key(*((x->right)))))), ==>(@_vcc_ptr_neq_null(*((x->left))), <(treap_max_prio(*((x->left))), *((x->prio))))), ==>(@_vcc_ptr_neq_null(*((x->right))), <(treap_max_prio(*((x->right))), *((x->prio))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap($s, $phys_ptr_cast(P#x, ^b_node)) == (F#treap($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && F#treap($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && !$oset_in($phys_ptr_cast(P#x, ^b_node), $oset_union(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && !$intset_in($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $intset_union(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && !$intset_in($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), $intset_union(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && $oset_disjoint(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && $intset_disjoint(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && $intset_disjoint(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> $rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)) < F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_reach(x), @_vcc_oset_union(@_vcc_oset_singleton(x), @_vcc_oset_union(treap_reach(*((x->left))), treap_reach(*((x->right))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_reach($s, $phys_ptr_cast(P#x, ^b_node)) == $oset_union($oset_singleton($phys_ptr_cast(P#x, ^b_node)), $oset_union(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_keys(x), @_vcc_intset_union(@_vcc_intset_singleton(*((x->key))), @_vcc_intset_union(treap_keys(*((x->left))), treap_keys(*((x->right))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_keys($s, $phys_ptr_cast(P#x, ^b_node)) == $intset_union($intset_singleton($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node))), $intset_union(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), @\int_max(treap_max_key(*((x->left))), treap_max_key(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), treap_max_key(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), treap_max_key(*((x->right)))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $int_max(F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), @\int_max(treap_max_prio(*((x->left))), treap_max_prio(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), treap_max_prio(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), treap_max_prio(*((x->right)))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), $int_max(F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), @\int_min(treap_min_key(*((x->left))), treap_min_key(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), treap_min_key(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), treap_min_key(*((x->right)))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $int_min(F#treap_min_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_prios(x), @_vcc_intset_union(@_vcc_intset_singleton(*((x->prio))), @_vcc_intset_union(treap_prios(*((x->left))), treap_prios(*((x->right))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_prios($s, $phys_ptr_cast(P#x, ^b_node)) == $intset_union($intset_singleton($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))), $intset_union(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(unchecked!(@_vcc_oset_in(*((x->left)), old(_dryad_S0, treap_reach(x)))), ==(old(_dryad_S0, treap(x)), old(_dryad_S1, treap(x)))); 
                assume !$oset_in($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node), F#treap_reach(SL#_dryad_S0, $phys_ptr_cast(P#x, ^b_node))) ==> F#treap(SL#_dryad_S0, $phys_ptr_cast(P#x, ^b_node)) == F#treap(SL#_dryad_S1, $phys_ptr_cast(P#x, ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(*((x->left)), old(_dryad_S0, treap_reach(x)))), ==(old(_dryad_S0, treap_reach(x)), old(_dryad_S1, treap_reach(x)))); 
                assume !$oset_in($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node), F#treap_reach(SL#_dryad_S0, $phys_ptr_cast(P#x, ^b_node))) ==> F#treap_reach(SL#_dryad_S0, $phys_ptr_cast(P#x, ^b_node)) == F#treap_reach(SL#_dryad_S1, $phys_ptr_cast(P#x, ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(*((x->left)), old(_dryad_S0, treap_reach(x)))), ==(old(_dryad_S0, treap_keys(x)), old(_dryad_S1, treap_keys(x)))); 
                assume !$oset_in($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node), F#treap_reach(SL#_dryad_S0, $phys_ptr_cast(P#x, ^b_node))) ==> F#treap_keys(SL#_dryad_S0, $phys_ptr_cast(P#x, ^b_node)) == F#treap_keys(SL#_dryad_S1, $phys_ptr_cast(P#x, ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(*((x->left)), old(_dryad_S0, treap_reach(x)))), ==(old(_dryad_S0, treap_max_key(x)), old(_dryad_S1, treap_max_key(x)))); 
                assume !$oset_in($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node), F#treap_reach(SL#_dryad_S0, $phys_ptr_cast(P#x, ^b_node))) ==> F#treap_max_key(SL#_dryad_S0, $phys_ptr_cast(P#x, ^b_node)) == F#treap_max_key(SL#_dryad_S1, $phys_ptr_cast(P#x, ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(*((x->left)), old(_dryad_S0, treap_reach(x)))), ==(old(_dryad_S0, treap_max_prio(x)), old(_dryad_S1, treap_max_prio(x)))); 
                assume !$oset_in($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node), F#treap_reach(SL#_dryad_S0, $phys_ptr_cast(P#x, ^b_node))) ==> F#treap_max_prio(SL#_dryad_S0, $phys_ptr_cast(P#x, ^b_node)) == F#treap_max_prio(SL#_dryad_S1, $phys_ptr_cast(P#x, ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(*((x->left)), old(_dryad_S0, treap_reach(x)))), ==(old(_dryad_S0, treap_min_key(x)), old(_dryad_S1, treap_min_key(x)))); 
                assume !$oset_in($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node), F#treap_reach(SL#_dryad_S0, $phys_ptr_cast(P#x, ^b_node))) ==> F#treap_min_key(SL#_dryad_S0, $phys_ptr_cast(P#x, ^b_node)) == F#treap_min_key(SL#_dryad_S1, $phys_ptr_cast(P#x, ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(*((x->left)), old(_dryad_S0, treap_reach(x)))), ==(old(_dryad_S0, treap_prios(x)), old(_dryad_S1, treap_prios(x)))); 
                assume !$oset_in($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node), F#treap_reach(SL#_dryad_S0, $phys_ptr_cast(P#x, ^b_node))) ==> F#treap_prios(SL#_dryad_S0, $phys_ptr_cast(P#x, ^b_node)) == F#treap_prios(SL#_dryad_S1, $phys_ptr_cast(P#x, ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, treap_reach(*((x->right)))))), ==(old(_dryad_S0, treap(*((x->right)))), old(_dryad_S1, treap(*((x->right)))))); 
                assume !$oset_in($phys_ptr_cast(P#x, ^b_node), F#treap_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) ==> F#treap(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) == F#treap(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, treap_reach(*((x->right)))))), ==(old(_dryad_S0, treap_reach(*((x->right)))), old(_dryad_S1, treap_reach(*((x->right)))))); 
                assume !$oset_in($phys_ptr_cast(P#x, ^b_node), F#treap_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) ==> F#treap_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) == F#treap_reach(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, treap_reach(*((x->right)))))), ==(old(_dryad_S0, treap_keys(*((x->right)))), old(_dryad_S1, treap_keys(*((x->right)))))); 
                assume !$oset_in($phys_ptr_cast(P#x, ^b_node), F#treap_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) ==> F#treap_keys(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) == F#treap_keys(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, treap_reach(*((x->right)))))), ==(old(_dryad_S0, treap_max_key(*((x->right)))), old(_dryad_S1, treap_max_key(*((x->right)))))); 
                assume !$oset_in($phys_ptr_cast(P#x, ^b_node), F#treap_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) ==> F#treap_max_key(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) == F#treap_max_key(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, treap_reach(*((x->right)))))), ==(old(_dryad_S0, treap_max_prio(*((x->right)))), old(_dryad_S1, treap_max_prio(*((x->right)))))); 
                assume !$oset_in($phys_ptr_cast(P#x, ^b_node), F#treap_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) ==> F#treap_max_prio(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) == F#treap_max_prio(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, treap_reach(*((x->right)))))), ==(old(_dryad_S0, treap_min_key(*((x->right)))), old(_dryad_S1, treap_min_key(*((x->right)))))); 
                assume !$oset_in($phys_ptr_cast(P#x, ^b_node), F#treap_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) ==> F#treap_min_key(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) == F#treap_min_key(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0, treap_reach(*((x->right)))))), ==(old(_dryad_S0, treap_prios(*((x->right)))), old(_dryad_S1, treap_prios(*((x->right)))))); 
                assume !$oset_in($phys_ptr_cast(P#x, ^b_node), F#treap_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) ==> F#treap_prios(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) == F#treap_prios(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S1, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node));
                // return r; 
                $result := L#r;
                assume true;
                assert $position_marker();
                goto #exit;
            }
            else
            {
              anon4:
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap(x), &&(&&(&&(&&(&&(&&(&&(&&(&&(&&(&&(treap(*((x->left))), treap(*((x->right)))), unchecked!(@_vcc_oset_in(x, @_vcc_oset_union(treap_reach(*((x->left))), treap_reach(*((x->right))))))), unchecked!(@_vcc_intset_in(*((x->key)), @_vcc_intset_union(treap_keys(*((x->left))), treap_keys(*((x->right))))))), unchecked!(@_vcc_intset_in(*((x->prio)), @_vcc_intset_union(treap_prios(*((x->left))), treap_prios(*((x->right))))))), @_vcc_oset_disjoint(treap_reach(*((x->left))), treap_reach(*((x->right))))), @_vcc_intset_disjoint(treap_keys(*((x->left))), treap_keys(*((x->right))))), @_vcc_intset_disjoint(treap_prios(*((x->left))), treap_prios(*((x->right))))), ==>(@_vcc_ptr_neq_null(*((x->left))), <(treap_max_key(*((x->left))), *((x->key))))), ==>(@_vcc_ptr_neq_null(*((x->right))), <(*((x->key)), treap_min_key(*((x->right)))))), ==>(@_vcc_ptr_neq_null(*((x->left))), <(treap_max_prio(*((x->left))), *((x->prio))))), ==>(@_vcc_ptr_neq_null(*((x->right))), <(treap_max_prio(*((x->right))), *((x->prio))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap($s, $phys_ptr_cast(P#x, ^b_node)) == (F#treap($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && F#treap($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && !$oset_in($phys_ptr_cast(P#x, ^b_node), $oset_union(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && !$intset_in($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $intset_union(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && !$intset_in($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), $intset_union(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && $oset_disjoint(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && $intset_disjoint(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && $intset_disjoint(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> $rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)) < F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_reach(x), @_vcc_oset_union(@_vcc_oset_singleton(x), @_vcc_oset_union(treap_reach(*((x->left))), treap_reach(*((x->right))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_reach($s, $phys_ptr_cast(P#x, ^b_node)) == $oset_union($oset_singleton($phys_ptr_cast(P#x, ^b_node)), $oset_union(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_keys(x), @_vcc_intset_union(@_vcc_intset_singleton(*((x->key))), @_vcc_intset_union(treap_keys(*((x->left))), treap_keys(*((x->right))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_keys($s, $phys_ptr_cast(P#x, ^b_node)) == $intset_union($intset_singleton($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node))), $intset_union(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), @\int_max(treap_max_key(*((x->left))), treap_max_key(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), treap_max_key(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), treap_max_key(*((x->right)))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $int_max(F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), @\int_max(treap_max_prio(*((x->left))), treap_max_prio(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), treap_max_prio(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), treap_max_prio(*((x->right)))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), $int_max(F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), @\int_min(treap_min_key(*((x->left))), treap_min_key(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), treap_min_key(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), treap_min_key(*((x->right)))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $int_min(F#treap_min_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_prios(x), @_vcc_intset_union(@_vcc_intset_singleton(*((x->prio))), @_vcc_intset_union(treap_prios(*((x->left))), treap_prios(*((x->right))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_prios($s, $phys_ptr_cast(P#x, ^b_node)) == $intset_union($intset_singleton($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))), $intset_union(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // int32_t r#0; 
                // _math \state _dryad_S0#1; 
                // _dryad_S0#1 := @_vcc_current_state(@state); 
                _dryad_S0#1 := $current_state($s);
                // _math \state stmtexpr0#3; 
                // stmtexpr0#3 := _dryad_S0#1; 
                stmtexpr0#3 := _dryad_S0#1;
                // non-pure function
                // assert @reads_check_normal((x->right)); 
                assert $thread_local($s, $phys_ptr_cast(P#x, ^b_node));
                // r#0 := treap_find_rec(*((x->right)), k); 
                call r#0 := treap_find_rec($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node), P#k);
                assume $full_stop_ext(#tok$2^29.17, $s);
                // _math \state _dryad_S1#2; 
                // _dryad_S1#2 := @_vcc_current_state(@state); 
                _dryad_S1#2 := $current_state($s);
                // _math \state stmtexpr1#4; 
                // stmtexpr1#4 := _dryad_S1#2; 
                stmtexpr1#4 := _dryad_S1#2;
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap(x), &&(&&(&&(&&(&&(&&(&&(&&(&&(&&(&&(treap(*((x->left))), treap(*((x->right)))), unchecked!(@_vcc_oset_in(x, @_vcc_oset_union(treap_reach(*((x->left))), treap_reach(*((x->right))))))), unchecked!(@_vcc_intset_in(*((x->key)), @_vcc_intset_union(treap_keys(*((x->left))), treap_keys(*((x->right))))))), unchecked!(@_vcc_intset_in(*((x->prio)), @_vcc_intset_union(treap_prios(*((x->left))), treap_prios(*((x->right))))))), @_vcc_oset_disjoint(treap_reach(*((x->left))), treap_reach(*((x->right))))), @_vcc_intset_disjoint(treap_keys(*((x->left))), treap_keys(*((x->right))))), @_vcc_intset_disjoint(treap_prios(*((x->left))), treap_prios(*((x->right))))), ==>(@_vcc_ptr_neq_null(*((x->left))), <(treap_max_key(*((x->left))), *((x->key))))), ==>(@_vcc_ptr_neq_null(*((x->right))), <(*((x->key)), treap_min_key(*((x->right)))))), ==>(@_vcc_ptr_neq_null(*((x->left))), <(treap_max_prio(*((x->left))), *((x->prio))))), ==>(@_vcc_ptr_neq_null(*((x->right))), <(treap_max_prio(*((x->right))), *((x->prio))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap($s, $phys_ptr_cast(P#x, ^b_node)) == (F#treap($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && F#treap($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && !$oset_in($phys_ptr_cast(P#x, ^b_node), $oset_union(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && !$intset_in($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $intset_union(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && !$intset_in($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), $intset_union(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && $oset_disjoint(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && $intset_disjoint(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && $intset_disjoint(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> $rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)) < F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))) && ($non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) < $rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_reach(x), @_vcc_oset_union(@_vcc_oset_singleton(x), @_vcc_oset_union(treap_reach(*((x->left))), treap_reach(*((x->right))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_reach($s, $phys_ptr_cast(P#x, ^b_node)) == $oset_union($oset_singleton($phys_ptr_cast(P#x, ^b_node)), $oset_union(F#treap_reach($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_reach($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_keys(x), @_vcc_intset_union(@_vcc_intset_singleton(*((x->key))), @_vcc_intset_union(treap_keys(*((x->left))), treap_keys(*((x->right))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_keys($s, $phys_ptr_cast(P#x, ^b_node)) == $intset_union($intset_singleton($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node))), $intset_union(F#treap_keys($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_keys($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), @\int_max(treap_max_key(*((x->left))), treap_max_key(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), treap_max_key(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_key(x), @\int_max(*((x->key)), treap_max_key(*((x->right)))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $int_max(F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), @\int_max(treap_max_prio(*((x->left))), treap_max_prio(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), treap_max_prio(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_max_prio(x), @\int_max(*((x->prio)), treap_max_prio(*((x->right)))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), $int_max(F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_max_prio($s, $phys_ptr_cast(P#x, ^b_node)) == $int_max($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node)), F#treap_max_prio($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), &&(&&(==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), @\int_min(treap_min_key(*((x->left))), treap_min_key(*((x->right))))))), ==>(&&(@_vcc_ptr_neq_null(*((x->left))), @_vcc_ptr_eq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), treap_min_key(*((x->left))))))), ==>(&&(@_vcc_ptr_eq_null(*((x->left))), @_vcc_ptr_neq_null(*((x->right)))), ==(treap_min_key(x), @\int_min(*((x->key)), treap_min_key(*((x->right)))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), $int_min(F#treap_min_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))))) && ($non_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $is_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)))) && ($is_null($rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) && $non_null($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node)) ==> F#treap_min_key($s, $phys_ptr_cast(P#x, ^b_node)) == $int_min($rd_inv($s, b_node.key, $phys_ptr_cast(P#x, ^b_node)), F#treap_min_key($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(@_vcc_ptr_neq_null(x), ==(treap_prios(x), @_vcc_intset_union(@_vcc_intset_singleton(*((x->prio))), @_vcc_intset_union(treap_prios(*((x->left))), treap_prios(*((x->right))))))); 
                assume $non_null($phys_ptr_cast(P#x, ^b_node)) ==> F#treap_prios($s, $phys_ptr_cast(P#x, ^b_node)) == $intset_union($intset_singleton($rd_inv($s, b_node.prio, $phys_ptr_cast(P#x, ^b_node))), $intset_union(F#treap_prios($s, $rd_phys_ptr($s, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)), F#treap_prios($s, $rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node))));
                // assume ==>(unchecked!(@_vcc_oset_in(*((x->right)), old(_dryad_S0#1, treap_reach(x)))), ==(old(_dryad_S0#1, treap(x)), old(_dryad_S1#2, treap(x)))); 
                assume !$oset_in($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node), F#treap_reach(_dryad_S0#1, $phys_ptr_cast(P#x, ^b_node))) ==> F#treap(_dryad_S0#1, $phys_ptr_cast(P#x, ^b_node)) == F#treap(_dryad_S1#2, $phys_ptr_cast(P#x, ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(*((x->right)), old(_dryad_S0#1, treap_reach(x)))), ==(old(_dryad_S0#1, treap_reach(x)), old(_dryad_S1#2, treap_reach(x)))); 
                assume !$oset_in($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node), F#treap_reach(_dryad_S0#1, $phys_ptr_cast(P#x, ^b_node))) ==> F#treap_reach(_dryad_S0#1, $phys_ptr_cast(P#x, ^b_node)) == F#treap_reach(_dryad_S1#2, $phys_ptr_cast(P#x, ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(*((x->right)), old(_dryad_S0#1, treap_reach(x)))), ==(old(_dryad_S0#1, treap_keys(x)), old(_dryad_S1#2, treap_keys(x)))); 
                assume !$oset_in($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node), F#treap_reach(_dryad_S0#1, $phys_ptr_cast(P#x, ^b_node))) ==> F#treap_keys(_dryad_S0#1, $phys_ptr_cast(P#x, ^b_node)) == F#treap_keys(_dryad_S1#2, $phys_ptr_cast(P#x, ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(*((x->right)), old(_dryad_S0#1, treap_reach(x)))), ==(old(_dryad_S0#1, treap_max_key(x)), old(_dryad_S1#2, treap_max_key(x)))); 
                assume !$oset_in($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node), F#treap_reach(_dryad_S0#1, $phys_ptr_cast(P#x, ^b_node))) ==> F#treap_max_key(_dryad_S0#1, $phys_ptr_cast(P#x, ^b_node)) == F#treap_max_key(_dryad_S1#2, $phys_ptr_cast(P#x, ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(*((x->right)), old(_dryad_S0#1, treap_reach(x)))), ==(old(_dryad_S0#1, treap_max_prio(x)), old(_dryad_S1#2, treap_max_prio(x)))); 
                assume !$oset_in($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node), F#treap_reach(_dryad_S0#1, $phys_ptr_cast(P#x, ^b_node))) ==> F#treap_max_prio(_dryad_S0#1, $phys_ptr_cast(P#x, ^b_node)) == F#treap_max_prio(_dryad_S1#2, $phys_ptr_cast(P#x, ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(*((x->right)), old(_dryad_S0#1, treap_reach(x)))), ==(old(_dryad_S0#1, treap_min_key(x)), old(_dryad_S1#2, treap_min_key(x)))); 
                assume !$oset_in($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node), F#treap_reach(_dryad_S0#1, $phys_ptr_cast(P#x, ^b_node))) ==> F#treap_min_key(_dryad_S0#1, $phys_ptr_cast(P#x, ^b_node)) == F#treap_min_key(_dryad_S1#2, $phys_ptr_cast(P#x, ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(*((x->right)), old(_dryad_S0#1, treap_reach(x)))), ==(old(_dryad_S0#1, treap_prios(x)), old(_dryad_S1#2, treap_prios(x)))); 
                assume !$oset_in($rd_phys_ptr($s, b_node.right, $phys_ptr_cast(P#x, ^b_node), ^b_node), F#treap_reach(_dryad_S0#1, $phys_ptr_cast(P#x, ^b_node))) ==> F#treap_prios(_dryad_S0#1, $phys_ptr_cast(P#x, ^b_node)) == F#treap_prios(_dryad_S1#2, $phys_ptr_cast(P#x, ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0#1, treap_reach(*((x->left)))))), ==(old(_dryad_S0#1, treap(*((x->left)))), old(_dryad_S1#2, treap(*((x->left)))))); 
                assume !$oset_in($phys_ptr_cast(P#x, ^b_node), F#treap_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node))) ==> F#treap(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) == F#treap(_dryad_S1#2, $rd_phys_ptr(_dryad_S1#2, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0#1, treap_reach(*((x->left)))))), ==(old(_dryad_S0#1, treap_reach(*((x->left)))), old(_dryad_S1#2, treap_reach(*((x->left)))))); 
                assume !$oset_in($phys_ptr_cast(P#x, ^b_node), F#treap_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node))) ==> F#treap_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) == F#treap_reach(_dryad_S1#2, $rd_phys_ptr(_dryad_S1#2, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0#1, treap_reach(*((x->left)))))), ==(old(_dryad_S0#1, treap_keys(*((x->left)))), old(_dryad_S1#2, treap_keys(*((x->left)))))); 
                assume !$oset_in($phys_ptr_cast(P#x, ^b_node), F#treap_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node))) ==> F#treap_keys(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) == F#treap_keys(_dryad_S1#2, $rd_phys_ptr(_dryad_S1#2, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0#1, treap_reach(*((x->left)))))), ==(old(_dryad_S0#1, treap_max_key(*((x->left)))), old(_dryad_S1#2, treap_max_key(*((x->left)))))); 
                assume !$oset_in($phys_ptr_cast(P#x, ^b_node), F#treap_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node))) ==> F#treap_max_key(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) == F#treap_max_key(_dryad_S1#2, $rd_phys_ptr(_dryad_S1#2, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0#1, treap_reach(*((x->left)))))), ==(old(_dryad_S0#1, treap_max_prio(*((x->left)))), old(_dryad_S1#2, treap_max_prio(*((x->left)))))); 
                assume !$oset_in($phys_ptr_cast(P#x, ^b_node), F#treap_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node))) ==> F#treap_max_prio(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) == F#treap_max_prio(_dryad_S1#2, $rd_phys_ptr(_dryad_S1#2, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0#1, treap_reach(*((x->left)))))), ==(old(_dryad_S0#1, treap_min_key(*((x->left)))), old(_dryad_S1#2, treap_min_key(*((x->left)))))); 
                assume !$oset_in($phys_ptr_cast(P#x, ^b_node), F#treap_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node))) ==> F#treap_min_key(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) == F#treap_min_key(_dryad_S1#2, $rd_phys_ptr(_dryad_S1#2, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node));
                // assume ==>(unchecked!(@_vcc_oset_in(x, old(_dryad_S0#1, treap_reach(*((x->left)))))), ==(old(_dryad_S0#1, treap_prios(*((x->left)))), old(_dryad_S1#2, treap_prios(*((x->left)))))); 
                assume !$oset_in($phys_ptr_cast(P#x, ^b_node), F#treap_reach(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node))) ==> F#treap_prios(_dryad_S0#1, $rd_phys_ptr(_dryad_S0#1, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node)) == F#treap_prios(_dryad_S1#2, $rd_phys_ptr(_dryad_S1#2, b_node.left, $phys_ptr_cast(P#x, ^b_node), ^b_node));
                // return r#0; 
                $result := r#0;
                assume true;
                assert $position_marker();
                goto #exit;
            }
        }
    }

  anon8:
    // skip

  #exit:
// INV:LOOPTAIL
}



axiom (forall Q#__vcc_state$1^230.9#tc3#1354: $state, Q#x$1^230.9#dt1#1325: $ptr, Q#i$1^230.9#tc1#1326: int :: {:weight 10} { $intset_in(Q#i$1^230.9#tc1#1326, F#treap_keys(Q#__vcc_state$1^230.9#tc3#1354, $phys_ptr_cast(Q#x$1^230.9#dt1#1325, ^b_node))) } $good_state(Q#__vcc_state$1^230.9#tc3#1354) && $in_range_i4(Q#i$1^230.9#tc1#1326) ==> Q#i$1^230.9#tc1#1326 < F#treap_min_key(Q#__vcc_state$1^230.9#tc3#1354, $phys_ptr_cast(Q#x$1^230.9#dt1#1325, ^b_node)) ==> !$intset_in(Q#i$1^230.9#tc1#1326, F#treap_keys(Q#__vcc_state$1^230.9#tc3#1354, $phys_ptr_cast(Q#x$1^230.9#dt1#1325, ^b_node))));

axiom (forall Q#__vcc_state$1^231.9#tc3#1355: $state, Q#x$1^231.9#dt1#1327: $ptr, Q#i$1^231.9#tc1#1328: int :: {:weight 10} { $intset_in(Q#i$1^231.9#tc1#1328, F#treap_keys(Q#__vcc_state$1^231.9#tc3#1355, $phys_ptr_cast(Q#x$1^231.9#dt1#1327, ^b_node))) } $good_state(Q#__vcc_state$1^231.9#tc3#1355) && $in_range_i4(Q#i$1^231.9#tc1#1328) ==> Q#i$1^231.9#tc1#1328 > F#treap_max_key(Q#__vcc_state$1^231.9#tc3#1355, $phys_ptr_cast(Q#x$1^231.9#dt1#1327, ^b_node)) ==> !$intset_in(Q#i$1^231.9#tc1#1328, F#treap_keys(Q#__vcc_state$1^231.9#tc3#1355, $phys_ptr_cast(Q#x$1^231.9#dt1#1327, ^b_node))));

axiom (forall Q#__vcc_state$1^232.9#tc3#1356: $state, Q#x$1^232.9#dt1#1329: $ptr, Q#i$1^232.9#tc1#1330: int :: {:weight 10} { $intset_in(Q#i$1^232.9#tc1#1330, F#treap_prios(Q#__vcc_state$1^232.9#tc3#1356, $phys_ptr_cast(Q#x$1^232.9#dt1#1329, ^b_node))) } $good_state(Q#__vcc_state$1^232.9#tc3#1356) && $in_range_i4(Q#i$1^232.9#tc1#1330) ==> Q#i$1^232.9#tc1#1330 > F#treap_max_prio(Q#__vcc_state$1^232.9#tc3#1356, $phys_ptr_cast(Q#x$1^232.9#dt1#1329, ^b_node)) ==> !$intset_in(Q#i$1^232.9#tc1#1330, F#treap_prios(Q#__vcc_state$1^232.9#tc3#1356, $phys_ptr_cast(Q#x$1^232.9#dt1#1329, ^b_node))));

const unique l#public: $label;

axiom $type_code_is(3, ^$#state_t);

axiom $type_code_is(1, ^^i4);

const unique #tok$2^29.17: $token;

const unique #tok$2^26.17: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^5.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Ctreap?5Ctreap?2Dfind?2Drec.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Ctreap?5Ctreap?2Dfind?2Drec.c);

const unique #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Ctreap?5Cdryad_treap.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Ctreap?5Cdryad_treap.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^b_node);

