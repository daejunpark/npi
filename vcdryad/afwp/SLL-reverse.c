#include "dryad_SLL.h"

_(dryad)
Node * SLL_reverse(Node * h)
  _(requires sll(h))
  _(ensures sll(\result))
{
  _(assume mutable_list(h))
  Node * i = h;
  Node * j = NULL;
  while(i != NULL)
    _(invariant sll(i))
    _(invariant sll(j))
    _(invariant \oset_disjoint(sll_reach(i), sll_reach(j)))
    _(invariant mutable_list(i))
  {
    Node * k = i->next;
    i->next = j;
    j = i;
    i = k;
    _(assume mutable_list(i))
  }
  return j;
}
