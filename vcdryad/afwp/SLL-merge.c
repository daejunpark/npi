#include "dryad_SRTL.h"

_(dryad)
Node * SLL_merge(Node * i, Node * j)
  _(requires srtl(i))
  _(requires srtl(j))
  _(requires i != NULL)
  _(requires j != NULL)
  _(requires i->key <= j->key)
  _(requires \oset_disjoint(srtl_reach(i), srtl_reach(j)))
  _(ensures srtl(\result))
{
  _(assume mutable_list(i))
  _(assume mutable_list(j))
  Node * h = i;
  Node * k = NULL;

      k = i;
      i = i->next;
      _(assume mutable_list(i))

  while(i != NULL) 
    _(invariant srtl_lseg(h, k))
    _(invariant srtl_lseg(k, i))
    _(invariant srtl(i))
    _(invariant srtl(j))

    _(invariant k->next == i)

    _(invariant \oset_disjoint(srtl_lseg_reach(h, k), \oset_singleton(k)))
    _(invariant \oset_disjoint(srtl_lseg_reach(h, k), srtl_reach(i)))
    _(invariant \oset_disjoint(srtl_lseg_reach(h, k), srtl_reach(j)))
    _(invariant \oset_disjoint(\oset_singleton(k), srtl_reach(i)))
    _(invariant \oset_disjoint(\oset_singleton(k), srtl_reach(j)))
    _(invariant \oset_disjoint(srtl_reach(i), srtl_reach(j)))

    _(invariant h != k ==> sll_lseg_max_key(h, k) <= k->key)
    _(invariant i != NULL ==> k->key <= sll_min_key(i))
    _(invariant j != NULL ==> k->key <= sll_min_key(j))

    _(invariant k != NULL)

    _(invariant mutable_list(i))
    _(invariant mutable_list(j))
  {
    if (j == NULL || i->key <= j->key) {
      k = i;
      i = i->next;
      _(assume mutable_list(i))
    } else { 
      k->next = j;
      k = j;
      j = j->next;
      _(assume mutable_list(j))
      k->next = i;
    }
  }
  return h;
}
