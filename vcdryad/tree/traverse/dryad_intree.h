#ifndef DRYAD_INTREE_DEFS_H
#define DRYAD_INTREE_DEFS_H

#include <vcc.h>
#include <stdlib.h>

typedef 
_(dryad "tree:tree_R:intree:intree_R:tree_size:tree_lsize:tree_rsize:tree_order")
struct t_node {
	struct t_node * left;
	struct t_node * right;
	int key;
} TNode;

// -------------------------- base ------------------------------------------
_(abstract _(dryad "base:tree") \bool tree(struct t_node * root)
	_(reads \universe())
	_(ensures (root == NULL) ==> \result)
;)
_(abstract _(dryad "base:intree") \bool intree(struct t_node * root)
	_(reads \universe())
	_(ensures (root == NULL) ==> \result)
;)
_(abstract _(dryad "base:tree_R") \oset tree_reach(struct t_node * root)
	_(reads \universe())
	_(ensures (root != NULL) ==> \oset_in(root, \result))
	_(ensures (root == NULL) ==> (\result == \oset_empty()))
;)
_(abstract _(dryad "base:intree_R") \oset intree_reach(struct t_node * root)
	_(reads \universe())
	_(ensures (root != NULL) ==> \oset_in(root, \result))
	_(ensures (root == NULL) ==> (\result == \oset_empty()))
;)
_(abstract _(dryad "base:tree_size") \integer tree_size(struct t_node * root)
	_(reads \universe())
	_(ensures root == NULL ==> \result == 0)
	_(ensures root != NULL ==> \result  > 0)
;)

_(abstract _(dryad "base:tree_lsize") \integer tree_lsize(struct t_node * root)
	_(reads \universe())
	_(ensures root == NULL ==> \result == 0)
;)
_(abstract _(dryad "base:tree_rsize") \integer tree_rsize(struct t_node * root)
	_(reads \universe())
	_(ensures root == NULL ==> \result == 0)
;)

_(abstract _(dryad "base:tree_order") \integer tree_order(struct t_node * root)
	_(reads \universe())
	_(ensures root == NULL ==> \result == 0)
;)

// ---------------------------- unfold --------------------------------------
_(logic _(dryad "unfold:tree") \bool unfold_tree(struct t_node * root) =
	(root != NULL ==>
		(tree(root) <==>
			(tree(root->left) && tree(root->right) 
			&& (! \oset_in(root, \oset_union(tree_reach(root->left), tree_reach(root->right)))) 
			&& \oset_disjoint(tree_reach(root->left), tree_reach(root->right))  ) ) )
;)
_(logic _(dryad "unfold:intree") \bool unfold_intree(struct t_node * root) =
	(root != NULL ==>
		(intree(root) <==> 
			(intree(root->left) && intree(root->right) 
			&& (! \oset_in(root, \oset_union(intree_reach(root->left), intree_reach(root->right)))) 
			&& \oset_disjoint(intree_reach(root->left), intree_reach(root->right))  
			&& (root->left  != NULL ==> (tree_order(root->left) + tree_rsize(root->left) + 1) == root->key)
			&& (root->right != NULL ==> 
				(tree_order(root->right) == ((root->key + tree_lsize(root->right)) + 1)) ) ) ) ) 
;)
_(logic _(dryad "unfold:tree_R") \bool unfold_tree_reach(struct t_node * root) =
	(root != NULL ==>
		(tree_reach(root) == \oset_union(\oset_singleton(root), 
                                     \oset_union(tree_reach(root->left), tree_reach(root->right)))))
;)
_(logic _(dryad "unfold:intree_R") \bool unfold_intree_reach(struct t_node * root) =
	(root != NULL ==>
		(intree_reach(root) == \oset_union(\oset_singleton(root),
                                       \oset_union(intree_reach(root->left), intree_reach(root->right)))))
;)
_(logic _(dryad "unfold:tree_size") \bool unfold_tree_size(struct t_node * root) =
		(root != NULL ==>
						(tree_size(root) == tree_size(root->left) + tree_size(root->right) + 1))
;)
_(logic _(dryad "unfold:tree_lsize") \bool unfold_tree_lsize(struct t_node * root) =
	(tree_lsize(root) == tree_size(root->left) )
;)
_(logic _(dryad "unfold:tree_rsize") \bool unfold_tree_rsize(struct t_node * root) =
	(tree_rsize(root) == tree_size(root->right) )
;)

_(logic _(dryad "unfold:tree_order") \bool unfold_tree_order(struct t_node * root) =
	(root != NULL ==> (tree_order(root) == (\integer) root->key)) 
;)

