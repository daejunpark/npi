#include "dryad_gslist_sll.h"

_(dryad)
int g_slist_index(Node * list, int data _(out Node *ret_list))
	_(requires sll(list))
	_(requires sll_list_len_next(list) < INT_MAX)
	_(ensures sll(list))
	_(ensures \intset_in(data, sll_keys(list)) <==> \result >= 0)
	_(ensures !\intset_in(data, sll_keys(list)) <==> \result == -1)
	_(ensures sll_lseg(list, ret_list) && \oset_disjoint(sll_lseg_reach(list, ret_list), sll_reach(ret_list)))//\lsegStar(list, ret_list))
	_(ensures ret_list != NULL ==> sll_lseg_len_next(list, ret_list) == (\natural) \result)
	_(ensures ret_list != NULL ==> ret_list->key == data)
{
	_(assume mutable_list(list))
	_(ghost ret_list = list ;)
	int i; 

	i = 0;
	while(list != NULL)
		_(invariant sll(list))
		_(invariant sll(\old(list)))
		_(invariant sll_lseg(\old(list), list) && \oset_disjoint(sll_lseg_reach(\old(list), list), sll_reach(list)))//\lsegStar(\old(list), list))
		_(invariant sll_list_len_next(\old(list)) - sll_list_len_next(list) == (\natural) i)
		_(invariant !\intset_in(data, sll_lseg_keys(\old(list), list)))
		_(invariant sll_lseg_len_next(\old(list), list) == (\natural) i)
		_(invariant i < INT_MAX)
		_(invariant i >= 0)
		_(invariant mutable_list(list))
		_(invariant ret_list == list)
	{
		if(list->key == data) {
			return i;
		}
		i ++;
		list = list->next;
		_(ghost ret_list = list ;)
    _(assume mutable_list(list))
	}
	return -1;
}

