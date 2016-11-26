#include "dryad_gslist_sll.h"

_(dryad)
Node * g_slist_last(Node * list)
  _(requires sll(list))
  _(ensures  sll(list) == \old(sll(list))
             && sll_reach(list) == \old(sll_reach(list)) 
             && sll_keys(list) == \old(sll_keys(list)))
  _(ensures sll(\result))
  _(ensures sll_keys(list) == \old(sll_keys(list)))
  _(ensures list != NULL ==> \result != NULL)
  _(ensures !\oset_in(\result, sll_lseg_reach(list, \result)))
  _(ensures sll_lseg(list, \result) && \oset_disjoint(sll_lseg_reach(list, \result), sll_reach(\result)))//\lsegStar(list, \result))
  _(ensures \result != NULL ==> sll_keys(\result) == \intset_singleton(\result->key))
{
  _(assume mutable_list(list))
  if (list != NULL) 
  {
    while(list->next != NULL) 
      _(invariant sll(list))
      _(invariant sll(\old(list)))
      _(invariant sll_lseg(\old(list), list) && \oset_disjoint(sll_lseg_reach(\old(list), list), sll_reach(list))) 
      _(invariant list != NULL && mutable_list(list))
      _(invariant sll_keys(list) == \intset_union(sll_keys(list->next), \intset_singleton(list->key)))
    {
      list = list->next;
      _(assume mutable_list(list))
    }
   
  }
  return list;
}
