#ifndef DRYAD_POSTTREE_DEFS_H
#define DRYAD_POSTTREE_DEFS_H

#include <vcc.h>
#include <stdlib.h>
//#include "intbag_defs.h"
//#include "intset_defs.h"

typedef 
_(dryad "tree:tree_R:posttree:posttree_R:tree_size:tree_order")
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
_(abstract _(dryad "base:posttree") \bool posttree(struct t_node * root)
	_(reads \universe())
	_(ensures (root == NULL) ==> \result)
;)
_(abstract _(dryad "base:tree_R") \oset tree_reach(struct t_node * root)
	_(reads \universe())
	_(ensures (root != NULL) ==> \oset_in(root, \result))
	_(ensures (root == NULL) ==> (\result == \oset_empty()))
;)
_(abstract _(dryad "base:posttree_R") \oset posttree_reach(struct t_node * root)
	_(reads \universe())
	_(ensures (root != NULL) ==> \oset_in(root, \result))
	_(ensures (root == NULL) ==> (\result == \oset_empty()))
;)
_(abstract _(dryad "base:tree_size") \integer tree_size(struct t_node * root)
	_(reads \universe())
	_(ensures root == NULL ==> \result == 0)
	_(ensures root != NULL ==> \result  > 0)
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
_(logic _(dryad "unfold:posttree") \bool unfold_posttree(struct t_node * root) =
	(root != NULL ==>
		(posttree(root) <==>
			(posttree(root->left) && posttree(root->right) 
			&& (! \oset_in(root, \oset_union(posttree_reach(root->left), posttree_reach(root->right))))
			&& \oset_disjoint(posttree_reach(root->left), posttree_reach(root->right))  
			&& (root->left  != NULL ==> ((tree_order(root->left) + 1) + tree_size(root->right)) == root->key)
			&& (root->right != NULL ==> (tree_order(root->right) + 1) == root->key) ) ) ) 
;)	
_(logic _(dryad "unfold:tree_R") \bool unfold_tree_reach(struct t_node * root) =
	(root != NULL ==>
		(tree_reach(root) == \oset_union(\oset_singleton(root), 
                                     \oset_union(tree_reach(root->left), tree_reach(root->right)))))
;)
_(logic _(dryad "unfold:posttree_R") \bool unfold_posttree_reach(struct t_node * root) =
	(root != NULL ==>
		(posttree_reach(root) == \oset_union(\oset_singleton(root), 
                                         \oset_union(posttree_reach(root->left), posttree_reach(root->right)))))
;)
_(logic _(dryad "unfold:tree_size") \bool unfold_tree_size(struct t_node * root) =
		(root != NULL ==> (tree_size(root) == tree_size(root->left) + tree_size(root->right) + 1))
;)

_(logic _(dryad "unfold:tree_order") \bool unfold_tree_order(struct t_node * root) =
	  (root != NULL ==> (tree_order(root) == (\integer) root->key))
;)

// -------------------------------- same --------------------------------------------------
_(logic _(dryad "same:tree") \bool same_tree(struct t_node * x, \state enter, \state exit) =
	\at(enter, tree(x)) == \at(exit, tree(x))
;)
_(logic _(dryad "same:posttree") \bool same_posttree(struct t_node * x, \state enter, \state exit) =
	\at(enter, posttree(x)) == \at(exit, posttree(x))
;)
_(logic _(dryad "same:tree_R") \bool same_tree_reach(struct t_node * x, \state enter, \state exit) =
	\at(enter, tree_reach(x)) == \at(exit, tree_reach(x))
;)
_(logic _(dryad "same:posttree_R") \bool same_posttree_reach(struct t_node * x, \state enter, \state exit) =
	\at(enter, posttree_reach(x)) == \at(exit, posttree_reach(x))
;)
_(logic _(dryad "same:tree_size") \bool same_tree_size(struct t_node * x, \state enter, \state exit) =
	\at(enter, tree_size(x)) == \at(exit, tree_size(x))
;)
_(logic _(dryad "same:tree_order") \bool same_tree_order(struct t_node * x, \state enter, \state exit) =
	\at(enter, tree_order(x)) == \at(exit, tree_order(x))
;)

// ----------------------------  cond same  ------------------------------------------------
_(logic _(dryad "cond:tree") \bool cond_same_tree(struct t_node * x, struct t_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, tree_reach(y))) ==> \at(enter, tree(y)) == \at(exit, tree(y)))
;)
_(logic _(dryad "cond:posttree") \bool cond_same_posttree(struct t_node * x, struct t_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, posttree_reach(y))) ==> \at(enter, posttree(y)) == \at(exit, posttree(y)))
;)
_(logic _(dryad "cond:tree_R") \bool cond_same_tree_reach(struct t_node * x, struct t_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, tree_reach(y))) ==> \at(enter, tree_reach(y)) == \at(exit, tree_reach(y)))
;)
_(logic _(dryad "cond:posttree_R") \bool cond_same_posttree_reach(struct t_node * x, struct t_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, posttree_reach(y))) ==> \at(enter, posttree_reach(y)) == \at(exit, posttree_reach(y)))
;)
_(logic _(dryad "cond:tree_size") \bool cond_same_tree_size(struct t_node * x, struct t_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, tree_reach(y))) ==> \at(enter, tree_size(y)) == \at(exit, tree_size(y)))
;)
_(logic _(dryad "cond:tree_order") \bool cond_same_tree_order(struct t_node * x, struct t_node * y, \state enter, \state exit) =
	(! \oset_in(x, \at(enter, tree_reach(y))) ==> \at(enter, tree_order(y)) == \at(exit, tree_order(y)))
;)
// ----------------------------  cond same  ------------------------------------------------
_(logic _(dryad "disj:tree") \bool disj_same_tree(\oset heaplet, struct t_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, tree_reach(y))) ==> \at(enter, tree(y)) == \at(exit, tree(y)))
;)
_(logic _(dryad "disj:posttree") \bool disj_same_posttree(\oset heaplet, struct t_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, posttree_reach(y))) ==> \at(enter, posttree(y)) == \at(exit, posttree(y)))
;)
_(logic _(dryad "disj:tree_R") \bool disj_same_tree_reach(\oset heaplet, struct t_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, tree_reach(y))) ==> \at(enter, tree_reach(y)) == \at(exit, tree_reach(y)))
;)
_(logic _(dryad "disj:posttree_R") \bool disj_same_posttree_reach(\oset heaplet, struct t_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, posttree_reach(y))) ==> \at(enter, posttree_reach(y)) == \at(exit, posttree_reach(y)))
;)
_(logic _(dryad "disj:tree_size") \bool disj_same_tree_size(\oset heaplet, struct t_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, tree_reach(y))) ==> \at(enter, tree_size(y)) == \at(exit, tree_size(y)))
;)
_(logic _(dryad "disj:tree_order") \bool disj_same_tree_order(\oset heaplet, struct t_node * y, \state enter, \state exit) =
	(\oset_disjoint(\at(enter, heaplet), \at(enter, tree_reach(y))) ==> \at(enter, tree_order(y)) == \at(exit, tree_order(y)))
;)
// -------------------------------- dummy abstract function --------------------------------
_(abstract _(dryad "end") void end_t_node_defs(struct t_node * x) ;)

/// ----------------------------- axioms --------------------------------------------------
//_(axiom \forall \oset os1, os2, os3; \disjoint(os1, (os2 \union os3)) <==> (\disjoint(os1, os2) && \disjoint(os1, os3)))
//_(axiom \forall \oset os1, os2; \disjoint(os1, os2) == \disjoint(os2, os1))
//_(axiom \forall \oset os1, os2; \disjoint(os1, os2) <==> \subset(os1, (\universe() \diff os2)))
//_(axiom \forall \oset os1, os2; \forall \object o; (os1 == (os2 \union {o})) ==> \subset(os2, os1)) // [sll-reverse]


//_(axiom \forall \intset is1, is2, is3; \intset_diff(\intset_union(is1, \intset_union(is2, is3)), is1) 
//										== \intset_union(is2, is3))

#endif
