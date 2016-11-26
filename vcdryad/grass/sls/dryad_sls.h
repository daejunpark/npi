#ifndef DRYAD_SRTL_DEFS_H
#define DRYAD_SRTL_DEFS_H

#include <vcc.h>
// ------------------------
#include <stdlib.h>
//#include "intset_defs.h"
//#include "intbag_defs.h"

_(int _(_boogie0) \int_max(int x, int y))
_(int _(_boogie0) \int_min(int x, int y))

typedef
_(dryad "sll:srtl:rsrtl:sll_R:srtl_R:rsrtl_R:keys:sll_min_key:sll_max_key:llen_next:lseg:slseg:lseg_R:slseg_R:lseg_keys:sll_lseg_min_key:sll_lseg_max_key:lseg_len_next")
struct s_node {
  int key;
  struct s_node * next;
} Node;


_(abstract _(dryad "base:sll") \bool sll(struct s_node * hd)
	_(reads \universe())
	_(ensures (hd == NULL) ==> \result)
;)
_(abstract _(dryad "base:srtl") \bool srtl(struct s_node * hd)
	_(reads \universe())
	_(ensures (hd == NULL) ==> \result)
	_(ensures (hd != NULL && hd->next == NULL) ==> \result)
    //
  //_(ensures (hd != NULL && \result) ==> sll_min_key(hd) == hd->key)
;)
_(abstract _(dryad "base:rsrtl") \bool rsrtl(struct s_node * hd)
	_(reads \universe())
	_(ensures (hd == NULL) ==> \result)
	_(ensures (hd != NULL && hd->next == NULL) ==> \result)
    //
  //_(ensures (hd != NULL && \result) ==> sll_max_key(hd) == hd->key)
;)


_(abstract _(dryad "base:sll_R") \oset sll_reach(struct s_node * hd)
	_(reads \universe())
	_(ensures ((hd != NULL) ==> \oset_in(hd, \result))
			&& ((hd == NULL) ==> (\result == \oset_empty())))
;)
_(abstract _(dryad "base:srtl_R") \oset srtl_reach(struct s_node * hd)
	_(reads \universe())
	_(ensures ((hd != NULL) ==> \oset_in(hd, \result))
			&& ((hd == NULL) ==> (\result == \oset_empty())))
;)
_(abstract _(dryad "base:rsrtl_R") \oset rsrtl_reach(struct s_node * hd)
	_(reads \universe())
	_(ensures ((hd != NULL) ==> \oset_in(hd, \result))
			&& ((hd == NULL) ==> (\result == \oset_empty())))
;)

_(abstract _(dryad "base:keys") \intset sll_keys(struct s_node * hd) // [key]
	_(reads \universe())
	_(ensures (hd != NULL ==> \intset_in(hd->key, \result)))
	_(ensures (hd == NULL ==> (\result == \intset_empty())))
	;)

_(abstract _(dryad "base:sll_min_key") int sll_min_key(struct s_node * hd)
    _(reads \universe())
    _(ensures ((hd != NULL && hd->next == NULL) ==> (\result == hd->key)))
;)

_(abstract _(dryad "base:sll_max_key") int sll_max_key(struct s_node * hd)
    _(reads \universe())
    _(ensures ((hd != NULL && hd->next == NULL) ==> (\result == hd->key)))
;)

_(abstract _(dryad "base:llen_next") \natural sll_list_len_next(struct s_node * x)
  _(reads \universe())
  _(ensures x != NULL ==> \result > 0)
  _(ensures x == NULL ==> \result == 0)
  ;)

_(abstract _(dryad "base:lseg") \bool sll_lseg(struct s_node * hd, struct s_node * tl)
  _(reads \universe())
  _(ensures tl == NULL ==> (\result == sll(hd)))
  _(ensures hd == tl ==> \result)
  //
//_(ensures (hd != NULL && hd != tl && \result) ==> sll_lseg_min_key(hd) == hd->key)
  //
  _(ensures \result ==> \oset_disjoint(sll_lseg_reach(hd,tl), \oset_singleton(tl)))
  _(ensures (\result && sll(tl)) ==> (
               sll(hd)
            && sll_reach(hd) == \oset_union(sll_lseg_reach(hd,tl), sll_reach(tl))
            && sll_keys(hd) == \intset_union(sll_lseg_keys(hd,tl), sll_keys(tl))
            && sll_list_len_next(hd) == sll_lseg_len_next(hd,tl) + sll_list_len_next(tl)
            ))
  _(ensures (\result && tl != NULL
            && tl->next != tl
            && tl->next != hd
            && (! \oset_in(tl->next, sll_lseg_reach(hd,tl)))
            ) ==> (
               sll_lseg(hd,tl->next)
            && sll_lseg_reach(hd,tl->next) == \oset_union(sll_lseg_reach(hd,tl), \oset_singleton(tl))
            && sll_lseg_keys(hd,tl->next) == \intset_union(sll_lseg_keys(hd,tl), \intset_singleton(tl->key))
            && sll_lseg_len_next(hd,tl->next) == sll_lseg_len_next(hd,tl) + 1
            ))
  ;)

