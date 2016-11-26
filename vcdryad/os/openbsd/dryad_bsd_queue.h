#ifndef DRYAD_DLL_DEFS_H
#define DRYAD_DLL_DEFS_H

#include <vcc.h>
// ------------------------
#include <stdlib.h>



typedef 
_(dryad "sll:sll_R:llen_next:lseg:lseg_R:lseg_len_next")
struct q_node {
	struct q_node * next;
} QNode;

typedef
_(dryad "queue:queue_R")
struct q_head {
  QNode * first;  /* the first element */
  QNode * last;   /* the last next element */
} QHead;


_(abstract _(dryad "base:sll")
	\bool sll(struct q_node * hd)
	_(reads \universe())
	_(ensures (hd == NULL) ==> \result)
	;)

_(abstract _(dryad "base:sll_R")  
	\oset sll_reach(struct q_node * hd)
	_(reads \universe())
	_(ensures ((hd != NULL) ==> \oset_in(hd, \result))
			&& ((hd == NULL) ==> (\result == \oset_empty())))
	;)

_(abstract _(dryad "base:llen_next")  \natural sll_list_len_next(struct q_node * x)
  _(reads \universe())
  _(ensures x != NULL ==> \result > 0)
  _(ensures x == NULL ==> \result == 0)
  ;)

_(abstract _(dryad "base:lseg")  \bool sll_lseg(struct q_node * hd, struct q_node * tl)
  _(reads \universe())
  _(ensures (hd == NULL && hd != tl) ==> \result)
  _(ensures hd == tl ==> \result)
  _(ensures tl == NULL ==> (\result == sll(hd)))
  _(ensures (sll(tl) && \oset_disjoint(sll_reach(tl), sll_lseg_reach(hd, tl))) ==>
             (sll(hd) ) ) 
  _(ensures (hd != NULL && tl != NULL && sll(tl->next) 
		 && \oset_disjoint(sll_reach(tl->next), sll_lseg_reach(hd, tl)) 
		 && (! \oset_in(tl, sll_reach(tl->next)) ) 
		 && (! \oset_in(tl, sll_lseg_reach(hd, tl)))) ==> 
          \oset_in(tl, sll_reach(hd)) 
           && sll_lseg (hd, tl->next)  
           && sll_lseg_reach(hd, tl->next) == \oset_union(\oset_singleton(tl), sll_lseg_reach(hd, tl)) ) 
  ;)

_(abstract _(dryad "base:lseg_R")  \oset sll_lseg_reach(struct q_node * hd, struct q_node * tl)
	_(reads \universe())
	_(ensures (hd == NULL && hd != tl) ==> \result == \oset_empty())
	_(ensures hd == tl  ==> \result == \oset_empty())
	_(ensures (hd != NULL && hd != tl)   ==> \oset_in(hd, \result))
	_(ensures (hd != NULL && tl == NULL) ==> (\result == sll_reach(hd)))
  ;)


_(abstract _(dryad "base:lseg_len_next")  \natural sll_lseg_len_next(struct q_node * hd, struct q_node * tl)
  _(reads \universe())
  _(ensures hd == tl   ==> \result == 0)
  _(ensures (hd == NULL && hd != tl) ==> \result == 0)
  _(ensures (hd != NULL && hd != tl)   ==> \result > 0)
  _(ensures (hd != NULL && tl == NULL) ==> \result == sll_list_len_next(hd))
;)

// ----------------------------------------------------------------------------------------------------------------------------
_(pure _(dryad "unfold:sll") \bool unfold_sll(struct q_node * hd) // depends on: [next]
	_(reads \universe())
	_(ensures \result == (hd != NULL ==>
		(sll(hd) <==> 
			(sll(hd->next) && 
			(! \oset_in(hd, sll_reach(hd->next))) ) ) ) )
	;)

_(logic  _(dryad "unfold:sll_R")   \bool unfold_sll_reach(struct q_node * hd) =
	(hd != NULL ==>
		(sll_reach(hd) == \oset_union(sll_reach(hd->next), \oset_singleton(hd))) ) 
;)

_(pure _(dryad "unfold:llen_next") \bool unfold_sll_list_len_next(struct q_node * hd)
  _(reads \universe())
  _(ensures \result == 
    (hd != NULL ==> (sll_list_len_next(hd) == sll_list_len_next(hd->next) + 1)) ) 
;)

_(logic  \bool unfold_sll_all_un(struct q_node * x) =
	unfold_sll(x)
  && unfold_sll_reach(x)
	&& unfold_sll_list_len_next(x)
;)


