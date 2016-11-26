#ifndef DRYAD_SLL_DEFS_H
#define DRYAD_SLL_DEFS_H

#include <vcc.h>
// ------------------------
#include <stdlib.h>

//_(dryad "sll:srtl:sll_R:srtl_R:keys:mkeys:llen_next:lseg:slseg:lseg_R:slseg_R:lseg_keys:lseg_mkeys:lseg_len_next")
//_(dryad "sll:sll_R:keys:llen_next:lseg:lseg_R:lseg_keys")
typedef
_(dryad "sll:sll_R:keys:lseg:lseg_R:lseg_keys")
struct s_node {
  int key;
  struct s_node * next;
} Node;


_(abstract _(dryad "base:sll") \bool sll(struct s_node * hd)
	_(reads \universe())
	_(ensures (hd == NULL) ==> \result)
;)


_(abstract _(dryad "base:sll_R") \oset sll_reach(struct s_node * hd)
	_(reads \universe())
	_(ensures ((hd != NULL) ==> \oset_in(hd, \result))
			&& ((hd == NULL) ==> (\result == \oset_empty())))
;)

_(abstract _(dryad "base:keys") \intset sll_keys(struct s_node * hd) // [key]
	_(reads \universe())
	_(ensures (hd != NULL ==> \intset_in(hd->key, \result)))
	_(ensures (hd == NULL ==> (\result == \intset_empty())))
	;)

/*_(abstract _(dryad "base:mkeys") \intbag sll_mkeys(struct s_node * hd) // [key]
	_(reads \universe())
	_(ensures (hd != NULL ==> \intbag_in(hd->key, \result)))
	_(ensures (hd == NULL ==> (\result == \intbag_empty)))
	;)*/
/*
_(abstract _(dryad "base:llen_next") \natural sll_list_len_next(struct s_node * x)
  _(reads \universe())
  _(ensures x != NULL ==> \result > 0)
  _(ensures x == NULL ==> \result == 0)
  ;)
*/
_(abstract _(dryad "base:lseg") \bool sll_lseg(struct s_node * hd, struct s_node * tl)
  _(reads \universe())
  _(ensures (hd == NULL && hd != tl) ==> \result)
  _(ensures hd == tl ==> \result)
  _(ensures tl == NULL ==> (\result == sll(hd)))
  _(ensures (hd != NULL && sll(tl) && \oset_disjoint(sll_reach(tl), sll_lseg_reach(hd, tl))) ==>
             (sll(hd) 
              && sll_reach(hd) == \oset_union(sll_lseg_reach(hd, tl), sll_reach(tl))
						  && sll_keys(hd) == \intset_union(sll_keys(tl), sll_lseg_keys(hd, tl))
						  //&& sll_mkeys(hd) == \intbag_union(sll_mkeys(tl), sll_lseg_mkeys(hd, tl))
//             && sll_list_len_next(hd) == (sll_lseg_len_next(hd, tl) + sll_list_len_next(tl)) 
              ) ) 
  _(ensures (hd != NULL && tl != NULL && sll(tl->next) 
         && \oset_disjoint(sll_reach(tl->next), sll_lseg_reach(hd, tl)) 
		     && (! \oset_in(tl, sll_reach(tl->next)) ) 
		     && (! \oset_in(tl, sll_lseg_reach(hd, tl)))   ) ==>
              (  \oset_in(tl, sll_reach(hd))
                 && sll_lseg (hd, tl->next) 
				         && sll_lseg_keys(hd, tl->next) == \intset_union(\intset_singleton(tl->key), sll_lseg_keys(hd, tl)) 
     				     //&& sll_lseg_mkeys(hd, tl->next) == \intbag_union(\intbag_singleton(tl->key), sll_lseg_mkeys(hd, tl))
				         && sll_lseg_reach(hd, tl->next) == \oset_union_one1(tl, sll_lseg_reach(hd, tl))  ))
 //                && sll_lseg_len_next(hd, tl->next) == (sll_lseg_len_next(hd, tl) + 1) ) )
  ;)

_(abstract _(dryad "base:lseg_R") \oset sll_lseg_reach(struct s_node * hd, struct s_node * tl)
	_(reads \universe())
	_(ensures (hd == NULL && hd != tl) ==> \result == \oset_empty())
	_(ensures hd == tl ==> \result == \oset_empty())
	_(ensures (hd != NULL && hd != tl) ==> \oset_in(hd, \result))
	_(ensures (hd != NULL && tl == NULL) ==> (\result == sll_reach(hd)))
  ;)

