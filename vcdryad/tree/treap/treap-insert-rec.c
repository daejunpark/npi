#include "dryad_treap.h"

_(logic \bool mutable_treap(BNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
BNode * treap_insert_rec(BNode * x, int k, int p)
  _(requires treap(x))
  _(requires !\intset_in(k, treap_keys(x)))
  _(requires !\intset_in(p, treap_prios(x)))

  _(ensures treap(\result))
  _(ensures treap_keys(\result) == \intset_union( \old(treap_keys(x)), \intset_singleton(k)))  // (E1)
  _(ensures treap_prios(\result) == \intset_union(\old(treap_prios(x)), \intset_singleton(p))) // (E2)

// INV:BEGIN
  _(ensures \result != NULL)
  _(ensures x != NULL ==> treap_min_key(\result) == \int_min(\old(treap_min_key(x)), k))
  _(ensures x == NULL ==> treap_min_key(\result) == k)
  _(ensures x != NULL ==> treap_max_key(\result) == \int_max(\old(treap_max_key(x)), k))
  _(ensures x == NULL ==> treap_max_key(\result) == k)
  _(ensures x != NULL ==> treap_max_prio(\result) == \int_max(\old(treap_max_prio(x)), p))
  _(ensures x == NULL ==> treap_max_prio(\result) == p)
// INV:END

  _(ensures x != NULL ==> p > \old(treap_max_prio(x)) ==> p == \result->prio)

  _(ensures \intset_subset(\old(treap_prios(x)), treap_prios(\result))) // needed to prove (E2)
  _(ensures \intset_subset(\old(treap_keys(x)), treap_keys(\result)))   // both of those are needed to
  _(ensures \intset_in(k, treap_keys(\result)))                         // prove (E1)

{
  _(assume mutable_treap(x))

  if (x == NULL) {
    BNode * leaf = (BNode *) malloc(sizeof(BNode));
    _(assume leaf != NULL)

    leaf->key = k;
    leaf->prio = p;
    leaf->left = NULL;
    leaf->right = NULL;
    return leaf;
  } else {

    if (k < x->key) {
      BNode * xr = x->right;
      BNode * xl = x->left;
      BNode * tmp = treap_insert_rec(xl, k, p);
      _(assume mutable_treap(tmp))


      if (tmp->prio <= x->prio) {

        x->left = tmp;

        return x;
      } else {      
        BNode * lr = tmp->right;

        x->left = lr;

        tmp->right = x;

        return tmp;
      }
    } else {
      BNode * xr = x->right;
      BNode * xl = x->left;
      BNode * tmp = treap_insert_rec(xr, k, p);
      _(assume mutable_treap(tmp))

      if (tmp->prio <= x->prio) {

        x->right = tmp;

        return x;
      } else {
        BNode * rl = tmp->left;

        x->right = rl;

        tmp->left = x;
        
        return tmp;
      }
    } 
  }
}