_(logic  _(dryad "unfold:lseg") \bool unfold_sll_lseg(struct q_node * hd, struct q_node * tl) =
  ((hd != NULL && hd != tl) ==>
      (sll_lseg(hd,tl) <==> 
        (sll_lseg(hd->next,tl) && (! \oset_in(hd, sll_lseg_reach(hd->next,tl))) ) ) ) 
  ;)

_(logic  _(dryad "unfold:lseg_R") \bool unfold_sll_lseg_reach(struct q_node * hd, struct q_node * tl) =
	((hd != NULL && hd != tl) ==> 
       (sll_lseg_reach(hd, tl) == \oset_union(sll_lseg_reach(hd->next, tl), \oset_singleton(hd))) )  
  ;)


_(logic _(dryad "unfold:lseg_len_next") \bool unfold_sll_lseg_len_next(struct q_node * hd, struct q_node * tl) =
      ((hd != NULL && hd != tl) ==> (sll_lseg_len_next(hd, tl) == (sll_lseg_len_next(hd->next, tl) + 1)))  ;)


_(abstract /*_(dryad "unfold:all-bin")*/  \bool unfold_sll_all_bin(struct q_node * hd, struct q_node *  tl)
  _(reads \universe())
  _(ensures unfold_sll_lseg(hd, tl))
  _(ensures unfold_sll_lseg_reach(hd, tl))
  _(ensures unfold_sll_lseg_len_next(hd, tl))
;)

// ----------------------------------------------------------------------------------------------------------------------------

// -----------------------------------------------------------------------------------------------------
_(logic _(dryad "same:sll")  \bool same_sll(struct q_node * x, \state enter, \state exit) =
	\at(enter, sll(x)) == \at(exit, sll(x))
;)

_(logic _(dryad "same:sll_R")  \bool same_sll_reach(struct q_node * x, \state enter, \state exit) = 
	\at(enter, sll_reach(x)) == \at(exit, sll_reach(x)) 
;)
_(logic _(dryad "same:llen_next") \bool same_sll_list_len_next(struct q_node * x, \state enter, \state exit) =
	\at(enter, sll_list_len_next(x)) == \at(exit, sll_list_len_next(x))
;)
_(logic _(dryad "same:all-un")  \bool same_sll_all_un(struct q_node * x, \state enter, \state exit) = 
	same_sll(x, enter, exit) 
	&& same_sll_reach(x, enter, exit)
	&& same_sll_list_len_next(x, enter, exit)
;)

_(logic  _(dryad "same:lseg") 
  \bool same_sll_lseg(struct q_node * hd, struct q_node * tl, \state enter, \state exit) =
    \at(enter, sll_lseg(hd, tl)) == \at(exit, sll_lseg(hd, tl)) ;)

_(logic  _(dryad "same:lseg_R") 
  \bool same_sll_lseg_reach(struct q_node * hd, struct q_node * tl, \state enter, \state exit) =
    \at(enter, sll_lseg_reach(hd, tl)) == \at(exit, sll_lseg_reach(hd, tl)) ;)

_(logic _(dryad "same:lseg_len_next")
  \bool same_sll_lseg_len_next(struct q_node * hd, struct q_node * tl, \state enter, \state exit) =
    \at(enter, sll_lseg_len_next(hd, tl)) == \at(exit, sll_lseg_len_next(hd, tl)) ;)

_(logic _(dryad "same:all-bin")  \bool same_sll_all_bin(struct q_node * hd, struct q_node * tl, \state enter, \state exit) = 
	same_sll_lseg(hd, tl, enter, exit) 
	&& same_sll_lseg_reach(hd, tl, enter, exit)
	&& same_sll_lseg_len_next(hd, tl, enter, exit)
;)


// ------------------------------------------------------------------------------------------------------
_(logic  _(dryad "cond:sll") 
  \bool cond_same_sll(struct q_node * x, struct q_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, sll_reach(y)))) ==> \at(enter, sll(y)) == \at(exit, sll(y)) ;)
_(logic  _(dryad "cond:sll_R") 
  \bool cond_same_sll_reach(struct q_node * x, struct q_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, sll_reach(y)))) ==> \at(enter, sll_reach(y)) == \at(exit, sll_reach(y)) ;)
_(logic  _(dryad "cond:llen_next") 
  \bool cond_same_sll_list_len_next(struct q_node * x, struct q_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, sll_reach(y)))) ==> \at(enter, sll_list_len_next(y)) == \at(exit, sll_list_len_next(y)) ;)

