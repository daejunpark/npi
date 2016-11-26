#include "dryad_sl.h"

_(dryad)
Node * sl_filter(Node * x)
  _(requires sll(x))
  _(ensures sll(\result))
{
  _(assume mutable_list(x))
  _(assume x != NULL ==> \malloc_root(x))
  Node * prv = NULL;
  Node * curr = x;
  Node * res = x;
  while(curr != NULL) 
    _(invariant sll(prv))
    _(invariant sll(res))
    _(invariant sll_lseg(res, prv))
    _(invariant \oset_disjoint(sll_lseg_reach(res, prv), sll_reach(prv)))
    _(invariant prv != NULL ==> prv->next == curr)
    _(invariant prv == NULL ==> res == curr)

    _(invariant mutable_list(prv))
    _(invariant mutable_list(curr))
    _(invariant curr != NULL ==> \malloc_root(curr))
  {
    Node * old_curr = curr;
    curr = curr->next;
    _(assume mutable_list(curr))
    _(assume curr != NULL ==> \malloc_root(curr))
    int nondet;
    if(nondet) {
      if (prv != NULL) {
        Node * old_curr_next = old_curr->next;
        prv->next = old_curr_next;
      } else {
        res = old_curr->next;
      }
      free(old_curr);
    } else {
      prv = old_curr;
    }
  }
  return res;
}
