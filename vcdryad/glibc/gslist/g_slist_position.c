#include "dryad_gslist_sll.h"

_(dryad)
int g_slist_position(Node * list, Node * link)
	_(requires sll(list))
	_(requires sll_list_len_next(list) < INT_MAX)
	_(ensures sll(list))
	_(ensures \result == -1 ==> !\oset_in(link, sll_reach(list)))
	_(ensures \oset_in(link, sll_reach(list)) ==> \result >= 0)
	_(ensures \result >= 0 ==> (sll_lseg(list, list) && \oset_disjoint(sll_lseg_reach(list, link), sll_reach(link))))//\lsegStar(list, link))
	_(ensures \result >= 0 ==> sll_lseg_len_next(list, link) == (\natural)\result)
{
	_(assume mutable_list(list))
	int i;

	i = 0;
	while(list != NULL)
		_(invariant sll(list))
		_(invariant sll_lseg(\old(list), list) && \oset_disjoint(sll_lseg_reach(\old(list), list), sll_reach(list)))//\lsegStar(\old(list), list))
		_(invariant !\oset_in(link, sll_lseg_reach(\old(list), list)))
		_(invariant mutable_list(list))
		_(invariant sll_list_len_next(\old(list)) - sll_list_len_next(list) == (\natural)i)
		_(invariant sll_lseg_len_next(\old(list), list) == (\natural) i)
		_(invariant i < INT_MAX)
		_(invariant i >= 0)
	{
		_(assume unfold_mutable_list(list))

		if (list == link) {
			return i;
		}
		i ++;
		list = list->next;
	}
	return -1;
}

