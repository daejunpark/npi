#include "dryad_intree.h"

_(logic \bool mutable_tree(TNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
int inorder(TNode * x, int n)
	_(requires tree(x))

	_(ensures tree(x))
	_(ensures intree(x))
	_(ensures \result == (n + tree_size(x)))
	_(ensures x != NULL ==> (tree_order(x) == (n + tree_lsize(x))))
	_(ensures x != NULL ==> (tree_size(x)  == (1 + tree_lsize(x) + tree_rsize(x))))

// INV:BEGIN
	_(ensures tree_reach(x) == \old(tree_reach(x)))
	_(ensures tree_size(x) == \old(tree_size(x)))
// INV:END
	_(ensures tree_reach(x) == intree_reach(x))

{
	_(assume mutable_tree(x))
	_(assume n < INT_MAX)
	if (x == NULL) {
		return n;
	} else {

		int n1 = inorder(x->left, n);
		_(assume n1 < INT_MAX)

		x->key = n1;

		int n2 = n1 + 1;
		_(assume n2 < INT_MAX)

		int n3 = inorder(x->right, n2);
		_(assume n3 < INT_MAX)

		return n3;	
	}
}
