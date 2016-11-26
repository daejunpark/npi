#ifndef DRYAD_BST_DEFS_H
#define DRYAD_BST_DEFS_H

#include <vcc.h>
#include <stdlib.h>

_(int _(_boogie0) \int_max(int x, int y))
_(int _(_boogie0) \int_min(int x, int y))

typedef 
_(dryad "bst:bst_R:bst_keys:bst_min_key:bst_max_key")
struct b_node {
	struct b_node * left;
	struct b_node * right;
	int key;
} BNode;

// -------------------------- base ------------------------------------------
_(abstract _(dryad "base:bst") \bool bst(struct b_node * root)
	_(reads \universe())
	_(ensures (root == NULL) ==> \result)
;)
_(abstract _(dryad "base:bst_R") \oset bst_reach(struct b_node * root)
	_(reads \universe())
	_(ensures (root != NULL) ==> \oset_in(root, \result))
	_(ensures (root == NULL) ==> (\result == \oset_empty()))
;)
_(abstract _(dryad "base:bst_keys") \intset bst_keys(struct b_node * root)
	_(reads \universe())
	_(ensures root != NULL ==> \intset_in(root->key, \result))
	_(ensures root == NULL ==> (\result == \intset_empty()))
;)
_(abstract _(dryad "base:bst_min_key") int bst_min_key(struct b_node * root)
    _(reads \universe())
    _(ensures ((root != NULL && root->left == NULL && root->right == NULL) ==> (\result == root->key)))
;)
_(abstract _(dryad "base:bst_max_key") int bst_max_key(struct b_node * root)
    _(reads \universe())
    _(ensures ((root != NULL && root->left == NULL && root->right == NULL) ==> (\result == root->key)))
;)

// ---------------------------- unfold --------------------------------------
_(logic _(dryad "unfold:bst") \bool unfold_bst(struct b_node * root) =
	(root != NULL ==>
		(bst(root) <==>
			(bst(root->left) && bst(root->right) 
			&& (! \oset_in(root, \oset_union(bst_reach(root->left), bst_reach(root->right)))) 
      && !\intset_in(root->key, \intset_union(bst_keys(root->left), bst_keys(root->right)))
			&& \oset_disjoint(bst_reach(root->left), bst_reach(root->right))
      && \intset_disjoint(bst_keys(root->left), bst_keys(root->right))
      && (root->left  != NULL ==> bst_max_key(root->left) < root->key)
      && (root->right != NULL ==> root->key < bst_min_key(root->right)) ) ) )
;)

_(logic _(dryad "unfold:bst_R") \bool unfold_bst_reach(struct b_node * root) =
	(root != NULL ==>
		(bst_reach(root) == \oset_union(\oset_singleton(root), 
                              \oset_union(bst_reach(root->left), bst_reach(root->right)))))
;)
_(logic _(dryad "unfold:bst_keys") \bool unfold_bst_keys(struct b_node * root) =
	(root != NULL ==>
		(bst_keys(root) == \intset_union(\intset_singleton(root->key), 
										                 \intset_union(bst_keys(root->left), 
                       													   bst_keys(root->right))))
   ) 
;)

_(logic _(dryad "unfold:bst_min_key") \bool unfold_bst_min_key(struct b_node * root) =
    (root != NULL ==>
        (   ((root->left != NULL && root->right != NULL) ==> (bst_min_key(root) == \int_min(root->key, \int_min(bst_min_key(root->left), bst_min_key(root->right)))))
         && ((root->left != NULL && root->right == NULL) ==> (bst_min_key(root) == \int_min(root->key, bst_min_key(root->left))))
         && ((root->left == NULL && root->right != NULL) ==> (bst_min_key(root) == \int_min(root->key, bst_min_key(root->right))))
        )
    )
;)
_(logic _(dryad "unfold:bst_max_key") \bool unfold_bst_max_key(struct b_node * root) =
    (root != NULL ==>
        (   ((root->left != NULL && root->right != NULL) ==> (bst_max_key(root) == \int_max(root->key, \int_max(bst_max_key(root->left), bst_max_key(root->right)))))
         && ((root->left != NULL && root->right == NULL) ==> (bst_max_key(root) == \int_max(root->key, bst_max_key(root->left))))
         && ((root->left == NULL && root->right != NULL) ==> (bst_max_key(root) == \int_max(root->key, bst_max_key(root->right))))
        )
    )
;)

_(logic \bool unfold_bst_all(struct b_node * x) =
	 unfold_bst(x)
	 && unfold_bst_reach(x)
	 && unfold_bst_keys(x)
	 && unfold_bst_min_key(x)
	 && unfold_bst_max_key(x)
;)

