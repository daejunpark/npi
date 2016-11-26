#ifndef DRYAD_DLL_DEFS_H
#define DRYAD_DLL_DEFS_H

#include <vcc.h>
// ------------------------
#include <stdlib.h>

typedef
_(dryad "dll:dll_R:keys:llen_next:lseg:lseg_R:lseg_keys:lseg_len_next")
struct d_node {
  int key;
  struct d_node * prev;
  struct d_node * next;
} DLNode;


_(abstract _(dryad "base:dll") \bool dll(struct d_node * hd)
	_(reads \universe())
	_(ensures (hd == NULL) ==> \result)
	;)

_(abstract _(dryad "base:dll_R") \oset dll_reach(struct d_node * hd)
	_(reads \universe())
	_(ensures ((hd != NULL) ==> \oset_in(hd, \result))
	   		&& ((hd == NULL)  ==> (\result == \oset_empty())))
	;)

_(abstract _(dryad "base:keys") \intset dll_keys(struct d_node * hd) // [key]
	_(reads \universe())
	_(ensures (hd != NULL ==> \intset_in(hd->key, \result)))
	_(ensures (hd == NULL ==> (\result == \intset_empty())))
	;)

_(abstract _(dryad "base:llen_next") \natural dll_list_len_next(struct d_node * x)
  _(reads \universe())
  _(ensures x != NULL ==> \result > 0)
  _(ensures x == NULL ==> \result == 0)
  ;)

_(abstract _(dryad "base:lseg") \bool dll_lseg(struct d_node * hd, struct d_node * tl)
  _(reads \universe())
  _(ensures (hd == NULL && hd != tl) ==> \result)
  _(ensures hd == tl ==> \result)
  _(ensures tl == NULL ==> (\result == dll(hd)))
  _(ensures (dll(tl) && \oset_disjoint(dll_reach(tl), dll_lseg_reach(hd, tl))) ==>
             (dll(hd) 
						  && dll_keys(hd) == \intset_union(dll_keys(tl), dll_lseg_keys(hd, tl))
//						  && _dryad_keyb(hd) == \intbag_union(_dryad_keyb(tl), _dryad_lsegb(hd, tl))
              && dll_list_len_next(hd) == (dll_lseg_len_next(hd, tl) + dll_list_len_next(tl)) 
						 ) )
  _(ensures (hd != NULL /*&& hd != tl */ && dll(tl->next) 
         && \oset_disjoint(dll_reach(tl->next), dll_lseg_reach(hd, tl)) 
		     && (! \oset_in(tl, dll_reach(tl->next)) ) 
		     && (! \oset_in(tl, dll_lseg_reach(hd, tl)))   ) ==>
                   (  dll_lseg (hd, tl->next) 
				   && dll_lseg_keys(hd, tl->next) == \intset_union(\intset_singleton(tl->key), dll_lseg_keys(hd, tl)) 
//				   && _dryad_lsegb(hd, tl->next) == \intbag_union(\intbag_singleton(tl->key), _dryad_lsegb(hd, tl))
				   && dll_lseg_reach(hd, tl->next) == \oset_union(\oset_singleton(tl), dll_lseg_reach(hd, tl))   ) 
           && dll_lseg_len_next(hd, tl->next) == (dll_lseg_len_next(hd, tl) + 1) ) 
  ;)

_(abstract _(dryad "base:lseg_R") \oset dll_lseg_reach(struct d_node * hd, struct d_node * tl)
	_(reads \universe())
	_(ensures (hd == NULL && hd != tl) ==> \result == \oset_empty())
	_(ensures hd == tl ==> \result == \oset_empty())
	_(ensures (hd != NULL && hd != tl) ==> \oset_in(hd, \result))
	_(ensures tl == NULL ==> (\result == dll_reach(hd)))
  ;)

_(abstract _(dryad "base:lseg_keys") \intset dll_lseg_keys(struct d_node * hd, struct d_node * tl)
  _(reads \universe())
  _(ensures (hd != NULL && hd != tl) ==> \intset_in(hd->key, \result))
  _(ensures (hd == NULL && hd != tl) ==> (\result == \intset_empty()))
  _(ensures hd == tl   ==> (\result == \intset_empty()))
  _(ensures tl == NULL ==> (\result == dll_keys(hd)))
;)

