#include "dryad_dll_lseg_defs.h"

_(logic \bool mutable_list(DLNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
DLNode * g_list_find(DLNode * list, int data) 
  _(requires dll(list))
  _(ensures dll(\result))
  _(ensures dll_lseg(list, \result))
  _(ensures \oset_disjoint(dll_lseg_reach(list, \result), dll_reach(\result)))
  _(ensures \intset_in(data, dll_keys(list)) ==> \result->key == data)
  _(ensures !\intset_in(data, dll_keys(list)) ==> \result == NULL)
{
  _(assume mutable_list(list))
  while(list != NULL) 
    _(invariant dll(list))
    _(invariant dll_lseg(\old(list), list))
    _(invariant \oset_disjoint(dll_lseg_reach(\old(list), list), dll_reach(list)))
    _(invariant !\intset_in(data, dll_lseg_keys(\old(list), list)))
    _(invariant mutable_list(list))
  {
    if (list->key == data) {
      break;
    }
    list = list->next;
    _(assume mutable_list(list))
  }
  return list;
}
