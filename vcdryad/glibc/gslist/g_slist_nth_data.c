#include "dryad_gslist_sll.h"

_(dryad)
int g_slist_nth_data(Node * list, int n _(out Node * ret_list))
	_(requires sll(list))
	_(requires n >= 0)
	_(ensures sll(list))
	_(ensures sll(ret_list))
	_(ensures sll_lseg(list, ret_list) && \oset_disjoint(sll_lseg_reach(list, ret_list), sll_reach(ret_list)))// \lsegStar(list, ret_list))
	_(ensures (\natural)n >= sll_list_len_next(list) ==> \result == -1)
	_(ensures ret_list != NULL ==> \result == ret_list->key)
	_(ensures ret_list != NULL ==> (sll_lseg_len_next(list, ret_list) == (\natural)n))
{
	_(ghost ret_list = list ;)
	_(assume mutable_list(list))
	int res;
	while(n > 0 && list != NULL)
		_(invariant sll(list))
		_(invariant sll(ret_list))
		_(invariant sll_lseg(\old(list), list) && \oset_disjoint(sll_lseg_reach(\old(list), list), sll_reach(list)))//\lsegStar(\old(list), list))
		_(invariant mutable_list(list))
		_(invariant n >= 0)
		_(invariant list == NULL ==> (\natural) \old(n) >= sll_list_len_next(\old(list)))
		_(invariant list != NULL ==> (sll_list_len_next(\old(list)) - sll_list_len_next(list)) == (\natural) (\old(n) - n))
		_(invariant list != NULL ==> (sll_lseg_len_next(\old(list), list) == (\natural) (\old(n) - n)))
		_(invariant ret_list == list)
	{
		_(assume unfold_mutable_list(list))
		n--;
		list = list->next;
    _(ghost ret_list = list ;)
	}
	if (list != NULL) {
		res = list->key;
	} else {
		res = -1;
	}
	return res;
}