_(abstract _(dryad "base:slseg") \bool srtl_lseg(struct s_node * hd, struct s_node * tl)
  _(reads \universe())
  _(ensures tl == NULL ==> (\result == srtl(hd)))
  _(ensures hd == tl ==> \result)
  _(ensures (hd != NULL && hd != tl && hd->next == tl) ==> \result)
  //
  _(ensures \result ==> \oset_disjoint(srtl_lseg_reach(hd,tl), \oset_singleton(tl)))
  _(ensures (\result && srtl(tl)
            && hd != tl && tl != NULL
            && sll_lseg_max_key(hd,tl) <= sll_min_key(tl)
            ) ==> (
               srtl(hd)
            && srtl_reach(hd) == \oset_union(srtl_lseg_reach(hd,tl), srtl_reach(tl))
            && sll_keys(hd) == \intset_union(sll_lseg_keys(hd,tl), sll_keys(tl))
            && sll_list_len_next(hd) == sll_lseg_len_next(hd,tl) + sll_list_len_next(tl)
            && sll_min_key(hd) == sll_lseg_min_key(hd,tl)
            && sll_max_key(hd) == sll_max_key(tl)
            ))
  _(ensures (\result && tl != NULL
            && hd != tl
            && tl->next != tl
          //&& tl->next != hd // redundant
            && (! \oset_in(tl->next, sll_lseg_reach(hd,tl)))
            && sll_lseg_max_key(hd,tl) <= tl->key
            ) ==> (
               srtl_lseg(hd,tl->next)
            && srtl_lseg_reach(hd,tl->next) == \oset_union(sll_lseg_reach(hd,tl), \oset_singleton(tl))
            && sll_lseg_keys(hd,tl->next) == \intset_union(sll_lseg_keys(hd,tl), \intset_singleton(tl->key))
            && sll_lseg_len_next(hd,tl->next) == sll_lseg_len_next(hd,tl) + 1
            && sll_lseg_min_key(hd,tl->next) == sll_lseg_min_key(hd,tl)
            && sll_lseg_max_key(hd,tl->next) == tl->key
            ))
  _(ensures (\result && tl != NULL
            && hd == tl
            && tl->next != tl
          //&& tl->next != hd // redundant
          //&& (! \oset_in(tl->next, sll_lseg_reach(hd,tl)))
          //&& sll_lseg_max_key(hd,tl) <= tl->key
            ) ==> (
               srtl_lseg(hd,tl->next)
            && srtl_lseg_reach(hd,tl->next) == \oset_singleton(tl)
            && sll_lseg_keys(hd,tl->next) == \intset_singleton(tl->key)
            && sll_lseg_len_next(hd,tl->next) == 1
            && sll_lseg_min_key(hd,tl->next) == tl->key
            && sll_lseg_max_key(hd,tl->next) == tl->key
            ))
  ;)

/*
(hd != NULL && hd->next != hd) ==>
   srtl_lseg(hd,hd->next)
&& srtl_lseg_reach(hd,hd->next) == \oset_singleton(hd)
&& sll_lseg_keys(hd,hd->next) == \intset_singleton(hd->key)
&& sll_lseg_len_next(hd,hd->next) == 1
&& sll_lseg_min_key(hd,hd->next) == hd->key
&& sll_lseg_max_key(hd,hd->next) == hd->key
*/

_(abstract _(dryad "base:lseg_R") \oset sll_lseg_reach(struct s_node * hd, struct s_node * tl)
	_(reads \universe())
	_(ensures tl == NULL ==> (\result == sll_reach(hd)))
	_(ensures hd == tl ==> (\result == \oset_empty()))
	_(ensures (hd != NULL && hd != tl) ==> \oset_in(hd, \result))
;)
_(abstract _(dryad "base:slseg_R") \oset srtl_lseg_reach(struct s_node * hd, struct s_node * tl)
	_(reads \universe())
	_(ensures tl == NULL ==> (\result == srtl_reach(hd)))
	_(ensures hd == tl ==>   (\result == \oset_empty()))
	_(ensures (hd != NULL && hd != tl) ==> \oset_in(hd, \result))
;)

_(abstract _(dryad "base:lseg_keys") \intset sll_lseg_keys(struct s_node * hd, struct s_node * tl)
  _(reads \universe())
  _(ensures tl == NULL ==> (\result == sll_keys(hd)))
  _(ensures hd == tl   ==> (\result == \intset_empty()))
  _(ensures (hd != NULL && hd != tl)   ==> \intset_in(hd->key, \result))
;)

_(abstract _(dryad "base:sll_lseg_min_key") int sll_lseg_min_key(struct s_node * hd, struct s_node * tl)
    _(reads \universe())
    _(ensures tl == NULL ==> (\result == sll_min_key(hd)))
    _(ensures ((hd != NULL && hd != tl && hd->next == tl) ==> (\result == hd->key)))
;)

_(abstract _(dryad "base:sll_lseg_max_key") int sll_lseg_max_key(struct s_node * hd, struct s_node * tl)
    _(reads \universe())
    _(ensures tl == NULL ==> (\result == sll_max_key(hd)))
    _(ensures ((hd != NULL && hd != tl && hd->next == tl) ==> (\result == hd->key)))
;)


_(abstract _(dryad "base:lseg_len_next") \natural sll_lseg_len_next(struct s_node * hd, struct s_node * tl)
  _(reads \universe())
  _(ensures tl == NULL ==> \result == sll_list_len_next(hd))
  _(ensures hd == tl   ==> \result == 0)
  _(ensures (hd != NULL && hd != tl)   ==> \result > 0)
;)

// ----------------------------------------------------------------------------------------------------------------------------
_(logic _(dryad "unfold:sll") \bool unfold_sll(struct s_node * hd) =
	(hd != NULL ==>
		(sll(hd) <==> 
			(sll(hd->next) && 
			(! \oset_in(hd, sll_reach(hd->next))) ) )  )
;)
_(logic _(dryad "unfold:srtl") \bool unfold_srtl(struct s_node * hd) =
	((hd != NULL && hd->next != NULL) ==>
		(srtl(hd) <==> 
			(srtl(hd->next) 
        && (! \oset_in(hd, srtl_reach(hd->next)))
        &&    hd->key <= sll_min_key(hd->next) ) ) )
;)
_(logic _(dryad "unfold:rsrtl") \bool unfold_rsrtl(struct s_node * hd) =
	((hd != NULL && hd->next != NULL) ==>
		(rsrtl(hd) <==> 
			(rsrtl(hd->next) 
        && !(\oset_in(hd, rsrtl_reach(hd->next)))
        &&    hd->key >= sll_max_key(hd->next) ) ) )
;)

