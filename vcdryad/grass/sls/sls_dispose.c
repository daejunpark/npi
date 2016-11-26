#include "dryad_sls.h"

_(dryad)
void sls_dispose(Node * lst _(out \oset ALL_REACH))
  _(requires srtl(lst))
  _(ensures ALL_REACH == \oset_empty())
{
  _(assume mutable_list(lst))
  _(assume lst != NULL ==> \malloc_root(lst))
  _(ghost ALL_REACH = srtl_reach(lst) ;)

  while(lst != NULL) 
    _(invariant srtl(lst))
    _(invariant ALL_REACH == srtl_reach(lst))
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
