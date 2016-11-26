#include "dryad_sls.h"

_(dryad)
Node * sls_concat(Node * a, Node * b)
  _(requires srtl(a))
  _(requires srtl(b))
  _(requires (a != NULL && b != NULL) ==> sll_max_key(a) <= sll_min_key(b))
  _(requires \oset_disjoint(srtl_reach(a), srtl_reach(b)))
  _(ensures srtl(\result))
  _(ensures sll_keys(\result) == \intset_union(\old(sll_keys(a)), sll_keys(b)))
  _(ensures sll_reach(\result) == \oset_union(\old(sll_reach(a)), sll_reach(b)))
{
  _(assume mutable_list(a))
  if (a == NULL) {
    return b;
  }  else {
    Node * curr;
    curr = a;
    while(curr->next != NULL) 
      _(invariant curr != NULL)
    //_(invariant srtl(a)) // redundant
      _(invariant srtl(curr))
      _(invariant srtl_lseg(a, curr))
      _(invariant \oset_disjoint(srtl_lseg_reach(a, curr), srtl_reach(curr)))
      _(invariant (a != curr && curr != NULL) ==> sll_lseg_max_key(a,curr) <= sll_min_key(curr)) // NOTE: given that srtl_lseg(a,curr) && srtl(curr)
    //_(invariant sll_keys(a) == \intset_union(sll_lseg_keys(a,curr), sll_keys(curr))) // TODO: why redundant?
      _(invariant mutable_list(curr))
    {
       curr = curr->next;
       _(assume mutable_list(curr))
    }
    curr->next = b;
    return a;
  }
}