_(logic _(dryad "unfold:sll_R") \bool unfold_sll_reach(struct s_node * hd) =
	(hd != NULL ==>
		(sll_reach(hd) == \oset_union(sll_reach(hd->next), \oset_singleton(hd))) ) 
	;)
_(logic _(dryad "unfold:srtl_R") \bool unfold_srtl_reach(struct s_node * hd) =
	(hd != NULL ==>
		(srtl_reach(hd) == \oset_union(srtl_reach(hd->next), \oset_singleton(hd))) ) 
;)
_(logic _(dryad "unfold:rsrtl_R") \bool unfold_rsrtl_reach(struct s_node * hd) =
	(hd != NULL ==>
		(rsrtl_reach(hd) == \oset_union(rsrtl_reach(hd->next), \oset_singleton(hd))) ) 
;)

_(logic _(dryad "unfold:keys") \bool unfold_sll_keys(struct s_node * hd) =
		(hd != NULL ==> (sll_keys(hd) == (\intset_union(sll_keys(hd->next), \intset_singleton(hd->key)))))
;)

_(logic _(dryad "unfold:sll_min_key") \bool unfold_sll_min_key(struct s_node * hd) =
    ((hd != NULL && hd->next != NULL) ==> (sll_min_key(hd) == \int_min(hd->key, sll_min_key(hd->next))))
;)

_(logic _(dryad "unfold:sll_max_key") \bool unfold_sll_max_key(struct s_node * hd) =
    ((hd != NULL && hd->next != NULL) ==> (sll_max_key(hd) == \int_max(hd->key, sll_max_key(hd->next))))
;)

_(logic _(dryad "unfold:llen_next") \bool unfold_sll_list_len_next(struct s_node * hd) =
    (hd != NULL ==> (sll_list_len_next(hd) == sll_list_len_next(hd->next) + 1))  
;)

_(logic \bool unfold_sll_all_un(struct s_node * x) =
  unfold_sll(x)
  && unfold_sll_reach(x)
	&& unfold_sll_keys(x)
  && unfold_sll_min_key(x)
  && unfold_sll_max_key(x)
  && unfold_sll_list_len_next(x)
;)
_(logic \bool unfold_srtl_all_un(struct s_node * x) =
  unfold_srtl(x)
	&& unfold_srtl_reach(x)
	&& unfold_sll_keys(x)
  && unfold_sll_min_key(x)
  && unfold_sll_max_key(x)
  && unfold_sll_list_len_next(x)
;)


_(logic _(dryad "unfold:lseg") \bool unfold_sll_lseg(struct s_node * hd, struct s_node * tl) =
  ((hd != NULL && hd != tl) ==>
      (sll_lseg(hd,tl) <==> 
        (sll_lseg(hd->next,tl) && (! \oset_in(hd, sll_lseg_reach(hd->next,tl))) ) ) )
;)
_(logic _(dryad "unfold:slseg") \bool unfold_srtl_lseg(struct s_node * hd, struct s_node * tl) =
  ((hd != NULL && hd != tl && hd->next != tl) ==>
      (srtl_lseg(hd,tl) <==> 
        (srtl_lseg(hd->next,tl) 
        && (! \oset_in(hd, srtl_lseg_reach(hd->next,tl))) 
        &&    hd->key <= sll_lseg_min_key(hd->next,tl) ) ) )
  ;)

_(logic _(dryad "unfold:lseg_R") \bool unfold_sll_lseg_reach(struct s_node * hd, struct s_node * tl) =
	((hd != NULL && hd != tl) ==> 
       (sll_lseg_reach(hd, tl) == \oset_union(sll_lseg_reach(hd->next, tl), \oset_singleton(hd))) ) 
;)
_(logic _(dryad "unfold:slseg_R") \bool unfold_srtl_lseg_reach(struct s_node * hd, struct s_node * tl) =
  ((hd != NULL && hd != tl) ==> 
       ((srtl_lseg_reach(hd, tl) == \oset_union(srtl_lseg_reach(hd->next, tl), \oset_singleton(hd))) ) )
 ;)

_(logic _(dryad "unfold:lseg_keys") \bool unfold_sll_lseg_keys(struct s_node * hd, struct s_node * tl) =
      ((hd != NULL && hd != tl) ==> (sll_lseg_keys(hd, tl) ==
          \intset_union(sll_lseg_keys(hd->next, tl), \intset_singleton(hd->key)) ) )
;)

_(logic _(dryad "unfold:sll_lseg_min_key") \bool unfold_sll_lseg_min_key(struct s_node * hd, struct s_node * tl) =
    ((hd != NULL && hd != tl && hd->next != tl) ==> (sll_lseg_min_key(hd,tl) == \int_min(hd->key, sll_lseg_min_key(hd->next,tl))))
;)

_(logic _(dryad "unfold:sll_lseg_max_key") \bool unfold_sll_lseg_max_key(struct s_node * hd, struct s_node * tl) =
    ((hd != NULL && hd != tl && hd->next != tl) ==> (sll_lseg_max_key(hd,tl) == \int_max(hd->key, sll_lseg_max_key(hd->next,tl))))
;)

