#include "dryad_gslist_sll.h"

_(dryad)
Node * g_slist_reverse(Node * list)
	_(requires sll(list))
	_(ensures sll(\result))
	_(ensures sll_keys(\result) == \old(sll_keys(list)))
{
	_(assume mutable_list(list))
	Node * prev = NULL;
	while(list != NULL) 
		_(invariant sll(list) && sll(prev) && \oset_disjoint(sll_reach(list), sll_reach(prev)))//\sllStar(list, prev))
		_(invariant mutable_list(list))
		_(invariant \intset_union(sll_keys(list), sll_keys(prev)) == \old(sll_keys(list)))
	{
		_(assume unfold_mutable_list(list))

		Node * next = list->next;
		list->next = prev;
		prev = list;
		list = next;
	}
	return prev;
}
