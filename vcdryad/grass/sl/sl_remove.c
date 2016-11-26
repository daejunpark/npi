#include "dryad_sl.h"

_(pure) int havoc();
  

_(dryad)
Node * sl_remove(Node * lst)
  _(requires sll(lst))
  _(ensures sll(\result))
{
  _(assume mutable_list(lst))
  _(assume lst != NULL ==> \malloc_root(lst))
  if (lst == NULL) {
    return NULL;
  } else {
    int nondet;
    Node * curr = lst;
    while(nondet && curr->next != NULL)
      _(invariant curr != NULL)
      _(invariant sll(lst))
      _(invariant sll(curr))
      _(invariant sll_lseg(lst, curr))
      _(invariant \oset_disjoint(sll_lseg_reach(lst, curr), sll_reach(curr)))
      _(invariant mutable_list(curr))
      _(invariant \malloc_root(curr))
    {
      nondet = havoc();
      curr = curr->next;
      _(assume mutable_list(curr))
      _(assume \malloc_root(curr))
    }
    Node * tmp = curr->next;
    _(assume mutable_list(tmp))
    _(assume tmp != NULL ==> \malloc_root(tmp))
    if (tmp != NULL) {
      Node * tmp_next = tmp->next;
      curr->next = tmp_next;
      free(tmp);
    }
    return lst;
  }
}
