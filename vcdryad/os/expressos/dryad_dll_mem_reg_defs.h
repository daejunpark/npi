#ifndef DRYAD_DLL_DEFS_H
#define DRYAD_DLL_DEFS_H

#include <vcc.h>
// ------------------------
#include <stdlib.h>

typedef
struct backing_file {
  int file_id;
} BackingFile;

typedef
_(dryad "dll:dll_R")
struct mem_reg {
  BackingFile * file;
  int file_offset;
  int file_size;
  int start_address;
  int size;
  struct mem_reg * prev;
  struct mem_reg * next;
  _(invariant file_size <= size)
} MemReg;


_(abstract _(dryad "base:dll") \bool dll(struct mem_reg * hd)
	_(reads \universe())
	_(ensures (hd == NULL) ==> \result)
	;)

_(abstract _(dryad "base:dll_R") \oset dll_reach(struct mem_reg * hd)
	_(reads \universe())
	_(ensures ((hd != NULL) ==> \oset_in(hd, \result))
			&& ((hd == NULL) ==> (\result ==\oset_empty())))
	;)


//_(abstract _(dryad "base:keys") \intset dll_keys(struct mem_reg * hd) // [key]
//	_(reads \universe())
//	_(ensures (hd != NULL ==> \intset_in(hd->key, \result)))
//	_(ensures (hd == NULL ==> (\result == \intset_empty)))
//	;)

// ----------------------------------------------------------------------------------------------------------------------------
_(logic _(dryad "unfold:dll") \bool unfold_dll(struct mem_reg * hd) =
	(hd != NULL ==>
		(dll(hd) <==> 
			(dll(hd->next) && 
			(hd->next != NULL ==> hd->next->prev == hd) &&
			(! \oset_in(hd, dll_reach(hd->next))) ) ) ) 
	;)

_(logic _(dryad "unfold:dll_R")  \bool unfold_dll_reach(struct mem_reg * hd) =
	(hd != NULL ==>	(dll_reach(hd) == \oset_union(dll_reach(hd->next), \oset_singleton(hd))) ) ;)

// -----------------------------------------------------------------------------------------------------
_(logic _(dryad "same:dll") \bool same_dll(struct mem_reg * x, \state enter, \state exit) =
	\at(enter, dll(x)) == \at(exit, dll(x))
;)
_(logic _(dryad "same:dll_R") \bool same_dll_reach(struct mem_reg * x, \state enter, \state exit) = 
	\at(enter, dll_reach(x)) == \at(exit, dll_reach(x)) 
;)
_(logic \bool same_dll_all(struct mem_reg * x, \state enter, \state exit) = 
	same_dll(x, enter, exit) 
	&& same_dll_reach(x, enter, exit)
;)
// ------------------------------------------------------------------------------------------------------

_(logic _(dryad "cond:dll") \bool cond_same_dll(struct mem_reg * x, struct mem_reg * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, dll_reach(y)))) ==> \at(enter, dll(y)) == \at(exit, dll(y))
;)
_(logic _(dryad "cond:dll_R") \bool cond_same_dll_reach(struct mem_reg * x, struct mem_reg * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, dll_reach(y)))) ==> \at(enter, dll_reach(y)) == \at(exit, dll_reach(y))
;)
_(logic \bool cond_same_dll_all(struct mem_reg * x, struct mem_reg * y, \state enter, \state exit) =
	cond_same_dll(x, y, enter, exit) 
	&& cond_same_dll_reach(x, y, enter, exit)
;)

// ------------- disj ------------------------------------------------------------------------
_(logic _(dryad "disj:dll") \bool disj_same_dll(\oset heaplet, struct mem_reg * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, dll_reach(y)))) ==> \at(enter, dll(y)) == \at(exit, dll(y))
;)
_(logic _(dryad "disj:dll_R") \bool disj_same_dll_reach(\oset heaplet, struct mem_reg * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, dll_reach(y)))) ==> \at(enter, dll_reach(y)) == \at(exit, dll_reach(y))
;)
_(logic \bool disj_same_dll_all(\oset heaplet, struct mem_reg * y, \state enter, \state exit) =
	disj_same_dll(\at(enter, heaplet), y, enter, exit) 
	&& disj_same_dll_reach(\at(enter, heaplet), y, enter, exit)
;)


// dummy function denoting the end of dl_node defs
_(abstract _(dryad "end") void end_dl_node_defs(struct mem_reg * x) ;)
// ---------------------------------------------------------------------------------------------------------

#endif
