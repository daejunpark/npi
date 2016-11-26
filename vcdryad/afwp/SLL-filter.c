#include "dryad_SLL.h"

_(pure) int to_remove(Node * z);
// 1 if x should be removed
// 0 otherwise

_(dryad)
Node * filter(Node * h)
  _(requires sll(h))
  _(requires !to_remove(h))
  _(ensures sll(h))
  _(ensures sll(\result))
{
  _(assume mutable_list(h))
  Node * i = h;
  Node * j = NULL;
  while(i != NULL) 
    _(invariant sll(h))
    _(invariant sll(i))
    _(invariant sll_lseg(h, i))
    _(invariant \oset_disjoint(sll_lseg_reach(h, i), sll_reach(i)))
    _(invariant sll(j))
    _(invariant i != h ==> j != NULL)
    _(invariant j != NULL ==> sll_lseg(j, i))
    _(invariant j != NULL ==> \oset_disjoint(sll_lseg_reach(j, i), sll_reach(i)))
    _(invariant j != NULL ==> sll_lseg(h, j))
    _(invariant j != NULL ==> \oset_disjoint(sll_lseg_reach(h, j), sll_reach(j)))
    _(invariant j != NULL ==> j->next == i)
    _(invariant mutable_list(i))
  {
    if (to_remove(i)) {
      Node * inxt = i->next;
      j->next = inxt;
    } else {
      j = i;
    }
    i = i->next;
    _(assume mutable_list(i))
  }
  return j;
}
