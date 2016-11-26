#include "dryad_sls.h"

_(dryad)
Node * sls_reverse(Node * lst)
  _(requires srtl(lst))
  _(ensures  rsrtl(\result))
{
  _(assume mutable_list(lst))
  Node * curr = lst;
  Node * rev = NULL;
  while(curr != NULL) 
    _(invariant srtl(curr))
    _(invariant rsrtl(rev))
    _(invariant \oset_disjoint(rsrtl_reach(rev), srtl_reach(curr)))
    _(invariant rev != NULL && curr != NULL ==> sll_max_key(rev) <= curr->key)
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
