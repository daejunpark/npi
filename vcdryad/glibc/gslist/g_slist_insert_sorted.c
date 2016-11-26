#include "dryad_gslist.h"

_(dryad)
Node * g_slist_insert_sorted(Node * list, int data)
	_(requires srtl(list))
	_(ensures  srtl(\result))
	_(ensures  sll_keys(\result) == \intset_union(\old(sll_keys(list)), \intset_singleton(data)))
{
	_(assume mutable_list(list))
	Node * tmp_list = list;
	Node * prev_list = NULL;
	Node * new_list = NULL;

	if (list == NULL) {
		new_list = (Node *) malloc(sizeof(Node));
		_(assume new_list != NULL)
		new_list->key = data;
		new_list->next = NULL;
		return new_list;
	}

	while(tmp_list->next != NULL && tmp_list->key < data) 
		_(invariant srtl(list))
		_(invariant srtl(prev_list))
		_(invariant srtl(tmp_list))
		_(invariant srtl_lseg(list, tmp_list) && \oset_disjoint(srtl_lseg_reach(list, tmp_list), srtl_reach(tmp_list)))//\srtlsegStar(list, tmp_list))
		_(invariant srtl_lseg(list, prev_list) && \oset_disjoint(srtl_lseg_reach(list, prev_list), srtl_reach(prev_list)))//\srtlsegStar(list, prev_list))
		_(invariant prev_list == NULL ==> tmp_list == list)
		_(invariant prev_list != NULL ==> prev_list->next == tmp_list)
		_(invariant prev_list != NULL ==> \intset_lt_one2(sll_lseg_keys(list, prev_list), data))
		_(invariant prev_list != NULL ==> \intset_lt_one2(sll_lseg_keys(list, tmp_list), data))
		_(invariant prev_list != NULL ==> data >= prev_list->key)
		_(invariant mutable_list(prev_list))
		_(invariant tmp_list != NULL && mutable_list(tmp_list))
	{
		_(assume unfold_mutable_list(tmp_list))
		prev_list = tmp_list;
		tmp_list = tmp_list->next;
	}

	new_list = (Node *) malloc(sizeof(Node));
	_(assume new_list != NULL)
	new_list->key = data;
	if (tmp_list->next == NULL && data >= tmp_list->key) { 
		tmp_list->next = new_list;
		new_list->next = NULL;
		return list;
	}

	if (prev_list != NULL) {
		new_list->next = NULL;
		prev_list->next = new_list;
		new_list->next = tmp_list;
		return list;
	} else {
		new_list->next = list;
		return new_list;
	}
}	
