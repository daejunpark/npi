
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
b0063 : bool
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

const unique ^$#SLL_filter.c..36776#3: $ctype;

axiom $def_fnptr_type(^$#SLL_filter.c..36776#3);

type $#SLL_filter.c..36776#3;

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



function F#to_remove(P#z: $ptr) : int;

const unique cf#to_remove: $pure_function;

axiom (forall P#z: $ptr :: { F#to_remove(P#z) } $in_range_i4(F#to_remove(P#z)));

axiom $function_arg_type(cf#to_remove, 0, ^^i4);

axiom $function_arg_type(cf#to_remove, 1, $ptr_to(^s_node));

procedure to_remove(P#z: $ptr) returns ($result: int);
  free ensures $in_range_i4($result);
  free ensures $result == F#to_remove(P#z);
  free ensures $call_transition(old($s), $s);



procedure filter(P#h: $ptr) returns ($result: $ptr);
  requires F#sll($s, $phys_ptr_cast(P#h, ^s_node));
  requires !$int_to_bool(F#to_remove($phys_ptr_cast(P#h, ^s_node)));
  modifies $s, $cev_pc;
  ensures F#sll($s, $phys_ptr_cast(P#h, ^s_node));
  ensures F#sll($s, $phys_ptr_cast($result, ^s_node));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation filter(P#h: $ptr) returns ($result: $ptr)
{
  var stmtexpr0#7: $ptr;
  var i0#0: $ptr;
  var stmtexpr2#6: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr1#5: $state;
  var SL#_dryad_S0: $state;
  var stmtexpr0#4: $ptr;
  var SL#i0: $ptr;
  var L#inxt: $ptr;
  var res_to_remove#3: int where $in_range_i4(res_to_remove#3);
  var ite#1: bool;
  var loopState#7: $state;
  var L#i: $ptr;
  var L#j: $ptr;
  var stmtexpr1#9: $oset;
  var stmtexpr0#8: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$3^7.3: int;
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

// INV:PTR: P#h, L#i, L#j
// INV:INT:
// INV:LST: sll
// INV:OLD: loopState#7

  anon65:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$3^7.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$3^7.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$3^7.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := sll_reach(h); 
    call SL#_dryad_G0 := sll_reach($phys_ptr_cast(P#h, ^s_node));
    assume $full_stop_ext(#tok$4^0.0, $s);
    // _math \oset stmtexpr0#8; 
    // stmtexpr0#8 := _dryad_G0; 
    stmtexpr0#8 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#9; 
    // stmtexpr1#9 := _dryad_G1; 
    stmtexpr1#9 := SL#_dryad_G1;
    // assume ==(glob_reach(), _dryad_G1); 
    assume F#glob_reach() == SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_keys(h), @_vcc_intset_union(sll_keys(*((h->next))), @_vcc_intset_singleton(*((h->key)))))); 
    assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#h, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(h), ==(sll(h), &&(sll(*((h->next))), unchecked!(@_vcc_oset_in(h, sll_reach(*((h->next)))))))); 
    assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#h, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#h, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_reach(h), @_vcc_oset_union_one2(sll_reach(*((h->next))), h))); 
    assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#h, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)), $phys_ptr_cast(P#h, ^s_node));
    // struct s_node* j; 
    // struct s_node* i; 
    // assume ==>(@_vcc_ptr_neq_null(h), &&(@_vcc_mutable(@state, h), @writes_check(h))); 
    assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> $mutable($s, $phys_ptr_cast(P#h, ^s_node)) && $top_writable($s, #wrTime$3^7.3, $phys_ptr_cast(P#h, ^s_node));
    // i := h; 
    L#i := $phys_ptr_cast(P#h, ^s_node);
    // assert sll_lseg(i, i); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#i, ^s_node), $phys_ptr_cast(L#i, ^s_node));
    // assume sll_lseg(i, i); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#i, ^s_node), $phys_ptr_cast(L#i, ^s_node));
    // assert sll_lseg(j, j); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#j, ^s_node));
    // assume sll_lseg(j, j); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#j, ^s_node));
    // assert sll_lseg(h, h); 
    assert F#sll_lseg($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(P#h, ^s_node));
    // assume sll_lseg(h, h); 
    assume F#sll_lseg($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(P#h, ^s_node));
    // j := (struct s_node*)@null; 
    L#j := $phys_ptr_cast($null, ^s_node);
    // assert sll_lseg(i, i); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#i, ^s_node), $phys_ptr_cast(L#i, ^s_node));
    // assume sll_lseg(i, i); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#i, ^s_node), $phys_ptr_cast(L#i, ^s_node));
    // assert sll_lseg(j, j); 
    assert F#sll_lseg($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#j, ^s_node));
    // assume sll_lseg(j, j); 
    assume F#sll_lseg($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#j, ^s_node));
    // assert sll_lseg(h, h); 
    assert F#sll_lseg($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(P#h, ^s_node));
    // assume sll_lseg(h, h); 
    assume F#sll_lseg($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(P#h, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(j), ==(sll_keys(j), @_vcc_intset_union(sll_keys(*((j->next))), @_vcc_intset_singleton(*((j->key)))))); 
    assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#j, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(j), ==(sll(j), &&(sll(*((j->next))), unchecked!(@_vcc_oset_in(j, sll_reach(*((j->next)))))))); 
    assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(j), ==(sll_reach(j), @_vcc_oset_union_one2(sll_reach(*((j->next))), j))); 
    assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#j, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)), $phys_ptr_cast(L#j, ^s_node));
    loopState#7 := $s;
    assume true;

p0000 := (F#sll($s,$phys_ptr_cast(P#h,^s_node)));
p0001 := (F#sll($s,$phys_ptr_cast(L#i,^s_node)));
p0002 := (F#sll($s,$phys_ptr_cast(L#j,^s_node)));
p0003 := (F#sll_lseg($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#i,^s_node)));
p0004 := (F#sll_lseg($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#j,^s_node)));
p0005 := (F#sll_lseg($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(P#h,^s_node)));
p0006 := (F#sll_lseg($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(L#j,^s_node)));
p0007 := (F#sll_lseg($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(P#h,^s_node)));
p0008 := (F#sll_lseg($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(L#i,^s_node)));
p0009 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node))));
p0010 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node))));
p0011 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node))));
p0012 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node))));
p0013 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node))));
p0014 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node))));
p0015 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node))));
p0016 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node))));
p0017 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node))));
p0018 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node))));
p0019 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node))));
p0020 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node))));
p0021 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node))));
p0022 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node))));
p0023 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node))));
p0024 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node))));
p0025 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node))));
p0026 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node))));
p0027 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)))));
p0028 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)))));
p0029 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)))));
p0030 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)))));
p0031 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)))));
p0032 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)))));
p0033 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#h,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(L#j,^s_node)))));
p0034 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#h,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(L#i,^s_node)))));
p0035 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#i,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#j,^s_node)))));
p0036 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#i,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(P#h,^s_node)))));
p0037 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#j,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#i,^s_node)))));
p0038 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#j,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(P#h,^s_node)))));
p0039 := ($non_null($phys_ptr_cast(P#h,^s_node)));
p0040 := ($non_null($phys_ptr_cast(L#i,^s_node)));
p0041 := ($non_null($phys_ptr_cast(L#j,^s_node)));
p0042 := ($is_null($phys_ptr_cast(P#h,^s_node)));
p0043 := ($is_null($phys_ptr_cast(L#i,^s_node)));
p0044 := ($is_null($phys_ptr_cast(L#j,^s_node)));
p0045 := (($phys_ptr_cast(P#h,^s_node) == $phys_ptr_cast(L#i,^s_node)));
p0046 := (($phys_ptr_cast(P#h,^s_node) == $phys_ptr_cast(L#j,^s_node)));
p0047 := (($phys_ptr_cast(L#i,^s_node) == $phys_ptr_cast(P#h,^s_node)));
p0048 := (($phys_ptr_cast(L#i,^s_node) == $phys_ptr_cast(L#j,^s_node)));
p0049 := (($phys_ptr_cast(L#j,^s_node) == $phys_ptr_cast(P#h,^s_node)));
p0050 := (($phys_ptr_cast(L#j,^s_node) == $phys_ptr_cast(L#i,^s_node)));
p0051 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#h,^s_node),^s_node))));
p0052 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#i,^s_node),^s_node))));
p0053 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#j,^s_node),^s_node))));
p0054 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#h,^s_node),^s_node))));
p0055 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#i,^s_node),^s_node))));
p0056 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#j,^s_node),^s_node))));
p0057 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#h,^s_node),^s_node) == $phys_ptr_cast(L#i,^s_node))));
p0058 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#h,^s_node),^s_node) == $phys_ptr_cast(L#j,^s_node))));
p0059 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#i,^s_node),^s_node) == $phys_ptr_cast(P#h,^s_node))));
p0060 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#i,^s_node),^s_node) == $phys_ptr_cast(L#j,^s_node))));
p0061 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#j,^s_node),^s_node) == $phys_ptr_cast(P#h,^s_node))));
p0062 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#j,^s_node),^s_node) == $phys_ptr_cast(L#i,^s_node))));


    while (true)


invariant (p0000 == (F#sll($s,$phys_ptr_cast(P#h,^s_node))));
invariant (p0001 == (F#sll($s,$phys_ptr_cast(L#i,^s_node))));
invariant (p0002 == (F#sll($s,$phys_ptr_cast(L#j,^s_node))));
invariant (p0003 == (F#sll_lseg($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#i,^s_node))));
invariant (p0004 == (F#sll_lseg($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#j,^s_node))));
invariant (p0005 == (F#sll_lseg($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(P#h,^s_node))));
invariant (p0006 == (F#sll_lseg($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(L#j,^s_node))));
invariant (p0007 == (F#sll_lseg($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(P#h,^s_node))));
invariant (p0008 == (F#sll_lseg($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(L#i,^s_node))));
invariant (p0009 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)))));
invariant (p0010 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)))));
invariant (p0011 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)))));
invariant (p0012 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)))));
invariant (p0013 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)))));
invariant (p0014 == ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)))));
invariant (p0015 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)))));
invariant (p0016 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)))));
invariant (p0017 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)))));
invariant (p0018 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)))));
invariant (p0019 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)))));
invariant (p0020 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)))));
invariant (p0021 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)))));
invariant (p0022 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)))));
invariant (p0023 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)))));
invariant (p0024 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)))));
invariant (p0025 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)))));
invariant (p0026 == ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)))));
invariant (p0027 == (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node))))));
invariant (p0028 == (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node))))));
invariant (p0029 == (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node))))));
invariant (p0030 == (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node))))));
invariant (p0031 == (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node))))));
invariant (p0032 == (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node))))));
invariant (p0033 == (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#h,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(L#j,^s_node))))));
invariant (p0034 == (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#h,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(L#i,^s_node))))));
invariant (p0035 == (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#i,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#j,^s_node))))));
invariant (p0036 == (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#i,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(P#h,^s_node))))));
invariant (p0037 == (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#j,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#i,^s_node))))));
invariant (p0038 == (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#j,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(P#h,^s_node))))));
invariant (p0039 == ($non_null($phys_ptr_cast(P#h,^s_node))));
invariant (p0040 == ($non_null($phys_ptr_cast(L#i,^s_node))));
invariant (p0041 == ($non_null($phys_ptr_cast(L#j,^s_node))));
invariant (p0042 == ($is_null($phys_ptr_cast(P#h,^s_node))));
invariant (p0043 == ($is_null($phys_ptr_cast(L#i,^s_node))));
invariant (p0044 == ($is_null($phys_ptr_cast(L#j,^s_node))));
invariant (p0045 == (($phys_ptr_cast(P#h,^s_node) == $phys_ptr_cast(L#i,^s_node))));
invariant (p0046 == (($phys_ptr_cast(P#h,^s_node) == $phys_ptr_cast(L#j,^s_node))));
invariant (p0047 == (($phys_ptr_cast(L#i,^s_node) == $phys_ptr_cast(P#h,^s_node))));
invariant (p0048 == (($phys_ptr_cast(L#i,^s_node) == $phys_ptr_cast(L#j,^s_node))));
invariant (p0049 == (($phys_ptr_cast(L#j,^s_node) == $phys_ptr_cast(P#h,^s_node))));
invariant (p0050 == (($phys_ptr_cast(L#j,^s_node) == $phys_ptr_cast(L#i,^s_node))));
invariant (p0051 == (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#h,^s_node),^s_node)))));
invariant (p0052 == (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#i,^s_node),^s_node)))));
invariant (p0053 == (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#j,^s_node),^s_node)))));
invariant (p0054 == (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#h,^s_node),^s_node)))));
invariant (p0055 == (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#i,^s_node),^s_node)))));
invariant (p0056 == (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#j,^s_node),^s_node)))));
invariant (p0057 == (($non_null($phys_ptr_cast(P#h,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#h,^s_node),^s_node) == $phys_ptr_cast(L#i,^s_node)))));
invariant (p0058 == (($non_null($phys_ptr_cast(P#h,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#h,^s_node),^s_node) == $phys_ptr_cast(L#j,^s_node)))));
invariant (p0059 == (($non_null($phys_ptr_cast(L#i,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#i,^s_node),^s_node) == $phys_ptr_cast(P#h,^s_node)))));
invariant (p0060 == (($non_null($phys_ptr_cast(L#i,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#i,^s_node),^s_node) == $phys_ptr_cast(L#j,^s_node)))));
invariant (p0061 == (($non_null($phys_ptr_cast(L#j,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#j,^s_node),^s_node) == $phys_ptr_cast(P#h,^s_node)))));
invariant (p0062 == (($non_null($phys_ptr_cast(L#j,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#j,^s_node),^s_node) == $phys_ptr_cast(L#i,^s_node)))));

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
true
);


      invariant $non_null($phys_ptr_cast(L#i, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#i, ^s_node));
      invariant $non_null($phys_ptr_cast(L#i, ^s_node)) ==> $top_writable($s, #wrTime$3^7.3, $phys_ptr_cast(L#i, ^s_node));
    {
      anon64:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#7, $s);
        assume $full_stop_ext(#tok$3^17.3, $s);
        // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
        assume $meta_eq(loopState#7, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(i)) ...
        if ($non_null($phys_ptr_cast(L#i, ^s_node)))
        {
          anon61:
            // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_keys(i), @_vcc_intset_union(sll_keys(*((i->next))), @_vcc_intset_singleton(*((i->key)))))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#i, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(i), ==(sll(i), &&(sll(*((i->next))), unchecked!(@_vcc_oset_in(i, sll_reach(*((i->next)))))))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_reach(i), @_vcc_oset_union_one2(sll_reach(*((i->next))), i))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $phys_ptr_cast(L#i, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(j), ==(sll_keys(j), @_vcc_intset_union(sll_keys(*((j->next))), @_vcc_intset_singleton(*((j->key)))))); 
            assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#j, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(j), ==(sll(j), &&(sll(*((j->next))), unchecked!(@_vcc_oset_in(j, sll_reach(*((j->next)))))))); 
            assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(j), ==(sll_reach(j), @_vcc_oset_union_one2(sll_reach(*((j->next))), j))); 
            assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#j, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)), $phys_ptr_cast(L#j, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_keys(h), @_vcc_intset_union(sll_keys(*((h->next))), @_vcc_intset_singleton(*((h->key)))))); 
            assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#h, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(h), ==(sll(h), &&(sll(*((h->next))), unchecked!(@_vcc_oset_in(h, sll_reach(*((h->next)))))))); 
            assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#h, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#h, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_reach(h), @_vcc_oset_union_one2(sll_reach(*((h->next))), h))); 
            assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#h, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)), $phys_ptr_cast(P#h, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, j)), ==(sll_lseg(h, j), &&(sll_lseg(*((h->next)), j), unchecked!(@_vcc_oset_in(h, sll_lseg_reach(*((h->next)), j)))))); 
            assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#j, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#j, ^s_node)) && !$oset_in($phys_ptr_cast(P#h, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#j, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, j)), ==(sll_lseg_reach(h, j), @_vcc_oset_union_one2(sll_lseg_reach(*((h->next)), j), h))); 
            assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#j, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#j, ^s_node)), $phys_ptr_cast(P#h, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, j)), ==(sll_lseg_keys(h, j), @_vcc_intset_union(sll_lseg_keys(*((h->next)), j), @_vcc_intset_singleton(*((h->key)))))); 
            assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#j, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#j, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg(j, i), &&(sll_lseg(*((j->next)), i), unchecked!(@_vcc_oset_in(j, sll_lseg_reach(*((j->next)), i)))))); 
            assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) && !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg_reach(j, i), @_vcc_oset_union_one2(sll_lseg_reach(*((j->next)), i), j))); 
            assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $phys_ptr_cast(L#j, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg_keys(j, i), @_vcc_intset_union(sll_lseg_keys(*((j->next)), i), @_vcc_intset_singleton(*((j->key)))))); 
            assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#j, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg(h, i), &&(sll_lseg(*((h->next)), i), unchecked!(@_vcc_oset_in(h, sll_lseg_reach(*((h->next)), i)))))); 
            assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) && !$oset_in($phys_ptr_cast(P#h, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg_reach(h, i), @_vcc_oset_union_one2(sll_lseg_reach(*((h->next)), i), h))); 
            assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $phys_ptr_cast(P#h, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg_keys(h, i), @_vcc_intset_union(sll_lseg_keys(*((h->next)), i), @_vcc_intset_singleton(*((h->key)))))); 
            assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node))));
            // _Bool ite#1; 
            // int32_t res_to_remove#3; 
            // res_to_remove#3 := to_remove(i); 
            call res_to_remove#3 := to_remove($phys_ptr_cast(L#i, ^s_node));
            assume $full_stop_ext(#tok$3^31.9, $s);
            // ite#1 := (_Bool)res_to_remove#3; 
            ite#1 := $int_to_bool(res_to_remove#3);
            assume true;
            // if (ite#1) ...
            if (ite#1)
            {
              anon59:
                // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_keys(i), @_vcc_intset_union(sll_keys(*((i->next))), @_vcc_intset_singleton(*((i->key)))))); 
                assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#i, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i), ==(sll(i), &&(sll(*((i->next))), unchecked!(@_vcc_oset_in(i, sll_reach(*((i->next)))))))); 
                assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_reach(i), @_vcc_oset_union_one2(sll_reach(*((i->next))), i))); 
                assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(j), ==(sll_keys(j), @_vcc_intset_union(sll_keys(*((j->next))), @_vcc_intset_singleton(*((j->key)))))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#j, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(j), ==(sll(j), &&(sll(*((j->next))), unchecked!(@_vcc_oset_in(j, sll_reach(*((j->next)))))))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(j), ==(sll_reach(j), @_vcc_oset_union_one2(sll_reach(*((j->next))), j))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#j, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)), $phys_ptr_cast(L#j, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_keys(h), @_vcc_intset_union(sll_keys(*((h->next))), @_vcc_intset_singleton(*((h->key)))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#h, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll(h), &&(sll(*((h->next))), unchecked!(@_vcc_oset_in(h, sll_reach(*((h->next)))))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#h, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#h, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_reach(h), @_vcc_oset_union_one2(sll_reach(*((h->next))), h))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#h, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)), $phys_ptr_cast(P#h, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, j)), ==(sll_lseg(h, j), &&(sll_lseg(*((h->next)), j), unchecked!(@_vcc_oset_in(h, sll_lseg_reach(*((h->next)), j)))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#j, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#j, ^s_node)) && !$oset_in($phys_ptr_cast(P#h, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#j, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, j)), ==(sll_lseg_reach(h, j), @_vcc_oset_union_one2(sll_lseg_reach(*((h->next)), j), h))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#j, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#j, ^s_node)), $phys_ptr_cast(P#h, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, j)), ==(sll_lseg_keys(h, j), @_vcc_intset_union(sll_lseg_keys(*((h->next)), j), @_vcc_intset_singleton(*((h->key)))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#j, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#j, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg(j, i), &&(sll_lseg(*((j->next)), i), unchecked!(@_vcc_oset_in(j, sll_lseg_reach(*((j->next)), i)))))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) && !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg_reach(j, i), @_vcc_oset_union_one2(sll_lseg_reach(*((j->next)), i), j))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $phys_ptr_cast(L#j, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg_keys(j, i), @_vcc_intset_union(sll_lseg_keys(*((j->next)), i), @_vcc_intset_singleton(*((j->key)))))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#j, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg(h, i), &&(sll_lseg(*((h->next)), i), unchecked!(@_vcc_oset_in(h, sll_lseg_reach(*((h->next)), i)))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) && !$oset_in($phys_ptr_cast(P#h, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg_reach(h, i), @_vcc_oset_union_one2(sll_lseg_reach(*((h->next)), i), h))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $phys_ptr_cast(P#h, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg_keys(h, i), @_vcc_intset_union(sll_lseg_keys(*((h->next)), i), @_vcc_intset_singleton(*((h->key)))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node))));
                // struct s_node* inxt; 
                // struct s_node* i0; 
                // i0 := i; 
                SL#i0 := $phys_ptr_cast(L#i, ^s_node);
                // struct s_node* stmtexpr0#4; 
                // stmtexpr0#4 := i0; 
                stmtexpr0#4 := $phys_ptr_cast(SL#i0, ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_keys(i), @_vcc_intset_union(sll_keys(*((i->next))), @_vcc_intset_singleton(*((i->key)))))); 
                assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#i, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i), ==(sll(i), &&(sll(*((i->next))), unchecked!(@_vcc_oset_in(i, sll_reach(*((i->next)))))))); 
                assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_reach(i), @_vcc_oset_union_one2(sll_reach(*((i->next))), i))); 
                assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $phys_ptr_cast(L#i, ^s_node));
                // assert @reads_check_normal((i->next)); 
                assert $thread_local($s, $phys_ptr_cast(L#i, ^s_node));
                // inxt := *((i->next)); 
                L#inxt := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(inxt), ==(sll_keys(inxt), @_vcc_intset_union(sll_keys(*((inxt->next))), @_vcc_intset_singleton(*((inxt->key)))))); 
                assume $non_null($phys_ptr_cast(L#inxt, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#inxt, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#inxt, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#inxt, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(inxt), ==(sll(inxt), &&(sll(*((inxt->next))), unchecked!(@_vcc_oset_in(inxt, sll_reach(*((inxt->next)))))))); 
                assume $non_null($phys_ptr_cast(L#inxt, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#inxt, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#inxt, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#inxt, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#inxt, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(inxt), ==(sll_reach(inxt), @_vcc_oset_union_one2(sll_reach(*((inxt->next))), inxt))); 
                assume $non_null($phys_ptr_cast(L#inxt, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#inxt, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#inxt, ^s_node), ^s_node)), $phys_ptr_cast(L#inxt, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_keys(i), @_vcc_intset_union(sll_keys(*((i->next))), @_vcc_intset_singleton(*((i->key)))))); 
                assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#i, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i), ==(sll(i), &&(sll(*((i->next))), unchecked!(@_vcc_oset_in(i, sll_reach(*((i->next)))))))); 
                assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_reach(i), @_vcc_oset_union_one2(sll_reach(*((i->next))), i))); 
                assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $phys_ptr_cast(L#i, ^s_node));
                // _math \state _dryad_S0; 
                // _dryad_S0 := @_vcc_current_state(@state); 
                SL#_dryad_S0 := $current_state($s);
                // _math \state stmtexpr1#5; 
                // stmtexpr1#5 := _dryad_S0; 
                stmtexpr1#5 := SL#_dryad_S0;
                // assert @prim_writes_check((j->next)); 
                assert $writable_prim($s, #wrTime$3^7.3, $dot($phys_ptr_cast(L#j, ^s_node), s_node.next));
                // *(j->next) := inxt; 
                call $write_int(s_node.next, $phys_ptr_cast(L#j, ^s_node), $ptr_to_int($phys_ptr_cast(L#inxt, ^s_node)));
                assume $full_stop_ext(#tok$3^33.7, $s);
                // _math \state _dryad_S1; 
                // _dryad_S1 := @_vcc_current_state(@state); 
                SL#_dryad_S1 := $current_state($s);
                // _math \state stmtexpr2#6; 
                // stmtexpr2#6 := _dryad_S1; 
                stmtexpr2#6 := SL#_dryad_S1;
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_reach(i0)))), ==(old(_dryad_S0, sll_keys(i0)), old(_dryad_S1, sll_keys(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_reach(i0)))), ==(old(_dryad_S0, sll(i0)), old(_dryad_S1, sll(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_reach(i0)))), ==(old(_dryad_S0, sll_reach(i0)), old(_dryad_S1, sll_reach(i0)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(SL#i0, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_reach(inxt)))), ==(old(_dryad_S0, sll_keys(inxt)), old(_dryad_S1, sll_keys(inxt)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#inxt, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#inxt, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#inxt, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_reach(inxt)))), ==(old(_dryad_S0, sll(inxt)), old(_dryad_S1, sll(inxt)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#inxt, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#inxt, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#inxt, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_reach(inxt)))), ==(old(_dryad_S0, sll_reach(inxt)), old(_dryad_S1, sll_reach(inxt)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#inxt, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#inxt, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#inxt, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_reach(i)))), ==(old(_dryad_S0, sll_keys(i)), old(_dryad_S1, sll_keys(i)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#i, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(L#i, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_reach(i)))), ==(old(_dryad_S0, sll(i)), old(_dryad_S1, sll(i)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#i, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(L#i, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_reach(i)))), ==(old(_dryad_S0, sll_reach(i)), old(_dryad_S1, sll_reach(i)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#i, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(L#i, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_reach(h)))), ==(old(_dryad_S0, sll_keys(h)), old(_dryad_S1, sll_keys(h)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node))) ==> F#sll_keys(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node)) == F#sll_keys(SL#_dryad_S1, $phys_ptr_cast(P#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_reach(h)))), ==(old(_dryad_S0, sll(h)), old(_dryad_S1, sll(h)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node))) ==> F#sll(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node)) == F#sll(SL#_dryad_S1, $phys_ptr_cast(P#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_reach(h)))), ==(old(_dryad_S0, sll_reach(h)), old(_dryad_S1, sll_reach(h)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node))) ==> F#sll_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node)) == F#sll_reach(SL#_dryad_S1, $phys_ptr_cast(P#h, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_lseg_reach(h, j)))), ==(old(_dryad_S0, sll_lseg(h, j)), old(_dryad_S1, sll_lseg(h, j)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_lseg_reach(h, j)))), ==(old(_dryad_S0, sll_lseg_reach(h, j)), old(_dryad_S1, sll_lseg_reach(h, j)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_lseg_reach(h, j)))), ==(old(_dryad_S0, sll_lseg_keys(h, j)), old(_dryad_S1, sll_lseg_keys(h, j)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((j->next))), i)))), ==(old(_dryad_S0, sll_lseg(old(_dryad_S0, *((j->next))), i)), old(_dryad_S1, sll_lseg(old(_dryad_S0, *((j->next))), i)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((j->next))), i)))), ==(old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((j->next))), i)), old(_dryad_S1, sll_lseg_reach(old(_dryad_S0, *((j->next))), i)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((j->next))), i)))), ==(old(_dryad_S0, sll_lseg_keys(old(_dryad_S0, *((j->next))), i)), old(_dryad_S1, sll_lseg_keys(old(_dryad_S0, *((j->next))), i)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_lseg_reach(h, i)))), ==(old(_dryad_S0, sll_lseg(h, i)), old(_dryad_S1, sll_lseg(h, i)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_lseg_reach(h, i)))), ==(old(_dryad_S0, sll_lseg_reach(h, i)), old(_dryad_S1, sll_lseg_reach(h, i)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_lseg_reach(h, i)))), ==(old(_dryad_S0, sll_lseg_keys(h, i)), old(_dryad_S1, sll_lseg_keys(h, i)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((j->next))), i)))), ==(old(_dryad_S0, sll_lseg(old(_dryad_S0, *((j->next))), i)), old(_dryad_S1, sll_lseg(old(_dryad_S0, *((j->next))), i)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((j->next))), i)))), ==(old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((j->next))), i)), old(_dryad_S1, sll_lseg_reach(old(_dryad_S0, *((j->next))), i)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_lseg_reach(old(_dryad_S0, *((j->next))), i)))), ==(old(_dryad_S0, sll_lseg_keys(old(_dryad_S0, *((j->next))), i)), old(_dryad_S1, sll_lseg_keys(old(_dryad_S0, *((j->next))), i)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_lseg_reach(h, i)))), ==(old(_dryad_S0, sll_lseg(h, i)), old(_dryad_S1, sll_lseg(h, i)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node))) ==> F#sll_lseg(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == F#sll_lseg(SL#_dryad_S1, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_lseg_reach(h, i)))), ==(old(_dryad_S0, sll_lseg_reach(h, i)), old(_dryad_S1, sll_lseg_reach(h, i)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node))) ==> F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == F#sll_lseg_reach(SL#_dryad_S1, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(unchecked!(@_vcc_oset_in(j, old(_dryad_S0, sll_lseg_reach(h, i)))), ==(old(_dryad_S0, sll_lseg_keys(h, i)), old(_dryad_S1, sll_lseg_keys(h, i)))); 
                assume !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node))) ==> F#sll_lseg_keys(SL#_dryad_S0, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == F#sll_lseg_keys(SL#_dryad_S1, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(j, i0)), ==(*((i0->key)), old(_dryad_S0, *((i0->key))))); 
                assume !($phys_ptr_cast(L#j, ^s_node) == $phys_ptr_cast(SL#i0, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(j, i0)), @_vcc_ptr_eq_pure(*((i0->next)), old(_dryad_S0, *((i0->next))))); 
                assume !($phys_ptr_cast(L#j, ^s_node) == $phys_ptr_cast(SL#i0, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(j, inxt)), ==(*((inxt->key)), old(_dryad_S0, *((inxt->key))))); 
                assume !($phys_ptr_cast(L#j, ^s_node) == $phys_ptr_cast(L#inxt, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#inxt, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(L#inxt, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(j, inxt)), @_vcc_ptr_eq_pure(*((inxt->next)), old(_dryad_S0, *((inxt->next))))); 
                assume !($phys_ptr_cast(L#j, ^s_node) == $phys_ptr_cast(L#inxt, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#inxt, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#inxt, ^s_node), ^s_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(j, i)), ==(*((i->key)), old(_dryad_S0, *((i->key))))); 
                assume !($phys_ptr_cast(L#j, ^s_node) == $phys_ptr_cast(L#i, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(L#i, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(j, i)), @_vcc_ptr_eq_pure(*((i->next)), old(_dryad_S0, *((i->next))))); 
                assume !($phys_ptr_cast(L#j, ^s_node) == $phys_ptr_cast(L#i, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node);
                // assume ==>(!(@_vcc_ptr_eq_pure(j, h)), ==(*((h->key)), old(_dryad_S0, *((h->key))))); 
                assume !($phys_ptr_cast(L#j, ^s_node) == $phys_ptr_cast(P#h, ^s_node)) ==> $rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node)) == $rd_inv(SL#_dryad_S0, s_node.key, $phys_ptr_cast(P#h, ^s_node));
                // assume ==>(!(@_vcc_ptr_eq_pure(j, h)), @_vcc_ptr_eq_pure(*((h->next)), old(_dryad_S0, *((h->next))))); 
                assume !($phys_ptr_cast(L#j, ^s_node) == $phys_ptr_cast(P#h, ^s_node)) ==> $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node) == $rd_phys_ptr(SL#_dryad_S0, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node);
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_keys(i0), @_vcc_intset_union(sll_keys(*((i0->next))), @_vcc_intset_singleton(*((i0->key)))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(SL#i0, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(SL#i0, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll(i0), &&(sll(*((i0->next))), unchecked!(@_vcc_oset_in(i0, sll_reach(*((i0->next)))))))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll($s, $phys_ptr_cast(SL#i0, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(SL#i0, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i0), ==(sll_reach(i0), @_vcc_oset_union_one2(sll_reach(*((i0->next))), i0))); 
                assume $non_null($phys_ptr_cast(SL#i0, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(SL#i0, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(SL#i0, ^s_node), ^s_node)), $phys_ptr_cast(SL#i0, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(inxt), ==(sll_keys(inxt), @_vcc_intset_union(sll_keys(*((inxt->next))), @_vcc_intset_singleton(*((inxt->key)))))); 
                assume $non_null($phys_ptr_cast(L#inxt, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#inxt, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#inxt, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#inxt, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(inxt), ==(sll(inxt), &&(sll(*((inxt->next))), unchecked!(@_vcc_oset_in(inxt, sll_reach(*((inxt->next)))))))); 
                assume $non_null($phys_ptr_cast(L#inxt, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#inxt, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#inxt, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#inxt, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#inxt, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(inxt), ==(sll_reach(inxt), @_vcc_oset_union_one2(sll_reach(*((inxt->next))), inxt))); 
                assume $non_null($phys_ptr_cast(L#inxt, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#inxt, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#inxt, ^s_node), ^s_node)), $phys_ptr_cast(L#inxt, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_keys(i), @_vcc_intset_union(sll_keys(*((i->next))), @_vcc_intset_singleton(*((i->key)))))); 
                assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#i, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i), ==(sll(i), &&(sll(*((i->next))), unchecked!(@_vcc_oset_in(i, sll_reach(*((i->next)))))))); 
                assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_reach(i), @_vcc_oset_union_one2(sll_reach(*((i->next))), i))); 
                assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_keys(h), @_vcc_intset_union(sll_keys(*((h->next))), @_vcc_intset_singleton(*((h->key)))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#h, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll(h), &&(sll(*((h->next))), unchecked!(@_vcc_oset_in(h, sll_reach(*((h->next)))))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#h, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#h, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_reach(h), @_vcc_oset_union_one2(sll_reach(*((h->next))), h))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#h, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)), $phys_ptr_cast(P#h, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(j), ==(sll_keys(j), @_vcc_intset_union(sll_keys(*((j->next))), @_vcc_intset_singleton(*((j->key)))))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#j, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(j), ==(sll(j), &&(sll(*((j->next))), unchecked!(@_vcc_oset_in(j, sll_reach(*((j->next)))))))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(j), ==(sll_reach(j), @_vcc_oset_union_one2(sll_reach(*((j->next))), j))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#j, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)), $phys_ptr_cast(L#j, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(inxt), ==(sll_keys(inxt), @_vcc_intset_union(sll_keys(*((inxt->next))), @_vcc_intset_singleton(*((inxt->key)))))); 
                assume $non_null($phys_ptr_cast(L#inxt, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#inxt, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#inxt, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#inxt, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(inxt), ==(sll(inxt), &&(sll(*((inxt->next))), unchecked!(@_vcc_oset_in(inxt, sll_reach(*((inxt->next)))))))); 
                assume $non_null($phys_ptr_cast(L#inxt, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#inxt, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#inxt, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#inxt, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#inxt, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(inxt), ==(sll_reach(inxt), @_vcc_oset_union_one2(sll_reach(*((inxt->next))), inxt))); 
                assume $non_null($phys_ptr_cast(L#inxt, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#inxt, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#inxt, ^s_node), ^s_node)), $phys_ptr_cast(L#inxt, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg(j, i), &&(sll_lseg(*((j->next)), i), unchecked!(@_vcc_oset_in(j, sll_lseg_reach(*((j->next)), i)))))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) && !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg_reach(j, i), @_vcc_oset_union_one2(sll_lseg_reach(*((j->next)), i), j))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $phys_ptr_cast(L#j, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg_keys(j, i), @_vcc_intset_union(sll_lseg_keys(*((j->next)), i), @_vcc_intset_singleton(*((j->key)))))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#j, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg(h, i), &&(sll_lseg(*((h->next)), i), unchecked!(@_vcc_oset_in(h, sll_lseg_reach(*((h->next)), i)))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) && !$oset_in($phys_ptr_cast(P#h, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg_reach(h, i), @_vcc_oset_union_one2(sll_lseg_reach(*((h->next)), i), h))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $phys_ptr_cast(P#h, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg_keys(h, i), @_vcc_intset_union(sll_lseg_keys(*((h->next)), i), @_vcc_intset_singleton(*((h->key)))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg(j, i), &&(sll_lseg(*((j->next)), i), unchecked!(@_vcc_oset_in(j, sll_lseg_reach(*((j->next)), i)))))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) && !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg_reach(j, i), @_vcc_oset_union_one2(sll_lseg_reach(*((j->next)), i), j))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $phys_ptr_cast(L#j, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg_keys(j, i), @_vcc_intset_union(sll_lseg_keys(*((j->next)), i), @_vcc_intset_singleton(*((j->key)))))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#j, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg(h, i), &&(sll_lseg(*((h->next)), i), unchecked!(@_vcc_oset_in(h, sll_lseg_reach(*((h->next)), i)))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) && !$oset_in($phys_ptr_cast(P#h, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg_reach(h, i), @_vcc_oset_union_one2(sll_lseg_reach(*((h->next)), i), h))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $phys_ptr_cast(P#h, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg_keys(h, i), @_vcc_intset_union(sll_lseg_keys(*((h->next)), i), @_vcc_intset_singleton(*((h->key)))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node))));
            }
            else
            {
              anon60:
                // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_keys(i), @_vcc_intset_union(sll_keys(*((i->next))), @_vcc_intset_singleton(*((i->key)))))); 
                assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#i, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i), ==(sll(i), &&(sll(*((i->next))), unchecked!(@_vcc_oset_in(i, sll_reach(*((i->next)))))))); 
                assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_reach(i), @_vcc_oset_union_one2(sll_reach(*((i->next))), i))); 
                assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $phys_ptr_cast(L#i, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(j), ==(sll_keys(j), @_vcc_intset_union(sll_keys(*((j->next))), @_vcc_intset_singleton(*((j->key)))))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#j, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(j), ==(sll(j), &&(sll(*((j->next))), unchecked!(@_vcc_oset_in(j, sll_reach(*((j->next)))))))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(j), ==(sll_reach(j), @_vcc_oset_union_one2(sll_reach(*((j->next))), j))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#j, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)), $phys_ptr_cast(L#j, ^s_node));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_keys(h), @_vcc_intset_union(sll_keys(*((h->next))), @_vcc_intset_singleton(*((h->key)))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#h, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll(h), &&(sll(*((h->next))), unchecked!(@_vcc_oset_in(h, sll_reach(*((h->next)))))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#h, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#h, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node))));
                // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_reach(h), @_vcc_oset_union_one2(sll_reach(*((h->next))), h))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#h, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)), $phys_ptr_cast(P#h, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, j)), ==(sll_lseg(h, j), &&(sll_lseg(*((h->next)), j), unchecked!(@_vcc_oset_in(h, sll_lseg_reach(*((h->next)), j)))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#j, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#j, ^s_node)) && !$oset_in($phys_ptr_cast(P#h, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#j, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, j)), ==(sll_lseg_reach(h, j), @_vcc_oset_union_one2(sll_lseg_reach(*((h->next)), j), h))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#j, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#j, ^s_node)), $phys_ptr_cast(P#h, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, j)), ==(sll_lseg_keys(h, j), @_vcc_intset_union(sll_lseg_keys(*((h->next)), j), @_vcc_intset_singleton(*((h->key)))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#j, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#j, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#j, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg(j, i), &&(sll_lseg(*((j->next)), i), unchecked!(@_vcc_oset_in(j, sll_lseg_reach(*((j->next)), i)))))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) && !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg_reach(j, i), @_vcc_oset_union_one2(sll_lseg_reach(*((j->next)), i), j))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $phys_ptr_cast(L#j, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg_keys(j, i), @_vcc_intset_union(sll_lseg_keys(*((j->next)), i), @_vcc_intset_singleton(*((j->key)))))); 
                assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#j, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg(h, i), &&(sll_lseg(*((h->next)), i), unchecked!(@_vcc_oset_in(h, sll_lseg_reach(*((h->next)), i)))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) && !$oset_in($phys_ptr_cast(P#h, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg_reach(h, i), @_vcc_oset_union_one2(sll_lseg_reach(*((h->next)), i), h))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $phys_ptr_cast(P#h, ^s_node));
                // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg_keys(h, i), @_vcc_intset_union(sll_lseg_keys(*((h->next)), i), @_vcc_intset_singleton(*((h->key)))))); 
                assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node))));
                // j := i; 
                L#j := $phys_ptr_cast(L#i, ^s_node);
                // assert sll_lseg(i, i); 
                assert F#sll_lseg($s, $phys_ptr_cast(L#i, ^s_node), $phys_ptr_cast(L#i, ^s_node));
                // assume sll_lseg(i, i); 
                assume F#sll_lseg($s, $phys_ptr_cast(L#i, ^s_node), $phys_ptr_cast(L#i, ^s_node));
                // assert sll_lseg(j, j); 
                assert F#sll_lseg($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#j, ^s_node));
                // assume sll_lseg(j, j); 
                assume F#sll_lseg($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#j, ^s_node));
                // assert sll_lseg(h, h); 
                assert F#sll_lseg($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(P#h, ^s_node));
                // assume sll_lseg(h, h); 
                assume F#sll_lseg($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(P#h, ^s_node));
            }

          anon62:
            // struct s_node* i0#0; 
            // i0#0 := i; 
            i0#0 := $phys_ptr_cast(L#i, ^s_node);
            // struct s_node* stmtexpr0#7; 
            // stmtexpr0#7 := i0#0; 
            stmtexpr0#7 := $phys_ptr_cast(i0#0, ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_keys(i), @_vcc_intset_union(sll_keys(*((i->next))), @_vcc_intset_singleton(*((i->key)))))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#i, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(i), ==(sll(i), &&(sll(*((i->next))), unchecked!(@_vcc_oset_in(i, sll_reach(*((i->next)))))))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_reach(i), @_vcc_oset_union_one2(sll_reach(*((i->next))), i))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $phys_ptr_cast(L#i, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(i), @_vcc_ptr_neq_pure(i, *((i->next)))), ==(sll_lseg(i, *((i->next))), &&(sll_lseg(*((i->next)), *((i->next))), unchecked!(@_vcc_oset_in(i, sll_lseg_reach(*((i->next)), *((i->next)))))))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) && $phys_ptr_cast(L#i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#i, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(i), @_vcc_ptr_neq_pure(i, *((i->next)))), ==(sll_lseg_reach(i, *((i->next))), @_vcc_oset_union_one2(sll_lseg_reach(*((i->next)), *((i->next))), i))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) && $phys_ptr_cast(L#i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $phys_ptr_cast(L#i, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(i), @_vcc_ptr_neq_pure(i, *((i->next)))), ==(sll_lseg_keys(i, *((i->next))), @_vcc_intset_union(sll_lseg_keys(*((i->next)), *((i->next))), @_vcc_intset_singleton(*((i->key)))))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) && $phys_ptr_cast(L#i, ^s_node) != $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#i, ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node), $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#i, ^s_node))));
            // assert @reads_check_normal((i->next)); 
            assert $thread_local($s, $phys_ptr_cast(L#i, ^s_node));
            // i := *((i->next)); 
            L#i := $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node);
            // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_keys(i), @_vcc_intset_union(sll_keys(*((i->next))), @_vcc_intset_singleton(*((i->key)))))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#i, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(i), ==(sll(i), &&(sll(*((i->next))), unchecked!(@_vcc_oset_in(i, sll_reach(*((i->next)))))))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_reach(i), @_vcc_oset_union_one2(sll_reach(*((i->next))), i))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $phys_ptr_cast(L#i, ^s_node));
            // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_keys(i), @_vcc_intset_union(sll_keys(*((i->next))), @_vcc_intset_singleton(*((i->key)))))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#i, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(i), ==(sll(i), &&(sll(*((i->next))), unchecked!(@_vcc_oset_in(i, sll_reach(*((i->next)))))))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_reach(i), @_vcc_oset_union_one2(sll_reach(*((i->next))), i))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $phys_ptr_cast(L#i, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg(j, i), &&(sll_lseg(*((j->next)), i), unchecked!(@_vcc_oset_in(j, sll_lseg_reach(*((j->next)), i)))))); 
            assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) && !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg_reach(j, i), @_vcc_oset_union_one2(sll_lseg_reach(*((j->next)), i), j))); 
            assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $phys_ptr_cast(L#j, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(j), @_vcc_ptr_neq_pure(j, i)), ==(sll_lseg_keys(j, i), @_vcc_intset_union(sll_lseg_keys(*((j->next)), i), @_vcc_intset_singleton(*((j->key)))))); 
            assume $non_null($phys_ptr_cast(L#j, ^s_node)) && $phys_ptr_cast(L#j, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(L#j, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#j, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg(h, i), &&(sll_lseg(*((h->next)), i), unchecked!(@_vcc_oset_in(h, sll_lseg_reach(*((h->next)), i)))))); 
            assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == (F#sll_lseg($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)) && !$oset_in($phys_ptr_cast(P#h, ^s_node), F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node))));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg_reach(h, i), @_vcc_oset_union_one2(sll_lseg_reach(*((h->next)), i), h))); 
            assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_reach($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_lseg_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $phys_ptr_cast(P#h, ^s_node));
            // assume ==>(&&(@_vcc_ptr_neq_null(h), @_vcc_ptr_neq_pure(h, i)), ==(sll_lseg_keys(h, i), @_vcc_intset_union(sll_lseg_keys(*((h->next)), i), @_vcc_intset_singleton(*((h->key)))))); 
            assume $non_null($phys_ptr_cast(P#h, ^s_node)) && $phys_ptr_cast(P#h, ^s_node) != $phys_ptr_cast(L#i, ^s_node) ==> F#sll_lseg_keys($s, $phys_ptr_cast(P#h, ^s_node), $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_lseg_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node), $phys_ptr_cast(L#i, ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node))));
            // assume ==>(@_vcc_ptr_neq_null(i), &&(@_vcc_mutable(@state, i), @writes_check(i))); 
            assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> $mutable($s, $phys_ptr_cast(L#i, ^s_node)) && $top_writable($s, #wrTime$3^7.3, $phys_ptr_cast(L#i, ^s_node));
        }
        else
        {
          anon63:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // goto #break_2; 
            goto #break_2;
        }

      #continue_2:
        assume true;

p0000 := (F#sll($s,$phys_ptr_cast(P#h,^s_node)));
p0001 := (F#sll($s,$phys_ptr_cast(L#i,^s_node)));
p0002 := (F#sll($s,$phys_ptr_cast(L#j,^s_node)));
p0003 := (F#sll_lseg($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#i,^s_node)));
p0004 := (F#sll_lseg($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#j,^s_node)));
p0005 := (F#sll_lseg($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(P#h,^s_node)));
p0006 := (F#sll_lseg($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(L#j,^s_node)));
p0007 := (F#sll_lseg($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(P#h,^s_node)));
p0008 := (F#sll_lseg($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(L#i,^s_node)));
p0009 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node))));
p0010 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node))));
p0011 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node))));
p0012 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node))));
p0013 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node))));
p0014 := ($oset_disjoint(F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node))));
p0015 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node))));
p0016 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node))));
p0017 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node))));
p0018 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node))));
p0019 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node))));
p0020 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node))));
p0021 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node))));
p0022 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node))));
p0023 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node))));
p0024 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node))));
p0025 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node))));
p0026 := ($oset_disjoint(F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node))));
p0027 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)))));
p0028 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#h,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)))));
p0029 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)))));
p0030 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#i,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#j,^s_node)))));
p0031 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(P#h,^s_node)))));
p0032 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#j,^s_node)),F#sll_reach($s,$phys_ptr_cast(L#i,^s_node)))));
p0033 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#h,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(L#j,^s_node)))));
p0034 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#h,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(L#i,^s_node)))));
p0035 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#i,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#j,^s_node)))));
p0036 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#i,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#j,^s_node),$phys_ptr_cast(P#h,^s_node)))));
p0037 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#j,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(P#h,^s_node),$phys_ptr_cast(L#i,^s_node)))));
p0038 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#j,^s_node)),F#sll_lseg_reach($s,$phys_ptr_cast(L#i,^s_node),$phys_ptr_cast(P#h,^s_node)))));
p0039 := ($non_null($phys_ptr_cast(P#h,^s_node)));
p0040 := ($non_null($phys_ptr_cast(L#i,^s_node)));
p0041 := ($non_null($phys_ptr_cast(L#j,^s_node)));
p0042 := ($is_null($phys_ptr_cast(P#h,^s_node)));
p0043 := ($is_null($phys_ptr_cast(L#i,^s_node)));
p0044 := ($is_null($phys_ptr_cast(L#j,^s_node)));
p0045 := (($phys_ptr_cast(P#h,^s_node) == $phys_ptr_cast(L#i,^s_node)));
p0046 := (($phys_ptr_cast(P#h,^s_node) == $phys_ptr_cast(L#j,^s_node)));
p0047 := (($phys_ptr_cast(L#i,^s_node) == $phys_ptr_cast(P#h,^s_node)));
p0048 := (($phys_ptr_cast(L#i,^s_node) == $phys_ptr_cast(L#j,^s_node)));
p0049 := (($phys_ptr_cast(L#j,^s_node) == $phys_ptr_cast(P#h,^s_node)));
p0050 := (($phys_ptr_cast(L#j,^s_node) == $phys_ptr_cast(L#i,^s_node)));
p0051 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#h,^s_node),^s_node))));
p0052 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#i,^s_node),^s_node))));
p0053 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $non_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#j,^s_node),^s_node))));
p0054 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#h,^s_node),^s_node))));
p0055 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#i,^s_node),^s_node))));
p0056 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> $is_null($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#j,^s_node),^s_node))));
p0057 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#h,^s_node),^s_node) == $phys_ptr_cast(L#i,^s_node))));
p0058 := (($non_null($phys_ptr_cast(P#h,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(P#h,^s_node),^s_node) == $phys_ptr_cast(L#j,^s_node))));
p0059 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#i,^s_node),^s_node) == $phys_ptr_cast(P#h,^s_node))));
p0060 := (($non_null($phys_ptr_cast(L#i,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#i,^s_node),^s_node) == $phys_ptr_cast(L#j,^s_node))));
p0061 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#j,^s_node),^s_node) == $phys_ptr_cast(P#h,^s_node))));
p0062 := (($non_null($phys_ptr_cast(L#j,^s_node)) ==> ($rd_phys_ptr($s,s_node.next,$phys_ptr_cast(L#j,^s_node),^s_node) == $phys_ptr_cast(L#i,^s_node))));


    }

  anon66:
    assume $full_stop_ext(#tok$3^17.3, $s);

  #break_2:
    // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_keys(i), @_vcc_intset_union(sll_keys(*((i->next))), @_vcc_intset_singleton(*((i->key)))))); 
    assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#i, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#i, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(i), ==(sll(i), &&(sll(*((i->next))), unchecked!(@_vcc_oset_in(i, sll_reach(*((i->next)))))))); 
    assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#i, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#i, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(i), ==(sll_reach(i), @_vcc_oset_union_one2(sll_reach(*((i->next))), i))); 
    assume $non_null($phys_ptr_cast(L#i, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#i, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#i, ^s_node), ^s_node)), $phys_ptr_cast(L#i, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(j), ==(sll_keys(j), @_vcc_intset_union(sll_keys(*((j->next))), @_vcc_intset_singleton(*((j->key)))))); 
    assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(L#j, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(L#j, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(j), ==(sll(j), &&(sll(*((j->next))), unchecked!(@_vcc_oset_in(j, sll_reach(*((j->next)))))))); 
    assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll($s, $phys_ptr_cast(L#j, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(L#j, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(j), ==(sll_reach(j), @_vcc_oset_union_one2(sll_reach(*((j->next))), j))); 
    assume $non_null($phys_ptr_cast(L#j, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(L#j, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(L#j, ^s_node), ^s_node)), $phys_ptr_cast(L#j, ^s_node));
    // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_keys(h), @_vcc_intset_union(sll_keys(*((h->next))), @_vcc_intset_singleton(*((h->key)))))); 
    assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll_keys($s, $phys_ptr_cast(P#h, ^s_node)) == $intset_union(F#sll_keys($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)), $intset_singleton($rd_inv($s, s_node.key, $phys_ptr_cast(P#h, ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(h), ==(sll(h), &&(sll(*((h->next))), unchecked!(@_vcc_oset_in(h, sll_reach(*((h->next)))))))); 
    assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll($s, $phys_ptr_cast(P#h, ^s_node)) == (F#sll($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)) && !$oset_in($phys_ptr_cast(P#h, ^s_node), F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node))));
    // assume ==>(@_vcc_ptr_neq_null(h), ==(sll_reach(h), @_vcc_oset_union_one2(sll_reach(*((h->next))), h))); 
    assume $non_null($phys_ptr_cast(P#h, ^s_node)) ==> F#sll_reach($s, $phys_ptr_cast(P#h, ^s_node)) == $oset_union_one2(F#sll_reach($s, $rd_phys_ptr($s, s_node.next, $phys_ptr_cast(P#h, ^s_node), ^s_node)), $phys_ptr_cast(P#h, ^s_node));
    // return j; 
    $result := $phys_ptr_cast(L#j, ^s_node);
    assume true;
    assert $position_marker();
    goto #exit;

  anon67:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$3^33.7: $token;

const unique #tok$3^31.9: $token;

const unique #tok$3^17.3: $token;

const unique #tok$4^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(4, #file^?3Cno?20file?3E);

const unique #tok$3^7.3: $token;

const unique #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad_Bin?5CTests?5Cafwp?5CSLL?2Dfilter.c: $token;

axiom $file_name_is(3, #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad_Bin?5CTests?5Cafwp?5CSLL?2Dfilter.c);

const unique #file^c?3A?5Cusers?5Cdaniel?5Cworkspace?5Cvcdryad_bin?5Ctests?5Cafwp?5Cdryad_SLL.h: $token;

axiom $file_name_is(2, #file^c?3A?5Cusers?5Cdaniel?5Cworkspace?5Cvcdryad_bin?5Ctests?5Cafwp?5Cdryad_SLL.h);

const unique #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad?5Cvcc?5CHost?5Cbin?5CHeaders?5Cvccp.h: $token;

axiom $file_name_is(1, #file^c?3A?5CUsers?5CDaniel?5CWorkspace?5CVCDryad?5Cvcc?5CHost?5Cbin?5CHeaders?5Cvccp.h);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^s_node);

