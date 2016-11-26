#include "dryad_dl.h"

_(dryad)
DLNode * dl_filter(DLNode * x)
  _(requires dll(x))
  _(ensures dll(\result))
{
  _(assume mutable_list(x))
  _(assume x != NULL ==> \malloc_root(x))
  DLNode * prv = NULL;
  DLNode * curr = x;
  DLNode * res = x;
  while(curr != NULL) 
    _(invariant dll(prv))
    _(invariant dll(res))
    _(invariant dll_lseg(res, prv))
    _(invariant \oset_disjoint(dll_lseg_reach(res, prv), dll_reach(prv)))
    _(invariant prv != NULL ==> prv->next == curr)
    _(invariant prv == NULL ==> res == curr)

    _(invariant mutable_list(prv))
    _(invariant mutable_list(curr))
    _(invariant curr != NULL ==> \malloc_root(curr))
  {
    DLNode * old_curr = curr;
    curr = curr->next;
    _(assume mutable_list(curr))
    _(assume curr != NULL ==> \malloc_root(curr))
    int nondet;
    if(nondet) {
      if (prv != NULL) {
        DLNode * old_curr_next = old_curr->next;
        prv->next = old_curr_next;
        if (old_curr_next != NULL) {
          old_curr_next->prev = prv;
        }
      } else {
        res = old_curr->next;
        if (res != NULL) res->prev = NULL;
      }
      free(old_curr);
    } else {
      prv = old_curr;
    }
  }
  return res;
}