_(logic _(dryad "unfold:lseg_len_next") \bool unfold_sll_lseg_len_next(struct s_node * hd, struct s_node * tl) =
      ((hd != NULL && hd != tl) ==> (sll_lseg_len_next(hd, tl) == (sll_lseg_len_next(hd->next, tl) + 1)))  ;)

_(logic \bool unfold_sll_all_bin(struct s_node * hd, struct s_node *  tl) =
  unfold_sll_lseg(hd, tl)
  && unfold_sll_lseg_reach(hd, tl)
  && unfold_sll_lseg_keys(hd, tl)
  && unfold_sll_lseg_min_key(hd, tl)
  && unfold_sll_lseg_max_key(hd, tl)
  && unfold_sll_lseg_len_next(hd, tl)
;)
_(logic \bool unfold_srtl_all_bin(struct s_node * hd, struct s_node *  tl) =
  unfold_srtl_lseg(hd, tl)
  && unfold_srtl_lseg_reach(hd, tl)
  && unfold_sll_lseg_keys(hd, tl)
  && unfold_sll_lseg_min_key(hd, tl)
  && unfold_sll_lseg_max_key(hd, tl)
  && unfold_sll_lseg_len_next(hd, tl)
;)

// ----------------------------------------------------------------------------------------------------------------------------

// axioms needed to complete the proof
//_(axiom \forall \objset os1, os2; \disjoint(os1, os2) <==> \subset(os1, (\universe() \diff os2)))
//_(axiom \forall \objset os1, os2; \forall \object o; (os1 == (os2 \union {o})) ==> \subset(os2, os1)) // [sll-reverse]

// -----------------------------------------------------------------------------------------------------
_(logic _(dryad "same:sll") \bool same_sll(struct s_node * x, \state enter, \state exit) =
	\at(enter, sll(x)) == \at(exit, sll(x))
;)
_(logic _(dryad "same:srtl") \bool same_srtl(struct s_node * x, \state enter, \state exit) =
	\at(enter, srtl(x)) == \at(exit, srtl(x))
;)
_(logic _(dryad "same:rsrtl") \bool same_rsrtl(struct s_node * x, \state enter, \state exit) =
	\at(enter, rsrtl(x)) == \at(exit, rsrtl(x))
;)
_(logic _(dryad "same:sll_R") \bool same_sll_reach(struct s_node * x, \state enter, \state exit) = 
	(\at(enter, sll_reach(x)) == \at(exit, sll_reach(x))) 
;)
_(logic _(dryad "same:srtl_R") \bool same_srtl_reach(struct s_node * x, \state enter, \state exit) = 
	(\at(enter, srtl_reach(x)) == \at(exit, srtl_reach(x)))
;)
_(logic _(dryad "same:rsrtl_R") \bool same_rsrtl_reach(struct s_node * x, \state enter, \state exit) = 
	(\at(enter, rsrtl_reach(x)) == \at(exit, rsrtl_reach(x)))
;)
_(logic _(dryad "same:keys") \bool same_sll_keys(struct s_node * x, \state enter, \state exit) =
	(\at(enter, sll_keys(x)) == \at(exit, sll_keys(x)))
;)
_(logic _(dryad "same:sll_min_key") \bool same_sll_min_key(struct s_node * x, \state enter, \state exit) =
	(\at(enter, sll_min_key(x)) == \at(exit, sll_min_key(x)))
;)
_(logic _(dryad "same:sll_max_key") \bool same_sll_max_key(struct s_node * x, \state enter, \state exit) =
	(\at(enter, sll_max_key(x)) == \at(exit, sll_max_key(x)))
;)
_(logic _(dryad "same:llen_next") \bool same_sll_list_len_next(struct s_node * x, \state enter, \state exit) =
	\at(enter, sll_list_len_next(x)) == \at(exit, sll_list_len_next(x))
;)
_(logic \bool same_sll_all_un(struct s_node * x, \state enter, \state exit) = 
	same_sll(x, enter, exit) 
	&& same_sll_reach(x, enter, exit)
	&& same_sll_keys(x, enter, exit)
	&& same_sll_min_key(x, enter, exit)
	&& same_sll_max_key(x, enter, exit)
	&& same_sll_list_len_next(x, enter, exit)
;)
_(logic \bool same_srtl_all_un(struct s_node * x, \state enter, \state exit) = 
	same_srtl(x, enter, exit) 
	&& same_srtl_reach(x, enter, exit)
	&& same_sll_keys(x, enter, exit)
	&& same_sll_min_key(x, enter, exit)
	&& same_sll_max_key(x, enter, exit)
	&& same_sll_list_len_next(x, enter, exit)
;)

