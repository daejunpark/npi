#include "dryad_dl.h"

_(pure) int havoc();

_(dryad)
DLNode * dl_remove(DLNode * lst)
  _(requires dll(lst))
  _(ensures dll(\result))
{
  _(assume mutable_list(lst))
  _(assume lst != NULL ==> \malloc_root(lst))
  if (lst == NULL) {
    return NULL;
  } else {
    int nondet;
    DLNode * curr = lst;
    while(nondet && curr->next != NULL)
      _(invariant curr != NULL)
      _(invariant dll(lst))
      _(invariant dll(curr))
      _(invariant dll_lseg(lst, curr))
      _(invariant \oset_disjoint(dll_lseg_reach(lst, curr), dll_reach(curr)))
      _(invariant mutable_list(curr))
      _(invariant \malloc_root(curr))
    {
      nondet = havoc();
      curr = curr->next;
      _(assume mutable_list(curr))
      _(assume \malloc_root(curr))
    }
    DLNode * tmp = curr->next;
    _(assume mutable_list(tmp))
    _(assume tmp != NULL ==> \malloc_root(tmp))
    if (tmp != NULL) {
      DLNode * tmp_next = tmp->next;
      curr->next = tmp_next;
      if(tmp_next != NULL){
        tmp_next->prev = curr;
      }
      free(tmp);
    }
    return lst;
  }
}
