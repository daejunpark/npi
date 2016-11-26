#include "dryad_srtl.h"

_(dryad)
Node * sorted_insert_iter(Node * l, int k)
	_(requires srtl(l))
  _(requires !\intset_in(k, sll_keys(l)))
	_(ensures srtl(\result))
	_(ensures sll_keys(\result) == \intset_union(\old(sll_keys(l)), \intset_singleton(k)))
{

	_(assume mutable_list(l))
	if (l == NULL) {
		Node * tl = (Node *) malloc(sizeof(Node));
		_(assume tl != NULL)

		tl->key = k;
		tl->next = NULL;

		return tl;
	} else {
		if (k <= l->key) { // new list is the head

			Node * hd = (Node *) malloc(sizeof(Node));
			_(assume hd != NULL)

			hd->key = k;
			hd->next = l;

			return hd;
			
		} else {
			_(assume unfold_mutable_list(l))

			Node * prev = l;
			Node * next = l->next;
			while(next != NULL && k > next->key) 
				_(invariant srtl(next))
        _(invariant !\intset_in(k, sll_keys(next)))
        _(invariant \intset_le_one1(prev->key, sll_keys(next)))
		    _(invariant \intset_le_one2(sll_lseg_keys(l, prev), k))
				_(invariant prev->key < k)
				_(invariant \oset_disjoint(sll_lseg_reach(l, prev), sll_reach(next)))
				_(invariant !\oset_in(prev, sll_reach(next))) 
				_(invariant srtl_lseg(l, prev) && \oset_disjoint(srtl_lseg_reach(l, prev), srtl_reach(prev))) //\srtlsegStar(l, prev))
				_(invariant prev != NULL)
        //_(invariant sll_keys(l) == \old(sll_keys(l)))
        //_(invariant \old(sll_keys(l)) == \intset_union(sll_lseg_keys(l, prev), sll_keys(prev)))
        //_(invariant \old(sll_keys(l)) == \intset_union(sll_lseg_keys(l, prev), 
        //                                \intset_union(\intset_singleton(prev->key), sll_keys(next))))
				_(invariant prev->next == next)
				_(invariant mutable_list(next))
				_(invariant mutable_list(prev))
			{
				_(assume unfold_mutable_list(next))
				prev = next;
				next = next->next;
			}
    
			Node * curr = (Node *) malloc(sizeof(Node));
      _(assume curr != NULL)
      curr->next = NULL;
			curr->key = k;
			curr->next = next;
			prev->next = curr;
			
			return l;
		}
	}
}

