
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

const unique ^$#sl_concat.c..36776#3: $ctype;

axiom $def_fnptr_type(^$#sl_concat.c..36776#3);

type $#sl_concat.c..36776#3;

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



function F#sll_lseg(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : bool;

const unique cf#sll_lseg: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#sll_lseg(#s, SP#hd, SP#tl) } 1 < $decreases_level ==>
true
&& ($phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg(#s, SP#hd, SP#tl))
&& ($is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> F#sll_lseg(#s, SP#hd, SP#tl) == F#sll(#s, $phys_ptr_cast(SP#hd, ^s_node)))
);

/*
   lseg(x,y) ==> disjoint( lseg_reach(x,y), singleton(y) )
*/
axiom (forall #s: $state, SP#x: $ptr, SP#y: $ptr ::
{ F#sll_lseg(#s, SP#x, SP#y) }
( true
&& F#sll_lseg(#s, SP#x, SP#y)
) ==> ( true
&& $oset_disjoint( F#sll_lseg_reach(#s, $phys_ptr_cast(SP#x, ^s_node), $phys_ptr_cast(SP#y, ^s_node)), $oset_singleton($phys_ptr_cast(SP#y, ^s_node)) )
));

/*
   lseg(x,y) && list(y)
// && lseg_keys(x,y) <= list_keys(y)
   ==>
   list(x) &&
   list_reach(x) == union( lseg_reach(x,y), list_reach(y) )
   list_keys(x)  == union( lseg_keys(x,y),  list_keys(y) )
*/
axiom (forall #s: $state, SP#x: $ptr, SP#y: $ptr ::
{ F#sll_lseg(#s, SP#x, SP#y) }
( true
&& F#sll_lseg(#s, SP#x, SP#y)
&& F#sll(#s, $phys_ptr_cast(SP#y, ^s_node))
) ==> ( true
&& F#sll(#s, $phys_ptr_cast(SP#x, ^s_node))
&& F#sll_reach(#s, $phys_ptr_cast(SP#x, ^s_node))
   == $oset_union(F#sll_lseg_reach(#s, $phys_ptr_cast(SP#x, ^s_node), $phys_ptr_cast(SP#y, ^s_node)), F#sll_reach(#s, $phys_ptr_cast(SP#y, ^s_node)))
&& F#sll_keys(#s, $phys_ptr_cast(SP#x, ^s_node))
   == $intset_union(F#sll_lseg_keys(#s, $phys_ptr_cast(SP#x, ^s_node), $phys_ptr_cast(SP#y, ^s_node)), F#sll_keys(#s, $phys_ptr_cast(SP#y, ^s_node)))
));

/*
   lseg(x,y) && y != null
   && y->next != y && y->next != x && y->next \not\in lseg_reach(x,y)
// && y->next != null ==> y->next->prev == y
// && lseg_keys(x,y) <= singleton(y)
   ==>
   lseg(x,y->next) &&
   lseg_reach(x,y->next) == union( lseg_reach(x,y), singleton(y) )
   lseg_keys(x,y->next)  == union( lseg_keys(x,y),  singleton(y) )
*/
axiom (forall #s: $state, SP#x: $ptr, SP#y: $ptr ::
{ F#sll_lseg(#s, SP#x, SP#y) }
( true
&& F#sll_lseg(#s, SP#x, SP#y)
&& $non_null($phys_ptr_cast(SP#y, ^s_node))
&& $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#y, ^s_node), ^s_node) != $phys_ptr_cast(SP#x, ^s_node)
&& $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#y, ^s_node), ^s_node) != $phys_ptr_cast(SP#y, ^s_node)
&& !$oset_in($rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#y, ^s_node), ^s_node), F#sll_lseg_reach(#s, $phys_ptr_cast(SP#x, ^s_node), $phys_ptr_cast(SP#y, ^s_node)))
) ==> ( true
&& F#sll_lseg(#s, $phys_ptr_cast(SP#x, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#y, ^s_node), ^s_node))
&& F#sll_lseg_reach(#s, $phys_ptr_cast(SP#x, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#y, ^s_node), ^s_node))
   == $oset_union(F#sll_lseg_reach(#s, $phys_ptr_cast(SP#x, ^s_node), $phys_ptr_cast(SP#y, ^s_node)), $oset_singleton($phys_ptr_cast(SP#y, ^s_node)))
&& F#sll_lseg_keys(#s, $phys_ptr_cast(SP#x, ^s_node), $rd_phys_ptr(#s, s_node.next, $phys_ptr_cast(SP#y, ^s_node), ^s_node))
   == $intset_union(F#sll_lseg_keys(#s, $phys_ptr_cast(SP#x, ^s_node), $phys_ptr_cast(SP#y, ^s_node)), $intset_singleton($rd_inv(#s, s_node.key, $phys_ptr_cast(SP#y, ^s_node))))
));


axiom $function_arg_type(cf#sll_lseg, 0, ^^bool);

axiom $function_arg_type(cf#sll_lseg, 1, $ptr_to(^s_node));

axiom $function_arg_type(cf#sll_lseg, 2, $ptr_to(^s_node));

procedure sll_lseg(SP#hd: $ptr, SP#tl: $ptr) returns ($result: bool);
  ensures $phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> $result;
  ensures $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> $result == F#sll($s, $phys_ptr_cast(SP#hd, ^s_node));
  free ensures $result == F#sll_lseg($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#sll_lseg_reach(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : $oset;

const unique cf#sll_lseg_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#sll_lseg_reach(#s, SP#hd, SP#tl) } 1 < $decreases_level ==>
true
&& ($phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg_reach(#s, SP#hd, SP#tl) == $oset_empty())
&& ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node)
   ==> $oset_in($phys_ptr_cast(SP#hd, ^s_node), F#sll_lseg_reach(#s, SP#hd, SP#tl)))
&& ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($phys_ptr_cast(SP#tl, ^s_node))
   ==> F#sll_lseg_reach(#s, SP#hd, SP#tl) == F#sll_reach(#s, $phys_ptr_cast(SP#hd, ^s_node)))
);

axiom $function_arg_type(cf#sll_lseg_reach, 0, ^$#oset);

axiom $function_arg_type(cf#sll_lseg_reach, 1, $ptr_to(^s_node));

axiom $function_arg_type(cf#sll_lseg_reach, 2, $ptr_to(^s_node));

procedure sll_lseg_reach(SP#hd: $ptr, SP#tl: $ptr) returns ($result: $oset);
  ensures $phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> $result == $oset_empty();
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $oset_in($phys_ptr_cast(SP#hd, ^s_node), $result);
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> $result == F#sll_reach($s, $phys_ptr_cast(SP#hd, ^s_node));
  free ensures $result == F#sll_lseg_reach($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



function F#sll_lseg_keys(#s: $state, SP#hd: $ptr, SP#tl: $ptr) : $intset;

const unique cf#sll_lseg_keys: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr, SP#tl: $ptr :: { F#sll_lseg_keys(#s, SP#hd, SP#tl) } 1 < $decreases_level ==>
true
&& ($phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> F#sll_lseg_keys(#s, SP#hd, SP#tl) == $intset_empty())
&& ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node)
   ==> $intset_in($rd_inv(#s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node)), F#sll_lseg_keys(#s, SP#hd, SP#tl)))
&& ($non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($phys_ptr_cast(SP#tl, ^s_node))
   ==> F#sll_lseg_keys(#s, SP#hd, SP#tl) == F#sll_keys(#s, $phys_ptr_cast(SP#hd, ^s_node)))
);

axiom $function_arg_type(cf#sll_lseg_keys, 0, ^$#intset);

axiom $function_arg_type(cf#sll_lseg_keys, 1, $ptr_to(^s_node));

axiom $function_arg_type(cf#sll_lseg_keys, 2, $ptr_to(^s_node));

procedure sll_lseg_keys(SP#hd: $ptr, SP#tl: $ptr) returns ($result: $intset);
  ensures $phys_ptr_cast(SP#hd, ^s_node) == $phys_ptr_cast(SP#tl, ^s_node) ==> $result == $intset_empty();
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $phys_ptr_cast(SP#hd, ^s_node) != $phys_ptr_cast(SP#tl, ^s_node) ==> $intset_in($rd_inv($s, s_node.key, $phys_ptr_cast(SP#hd, ^s_node)), $result);
  ensures $non_null($phys_ptr_cast(SP#hd, ^s_node)) && $is_null($phys_ptr_cast(SP#tl, ^s_node)) ==> $result == F#sll_keys($s, $phys_ptr_cast(SP#hd, ^s_node));
  free ensures $result == F#sll_lseg_keys($s, SP#hd, SP#tl);
  free ensures $call_transition(old($s), $s);



procedure concat(P#a: $ptr, P#b: $ptr) returns ($result: $ptr);
  requires F#sll($s, $phys_ptr_cast(P#a, ^s_node));
  requires F#sll($s, $phys_ptr_cast(P#b, ^s_node));
  requires $oset_disjoint(F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)), F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)));
  modifies $s, $cev_pc;
  ensures F#sll($s, $phys_ptr_cast($result, ^s_node));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation concat(P#a: $ptr, P#b: $ptr) returns ($result: $ptr)
{
  var stmtexpr1#6: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr0#5: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr0#4: $ptr;
  var SL#curr0: $ptr;
  var loopState#46: $state;
  var L#curr: $ptr;
  var stmtexpr1#8: $oset;
  var stmtexpr0#7: $oset;
  var res_sll_reach#3: $oset;
  var res_sll_reach#2: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$3^3.3: int;
  var #stackframe: int;

// INV:PTR: P#a, P#b, L#curr
// INV:INT:
// INV:LST: sll
// INV:OLD: loopState#46

  anon427:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$3^3.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$3^3.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$3^3.3, (lambda #p: $ptr :: false));
    // assume true
    // assume true
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _math \oset res_sll_reach#2; 
    // res_sll_reach#2 := sll_reach(a); 
    call res_sll_reach#2 := sll_reach($phys_ptr_cast(P#a, ^s_node));
    assume $full_stop_ext(#tok$4^0.0, $s);
    // _math \oset res_sll_reach#3; 
    // res_sll_reach#3 := sll_reach(b); 
    call res_sll_reach#3 := sll_reach($phys_ptr_cast(P#b, ^s_node));
    assume $full_stop_ext(#tok$4^0.0, $s);
    // _dryad_G0 := @_vcc_oset_union(res_sll_reach#2, res_sll_reach#3); 
    SL#_dryad_G0 := $oset_union(res_sll_reach#2, res_sll_reach#3);
    // _math \oset stmtexpr0#7; 
    // stmtexpr0#7 := _dryad_G0; 
    stmtexpr0#7 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#8; 
    // stmtexpr1#8 := _dryad_G1; 
    stmtexpr1#8 := SL#_dryad_G1;
    // assume ==(glob_reach(), _dryad_G1); 
    assume F#glob_reach() == SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union_one2(sll_reach(*((b->next))), b))); 
    assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $phys_ptr_cast(P#b, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_keys(a), @_vcc_intset_union(sll_keys(*((a->next))), @_vcc_intset_singleton(*((a->key)))))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#a, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(a), ==(sll(a), &&(sll(*((a->next))), unchecked!(@_vcc_oset_in(a, sll_reach(*((a->next)))))))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#a, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_reach(a), @_vcc_oset_union_one2(sll_reach(*((a->next))), a))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $phys_ptr_cast(P#a, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(a), &&(@_vcc_mutable(@state, a), @writes_check(a))); 
    assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> $mutable($s, $phys_ptr_cast(P#a, ^s_node)) && $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(P#a, ^s_node));
    assume true;
    // if (@_vcc_ptr_eq_null(a)) ...
    if ($is_null($phys_ptr_cast(P#a, ^s_node)))
    {
      anon421:
        // return b; 
        $result := $phys_ptr_cast(P#b, ^s_node);
        assume true;
        assert $position_marker();
        goto #exit;
    }
    else
    {
      anon425:
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union_one2(sll_reach(*((b->next))), b))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_keys(a), @_vcc_intset_union(sll_keys(*((a->next))), @_vcc_intset_singleton(*((a->key)))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#a, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll(a), &&(sll(*((a->next))), unchecked!(@_vcc_oset_in(a, sll_reach(*((a->next)))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#a, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_reach(a), @_vcc_oset_union_one2(sll_reach(*((a->next))), a))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $phys_ptr_cast(P#a, ^s_node));
        // struct s_node* curr; 
        // var struct s_node* curr
        // curr := a; 
        L#curr := $phys_ptr_cast(P#a, ^s_node);
        // assert sll_lseg(curr, curr); 
        assert F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume sll_lseg(curr, curr); 
        assume F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assert sll_lseg(b, b); 
        assert F#sll_lseg($s, $phys_ptr_cast(P#b, ^s_node), $phys_ptr_cast(P#b, ^s_node));
        // assume sll_lseg(b, b); 
        assume F#sll_lseg($s, $phys_ptr_cast(P#b, ^s_node), $phys_ptr_cast(P#b, ^s_node));
        // assert sll_lseg(a, a); 
        assert F#sll_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(P#a, ^s_node));
        // assume sll_lseg(a, a); 
        assume F#sll_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(P#a, ^s_node));
        loopState#46 := $s;
        assume true;

// INV:LOOPHEAD

        while (true)

invariant b0000 ==> (F#sll($s,$phys_ptr_cast(P#a,^s_node)));
invariant b0001 ==> (F#sll($s,$phys_ptr_cast(P#b,^s_node)));
invariant b0002 ==> (F#sll($s,$phys_ptr_cast(L#curr,^s_node)));
invariant b0003 ==> (F#sll_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)));
invariant b0004 ==> (F#sll_lseg($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)));
invariant b0005 ==> (F#sll_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)));
invariant b0006 ==> (F#sll_lseg($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)));
invariant b0007 ==> (F#sll_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)));
invariant b0008 ==> (F#sll_lseg($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)));
invariant b0009 ==> ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#a,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#b,^s_node))));
invariant b0010 ==> ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#a,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#curr,^s_node))));
invariant b0011 ==> ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#b,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#a,^s_node))));
invariant b0012 ==> ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#b,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#curr,^s_node))));
invariant b0013 ==> ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#a,^s_node))));
invariant b0014 ==> ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#curr,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#b,^s_node))));
invariant b0015 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#b,^s_node))));
invariant b0016 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#curr,^s_node))));
invariant b0017 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#a,^s_node))));
invariant b0018 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#curr,^s_node))));
invariant b0019 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#a,^s_node))));
invariant b0020 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#b,^s_node))));
invariant b0021 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#curr,^s_node))));
invariant b0022 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#b,^s_node))));
invariant b0023 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#curr,^s_node))));
invariant b0024 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#a,^s_node))));
invariant b0025 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#b,^s_node))));
invariant b0026 ==> ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#a,^s_node))));
invariant b0027 ==> (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#b,^s_node)))));
invariant b0028 ==> (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#curr,^s_node)))));
invariant b0029 ==> (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#a,^s_node)))));
invariant b0030 ==> (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#curr,^s_node)))));
invariant b0031 ==> (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#a,^s_node)))));
invariant b0032 ==> (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#b,^s_node)))));
invariant b0033 ==> (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
invariant b0034 ==> (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#a,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#b,^s_node)))));
invariant b0035 ==> (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(L#curr,^s_node)))));
invariant b0036 ==> (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#b,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#curr,^s_node),$phys_ptr_cast(P#a,^s_node)))));
invariant b0037 ==> (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#a,^s_node),$phys_ptr_cast(P#b,^s_node)))));
invariant b0038 ==> (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#b,^s_node),$phys_ptr_cast(P#a,^s_node)))));
invariant b0039 ==> ($non_null($phys_ptr_cast(P#a,^s_node)));
invariant b0040 ==> ($non_null($phys_ptr_cast(P#b,^s_node)));
invariant b0041 ==> ($non_null($phys_ptr_cast(L#curr,^s_node)));
invariant b0042 ==> ($is_null($phys_ptr_cast(P#a,^s_node)));
invariant b0043 ==> ($is_null($phys_ptr_cast(P#b,^s_node)));
invariant b0044 ==> ($is_null($phys_ptr_cast(L#curr,^s_node)));
invariant b0045 ==> (($phys_ptr_cast(P#a,^s_node) == $phys_ptr_cast(P#b,^s_node)));
invariant b0046 ==> (($phys_ptr_cast(P#a,^s_node) == $phys_ptr_cast(L#curr,^s_node)));
invariant b0047 ==> (($phys_ptr_cast(P#b,^s_node) == $phys_ptr_cast(P#a,^s_node)));
invariant b0048 ==> (($phys_ptr_cast(P#b,^s_node) == $phys_ptr_cast(L#curr,^s_node)));
invariant b0049 ==> (($phys_ptr_cast(L#curr,^s_node) == $phys_ptr_cast(P#a,^s_node)));
invariant b0050 ==> (($phys_ptr_cast(L#curr,^s_node) == $phys_ptr_cast(P#b,^s_node)));
invariant b0051 ==> (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node))));
invariant b0052 ==> (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node))));
invariant b0053 ==> (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node))));
invariant b0054 ==> (($non_null($phys_ptr_cast(P#a,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node))));
invariant b0055 ==> (($non_null($phys_ptr_cast(P#b,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node))));
invariant b0056 ==> (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node))));
invariant b0057 ==> (($non_null($phys_ptr_cast(P#a,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node) == $phys_ptr_cast(P#b,^s_node))));
invariant b0058 ==> (($non_null($phys_ptr_cast(P#a,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#a,^s_node),^s_node) == $phys_ptr_cast(L#curr,^s_node))));
invariant b0059 ==> (($non_null($phys_ptr_cast(P#b,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node) == $phys_ptr_cast(P#a,^s_node))));
invariant b0060 ==> (($non_null($phys_ptr_cast(P#b,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#b,^s_node),^s_node) == $phys_ptr_cast(L#curr,^s_node))));
invariant b0061 ==> (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node) == $phys_ptr_cast(P#a,^s_node))));
invariant b0062 ==> (($non_null($phys_ptr_cast(L#curr,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#curr,^s_node),^s_node) == $phys_ptr_cast(P#b,^s_node))));


          invariant $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^s_node));
          invariant $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(L#curr, ^s_node));
        {
          anon424:
            assume $writes_nothing(old($s), $s);
            assume $timestamp_post(loopState#46, $s);
            assume $full_stop_ext(#tok$3^16.5, $s);
            // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
            assume $meta_eq(loopState#46, $s);
            // assert @reads_check_normal((curr->next)); 
            assert $thread_local($s, $phys_ptr_cast(L#curr, ^s_node));
            assume true;
            // if (@_vcc_ptr_neq_null(*((curr->next)))) ...
            if ($non_null($rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)))
            {
              anon422:
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union_one2(sll_reach(*((b->next))), b))); 
                assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $phys_ptr_cast(P#b, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_keys(a), @_vcc_intset_union(sll_keys(*((a->next))), @_vcc_intset_singleton(*((a->key)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#a, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(a), ==(sll(a), &&(sll(*((a->next))), unchecked!(@_vcc_oset_in(a, sll_reach(*((a->next)))))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#a, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_reach(a), @_vcc_oset_union_one2(sll_reach(*((a->next))), a))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $phys_ptr_cast(P#a, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg(a, curr), &&(sll_lseg(*((a->next)), curr), unchecked!(@_vcc_oset_in(a, sll_lseg_reach(*((a->next)), curr)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg_reach(a, curr), @_vcc_oset_union_one2(sll_lseg_reach(*((a->next)), curr), a))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $phys_ptr_cast(P#a, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg_keys(a, curr), @_vcc_intset_union(sll_lseg_keys(*((a->next)), curr), @_vcc_intset_singleton(*((a->key)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
                // struct s_node* curr0; 
                // curr0 := curr; 
                SL#curr0 := $phys_ptr_cast(L#curr, ^s_node);
                // struct s_node* stmtexpr0#4; 
                // stmtexpr0#4 := curr0; 
                stmtexpr0#4 := $phys_ptr_cast(SL#curr0, ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_pure(curr, *((curr->next)))), ==(sll_lseg(curr, *((curr->next))), &&(sll_lseg(*((curr->next)), *((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_lseg_reach(*((curr->next)), *((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $phys_ptr_cast(L#curr, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#curr, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_pure(curr, *((curr->next)))), ==(sll_lseg_reach(curr, *((curr->next))), @_vcc_oset_union_one2(sll_lseg_reach(*((curr->next)), *((curr->next))), curr))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $phys_ptr_cast(L#curr, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#curr, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(curr), @_vcc_ptr_neq_pure(curr, *((curr->next)))), ==(sll_lseg_keys(curr, *((curr->next))), @_vcc_intset_union(sll_lseg_keys(*((curr->next)), *((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) && $phys_ptr_cast(L#curr, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#curr, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
                // assert @reads_check_normal((curr->next)); 
                assert $thread_local($s, $phys_ptr_cast(L#curr, ^s_node));
                // curr := *((curr->next)); 
                L#curr := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg(a, curr), &&(sll_lseg(*((a->next)), curr), unchecked!(@_vcc_oset_in(a, sll_lseg_reach(*((a->next)), curr)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg_reach(a, curr), @_vcc_oset_union_one2(sll_lseg_reach(*((a->next)), curr), a))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $phys_ptr_cast(P#a, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(a), @_vcc_ptr_neq_pure(a, curr)), ==(sll_lseg_keys(a, curr), @_vcc_intset_union(sll_lseg_keys(*((a->next)), curr), @_vcc_intset_singleton(*((a->key)))))); 
                assume $non_null($phys_ptr_cast(P#a, ^s_node)) && $phys_ptr_cast(P#a, ^s_node) != $phys_ptr_cast(L#curr, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node), $phys_ptr_cast(L#curr, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(curr), &&(@_vcc_mutable(@state, curr), @writes_check(curr))); 
                assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#curr, ^s_node)) && $top_writable($s, #wrTime$3^3.3, $phys_ptr_cast(L#curr, ^s_node));
            }
            else
            {
              anon423:
                // assert @_vcc_possibly_unreachable; 
                assert {:PossiblyUnreachable true} true;
                // goto #break_1; 
                goto #break_1;
            }

          #continue_1:
            assume true;

// INV:LOOPTAIL

        }

      anon426:
        assume $full_stop_ext(#tok$3^16.5, $s);

      #break_1:
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union_one2(sll_reach(*((b->next))), b))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_keys(a), @_vcc_intset_union(sll_keys(*((a->next))), @_vcc_intset_singleton(*((a->key)))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#a, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll(a), &&(sll(*((a->next))), unchecked!(@_vcc_oset_in(a, sll_reach(*((a->next)))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#a, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_reach(a), @_vcc_oset_union_one2(sll_reach(*((a->next))), a))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $phys_ptr_cast(P#a, ^s_node));
        // _math \state _dryad_S0; 
        // _dryad_S0 := @_vcc_current_state(@state); 
        SL#_dryad_S0 := $current_state($s);
        // _math \state stmtexpr0#5; 
        // stmtexpr0#5 := _dryad_S0; 
        stmtexpr0#5 := SL#_dryad_S0;
        // assert @prim_writes_check((curr->next)); 
        assert $writable_prim($s, #wrTime$3^3.3, $dot($phys_ptr_cast(L#curr, ^s_node), s_node.next));
        // *(curr->next) := b; 
        call $write_int(s_node.next, $phys_ptr_cast(L#curr, ^s_node), $ptr_to_int($phys_ptr_cast(P#b, ^s_node)));
        assume $full_stop_ext(#tok$3^27.5, $s);
        // _math \state _dryad_S1; 
        // _dryad_S1 := @_vcc_current_state(@state); 
        SL#_dryad_S1 := $current_state($s);
        // _math \state stmtexpr1#6; 
        // stmtexpr1#6 := _dryad_S1; 
        stmtexpr1#6 := SL#_dryad_S1;
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(b)))), ==(old(_dryad_S0, sll_keys(b)), old(_dryad_S1, sll_keys(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(b)))), ==(old(_dryad_S0, sll(b)), old(_dryad_S1, sll(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(b)))), ==(old(_dryad_S0, sll_reach(b)), old(_dryad_S1, sll_reach(b)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#b, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(a)))), ==(old(_dryad_S0, sll_keys(a)), old(_dryad_S1, sll_keys(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(a)))), ==(old(_dryad_S0, sll(a)), old(_dryad_S1, sll(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_reach(a)))), ==(old(_dryad_S0, sll_reach(a)), old(_dryad_S1, sll_reach(a)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_lseg_reach(a, curr)))), ==(old(_dryad_S0, sll_lseg(a, curr)), old(_dryad_S1, sll_lseg(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_lseg_reach(a, curr)))), ==(old(_dryad_S0, sll_lseg_reach(a, curr)), old(_dryad_S1, sll_lseg_reach(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(unchecked!(@_vcc_oset_in(curr, old(_dryad_S0, sll_lseg_reach(a, curr)))), ==(old(_dryad_S0, sll_lseg_keys(a, curr)), old(_dryad_S1, sll_lseg_keys(a, curr)))); 
        assume !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $phys_ptr_cast(P#a, ^s_node), $phys_ptr_cast(L#curr, ^s_node));
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
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union_one2(sll_reach(*((b->next))), b))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $phys_ptr_cast(P#b, ^s_node));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_keys(a), @_vcc_intset_union(sll_keys(*((a->next))), @_vcc_intset_singleton(*((a->key)))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#a, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#a, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll(a), &&(sll(*((a->next))), unchecked!(@_vcc_oset_in(a, sll_reach(*((a->next)))))))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#a, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#a, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(a), ==(sll_reach(a), @_vcc_oset_union_one2(sll_reach(*((a->next))), a))); 
        assume $non_null($phys_ptr_cast(P#a, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#a, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#a, ^s_node), ^s_node)), $phys_ptr_cast(P#a, ^s_node));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_keys(curr), @_vcc_intset_union(sll_keys(*((curr->next))), @_vcc_intset_singleton(*((curr->key)))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#curr, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#curr, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll(curr), &&(sll(*((curr->next))), unchecked!(@_vcc_oset_in(curr, sll_reach(*((curr->next)))))))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#curr, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#curr, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(curr), ==(sll_reach(curr), @_vcc_oset_union_one2(sll_reach(*((curr->next))), curr))); 
        assume $non_null($phys_ptr_cast(L#curr, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#curr, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#curr, ^s_node), ^s_node)), $phys_ptr_cast(L#curr, ^s_node));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_keys(b), @_vcc_intset_union(sll_keys(*((b->next))), @_vcc_intset_singleton(*((b->key)))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#b, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#b, ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll(b), &&(sll(*((b->next))), unchecked!(@_vcc_oset_in(b, sll_reach(*((b->next)))))))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#b, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#b, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node))));
        // assume ==>(@_vcc_ptr_neq_null(b), ==(sll_reach(b), @_vcc_oset_union_one2(sll_reach(*((b->next))), b))); 
        assume $non_null($phys_ptr_cast(P#b, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#b, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#b, ^s_node), ^s_node)), $phys_ptr_cast(P#b, ^s_node));
        // return a; 
        $result := $phys_ptr_cast(P#a, ^s_node);
        assume true;
        assert $position_marker();
        goto #exit;
    }

  anon428:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$3^27.5: $token;

const unique #tok$3^16.5: $token;

const unique #tok$4^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(4, #file^?3Cno?20file?3E);

const unique #tok$3^3.3: $token;

const unique #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad_Bin?5CTests?5Cgrass?5Csl_concat.c: $token;

axiom $file_name_is(3, #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad_Bin?5CTests?5Cgrass?5Csl_concat.c);

const unique #file^c?3A?5Cusers?5Cdaniel?5Cworkspace?5Cvcdryad_bin?5Ctests?5Cgrass?5Cdryad_sl.h: $token;

axiom $file_name_is(2, #file^c?3A?5Cusers?5Cdaniel?5Cworkspace?5Cvcdryad_bin?5Ctests?5Cgrass?5Cdryad_sl.h);

const unique #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad?5Cvcc?5CHost?5Cbin?5CHeaders?5Cvccp.h: $token;

axiom $file_name_is(1, #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad?5Cvcc?5CHost?5Cbin?5CHeaders?5Cvccp.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^s_node);

