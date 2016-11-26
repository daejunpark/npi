#include "dryad_treap.h"

_(logic \bool mutable_treap(BNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
int treap_find_rec(BNode * x, int k)
  _(requires treap(x))

  _(ensures  treap(x))
  _(ensures  (\result == 0) <==> !\intset_in(k, treap_keys(x)))
  _(ensures  (\result == 1) <==>  \intset_in(k, treap_keys(x)))

// INV:BEGIN
  _(ensures  treap_reach(x) == \old(treap_reach(x)))
  _(ensures  treap_keys(x) == \old(treap_keys(x)))
  _(ensures  treap_prios(x) == \old(treap_prios(x)))
  _(ensures  treap_min_key(x) == \old(treap_min_key(x)))
  _(ensures  treap_max_key(x) == \old(treap_max_key(x)))
  _(ensures  treap_max_prio(x) == \old(treap_max_prio(x)))
// INV:END

{
  _(assume mutable_treap(x))
  if (x == NULL) {
    return 0;
  } else {
      if (k == x->key) {
        return 1;
      } else if (k < x->key) {
        int r = treap_find_rec(x->left, k);
        return r;
      } else {
        int r = treap_find_rec(x->right, k);
        return r;
    }
  }
}
