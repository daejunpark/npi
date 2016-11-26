#include "dryad_gslist_sll.h"

_(dryad)
Node * g_slist_remove_all(Node * list, int data)
	_(requires sll(list))
	_(ensures  sll(\result))
	_(ensures !\intset_in(data, \old(sll_keys(list))) ==> (sll_keys(\result) == \old(sll_keys(list))))
	_(ensures !\intset_in(data, sll_keys(\result)))
	//_(ensures  \intset_in(data, \old(sll_keys(list))) ==> (sll_keys(\result) == \intset_diff(\old(sll_keys(list)), \intset_singleton(data))))

{
	_(assume list != NULL ==> \mutable(list) && \writable(list) && \malloc_root(list))
	Node *tmp, *prev = NULL;
	tmp = list;

	while(tmp != NULL)
		_(invariant sll(tmp) && sll(prev) && sll(list))
		_(invariant sll_lseg(list, tmp) && \oset_disjoint(sll_lseg_reach(list, tmp), sll_reach(tmp)))//\lsegStar(list, tmp))  
		_(invariant sll_lseg(list, prev) && \oset_disjoint(sll_lseg_reach(list, prev), sll_reach(prev)))//\lsegStar(list, prev)) //
		_(invariant !\intset_in(data, \old(sll_keys(list))) ==> (sll_keys(list) == \old(sll_keys(list))))
		_(invariant !\intset_in(data, sll_lseg_keys(list, tmp)))
		_(invariant \intset_in(data, \old(sll_keys(list))) ==> (\intset_in(data, sll_keys(list)) || !\intset_in(data, sll_keys(list)))) 

		_(invariant \intset_in(data, sll_keys(tmp)) <==> \intset_in(data, sll_keys(list)))
		_(invariant sll_keys(list) == \intset_union(sll_lseg_keys(list, tmp), sll_keys(tmp)))
		_(invariant prev != NULL ==> prev->next == tmp)
		_(invariant tmp  != NULL ==> \mutable(tmp) && \writable(tmp) && \malloc_root(tmp))
		_(invariant prev != NULL ==> \mutable(prev) && \writable(prev))
	{

		if (tmp->key == data)
		{
			Node * tmp_next = tmp->next;

			if (prev != NULL) {
				prev->next = tmp_next;
			} else {
				list = tmp_next;
			}

			free(tmp);

			tmp = tmp_next;

		} else {
			prev = tmp;
			tmp = prev->next;
		}
		
		_(assume tmp != NULL ==> \mutable(tmp) && \writable(tmp) && \malloc_root(tmp))
	}
	return list;
}