_(abstract _(dryad "base:lseg_keys") \intset sll_lseg_keys(struct s_node * hd, struct s_node * tl)
  _(reads \universe())
  _(ensures (hd == NULL && hd != tl) ==> (\result == \intset_empty()))
  _(ensures hd == tl   ==> (\result == \intset_empty()))
  _(ensures (hd != NULL && hd != tl)   ==> \intset_in(hd->key, \result))
  _(ensures (hd != NULL && tl == NULL) ==> (\result == sll_keys(hd)))
;)
/*
_(abstract _(dryad "base:lseg_mkeys") \intbag sll_lseg_mkeys(struct s_node * hd, struct s_node * tl)
  _(reads \universe())
  _(ensures hd == tl   ==> (\result == \intbag_empty))
  _(ensures (hd == NULL && hd != tl) ==> (\result == \intbag_empty))
  _(ensures (hd != NULL && hd != tl)   ==> \intbag_in(hd->key, \result))
  _(ensures (hd != NULL && tl == NULL) ==> (\result == sll_mkeys(hd)))
;) */

/*
_(abstract _(dryad "base:lseg_len_next") \natural sll_lseg_len_next(struct s_node * hd, struct s_node * tl)
  _(reads \universe())
  _(ensures hd == tl   ==> \result == 0)
  _(ensures (hd == NULL && hd != tl) ==> \result == 0)
  _(ensures (hd != NULL && hd != tl)   ==> \result > 0)
  _(ensures (hd != NULL && tl == NULL) ==> \result == sll_lseg_len_next(hd, tl))
;)
*/

// ----------------------------------------------------------------------------------------------------------------------------
_(logic _(dryad "unfold:sll") \bool unfold_sll(struct s_node * hd) =
	(hd != NULL ==>
		(sll(hd) <==> 
			(sll(hd->next) && 
			(! \oset_in(hd, sll_reach(hd->next))) ) ) ) 
;)

_(logic _(dryad "unfold:sll_R") \bool unfold_sll_reach(struct s_node * hd) =
	(hd != NULL ==>
		(sll_reach(hd) == \oset_union_one2(sll_reach(hd->next), hd)) ) 
	;)

_(logic _(dryad "unfold:keys") \bool unfold_sll_keys(struct s_node * hd) =
		(hd != NULL ==> (sll_keys(hd) == (\intset_union(sll_keys(hd->next), \intset_singleton(hd->key))))) 
	;)
/*
_(pure _(dryad "unfold:mkeys") \bool unfold_sll_mkeys(struct s_node * hd) // depends on: [next, key]
	_(reads \universe())
	_(ensures \result == 
		(hd != NULL ==> (sll_mkeys(hd) == (\intbag_union(sll_mkeys(hd->next), \intbag_singleton(hd->key))))) )
	;) */

/*
_(logic _(dryad "unfold:llen_next") \bool unfold_sll_list_len_next(struct s_node * hd) =
    (hd != NULL ==> (sll_list_len_next(hd) == sll_list_len_next(hd->next) + 1)) 
;)*/

_(logic \bool unfold_sll_all_un(struct s_node * x) =
	unfold_sll(x)
	&& unfold_sll_reach(x)
	&& unfold_sll_keys(x)
//	&& unfold_sll_mkeys(x)
//  && unfold_sll_list_len_next(x)
	;)

_(logic _(dryad "unfold:lseg") \bool unfold_sll_lseg(struct s_node * hd, struct s_node * tl) =
  ((hd != NULL && hd != tl) ==>
      (sll_lseg(hd,tl) <==> 
        (sll_lseg(hd->next,tl) && (! \oset_in(hd, sll_lseg_reach(hd->next,tl))) ) ) ) 
  ;)

_(logic _(dryad "unfold:lseg_R") \bool unfold_sll_lseg_reach(struct s_node * hd, struct s_node * tl) =
	((hd != NULL && hd != tl) ==> 
       (sll_lseg_reach(hd, tl) == \oset_union_one2(sll_lseg_reach(hd->next, tl), hd)) ) 
  ;)

_(logic _(dryad "unfold:lseg_keys") \bool unfold_sll_lseg_keys(struct s_node * hd, struct s_node * tl) =
      ((hd != NULL && hd != tl) ==> sll_lseg_keys(hd, tl) == 
          \intset_union(sll_lseg_keys(hd->next, tl), \intset_singleton(hd->key)) ) 
;)

/*
_(pure _(dryad "unfold:lseg_mkeys") \bool unfold_sll_lseg_mkeys(struct s_node * hd, struct s_node * tl)
  _(reads \universe())
  _(ensures \result == 
      ((hd != NULL && hd != tl) ==> sll_lseg_mkeys(hd, tl) == 
          \intbag_union(sll_lseg_mkeys(hd->next, tl), \intbag_singleton(hd->key)) ) )
;) */

//_(logic _(dryad "unfold:lseg_len_next") \bool unfold_sll_lseg_len_next(struct s_node * hd, struct s_node * tl) =
//    ((hd != NULL && hd != tl) ==> (sll_lseg_len_next(hd, tl) == (sll_lseg_len_next(hd->next, tl) + 1)))  ;)

