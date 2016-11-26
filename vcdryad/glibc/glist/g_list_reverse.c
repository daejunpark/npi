#include "dryad_dll_lseg_defs.h"

_(logic \bool mutable_list(DLNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
DLNode * g_list_reverse(DLNode * list) 
  _(requires dll(list))
  _(requires list != NULL ==> list->prev == NULL)
  _(ensures dll(\result))
{
  _(assume mutable_list(list))
  DLNode * last = NULL;
  DLNode * curr = list;
  while(curr != NULL) 
    _(invariant dll(last))
    _(invariant dll(curr))
    _(invariant \oset_disjoint(dll_reach(curr), dll_reach(last)))
    _(invariant last != NULL ==> last->prev == curr)
    _(invariant curr != NULL ==> curr->prev == last)
    _(invariant mutable_list(curr))
  {
    last = curr;
    curr = curr->next;
    DLNode * last_prev = last->prev;
    last->next = last_prev;
    last->prev = curr;
    _(assume mutable_list(curr))
  }
  return last;
}
