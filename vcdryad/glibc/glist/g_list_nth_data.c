#include "dryad_dll_lseg_defs.h"
_(logic \bool mutable_list(DLNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
int g_list_nth_data(DLNode * list, int n _(out DLNode * ret_list))
  _(requires dll(list))
  _(requires n >= 0)
  _(ensures dll(list))
  _(ensures dll(ret_list))
  _(ensures dll_lseg(list, ret_list))
  _(ensures \oset_disjoint(dll_lseg_reach(list, ret_list), dll_reach(ret_list)))
  _(ensures (\natural) n >= dll_list_len_next(list) ==> \result == -1)
  _(ensures ret_list != NULL ==> \result == ret_list->key)
  _(ensures ret_list != NULL ==> (dll_lseg_len_next(list, ret_list) == (\natural) n))
{
  _(assume mutable_list(list))
  _(ghost ret_list = list; )
  int res;
  while(n > 0 && list != NULL) 
    _(invariant n >= 0) 
    _(invariant dll(list))
    _(invariant dll(ret_list))
    _(invariant ret_list == list)
    _(invariant dll_lseg(\old(list), list)
             && \oset_disjoint(dll_lseg_reach(\old(list), list), dll_reach(list)))
    _(invariant list == NULL ==> (\natural) \old(n) >= dll_list_len_next(\old(list)))
    _(invariant list != NULL ==> 
        (dll_list_len_next(\old(list)) - dll_list_len_next(list)) == (\natural) (\old(n) - n))
    _(invariant list != NULL ==>
        (dll_lseg_len_next(\old(list), list) == (\natural) (\old(n) - n)))
    _(invariant mutable_list(list))
  {
    n --;
    list = list->next;
    _(assume mutable_list(list))
    _(ghost ret_list = list ;)
  }
  if (list != NULL) {
    res = list->key;
  } else {
    res = -1;
  }
  return res;
}             

