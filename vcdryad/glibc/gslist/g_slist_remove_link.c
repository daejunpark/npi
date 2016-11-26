#include "dryad_gslist_sll.h"

_(dryad)
Node * g_slist_remove_link(Node * list, Node * link)
	_(requires sll(list))
	_(requires sll(link) && \malloc_root(link)) 
	_(ensures sll(\result)) 
	_(ensures sll(link) && \malloc_root(link)) 
	_(ensures !\oset_in(link, \old(sll_reach(list))) ==> \old(sll_reach(list)) == sll_reach(\result)) 
	_(ensures  \oset_in(link, \old(sll_reach(list))) ==> (sll_reach(\result) == \oset_diff(\old(sll_reach(list)), \oset_singleton(link)))) 
{
	_(assume mutable_list(list))
	Node * tmp;
	Node * prev;

	prev = NULL;
	tmp = list;

	while(tmp != NULL)
		_(invariant sll(prev))
		_(invariant sll(tmp))
		_(invariant sll(list))
		_(invariant sll_lseg(list, prev) && \oset_disjoint(sll_lseg_reach(list, prev), sll_reach(prev)))//\lsegStar(list, prev)) //
		_(invariant sll_lseg(list, tmp) && \oset_disjoint(sll_lseg_reach(list, tmp), sll_reach(tmp)))//\lsegStar(list, tmp))  
		_(invariant sll_reach(list) == \oset_union(sll_lseg_reach(list, prev), sll_reach(prev)))
		_(invariant sll_reach(list) == \oset_union(sll_lseg_reach(list, tmp), sll_reach(tmp)))
		_(invariant sll_reach(list) == \old(sll_reach(list)))
		_(invariant \oset_subset(sll_reach(prev), sll_reach(list)))
		_(invariant \oset_subset(sll_reach(tmp), sll_reach(list))) 
		_(invariant !\oset_in(link, sll_lseg_reach(list, tmp))) 
		_(invariant prev == NULL ==> tmp == list)
		_(invariant prev != NULL ==> prev->next == tmp)
		_(invariant mutable_list(prev))
		_(invariant mutable_list(tmp))
		_(invariant \malloc_root(link))
	{
		if (tmp == link)
		{
			Node * tmp_next = tmp->next;

			if (prev != NULL) {

				prev->next = tmp_next;

			} else {
				list = tmp_next;
			}

			tmp->next = NULL;
			break;	
		}
		prev = tmp;
		tmp = tmp->next;
		_(assume mutable_list(tmp))
	}
	return list;
}

