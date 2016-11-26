#include "dryad_gslist_sll.h"

_(dryad)
unsigned int g_slist_length(Node * list)
	_(requires sll(list))
	_(requires sll_list_len_next(list) < UINT_MAX)
	_(ensures  sll(list))
	_(ensures \result == sll_list_len_next(list))
{
	_(assume mutable_list(list))
	unsigned int length;

	length = 0;
	while(list != NULL)
		_(invariant sll(list))
		_(invariant sll(\old(list)))
		_(invariant sll_lseg(\old(list), list) && \oset_disjoint(sll_lseg_reach(\old(list), list), sll_reach(list)))//\lsegStar(\old(list), list))
		_(invariant sll_list_len_next(\old(list)) - sll_list_len_next(list) == (\natural) length) 
		_(invariant length < UINT_MAX) 
		_(invariant mutable_list(list))
	{
		_(assume unfold_mutable_list(list))
		length++; 
		list = list->next;
	}
	return length;
}

