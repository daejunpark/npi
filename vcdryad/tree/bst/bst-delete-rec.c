#include "dryad_bst.h"

_(logic \bool mutable_bst(BNode * x) = x != NULL ==> \mutable(x) && \writable(x))

BNode * bst_remove_root(BNode * x)
  _(requires bst(x))
  _(ensures bst(\result))
  _(ensures bst_keys(\result) == \intset_diff(\old(bst_keys(x)), \intset_singleton(x->key)))
//_(ensures bst_keys(\result) == \intset_union(\old(bst_keys(x->left)), \old(bst_keys(x->right))))
  _(ensures bst_min_key(\result) >= \old(bst_min_key(x)))
  _(ensures bst_max_key(\result) <= \old(bst_max_key(x)))
;

_(dryad)
BNode * bst_delete_rec(BNode * x, int k)
  _(requires bst(x))
  _(requires \intset_in(k, bst_keys(x)))

  _(ensures bst(\result))
  _(ensures bst_keys(\result) == (\intset_diff(\old(bst_keys(x)), \intset_singleton(k))))

// INV:BEGIN
  _(ensures bst_min_key(\result) >= \old(bst_min_key(x)))
  _(ensures bst_max_key(\result) <= \old(bst_max_key(x)))
// INV:END
{
  _(assume mutable_bst(x))

  if(x->key == k) {
    BNode * r = bst_remove_root(x);
    return r;
  } else if (k < x->key) {
    
    BNode * xl = x->left;
    BNode * xr = x->right;
    BNode * l = bst_delete_rec(xl, k);

    x->left = l;

    return x;
  } else {
    
    BNode * xl = x->left;
    BNode * xr = x->right;
    BNode * r = bst_delete_rec(xr, k);

    x->right = r;

    return x;
  }
}
