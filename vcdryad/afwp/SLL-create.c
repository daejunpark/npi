#include "dryad_SLL.h"

_(dryad)
Node * create(unsigned sz)
  _(ensures sll(\result))
{
  _(ghost \oset ALL_REACH = \oset_empty() ;)
  Node * h = NULL;
  while(sz > 0) 
    _(invariant sll(h))
    _(invariant ALL_REACH == sll_reach(h))
  {
    sz --;
    Node * e = (Node *)malloc(sizeof(Node));
    _(assume e != NULL)
    _(assume !\oset_in(e, ALL_REACH)) 
    _(ghost ALL_REACH = \oset_union(ALL_REACH, \oset_singleton(e)))

    e->next = h;
    h = e;
  }
  return h;
}