_(logic  _(dryad "cond:all-un") 
  \bool cond_same_sll_all_un(struct q_node * x, struct q_node * y, \state enter, \state exit) =
  	cond_same_sll(x, y, enter, exit) 
  	&& cond_same_sll_reach(x, y, enter, exit)
  	&& cond_same_sll_list_len_next(x, y, enter, exit) 
;)

_(logic  _(dryad "disj:sll") 
  \bool disj_same_sll(\oset heaplet, struct q_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, sll_reach(y)))) ==> \at(enter, sll(y)) == \at(exit, sll(y)) ;)
_(logic  _(dryad "disj:sll_R") 
  \bool disj_same_sll_reach(\oset heaplet, struct q_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, sll_reach(y)))) ==> \at(enter, sll_reach(y)) == \at(exit, sll_reach(y)) ;)
_(logic  _(dryad "disj:llen_next") 
  \bool disj_same_sll_list_len_next(\oset heaplet, struct q_node * y, \state enter, \state exit) =
	  (\oset_disjoint(\at(enter, heaplet), \at(enter, sll_reach(y)))) ==> \at(enter, sll_list_len_next(y)) == \at(exit, sll_list_len_next(y)) ;)

_(logic _(dryad "cond:queue")
 \bool   cond_same_queue(struct q_node * x, struct q_head * hd, \state enter, \state exit) =
  ((! \oset_in(x, \at(enter, queue_reach(hd)))) ==> \at(enter, queue(hd)) == \at(exit, queue(hd)))
  && 
  (hd != NULL ==>  cond_same_sll(x, hd->last, enter, exit))
  && 
  (hd != NULL ==>  cond_same_sll_lseg(x, hd->first, hd->last, enter, exit))
  && 
  (hd != NULL ==>  cond_same_sll(x, hd->first, enter, exit))
;)

_(logic _(dryad "cond:queue_R")
 \bool   cond_same_queue_reach(struct q_node * x, struct q_head * hd, \state enter, \state exit) =
  ((! \oset_in(x, \at(enter, queue_reach(hd)))) ==> \at(enter, queue_reach(hd)) == \at(exit, queue_reach(hd)))
  && 
  (hd != NULL ==>  cond_same_sll_reach(x, hd->last, enter, exit))
  && 
  (hd != NULL ==>  cond_same_sll_lseg_reach(x, hd->first, hd->last, enter, exit))
  && 
  (hd != NULL ==>  cond_same_sll_reach(x, hd->first, enter, exit))
;)

_(logic _(dryad "cond:queue_all")
 \bool   cond_same_queue_all(struct q_node * x, struct q_head * hd, \state enter, \state exit) =
	  cond_same_queue(x, hd, enter, exit)
  	&& cond_same_queue_reach(x, hd, enter, exit) ;)

_(logic _(dryad "disj:queue")
 \bool   disj_same_queue(\oset heaplet, struct q_head * hd, \state enter, \state exit) =
  ((\oset_disjoint(\at(enter, heaplet), \at(enter, queue_reach(hd)))) ==> \at(enter, queue(hd)) == \at(exit, queue(hd)))
  && 
  (hd != NULL ==>  disj_same_sll(\at(enter, heaplet), hd->last, enter, exit))
  && 
  (hd != NULL ==>  disj_same_sll_lseg(\at(enter, heaplet), hd->first, hd->last, enter, exit))
  && 
  (hd != NULL ==>  disj_same_sll(\at(enter, heaplet), hd->first, enter, exit))
;)

_(logic _(dryad "disj:queue_R")
 \bool   disj_same_queue_reach(\oset heaplet, struct q_head * hd, \state enter, \state exit) =
  ((\oset_disjoint(\at(enter, heaplet), \at(enter, queue_reach(hd)))) ==> \at(enter, queue_reach(hd)) == \at(exit, queue_reach(hd)))
  && 
  (hd != NULL ==>  disj_same_sll_reach(\at(enter, heaplet), hd->last, enter, exit))
  && 
  (hd != NULL ==>  disj_same_sll_lseg_reach(\at(enter, heaplet), hd->first, hd->last, enter, exit))
  && 
  (hd != NULL ==>  disj_same_sll_reach(\at(enter, heaplet), hd->first, enter, exit))
;)

// ------------------------------------------------------------------------------------------------------
_(logic  _(dryad "cond:lseg") 
  \bool cond_same_sll_lseg(struct q_node * x, struct q_node * hd, struct q_node * tl, 
                      \state enter, \state exit) = 
    ((! \oset_in(x, \at(enter, sll_lseg_reach(hd, tl)))) ==> 
      \at(enter, sll_lseg(hd, tl)) == \at(exit, sll_lseg(hd, tl)) ) ;)