// -------------------------------- same --------------------------------------------------
_(logic _(dryad "same:tree") \bool same_tree(struct t_node * x, \state enter, \state exit) =
	\at(enter, tree(x)) == \at(exit, tree(x))
;)
_(logic _(dryad "same:intree") \bool same_intree(struct t_node * x, \state enter, \state exit) =
	\at(enter, intree(x)) == \at(exit, intree(x))
;)
_(logic _(dryad "same:tree_R") \bool same_tree_reach(struct t_node * x, \state enter, \state exit) =
	\at(enter, tree_reach(x)) == \at(exit, tree_reach(x))
;)
_(logic _(dryad "same:intree_R") \bool same_intree_reach(struct t_node * x, \state enter, \state exit) =
	\at(enter, intree_reach(x)) == \at(exit, intree_reach(x))
;)
_(logic _(dryad "same:tree_size") \bool same_tree_size(struct t_node * x, \state enter, \state exit) =
	\at(enter, tree_size(x)) == \at(exit, tree_size(x))
;)
_(logic _(dryad "same:tree_lsize") \bool same_tree_lsize(struct t_node * x, \state enter, \state exit) =
	\at(enter, tree_lsize(x)) == \at(exit, tree_lsize(x))
;)
_(logic _(dryad "same:tree_rsize") \bool same_tree_rsize(struct t_node * x, \state enter, \state exit) =
	\at(enter, tree_rsize(x)) == \at(exit, tree_rsize(x))
;)
_(logic _(dryad "same:tree_order") \bool same_tree_order(struct t_node * x, \state enter, \state exit) =
	\at(enter, tree_order(x)) == \at(exit, tree_order(x))
;)

// ----------------------------  cond same  ------------------------------------------------
_(logic _(dryad "cond:tree") \bool cond_same_tree(struct t_node * x, struct t_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, tree_reach(y))) ==> \at(enter, tree(y)) == \at(exit, tree(y)))
;)
_(logic _(dryad "cond:intree") \bool cond_same_intree(struct t_node * x, struct t_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, intree_reach(y))) ==> \at(enter, intree(y)) == \at(exit, intree(y)))
;)
_(logic _(dryad "cond:tree_R") \bool cond_same_tree_reach(struct t_node * x, struct t_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, tree_reach(y))) ==> \at(enter, tree_reach(y)) == \at(exit, tree_reach(y)))
;)
_(logic _(dryad "cond:intree_R") \bool cond_same_intree_reach(struct t_node * x, struct t_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, intree_reach(y))) ==> \at(enter, intree_reach(y)) == \at(exit, intree_reach(y)))
;)
_(logic _(dryad "cond:tree_size") \bool cond_same_tree_size(struct t_node * x, struct t_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, tree_reach(y))) ==> \at(enter, tree_size(y)) == \at(exit, tree_size(y)))
;)
_(logic _(dryad "cond:tree_lsize") \bool cond_same_tree_lsize(struct t_node * x, struct t_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, tree_reach(y))) ==> \at(enter, tree_lsize(y)) == \at(exit, tree_lsize(y)))
;)
_(logic _(dryad "cond:tree_rsize") \bool cond_same_tree_rsize(struct t_node * x, struct t_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, tree_reach(y))) ==> \at(enter, tree_rsize(y)) == \at(exit, tree_rsize(y)))
;)
_(logic _(dryad "cond:tree_order") \bool cond_same_tree_order(struct t_node * x, struct t_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, tree_reach(y))) ==> \at(enter, tree_order(y)) == \at(exit, tree_order(y)))
;)
// ----------------------------  disj same  ------------------------------------------------
_(logic _(dryad "disj:tree") \bool disj_same_tree(\oset heaplet, struct t_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, tree_reach(y))) ==> \at(enter, tree(y)) == \at(exit, tree(y)))
;)
_(logic _(dryad "disj:intree") \bool disj_same_intree(\oset heaplet, struct t_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, intree_reach(y))) ==> \at(enter, intree(y)) == \at(exit, intree(y)))
;)
_(logic _(dryad "disj:tree_R") \bool disj_same_tree_reach(\oset heaplet, struct t_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, tree_reach(y))) ==> \at(enter, tree_reach(y)) == \at(exit, tree_reach(y)))
;)
_(logic _(dryad "disj:intree_R") \bool disj_same_intree_reach(\oset heaplet, struct t_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, intree_reach(y))) ==> \at(enter, intree_reach(y)) == \at(exit, intree_reach(y)))
;)
_(logic _(dryad "disj:tree_size") \bool disj_same_tree_size(\oset heaplet, struct t_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, tree_reach(y))) ==> \at(enter, tree_size(y)) == \at(exit, tree_size(y)))
;)
_(logic _(dryad "disj:tree_lsize") \bool disj_same_tree_lsize(\oset heaplet, struct t_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, tree_reach(y))) ==> \at(enter, tree_lsize(y)) == \at(exit, tree_lsize(y)))
;)
_(logic _(dryad "disj:tree_rsize") \bool disj_same_tree_rsize(\oset heaplet, struct t_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, tree_reach(y))) ==> \at(enter, tree_rsize(y)) == \at(exit, tree_rsize(y)))
;)
_(logic _(dryad "disj:tree_order") \bool disj_same_tree_order(\oset heaplet, struct t_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, tree_reach(y))) ==> \at(enter, tree_order(y)) == \at(exit, tree_order(y)))
;)
// -------------------------------- dummy abstract function --------------------------------
_(abstract _(dryad "end") void end_t_node_defs(struct t_node * x) ;)

#endif
