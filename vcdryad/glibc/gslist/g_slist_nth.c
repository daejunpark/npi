#include "dryad_gslist_sll.h"

_(dryad)
Node * g_slist_nth(Node * list, int n)
	_(requires sll(list))
	_(requires n >= 0)
	_(ensures sll(list))
	_(ensures sll(\result))
	_(ensures \result == NULL ==> ((\natural) n >= sll_list_len_next(list)))
	_(ensures \result != NULL ==> ((sll_list_len_next(list) - sll_list_len_next(\result)) == (\natural) n))
	_(ensures \result != NULL ==> (sll_lseg_len_next(list, \result) == (\natural) n))
	_(ensures sll_lseg(list, \result) && \oset_disjoint(sll_lseg_reach(list, \result), sll_reach(\result)))//\lsegStar(list, \result))
{
	_(assume mutable_list(list))

	while(n > 0 && list != NULL)
		_(invariant sll(list))
		_(invariant sll_lseg(\old(list), list) && \oset_disjoint(sll_lseg_reach(\old(list), list), sll_reach(list)))//\lsegStar(\old(list), list))
		_(invariant mutable_list(list))
		_(invariant n >= 0)
		_(invariant list == NULL ==> ((\natural)\old(n) >= sll_list_len_next(\old(list))))
		_(invariant list != NULL ==> (\natural)(\old(n) - n) == (sll_list_len_next(\old(list)) - sll_list_len_next(list)))
		_(invariant sll_list_len_next(\old(list)) == (sll_lseg_len_next(\old(list), list) + sll_list_len_next(list)))
		_(invariant list != NULL ==> (sll_lseg_len_next(\old(list), list) == (\natural)(\old(n) - n)))
	{
		_(assume unfold_mutable_list(list))
		n--;
		list = list->next; 
	}
	return list;
}

