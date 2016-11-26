#include "dryad_dl.h"

_(dryad)
DLNode * dl_concat(DLNode * a, DLNode * b)
  _(requires dll(a))
  _(requires dll(b))
  _(requires \oset_disjoint(dll_reach(a), dll_reach(b)))
  _(ensures dll(\result))
  _(ensures dll_lseg(\result, b))
  _(ensures \oset_disjoint(dll_lseg_reach(\result, b), dll_reach(b)))
{
  _(assume mutable_list(a))
  if (a == NULL) {
    return b;
  }  else {
    DLNode * curr;
    curr = a;
    while(curr->next != NULL) 
      _(invariant curr != NULL)
      _(invariant dll(a))
      _(invariant dll(curr))
      _(invariant dll_lseg(a, curr))
      _(invariant \oset_disjoint(dll_lseg_reach(a, curr), dll_reach(curr)))
      _(invariant mutable_list(curr))
    {
       curr = curr->next;
       _(assume mutable_list(curr))
    }
    curr->next = b;
    if (b != NULL) {
      b->prev = curr;
    }
    return a;
  }
}
