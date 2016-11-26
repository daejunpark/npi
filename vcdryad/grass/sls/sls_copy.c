#include "dryad_sls.h"

_(dryad)
Node * sls_copy(Node * lst _(out \oset ALL_REACH))
  _(requires srtl(lst))
  _(ensures srtl(lst))
  _(ensures srtl(\result))
  _(ensures \oset_disjoint(srtl_reach(lst), srtl_reach(\result)))
  _(ensures sll_keys(lst) == sll_keys(\result))
  _(ensures ALL_REACH == \oset_union(srtl_reach(lst), srtl_reach(\result)))
{
  _(assume mutable_list(lst))
  _(ghost ALL_REACH = srtl_reach(lst) ;)
  Node * head = NULL;
  if (lst == NULL) {
    return NULL;
  } 
  
  Node * curr = lst;
  head = (Node *) malloc(sizeof(Node));  
  _(assume head != NULL)
  _(assume !\oset_in(head, ALL_REACH))
  _(ghost ALL_REACH = \oset_union(ALL_REACH, \oset_singleton(head)) ;)
  Node * cp = head;
  int lst_key = lst->key;
  cp->key = lst_key; 
  cp->next = NULL;
  _(assume mutable_list(curr))
  _(assume mutable_list(cp))
  while(curr->next != NULL) 
    _(invariant (lst != curr && curr != NULL) ==> sll_lseg_max_key(lst, curr) <= curr->key)
    _(invariant srtl(curr))
    _(invariant (head != cp && curr != NULL) ==> sll_lseg_max_key(head, cp) <= curr->key)
    _(invariant cp != NULL)
    _(invariant cp->next == NULL)
    _(invariant cp->key == curr->key)
    _(invariant curr != NULL)
    _(invariant srtl(lst))
    _(invariant srtl_lseg(lst, curr))
    _(invariant \oset_disjoint(srtl_lseg_reach(lst, curr), srtl_reach(curr)))
    _(invariant srtl(head))
    _(invariant srtl_lseg(head, cp))

    _(invariant \oset_disjoint(srtl_reach(lst), srtl_reach(head)))
    _(invariant \oset_disjoint(srtl_reach(curr), srtl_reach(head)))

    _(invariant srtl(cp))
    _(invariant \oset_disjoint(srtl_lseg_reach(head, cp), srtl_reach(cp)))
    _(invariant \oset_disjoint(srtl_reach(cp), srtl_reach(curr)))
    _(invariant \oset_disjoint(srtl_reach(cp), srtl_reach(lst)))

    /*
    _(invariant \oset_disjoint(srtl_reach(cp), srtl_lseg_reach(lst, curr)))
    _(invariant \oset_disjoint(srtl_reach(cp), srtl_reach(curr)))
    _(invariant \oset_disjoint(srtl_reach(cp), srtl_reach(lst)))
    */
   
    //_(invariant cp->key == curr->key)
    //_(invariant sll_lseg_keys(lst, curr) == sll_lseg_keys(head, cp))

    // TODO: loop invariant for G0 from the Dryad translator
    //_(invariant \oset_subset(sll_reach(lst), ALL_REACH))
    //_(invariant \oset_subset(sll_reach(head), ALL_REACH))
    //_(invariant \oset_subset(sll_reach(cp), ALL_REACH))
    //_(invariant \oset_subset(sll_reach(curr), ALL_REACH))
    //_(invariant sll_keys(head) == sll_lseg_keys(lst, curr->next))
  //_(invariant ALL_REACH == \oset_union(srtl_reach(lst), srtl_lseg_reach(head,cp->next)))
    _(invariant ALL_REACH == \oset_union(srtl_reach(lst), srtl_reach(head)))
    
    _(invariant sll_lseg_keys(lst,curr) == sll_lseg_keys(head,cp))
  //_(invariant sll_lseg_keys(lst,curr->next) == sll_lseg_keys(head,cp->next)) // TODO: why is it failed?

    _(invariant mutable_list(curr))
    _(invariant mutable_list(cp))
  {
    Node * old_cp = cp;
    cp = (Node *) malloc(sizeof(Node));
    _(assume cp != NULL)
    _(assume !\oset_in(cp, ALL_REACH))
    _(ghost ALL_REACH = \oset_union(ALL_REACH, \oset_singleton(cp)) ;)

    old_cp->next = cp;
    curr = curr->next;
    int curr_key = curr->key;
    cp->key = curr_key;
    cp->next = NULL;

    _(assume mutable_list(curr))
    _(assume mutable_list(cp))
  }
  return head;
}
