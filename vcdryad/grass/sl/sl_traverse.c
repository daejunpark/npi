#include "dryad_sl.h"

_(dryad)
void sl_traverse1(Node * lst)
  _(requires sll(lst))
  _(ensures  sll(lst))
{
  _(assume mutable_list(lst))
  Node * curr = lst;
  while(curr != NULL) 
    _(invariant sll(curr))
    _(invariant mutable_list(curr))
  {
    curr = curr->next;
    _(assume mutable_list(curr))
  }
}

_(dryad)
void sl_traverse2(Node * lst)
  _(requires sll(lst))
  _(ensures  sll(lst))
{
  _(assume mutable_list(lst))
  Node * curr;
  if (lst != NULL) {
    curr = lst;
    while(curr != NULL) 
      _(invariant sll(curr))
      _(invariant mutable_list(curr))
    {
      curr = curr->next;
      _(assume mutable_list(curr))
    }
  }
}
