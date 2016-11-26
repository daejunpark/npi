#include "dryad_gslist_sll.h"

_(dryad)
void g_slist_free(Node * l _(out \oset ALL_REACH))
  _(requires sll(l))
  _(ensures ALL_REACH == \oset_empty())
{
  _(assume mutable_list(l))
  _(assume l != NULL ==> \malloc_root(l))
  _(ghost ALL_REACH = sll_reach(l))
  
  Node * x = l;
  while(x != NULL)
    _(invariant sll(x))
    _(invariant mutable_list(x))
    _(invariant x != NULL ==> \malloc_root(x))
    _(invariant ALL_REACH == sll_reach(x))
  {
    _(assume unfold_mutable_list(x))
    _(assume x != NULL && x->next != NULL ==> (\malloc_root(x->next) == \malloc_root(x)))
    Node * next = x->next;
    free(x);
    _(ghost ALL_REACH = \oset_diff(ALL_REACH, \oset_singleton(x)) ;)
    x = next;
  }
  
}
