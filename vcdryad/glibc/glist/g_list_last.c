#include "dryad_dll_lseg_defs.h"

_(logic \bool mutable_list(DLNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
DLNode * g_list_last(DLNode * list) 
  _(requires dll(list))
  _(ensures  dll(list) == \old(dll(list)))
  _(ensures  list != NULL ==> \result != NULL)
  _(ensures !\oset_in(\result, dll_lseg_reach(list, \result)))
  _(ensures  dll(list))
  _(ensures  dll(\result))
  _(ensures  dll_lseg(list, \result))
  _(ensures \oset_disjoint(dll_lseg_reach(list, \result), dll_reach(\result)))
{
  _(assume mutable_list(list))
  if (list != NULL) {
    while(list->next != NULL) 
      _(invariant dll(list))
      _(invariant dll(\old(list)))
      _(invariant dll_lseg(\old(list), list))
      _(invariant \oset_disjoint(dll_reach(list), dll_lseg_reach(\old(list), list)))
      _(invariant dll_keys(list) == \intset_union(dll_keys(list->next), \intset_singleton(list->key)))
      _(invariant list != NULL && mutable_list(list))
    {
      list = list->next;
      _(assume mutable_list(list))
    }
  }
  return list;
}