_(abstract _(dryad "base:lseg_len_next") \natural dll_lseg_len_next(struct d_node * hd, struct d_node * tl)
  _(reads \universe())
  _(ensures hd == tl   ==> \result == 0)
  _(ensures hd == NULL ==> \result == 0)
  _(ensures hd != tl   ==> \result > 0)
  _(ensures tl == NULL ==> \result == dll_lseg_len_next(hd, tl))
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

_(logic _(dryad "unfold:keys") \bool unfold_dll_keys(struct d_node * hd) =
	(hd != NULL ==> (dll_keys(hd) == (\intset_union(dll_keys(hd->next), \intset_singleton(hd->key))))) ;)

_(logic _(dryad "unfold:llen_next") \bool unfold_dll_list_len_next(struct d_node * hd) =
    (hd != NULL ==> (dll_list_len_next(hd) == dll_list_len_next(hd->next) + 1)) ;)

_(logic \bool unfold_dll_all_un(struct d_node * x) =
	 unfold_dll(x)
    && unfold_dll_reach(x)
    && unfold_dll_keys(x)
    && unfold_dll_list_len_next(x)
	;)


_(logic _(dryad "unfold:lseg") \bool unfold_dll_lseg(struct d_node * hd, struct d_node * tl) =
  (hd != tl ==>
      (dll_lseg(hd,tl) <==> 
        (dll_lseg(hd->next,tl) && (! \oset_in(hd, dll_lseg_reach(hd->next,tl))) ) ) ) 
  ;)

_(logic _(dryad "unfold:lseg_R") \bool unfold_dll_lseg_reach(struct d_node * hd, struct d_node * tl) =
	(hd != tl ==> (dll_lseg_reach(hd, tl) == \oset_union(dll_lseg_reach(hd->next, tl), \oset_singleton(hd))) ) ;)

_(logic _(dryad "unfold:lseg_keys") \bool unfold_dll_lseg_keys(struct d_node * hd, struct d_node * tl) =
  (hd != tl ==> dll_lseg_keys(hd, tl) == 
          \intset_union(dll_lseg_keys(hd->next, tl), \intset_singleton(hd->key)) ) ;)

_(logic _(dryad "unfold:lseg_len_next") \bool unfold_dll_lseg_len_next(struct d_node * hd, struct d_node * tl) =
      (hd != tl ==> (dll_lseg_len_next(hd, tl) == (dll_lseg_len_next(hd->next, tl) + 1)))  ;)

_(logic \bool unfold_dll_all_bin(struct d_node * hd, struct d_node *  tl) =
  unfold_dll_lseg(hd, tl)
  && unfold_dll_lseg_reach(hd, tl)
  && unfold_dll_lseg_keys(hd, tl)
  && unfold_dll_lseg_len_next(hd, tl)
;)

// ----------------------------------------------------------------------------------------------------------------------------

_(logic _(dryad "same:dll") \bool same_dll(struct d_node * x, \state enter, \state exit) =
	\at(enter, dll(x)) == \at(exit, dll(x))
;)
_(logic _(dryad "same:dll_R") \bool same_dll_reach(struct d_node * x, \state enter, \state exit) = 
	\at(enter, dll_reach(x)) == \at(exit, dll_reach(x)) 
;)
_(logic _(dryad "same:keys") \bool same_dll_keys(struct d_node * x, \state enter, \state exit) =
	\at(enter, dll_keys(x)) == \at(exit, dll_keys(x))
;)
_(logic _(dryad "same:llen_next") \bool same_dll_list_len_next(struct d_node * x, \state enter, \state exit) =
	\at(enter, dll_list_len_next(x)) == \at(exit, dll_list_len_next(x))
;)
_(logic _(dryad "same:all-un") \bool same_dll_all_un(struct d_node * x, \state enter, \state exit) = 
	same_dll(x, enter, exit) 
	&& same_dll_reach(x, enter, exit)
	&& same_dll_keys(x, enter, exit)
	&& same_dll_list_len_next(x, enter, exit)
;)

_(logic _(dryad "same:lseg") 
  \bool same_dll_lseg(struct d_node * hd, struct d_node * tl, \state enter, \state exit) =
    \at(enter, dll_lseg(hd, tl)) == \at(exit, dll_lseg(hd, tl)) ;)

_(logic _(dryad "same:lseg_R") 
  \bool same_dll_lseg_reach(struct d_node * hd, struct d_node * tl, \state enter, \state exit) =
    \at(enter, dll_lseg_reach(hd, tl)) == \at(exit, dll_lseg_reach(hd, tl)) ;)

_(logic _(dryad "same:lseg_keys")
  \bool same_dll_lseg_keys(struct d_node * hd, struct d_node * tl, \state enter, \state exit) =
    \at(enter, dll_lseg_keys(hd, tl)) == \at(exit, dll_lseg_keys(hd, tl)) ;)
_(logic _(dryad "same:lseg_len_next")
  \bool same_dll_lseg_len_next(struct d_node * hd, struct d_node * tl, \state enter, \state exit) =
    \at(enter, dll_lseg_len_next(hd, tl)) == \at(exit, dll_lseg_len_next(hd, tl)) ;)

_(logic _(dryad "same:all-bin") \bool same_dll_all_un(struct d_node * hd, struct d_node * tl, \state enter, \state exit) = 
	same_dll_lseg(hd, tl, enter, exit) 
	&& same_dll_lseg_reach(hd, tl, enter, exit)
	&& same_dll_lseg_keys(hd, tl, enter, exit)
	&& same_dll_lseg_len_next(hd, tl, enter, exit)
;)


// ------------------------------------------------------------------------------------------------------

_(logic _(dryad "cond:dll") 
  \bool cond_same_dll(struct d_node * x, struct d_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, dll_reach(y)))) ==> \at(enter, dll(y)) == \at(exit, dll(y)) ;)

