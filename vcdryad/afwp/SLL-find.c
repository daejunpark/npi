#include "dryad_SLL.h"

_(pure) int has_property(Node * x);
// 1 if x has desired propertiy
// 0 otherwise
_(dryad)
Node * SLL_find(Node * h)
  _(requires sll(h))
  _(ensures sll(h))
  _(ensures sll(\result))
{
  Node * i = h;
  Node * j = NULL;
  Node * t = NULL;
  while(i != NULL && t == NULL) 
    _(invariant sll(i))
    _(invariant t != NULL ==> sll(t))
  {
    if(has_property(i)) {
      t = i;
    } else {
      i = i->next;
    }
  }
  return t;
}