_(logic _(dryad "same:lseg") 
  \bool same_sll_lseg(struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
    \at(enter, sll_lseg(hd, tl)) == \at(exit, sll_lseg(hd, tl)) ;)
_(logic _(dryad "same:slseg") 
  \bool same_srtl_lseg(struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
    \at(enter, srtl_lseg(hd, tl)) == \at(exit, srtl_lseg(hd, tl)) ;)

_(logic _(dryad "same:lseg_R") 
  \bool same_sll_lseg_reach(struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
    (\at(enter, sll_lseg_reach(hd, tl)) == \at(exit, sll_lseg_reach(hd, tl))) ;)
_(logic _(dryad "same:slseg_R") 
  \bool same_srtl_lseg_reach(struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
    (\at(enter, srtl_lseg_reach(hd, tl) == \at(exit, srtl_lseg_reach(hd, tl)))) ;)

_(logic _(dryad "same:lseg_keys")
  \bool same_sll_lseg_keys(struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
    (\at(enter, sll_lseg_keys(hd, tl)) == \at(exit, sll_lseg_keys(hd, tl))) ;)
_(logic _(dryad "same:sll_lseg_min_key")
  \bool same_sll_lseg_min_key(struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
    (\at(enter, sll_lseg_min_key(hd, tl)) == \at(exit, sll_lseg_min_key(hd, tl))) ;)
_(logic _(dryad "same:sll_lseg_max_key")
  \bool same_sll_lseg_max_key(struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
    (\at(enter, sll_lseg_max_key(hd, tl)) == \at(exit, sll_lseg_max_key(hd, tl))) ;)
_(logic _(dryad "same:lseg_len_next")
  \bool same_sll_lseg_len_next(struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
    \at(enter, sll_lseg_len_next(hd, tl)) == \at(exit, sll_lseg_len_next(hd, tl)) ;)

_(logic \bool same_sll_all_bin(struct s_node * hd, struct s_node * tl, \state enter, \state exit) = 
	same_sll_lseg(hd, tl, enter, exit) 
	&& same_sll_lseg_reach(hd, tl, enter, exit)
	&& same_sll_lseg_keys(hd, tl, enter, exit)
	&& same_sll_lseg_min_key(hd, tl, enter, exit)
	&& same_sll_lseg_max_key(hd, tl, enter, exit)
	&& same_sll_lseg_len_next(hd, tl, enter, exit)
;)
_(logic \bool same_srtl_all_bin(struct s_node * hd, struct s_node * tl, \state enter, \state exit) = 
	same_srtl_lseg(hd, tl, enter, exit) 
	&& same_srtl_lseg_reach(hd, tl, enter, exit)
	&& same_sll_lseg_keys(hd, tl, enter, exit)
	&& same_sll_lseg_min_key(hd, tl, enter, exit)
	&& same_sll_lseg_max_key(hd, tl, enter, exit)
	&& same_sll_lseg_len_next(hd, tl, enter, exit)
;)


// ------------------------------------------------------------------------------------------------------
_(logic _(dryad "cond:sll") 
  \bool cond_same_sll(struct s_node * x, struct s_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, sll_reach(y)))) ==> \at(enter, sll(y)) == \at(exit, sll(y)) ;)
_(logic _(dryad "cond:srtl") 
  \bool cond_same_srtl(struct s_node * x, struct s_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, srtl_reach(y)))) ==> \at(enter, srtl(y)) == \at(exit, srtl(y)) ;)
_(logic _(dryad "cond:rsrtl") 
  \bool cond_same_rsrtl(struct s_node * x, struct s_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, rsrtl_reach(y)))) ==> \at(enter, rsrtl(y)) == \at(exit, rsrtl(y)) ;)

_(logic _(dryad "cond:sll_R") 
  \bool cond_same_sll_reach(struct s_node * x, struct s_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, sll_reach(y)))) ==> (\at(enter, sll_reach(y)) == \at(exit, sll_reach(y))) ;)
_(logic _(dryad "cond:srtl_R") 
  \bool cond_same_srtl_reach(struct s_node * x, struct s_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, srtl_reach(y)))) ==> (\at(enter, srtl_reach(y)) == \at(exit, srtl_reach(y))) ;)
_(logic _(dryad "cond:rsrtl_R") 
  \bool cond_same_rsrtl_reach(struct s_node * x, struct s_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, rsrtl_reach(y)))) ==> (\at(enter, rsrtl_reach(y)) == \at(exit, rsrtl_reach(y))) ;)

_(logic _(dryad "cond:keys") 
  \bool cond_same_sll_keys(struct s_node * x, struct s_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, sll_reach(y)))) ==> (\at(enter, sll_keys(y)) == \at(exit, sll_keys(y))) ;)
_(logic _(dryad "cond:sll_min_key") 
  \bool cond_same_sll_min_key(struct s_node * x, struct s_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, sll_reach(y)))) ==> (\at(enter, sll_min_key(y)) == \at(exit, sll_min_key(y))) ;)
_(logic _(dryad "cond:sll_max_key") 
  \bool cond_same_sll_max_key(struct s_node * x, struct s_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, sll_reach(y)))) ==> (\at(enter, sll_max_key(y)) == \at(exit, sll_max_key(y))) ;)
_(logic _(dryad "cond:llen_next") 
  \bool cond_same_sll_list_len_next(struct s_node * x, struct s_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, sll_reach(y)))) ==> \at(enter, sll_list_len_next(y)) == \at(exit, sll_list_len_next(y))
;)

_(logic
  \bool cond_same_sll_all_un(struct s_node * x, struct s_node * y, \state enter, \state exit) =
  	cond_same_sll(x, y, enter, exit) 
  	&& cond_same_sll_reach(x, y, enter, exit)
  	&& cond_same_sll_keys(x, y, enter, exit) 
  	&& cond_same_sll_min_key(x, y, enter, exit) 
  	&& cond_same_sll_max_key(x, y, enter, exit) 
  	&& cond_same_sll_list_len_next(x, y, enter, exit) ;)
_(logic
  \bool cond_same_srtl_all_un(struct s_node * x, struct s_node * y, \state enter, \state exit) =
  	cond_same_srtl(x, y, enter, exit) 
  	&& cond_same_srtl_reach(x, y, enter, exit)
  	&& cond_same_sll_keys(x, y, enter, exit) 
  	&& cond_same_sll_min_key(x, y, enter, exit) 
  	&& cond_same_sll_max_key(x, y, enter, exit) 
  	&& cond_same_sll_list_len_next(x, y, enter, exit) ;)

