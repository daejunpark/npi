#include "dryad_gslist_sll.h"

Node * g_slist_prepend (Node * list, int data)
  _(requires sll(list))
  _(ensures  sll(\result))
  _(ensures  sll_keys(\result) == \intset_union(\old(sll_keys(list)), \intset_singleton(data)))
  _(ensures  !\oset_in(\result, \old(sll_reach(list))))
;

Node * g_slist_append(Node * list, int data)
  _(requires sll(list))
  _(ensures sll(\result))
  _(ensures sll_keys(\result) == \intset_union(\old(sll_keys(list)), \intset_singleton(data)))
;

_(dryad)
Node * g_slist_insert(Node * list, int data, int pos)
  _(requires sll(list))
  _(ensures sll(\result))
  _(ensures sll_keys(\result) == \intset_union(\old(sll_keys(list)), \intset_singleton(data)))
{
  if (pos < 0) {
    return g_slist_append(list, data);
  } 
  if (pos == 0) {
    return g_slist_prepend(list, data);
  }
  _(assume mutable_list(list))    
  Node * prev_list;
  Node * tmp_list;
  Node * new_list;

  new_list = (Node *) malloc(sizeof(Node));
  _(assume new_list != NULL)
  new_list->key = data;

  if (list == NULL) {
    new_list->next = NULL;
    return new_list;
  }

  tmp_list = list;
  prev_list = tmp_list;

  while(pos > 0 && tmp_list != NULL)
    _(invariant prev_list == tmp_list || prev_list->next == tmp_list)
    _(invariant prev_list != tmp_list ==> prev_list->next == tmp_list)
    _(invariant pos >= 0)
    _(invariant sll(tmp_list))
    _(invariant sll(prev_list))
    _(invariant sll(list))
    _(invariant sll_lseg(list, tmp_list) &&  \oset_disjoint(sll_lseg_reach(list, tmp_list), sll_reach(tmp_list))) //\lsegStar(list, tmp_list))
    _(invariant sll_lseg(list, prev_list) && \oset_disjoint(sll_lseg_reach(list, prev_list), sll_reach(prev_list))) // \lsegStar(list, prev_list))
    _(invariant prev_list != NULL && mutable_list(prev_list))
    _(invariant mutable_list(tmp_list))
  {
    _(assume unfold_mutable_list(tmp_list))
    pos --;
    prev_list = tmp_list;
    tmp_list = tmp_list->next;
 
  }

  Node * tmp_prev = prev_list->next;
  new_list->next = tmp_prev;
  prev_list->next = new_list;
  return list;
}
