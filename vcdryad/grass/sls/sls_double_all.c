#include "dryad_sls.h"

_(dryad)
Node * sls_double_all(Node * lst)
  _(requires srtl(lst))
  _(ensures srtl(lst))
  _(ensures srtl(\result))
{
  _(assume mutable_list(lst))
  _(ghost \oset ALL_REACH = srtl_reach(lst) ;)
  if (lst == NULL) {
    return NULL;
  } 

  Node * curr = lst;
  Node * cp = NULL;
  Node * res = (Node *) malloc(sizeof(Node));  
  _(assume res != NULL)
  _(assume !\oset_in(res, ALL_REACH))
  _(ghost ALL_REACH = \oset_union(ALL_REACH, \oset_singleton(res)) ;)
  int curr_key = curr->key;
  curr_key = _(unchecked)((int)curr_key * 2);
  _(assume curr_key == curr->key * 2)
  res->key = curr_key; 
  res->next = NULL;
  cp = res;
  _(assume mutable_list(curr))
  curr = curr->next;
  _(assume mutable_list(curr))
  _(assume mutable_list(cp))
  while(curr != NULL) 
    _(invariant srtl(lst))
    _(invariant srtl(res))
    _(invariant \oset_disjoint(srtl_reach(res), srtl_reach(lst)))
    _(invariant srtl(curr))
    _(invariant \oset_disjoint(srtl_reach(res), srtl_reach(curr)))
    _(invariant srtl_lseg(lst, curr))
    _(invariant \oset_disjoint(srtl_lseg_reach(lst, curr), srtl_reach(curr)))

    _(invariant srtl(cp))
    _(invariant srtl_lseg(res, cp))
    _(invariant \oset_disjoint(srtl_lseg_reach(res, cp), srtl_reach(cp)))


    _(invariant \oset_disjoint(srtl_reach(cp), srtl_lseg_reach(lst, curr)))
    _(invariant \oset_disjoint(srtl_reach(cp), srtl_reach(curr)))
    _(invariant \oset_disjoint(srtl_reach(cp), srtl_reach(lst)))
    _(invariant \oset_disjoint(srtl_reach(res), srtl_lseg_reach(lst, curr)))

    _(invariant \oset_subset(srtl_reach(lst), ALL_REACH))
    _(invariant \oset_subset(srtl_reach(res), ALL_REACH))
    _(invariant \oset_subset(srtl_reach(cp), ALL_REACH))
    _(invariant \oset_subset(srtl_reach(curr), ALL_REACH))
  
    _(invariant cp != NULL)
    _(invariant cp->next == NULL)
    //_(invariant cp->key == 2 * curr->key)

    _(invariant mutable_list(curr))
    _(invariant mutable_list(cp))
  {
    Node * new_cp = (Node *) malloc(sizeof(Node));
    _(assume new_cp != NULL)
    _(assume !\oset_in(new_cp, ALL_REACH))
    _(ghost ALL_REACH = \oset_union(ALL_REACH, \oset_singleton(new_cp)) ;)

    int curr_key = curr->key;
    curr_key = _(unchecked)(2 * curr_key);
    _(assume curr_key == curr->key * 2)
    new_cp->key = curr_key;
    new_cp->next = NULL;

    cp->next = new_cp;
    cp = cp->next;


    curr = curr->next;
    _(assume mutable_list(curr))
    _(assume mutable_list(cp))
  }
  return res;
}
