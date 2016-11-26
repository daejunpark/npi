#include "dryad_sls.h"

_(dryad)
Node * sls_filter(Node * x)
  _(requires srtl(x))
  _(ensures srtl(\result))
{
  _(assume mutable_list(x))
  _(assume x != NULL ==> \malloc_root(x))
  Node * prv = NULL;
  Node * curr = x;
  Node * res = x;
  while(curr != NULL) 
    _(invariant srtl(prv))
    _(invariant srtl(res))
    _(invariant srtl_lseg(res, prv))
    _(invariant (res != prv && prv != NULL) ==> sll_lseg_max_key(res, prv) <= prv->key)
    _(invariant \oset_disjoint(srtl_lseg_reach(res, prv), srtl_reach(prv)))
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
