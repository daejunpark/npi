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

const unique ^$#memory_region_create_user_space_region.c..36263#3: $ctype;

axiom $def_fnptr_type(^$#memory_region_create_user_space_region.c..36263#3);

type $#memory_region_create_user_space_region.c..36263#3;

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



procedure memory_region_init(P#file_: $ptr, P#file_offset_: int, P#file_size_: int, P#start_address_: int, P#size_: int) returns ($result: $ptr);
  modifies $s, $cev_pc;
  ensures $non_null($phys_ptr_cast($result, ^mem_reg));
  ensures $rd_phys_ptr($s, mem_reg.file, $phys_ptr_cast($result, ^mem_reg), ^backing_file) == $phys_ptr_cast(P#file_, ^backing_file) && $rd_inv($s, mem_reg.file_offset, $phys_ptr_cast($result, ^mem_reg)) == P#file_offset_ && $rd_inv($s, mem_reg.file_size, $phys_ptr_cast($result, ^mem_reg)) == P#file_size_ && $rd_inv($s, mem_reg.start_address, $phys_ptr_cast($result, ^mem_reg)) == P#start_address_ && $rd_inv($s, mem_reg.size, $phys_ptr_cast($result, ^mem_reg)) == P#size_ && $is_null($rd_phys_ptr($s, mem_reg.prev, $phys_ptr_cast($result, ^mem_reg), ^mem_reg)) && $is_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast($result, ^mem_reg), ^mem_reg));
  ensures F#dll($s, $phys_ptr_cast($result, ^mem_reg));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation memory_region_init(P#file_: $ptr, P#file_offset_: int, P#file_size_: int, P#start_address_: int, P#size_: int) returns ($result: $ptr)
{
  var stmtexpr18#21: $state;
  var SL#_dryad_S15: $state;
  var stmtexpr17#20: $state;
  var SL#_dryad_S14: $state;
  var stmtexpr16#19: $state;
  var SL#_dryad_S13: $state;
  var stmtexpr15#18: $state;
  var SL#_dryad_S12: $state;
  var stmtexpr14#17: $state;
  var SL#_dryad_S11: $state;
  var stmtexpr13#16: $state;
  var SL#_dryad_S10: $state;
  var stmtexpr12#15: $state;
  var SL#_dryad_S9: $state;
  var stmtexpr11#14: $state;
  var SL#_dryad_S8: $state;
  var stmtexpr10#13: $state;
  var SL#_dryad_S7: $state;
  var stmtexpr9#12: $state;
  var SL#_dryad_S6: $state;
  var stmtexpr8#11: $state;
  var SL#_dryad_S5: $state;
  var stmtexpr7#10: $state;
  var SL#_dryad_S4: $state;
  var stmtexpr6#9: $state;
  var SL#_dryad_S3: $state;
  var stmtexpr5#8: $state;
  var SL#_dryad_S2: $state;
  var stmtexpr4#7: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr3#6: $oset;
  var stmtexpr2#5: $state;
  var SL#_dryad_S0: $state;
  var L#mr: $ptr;
  var stmtexpr1#4: $oset;
  var stmtexpr0#3: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$3^5.3: int;
  var #stackframe: int;

  anon7:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$3^5.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$3^5.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$3^5.3, (lambda #p: $ptr :: false));
    // assume true
    // assume @in_range_i4(file_offset_); 
    assume $in_range_i4(P#file_offset_);
    // assume @in_range_i4(file_size_); 
    assume $in_range_i4(P#file_size_);
    // assume @in_range_i4(start_address_); 
    assume $in_range_i4(P#start_address_);
    // assume @in_range_i4(size_); 
    assume $in_range_i4(P#size_);
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    // assume true
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := @_vcc_oset_empty; 
    SL#_dryad_G0 := $oset_empty();
    // _math \oset stmtexpr0#3; 
    // stmtexpr0#3 := _dryad_G0; 
    stmtexpr0#3 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#4; 
    // stmtexpr1#4 := _dryad_G1; 
    stmtexpr1#4 := SL#_dryad_G1;
    // struct mem_reg* mr; 
    // _math \state _dryad_S0; 
    // _dryad_S0 := @_vcc_current_state(@state); 
    SL#_dryad_S0 := $current_state($s);
    // _math \state stmtexpr2#5; 
    // stmtexpr2#5 := _dryad_S0; 
    stmtexpr2#5 := SL#_dryad_S0;
    // mr := _vcc_alloc(@_vcc_typeof((struct mem_reg*)@null)); 
    call L#mr := $alloc(^mem_reg);
    assume $full_stop_ext(#tok$3^21.17, $s);
    // assume !(@_vcc_oset_in(mr, @_vcc_oset_union(_dryad_G0, _dryad_G1))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), $oset_union(SL#_dryad_G0, SL#_dryad_G1));
    // _dryad_G1 := @_vcc_oset_union(_dryad_G0, @_vcc_oset_singleton(mr)); 
    SL#_dryad_G1 := $oset_union(SL#_dryad_G0, $oset_singleton($phys_ptr_cast(L#mr, ^mem_reg)));
    // _math \oset stmtexpr3#6; 
    // stmtexpr3#6 := _dryad_G1; 
    stmtexpr3#6 := SL#_dryad_G1;
    // assume ==(glob_reach(), _dryad_G1); 
    assume F#glob_reach() == SL#_dryad_G1;
    // _math \state _dryad_S1; 
    // _dryad_S1 := @_vcc_current_state(@state); 
    SL#_dryad_S1 := $current_state($s);
    // _math \state stmtexpr4#7; 
    // stmtexpr4#7 := _dryad_S1; 
    stmtexpr4#7 := SL#_dryad_S1;
    // assume ==>(@_vcc_ptr_neq_null(mr), ==(dll(mr), &&(&&(dll(*((mr->next))), ==>(@_vcc_ptr_neq_null(*((mr->next))), @_vcc_ptr_eq_pure(*((*((mr->next))->prev)), mr))), unchecked!(@_vcc_oset_in(mr, dll_reach(*((mr->next)))))))); 
    assume $non_null($phys_ptr_cast(L#mr, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#mr, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#mr, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(mr), ==(dll_reach(mr), @_vcc_oset_union(dll_reach(*((mr->next))), @_vcc_oset_singleton(mr)))); 
    assume $non_null($phys_ptr_cast(L#mr, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#mr, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#mr, ^mem_reg)));
    // assume @_vcc_ptr_neq_null(mr); 
    assume $non_null($phys_ptr_cast(L#mr, ^mem_reg));
    // _math \state _dryad_S2; 
    // _dryad_S2 := @_vcc_current_state(@state); 
    SL#_dryad_S2 := $current_state($s);
    // _math \state stmtexpr5#8; 
    // stmtexpr5#8 := _dryad_S2; 
    stmtexpr5#8 := SL#_dryad_S2;
    // assert @prim_writes_check((mr->file)); 
    assert $writable_prim($s, #wrTime$3^5.3, $dot($phys_ptr_cast(L#mr, ^mem_reg), mem_reg.file));
    // *(mr->file) := file_; 
    call $write_int(mem_reg.file, $phys_ptr_cast(L#mr, ^mem_reg), $ptr_to_int($phys_ptr_cast(P#file_, ^backing_file)));
    assume $full_stop_ext(#tok$3^23.3, $s);
    // _math \state _dryad_S3; 
    // _dryad_S3 := @_vcc_current_state(@state); 
    SL#_dryad_S3 := $current_state($s);
    // _math \state stmtexpr6#9; 
    // stmtexpr6#9 := _dryad_S3; 
    stmtexpr6#9 := SL#_dryad_S3;
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S2, dll_reach(*((mr->prev)))))), ==(old(_dryad_S2, dll(*((mr->prev)))), old(_dryad_S3, dll(*((mr->prev)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S2, dll_reach(*((mr->prev)))))), ==(old(_dryad_S2, dll_reach(*((mr->prev)))), old(_dryad_S3, dll_reach(*((mr->prev)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll_reach(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S2, dll_reach(*((mr->next)))))), ==(old(_dryad_S2, dll(*((mr->next)))), old(_dryad_S3, dll(*((mr->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S2, dll_reach(*((mr->next)))))), ==(old(_dryad_S2, dll_reach(*((mr->next)))), old(_dryad_S3, dll_reach(*((mr->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll_reach(SL#_dryad_S2, $rd_phys_ptr(SL#_dryad_S2, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll_reach(SL#_dryad_S3, $rd_phys_ptr(SL#_dryad_S3, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==(old(_dryad_S2, dll(mr)), old(_dryad_S3, dll(mr))); 
    assume F#dll(SL#_dryad_S2, $phys_ptr_cast(L#mr, ^mem_reg)) == F#dll(SL#_dryad_S3, $phys_ptr_cast(L#mr, ^mem_reg));
    // assume ==(old(_dryad_S2, dll_reach(mr)), old(_dryad_S3, dll_reach(mr))); 
    assume F#dll_reach(SL#_dryad_S2, $phys_ptr_cast(L#mr, ^mem_reg)) == F#dll_reach(SL#_dryad_S3, $phys_ptr_cast(L#mr, ^mem_reg));
    // _math \state _dryad_S4; 
    // _dryad_S4 := @_vcc_current_state(@state); 
    SL#_dryad_S4 := $current_state($s);
    // _math \state stmtexpr7#10; 
    // stmtexpr7#10 := _dryad_S4; 
    stmtexpr7#10 := SL#_dryad_S4;
    // assert @prim_writes_check((mr->file_offset)); 
    assert $writable_prim($s, #wrTime$3^5.3, $dot($phys_ptr_cast(L#mr, ^mem_reg), mem_reg.file_offset));
    // *(mr->file_offset) := file_offset_; 
    call $write_int(mem_reg.file_offset, $phys_ptr_cast(L#mr, ^mem_reg), P#file_offset_);
    assume $full_stop_ext(#tok$3^24.3, $s);
    // _math \state _dryad_S5; 
    // _dryad_S5 := @_vcc_current_state(@state); 
    SL#_dryad_S5 := $current_state($s);
    // _math \state stmtexpr8#11; 
    // stmtexpr8#11 := _dryad_S5; 
    stmtexpr8#11 := SL#_dryad_S5;
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S4, dll_reach(*((mr->prev)))))), ==(old(_dryad_S4, dll(*((mr->prev)))), old(_dryad_S5, dll(*((mr->prev)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll(SL#_dryad_S5, $rd_phys_ptr(SL#_dryad_S5, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S4, dll_reach(*((mr->prev)))))), ==(old(_dryad_S4, dll_reach(*((mr->prev)))), old(_dryad_S5, dll_reach(*((mr->prev)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll_reach(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll_reach(SL#_dryad_S5, $rd_phys_ptr(SL#_dryad_S5, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S4, dll_reach(*((mr->next)))))), ==(old(_dryad_S4, dll(*((mr->next)))), old(_dryad_S5, dll(*((mr->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll(SL#_dryad_S5, $rd_phys_ptr(SL#_dryad_S5, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S4, dll_reach(*((mr->next)))))), ==(old(_dryad_S4, dll_reach(*((mr->next)))), old(_dryad_S5, dll_reach(*((mr->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll_reach(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll_reach(SL#_dryad_S5, $rd_phys_ptr(SL#_dryad_S5, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==(old(_dryad_S4, dll(mr)), old(_dryad_S5, dll(mr))); 
    assume F#dll(SL#_dryad_S4, $phys_ptr_cast(L#mr, ^mem_reg)) == F#dll(SL#_dryad_S5, $phys_ptr_cast(L#mr, ^mem_reg));
    // assume ==(old(_dryad_S4, dll_reach(mr)), old(_dryad_S5, dll_reach(mr))); 
    assume F#dll_reach(SL#_dryad_S4, $phys_ptr_cast(L#mr, ^mem_reg)) == F#dll_reach(SL#_dryad_S5, $phys_ptr_cast(L#mr, ^mem_reg));
    // _math \state _dryad_S6; 
    // _dryad_S6 := @_vcc_current_state(@state); 
    SL#_dryad_S6 := $current_state($s);
    // _math \state stmtexpr9#12; 
    // stmtexpr9#12 := _dryad_S6; 
    stmtexpr9#12 := SL#_dryad_S6;
    // assert @prim_writes_check((mr->file_size)); 
    assert $writable_prim($s, #wrTime$3^5.3, $dot($phys_ptr_cast(L#mr, ^mem_reg), mem_reg.file_size));
    // *(mr->file_size) := file_size_; 
    call $write_int(mem_reg.file_size, $phys_ptr_cast(L#mr, ^mem_reg), P#file_size_);
    assume $full_stop_ext(#tok$3^25.3, $s);
    // _math \state _dryad_S7; 
    // _dryad_S7 := @_vcc_current_state(@state); 
    SL#_dryad_S7 := $current_state($s);
    // _math \state stmtexpr10#13; 
    // stmtexpr10#13 := _dryad_S7; 
    stmtexpr10#13 := SL#_dryad_S7;
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S6, dll_reach(*((mr->prev)))))), ==(old(_dryad_S6, dll(*((mr->prev)))), old(_dryad_S7, dll(*((mr->prev)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S6, $rd_phys_ptr(SL#_dryad_S6, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll(SL#_dryad_S6, $rd_phys_ptr(SL#_dryad_S6, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll(SL#_dryad_S7, $rd_phys_ptr(SL#_dryad_S7, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S6, dll_reach(*((mr->prev)))))), ==(old(_dryad_S6, dll_reach(*((mr->prev)))), old(_dryad_S7, dll_reach(*((mr->prev)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S6, $rd_phys_ptr(SL#_dryad_S6, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll_reach(SL#_dryad_S6, $rd_phys_ptr(SL#_dryad_S6, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll_reach(SL#_dryad_S7, $rd_phys_ptr(SL#_dryad_S7, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S6, dll_reach(*((mr->next)))))), ==(old(_dryad_S6, dll(*((mr->next)))), old(_dryad_S7, dll(*((mr->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S6, $rd_phys_ptr(SL#_dryad_S6, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll(SL#_dryad_S6, $rd_phys_ptr(SL#_dryad_S6, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll(SL#_dryad_S7, $rd_phys_ptr(SL#_dryad_S7, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S6, dll_reach(*((mr->next)))))), ==(old(_dryad_S6, dll_reach(*((mr->next)))), old(_dryad_S7, dll_reach(*((mr->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S6, $rd_phys_ptr(SL#_dryad_S6, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll_reach(SL#_dryad_S6, $rd_phys_ptr(SL#_dryad_S6, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll_reach(SL#_dryad_S7, $rd_phys_ptr(SL#_dryad_S7, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==(old(_dryad_S6, dll(mr)), old(_dryad_S7, dll(mr))); 
    assume F#dll(SL#_dryad_S6, $phys_ptr_cast(L#mr, ^mem_reg)) == F#dll(SL#_dryad_S7, $phys_ptr_cast(L#mr, ^mem_reg));
    // assume ==(old(_dryad_S6, dll_reach(mr)), old(_dryad_S7, dll_reach(mr))); 
    assume F#dll_reach(SL#_dryad_S6, $phys_ptr_cast(L#mr, ^mem_reg)) == F#dll_reach(SL#_dryad_S7, $phys_ptr_cast(L#mr, ^mem_reg));
    // _math \state _dryad_S8; 
    // _dryad_S8 := @_vcc_current_state(@state); 
    SL#_dryad_S8 := $current_state($s);
    // _math \state stmtexpr11#14; 
    // stmtexpr11#14 := _dryad_S8; 
    stmtexpr11#14 := SL#_dryad_S8;
    // assert @prim_writes_check((mr->start_address)); 
    assert $writable_prim($s, #wrTime$3^5.3, $dot($phys_ptr_cast(L#mr, ^mem_reg), mem_reg.start_address));
    // *(mr->start_address) := start_address_; 
    call $write_int(mem_reg.start_address, $phys_ptr_cast(L#mr, ^mem_reg), P#start_address_);
    assume $full_stop_ext(#tok$3^26.3, $s);
    // _math \state _dryad_S9; 
    // _dryad_S9 := @_vcc_current_state(@state); 
    SL#_dryad_S9 := $current_state($s);
    // _math \state stmtexpr12#15; 
    // stmtexpr12#15 := _dryad_S9; 
    stmtexpr12#15 := SL#_dryad_S9;
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S8, dll_reach(*((mr->prev)))))), ==(old(_dryad_S8, dll(*((mr->prev)))), old(_dryad_S9, dll(*((mr->prev)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S8, $rd_phys_ptr(SL#_dryad_S8, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll(SL#_dryad_S8, $rd_phys_ptr(SL#_dryad_S8, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll(SL#_dryad_S9, $rd_phys_ptr(SL#_dryad_S9, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S8, dll_reach(*((mr->prev)))))), ==(old(_dryad_S8, dll_reach(*((mr->prev)))), old(_dryad_S9, dll_reach(*((mr->prev)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S8, $rd_phys_ptr(SL#_dryad_S8, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll_reach(SL#_dryad_S8, $rd_phys_ptr(SL#_dryad_S8, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll_reach(SL#_dryad_S9, $rd_phys_ptr(SL#_dryad_S9, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S8, dll_reach(*((mr->next)))))), ==(old(_dryad_S8, dll(*((mr->next)))), old(_dryad_S9, dll(*((mr->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S8, $rd_phys_ptr(SL#_dryad_S8, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll(SL#_dryad_S8, $rd_phys_ptr(SL#_dryad_S8, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll(SL#_dryad_S9, $rd_phys_ptr(SL#_dryad_S9, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S8, dll_reach(*((mr->next)))))), ==(old(_dryad_S8, dll_reach(*((mr->next)))), old(_dryad_S9, dll_reach(*((mr->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S8, $rd_phys_ptr(SL#_dryad_S8, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll_reach(SL#_dryad_S8, $rd_phys_ptr(SL#_dryad_S8, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll_reach(SL#_dryad_S9, $rd_phys_ptr(SL#_dryad_S9, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==(old(_dryad_S8, dll(mr)), old(_dryad_S9, dll(mr))); 
    assume F#dll(SL#_dryad_S8, $phys_ptr_cast(L#mr, ^mem_reg)) == F#dll(SL#_dryad_S9, $phys_ptr_cast(L#mr, ^mem_reg));
    // assume ==(old(_dryad_S8, dll_reach(mr)), old(_dryad_S9, dll_reach(mr))); 
    assume F#dll_reach(SL#_dryad_S8, $phys_ptr_cast(L#mr, ^mem_reg)) == F#dll_reach(SL#_dryad_S9, $phys_ptr_cast(L#mr, ^mem_reg));
    // _math \state _dryad_S10; 
    // _dryad_S10 := @_vcc_current_state(@state); 
    SL#_dryad_S10 := $current_state($s);
    // _math \state stmtexpr13#16; 
    // stmtexpr13#16 := _dryad_S10; 
    stmtexpr13#16 := SL#_dryad_S10;
    // assert @prim_writes_check((mr->size)); 
    assert $writable_prim($s, #wrTime$3^5.3, $dot($phys_ptr_cast(L#mr, ^mem_reg), mem_reg.size));
    // *(mr->size) := size_; 
    call $write_int(mem_reg.size, $phys_ptr_cast(L#mr, ^mem_reg), P#size_);
    assume $full_stop_ext(#tok$3^27.3, $s);
    // _math \state _dryad_S11; 
    // _dryad_S11 := @_vcc_current_state(@state); 
    SL#_dryad_S11 := $current_state($s);
    // _math \state stmtexpr14#17; 
    // stmtexpr14#17 := _dryad_S11; 
    stmtexpr14#17 := SL#_dryad_S11;
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S10, dll_reach(*((mr->prev)))))), ==(old(_dryad_S10, dll(*((mr->prev)))), old(_dryad_S11, dll(*((mr->prev)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S10, $rd_phys_ptr(SL#_dryad_S10, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll(SL#_dryad_S10, $rd_phys_ptr(SL#_dryad_S10, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll(SL#_dryad_S11, $rd_phys_ptr(SL#_dryad_S11, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S10, dll_reach(*((mr->prev)))))), ==(old(_dryad_S10, dll_reach(*((mr->prev)))), old(_dryad_S11, dll_reach(*((mr->prev)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S10, $rd_phys_ptr(SL#_dryad_S10, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll_reach(SL#_dryad_S10, $rd_phys_ptr(SL#_dryad_S10, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll_reach(SL#_dryad_S11, $rd_phys_ptr(SL#_dryad_S11, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S10, dll_reach(*((mr->next)))))), ==(old(_dryad_S10, dll(*((mr->next)))), old(_dryad_S11, dll(*((mr->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S10, $rd_phys_ptr(SL#_dryad_S10, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll(SL#_dryad_S10, $rd_phys_ptr(SL#_dryad_S10, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll(SL#_dryad_S11, $rd_phys_ptr(SL#_dryad_S11, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S10, dll_reach(*((mr->next)))))), ==(old(_dryad_S10, dll_reach(*((mr->next)))), old(_dryad_S11, dll_reach(*((mr->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S10, $rd_phys_ptr(SL#_dryad_S10, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll_reach(SL#_dryad_S10, $rd_phys_ptr(SL#_dryad_S10, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll_reach(SL#_dryad_S11, $rd_phys_ptr(SL#_dryad_S11, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==(old(_dryad_S10, dll(mr)), old(_dryad_S11, dll(mr))); 
    assume F#dll(SL#_dryad_S10, $phys_ptr_cast(L#mr, ^mem_reg)) == F#dll(SL#_dryad_S11, $phys_ptr_cast(L#mr, ^mem_reg));
    // assume ==(old(_dryad_S10, dll_reach(mr)), old(_dryad_S11, dll_reach(mr))); 
    assume F#dll_reach(SL#_dryad_S10, $phys_ptr_cast(L#mr, ^mem_reg)) == F#dll_reach(SL#_dryad_S11, $phys_ptr_cast(L#mr, ^mem_reg));
    // _math \state _dryad_S12; 
    // _dryad_S12 := @_vcc_current_state(@state); 
    SL#_dryad_S12 := $current_state($s);
    // _math \state stmtexpr15#18; 
    // stmtexpr15#18 := _dryad_S12; 
    stmtexpr15#18 := SL#_dryad_S12;
    // assert @prim_writes_check((mr->prev)); 
    assert $writable_prim($s, #wrTime$3^5.3, $dot($phys_ptr_cast(L#mr, ^mem_reg), mem_reg.prev));
    // *(mr->prev) := (struct mem_reg*)@null; 
    call $write_int(mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), $ptr_to_int($phys_ptr_cast($null, ^mem_reg)));
    assume $full_stop_ext(#tok$3^28.3, $s);
    // _math \state _dryad_S13; 
    // _dryad_S13 := @_vcc_current_state(@state); 
    SL#_dryad_S13 := $current_state($s);
    // _math \state stmtexpr16#19; 
    // stmtexpr16#19 := _dryad_S13; 
    stmtexpr16#19 := SL#_dryad_S13;
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S12, dll_reach(*((mr->next)))))), ==(old(_dryad_S12, dll(*((mr->next)))), old(_dryad_S13, dll(*((mr->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S12, $rd_phys_ptr(SL#_dryad_S12, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll(SL#_dryad_S12, $rd_phys_ptr(SL#_dryad_S12, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll(SL#_dryad_S13, $rd_phys_ptr(SL#_dryad_S13, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S12, dll_reach(*((mr->next)))))), ==(old(_dryad_S12, dll_reach(*((mr->next)))), old(_dryad_S13, dll_reach(*((mr->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S12, $rd_phys_ptr(SL#_dryad_S12, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll_reach(SL#_dryad_S12, $rd_phys_ptr(SL#_dryad_S12, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll_reach(SL#_dryad_S13, $rd_phys_ptr(SL#_dryad_S13, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==(old(_dryad_S12, dll(mr)), old(_dryad_S13, dll(mr))); 
    assume F#dll(SL#_dryad_S12, $phys_ptr_cast(L#mr, ^mem_reg)) == F#dll(SL#_dryad_S13, $phys_ptr_cast(L#mr, ^mem_reg));
    // assume ==(old(_dryad_S12, dll_reach(mr)), old(_dryad_S13, dll_reach(mr))); 
    assume F#dll_reach(SL#_dryad_S12, $phys_ptr_cast(L#mr, ^mem_reg)) == F#dll_reach(SL#_dryad_S13, $phys_ptr_cast(L#mr, ^mem_reg));
    // _math \state _dryad_S14; 
    // _dryad_S14 := @_vcc_current_state(@state); 
    SL#_dryad_S14 := $current_state($s);
    // _math \state stmtexpr17#20; 
    // stmtexpr17#20 := _dryad_S14; 
    stmtexpr17#20 := SL#_dryad_S14;
    // assert @prim_writes_check((mr->next)); 
    assert $writable_prim($s, #wrTime$3^5.3, $dot($phys_ptr_cast(L#mr, ^mem_reg), mem_reg.next));
    // *(mr->next) := (struct mem_reg*)@null; 
    call $write_int(mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), $ptr_to_int($phys_ptr_cast($null, ^mem_reg)));
    assume $full_stop_ext(#tok$3^29.3, $s);
    // _math \state _dryad_S15; 
    // _dryad_S15 := @_vcc_current_state(@state); 
    SL#_dryad_S15 := $current_state($s);
    // _math \state stmtexpr18#21; 
    // stmtexpr18#21 := _dryad_S15; 
    stmtexpr18#21 := SL#_dryad_S15;
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S14, dll_reach(*((mr->prev)))))), ==(old(_dryad_S14, dll(*((mr->prev)))), old(_dryad_S15, dll(*((mr->prev)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S14, $rd_phys_ptr(SL#_dryad_S14, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll(SL#_dryad_S14, $rd_phys_ptr(SL#_dryad_S14, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll(SL#_dryad_S15, $rd_phys_ptr(SL#_dryad_S15, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(mr, old(_dryad_S14, dll_reach(*((mr->prev)))))), ==(old(_dryad_S14, dll_reach(*((mr->prev)))), old(_dryad_S15, dll_reach(*((mr->prev)))))); 
    assume !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach(SL#_dryad_S14, $rd_phys_ptr(SL#_dryad_S14, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))) ==> F#dll_reach(SL#_dryad_S14, $rd_phys_ptr(SL#_dryad_S14, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) == F#dll_reach(SL#_dryad_S15, $rd_phys_ptr(SL#_dryad_S15, mem_reg.prev, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg));
    // assume ==>(@_vcc_ptr_neq_null(mr), ==(dll(mr), &&(&&(dll(*((mr->next))), ==>(@_vcc_ptr_neq_null(*((mr->next))), @_vcc_ptr_eq_pure(*((*((mr->next))->prev)), mr))), unchecked!(@_vcc_oset_in(mr, dll_reach(*((mr->next)))))))); 
    assume $non_null($phys_ptr_cast(L#mr, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#mr, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#mr, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#mr, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(mr), ==(dll_reach(mr), @_vcc_oset_union(dll_reach(*((mr->next))), @_vcc_oset_singleton(mr)))); 
    assume $non_null($phys_ptr_cast(L#mr, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#mr, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#mr, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#mr, ^mem_reg)));
    // return mr; 
    $result := $phys_ptr_cast(L#mr, ^mem_reg);
    assume true;
    assert $position_marker();
    goto #exit;

  anon8:
    // skip

  #exit:
}



procedure memory_region_create_user_space_region() returns ($result: $ptr);
  modifies $s, $cev_pc;
  ensures F#dll($s, $phys_ptr_cast($result, ^mem_reg));
  free ensures $writes_nothing(old($s), $s);
  free ensures $call_transition(old($s), $s);



implementation memory_region_create_user_space_region() returns ($result: $ptr)
{
  var stmtexpr11#33: $state;
  var SL#_dryad_S7: $state;
  var stmtexpr10#32: $state;
  var SL#_dryad_S6: $state;
  var stmtexpr9#31: $state;
  var SL#_dryad_S5: $state;
  var stmtexpr8#30: $state;
  var SL#_dryad_S4: $state;
  var stmtexpr7#29: $oset;
  var res_dll_reach#2: $oset;
  var stmtexpr6#28: $state;
  var SL#_dryad_S3: $state;
  var stmtexpr5#27: $state;
  var SL#_dryad_S2: $state;
  var stmtexpr4#26: $oset;
  var res_dll_reach#1: $oset;
  var stmtexpr3#25: $state;
  var SL#_dryad_S1: $state;
  var stmtexpr2#24: $state;
  var SL#_dryad_S0: $state;
  var L#r: $ptr;
  var L#r1: $ptr;
  var stmtexpr1#23: $oset;
  var stmtexpr0#22: $oset;
  var SL#_dryad_G1: $oset;
  var SL#_dryad_G0: $oset;
  var #wrTime$3^33.3: int;
  var #stackframe: int;

  anon9:
    assume $function_entry($s);
    assume $full_stop_ext(#tok$3^33.3, $s);
    assume $can_use_all_frame_axioms($s);
    assume #wrTime$3^33.3 == $current_timestamp($s);
    assume $def_writes($s, #wrTime$3^33.3, (lambda #p: $ptr :: false));
    // assume @decreases_level_is(2147483647); 
    assume 2147483647 == $decreases_level;
    //  --- Dryad annotated function --- 
    // _math \oset _dryad_G0; 
    // _math \oset _dryad_G1; 
    // _dryad_G0 := @_vcc_oset_empty; 
    SL#_dryad_G0 := $oset_empty();
    // _math \oset stmtexpr0#22; 
    // stmtexpr0#22 := _dryad_G0; 
    stmtexpr0#22 := SL#_dryad_G0;
    // _dryad_G1 := _dryad_G0; 
    SL#_dryad_G1 := SL#_dryad_G0;
    // _math \oset stmtexpr1#23; 
    // stmtexpr1#23 := _dryad_G1; 
    stmtexpr1#23 := SL#_dryad_G1;
    // struct mem_reg* r1; 
    // struct mem_reg* r; 
    // _math \state _dryad_S0; 
    // _dryad_S0 := @_vcc_current_state(@state); 
    SL#_dryad_S0 := $current_state($s);
    // _math \state stmtexpr2#24; 
    // stmtexpr2#24 := _dryad_S0; 
    stmtexpr2#24 := SL#_dryad_S0;
    // non-pure function
    // r := memory_region_init((struct backing_file*)@null, 0, 0, 0, 1); 
    call L#r := memory_region_init($phys_ptr_cast($null, ^backing_file), 0, 0, 0, 1);
    assume $full_stop_ext(#tok$3^39.17, $s);
    // _math \state _dryad_S1; 
    // _dryad_S1 := @_vcc_current_state(@state); 
    SL#_dryad_S1 := $current_state($s);
    // _math \state stmtexpr3#25; 
    // stmtexpr3#25 := _dryad_S1; 
    stmtexpr3#25 := SL#_dryad_S1;
    // assume @_vcc_oset_disjoint(dll_reach(r), _dryad_G1); 
    assume $oset_disjoint(F#dll_reach($s, $phys_ptr_cast(L#r, ^mem_reg)), SL#_dryad_G1);
    // _math \oset res_dll_reach#1; 
    // res_dll_reach#1 := dll_reach(r); 
    call res_dll_reach#1 := dll_reach($phys_ptr_cast(L#r, ^mem_reg));
    assume $full_stop_ext(#tok$4^0.0, $s);
    // _dryad_G1 := @_vcc_oset_union(res_dll_reach#1, _dryad_G1); 
    SL#_dryad_G1 := $oset_union(res_dll_reach#1, SL#_dryad_G1);
    // _math \oset stmtexpr4#26; 
    // stmtexpr4#26 := _dryad_G1; 
    stmtexpr4#26 := SL#_dryad_G1;
    // assume ==(glob_reach(), _dryad_G1); 
    assume F#glob_reach() == SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(r), ==(dll(r), &&(&&(dll(*((r->next))), ==>(@_vcc_ptr_neq_null(*((r->next))), @_vcc_ptr_eq_pure(*((*((r->next))->prev)), r))), unchecked!(@_vcc_oset_in(r, dll_reach(*((r->next)))))))); 
    assume $non_null($phys_ptr_cast(L#r, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#r, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#r, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#r, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(dll_reach(r), @_vcc_oset_union(dll_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
    assume $non_null($phys_ptr_cast(L#r, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#r, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#r, ^mem_reg)));
    // assume ==>(@_vcc_ptr_neq_null(r1), ==(dll(r1), &&(&&(dll(*((r1->next))), ==>(@_vcc_ptr_neq_null(*((r1->next))), @_vcc_ptr_eq_pure(*((*((r1->next))->prev)), r1))), unchecked!(@_vcc_oset_in(r1, dll_reach(*((r1->next)))))))); 
    assume $non_null($phys_ptr_cast(L#r1, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#r1, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#r1, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#r1, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(r1), ==(dll_reach(r1), @_vcc_oset_union(dll_reach(*((r1->next))), @_vcc_oset_singleton(r1)))); 
    assume $non_null($phys_ptr_cast(L#r1, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#r1, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#r1, ^mem_reg)));
    // assume ==>(@_vcc_ptr_neq_null(r), &&(@_vcc_mutable(@state, r), @writes_check(r))); 
    assume $non_null($phys_ptr_cast(L#r, ^mem_reg)) ==> $mutable($s, $phys_ptr_cast(L#r, ^mem_reg)) && $top_writable($s, #wrTime$3^33.3, $phys_ptr_cast(L#r, ^mem_reg));
    // _math \state _dryad_S2; 
    // _dryad_S2 := @_vcc_current_state(@state); 
    SL#_dryad_S2 := $current_state($s);
    // _math \state stmtexpr5#27; 
    // stmtexpr5#27 := _dryad_S2; 
    stmtexpr5#27 := SL#_dryad_S2;
    // non-pure function
    // r1 := memory_region_init((struct backing_file*)@null, 0, 0, 786432, 65536); 
    call L#r1 := memory_region_init($phys_ptr_cast($null, ^backing_file), 0, 0, 786432, 65536);
    assume $full_stop_ext(#tok$3^41.17, $s);
    // _math \state _dryad_S3; 
    // _dryad_S3 := @_vcc_current_state(@state); 
    SL#_dryad_S3 := $current_state($s);
    // _math \state stmtexpr6#28; 
    // stmtexpr6#28 := _dryad_S3; 
    stmtexpr6#28 := SL#_dryad_S3;
    // assume @_vcc_oset_disjoint(dll_reach(r1), _dryad_G1); 
    assume $oset_disjoint(F#dll_reach($s, $phys_ptr_cast(L#r1, ^mem_reg)), SL#_dryad_G1);
    // _math \oset res_dll_reach#2; 
    // res_dll_reach#2 := dll_reach(r1); 
    call res_dll_reach#2 := dll_reach($phys_ptr_cast(L#r1, ^mem_reg));
    assume $full_stop_ext(#tok$4^0.0, $s);
    // _dryad_G1 := @_vcc_oset_union(res_dll_reach#2, _dryad_G1); 
    SL#_dryad_G1 := $oset_union(res_dll_reach#2, SL#_dryad_G1);
    // _math \oset stmtexpr7#29; 
    // stmtexpr7#29 := _dryad_G1; 
    stmtexpr7#29 := SL#_dryad_G1;
    // assume ==(glob_reach(), _dryad_G1); 
    assume F#glob_reach() == SL#_dryad_G1;
    // assume ==>(@_vcc_ptr_neq_null(r), ==(dll(r), &&(&&(dll(*((r->next))), ==>(@_vcc_ptr_neq_null(*((r->next))), @_vcc_ptr_eq_pure(*((*((r->next))->prev)), r))), unchecked!(@_vcc_oset_in(r, dll_reach(*((r->next)))))))); 
    assume $non_null($phys_ptr_cast(L#r, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#r, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#r, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#r, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(dll_reach(r), @_vcc_oset_union(dll_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
    assume $non_null($phys_ptr_cast(L#r, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#r, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#r, ^mem_reg)));
    // assume ==>(@_vcc_ptr_neq_null(r1), ==(dll(r1), &&(&&(dll(*((r1->next))), ==>(@_vcc_ptr_neq_null(*((r1->next))), @_vcc_ptr_eq_pure(*((*((r1->next))->prev)), r1))), unchecked!(@_vcc_oset_in(r1, dll_reach(*((r1->next)))))))); 
    assume $non_null($phys_ptr_cast(L#r1, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#r1, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#r1, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#r1, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(r1), ==(dll_reach(r1), @_vcc_oset_union(dll_reach(*((r1->next))), @_vcc_oset_singleton(r1)))); 
    assume $non_null($phys_ptr_cast(L#r1, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#r1, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#r1, ^mem_reg)));
    // assume ==>(@_vcc_ptr_neq_null(r1), &&(@_vcc_mutable(@state, r1), @writes_check(r1))); 
    assume $non_null($phys_ptr_cast(L#r1, ^mem_reg)) ==> $mutable($s, $phys_ptr_cast(L#r1, ^mem_reg)) && $top_writable($s, #wrTime$3^33.3, $phys_ptr_cast(L#r1, ^mem_reg));
    // _math \state _dryad_S4; 
    // _dryad_S4 := @_vcc_current_state(@state); 
    SL#_dryad_S4 := $current_state($s);
    // _math \state stmtexpr8#30; 
    // stmtexpr8#30 := _dryad_S4; 
    stmtexpr8#30 := SL#_dryad_S4;
    // assert @prim_writes_check((r->next)); 
    assert $writable_prim($s, #wrTime$3^33.3, $dot($phys_ptr_cast(L#r, ^mem_reg), mem_reg.next));
    // *(r->next) := r1; 
    call $write_int(mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), $ptr_to_int($phys_ptr_cast(L#r1, ^mem_reg)));
    assume $full_stop_ext(#tok$3^43.3, $s);
    // _math \state _dryad_S5; 
    // _dryad_S5 := @_vcc_current_state(@state); 
    SL#_dryad_S5 := $current_state($s);
    // _math \state stmtexpr9#31; 
    // stmtexpr9#31 := _dryad_S5; 
    stmtexpr9#31 := SL#_dryad_S5;
    // assume ==>(unchecked!(@_vcc_oset_in(r, old(_dryad_S4, dll_reach(*((r->prev)))))), ==(old(_dryad_S4, dll(*((r->prev)))), old(_dryad_S5, dll(*((r->prev)))))); 
    assume !$oset_in($phys_ptr_cast(L#r, ^mem_reg), F#dll_reach(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, mem_reg.prev, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg))) ==> F#dll(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, mem_reg.prev, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)) == F#dll(SL#_dryad_S5, $rd_phys_ptr(SL#_dryad_S5, mem_reg.prev, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(r, old(_dryad_S4, dll_reach(*((r->prev)))))), ==(old(_dryad_S4, dll_reach(*((r->prev)))), old(_dryad_S5, dll_reach(*((r->prev)))))); 
    assume !$oset_in($phys_ptr_cast(L#r, ^mem_reg), F#dll_reach(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, mem_reg.prev, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg))) ==> F#dll_reach(SL#_dryad_S4, $rd_phys_ptr(SL#_dryad_S4, mem_reg.prev, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)) == F#dll_reach(SL#_dryad_S5, $rd_phys_ptr(SL#_dryad_S5, mem_reg.prev, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(r, old(_dryad_S4, dll_reach(r1)))), ==(old(_dryad_S4, dll(r1)), old(_dryad_S5, dll(r1)))); 
    assume !$oset_in($phys_ptr_cast(L#r, ^mem_reg), F#dll_reach(SL#_dryad_S4, $phys_ptr_cast(L#r1, ^mem_reg))) ==> F#dll(SL#_dryad_S4, $phys_ptr_cast(L#r1, ^mem_reg)) == F#dll(SL#_dryad_S5, $phys_ptr_cast(L#r1, ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(r, old(_dryad_S4, dll_reach(r1)))), ==(old(_dryad_S4, dll_reach(r1)), old(_dryad_S5, dll_reach(r1)))); 
    assume !$oset_in($phys_ptr_cast(L#r, ^mem_reg), F#dll_reach(SL#_dryad_S4, $phys_ptr_cast(L#r1, ^mem_reg))) ==> F#dll_reach(SL#_dryad_S4, $phys_ptr_cast(L#r1, ^mem_reg)) == F#dll_reach(SL#_dryad_S5, $phys_ptr_cast(L#r1, ^mem_reg));
    // assume ==>(!(@_vcc_ptr_eq_pure(r, r1)), @_vcc_ptr_eq_pure(*((r1->file)), old(_dryad_S4, *((r1->file))))); 
    assume !($phys_ptr_cast(L#r, ^mem_reg) == $phys_ptr_cast(L#r1, ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.file, $phys_ptr_cast(L#r1, ^mem_reg), ^backing_file) == $rd_phys_ptr(SL#_dryad_S4, mem_reg.file, $phys_ptr_cast(L#r1, ^mem_reg), ^backing_file);
    // assume ==>(!(@_vcc_ptr_eq_pure(r, r1)), ==(*((r1->file_offset)), old(_dryad_S4, *((r1->file_offset))))); 
    assume !($phys_ptr_cast(L#r, ^mem_reg) == $phys_ptr_cast(L#r1, ^mem_reg)) ==> $rd_inv($s, mem_reg.file_offset, $phys_ptr_cast(L#r1, ^mem_reg)) == $rd_inv(SL#_dryad_S4, mem_reg.file_offset, $phys_ptr_cast(L#r1, ^mem_reg));
    // assume ==>(!(@_vcc_ptr_eq_pure(r, r1)), ==(*((r1->file_size)), old(_dryad_S4, *((r1->file_size))))); 
    assume !($phys_ptr_cast(L#r, ^mem_reg) == $phys_ptr_cast(L#r1, ^mem_reg)) ==> $rd_inv($s, mem_reg.file_size, $phys_ptr_cast(L#r1, ^mem_reg)) == $rd_inv(SL#_dryad_S4, mem_reg.file_size, $phys_ptr_cast(L#r1, ^mem_reg));
    // assume ==>(!(@_vcc_ptr_eq_pure(r, r1)), ==(*((r1->start_address)), old(_dryad_S4, *((r1->start_address))))); 
    assume !($phys_ptr_cast(L#r, ^mem_reg) == $phys_ptr_cast(L#r1, ^mem_reg)) ==> $rd_inv($s, mem_reg.start_address, $phys_ptr_cast(L#r1, ^mem_reg)) == $rd_inv(SL#_dryad_S4, mem_reg.start_address, $phys_ptr_cast(L#r1, ^mem_reg));
    // assume ==>(!(@_vcc_ptr_eq_pure(r, r1)), ==(*((r1->size)), old(_dryad_S4, *((r1->size))))); 
    assume !($phys_ptr_cast(L#r, ^mem_reg) == $phys_ptr_cast(L#r1, ^mem_reg)) ==> $rd_inv($s, mem_reg.size, $phys_ptr_cast(L#r1, ^mem_reg)) == $rd_inv(SL#_dryad_S4, mem_reg.size, $phys_ptr_cast(L#r1, ^mem_reg));
    // assume ==>(!(@_vcc_ptr_eq_pure(r, r1)), @_vcc_ptr_eq_pure(*((r1->prev)), old(_dryad_S4, *((r1->prev))))); 
    assume !($phys_ptr_cast(L#r, ^mem_reg) == $phys_ptr_cast(L#r1, ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg) == $rd_phys_ptr(SL#_dryad_S4, mem_reg.prev, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg);
    // assume ==>(!(@_vcc_ptr_eq_pure(r, r1)), @_vcc_ptr_eq_pure(*((r1->next)), old(_dryad_S4, *((r1->next))))); 
    assume !($phys_ptr_cast(L#r, ^mem_reg) == $phys_ptr_cast(L#r1, ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg) == $rd_phys_ptr(SL#_dryad_S4, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg);
    // assume ==>(@_vcc_ptr_neq_null(r1), ==(dll(r1), &&(&&(dll(*((r1->next))), ==>(@_vcc_ptr_neq_null(*((r1->next))), @_vcc_ptr_eq_pure(*((*((r1->next))->prev)), r1))), unchecked!(@_vcc_oset_in(r1, dll_reach(*((r1->next)))))))); 
    assume $non_null($phys_ptr_cast(L#r1, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#r1, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#r1, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#r1, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(r1), ==(dll_reach(r1), @_vcc_oset_union(dll_reach(*((r1->next))), @_vcc_oset_singleton(r1)))); 
    assume $non_null($phys_ptr_cast(L#r1, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#r1, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#r1, ^mem_reg)));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(dll(r), &&(&&(dll(*((r->next))), ==>(@_vcc_ptr_neq_null(*((r->next))), @_vcc_ptr_eq_pure(*((*((r->next))->prev)), r))), unchecked!(@_vcc_oset_in(r, dll_reach(*((r->next)))))))); 
    assume $non_null($phys_ptr_cast(L#r, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#r, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#r, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#r, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(dll_reach(r), @_vcc_oset_union(dll_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
    assume $non_null($phys_ptr_cast(L#r, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#r, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#r, ^mem_reg)));
    // assume ==>(@_vcc_ptr_neq_null(r1), ==(dll(r1), &&(&&(dll(*((r1->next))), ==>(@_vcc_ptr_neq_null(*((r1->next))), @_vcc_ptr_eq_pure(*((*((r1->next))->prev)), r1))), unchecked!(@_vcc_oset_in(r1, dll_reach(*((r1->next)))))))); 
    assume $non_null($phys_ptr_cast(L#r1, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#r1, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#r1, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#r1, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(r1), ==(dll_reach(r1), @_vcc_oset_union(dll_reach(*((r1->next))), @_vcc_oset_singleton(r1)))); 
    assume $non_null($phys_ptr_cast(L#r1, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#r1, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#r1, ^mem_reg)));
    // _math \state _dryad_S6; 
    // _dryad_S6 := @_vcc_current_state(@state); 
    SL#_dryad_S6 := $current_state($s);
    // _math \state stmtexpr10#32; 
    // stmtexpr10#32 := _dryad_S6; 
    stmtexpr10#32 := SL#_dryad_S6;
    // assert @prim_writes_check((r1->prev)); 
    assert $writable_prim($s, #wrTime$3^33.3, $dot($phys_ptr_cast(L#r1, ^mem_reg), mem_reg.prev));
    // *(r1->prev) := r; 
    call $write_int(mem_reg.prev, $phys_ptr_cast(L#r1, ^mem_reg), $ptr_to_int($phys_ptr_cast(L#r, ^mem_reg)));
    assume $full_stop_ext(#tok$3^44.3, $s);
    // _math \state _dryad_S7; 
    // _dryad_S7 := @_vcc_current_state(@state); 
    SL#_dryad_S7 := $current_state($s);
    // _math \state stmtexpr11#33; 
    // stmtexpr11#33 := _dryad_S7; 
    stmtexpr11#33 := SL#_dryad_S7;
    // assume ==>(unchecked!(@_vcc_oset_in(r1, old(_dryad_S6, dll_reach(*((r1->next)))))), ==(old(_dryad_S6, dll(*((r1->next)))), old(_dryad_S7, dll(*((r1->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#r1, ^mem_reg), F#dll_reach(SL#_dryad_S6, $rd_phys_ptr(SL#_dryad_S6, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg))) ==> F#dll(SL#_dryad_S6, $rd_phys_ptr(SL#_dryad_S6, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg)) == F#dll(SL#_dryad_S7, $rd_phys_ptr(SL#_dryad_S7, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(r1, old(_dryad_S6, dll_reach(*((r1->next)))))), ==(old(_dryad_S6, dll_reach(*((r1->next)))), old(_dryad_S7, dll_reach(*((r1->next)))))); 
    assume !$oset_in($phys_ptr_cast(L#r1, ^mem_reg), F#dll_reach(SL#_dryad_S6, $rd_phys_ptr(SL#_dryad_S6, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg))) ==> F#dll_reach(SL#_dryad_S6, $rd_phys_ptr(SL#_dryad_S6, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg)) == F#dll_reach(SL#_dryad_S7, $rd_phys_ptr(SL#_dryad_S7, mem_reg.next, $phys_ptr_cast(L#r1, ^mem_reg), ^mem_reg));
    // assume ==(old(_dryad_S6, dll(r1)), old(_dryad_S7, dll(r1))); 
    assume F#dll(SL#_dryad_S6, $phys_ptr_cast(L#r1, ^mem_reg)) == F#dll(SL#_dryad_S7, $phys_ptr_cast(L#r1, ^mem_reg));
    // assume ==(old(_dryad_S6, dll_reach(r1)), old(_dryad_S7, dll_reach(r1))); 
    assume F#dll_reach(SL#_dryad_S6, $phys_ptr_cast(L#r1, ^mem_reg)) == F#dll_reach(SL#_dryad_S7, $phys_ptr_cast(L#r1, ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(r1, old(_dryad_S6, dll_reach(r)))), ==(old(_dryad_S6, dll(r)), old(_dryad_S7, dll(r)))); 
    assume !$oset_in($phys_ptr_cast(L#r1, ^mem_reg), F#dll_reach(SL#_dryad_S6, $phys_ptr_cast(L#r, ^mem_reg))) ==> F#dll(SL#_dryad_S6, $phys_ptr_cast(L#r, ^mem_reg)) == F#dll(SL#_dryad_S7, $phys_ptr_cast(L#r, ^mem_reg));
    // assume ==>(unchecked!(@_vcc_oset_in(r1, old(_dryad_S6, dll_reach(r)))), ==(old(_dryad_S6, dll_reach(r)), old(_dryad_S7, dll_reach(r)))); 
    assume !$oset_in($phys_ptr_cast(L#r1, ^mem_reg), F#dll_reach(SL#_dryad_S6, $phys_ptr_cast(L#r, ^mem_reg))) ==> F#dll_reach(SL#_dryad_S6, $phys_ptr_cast(L#r, ^mem_reg)) == F#dll_reach(SL#_dryad_S7, $phys_ptr_cast(L#r, ^mem_reg));
    // assume ==>(!(@_vcc_ptr_eq_pure(r1, r)), @_vcc_ptr_eq_pure(*((r->file)), old(_dryad_S6, *((r->file))))); 
    assume !($phys_ptr_cast(L#r1, ^mem_reg) == $phys_ptr_cast(L#r, ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.file, $phys_ptr_cast(L#r, ^mem_reg), ^backing_file) == $rd_phys_ptr(SL#_dryad_S6, mem_reg.file, $phys_ptr_cast(L#r, ^mem_reg), ^backing_file);
    // assume ==>(!(@_vcc_ptr_eq_pure(r1, r)), ==(*((r->file_offset)), old(_dryad_S6, *((r->file_offset))))); 
    assume !($phys_ptr_cast(L#r1, ^mem_reg) == $phys_ptr_cast(L#r, ^mem_reg)) ==> $rd_inv($s, mem_reg.file_offset, $phys_ptr_cast(L#r, ^mem_reg)) == $rd_inv(SL#_dryad_S6, mem_reg.file_offset, $phys_ptr_cast(L#r, ^mem_reg));
    // assume ==>(!(@_vcc_ptr_eq_pure(r1, r)), ==(*((r->file_size)), old(_dryad_S6, *((r->file_size))))); 
    assume !($phys_ptr_cast(L#r1, ^mem_reg) == $phys_ptr_cast(L#r, ^mem_reg)) ==> $rd_inv($s, mem_reg.file_size, $phys_ptr_cast(L#r, ^mem_reg)) == $rd_inv(SL#_dryad_S6, mem_reg.file_size, $phys_ptr_cast(L#r, ^mem_reg));
    // assume ==>(!(@_vcc_ptr_eq_pure(r1, r)), ==(*((r->start_address)), old(_dryad_S6, *((r->start_address))))); 
    assume !($phys_ptr_cast(L#r1, ^mem_reg) == $phys_ptr_cast(L#r, ^mem_reg)) ==> $rd_inv($s, mem_reg.start_address, $phys_ptr_cast(L#r, ^mem_reg)) == $rd_inv(SL#_dryad_S6, mem_reg.start_address, $phys_ptr_cast(L#r, ^mem_reg));
    // assume ==>(!(@_vcc_ptr_eq_pure(r1, r)), ==(*((r->size)), old(_dryad_S6, *((r->size))))); 
    assume !($phys_ptr_cast(L#r1, ^mem_reg) == $phys_ptr_cast(L#r, ^mem_reg)) ==> $rd_inv($s, mem_reg.size, $phys_ptr_cast(L#r, ^mem_reg)) == $rd_inv(SL#_dryad_S6, mem_reg.size, $phys_ptr_cast(L#r, ^mem_reg));
    // assume ==>(!(@_vcc_ptr_eq_pure(r1, r)), @_vcc_ptr_eq_pure(*((r->prev)), old(_dryad_S6, *((r->prev))))); 
    assume !($phys_ptr_cast(L#r1, ^mem_reg) == $phys_ptr_cast(L#r, ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg) == $rd_phys_ptr(SL#_dryad_S6, mem_reg.prev, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg);
    // assume ==>(!(@_vcc_ptr_eq_pure(r1, r)), @_vcc_ptr_eq_pure(*((r->next)), old(_dryad_S6, *((r->next))))); 
    assume !($phys_ptr_cast(L#r1, ^mem_reg) == $phys_ptr_cast(L#r, ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg) == $rd_phys_ptr(SL#_dryad_S6, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg);
    // assume ==>(@_vcc_ptr_neq_null(r), ==(dll(r), &&(&&(dll(*((r->next))), ==>(@_vcc_ptr_neq_null(*((r->next))), @_vcc_ptr_eq_pure(*((*((r->next))->prev)), r))), unchecked!(@_vcc_oset_in(r, dll_reach(*((r->next)))))))); 
    assume $non_null($phys_ptr_cast(L#r, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#r, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#r, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#r, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(dll_reach(r), @_vcc_oset_union(dll_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
    assume $non_null($phys_ptr_cast(L#r, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#r, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#r, ^mem_reg)));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(dll(r), &&(&&(dll(*((r->next))), ==>(@_vcc_ptr_neq_null(*((r->next))), @_vcc_ptr_eq_pure(*((*((r->next))->prev)), r))), unchecked!(@_vcc_oset_in(r, dll_reach(*((r->next)))))))); 
    assume $non_null($phys_ptr_cast(L#r, ^mem_reg)) ==> F#dll($s, $phys_ptr_cast(L#r, ^mem_reg)) == (F#dll($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)) && ($non_null($rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)) ==> $rd_phys_ptr($s, mem_reg.prev, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg), ^mem_reg) == $phys_ptr_cast(L#r, ^mem_reg)) && !$oset_in($phys_ptr_cast(L#r, ^mem_reg), F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg))));
    // assume ==>(@_vcc_ptr_neq_null(r), ==(dll_reach(r), @_vcc_oset_union(dll_reach(*((r->next))), @_vcc_oset_singleton(r)))); 
    assume $non_null($phys_ptr_cast(L#r, ^mem_reg)) ==> F#dll_reach($s, $phys_ptr_cast(L#r, ^mem_reg)) == $oset_union(F#dll_reach($s, $rd_phys_ptr($s, mem_reg.next, $phys_ptr_cast(L#r, ^mem_reg), ^mem_reg)), $oset_singleton($phys_ptr_cast(L#r, ^mem_reg)));
    // return r; 
    $result := $phys_ptr_cast(L#r, ^mem_reg);
    assume true;
    assert $position_marker();
    goto #exit;

  anon10:
    // skip

  #exit:
}



const unique l#public: $label;

const unique #tok$3^44.3: $token;

const unique #tok$3^43.3: $token;

const unique #tok$3^41.17: $token;

const unique #tok$4^0.0: $token;

const unique #file^?3Cno?20file?3E: $token;

axiom $file_name_is(4, #file^?3Cno?20file?3E);

const unique #tok$3^39.17: $token;

const unique #tok$3^33.3: $token;

const unique #tok$3^29.3: $token;

const unique #tok$3^28.3: $token;

const unique #tok$3^27.3: $token;

const unique #tok$3^26.3: $token;

const unique #tok$3^25.3: $token;

const unique #tok$3^24.3: $token;

const unique #tok$3^23.3: $token;

const unique #tok$3^21.17: $token;

const unique #tok$3^5.3: $token;

const unique #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cos?5Cexpressos?5Cmemory_region_create_user_space_region.c: $token;

axiom $file_name_is(3, #file^Z?3A?5CInvariantSynthesis?5Csubmit?5Cos?5Cexpressos?5Cmemory_region_create_user_space_region.c);

const unique #file^Z?3A?5CInvariantSynthesis?5CDownloads?5CVCDryad?2Dbin?5CHeaders?5Cvccp.h: $token;

axiom $file_name_is(2, #file^Z?3A?5CInvariantSynthesis?5CDownloads?5CVCDryad?2Dbin?5CHeaders?5Cvccp.h);

const unique #tok$1^15.1: $token;

const unique #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cos?5Cexpressos?5Cdryad_dll_mem_reg_defs.h: $token;

axiom $file_name_is(1, #file^z?3A?5Cinvariantsynthesis?5Csubmit?5Cos?5Cexpressos?5Cdryad_dll_mem_reg_defs.h);

const unique #distTp2: $ctype;

axiom #distTp2 == $ptr_to(^mem_reg);

const unique #distTp1: $ctype;

axiom #distTp1 == $ptr_to(^backing_file);
