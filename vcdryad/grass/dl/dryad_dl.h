#ifndef DRYAD_DLL_DEFS_H
#define DRYAD_DLL_DEFS_H

#include <vcc.h>
// ------------------------
#include <stdlib.h>

typedef
_(dryad "dll:dll_R:dll_lseg:dll_lseg_R")
struct d_node {
  struct d_node * prev;
  struct d_node * next;
} DLNode;

_(abstract _(dryad "base:dll") \bool dll(struct d_node * hd)
	_(reads \universe())
	_(ensures (hd == NULL) ==> \result)
	;)

_(abstract _(dryad "base:dll_R") \oset dll_reach(struct d_node * hd)
	_(reads \universe())
	_(ensures  ((hd != NULL) ==> \oset_in(hd, \result))
  	   		&& ((hd == NULL)  ==> (\result == \oset_empty())))
	;)

_(abstract _(dryad "base:dll_lseg") \bool dll_lseg(struct d_node * hd, struct d_node * tl)
  _(reads \universe())
  _(ensures (hd == NULL && hd != tl) ==> \result)
  _(ensures hd == tl ==> \result)
  _(ensures tl == NULL ==> (\result == dll(hd)))
  _(ensures (hd != NULL && dll(tl) && \oset_disjoint(dll_reach(tl), dll_lseg_reach(hd, tl))) ==>
             (dll(hd) 
              && dll_reach(hd) == \oset_union(dll_lseg_reach(hd, tl), dll_reach(tl))
						 ) )
  _(ensures (hd != NULL && tl != NULL && dll(tl->next) && dll_lseg(hd, tl)
         && \oset_disjoint(dll_reach(tl->next), dll_lseg_reach(hd, tl)) 
		     && (! \oset_in(tl, dll_reach(tl->next)) ) 
		     && (! \oset_in(tl, dll_lseg_reach(hd, tl)))   ) ==>
                (  \oset_in(tl, dll_reach(hd))
                   && dll_lseg(hd, tl->next) 
	         			   && dll_lseg_reach(hd, tl->next) == \oset_union(\oset_singleton(tl), dll_lseg_reach(hd, tl))  ) ) 
  ;)

_(abstract _(dryad "base:dll_lseg_R") \oset dll_lseg_reach(struct d_node * hd, struct d_node * tl)
	_(reads \universe())
	_(ensures hd == tl ==> \result == \oset_empty())
	_(ensures (hd == NULL && hd != tl) ==> \result == \oset_empty())
	_(ensures (hd != NULL && hd != tl) ==> \oset_in(hd, \result))
	_(ensures (hd != NULL && tl == NULL) ==> (\result == dll_reach(hd)))
  ;)

// ----------------------------------------------------------------------------------------------------------------------------
_(logic _(dryad "unfold:dll") \bool unfold_dll(struct d_node * hd) =
	(hd != NULL ==>
		(dll(hd) <==> 
			(dll(hd->next) && 
			(hd->next != NULL ==> hd->next->prev == hd) &&
			(! \oset_in(hd, dll_reach(hd->next))) ) ) ) 
	;)

_(logic _(dryad "unfold:dll_R")  \bool unfold_dll_reach(struct d_node * hd) =
	(hd != NULL ==>	(dll_reach(hd) == \oset_union(dll_reach(hd->next), \oset_singleton(hd))) ) 	;)

_(logic \bool unfold_dll_alln_un(struct d_node * x) =
	 unfold_dll(x)
    && unfold_dll_reach(x)
	;)


_(logic _(dryad "unfold:dll_lseg") \bool unfold_dll_lseg(struct d_node * hd, struct d_node * tl) =
  (hd != tl ==>
      (dll_lseg(hd,tl) <==> 
        (dll_lseg(hd->next,tl) && (! \oset_in(hd, dll_lseg_reach(hd->next,tl))) ) ) ) 
  ;)

_(logic _(dryad "unfold:dll_lseg_R") \bool unfold_dll_lseg_reach(struct d_node * hd, struct d_node * tl) =
	(hd != tl ==> (dll_lseg_reach(hd, tl) == \oset_union(dll_lseg_reach(hd->next, tl), \oset_singleton(hd))) ) ;)

// ----------------------------------------------------------------------------------------------------------------------------

_(logic _(dryad "same:dll") \bool same_dll(struct d_node * x, \state enter, \state exit) =
	\at(enter, dll(x)) == \at(exit, dll(x))
;)
_(logic _(dryad "same:dll_R") \bool same_dll_reach(struct d_node * x, \state enter, \state exit) = 
	\at(enter, dll_reach(x)) == \at(exit, dll_reach(x)) 
;)
_(logic \bool same_dll_alln_un(struct d_node * x, \state enter, \state exit) = 
	same_dll(x, enter, exit) 
	&& same_dll_reach(x, enter, exit)
;)