_(logic _(dryad "cond:dll_R") 
  \bool cond_same_dll_reach(struct d_node * x, struct d_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, dll_reach(y)))) ==> \at(enter, dll_reach(y)) == \at(exit, dll_reach(y)) ;)

_(logic _(dryad "cond:keys") 
  \bool cond_same_dll_keys(struct d_node * x, struct d_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, dll_reach(y)))) ==> \at(enter, dll_keys(y)) == \at(exit, dll_keys(y)) ;)
_(logic _(dryad "cond:llen_next") 
  \bool cond_same_dll_list_len_next(struct d_node * x, struct d_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, dll_reach(y)))) ==> \at(enter, dll_list_len_next(y)) == \at(exit, dll_list_len_next(y)) 
;)

_(logic  
  \bool cond_same_dll_all_un(struct d_node * x, struct d_node * y, \state enter, \state exit) =
  	cond_same_dll(x, y, enter, exit) 
  	&& cond_same_dll_reach(x, y, enter, exit)
  	&& cond_same_dll_keys(x, y, enter, exit) 
  	&& cond_same_dll_list_len_next(x, y, enter, exit) ;)

_(logic _(dryad "cond:lseg") 
  \bool cond_same_dll_lseg(struct d_node * x, struct d_node * hd, struct d_node * tl, 
                      \state enter, \state exit) = 
    ((! \oset_in(x, \at(enter, dll_lseg_reach(hd, tl)))) ==> 
      \at(enter, dll_lseg(hd, tl)) == \at(exit, dll_lseg(hd, tl)) ) ;)

_(logic _(dryad "cond:lseg_R") 
  \bool cond_same_dll_lseg_reach(struct d_node * x, struct d_node * hd, struct d_node * tl, 
                            \state enter, \state exit) = 
    ((! \oset_in(x, \at(enter, dll_lseg_reach(hd, tl)))) ==> 
      \at(enter, dll_lseg_reach(hd, tl)) == \at(exit, dll_lseg_reach(hd, tl)) ) ;)
_(logic _(dryad "cond:lseg_keys")
  \bool cond_same_dll_lseg_keys(struct d_node * x, struct d_node * hd, struct d_node * tl, 
                            \state enter, \state exit) =
    ((! \oset_in(x, \at(enter, dll_lseg_reach(hd, tl)))) ==>
      \at(enter, dll_lseg_keys(hd, tl)) == \at(exit, dll_lseg_keys(hd, tl))) ;)
_(logic _(dryad "cond:lseg_len_next")
  \bool cond_same_dll_lseg_len_next(struct d_node * x, struct d_node * hd, struct d_node * tl, 
                            \state enter, \state exit) =
    ((! \oset_in(x, \at(enter, dll_lseg_reach(hd, tl)))) ==>
      \at(enter, dll_lseg_len_next(hd, tl)) == \at(exit, dll_lseg_len_next(hd, tl))) ;)