_(logic \bool unfold_sll_all_bin(struct s_node * hd, struct s_node *  tl) =
  unfold_sll_lseg(hd, tl)
  && unfold_sll_lseg_reach(hd, tl)
  && unfold_sll_lseg_keys(hd, tl)
//  && unfold_sll_lseg_mkeys(hd, tl)
  //&& unfold_sll_lseg_len_next(hd, tl)
;)

// ----------------------------------------------------------------------------------------------------------------------------

// -----------------------------------------------------------------------------------------------------
_(logic _(dryad "same:sll") \bool same_sll(struct s_node * x, \state enter, \state exit) =
	\at(enter, sll(x)) == \at(exit, sll(x))
;)
_(logic _(dryad "same:sll_R") \bool same_sll_reach(struct s_node * x, \state enter, \state exit) = 
	\at(enter, sll_reach(x)) == \at(exit, sll_reach(x)) 
;)
_(logic _(dryad "same:keys") \bool same_sll_keys(struct s_node * x, \state enter, \state exit) =
	\at(enter, sll_keys(x)) == \at(exit, sll_keys(x))
;)
/*_(logic _(dryad "same:mkeys") \bool same_sll_mkeys(struct s_node * x, \state enter, \state exit) =
	\at(enter, sll_mkeys(x)) == \at(exit, sll_mkeys(x))
;) */
/*
_(logic _(dryad "same:llen_next") \bool same_sll_list_len_next(struct s_node * x, \state enter, \state exit) =
	\at(enter, sll_list_len_next(x)) == \at(exit, sll_list_len_next(x))
;)
*/
_(logic \bool same_sll_all_un(struct s_node * x, \state enter, \state exit) = 
	same_sll(x, enter, exit) 
	&& same_sll_reach(x, enter, exit)
	&& same_sll_keys(x, enter, exit)
//	&& same_sll_mkeys(x, enter, exit)
//	&& same_sll_list_len_next(x, enter, exit)
;)

_(logic _(dryad "same:lseg") 
  \bool same_sll_lseg(struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
    \at(enter, sll_lseg(hd, tl)) == \at(exit, sll_lseg(hd, tl)) ;)
_(logic _(dryad "same:lseg_R") 
  \bool same_sll_lseg_reach(struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
    \at(enter, sll_lseg_reach(hd, tl)) == \at(exit, sll_lseg_reach(hd, tl)) ;)
_(logic _(dryad "same:lseg_keys")
  \bool same_sll_lseg_keys(struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
    \at(enter, sll_lseg_keys(hd, tl)) == \at(exit, sll_lseg_keys(hd, tl)) ;)
//_(logic _(dryad "same:lseg_mkeys")
//  \bool same_sll_lseg_mkeys(struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
 //   \at(enter, sll_lseg_mkeys(hd, tl)) == \at(exit, sll_lseg_mkeys(hd, tl)) ;)

//_(logic _(dryad "same:lseg_len_next")
//  \bool same_sll_lseg_len_next(struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
//    \at(enter, sll_lseg_len_next(hd, tl)) == \at(exit, sll_lseg_len_next(hd, tl)) ;)

_(logic \bool same_sll_all_bin(struct s_node * hd, struct s_node * tl, \state enter, \state exit) = 
	same_sll_lseg(hd, tl, enter, exit) 
	&& same_sll_lseg_reach(hd, tl, enter, exit)
	&& same_sll_lseg_keys(hd, tl, enter, exit)
//	&& same_sll_lseg_mkeys(hd, tl, enter, exit)
  //&& same_sll_lseg_len_next(hd, tl, enter, exit)
;)


// ------------------------------------------------------------------------------------------------------
_(logic _(dryad "cond:sll") 
  \bool cond_same_sll(struct s_node * x, struct s_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, sll_reach(y)))) ==> \at(enter, sll(y)) == \at(exit, sll(y)) ;)

_(logic _(dryad "cond:sll_R") 
  \bool cond_same_sll_reach(struct s_node * x, struct s_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, sll_reach(y)))) ==> \at(enter, sll_reach(y)) == \at(exit, sll_reach(y)) ;)

_(logic _(dryad "cond:keys") 
  \bool cond_same_sll_keys(struct s_node * x, struct s_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, sll_reach(y)))) ==> \at(enter, sll_keys(y)) == \at(exit, sll_keys(y)) ;)

