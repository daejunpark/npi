#include "dryad_srtl.h"

_(dryad)
Node * find_last_sorted(Node * l)
	_(requires srtl(l))
	_(ensures srtl(l))
	_(ensures srtl_lseg(l, \result) && \oset_disjoint(srtl_lseg_reach(l, \result), srtl_reach(\result))) //	_(ensures \srtlsegStar(l, \result)) 
	_(ensures  srtl(\result))
	_(ensures \result == NULL || \result->next == NULL)
	//_(ensures \oset_subset(sll_reach(\result), sll_reach(l)))
	//_(ensures \oset_subset(sll_lseg_reach(l, \result), sll_reach(l))) 
	//_(ensures \intset_le_one2(sll_keys(l), \result->key))
	//_(ensures sll_reach(l) == \old(sll_reach(l)))
	//_(ensures sll_keys(l) == \old(sll_keys(l)))
	//_(ensures l != NULL ==> \result != NULL)
	//_(ensures l != NULL ==> (sll_reach(\result) == \oset_singleton(\result)))
	//_(ensures l != NULL ==> \intset_in(\result->key, sll_keys(l)))
	//_(ensures l != NULL ==> (sll_keys(\result) == \intset_singleton(\result->key)))
{
	_(assume mutable_list(l))
  Node * curr = l;
	if (curr != NULL) {
	  while (curr->next != NULL)
			_(invariant srtl(l))
			_(invariant srtl(curr))
			_(invariant srtl_lseg(l, curr) && \oset_disjoint(srtl_lseg_reach(l, curr), srtl_reach(curr)))//\srtlsegStar(\old(l), l))
			_(invariant \intset_in(l->key, sll_keys(l)))
			_(invariant l != NULL && mutable_list(l))
			_(invariant sll_keys(l) == \intset_union(\intset_singleton(l->key), sll_keys(l->next)))
		{ 
			curr = curr->next;
			_(assume mutable_list(l))
		}
	}
	return curr;
}
