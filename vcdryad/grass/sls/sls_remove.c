#include "dryad_sls.h"

_(dryad)
Node * sls_remove(Node * lst, int value)
  _(requires srtl(lst))
  _(ensures srtl(\result))
{
  _(assume mutable_list(lst))
  _(assume lst != NULL ==> \malloc_root(lst))
  Node * curr = lst;
  Node * prv = NULL;
  while(curr != NULL && curr->key < value)
    _(invariant srtl(lst))
    _(invariant srtl(curr))
    _(invariant srtl_lseg(lst, curr))
    _(invariant prv != NULL ==> prv->next == curr)
    _(invariant prv != NULL ==> !\oset_in(prv, srtl_reach(curr)))
    _(invariant \oset_disjoint(srtl_lseg_reach(lst, curr), srtl_reach(curr)))
    _(invariant srtl_lseg(lst, prv))
    _(invariant \oset_disjoint(srtl_lseg_reach(lst, prv), srtl_reach(prv)))
    _(invariant prv != NULL && curr != NULL ==> prv->key <= curr->key)
    _(invariant mutable_list(curr))
    _(invariant curr != NULL ==> \malloc_root(curr))
  {
    prv = curr;
    curr = curr->next;
    _(assume mutable_list(curr))
    _(assume curr != NULL ==> \malloc_root(curr))
  }
    
  if (curr != NULL && curr->key == value)
  {
    if (prv == NULL) {
      lst = curr->next;
    }  else {
      Node * curr_next = curr->next;
      prv->next = curr_next;
    }
    free(curr);
  }
  return lst; 
}
