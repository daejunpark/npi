#include "dryad_sls.h"

_(dryad)
void sls_traverse1(Node * lst)
  _(requires srtl(lst))
  _(ensures  srtl(lst))
{
  _(assume mutable_list(lst))
  Node * curr = lst;
  while(curr != NULL) 
    _(invariant srtl(curr))
    _(invariant mutable_list(curr))
  {
    curr = curr->next;
    _(assume mutable_list(curr))
  }
}

/*
_(dryad)
void sls_traverse2(Node * lst)
  _(requires srtl(lst))
  _(ensures  srtl(lst))
{
  _(assume mutable_list(lst))
  Node * curr;
  if (lst != NULL) {
    curr = lst;
    while(curr != NULL) 
      _(invariant srtl(curr))
      _(invariant mutable_list(curr))
    {
      curr = curr->next;
      _(assume mutable_list(curr))
    }
  }
}
*/
