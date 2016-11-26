#include "dryad_SLL.h"

_(dryad)
Node * SLL_last(Node * h)
  _(requires sll(h))
  _(ensures sll(h))
  _(ensures sll(\result))
  _(ensures sll_lseg(h, \result))
  _(ensures \oset_disjoint(sll_lseg_reach(h, \result), sll_reach(\result)))
{
  _(assume mutable_list(h))
  Node * i = h;
  Node * j = NULL;
  while(i != NULL) 
    _(invariant sll(h))
    _(invariant sll(i))
    _(invariant sll_lseg(h, i))
    _(invariant \oset_disjoint(sll_lseg_reach(h, i), sll_reach(i)))
    _(invariant j != NULL ==> j->next == i)
    _(invariant sll(j))
    _(invariant sll_lseg(h, j))
    _(invariant \oset_disjoint(sll_lseg_reach(h, j), sll_reach(j)))
    _(invariant mutable_list(i))
  {
    j = i;
    i = i->next;
    _(assume mutable_list(i))
  }
  return j;
}