_(logic _(dryad "cond:lseg") 
  \bool cond_same_sll_lseg(struct s_node * x, struct s_node * hd, struct s_node * tl, 
                      \state enter, \state exit) = 
    ((! \oset_in(x, \at(enter, sll_lseg_reach(hd, tl)))) ==> 
      \at(enter, sll_lseg(hd, tl)) == \at(exit, sll_lseg(hd, tl)) ) ;)
_(logic _(dryad "cond:slseg") 
  \bool cond_same_srtl_lseg(struct s_node * x, struct s_node * hd, struct s_node * tl, 
                      \state enter, \state exit) = 
    ((! \oset_in(x, \at(enter, srtl_lseg_reach(hd, tl)))) ==> 
      \at(enter, srtl_lseg(hd, tl)) == \at(exit, srtl_lseg(hd, tl)) ) ;)

_(logic _(dryad "cond:lseg_R") 
  \bool cond_same_sll_lseg_reach(struct s_node * x, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) = 
    ((! \oset_in(x, \at(enter, sll_lseg_reach(hd, tl)))) ==> 
      (\at(enter, sll_lseg_reach(hd, tl)) == \at(exit, sll_lseg_reach(hd, tl)) )) ;)
_(logic _(dryad "cond:slseg_R") 
  \bool cond_same_srtl_lseg_reach(struct s_node * x, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) = 
    ((! \oset_in(x, \at(enter, srtl_lseg_reach(hd, tl)))) ==> 
        (\at(enter, srtl_lseg_reach(hd, tl)) == \at(exit, srtl_lseg_reach(hd, tl)) )) ;)

_(logic _(dryad "cond:lseg_keys")
  \bool cond_same_sll_lseg_keys(struct s_node * x, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) =
    ((! \oset_in(x, \at(enter, sll_lseg_reach(hd, tl)))) ==>
      (\at(enter, sll_lseg_keys(hd, tl)) == \at(exit, sll_lseg_keys(hd, tl)))) ;)
_(logic _(dryad "cond:sll_lseg_min_key")
  \bool cond_same_sll_lseg_min_key(struct s_node * x, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) =
    ((! \oset_in(x, \at(enter, sll_lseg_reach(hd, tl)))) ==>
      (\at(enter, sll_lseg_min_key(hd, tl)) == \at(exit, sll_lseg_min_key(hd, tl)))) ;)
_(logic _(dryad "cond:sll_lseg_max_key")
  \bool cond_same_sll_lseg_max_key(struct s_node * x, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) =
    ((! \oset_in(x, \at(enter, sll_lseg_reach(hd, tl)))) ==>
      (\at(enter, sll_lseg_max_key(hd, tl)) == \at(exit, sll_lseg_max_key(hd, tl)))) ;)
_(logic _(dryad "cond:lseg_len_next")
  \bool cond_same_sll_lseg_len_next(struct s_node * x, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) =
    ((! \oset_in(x, \at(enter, sll_lseg_reach(hd, tl)))) ==>
      \at(enter, sll_lseg_len_next(hd, tl)) == \at(exit, sll_lseg_len_next(hd, tl))) ;)

_(logic 
  \bool cond_same_sll_all_bin(struct s_node * x, struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
	  cond_same_sll_lseg(x, hd, tl, enter, exit) 
  	&& cond_same_sll_lseg_reach(x, hd, tl, enter, exit)
  	&& cond_same_sll_lseg_keys(x, hd, tl, enter, exit)
  	&& cond_same_sll_lseg_min_key(x, hd, tl, enter, exit)
  	&& cond_same_sll_lseg_max_key(x, hd, tl, enter, exit)
  	&& cond_same_sll_lseg_len_next(x, hd, tl, enter, exit)
;)
_(logic 
  \bool cond_same_srtl_all_bin(struct s_node * x, struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
	  cond_same_srtl_lseg(x, hd, tl, enter, exit) 
  	&& cond_same_srtl_lseg_reach(x, hd, tl, enter, exit)
  	&& cond_same_sll_lseg_keys(x, hd, tl, enter, exit)
  	&& cond_same_sll_lseg_min_key(x, hd, tl, enter, exit)
  	&& cond_same_sll_lseg_max_key(x, hd, tl, enter, exit)
  	&& cond_same_sll_lseg_len_next(x, hd, tl, enter, exit)
;)


// -------- disjoint -------------------------------------------------------------------------
_(logic _(dryad "disj:sll") 
  \bool disj_same_sll(\oset heaplet, struct s_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, sll_reach(y)))) ==> \at(enter, sll(y)) == \at(exit, sll(y)) ;)
_(logic _(dryad "disj:srtl") 
  \bool disj_same_srtl(\oset heaplet, struct s_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, srtl_reach(y)))) ==> \at(enter, srtl(y)) == \at(exit, srtl(y)) ;)
_(logic _(dryad "disj:rsrtl") 
  \bool disj_same_rsrtl(\oset heaplet, struct s_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, rsrtl_reach(y)))) ==> \at(enter, rsrtl(y)) == \at(exit, rsrtl(y)) ;)

_(logic _(dryad "disj:sll_R") 
  \bool disj_same_sll_reach(\oset heaplet, struct s_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, sll_reach(y)))) ==> (\at(enter, sll_reach(y)) == \at(exit, sll_reach(y))) ;)
_(logic _(dryad "disj:srtl_R") 
  \bool disj_same_srtl_reach(\oset heaplet, struct s_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, srtl_reach(y)))) ==> (\at(enter, srtl_reach(y)) == \at(exit, srtl_reach(y))) ;)
_(logic _(dryad "disj:rsrtl_R") 
  \bool disj_same_rsrtl_reach(\oset heaplet, struct s_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, rsrtl_reach(y)))) ==> (\at(enter, rsrtl_reach(y)) == \at(exit, rsrtl_reach(y))) ;)

