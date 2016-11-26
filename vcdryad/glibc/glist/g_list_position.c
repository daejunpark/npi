#include "dryad_dll_lseg_defs.h"

_(logic \bool mutable_list(DLNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
int g_list_position(DLNode * list, DLNode * link) 
  _(requires dll(list))
  _(requires dll_list_len_next(list) < INT_MAX)
  _(ensures dll(list))
  _(ensures \result == -1 ==> !\oset_in(link, dll_reach(list)))
  _(ensures \oset_in(link, dll_reach(list)) ==> \result >= 0)
  _(ensures \result >= 0 ==> dll_lseg(list, link) 
                         && \oset_disjoint(dll_lseg_reach(list, link), dll_reach(link)))
  _(ensures \result >= 0 ==> (dll_lseg_len_next(list, link) == (\natural)\result))
  
{
  _(assume mutable_list(list))
  int i;

  i = 0;
  while(list != NULL)
    _(invariant dll(list))
    _(invariant dll_lseg(\old(list), list)
            &&  \oset_disjoint(dll_lseg_reach(\old(list), list), dll_reach(list)))
    _(invariant !\oset_in(link, dll_lseg_reach(\old(list), list)))
    _(invariant dll_list_len_next(\old(list)) - dll_list_len_next(list) == (\natural) i)
    _(invariant dll_lseg_len_next(\old(list), list) == (\natural) i)
    _(invariant i < INT_MAX)
    _(invariant i >= 0)
    _(invariant mutable_list(list))
  {
    if (list == link) {
      return i;
    }
    i ++;
    list = list->next;
    _(assume mutable_list(list))
  }
  return -1;
}
