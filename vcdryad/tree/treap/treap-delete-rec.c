#include "dryad_treap.h"

_(logic \bool mutable_treap(BNode * x) = x != NULL ==> \mutable(x) && \writable(x))

BNode * treap_remove_root(BNode * x)
  _(requires treap(x))
  /*
  _(requires \intset_le(treap_keys(x->left), treap_keys(x->right)))
  */
  _(requires x->left != NULL && x->right != NULL ==> treap_max_key(x->left) <= treap_min_key(x->right))
//_(requires \intset_disjoint(treap_prios(x->left), treap_prios(x->right)))
//_(requires \intset_disjoint(treap_keys(x->left), treap_keys(x->right)))
  _(ensures treap(\result))
  _(ensures treap_keys(\result) == \intset_union(\old(treap_keys(x->left)), \old(treap_keys(x->right))))  
  _(ensures \intset_subset(treap_prios(\result), \old(treap_prios(x))))
// INV:BEGIN
  _(ensures treap_min_key(\result) >= \old(treap_min_key(x)))
  _(ensures treap_max_key(\result) <= \old(treap_max_key(x)))
  _(ensures treap_max_prio(\result) < \old(treap_max_prio(x)))
// INV:END
;

_(dryad)
BNode * treap_delete_rec(BNode * x, int k)
  _(requires treap(x))
  _(requires \intset_in(k, treap_keys(x)))

  _(ensures treap(\result))
  _(ensures treap_keys(\result) == (\intset_diff(\old(treap_keys(x)), \intset_singleton(k))))
  _(ensures \intset_subset(treap_prios(\result), \old(treap_prios(x))))

// INV:BEGIN
  _(ensures treap_min_key(\result) >= \old(treap_min_key(x)))
  _(ensures treap_max_key(\result) <= \old(treap_max_key(x)))
  _(ensures treap_max_prio(\result) <= \old(treap_max_prio(x)))
// INV:END
{
  _(assume mutable_treap(x))

  if(x->key == k) {
    BNode * r = treap_remove_root(x);
    return r;
  } else if (k < x->key) {
    
    BNode * xl = x->left;
    BNode * xr = x->right;
    BNode * l = treap_delete_rec(xl, k);

    x->left = l;

    return x;
  } else {
    
    BNode * xl = x->left;
    BNode * xr = x->right;
    BNode * r = treap_delete_rec(xr, k);

    x->right = r;

    return x;
  }
}
