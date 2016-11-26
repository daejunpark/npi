#include "dryad_pretree.h"

_(logic \bool mutable_tree(TNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
int preorder(TNode * x, int n)
	_(requires tree(x))

	_(ensures tree(x))
	_(ensures pretree(x))
	_(ensures \result == (n + tree_size(x)))
	_(ensures x != NULL ==> tree_order(x) == n)

// INV:BEGIN
	_(ensures tree_reach(x) == \old(tree_reach(x)))
	_(ensures tree_size(x) == \old(tree_size(x)))
// INV:END
	_(ensures tree_reach(x) == pretree_reach(x))

{
	_(assume mutable_tree(x))

	if (x == NULL) {
		return n;
	} else {
		x->key = n;
		_(assume n < INT_MAX)
		int n1 = n + 1;
		_(assume n1 < INT_MAX)

		int n2 = preorder(x->left, n1);
		_(assume n2 < INT_MAX)

		int n3 = preorder(x->right, n2);
		_(assume n3 < INT_MAX)

		return n3;
	}
}

