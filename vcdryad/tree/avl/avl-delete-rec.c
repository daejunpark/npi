#include "dryad_avl.h"

_(logic \bool mutable_avl(AVLNode * x) = x != NULL ==> \mutable(x) && \writable(x))


int avl_find_smallest(AVLNode * x)
	_(requires x != NULL && avl(x))
	_(ensures x != NULL)
	_(ensures avl(x))
	_(ensures avl_reach(x) == \old(avl_reach(x)))
	_(ensures avl_keys(x) == \old(avl_keys(x)))
	_(ensures avl_height(x) == \old(avl_height(x)))
    _(ensures avl_max_key(x) == \old(avl_max_key(x)))
    _(ensures avl_min_key(x) == \old(avl_min_key(x)))

    /*
	_(ensures \intset_le_one1(\result, avl_keys(x)))
    */
	_(ensures \result <= avl_min_key(x))

	_(ensures \intset_in(\result, avl_keys(x)))
;

AVLNode * avl_balance(AVLNode * x)
	_(requires x != NULL)
	_(requires !\oset_in(x, avl_reach(x->left)))
	_(requires !(\intset_in(x->key, avl_keys(x->left))))
	_(requires avl(x->left))

    /*
	_(requires \intset_lt_one2(avl_keys(x->left), x->key))
    */
	_(requires x->left != NULL ==> avl_max_key(x->left) < x->key)

	_(requires !\oset_in(x, avl_reach(x->right)))
	_(requires !(\intset_in(x->key, avl_keys(x->right))))
	_(requires avl(x->right))

    /*
	_(requires \intset_lt_one1(x->key, avl_keys(x->right)))
    */
	_(requires x->right != NULL ==> x->key < avl_min_key(x->right))

	_(requires \oset_disjoint(avl_reach(x->left), avl_reach(x->right)))
	_(requires avl_height(x->right) <= avl_height(x->left)  + 2)
	_(requires avl_height(x->left)  <= avl_height(x->right) + 2)

    _(ensures avl_max_key(\result) == \old(avl_max_key(x)))
    _(ensures avl_min_key(\result) == \old(avl_min_key(x)))

	_(ensures avl(\result))
	_(ensures avl_keys(\result) == \intset_union_one1(x->key, 
             										\intset_union(\old(avl_keys(x->left)), \old(avl_keys(x->right)))))
	_(ensures ((\old(avl_height(x->left)) == \old(avl_height(x->right))) 
				&& (avl_height(\result) == \old(avl_height(x->left)) + 1))

		   || ((\old(avl_height(x->left)) == (\old(avl_height(x->right)) + 1))
				&& (avl_height(\result) ==  \old(avl_height(x->left)) + 1))

	       || ((\old(avl_height(x->right)) == (\old(avl_height(x->left)) + 1)) 
				&& (avl_height(\result) ==  \old(avl_height(x->right)) + 1)) 

		   || (x->left != NULL && 
				((\old(avl_height(x->left)) == (\old(avl_height(x->right)) + 2))
				 && (\old(avl_height(x->left->left)) == \old(avl_height(x->left->right)))
				 && (avl_height(\result) == \old(avl_height(x->left)) + 1))
			 || ((\old(avl_height(x->left)) == (\old(avl_height(x->right)) + 2))
				 && (\old(avl_height(x->left->left)) != \old(avl_height(x->left->right)))
				 && (avl_height(\result) == \old(avl_height(x->left)))) )
		   || (x->right != NULL && 
				((\old(avl_height(x->right)) == (\old(avl_height(x->left)) + 2))
				 && (\old(avl_height(x->right->left)) == \old(avl_height(x->right->right)))
				 && (avl_height(\result) == \old(avl_height(x->right)) + 1))
			 || ((\old(avl_height(x->right)) == (\old(avl_height(x->left)) + 2))
				 && (\old(avl_height(x->right->left)) != \old(avl_height(x->right->right)))
				 && (avl_height(\result) == \old(avl_height(x->right)))) )  )
;

_(dryad)
AVLNode * avl_delete(AVLNode * x, int k)
	_(requires avl(x))
	_(requires x != NULL ==> \intset_in(k, avl_keys(x)))
	_(requires x == NULL ==> avl_height(x) == -1)
	_(requires x != NULL ==> avl_height(x) >= 0)

	_(ensures avl(\result))
	_(ensures avl_keys(\result) == \intset_diff(\old(avl_keys(x)), \intset_singleton(k)))
	_(ensures (avl_height(\result) == \old(avl_height(x)))
		   || (avl_height(\result) == \old(avl_height(x)) - 1) )

// INV:BEGIN
    _(ensures x != NULL && \result != NULL ==> avl_min_key(\result) >= \old(avl_min_key(x)))
    _(ensures x != NULL && \result != NULL ==> avl_max_key(\result) <= \old(avl_max_key(x)))
// INV:END

    _(ensures x != NULL && \result != NULL ==> k == \old(avl_min_key(x)) ==> avl_min_key(\result) > \old(avl_min_key(x)))
    _(ensures x != NULL && \result != NULL ==> k == \old(avl_max_key(x)) ==> avl_max_key(\result) < \old(avl_max_key(x)))

{
	_(assume mutable_avl(x))
	_(assume x != NULL ==> \malloc_root(x))

	if (x == NULL) {
		return x;
	} else {
	  AVLNode * right = x->right;
    AVLNode * left = x->left;
		if (x->key == k) {
			if (left == NULL && right == NULL) {
				free(x);
				return NULL;
			} else if (left  == NULL) {
				free(x);
				return right;
			} else if (right == NULL) {
				free(x);
				return left;
			} else {
				int succ = avl_find_smallest(right);

				AVLNode * new_right = avl_delete(right, succ);

				x->key = succ;

				x->right = new_right;

				return avl_balance(x);
			}
		} else if (x->key > k) {
			AVLNode * new_left = avl_delete(left, k);

			x->left = new_left;

			return avl_balance(x);

		} else {// x->key < k

			AVLNode * new_right = avl_delete(right, k);

			x->right = new_right;

			return avl_balance(x);
		}

	}
}