_(logic _(dryad "disj:keys") 
  \bool disj_same_sll_keys(\oset heaplet, struct s_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, sll_reach(y)))) ==> (\at(enter, sll_keys(y)) == \at(exit, sll_keys(y))) ;)
_(logic _(dryad "disj:sll_min_key") 
  \bool disj_same_sll_min_key(\oset heaplet, struct s_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, sll_reach(y)))) ==> (\at(enter, sll_min_key(y)) == \at(exit, sll_min_key(y))) ;)
_(logic _(dryad "disj:sll_max_key") 
  \bool disj_same_sll_max_key(\oset heaplet, struct s_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, sll_reach(y)))) ==> (\at(enter, sll_max_key(y)) == \at(exit, sll_max_key(y))) ;)
_(logic _(dryad "disj:llen_next") 
  \bool disj_same_sll_list_len_next(\oset heaplet, struct s_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, sll_reach(y)))) ==> \at(enter, sll_list_len_next(y)) == \at(exit, sll_list_len_next(y))
;)

_(logic
  \bool disj_same_sll_all_un(\oset heaplet, struct s_node * y, \state enter, \state exit) =
  	disj_same_sll(\at(enter, heaplet), y, enter, exit) 
  	&& disj_same_sll_reach(\at(enter, heaplet), y, enter, exit)
  	&& disj_same_sll_keys(\at(enter, heaplet), y, enter, exit) 
  	&& disj_same_sll_min_key(\at(enter, heaplet), y, enter, exit) 
  	&& disj_same_sll_max_key(\at(enter, heaplet), y, enter, exit) 
  	&& disj_same_sll_list_len_next(\at(enter, heaplet), y, enter, exit) ;)
_(logic
  \bool disj_same_srtl_all_un(\oset heaplet, struct s_node * y, \state enter, \state exit) =
  	disj_same_srtl(\at(enter, heaplet), y, enter, exit) 
  	&& disj_same_srtl_reach(\at(enter, heaplet), y, enter, exit)
  	&& disj_same_sll_keys(\at(enter, heaplet), y, enter, exit) 
  	&& disj_same_sll_min_key(\at(enter, heaplet), y, enter, exit) 
  	&& disj_same_sll_max_key(\at(enter, heaplet), y, enter, exit) 
  	&& disj_same_sll_list_len_next(\at(enter, heaplet), y, enter, exit) ;)

_(logic _(dryad "disj:lseg") 
  \bool disj_same_sll_lseg(\oset heaplet, struct s_node * hd, struct s_node * tl, 
                      \state enter, \state exit) = 
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, sll_lseg_reach(hd, tl)))) ==> 
      \at(enter, sll_lseg(hd, tl)) == \at(exit, sll_lseg(hd, tl)) ) ;)
_(logic _(dryad "disj:slseg") 
  \bool disj_same_srtl_lseg(\oset heaplet, struct s_node * hd, struct s_node * tl, 
                      \state enter, \state exit) = 
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, srtl_lseg_reach(hd, tl)))) ==> 
      \at(enter, srtl_lseg(hd, tl)) == \at(exit, srtl_lseg(hd, tl)) ) ;)

_(logic _(dryad "disj:lseg_R") 
  \bool disj_same_sll_lseg_reach(\oset heaplet, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) = 
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, sll_lseg_reach(hd, tl)))) ==> 
      (\at(enter, sll_lseg_reach(hd, tl)) == \at(exit, sll_lseg_reach(hd, tl)) )) ;)
_(logic _(dryad "disj:slseg_R") 
  \bool disj_same_srtl_lseg_reach(\oset heaplet, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) = 
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, srtl_lseg_reach(hd, tl)))) ==> 
        (\at(enter, srtl_lseg_reach(hd, tl)) == \at(exit, srtl_lseg_reach(hd, tl)) )) ;)

_(logic _(dryad "disj:lseg_keys")
  \bool disj_same_sll_lseg_keys(\oset heaplet, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) =
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, sll_lseg_reach(hd, tl)))) ==>
      (\at(enter, sll_lseg_keys(hd, tl)) == \at(exit, sll_lseg_keys(hd, tl)))) ;)
_(logic _(dryad "disj:sll_lseg_min_key")
  \bool disj_same_sll_lseg_min_key(\oset heaplet, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) =
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, sll_lseg_reach(hd, tl)))) ==>
      (\at(enter, sll_lseg_min_key(hd, tl)) == \at(exit, sll_lseg_min_key(hd, tl)))) ;)
_(logic _(dryad "disj:sll_lseg_max_key")
  \bool disj_same_sll_lseg_max_key(\oset heaplet, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) =
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, sll_lseg_reach(hd, tl)))) ==>
      (\at(enter, sll_lseg_max_key(hd, tl)) == \at(exit, sll_lseg_max_key(hd, tl)))) ;)
_(logic _(dryad "disj:lseg_len_next")
  \bool disj_same_sll_lseg_len_next(\oset heaplet, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) =
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, sll_lseg_reach(hd, tl)))) ==>
      \at(enter, sll_lseg_len_next(hd, tl)) == \at(exit, sll_lseg_len_next(hd, tl))) ;)

