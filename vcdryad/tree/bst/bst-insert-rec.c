#include "dryad_bst.h"

_(logic \bool mutable_bst(BNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
BNode * bst_insert_rec(BNode * x, int k)
  _(requires bst(x))
  _(requires !\intset_in(k, bst_keys(x)))

  _(ensures bst(\result))
  _(ensures bst_keys(\result) == \intset_union(\old(bst_keys(x)), \intset_singleton(k)))

// INV:BEGIN
  _(ensures \result != NULL)
  _(ensures x != NULL ==> bst_min_key(\result) == \int_min(\old(bst_min_key(x)), k))
  _(ensures x == NULL ==> bst_min_key(\result) == k)
  _(ensures x != NULL ==> bst_max_key(\result) == \int_max(\old(bst_max_key(x)), k))
  _(ensures x == NULL ==> bst_max_key(\result) == k)
// INV:END

{
  _(assume mutable_bst(x))

  if (x == NULL) {
    BNode * leaf = (BNode *) malloc(sizeof(BNode));
    _(assume leaf != NULL)

    leaf->key   = k;
    leaf->left  = NULL;
    leaf->right = NULL;

    return leaf;
  } else if (k < x->key) {
    BNode * l = x->left;
    BNode * r = x->right;
    BNode * tmp = bst_insert_rec(l, k);

    x->left = tmp;

    return x;
  } else {
    BNode * l = x->left;
    BNode * r = x->right;
    BNode * tmp = bst_insert_rec(r, k);
    
    x->right = tmp;

    return x;
  } 
}
