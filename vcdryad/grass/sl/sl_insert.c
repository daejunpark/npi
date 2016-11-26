#include "dryad_sl.h"

_(pure) int havoc();
  

_(dryad)
Node * sl_insert(Node * lst, Node * elt)
  _(requires sll(lst))
  _(requires elt != NULL)
  _(requires elt->next == NULL)
  _(requires !\oset_in(elt, sll_reach(lst)))
  _(ensures sll(\result))
{
  _(assume mutable_list(lst))
  if (lst == NULL) {
    return elt;
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
    {
      nondet = havoc();
      curr = curr->next;
      _(assume mutable_list(curr))
    }
    Node * curr_next = curr->next;
    elt->next = curr_next;
    curr->next = elt;
    return lst;
  }
}
