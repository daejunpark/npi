#include "dryad_gslist_sll.h"

_(dryad)
Node * g_slist_copy(Node * list)
	_(requires sll(list))
	_(ensures sll(list) && sll(\result) && \oset_disjoint(sll_reach(list), sll_reach(\result)))//\sllStar(list, \result))
	_(ensures sll_keys(\result) == sll_keys(list)) 

{
	_(assume mutable_list(list))
  _(ghost \oset ALL_REACH = sll_reach(list) ;)

	Node * new_list = NULL;
	if (list != NULL) {
		Node * last = NULL;

		new_list = (Node *) malloc(sizeof(Node));
		_(assume new_list != NULL)
    _(assume !\oset_in(new_list, ALL_REACH))
    _(ghost ALL_REACH = \oset_union(ALL_REACH, \oset_singleton(new_list)) ;)
    
    int list_key = list->key;
		new_list->key = list_key;
		new_list->next = NULL; 

		last = new_list;

		_(assume mutable_list(list))
		list = list->next; 
		_(assume mutable_list(list))
		_(assume mutable_list(last))

		while(list != NULL)
			_(invariant sll(\old(list)) && sll(new_list) && \oset_disjoint(sll_reach(\old(list)), sll_reach(new_list)))//\sllStar(\old(list), new_list))
			_(invariant sll(list) && sll(new_list) && \oset_disjoint(sll_reach(list), sll_reach(new_list))) //\sllStar(list, new_list))
			_(invariant sll_lseg(\old(list), list) && \oset_disjoint(sll_lseg_reach(\old(list), list), sll_reach(list))) //\lsegStar(\old(list), list)) 
			_(invariant sll_lseg(new_list, last) && \oset_disjoint(sll_lseg_reach(new_list, last), sll_reach(last)))//\lsegStar(new_list, last))
			_(invariant \oset_disjoint(sll_reach(list), sll_reach(last)))
			_(invariant \oset_disjoint(sll_reach(\old(list)), sll_reach(last))) 
			_(invariant last->next == NULL)
      // TODO: handle in the loop invariant
			_(invariant \oset_subset(sll_reach(\old(list)), ALL_REACH)) 
			_(invariant \oset_subset(sll_reach(list), ALL_REACH)) 
			_(invariant \oset_subset(sll_reach(new_list), ALL_REACH))
			_(invariant sll_keys(new_list) == sll_lseg_keys(\old(list), list))
			_(invariant mutable_list(list))
			_(invariant last != NULL && mutable_list(last))
		{
			Node * tail = (Node *)malloc(sizeof(Node));
			_(assume tail != NULL)
      _(assume !\oset_in(tail, ALL_REACH))
      _(ghost ALL_REACH = \oset_union(ALL_REACH, \oset_singleton(tail)) ;)

      int list_key = list->key;
 			tail->key = list_key;
			tail->next = NULL;

			last->next = tail;
			last = last->next;

      _(assume unfold_mutable_list(list))
			list = list->next;
      _(assume mutable_list(list))
      _(assume mutable_list(last))
		}
	}
	
	return new_list;
}