_(logic _(dryad "same:dll_lseg") 
  \bool same_dll_lseg(struct d_node * hd, struct d_node * tl, \state enter, \state exit) =
    \at(enter, dll_lseg(hd, tl)) == \at(exit, dll_lseg(hd, tl)) ;)

_(logic _(dryad "same:dll_lseg_R") 
  \bool same_dll_lseg_reach(struct d_node * hd, struct d_node * tl, \state enter, \state exit) =
    \at(enter, dll_lseg_reach(hd, tl)) == \at(exit, dll_lseg_reach(hd, tl)) ;)

_(logic \bool same_dll_alln_un(struct d_node * hd, struct d_node * tl, \state enter, \state exit) = 
	same_dll_lseg(hd, tl, enter, exit) 
	&& same_dll_lseg_reach(hd, tl, enter, exit)
;)


// ------------------------------------------------------------------------------------------------------

_(logic _(dryad "cond:dll") 
  \bool cond_same_dll(struct d_node * x, struct d_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, dll_reach(y)))) ==> \at(enter, dll(y)) == \at(exit, dll(y)) ;)

_(logic _(dryad "cond:dll_R") 
  \bool cond_same_dll_reach(struct d_node * x, struct d_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, dll_reach(y)))) ==> \at(enter, dll_reach(y)) == \at(exit, dll_reach(y)) ;)

/*
_(logic
  \bool cond_same_dll_alln_un(struct d_node * x, struct d_node * y, \state enter, \state exit) =
  	cond_same_dll(x, y, enter, exit) 
  	&& cond_same_dll_reach(x, y, enter, exit) ;) */

_(logic _(dryad "cond:dll_lseg") 
  \bool cond_same_dll_lseg(struct d_node * x, struct d_node * hd, struct d_node * tl, 
                      \state enter, \state exit) = 
    ((! \oset_in(x, \at(enter, dll_lseg_reach(hd, tl)))) ==> 
      \at(enter, dll_lseg(hd, tl)) == \at(exit, dll_lseg(hd, tl)) ) ;)

_(logic _(dryad "cond:dll_lseg_R") 
  \bool cond_same_dll_lseg_reach(struct d_node * x, struct d_node * hd, struct d_node * tl, 
                            \state enter, \state exit) = 
    ((! \oset_in(x, \at(enter, dll_lseg_reach(hd, tl)))) ==> 
      \at(enter, dll_lseg_reach(hd, tl)) == \at(exit, dll_lseg_reach(hd, tl)) ) ;)

_(logic
  \bool cond_same_dll_alln_bin(struct d_node * x, struct d_node * hd, struct d_node * tl, \state enter, \state exit) =
	  cond_same_dll_lseg(x, hd, tl, enter, exit) 
  	&& cond_same_dll_lseg_reach(x, hd, tl, enter, exit)
;)

// ----------------   disjoint    ----------------------------------------------------------------

_(logic _(dryad "disj:dll") 
  \bool disj_same_dll(\oset heaplet, struct d_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, dll_reach(y)))) ==> \at(enter, dll(y)) == \at(exit, dll(y)) ;)

_(logic _(dryad "disj:dll_R") 
  \bool disj_same_dll_reach(\oset heaplet, struct d_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, dll_reach(y)))) ==> \at(enter, dll_reach(y)) == \at(exit, dll_reach(y)) ;)

_(logic _(dryad "disj:dll_lseg") 
  \bool disj_same_dll_lseg(\oset heaplet, struct d_node * hd, struct d_node * tl, 
                      \state enter, \state exit) = 
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, dll_lseg_reach(hd, tl)))) ==> 
      \at(enter, dll_lseg(hd, tl)) == \at(exit, dll_lseg(hd, tl)) ) ;)

_(logic _(dryad "disj:dll_lseg_R") 
  \bool disj_same_dll_lseg_reach(\oset heaplet, struct d_node * hd, struct d_node * tl, 
                            \state enter, \state exit) = 
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, dll_lseg_reach(hd, tl)))) ==> 
      \at(enter, dll_lseg_reach(hd, tl)) == \at(exit, dll_lseg_reach(hd, tl)) ) ;)

// *************************************************************************************

// dummy function denoting the end of dll node defs
_(abstract _(dryad "end") void end_dl_node_defs(struct d_node * x) ;)
// ---------------------------------------------------------------------------------------------------------

_(logic \bool mutable_list(struct s_node * x) =  ((x != NULL) ==> (\mutable(x) && \writable(x))))

#endif
