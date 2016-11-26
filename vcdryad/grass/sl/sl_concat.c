#include "dryad_sl.h"

_(dryad)
Node * concat(Node * a, Node * b)
  _(requires sll(a))
  _(requires sll(b))
  _(requires \oset_disjoint(sll_reach(a), sll_reach(b)))
  _(ensures sll(\result))
{
  _(assume mutable_list(a))
  if (a == NULL) {
    return b;
  }  else {
    Node * curr;
    curr = a;
    while(curr->next != NULL) 
      _(invariant curr != NULL)
      _(invariant sll(a))
      _(invariant sll(curr))
      _(invariant sll_lseg(a, curr))
      _(invariant \oset_disjoint(sll_lseg_reach(a, curr), sll_reach(curr)))
      _(invariant mutable_list(curr))
    {
       curr = curr->next;
       _(assume mutable_list(curr))
    }
    curr->next = b;
    return a;
  }
}