_(logic  _(dryad "cond:lseg_R") 
  \bool cond_same_sll_lseg_reach(struct q_node * x, struct q_node * hd, struct q_node * tl, 
                            \state enter, \state exit) = 
    ((! \oset_in(x, \at(enter, sll_lseg_reach(hd, tl)))) ==> 
      \at(enter, sll_lseg_reach(hd, tl)) == \at(exit, sll_lseg_reach(hd, tl)) ) ;)
_(logic _(dryad "cond:lseg_len_next")
  \bool cond_same_sll_lseg_len_next(struct q_node * x, struct q_node * hd, struct q_node * tl, 
                            \state enter, \state exit) =
    ((! \oset_in(x, \at(enter, sll_lseg_reach(hd, tl)))) ==>
      \at(enter, sll_lseg_len_next(hd, tl)) == \at(exit, sll_lseg_len_next(hd, tl))) ;)

_(logic  _(dryad "disj:lseg") 
  \bool disj_same_sll_lseg(\oset heaplet, struct q_node * hd, struct q_node * tl, 
                      \state enter, \state exit) = 
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, sll_lseg_reach(hd, tl)))) ==> 
      \at(enter, sll_lseg(hd, tl)) == \at(exit, sll_lseg(hd, tl)) ) ;)
_(logic  _(dryad "disj:lseg_R") 
  \bool disj_same_sll_lseg_reach(\oset heaplet, struct q_node * hd, struct q_node * tl, 
                            \state enter, \state exit) = 
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, sll_lseg_reach(hd, tl)))) ==> 
      \at(enter, sll_lseg_reach(hd, tl)) == \at(exit, sll_lseg_reach(hd, tl)) ) ;)
_(logic _(dryad "disj:lseg_len_next")
  \bool disj_same_sll_lseg_len_next(\oset heaplet, struct q_node * hd, struct q_node * tl, 
                            \state enter, \state exit) =
    ((\oset_disjoint(\at(enter, heaplet), \at(enter, sll_lseg_reach(hd, tl)))) ==>
      \at(enter, sll_lseg_len_next(hd, tl)) == \at(exit, sll_lseg_len_next(hd, tl))) ;)

_(logic  _(dryad "cond:all-bin") 
  \bool cond_same_sll_all_bin(struct q_node * x, struct q_node * hd, struct q_node * tl, \state enter, \state exit) =
       cond_same_sll_lseg(x, hd, tl, enter, exit) 
  	&& cond_same_sll_lseg_reach(x, hd, tl, enter, exit)
  	&& cond_same_sll_lseg_len_next(x, hd, tl, enter, exit) ;)
// ------------------------------------------------------------------------------------------------------

// dummy function denoting the end of sll node defs
_(abstract _(dryad "end") void end_q_node_defs(struct q_node * x) ;)
// ---------------------------------------------------------------------------------------------------------
/*
typedef
struct q_head {
  QNode * first;  
  QNode * last;   
} QHead;
*/
_(logic _(dryad "base:queue") 
  \bool queue(struct q_head * x) = {:split}
  	x != NULL ==> 
  	(x->first == NULL ==> x->last == NULL) &&
  	(x->first != NULL ==> 
	  	(x->last != NULL && x->last->next == NULL &&
  		sll(x->first) 
  		&& sll(x->last) 
  		&& sll_lseg(x->first, x->last)
   		&& \oset_disjoint(sll_lseg_reach(x->first, x->last), sll_reach(x->last)) 
  		&& (sll_reach(x->first) == \oset_union(sll_lseg_reach(x->first, x->last), sll_reach(x->last)))
  		&& !\oset_in(x, sll_reach(x->first))
  		)
	  ) ;)
		
_(logic _(dryad "base:queue_R") \oset queue_reach(struct q_head * x) =
	x == NULL ? \oset_empty() : \oset_union(\oset_singleton(x), sll_reach(x->first)))

_(logic _(dryad "unfold:queue") \bool unfold_queue(struct q_head * hd) =
	hd != NULL ==>
	(  (hd->first != NULL ==> unfold_sll_all_un(hd->first))
	&& (hd->last != NULL  ==> unfold_sll_all_un(hd->last))
	&& (hd->first != NULL ==> unfold_sll_all_bin(hd->first, hd->last)))
)