_(logic
  \bool cond_same_sll_all_un(struct s_node * x, struct s_node * y, \state enter, \state exit) =
  	cond_same_sll(x, y, enter, exit) 
  	&& cond_same_sll_reach(x, y, enter, exit)
  	&& cond_same_sll_keys(x, y, enter, exit) 
;)
_(logic _(dryad "cond:lseg") 
  \bool cond_same_sll_lseg(struct s_node * x, struct s_node * hd, struct s_node * tl, 
                      \state enter, \state exit) = 
    ((! \oset_in(x, \at(enter, sll_lseg_reach(hd, tl)))) ==> 
      \at(enter, sll_lseg(hd, tl)) == \at(exit, sll_lseg(hd, tl)) ) ;)

_(logic _(dryad "cond:lseg_R") 
  \bool cond_same_sll_lseg_reach(struct s_node * x, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) = 
    ((! \oset_in(x, \at(enter, sll_lseg_reach(hd, tl)))) ==> 
      \at(enter, sll_lseg_reach(hd, tl)) == \at(exit, sll_lseg_reach(hd, tl)) ) ;)

_(logic _(dryad "cond:lseg_keys")
  \bool cond_same_sll_lseg_keys(struct s_node * x, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) =
    ((! \oset_in(x, \at(enter, sll_lseg_reach(hd, tl)))) ==>
      \at(enter, sll_lseg_keys(hd, tl)) == \at(exit, sll_lseg_keys(hd, tl))) ;)
_(logic 
  \bool cond_same_sll_all_bin(struct s_node * x, struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
	  cond_same_sll_lseg(x, hd, tl, enter, exit) 
  	&& cond_same_sll_lseg_reach(x, hd, tl, enter, exit)
  	&& cond_same_sll_lseg_keys(x, hd, tl, enter, exit)
;)




// ------------------------------------------------------------------------------------------------------
_(logic _(dryad "disj:sll") 
  \bool disj_same_sll(\oset heaplet, struct s_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, sll_reach(y)))) ==> \at(enter, sll(y)) == \at(exit, sll(y)) ;)

_(logic _(dryad "disj:sll_R") 
  \bool disj_same_sll_reach(\oset heaplet, struct s_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, sll_reach(y)))) ==> \at(enter, sll_reach(y)) == \at(exit, sll_reach(y)) ;)

_(logic _(dryad "disj:keys") 
  \bool disj_same_sll_keys(\oset heaplet, struct s_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, sll_reach(y)))) ==> \at(enter, sll_keys(y)) == \at(exit, sll_keys(y)) ;)

_(logic
  \bool disj_same_sll_all_un(\oset heaplet, struct s_node * y, \state enter, \state exit) =
  	disj_same_sll(\at(enter, heaplet), y, enter, exit) 
  	&& disj_same_sll_reach(\at(enter, heaplet), y, enter, exit)
  	&& disj_same_sll_keys(\at(enter, heaplet), y, enter, exit) 
;)
_(logic _(dryad "disj:lseg") 
  \bool disj_same_sll_lseg(\oset heaplet, struct s_node * hd, struct s_node * tl, 
                      \state enter, \state exit) = 
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, sll_lseg_reach(hd, tl)))) ==> 
      \at(enter, sll_lseg(hd, tl)) == \at(exit, sll_lseg(hd, tl)) ) ;)

_(logic _(dryad "disj:lseg_R") 
  \bool disj_same_sll_lseg_reach(\oset heaplet, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) = 
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, sll_lseg_reach(hd, tl)))) ==> 
      \at(enter, sll_lseg_reach(hd, tl)) == \at(exit, sll_lseg_reach(hd, tl)) ) ;)

_(logic _(dryad "disj:lseg_keys")
  \bool disj_same_sll_lseg_keys(\oset heaplet, struct s_node * hd, struct s_node * tl, 
                            \state enter, \state exit) =
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, sll_lseg_reach(hd, tl)))) ==>
      \at(enter, sll_lseg_keys(hd, tl)) == \at(exit, sll_lseg_keys(hd, tl))) ;)
_(logic 
  \bool disj_same_sll_all_bin(\oset heaplet, struct s_node * hd, struct s_node * tl, \state enter, \state exit) =
	  disj_same_sll_lseg(\at(enter, heaplet), hd, tl, enter, exit) 
  	&& disj_same_sll_lseg_reach(\at(enter, heaplet), hd, tl, enter, exit)
  	&& disj_same_sll_lseg_keys(\at(enter, heaplet), hd, tl, enter, exit)
;)

// dummy function denoting the end of sll s_node defs
_(abstract _(dryad "end") void end_dl_s_node_defs(struct s_node * x) ;)

_(logic \bool mutable_list(struct s_node * x) =  ((x != NULL) ==> (\mutable(x) && \writable(x))))

_(logic \bool unfold_mutable_list(struct s_node * x) =
  ((x != NULL && x->next != NULL)
       ==> ((\mutable(x) == \mutable(x->next)) &&
            (\writable(x) == \writable(x->next))) ) )

// ---------------------------------------------------------------------------------------------------------
#endif
