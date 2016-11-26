#include "dryad_SLL.h"

_(dryad)
void delete_all(Node * h, int k _(out \oset ALL_REACH)) 
  _(requires sll(h))
  _(ensures  ALL_REACH == \oset_empty())
{
  _(assume mutable_list(h))
  _(assume h != NULL ==> \malloc_root(h))
  _(ghost ALL_REACH = sll_reach(h))
  
  Node * i = h;
  while(i != NULL) 
    _(invariant sll(i))
    _(invariant ALL_REACH == sll_reach(i))
    _(invariant mutable_list(i))
    _(invariant i != NULL ==> \malloc_root(i))
  {
    Node * j = i;
    i = i->next;
    _(assume mutable_list(i))
    _(assume i != NULL ==> \malloc_root(i))
    j->next = NULL;
    free(j);
    _(ghost ALL_REACH = \oset_diff(ALL_REACH, \oset_singleton(j)) ;)
  }

}
  