_(logic _(dryad "unfold:queue_R") \bool unfold_queue_reach(struct q_head * hd) =
	hd != NULL ==>
	(  (hd->first != NULL ==> unfold_sll_all_un(hd->first))
	&& (hd->last != NULL  ==> unfold_sll_all_un(hd->last))
	&& (hd->first != NULL ==> unfold_sll_all_bin(hd->first, hd->last)))
)

_(logic _(dryad "same:queue")  \bool same_queue(struct q_head * hd, \state enter, \state exit) =
	\at(enter, queue(hd)) == \at(exit, queue(hd))
	&& (hd != NULL ==> 
		   (hd->first != NULL ==> same_sll(hd->first, enter, exit))
		&& (hd->last  != NULL ==> same_sll(hd->last, enter, exit))
		&& (hd->first != NULL ==> same_sll_lseg(hd->first, hd->last, enter, exit)))
;)	

_(logic _(dryad "same:queue_R")  \bool same_queue_reach(struct q_head * hd, \state enter, \state exit) =
	\at(enter, queue(hd)) == \at(exit, queue(hd))
	&& (hd != NULL ==> 
		   (hd->first != NULL ==> same_sll_reach(hd->first, enter, exit))
		&& (hd->last  != NULL ==> same_sll_reach(hd->last, enter, exit))
		&& (hd->first != NULL ==> same_sll_lseg_reach(hd->first, hd->last, enter, exit)))
;)	

_(logic _(dryad "cond:sll")
  \bool cond_same_sll(struct q_head * x, struct q_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, sll_reach(y)))) ==> \at(enter, sll(y)) == \at(exit, sll(y)) ;)
_(logic  _(dryad "cond:sll_R")
  \bool cond_same_sll_reach(struct q_head * x, struct q_node * y, \state enter, \state exit) =
	  (! \oset_in(x, \at(enter, sll_reach(y)))) ==> \at(enter, sll_reach(y)) == \at(exit, sll_reach(y)) ;)
//_(logic  _(dryad "cond:llen_next")
//  \bool cond_same_sll_list_len_next(struct q_head * x, struct q_node * y, \state enter, \state exit) =
//	  (! \oset_in(x, \at(enter, sll_reach(y)))) ==> \at(enter, sll_list_len_next(y)) == \at(exit, sll_list_len_next(y)) ;)

_(logic _(dryad "cond:sll-all-un")
  \bool cond_same_sll_all_un(struct q_head * x, struct q_node * y, \state enter, \state exit) =
  	cond_same_sll(x, y, enter, exit) 
  	&& cond_same_sll_reach(x, y, enter, exit)
  	//&& cond_same_sll_list_len_next(x, y, enter, exit) 
;)
// ---------------------------------------------------------------------------------------------------------
_(logic _(dryad "cond:lseg")
  \bool cond_same_sll_lseg(struct q_head * x, struct q_node * hd, struct q_node * tl, 
                      \state enter, \state exit) = 
    ((! \oset_in(x, \at(enter, sll_lseg_reach(hd, tl)))) ==> 
      \at(enter, sll_lseg(hd, tl)) == \at(exit, sll_lseg(hd, tl)) ) ;)
_(logic _(dryad "cond:lseg_R")
  \bool cond_same_sll_lseg_reach(struct q_head * x, struct q_node * hd, struct q_node * tl, 
                            \state enter, \state exit) = 
    ((! \oset_in(x, \at(enter, sll_lseg_reach(hd, tl)))) ==> 
      \at(enter, sll_lseg_reach(hd, tl)) == \at(exit, sll_lseg_reach(hd, tl)) ) ;)
_(logic _(dryad "cond:lseg_len")
  \bool cond_same_sll_lseg_len_next(struct q_head * x, struct q_node * hd, struct q_node * tl, 
                            \state enter, \state exit) =
    ((! \oset_in(x, \at(enter, sll_lseg_reach(hd, tl)))) ==>
      \at(enter, sll_lseg_len_next(hd, tl)) == \at(exit, sll_lseg_len_next(hd, tl))) ;)

_(logic _(dryad "cond:sll-all-bin")
  \bool cond_same_sll_all_bin(struct q_head * x, struct q_node * hd, struct q_node * tl, \state enter, \state exit) =
       cond_same_sll_lseg(x, hd, tl, enter, exit) 
  	&& cond_same_sll_lseg_reach(x, hd, tl, enter, exit)
  	&& cond_same_sll_lseg_len_next(x, hd, tl, enter, exit)
;)
// ------------------------------------------------------------------------------------------------------

_(abstract _(dryad "end") void end_q_head_defs(struct q_head * x) ;)
// ---------------------------------------------------------------------------------------------------------



#endif
