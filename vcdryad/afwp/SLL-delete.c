#include "dryad_SLL.h"

_(dryad)
Node * delete(Node * h, int k) 
  _(requires sll(h))
  _(ensures  sll(\result))
{
  _(assume mutable_list(h))
  _(assume h != NULL ==> \malloc_root(h))
  Node * i = h;
  Node * j = NULL;
  Node * t = NULL;
  if (i == NULL) {
    return h;
  }
  while(i != NULL && t == NULL) 
    _(invariant sll(h))
    _(invariant sll(i))
    _(invariant sll_lseg(h, i))
    _(invariant \oset_disjoint(sll_lseg_reach(h, i), sll_reach(i)))
    _(invariant sll(t))
    _(invariant j != NULL ==> sll_lseg(h, j))
    _(invariant j != NULL ==> \oset_disjoint(sll_lseg_reach(h, j), sll_reach(j)))
    _(invariant t != NULL ==> sll_lseg(h, t))
    _(invariant t != NULL ==> \oset_disjoint(sll_lseg_reach(h, t), sll_reach(t)))
    _(invariant j != NULL ==> sll_lseg(j, t))
    _(invariant j != NULL ==> \oset_disjoint(sll_lseg_reach(j, t), sll_reach(t)))
    _(invariant j != NULL ==> j->next == i)
    _(invariant i != NULL ==> \malloc_root(i))
    _(invariant mutable_list(i))
  {
    if (i->key == k) {
      t = i;
    } else {
      j = i;
      i = i->next;
      _(assume mutable_list(i))
      _(assume i != NULL ==> \malloc_root(i))
    }
  }
  
  if (i != NULL) {
    if (j == NULL){
      h = i->next;
      free(i);
    } else {
      t = i->next;
      free(i);
      j->next = t;
    }
  }
  return h;
}
