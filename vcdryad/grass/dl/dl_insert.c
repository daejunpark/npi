#include "dryad_dl.h"

_(pure) int havoc();

_(dryad)
DLNode * dl_insert(DLNode * lst, DLNode * elt)
  _(requires dll(lst))
  _(requires elt != NULL)
  _(requires elt->next == NULL)
  _(requires elt->prev == NULL)
  _(requires !\oset_in(elt, dll_reach(lst)))
  _(ensures dll(\result))
{
  _(assume mutable_list(lst))
  if (lst == NULL) {
    return elt;
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
    {
      nondet = havoc();
      curr = curr->next;
      _(assume mutable_list(curr))
    }
    DLNode * curr_next = curr->next;
    elt->next = curr_next;
    if (curr_next != NULL) {
      curr_next->prev = elt;
    }
    curr->next = elt;
    elt->prev = curr;
    return lst;
  }
}