// -------------------------------- same --------------------------------------------------
_(logic _(dryad "same:bst") \bool same_bst(struct b_node * x, \state enter, \state exit) =
	\at(enter, bst(x)) == \at(exit, bst(x))
;)
_(logic _(dryad "same:bst_R")  \bool same_bst_reach(struct b_node * x, \state enter, \state exit) =
	  (\at(enter, bst_reach(x)) == \at(exit, bst_reach(x)))
;)
_(logic _(dryad "same:bst_keys") \bool same_bst_keys(struct b_node * x, \state enter, \state exit) =
	(\at(enter, bst_keys(x)) == \at(exit, bst_keys(x)))
;)
_(logic _(dryad "same:bst_min_key") \bool same_bst_min_key(struct b_node * x, \state enter, \state exit) =
	(\at(enter, bst_min_key(x)) == \at(exit, bst_min_key(x)))
;)
_(logic _(dryad "same:bst_max_key") \bool same_bst_max_key(struct b_node * x, \state enter, \state exit) =
	(\at(enter, bst_max_key(x)) == \at(exit, bst_max_key(x)))
;)
_(logic \bool same_bst_all(struct b_node * x, \state enter, \state exit) =
	same_bst(x, enter, exit)
	&& same_bst_reach(x, enter, exit)
	&& same_bst_keys(x, enter, exit)
	&& same_bst_min_key(x, enter, exit)
	&& same_bst_max_key(x, enter, exit)
;)

// ----------------------------  cond same  ------------------------------------------------
_(logic _(dryad "cond:bst") \bool cond_same_bst(struct b_node * x, struct b_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, bst_reach(y)))) ==> \at(enter, bst(y)) == \at(exit, bst(y))
;)
_(logic _(dryad "cond:bst_R") \bool cond_same_bst_reach(struct b_node * x, struct b_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, bst_reach(y)))) ==> (\at(enter, bst_reach(y)) == \at(exit, bst_reach(y)))
;)
_(logic _(dryad "cond:bst_keys") \bool cond_same_bst_keys(struct b_node * x, struct b_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, bst_reach(y)))) ==> (\at(enter, bst_keys(y)) == \at(exit, bst_keys(y)))
;)
_(logic _(dryad "cond:bst_min_key") \bool cond_same_bst_min_key(struct b_node * x, struct b_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, bst_reach(y)))) ==> (\at(enter, bst_min_key(y)) == \at(exit, bst_min_key(y)))
;)
_(logic _(dryad "cond:bst_max_key") \bool cond_same_bst_max_key(struct b_node * x, struct b_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, bst_reach(y)))) ==> (\at(enter, bst_max_key(y)) == \at(exit, bst_max_key(y)))
;)
_(logic \bool cond_same_bst_all(struct b_node * x, struct b_node * y, \state enter, \state exit) =
	cond_same_bst(x, y, enter, exit)
	&& cond_same_bst_reach(x, y, enter, exit)
	&& cond_same_bst_keys(x, y, enter, exit)
	&& cond_same_bst_min_key(x, y, enter, exit)
	&& cond_same_bst_max_key(x, y, enter, exit)
;)

// ----------------------------  disj same  ------------------------------------------------
_(logic _(dryad "disj:bst") \bool disj_same_bst(\oset heaplet_pre, struct b_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet_pre), \at(enter, bst_reach(y)))) ==> \at(enter, bst(y)) == \at(exit, bst(y))
;)
_(logic _(dryad "disj:bst_R") \bool disj_same_bst_reach(\oset heaplet_pre, struct b_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet_pre), \at(enter, bst_reach(y)))) ==> (\at(enter, bst_reach(y)) == \at(exit, bst_reach(y)))
;)
_(logic _(dryad "disj:bst_keys") \bool disj_same_bst_keys(\oset heaplet_pre, struct b_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet_pre), \at(enter, bst_reach(y)))) ==> (\at(enter, bst_keys(y)) == \at(exit, bst_keys(y)))
;)
_(logic _(dryad "disj:bst_min_key") \bool disj_same_bst_min_key(\oset heaplet_pre, struct b_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet_pre), \at(enter, bst_reach(y)))) ==> (\at(enter, bst_min_key(y)) == \at(exit, bst_min_key(y)))
;)
_(logic _(dryad "disj:bst_max_key") \bool disj_same_bst_max_key(\oset heaplet_pre, struct b_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet_pre), \at(enter, bst_reach(y)))) ==> (\at(enter, bst_max_key(y)) == \at(exit, bst_max_key(y)))
;)
_(logic \bool disj_same_bst_all(\oset heaplet_pre, struct b_node * y, \state enter, \state exit) =
	disj_same_bst(heaplet_pre, y, enter, exit)
	&& disj_same_bst_reach(heaplet_pre, y, enter, exit)
	&& disj_same_bst_keys(heaplet_pre, y, enter, exit)
	&& disj_same_bst_min_key(heaplet_pre, y, enter, exit)
	&& disj_same_bst_max_key(heaplet_pre, y, enter, exit)
;)

// --- axioms ---
_(axiom \forall struct b_node * x; \forall int i; i < bst_min_key(x) ==> !\intset_in(i, bst_keys(x)))
_(axiom \forall struct b_node * x; \forall int i; i > bst_max_key(x) ==> !\intset_in(i, bst_keys(x)))

// -------------------------------- dummy abstract function --------------------------------
_(abstract _(dryad "end") void end_b_node_defs(struct b_node * x) ;)

#endif
