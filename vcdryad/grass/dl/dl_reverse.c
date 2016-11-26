#include "dryad_dl.h"

_(dryad)
DLNode * dl_reverse(DLNode * lst)
  _(requires dll(lst))
  _(ensures  dll(\result))
{
  _(assume mutable_list(lst))
  DLNode * curr = lst;
  DLNode * rev = NULL;
  while(curr != NULL) 
    _(invariant dll(rev))
    _(invariant dll(curr))
    _(invariant \oset_disjoint(dll_reach(rev), dll_reach(curr)))
    _(invariant mutable_list(curr))
  {
    DLNode * tmp;
    tmp = curr;
    curr = curr->next;
    _(assume mutable_list(curr))
    tmp->next = rev;
    if(rev != NULL) {
      rev->prev = tmp;
    }
    rev = tmp;
  }
  return rev;
}
