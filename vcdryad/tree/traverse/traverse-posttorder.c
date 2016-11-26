#include "dryad_posttree.h"

_(logic \bool mutable_tree(TNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
int postorder(TNode * x, int n)
	_(requires tree(x))

	_(ensures tree(x))
	_(ensures posttree(x))
	_(ensures \result == (n + tree_size(x)))
	_(ensures x != NULL ==> (tree_order(x) + 1) == (n + tree_size(x)))

// INV:BEGIN
	_(ensures tree_reach(x) == \old(tree_reach(x)))
	_(ensures tree_size(x) == \old(tree_size(x)))
// INV:END
	_(ensures tree_reach(x) == posttree_reach(x))

{
	_(assume mutable_tree(x))
	_(assume n < INT_MAX)

	if (x == NULL) {
		return n;
	} else {
		int n1 = postorder(x->left, n);
		_(assume n1 < INT_MAX)

		int n2 = postorder(x->right, n1);
		_(assume n2 < INT_MAX)

		x->key = n2;

		int n3 = n2 + 1;
		_(assume n3 < INT_MAX)

		return n3;

	}
}