_(logic  
  \bool cond_same_dll_all_bin(struct d_node * x, struct d_node * hd, struct d_node * tl, \state enter, \state exit) =
	  cond_same_dll_lseg(x, hd, tl, enter, exit) 
  	&& cond_same_dll_lseg_reach(x, hd, tl, enter, exit)
  	&& cond_same_dll_lseg_keys(x, hd, tl, enter, exit)
  	&& cond_same_dll_lseg_len_next(x, hd, tl, enter, exit)
;)

// ------------------------------------------------------------------------------------------------------

_(logic _(dryad "disj:dll") 
  \bool disj_same_dll(\oset heaplet, struct d_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, dll_reach(y)))) ==> \at(enter, dll(y)) == \at(exit, dll(y)) ;)

_(logic _(dryad "disj:dll_R") 
  \bool disj_same_dll_reach(\oset heaplet, struct d_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, dll_reach(y)))) ==> \at(enter, dll_reach(y)) == \at(exit, dll_reach(y)) ;)

_(logic _(dryad "disj:keys") 
  \bool disj_same_dll_keys(\oset heaplet, struct d_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, dll_reach(y)))) ==> \at(enter, dll_keys(y)) == \at(exit, dll_keys(y)) ;)
_(logic _(dryad "disj:llen_next") 
  \bool disj_same_dll_list_len_next(\oset heaplet, struct d_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, dll_reach(y)))) ==> \at(enter, dll_list_len_next(y)) == \at(exit, dll_list_len_next(y)) 
;)

_(logic  
  \bool disj_same_dll_all_un(\oset heaplet, struct d_node * y, \state enter, \state exit) =
  	disj_same_dll(\at(enter, heaplet), y, enter, exit) 
  	&& disj_same_dll_reach(\at(enter, heaplet), y, enter, exit)
  	&& disj_same_dll_keys(\at(enter, heaplet), y, enter, exit) 
  	&& disj_same_dll_list_len_next(\at(enter, heaplet), y, enter, exit) ;)

_(logic _(dryad "disj:lseg") 
  \bool disj_same_dll_lseg(\oset heaplet, struct d_node * hd, struct d_node * tl, 
                      \state enter, \state exit) = 
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, dll_lseg_reach(hd, tl)))) ==> 
      \at(enter, dll_lseg(hd, tl)) == \at(exit, dll_lseg(hd, tl)) ) ;)

_(logic _(dryad "disj:lseg_R") 
  \bool disj_same_dll_lseg_reach(\oset heaplet, struct d_node * hd, struct d_node * tl, 
                            \state enter, \state exit) = 
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, dll_lseg_reach(hd, tl)))) ==> 
      \at(enter, dll_lseg_reach(hd, tl)) == \at(exit, dll_lseg_reach(hd, tl)) ) ;)
_(logic _(dryad "disj:lseg_keys")
  \bool disj_same_dll_lseg_keys(\oset heaplet, struct d_node * hd, struct d_node * tl, 
                            \state enter, \state exit) =
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, dll_lseg_reach(hd, tl)))) ==>
      \at(enter, dll_lseg_keys(hd, tl)) == \at(exit, dll_lseg_keys(hd, tl))) ;)
_(logic _(dryad "disj:lseg_len_next")
  \bool disj_same_dll_lseg_len_next(\oset heaplet, struct d_node * hd, struct d_node * tl, 
                            \state enter, \state exit) =
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, dll_lseg_reach(hd, tl)))) ==>
      \at(enter, dll_lseg_len_next(hd, tl)) == \at(exit, dll_lseg_len_next(hd, tl))) ;)

_(logic  
  \bool disj_same_dll_all_bin(\oset heaplet, struct d_node * hd, struct d_node * tl, \state enter, \state exit) =
	  disj_same_dll_lseg(\at(enter, heaplet), hd, tl, enter, exit) 
  	&& disj_same_dll_lseg_reach(\at(enter, heaplet), hd, tl, enter, exit)
  	&& disj_same_dll_lseg_keys(\at(enter, heaplet), hd, tl, enter, exit)
  	&& disj_same_dll_lseg_len_next(\at(enter, heaplet), hd, tl, enter, exit)
;)


// dummy function denoting the end of dll node defs
_(abstract _(dryad "end") void end_dl_node_defs(struct d_node * x) ;)
// ---------------------------------------------------------------------------------------------------------

#endif
