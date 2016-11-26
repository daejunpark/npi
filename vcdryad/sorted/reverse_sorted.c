#include "dryad_srtl.h"

_(dryad)
Node * reverse_sorted(Node * l)
	_(requires srtl(l))
	_(ensures rsrtl(\result))
	_(ensures sll_keys(\result) == \old(sll_keys(l)))
{
	_(assume l != NULL ==> \mutable(l) && \writable(l))
	Node * r = NULL;

	while(l != NULL)
		_(invariant srtl(l))
		_(invariant rsrtl(r))
		_(invariant \oset_disjoint(srtl_reach(l), rsrtl_reach(r)))
		_(invariant r != NULL && l != NULL ==> sll_max_key(r) <= l->key)
		_(invariant \old(sll_keys(l)) == \intset_union(sll_keys(l), sll_keys(r)))
		_(invariant l != NULL ==> mutable_list(l))
	{
		Node * t = l->next;
		
		l->next = r;
		r = l;
		l = t;
  	_(assume l != NULL ==> \mutable(l) && \writable(l))
	}
	return r;
}

