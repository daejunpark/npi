#include "dryad_sl.h"

_(dryad)
Node * sl_reverse(Node * lst)
  _(requires sll(lst))
  _(ensures  sll(\result))
{
  _(assume mutable_list(lst))
  Node * curr = lst;
  Node * rev = NULL;
  while(curr != NULL) 
    _(invariant sll(rev))
    _(invariant sll(curr))
    _(invariant \oset_disjoint(sll_reach(rev), sll_reach(curr)))
    _(invariant mutable_list(curr))
  {
    Node * tmp;
    tmp = curr;
    curr = curr->next;
    _(assume mutable_list(curr))
    tmp->next = rev;
    rev = tmp;
  }
  return rev;
}
