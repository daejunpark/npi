#include "dryad_dll_lseg_defs.h"

_(logic \bool mutable_list(DLNode * x) = x != NULL ==> \mutable(x) && \writable(x))
typedef unsigned uint;

_(dryad)
uint g_list_length(DLNode * list, int data) 
  _(requires dll(list))
  _(requires dll_list_len_next(list) < INT_MAX)
  _(ensures dll(list))
  _(ensures \result == dll_list_len_next(list))
{
  _(assume mutable_list(list))
  uint length;

  length = 0;
  while(list != NULL) 
    _(invariant dll(list))
    _(invariant dll(\old(list)))
    _(invariant dll_lseg(\old(list), list))
    _(invariant \oset_disjoint(dll_lseg_reach(\old(list), list), dll_reach(list)))
    _(invariant length < UINT_MAX)
    _(invariant (dll_list_len_next(\old(list)) - dll_list_len_next(list)) == (\natural) length)
    _(invariant mutable_list(list))
  {
    length ++;
    list = list->next;
    _(assume mutable_list(list))
  }
  return length;
}
