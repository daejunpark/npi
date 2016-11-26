#include "dryad_dl.h"

_(dryad)
DLNode * dl_copy(DLNode * lst)
  _(requires dll(lst))
  _(ensures dll(lst))
  _(ensures dll(\result))
{
  _(assume mutable_list(lst))
  _(ghost \oset ALL_REACH = dll_reach(lst) ;)

  DLNode * curr = lst;
  DLNode * cp = NULL;
  while(curr != NULL)
    _(invariant dll(lst))
    _(invariant dll_lseg(lst, curr))
    _(invariant dll(curr))
    _(invariant \oset_disjoint(dll_lseg_reach(lst, curr), dll_reach(curr)))

    _(invariant dll(cp))
    _(invariant \oset_disjoint(dll_lseg_reach(lst, curr), dll_reach(cp)))
    _(invariant \oset_disjoint(dll_reach(cp), dll_reach(curr)))
    _(invariant \oset_disjoint(dll_reach(cp), dll_reach(lst)))

    _(invariant \oset_subset(dll_reach(lst), ALL_REACH))
    _(invariant \oset_subset(dll_reach(cp), ALL_REACH))
    _(invariant \oset_subset(dll_reach(curr), ALL_REACH))
  
    _(invariant mutable_list(curr))
    _(invariant mutable_list(cp))
  {
    DLNode * old_cp = cp;
    cp = (DLNode *) malloc(sizeof(DLNode));
    _(assume cp != NULL)
    _(assume !\oset_in(cp, ALL_REACH))
    _(ghost ALL_REACH = \oset_union(ALL_REACH, \oset_singleton(cp)) ;)
    cp->next = old_cp;
    if (old_cp != NULL) {
      old_cp->prev  = cp;
    }
    curr = curr->next;
    _(assume mutable_list(curr))
    _(assume mutable_list(cp))
  }
  return cp;
}

