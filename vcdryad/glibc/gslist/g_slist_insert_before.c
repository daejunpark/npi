#include "dryad_gslist_sll.h"

_(dryad)
Node * g_slist_insert_before(Node * slist, Node * sibling, int data)
  _(requires sll(slist))
  _(requires sll(sibling))
  _(requires sll_lseg(slist, sibling) && \oset_disjoint(sll_lseg_reach(slist, sibling), sll_reach(sibling))) // \lsegStar(slist, sibling))
  _(ensures sll(slist))
  _(ensures sll(\result))
  _(ensures sll_keys(\result) == \intset_union(\old(sll_keys(slist)), \intset_singleton(data)))
{
 
  if (slist == NULL) {
    
    slist = (Node *) malloc (sizeof (Node));
    _(assume slist != NULL)
    
    slist->key = data;

    slist->next = NULL;

    return slist;
  }
  
  _(assume mutable_list(slist))
  Node * node = NULL;
  Node * last = NULL;
  node = slist;
 
  while(node != NULL && node != sibling) 
    _(invariant sll(node))
    _(invariant sll(last))
    _(invariant sll_lseg(slist, node) && \oset_disjoint(sll_lseg_reach(slist, node), sll_reach(node))) //\lsegStar(slist, node))
    _(invariant sll_lseg(slist, last) && \oset_disjoint(sll_lseg_reach(slist, last), sll_reach(last))) //\lsegStar(slist, last))
    _(invariant mutable_list(node))
    _(invariant mutable_list(last))
  {
    last = node;
    node = last->next;
    _(assume mutable_list(node))
  }
  
  if (last == NULL) {
    node = (Node *) malloc (sizeof(Node));
    _(assume node != NULL)
    node->key = data;
    node->next = slist;
    return node;
  } else {
    node = (Node *) malloc (sizeof(Node));
    _(assume node != NULL)
    Node * tmp_last = last->next;
    node->key = data;
    node->next = tmp_last;
    last->next = node;
    return slist;
  }
}
