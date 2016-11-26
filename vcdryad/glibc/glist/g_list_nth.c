#include "dryad_dll_lseg_defs.h"
_(logic \bool mutable_list(DLNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
DLNode * g_list_nth(DLNode * list, int n)
  _(requires dll(list))
  _(requires n >= 0)
  _(ensures dll(list))
  _(ensures dll(\result))
  _(ensures dll_lseg(list, \result) 
         && \oset_disjoint(dll_lseg_reach(list, \result), dll_reach(\result)))
  _(ensures \result == NULL ==> ((\natural) n >= dll_list_len_next(list)))
  _(ensures \result != NULL ==> ((dll_list_len_next(list) - dll_list_len_next(\result)) == (\natural) n))
  _(ensures \result != NULL ==> (dll_lseg_len_next(list, \result) == (\natural) n))
{
  _(assume mutable_list(list))
  while(n > 0 && list != NULL) 
    _(invariant n >= 0) 
    _(invariant dll(list))
    _(invariant dll_lseg(\old(list), list) 
            && \oset_disjoint(dll_lseg_reach(\old(list), list), dll_reach(list)))
    _(invariant list == NULL ==> ((\natural) \old(n) >= dll_list_len_next(\old(list)))) 
    _(invariant list != NULL ==> 
        ((\natural) (\old(n) - n) == (dll_list_len_next(\old(list)) - dll_list_len_next(list))))
    _(invariant list != NULL ==> (dll_lseg_len_next(\old(list), list) == (\natural) (\old(n) - n)))
    _(invariant dll_list_len_next(\old(list)) == (dll_lseg_len_next(\old(list), list) 
                                                + dll_list_len_next(list)) )
    _(invariant mutable_list(list))
  {
    n --;
    list = list->next;
    _(assume mutable_list(list))
  }
  return list;
}             

