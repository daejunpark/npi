#include "dryad_sl.h"

_(dryad)
Node * sl_copy(Node * lst)
  _(requires sll(lst))
  _(ensures sll(lst))
  _(ensures sll(\result))
{
  _(assume mutable_list(lst))
  _(ghost \oset ALL_REACH = sll_reach(lst) ;)

  Node * curr = lst;
  Node * cp = NULL;
  while(curr != NULL) 
    _(invariant sll(lst))
    _(invariant sll_lseg(lst, curr))
    _(invariant sll(curr))
    _(invariant \oset_disjoint(sll_lseg_reach(lst, curr), sll_reach(curr)))
    _(invariant sll(cp))
    _(invariant \oset_disjoint(sll_lseg_reach(lst, curr), sll_reach(cp)))
    _(invariant \oset_disjoint(sll_reach(cp), sll_reach(curr)))
    _(invariant \oset_disjoint(sll_reach(cp), sll_reach(lst)))

    // TODO: loop invariant for G0 from the Dryad translator
    _(invariant \oset_subset(sll_reach(lst), ALL_REACH))
    _(invariant \oset_subset(sll_reach(cp), ALL_REACH))
    _(invariant \oset_subset(sll_reach(curr), ALL_REACH))

    _(invariant mutable_list(curr))
    _(invariant mutable_list(cp))
  {
    Node * old_cp = cp;
    cp = (Node *) malloc(sizeof(Node));
    _(assume cp != NULL)
    _(assume !\oset_in(cp, ALL_REACH))
    _(ghost ALL_REACH = \oset_union(ALL_REACH, \oset_singleton(cp)) ;)
    cp->next = old_cp;
    curr = curr->next;
    _(assume mutable_list(curr))
    _(assume mutable_list(cp))
  }
  return cp;
}
