#include "dryad_sl.h"

_(dryad)
void dispose(Node * lst _(out \oset ALL_REACH))
  _(requires sll(lst))
  _(ensures ALL_REACH == \oset_empty())
{
  _(assume mutable_list(lst))
  _(assume lst != NULL ==> \malloc_root(lst))
  _(ghost ALL_REACH = sll_reach(lst) ;)

  while(lst != NULL) 
    _(invariant sll(lst))
    _(invariant ALL_REACH == sll_reach(lst))
    _(invariant mutable_list(lst))
    _(invariant lst != NULL ==> \malloc_root(lst))
  {
    Node * curr = lst;
    lst = lst->next;
    _(assume mutable_list(lst))
    _(assume lst != NULL ==> \malloc_root(lst))
    free(curr);
    _(ghost ALL_REACH = \oset_diff(ALL_REACH, \oset_singleton(curr)))
  }
}
