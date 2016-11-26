#include "dryad_sls.h"

_(dryad)
Node * merge(Node * a, Node * b) 
  _(requires srtl(a))
  _(requires srtl(b))
  _(requires \oset_disjoint(srtl_reach(a), srtl_reach(b)))
  _(ensures srtl(\result))
{
  _(assume mutable_list(a))
  _(assume mutable_list(b))

  Node * res = NULL;
  if (a == NULL) {
    return b;
  } else if (b == NULL) {
    return a;
  } else if (a->key <= b->key) {
    res = a;
    a = a->next;
    _(assume mutable_list(a))
  } else {
    res = b;
    b = b->next;
    _(assume mutable_list(b))
  }

  Node * last;
  last = res;

  while(a != NULL || b != NULL) 
    _(invariant srtl(a))
    _(invariant srtl(b))
    _(invariant \oset_disjoint(srtl_reach(a), srtl_reach(b)))
    _(invariant srtl(res))
    _(invariant srtl(last))
    _(invariant srtl_lseg(res, last))
    _(invariant \oset_disjoint(srtl_lseg_reach(res, last), srtl_reach(last)))
    _(invariant \oset_disjoint(srtl_lseg_reach(res, last), srtl_reach(a)))
    _(invariant \oset_disjoint(srtl_lseg_reach(res, last), srtl_reach(b)))
    _(invariant !(\oset_in(last, srtl_reach(a))))
    _(invariant !(\oset_in(last, srtl_reach(b))))

  //_(invariant \intset_le(sll_lseg_keys(res, last), \intset_singleton(last->key)))
  //_(invariant \intset_le(\intset_singleton(last->key), sll_keys(a)))
  //_(invariant \intset_le(\intset_singleton(last->key), sll_keys(b)))
    _(invariant res != last ==> sll_lseg_max_key(res, last) <= last->key)
    _(invariant a != NULL ==> last->key <= sll_min_key(a))
    _(invariant b != NULL ==> last->key <= sll_min_key(b))

    _(invariant last != NULL)
    _(invariant last->next == a || last->next == b)
    _(invariant mutable_list(a))
    _(invariant mutable_list(b))
  {
    if (a == NULL || (b != NULL && a->key > b->key)) {
      last->next = b;
      last = b;
      b = b->next;
      _(assume mutable_list(b))
    } else {
      last->next = a;
      last = a;
      a = a->next;
      _(assume mutable_list(a))
    }
  }

  return res;
}

