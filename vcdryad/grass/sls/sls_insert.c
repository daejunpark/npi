#include "dryad_sls.h"

_(dryad)
Node * sls_insert(Node * lst, Node * elt)
  _(requires srtl(lst))
  _(requires elt != NULL)
  _(requires elt->next == NULL)
  _(requires !\oset_in(elt, srtl_reach(lst)))
  _(ensures srtl(\result))
{
  _(assume mutable_list(lst))
  if (lst == NULL || lst->key > elt->key) {
    elt->next = lst;
    return elt;
  } else {
    Node * curr = lst;
    while(curr->next != NULL && curr->next->key <= elt->key)
      _(invariant curr != NULL)
      _(invariant srtl(lst))
      _(invariant srtl(curr))
      _(invariant srtl_lseg(lst, curr))
      _(invariant \oset_disjoint(srtl_lseg_reach(lst, curr), sll_reach(curr)))
      _(invariant !\oset_in(elt, srtl_reach(lst)))
      _(invariant !\oset_in(elt, srtl_reach(curr)))
      _(invariant !\oset_in(elt, srtl_lseg_reach(lst, curr)))
      _(invariant curr->key <= elt->key)
      _(invariant mutable_list(curr))
    {
      curr = curr->next;
      _(assume mutable_list(curr))
    }
    Node * curr_next = curr->next;
    elt->next = curr_next;
    curr->next = elt;
    return lst;
  }
}
