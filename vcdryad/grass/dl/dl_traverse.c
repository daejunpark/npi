#include "dryad_dl.h"

_(dryad)
void dl_traverse(DLNode * lst)
  _(requires dll(lst))
  _(ensures  dll(lst))
{
  _(assume mutable_list(lst))
  DLNode * curr = lst;
  while(curr != NULL) 
    _(invariant dll(curr))
    _(invariant mutable_list(curr))
  {
    curr = curr->next;
    _(assume mutable_list(curr))
  }
}

