
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

axiom $arch_ptr_size == 8;

axiom $arch_spec_ptr_start == $max.u8;

const unique ^$##thread_id: $ctype;

axiom $def_math_type(^$##thread_id);

type $##thread_id;

const unique ^$##club: $ctype;

axiom $def_math_type(^$##club);

type $##club;

const unique ^backing_file: $ctype;

axiom $is_span_sequential(^backing_file);

axiom $def_struct_type(^backing_file, 4, false, false);

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2(#s1, #s2, #p, ^backing_file) } $inv2(#s1, #s2, #p, ^backing_file) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2_without_lemmas(#s1, #s2, #p, ^backing_file) } $inv2_without_lemmas(#s1, #s2, #p, ^backing_file) == $set_eq($owns(#s2, #p), $set_empty()));

axiom (forall p: $ptr, q: $ptr, s: $state :: { $in(q, $composite_extent(s, p, ^backing_file)) } $in(q, $composite_extent(s, p, ^backing_file)) == (q == p));

const unique backing_file.file_id: $field;

axiom $def_phys_field(^backing_file, backing_file.file_id, ^^i4, false, 0);

const unique ^mem_reg: $ctype;

axiom $is_span_sequential(^mem_reg);

axiom $def_struct_type(^mem_reg, 40, false, false);

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2(#s1, #s2, #p, ^mem_reg) } $inv2(#s1, #s2, #p, ^mem_reg) == ($set_eq($owns(#s2, #p), $set_empty()) && $rd_inv(#s2, mem_reg.file_size, #p) <= $rd_inv(#s2, mem_reg.size, #p)));

axiom (forall #s1: $state, #s2: $state, #p: $ptr :: { $inv2_without_lemmas(#s1, #s2, #p, ^mem_reg) } $inv2_without_lemmas(#s1, #s2, #p, ^mem_reg) == ($set_eq($owns(#s2, #p), $set_empty()) && $rd_inv(#s2, mem_reg.file_size, #p) <= $rd_inv(#s2, mem_reg.size, #p)));

axiom (forall p: $ptr, q: $ptr, s: $state :: { $in(q, $composite_extent(s, p, ^mem_reg)) } $in(q, $composite_extent(s, p, ^mem_reg)) == (q == p));

const unique mem_reg.file: $field;

axiom $def_phys_field(^mem_reg, mem_reg.file, $ptr_to(^backing_file), false, 0);

const unique mem_reg.file_offset: $field;

axiom $def_phys_field(^mem_reg, mem_reg.file_offset, ^^i4, false, 8);

const unique mem_reg.file_size: $field;

axiom $def_phys_field(^mem_reg, mem_reg.file_size, ^^i4, false, 12);

const unique mem_reg.start_address: $field;

axiom $def_phys_field(^mem_reg, mem_reg.start_address, ^^i4, false, 16);

const unique mem_reg.size: $field;

axiom $def_phys_field(^mem_reg, mem_reg.size, ^^i4, false, 20);

const unique mem_reg.prev: $field;

axiom $def_phys_field(^mem_reg, mem_reg.prev, $ptr_to(^mem_reg), false, 24);

const unique mem_reg.next: $field;

axiom $def_phys_field(^mem_reg, mem_reg.next, $ptr_to(^mem_reg), false, 32);

procedure mem_reg#adm(P#_this_: $ptr);
  modifies $s, $cev_pc;
  ensures $is_admissibility_check() ==> $set_eq($owns($s, $phys_ptr_cast(P#_this_, ^mem_reg)), $set_empty());
  ensures $is_admissibility_check() ==> $rd_inv($s, mem_reg.file_size, $phys_ptr_cast(P#_this_, ^mem_reg)) <= $rd_inv($s, mem_reg.size, $phys_ptr_cast(P#_this_, ^mem_reg));
  ensures $is_unwrap_check() ==> $set_eq($owns($s, $phys_ptr_cast(P#_this_, ^mem_reg)), $set_empty());
  ensures $is_unwrap_check() ==> $rd_inv($s, mem_reg.file_size, $phys_ptr_cast(P#_this_, ^mem_reg)) <= $rd_inv($s, mem_reg.size, $phys_ptr_cast(P#_this_, ^mem_reg));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation mem_reg#adm(P#_this_: $ptr)
{
  var #wrTime$1^15.1: int;
  var #stackframe: int;

  anon6:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$1^15.1, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$1^15.1 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$1^15.1, (lambda #p: $ptr :: false));
    // assume @decreases_level_is(0); 
    assume 0 == $decreases_level;
    // assume @_vcc_admissibility_start(_this_); 
    assume $admissibility_start($phys_ptr_cast(P#_this_, ^mem_reg), ^mem_reg);
    assume true;
    // if (@_vcc_is_unwrap_check) ...
    if ($is_unwrap_check())
    {
      anon1:
        // assume !(@_vcc_is_stuttering_check); 
        assume !$is_stuttering_check();
        // assume @_vcc_unwrap_check_pre(@state, _this_); 
        assume $unwrap_check_pre($s, $phys_ptr_cast(P#_this_, ^mem_reg));
        // @_vcc_unwrap_check(_this_)
        call $unwrap_check($phys_ptr_cast(P#_this_, ^mem_reg));
        assume $good_state_ext(#tok$1^15.1, $s);
        // assert true
    }
    else
    {
      anon4:
        assume true;
        // if (@_vcc_is_admissibility_check) ...
        if ($is_admissibility_check())
        {
          anon2:
            // assume @_vcc_admissibility_pre(@state, _this_); 
            assume $admissibility_pre($s, $phys_ptr_cast(P#_this_, ^mem_reg));
        }
        else
        {
          anon3:
            // assume @_vcc_stuttering_pre(@state, _this_); 
            assume $stuttering_pre($s, $phys_ptr_cast(P#_this_, ^mem_reg));
        }

      anon5:
        // @_vcc_havoc_others(_this_, @_vcc_typeof((struct mem_reg*)@null))
        call $havoc_others($phys_ptr_cast(P#_this_, ^mem_reg), ^mem_reg);
        assume $good_state_ext(#tok$1^15.1, $s);
        // assert true
        // assume ==>(@_vcc_is_stuttering_check, @_vcc_inv2(old(@prestate, @state), @state, _this_)); 
        assume $is_stuttering_check() ==> $inv2(old($s), $s, $phys_ptr_cast(P#_this_, ^mem_reg), ^mem_reg);
    }

  #exit:
}



const unique ^$#_purecall_handler#1: $ctype;

axiom $def_fnptr_type(^$#_purecall_handler#1);

type $#_purecall_handler#1;

const unique ^$#_invalid_parameter_handler#2: $ctype;

axiom $def_fnptr_type(^$#_invalid_parameter_handler#2);

type $#_invalid_parameter_handler#2;

const unique ^$#memory_region_insert.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#memory_region_insert.c..36263#3);

type $#memory_region_insert.c..36263#3;

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

axiom (forall #s: $state, SP#hd: $ptr :: { F#dll(#s, SP#hd) } 1 < $decreases_level ==> $is_null($phys_ptr_cast(SP#hd, ^mem_reg)) ==> F#dll(#s, SP#hd));

axiom $function_arg_type(cf#dll, 0, ^^bool);

axiom $function_arg_type(cf#dll, 1, $ptr_to(^mem_reg));

procedure dll(SP#hd: $ptr) returns ($result: bool);
  ensures $is_null($phys_ptr_cast(SP#hd, ^mem_reg)) ==> $result;
  free ensures $result == F#dll($s, SP#hd);
  free ensures $call_transition(old($s), $s);



function F#dll_reach(#s: $state, SP#hd: $ptr) : $oset;

const unique cf#dll_reach: $pure_function;

axiom (forall #s: $state, SP#hd: $ptr :: { F#dll_reach(#s, SP#hd) } 1 < $decreases_level ==> ($non_null($phys_ptr_cast(SP#hd, ^mem_reg)) ==> $oset_in($phys_ptr_cast(SP#hd, ^mem_reg), F#dll_reach(#s, SP#hd))) && ($is_null($phys_ptr_cast(SP#hd, ^mem_reg)) ==> F#dll_reach(#s, SP#hd) == $oset_empty()));

axiom $function_arg_type(cf#dll_reach, 0, ^$#oset);

axiom $function_arg_type(cf#dll_reach, 1, $ptr_to(^mem_reg));

procedure dll_reach(SP#hd: $ptr) returns ($result: $oset);
  ensures ($non_null($phys_ptr_cast(SP#hd, ^mem_reg)) ==> $oset_in($phys_ptr_cast(SP#hd, ^mem_reg), $result)) && ($is_null($phys_ptr_cast(SP#hd, ^mem_reg)) ==> $result == $oset_empty());
  free ensures $result == F#dll_reach($s, SP#hd);
  free ensures $call_transition(old($s), $s);



procedure memory_region_insert_before(P#x: $ptr, P#y: $ptr) returns ($result: $ptr);
  requires F#dll($s, $phys_ptr_cast(P#x, ^mem_reg));
  requires F#dll($s, $phys_ptr_cast(P#y, ^mem_reg));
  modifies $s, $cev_pc;
  ensures F#dll($s, $phys_ptr_cast($result, ^mem_reg));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



procedure memory_region_insert(P#head: $ptr, P#node: $ptr) returns ($result: $ptr);
  requires F#dll($s, $phys_ptr_cast(P#head, ^mem_reg));
  requires F#dll($s, $phys_ptr_cast(P#node, ^mem_reg));
  modifies $s, $cev_pc;
  ensures F#dll($s, $phys_ptr_cast($result, ^mem_reg));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation memory_region_insert(P#head: $ptr, P#node: $ptr) returns ($result: $ptr)
{
  var res_memory_region_insert_before#4: $ptr;
  var stmtexpr0#5: $ptr;
  var SL#curr0: $ptr;
  var loopState#0: $state;
  var L#curr: $ptr;
  var stmtexpr1#7: $oset;
  var stmtexpr0#6: $oset;
  var res_dll_reach#3: $oset;
  var res_dll_reach#2: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$2^11.3: int;
  var #stackframe: int;

// INV:PTR: P#head; P#node; L#curr
// INV:INT:
// INV:LST: dll
// INV:OLD: loopState#0

  anon12:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$2^11.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$2^11.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$2^11.3, (lambda #p: $ptr :: false));
    // assume true
    // assume true
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    // assume ==(-2147483648, unchecked-(unchecked-(0, 2147483647), 1)); 
    assume -2147483648 == $unchk_sub(^^i4, $unchk_sub(^^i4, 0, 2147483647), 1);
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _math \oset res_dll_reach#2; 
    // res_dll_reach#2 := dll_reach(head); 
    call res_dll_reach#2 := dll_reach($phys_ptr_cast(P#head, ^mem_reg));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _math \oset res_dll_reach#3; 
    // res_dll_reach#3 := dll_reach(node); 
    call res_dll_reach#3 := dll_reach($phys_ptr_cast(P#node, ^mem_reg));
    assume $full_stop_ext(#tok$3^0.0, $s);
    // _dryad_G0 := @_vcc_oset_union(res_dll_reach#2, res_dll_reach#3); 
    SL#_dryad_G0 := $oset_union(res_dll_reach#2, res_dll_reach#3);
    // _math \oset stmtexpr0#6; 
    // stmtexpr0#6 := _dryad_G0; 
    stmtexpr0#6 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#7; 
    // stmtexpr1#7 := _dryad_G1; 
    stmtexpr1#7 := SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(node), ==(dll(node), &&(&&(dll(*((node->next))), ==>(@_vcc_ptr_neq_null(*((node->next))), @_vcc_ptr_eq_pure(*((*((node->next))->prev)), node))), unchecked!(@_vcc_oset_in(node, dll_reach(*((node->next)))))))); 
    assume $non_null($phys_ptr_cast(P#node, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(P#node, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(P#node, ^mem_reg)) && !$oset_in($phys_ptr_cast(P#node, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(node), ==(dll_reach(node), @_vcc_oset_union(dll_reach(*((node->next))), @_vcc_oset_singleton(node)))); 
    assume $non_null($phys_ptr_cast(P#node, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(P#node, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(P#node, ^mem_reg)));
    // assume ==>(@_vcc_ptr_neq_null(head), ==(dll(head), &&(&&(dll(*((head->next))), ==>(@_vcc_ptr_neq_null(*((head->next))), @_vcc_ptr_eq_pure(*((*((head->next))->prev)), head))), unchecked!(@_vcc_oset_in(head, dll_reach(*((head->next)))))))); 
    assume $non_null($phys_ptr_cast(P#head, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(P#head, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(P#head, ^mem_reg)) && !$oset_in($phys_ptr_cast(P#head, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(head), ==(dll_reach(head), @_vcc_oset_union(dll_reach(*((head->next))), @_vcc_oset_singleton(head)))); 
    assume $non_null($phys_ptr_cast(P#head, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(P#head, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(P#head, ^mem_reg)));
    // struct mem_reg* curr; 
    // assume ==>(@_vcc_ptr_neq_null(head), &&(@_vcc_mutable(@state, head), @writes_check(head))); 
    assume $non_null($phys_ptr_cast(P#head, ^mem_reg)) ==> $mutable($s, $phys_ptr_cast(P#head, ^mem_reg)) && $top_writable($s, #wrTime$2^11.3, $phys_ptr_cast(P#head, ^mem_reg));
    // curr := head; 
    L#curr := $phys_ptr_cast(P#head, ^mem_reg);
    loopState#0 := $s;
    assume true;
// INV:LOOPHEAD
    while (true)
invariant b0000 ==> (F#dll($s,$phys_ptr_cast(P#head,^mem_reg)));
invariant b0001 ==> (F#dll($s,$phys_ptr_cast(P#node,^mem_reg)));
invariant b0002 ==> (F#dll($s,$phys_ptr_cast(L#curr,^mem_reg)));
invariant b0003 ==> (((F#dll($s,$phys_ptr_cast(P#head,^mem_reg)) && F#dll($s,$phys_ptr_cast(P#node,^mem_reg))) ==> $oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#head,^mem_reg)),F#dll_reach($s,$phys_ptr_cast(P#node,^mem_reg)))));
invariant b0004 ==> (((F#dll($s,$phys_ptr_cast(P#head,^mem_reg)) && F#dll($s,$phys_ptr_cast(L#curr,^mem_reg))) ==> $oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#head,^mem_reg)),F#dll_reach($s,$phys_ptr_cast(L#curr,^mem_reg)))));
invariant b0005 ==> (((F#dll($s,$phys_ptr_cast(P#node,^mem_reg)) && F#dll($s,$phys_ptr_cast(P#head,^mem_reg))) ==> $oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#node,^mem_reg)),F#dll_reach($s,$phys_ptr_cast(P#head,^mem_reg)))));
invariant b0006 ==> (((F#dll($s,$phys_ptr_cast(P#node,^mem_reg)) && F#dll($s,$phys_ptr_cast(L#curr,^mem_reg))) ==> $oset_disjoint(F#dll_reach($s,$phys_ptr_cast(P#node,^mem_reg)),F#dll_reach($s,$phys_ptr_cast(L#curr,^mem_reg)))));
invariant b0007 ==> (((F#dll($s,$phys_ptr_cast(L#curr,^mem_reg)) && F#dll($s,$phys_ptr_cast(P#head,^mem_reg))) ==> $oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#curr,^mem_reg)),F#dll_reach($s,$phys_ptr_cast(P#head,^mem_reg)))));
invariant b0008 ==> (((F#dll($s,$phys_ptr_cast(L#curr,^mem_reg)) && F#dll($s,$phys_ptr_cast(P#node,^mem_reg))) ==> $oset_disjoint(F#dll_reach($s,$phys_ptr_cast(L#curr,^mem_reg)),F#dll_reach($s,$phys_ptr_cast(P#node,^mem_reg)))));
invariant b0009 ==> ((F#dll($s,$phys_ptr_cast(P#node,^mem_reg)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#head,^mem_reg)),F#dll_reach($s,$phys_ptr_cast(P#node,^mem_reg)))));
invariant b0010 ==> ((F#dll($s,$phys_ptr_cast(L#curr,^mem_reg)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#head,^mem_reg)),F#dll_reach($s,$phys_ptr_cast(L#curr,^mem_reg)))));
invariant b0011 ==> ((F#dll($s,$phys_ptr_cast(P#head,^mem_reg)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#node,^mem_reg)),F#dll_reach($s,$phys_ptr_cast(P#head,^mem_reg)))));
invariant b0012 ==> ((F#dll($s,$phys_ptr_cast(L#curr,^mem_reg)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(P#node,^mem_reg)),F#dll_reach($s,$phys_ptr_cast(L#curr,^mem_reg)))));
invariant b0013 ==> ((F#dll($s,$phys_ptr_cast(P#head,^mem_reg)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^mem_reg)),F#dll_reach($s,$phys_ptr_cast(P#head,^mem_reg)))));
invariant b0014 ==> ((F#dll($s,$phys_ptr_cast(P#node,^mem_reg)) ==> $oset_disjoint($oset_singleton($phys_ptr_cast(L#curr,^mem_reg)),F#dll_reach($s,$phys_ptr_cast(P#node,^mem_reg)))));
invariant b0015 ==> ($non_null($phys_ptr_cast(P#head,^mem_reg)));
invariant b0016 ==> ($non_null($phys_ptr_cast(P#node,^mem_reg)));
invariant b0017 ==> ($non_null($phys_ptr_cast(L#curr,^mem_reg)));
invariant b0018 ==> ($is_null($phys_ptr_cast(P#head,^mem_reg)));
invariant b0019 ==> ($is_null($phys_ptr_cast(P#node,^mem_reg)));
invariant b0020 ==> ($is_null($phys_ptr_cast(L#curr,^mem_reg)));
invariant b0021 ==> (($phys_ptr_cast(P#head,^mem_reg) == $phys_ptr_cast(P#node,^mem_reg)));
invariant b0022 ==> (($phys_ptr_cast(P#head,^mem_reg) == $phys_ptr_cast(L#curr,^mem_reg)));
invariant b0023 ==> (($phys_ptr_cast(P#node,^mem_reg) == $phys_ptr_cast(P#head,^mem_reg)));
invariant b0024 ==> (($phys_ptr_cast(P#node,^mem_reg) == $phys_ptr_cast(L#curr,^mem_reg)));
invariant b0025 ==> (($phys_ptr_cast(L#curr,^mem_reg) == $phys_ptr_cast(P#head,^mem_reg)));
invariant b0026 ==> (($phys_ptr_cast(L#curr,^mem_reg) == $phys_ptr_cast(P#node,^mem_reg)));
invariant b0027 ==> (($non_null($phys_ptr_cast(P#head,^mem_reg)) ==> $non_null($rd_phys_ptr($s,mem_reg.next,$phys_ptr_cast(P#head,^mem_reg),^mem_reg))));
invariant b0028 ==> (($non_null($phys_ptr_cast(P#node,^mem_reg)) ==> $non_null($rd_phys_ptr($s,mem_reg.next,$phys_ptr_cast(P#node,^mem_reg),^mem_reg))));
invariant b0029 ==> (($non_null($phys_ptr_cast(L#curr,^mem_reg)) ==> $non_null($rd_phys_ptr($s,mem_reg.next,$phys_ptr_cast(L#curr,^mem_reg),^mem_reg))));
invariant b0030 ==> (($non_null($phys_ptr_cast(P#head,^mem_reg)) ==> $is_null($rd_phys_ptr($s,mem_reg.next,$phys_ptr_cast(P#head,^mem_reg),^mem_reg))));
invariant b0031 ==> (($non_null($phys_ptr_cast(P#node,^mem_reg)) ==> $is_null($rd_phys_ptr($s,mem_reg.next,$phys_ptr_cast(P#node,^mem_reg),^mem_reg))));
invariant b0032 ==> (($non_null($phys_ptr_cast(L#curr,^mem_reg)) ==> $is_null($rd_phys_ptr($s,mem_reg.next,$phys_ptr_cast(L#curr,^mem_reg),^mem_reg))));
invariant b0033 ==> (($non_null($phys_ptr_cast(P#head,^mem_reg)) ==> ($rd_phys_ptr($s,mem_reg.next,$phys_ptr_cast(P#head,^mem_reg),^mem_reg) == $phys_ptr_cast(P#node,^mem_reg))));
invariant b0034 ==> (($non_null($phys_ptr_cast(P#head,^mem_reg)) ==> ($rd_phys_ptr($s,mem_reg.next,$phys_ptr_cast(P#head,^mem_reg),^mem_reg) == $phys_ptr_cast(L#curr,^mem_reg))));
invariant b0035 ==> (($non_null($phys_ptr_cast(P#node,^mem_reg)) ==> ($rd_phys_ptr($s,mem_reg.next,$phys_ptr_cast(P#node,^mem_reg),^mem_reg) == $phys_ptr_cast(P#head,^mem_reg))));
invariant b0036 ==> (($non_null($phys_ptr_cast(P#node,^mem_reg)) ==> ($rd_phys_ptr($s,mem_reg.next,$phys_ptr_cast(P#node,^mem_reg),^mem_reg) == $phys_ptr_cast(L#curr,^mem_reg))));
invariant b0037 ==> (($non_null($phys_ptr_cast(L#curr,^mem_reg)) ==> ($rd_phys_ptr($s,mem_reg.next,$phys_ptr_cast(L#curr,^mem_reg),^mem_reg) == $phys_ptr_cast(P#head,^mem_reg))));
invariant b0038 ==> (($non_null($phys_ptr_cast(L#curr,^mem_reg)) ==> ($rd_phys_ptr($s,mem_reg.next,$phys_ptr_cast(L#curr,^mem_reg),^mem_reg) == $phys_ptr_cast(P#node,^mem_reg))));
invariant b0039 ==> (($non_null($phys_ptr_cast(P#head,^mem_reg)) ==> $non_null($rd_phys_ptr($s,mem_reg.prev,$phys_ptr_cast(P#head,^mem_reg),^mem_reg))));
invariant b0040 ==> (($non_null($phys_ptr_cast(P#node,^mem_reg)) ==> $non_null($rd_phys_ptr($s,mem_reg.prev,$phys_ptr_cast(P#node,^mem_reg),^mem_reg))));
invariant b0041 ==> (($non_null($phys_ptr_cast(L#curr,^mem_reg)) ==> $non_null($rd_phys_ptr($s,mem_reg.prev,$phys_ptr_cast(L#curr,^mem_reg),^mem_reg))));
invariant b0042 ==> (($non_null($phys_ptr_cast(P#head,^mem_reg)) ==> $is_null($rd_phys_ptr($s,mem_reg.prev,$phys_ptr_cast(P#head,^mem_reg),^mem_reg))));
invariant b0043 ==> (($non_null($phys_ptr_cast(P#node,^mem_reg)) ==> $is_null($rd_phys_ptr($s,mem_reg.prev,$phys_ptr_cast(P#node,^mem_reg),^mem_reg))));
invariant b0044 ==> (($non_null($phys_ptr_cast(L#curr,^mem_reg)) ==> $is_null($rd_phys_ptr($s,mem_reg.prev,$phys_ptr_cast(L#curr,^mem_reg),^mem_reg))));
invariant b0045 ==> (($non_null($phys_ptr_cast(P#head,^mem_reg)) ==> ($rd_phys_ptr($s,mem_reg.prev,$phys_ptr_cast(P#head,^mem_reg),^mem_reg) == $phys_ptr_cast(P#node,^mem_reg))));
invariant b0046 ==> (($non_null($phys_ptr_cast(P#head,^mem_reg)) ==> ($rd_phys_ptr($s,mem_reg.prev,$phys_ptr_cast(P#head,^mem_reg),^mem_reg) == $phys_ptr_cast(L#curr,^mem_reg))));
invariant b0047 ==> (($non_null($phys_ptr_cast(P#node,^mem_reg)) ==> ($rd_phys_ptr($s,mem_reg.prev,$phys_ptr_cast(P#node,^mem_reg),^mem_reg) == $phys_ptr_cast(P#head,^mem_reg))));
invariant b0048 ==> (($non_null($phys_ptr_cast(P#node,^mem_reg)) ==> ($rd_phys_ptr($s,mem_reg.prev,$phys_ptr_cast(P#node,^mem_reg),^mem_reg) == $phys_ptr_cast(L#curr,^mem_reg))));
invariant b0049 ==> (($non_null($phys_ptr_cast(L#curr,^mem_reg)) ==> ($rd_phys_ptr($s,mem_reg.prev,$phys_ptr_cast(L#curr,^mem_reg),^mem_reg) == $phys_ptr_cast(P#head,^mem_reg))));
invariant b0050 ==> (($non_null($phys_ptr_cast(L#curr,^mem_reg)) ==> ($rd_phys_ptr($s,mem_reg.prev,$phys_ptr_cast(L#curr,^mem_reg),^mem_reg) == $phys_ptr_cast(P#node,^mem_reg))));

    {
      anon11:
        assume $writes_nothing(old($s), $s);
        assume $timestamp_post(loopState#0, $s);
        assume $full_stop_ext(#tok$2^19.3, $s);
        // assume @_vcc_meta_eq(old(@prestate, @state), @state); 
        assume $meta_eq(loopState#0, $s);
        assume true;
        // if (@_vcc_ptr_neq_null(curr)) ...
        if ($non_null($phys_ptr_cast(L#curr, ^mem_reg)))
        {
          anon9:
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
            assume $non_null($phys_ptr_cast(L#curr, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#curr, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#curr, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg))));
            // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
            assume $non_null($phys_ptr_cast(L#curr, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#curr, ^mem_reg)));
            // assume ==>(@_vcc_ptr_neq_null(node), ==(dll(node), &&(&&(dll(*((node->next))), ==>(@_vcc_ptr_neq_null(*((node->next))), @_vcc_ptr_eq_pure(*((*((node->next))->prev)), node))), unchecked!(@_vcc_oset_in(node, dll_reach(*((node->next)))))))); 
            assume $non_null($phys_ptr_cast(P#node, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(P#node, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(P#node, ^mem_reg)) && !$oset_in($phys_ptr_cast(P#node, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg))));
            // assume ==>(@_vcc_ptr_neq_null(node), ==(dll_reach(node), @_vcc_oset_union(dll_reach(*((node->next))), @_vcc_oset_singleton(node)))); 
            assume $non_null($phys_ptr_cast(P#node, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(P#node, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(P#node, ^mem_reg)));
            // assume ==>(@_vcc_ptr_neq_null(head), ==(dll(head), &&(&&(dll(*((head->next))), ==>(@_vcc_ptr_neq_null(*((head->next))), @_vcc_ptr_eq_pure(*((*((head->next))->prev)), head))), unchecked!(@_vcc_oset_in(head, dll_reach(*((head->next)))))))); 
            assume $non_null($phys_ptr_cast(P#head, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(P#head, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(P#head, ^mem_reg)) && !$oset_in($phys_ptr_cast(P#head, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg))));
            // assume ==>(@_vcc_ptr_neq_null(head), ==(dll_reach(head), @_vcc_oset_union(dll_reach(*((head->next))), @_vcc_oset_singleton(head)))); 
            assume $non_null($phys_ptr_cast(P#head, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(P#head, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(P#head, ^mem_reg)));
            // assume <(+(*((node->start_address)), *((node->size))), 2147483647); 
            assume $rd_inv($s, mem_reg.start_address, $phys_ptr_cast(P#node, ^mem_reg)) + $rd_inv($s, mem_reg.size, $phys_ptr_cast(P#node, ^mem_reg)) < 2147483647;
            // assume >(+(*((node->start_address)), *((node->size))), -2147483648); 
            assume $rd_inv($s, mem_reg.start_address, $phys_ptr_cast(P#node, ^mem_reg)) + $rd_inv($s, mem_reg.size, $phys_ptr_cast(P#node, ^mem_reg)) > -2147483648;
            // assert @in_range_i4(+(*((node->start_address)), *((node->size)))); 
            assert $in_range_i4($rd_inv($s, mem_reg.start_address, $phys_ptr_cast(P#node, ^mem_reg)) + $rd_inv($s, mem_reg.size, $phys_ptr_cast(P#node, ^mem_reg)));
            // assert @reads_check_normal((node->start_address)); 
            assert $thread_local($s, $phys_ptr_cast(P#node, ^mem_reg));
            // assert @reads_check_normal((node->size)); 
            assert $thread_local($s, $phys_ptr_cast(P#node, ^mem_reg));
            // assert @reads_check_normal((curr->start_address)); 
            assert $thread_local($s, $phys_ptr_cast(L#curr, ^mem_reg));
            assume true;
            // if (<(+(*((node->start_address)), *((node->size))), *((curr->start_address)))) ...
            if ($rd_inv($s, mem_reg.start_address, $phys_ptr_cast(P#node, ^mem_reg)) + $rd_inv($s, mem_reg.size, $phys_ptr_cast(P#node, ^mem_reg)) < $rd_inv($s, mem_reg.start_address, $phys_ptr_cast(L#curr, ^mem_reg)))
            {
              anon7:
                // struct mem_reg* curr0; 
                // curr0 := curr; 
                SL#curr0 := $phys_ptr_cast(L#curr, ^mem_reg);
                // struct mem_reg* stmtexpr0#5; 
                // stmtexpr0#5 := curr0; 
                stmtexpr0#5 := $phys_ptr_cast(SL#curr0, ^mem_reg);
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#curr, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#curr, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                assume $non_null($phys_ptr_cast(L#curr, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#curr, ^mem_reg)));
                // assert @reads_check_normal((curr->next)); 
                assert $thread_local($s, $phys_ptr_cast(L#curr, ^mem_reg));
                // curr := *((curr->next)); 
                L#curr := $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg);
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#curr, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#curr, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                assume $non_null($phys_ptr_cast(L#curr, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#curr, ^mem_reg)));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#curr, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#curr, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                assume $non_null($phys_ptr_cast(L#curr, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#curr, ^mem_reg)));
            }
            else
            {
              anon8:
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
                assume $non_null($phys_ptr_cast(L#curr, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#curr, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#curr, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg))));
                // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
                assume $non_null($phys_ptr_cast(L#curr, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#curr, ^mem_reg)));
                // assume ==>(@_vcc_ptr_neq_null(node), ==(dll(node), &&(&&(dll(*((node->next))), ==>(@_vcc_ptr_neq_null(*((node->next))), @_vcc_ptr_eq_pure(*((*((node->next))->prev)), node))), unchecked!(@_vcc_oset_in(node, dll_reach(*((node->next)))))))); 
                assume $non_null($phys_ptr_cast(P#node, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(P#node, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(P#node, ^mem_reg)) && !$oset_in($phys_ptr_cast(P#node, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg))));
                // assume ==>(@_vcc_ptr_neq_null(node), ==(dll_reach(node), @_vcc_oset_union(dll_reach(*((node->next))), @_vcc_oset_singleton(node)))); 
                assume $non_null($phys_ptr_cast(P#node, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(P#node, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(P#node, ^mem_reg)));
                // assume ==>(@_vcc_ptr_neq_null(head), ==(dll(head), &&(&&(dll(*((head->next))), ==>(@_vcc_ptr_neq_null(*((head->next))), @_vcc_ptr_eq_pure(*((*((head->next))->prev)), head))), unchecked!(@_vcc_oset_in(head, dll_reach(*((head->next)))))))); 
                assume $non_null($phys_ptr_cast(P#head, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(P#head, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(P#head, ^mem_reg)) && !$oset_in($phys_ptr_cast(P#head, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg))));
                // assume ==>(@_vcc_ptr_neq_null(head), ==(dll_reach(head), @_vcc_oset_union(dll_reach(*((head->next))), @_vcc_oset_singleton(head)))); 
                assume $non_null($phys_ptr_cast(P#head, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(P#head, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(P#head, ^mem_reg)));
                // goto #break_1; 
                goto #break_1;
            }
        }
        else
        {
          anon10:
            // assert @_vcc_possibly_unreachable; 
            assert {:PossiblyUnreachable true} true;
            // goto #break_1; 
            goto #break_1;
        }

      #continue_1:
        assume true;
// INV:LOOPTAIL
    }

  anon13:
    assume $full_stop_ext(#tok$2^19.3, $s);

  #break_1:
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll(curr), &&(&&(dll(*((curr->next))), ==>(@_vcc_ptr_neq_null(*((curr->next))), @_vcc_ptr_eq_pure(*((*((curr->next))->prev)), curr))), unchecked!(@_vcc_oset_in(curr, dll_reach(*((curr->next)))))))); 
    assume $non_null($phys_ptr_cast(L#curr, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#curr, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#curr, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#curr, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(curr), ==(dll_reach(curr), @_vcc_oset_union(dll_reach(*((curr->next))), @_vcc_oset_singleton(curr)))); 
    assume $non_null($phys_ptr_cast(L#curr, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#curr, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#curr, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#curr, ^mem_reg)));
    // assume ==>(@_vcc_ptr_neq_null(node), ==(dll(node), &&(&&(dll(*((node->next))), ==>(@_vcc_ptr_neq_null(*((node->next))), @_vcc_ptr_eq_pure(*((*((node->next))->prev)), node))), unchecked!(@_vcc_oset_in(node, dll_reach(*((node->next)))))))); 
    assume $non_null($phys_ptr_cast(P#node, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(P#node, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(P#node, ^mem_reg)) && !$oset_in($phys_ptr_cast(P#node, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(node), ==(dll_reach(node), @_vcc_oset_union(dll_reach(*((node->next))), @_vcc_oset_singleton(node)))); 
    assume $non_null($phys_ptr_cast(P#node, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(P#node, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#node, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(P#node, ^mem_reg)));
    // assume ==>(@_vcc_ptr_neq_null(head), ==(dll(head), &&(&&(dll(*((head->next))), ==>(@_vcc_ptr_neq_null(*((head->next))), @_vcc_ptr_eq_pure(*((*((head->next))->prev)), head))), unchecked!(@_vcc_oset_in(head, dll_reach(*((head->next)))))))); 
    assume $non_null($phys_ptr_cast(P#head, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(P#head, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(P#head, ^mem_reg)) && !$oset_in($phys_ptr_cast(P#head, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(head), ==(dll_reach(head), @_vcc_oset_union(dll_reach(*((head->next))), @_vcc_oset_singleton(head)))); 
    assume $non_null($phys_ptr_cast(P#head, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(P#head, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(P#head, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(P#head, ^mem_reg)));
    // struct mem_reg* res_memory_region_insert_before#4; 
    // res_memory_region_insert_before#4 := memory_region_insert_before(curr, node); 
    call res_memory_region_insert_before#4 := memory_region_insert_before($phys_ptr_cast(L#curr, ^mem_reg), $phys_ptr_cast(P#node, ^mem_reg));
    assume $full_stop_ext(#tok$2^30.10, $s);
    // return res_memory_region_insert_before#4; 
    $result := $phys_ptr_cast(res_memory_region_insert_before#4, ^mem_reg);
    assume true;
    assert $position_marker();
    goto #exit;

  anon14:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$2^30.10: $token;

const unique #tok$2^19.3: $token;

const unique #tok$3^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(3, #file^?3Cno?20file?3E);

const unique #tok$2^11.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Cmem?2Dregion?5Cmemory_region_insert.c: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5CVCDryad?5Cvcc?5CHost?5Cbin?5CTests?5Cmem?2Dregion?5Cmemory_region_insert.c);

const unique #tok$1^15.1: $token;

const unique #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Cmem?2Dregion?5Cdryad_dll_mem_reg_defs.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Cvcdryad?5Cvcc?5Chost?5Cbin?5Ctests?5Cmem?2Dregion?5Cdryad_dll_mem_reg_defs.h);

const unique #distTp2: $ctype;

axiom #distTp2 == $ptr_to(^mem_reg);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^backing_file);

