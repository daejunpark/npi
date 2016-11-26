#include "dryad_dll_lseg_defs.h"

_(logic \bool mutable_list(DLNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
int g_list_index(DLNode * list, int data _(out DLNode * ret_list)) 
  _(requires dll(list))
  _(requires dll_list_len_next(list) < INT_MAX)
  _(ensures dll(list))
  _(ensures dll(ret_list))
  _(ensures  \intset_in(data, dll_keys(list)) <==> \result >= 0)
  _(ensures !\intset_in(data, dll_keys(list)) <==> \result == -1)
  _(ensures dll_lseg(list, ret_list))
  _(ensures \oset_disjoint(dll_lseg_reach(list, ret_list), dll_reach(ret_list)))
  _(ensures ret_list != NULL ==> dll_lseg_len_next(list, ret_list) == (\natural) \result)
  _(ensures ret_list != NULL ==> ret_list->key == data)
{
  _(assume mutable_list(list))
  _(ghost ret_list = list ;)
  int i;

  i = 0;
  while(list != NULL) 
    _(invariant dll(list))
    _(invariant dll(\old(list)))
    _(invariant dll_lseg(\old(list), list))
    _(invariant \oset_disjoint(dll_lseg_reach(\old(list), list), dll_reach(list)))
    _(invariant !\intset_in(data, dll_lseg_keys(\old(list), list)))
    _(invariant (dll_list_len_next(\old(list)) - dll_list_len_next(list)) == (\natural) i)
    _(invariant dll_lseg_len_next(\old(list), list) == (\natural) i)
    _(invariant i < INT_MAX)
    _(invariant i >= 0)
    _(invariant ret_list == list)
    _(invariant mutable_list(list))
  {
    if (list->key == data) {
      return i;
    }
    i ++;
    list = list->next;
    _(ghost ret_list = list ;)
    _(assume mutable_list(list))
  }
  return -1;
}
