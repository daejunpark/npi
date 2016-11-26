#include "dryad_gslist_sll.h"

_(dryad)
Node * g_slist_find(Node * list, int data)
	_(requires sll(list))
	_(ensures  sll(\result))
	_(ensures sll_lseg(list, \result) && \oset_disjoint(sll_lseg_reach(list, \result), sll_reach(\result)))// \lsegStar(list, \result))
	_(ensures \result == NULL || \result->key == data)
{
	_(assume mutable_list(list))
	while(list != NULL)
		_(invariant sll(list))
		_(invariant sll_lseg(\old(list), list) && \oset_disjoint(sll_lseg_reach(\old(list), list), sll_reach(list)))//\lsegStar(\old(list), list))
		_(invariant mutable_list(list))
	{
		_(assume unfold_mutable_list(list))
		if (list->key == data) {
			break;
		}
		list = list->next;

	}
	return list;
}

