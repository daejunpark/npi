#include "dryad_bst.h"

_(logic \bool mutable_bst(BNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
int bst_find_rec(BNode * x, int k)
  _(requires bst(x))

  _(ensures  bst(x))
  _(ensures  (\result == 0) <==> !\intset_in(k, bst_keys(x)))
  _(ensures  (\result == 1) <==> \intset_in(k, bst_keys(x)))

// INV:BEGIN
  _(ensures  bst_reach(x) == \old(bst_reach(x)))
  _(ensures  bst_keys(x) == \old(bst_keys(x)))
  _(ensures  bst_max_key(x) == \old(bst_max_key(x)))
  _(ensures  bst_min_key(x) == \old(bst_min_key(x)))
// INV:END

{
  _(assume mutable_bst(x))
  if (x == NULL) {
    return 0;
  } else {
      if (k == x->key) {
        return 1;
      } else if (k < x->key) {
        int r = bst_find_rec(x->left, k);
        return r;
      } else {
        int r = bst_find_rec(x->right, k);
        return r;
    }
  }
}