_(logic 
  \bool disj_same_sll_all_bin(\oset heaplet, struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
	  disj_same_sll_lseg(\at(enter, heaplet), hd, tl, enter, exit) 
  	&& disj_same_sll_lseg_reach(\at(enter, heaplet), hd, tl, enter, exit)
  	&& disj_same_sll_lseg_keys(\at(enter, heaplet), hd, tl, enter, exit)
  	&& disj_same_sll_lseg_min_key(\at(enter, heaplet), hd, tl, enter, exit)
  	&& disj_same_sll_lseg_max_key(\at(enter, heaplet), hd, tl, enter, exit)
  	&& disj_same_sll_lseg_len_next(\at(enter, heaplet), hd, tl, enter, exit)
;)
_(logic 
  \bool disj_same_srtl_all_bin(\oset heaplet, struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
	  disj_same_srtl_lseg(\at(enter, heaplet), hd, tl, enter, exit) 
  	&& disj_same_srtl_lseg_reach(\at(enter, heaplet), hd, tl, enter, exit)
  	&& disj_same_sll_lseg_keys(\at(enter, heaplet), hd, tl, enter, exit)
  	&& disj_same_sll_lseg_min_key(\at(enter, heaplet), hd, tl, enter, exit)
  	&& disj_same_sll_lseg_max_key(\at(enter, heaplet), hd, tl, enter, exit)
  	&& disj_same_sll_lseg_len_next(\at(enter, heaplet), hd, tl, enter, exit)
;)

/*
_(def _(dryad "lemma:patch")
  void sll_lemma_patch(struct s_node * b, struct s_node * e)
    _(ensures (sll(b) && sll(e) && sll_lseg(b, e)) ==> 
            (sll_reach(b) == sll_lseg_reach(b, e) \union sll_reach(e))
         && (sll_list_len_next(b) == (sll_lseg_len_next(b, e) + sll_list_len_next(e))))
    _(decreases sll_list_len_next(b))
  {
    if (b == e) { 
      return;
    }else  {
      _(assume unfold_sll_all_un(b))
      _(assume unfold_sll_all_bin(b, e))
      sll_lemma_patch(b->next, e);
    }
  } ;)
_(def _(dryad "lemma:patch_sorted")
  void srtl_lemma_patch(struct s_node * b, struct s_node * e)
    _(ensures (srtl(b) && srtl(e) && srtl_lseg(b, e)) ==> 
            (srtl_reach(b) == srtl_lseg_reach(b, e) \union srtl_reach(e))
         && (sll_list_len_next(b) == (sll_lseg_len_next(b, e) + sll_list_len_next(e))))
    _(decreases sll_list_len_next(b))
  {
    if (b == e) { 
      return;
    }else  {
      _(assume unfold_srtl_all_un(b))
      _(assume unfold_srtl_all_bin(b, e))
      srtl_lemma_patch(b->next, e);
    }
  } ;)
*/
_(axiom \forall struct s_node * x; srtl(x) ==> sll(x))
_(axiom \forall struct s_node * x; rsrtl(x) ==> sll(x))
_(axiom \forall struct s_node * x; sll_reach(x) == srtl_reach(x))
_(axiom \forall struct s_node * x; srtl_reach(x) == rsrtl_reach(x))
_(axiom \forall struct s_node * x,y; sll_lseg_reach(x, y) == srtl_lseg_reach(x, y))

//_(axiom \forall struct s_node * x,y; srtl_lseg(x,y) ==> sll_lseg(x,y))
//_(axiom \forall struct s_node * x; sll(x) ==> (sll_min_key(x) <= sll_max_key(x)))
//_(axiom \forall struct s_node * x,y; (sll_lseg(x,y) && x != y) ==> (sll_lseg_min_key(x,y) <= sll_lseg_max_key(x,y)))

// dummy function denoting the end of sll s_node defs
_(abstract _(dryad "end") void end_dl_s_node_defs(struct s_node * x) ;)

_(logic \bool mutable_list(struct s_node * x) =  x != NULL ==> \mutable(x) && \writable(x))

_(logic \bool unfold_mutable_list(struct s_node * x) =
  ((x != NULL && x->next != NULL)
  ==> (\mutable(x) == \mutable(x->next) &&
       \writable(x) == \writable(x->next)) ) )

// ---------------------------------------------------------------------------------------------------------
/*
_(logic \bool maintainsAcross(struct s_node * x, struct s_node * y, \state enter, \state exit) = 
	((! (x \in \at(enter, sllN(y)))) ==> \at(enter, sllN(y)) == \at(exit, sllN(y))) &&
	((! (x \in \at(enter, sllN(y)))) ==> \at(enter, sll(y)) == \at(exit, sll(y))) &&
	((! (x \in \at(enter, sllN(y)))) ==> \at(enter, sllKeys(y)) == \at(exit, sllKeys(y)))
	;)
	*/
/*
_(logic \bool disjointMaintainsAcross(struct s_node * x, struct s_node * y, \state enter, \state exit) =
	(\disjoint(\at(enter, N(x)), \at(enter, N(y))) ==> 
             \at(enter, N(x)) == \at(exit, N(x))) &&
	(\disjoint(\at(enter, N(x)), \at(enter, N(y))) ==> 
             \at(enter, sll(x)) == \at(exit, sll(x))) &&
	(\disjoint(\at(enter, N(x)), \at(enter, N(y))) ==> 
             \at(enter, keys(x)) == \at(exit, keys(x))) 
	;)
*/

/*
_(logic \bool maintainsAcrossLseg(struct s_node * x, struct s_node * y, \state enter, \state exit) = 
	((! (x \in \at(enter, lsegN(y, x)))) ==> \at(enter, lsegN(y, x)) == \at(exit, lsegN(y, x))) &&
	((! (x \in \at(enter, lsegN(y, x)))) ==> \at(enter, lseg (y, x)) == \at(exit, lseg (y, x))) &&
	((! (x \in \at(enter, lsegN(y, x)))) ==> \at(enter, lsegk(y, x)) == \at(exit, lsegk(y, x))) 
	;)
*/


#endif
