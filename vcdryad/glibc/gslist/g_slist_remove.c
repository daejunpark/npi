#include "dryad_gslist_sll.h"

_(dryad)
Node * g_slist_remove (Node * list, int data)
	_(requires sll(list))
	_(ensures  sll(\result))
{
	_(assume mutable_list(list))
	_(assume list != NULL ==> \malloc_root(list))

	Node *tmp;
  Node *prev = NULL;
	tmp = list;

	while(tmp != NULL)
		_(invariant sll(tmp))
		_(invariant sll(prev))
		_(invariant sll_lseg(list, tmp) && \oset_disjoint(sll_lseg_reach(list, tmp), sll_reach(tmp)))//\lsegStar(list, tmp))  
		_(invariant sll_lseg(list, prev) && \oset_disjoint(sll_lseg_reach(list, prev), sll_reach(prev)))//\lsegStar(list, prev)) //
		_(invariant prev == NULL ==> tmp == list)
		_(invariant prev != NULL ==> prev->next == tmp)
		_(invariant sll_reach(list) == \oset_union(sll_lseg_reach(list, tmp), sll_reach(tmp)))
		_(invariant tmp  != NULL ==> \malloc_root(tmp))
		_(invariant mutable_list(tmp))
		_(invariant mutable_list(prev))
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
			break;
		}
		
		prev = tmp;
		tmp = prev->next;

		_(assume tmp != NULL ==> \malloc_root(tmp))
		_(assume tmp != NULL ==> \mutable(tmp) && \writable(tmp))
	}
	return list;
}

