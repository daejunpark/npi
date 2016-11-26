#include "dryad_dll_lseg_defs.h"

_(logic \bool mutable_list(DLNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
void g_list_free(DLNode * list _(out \oset ALL_REACH)) 
  _(requires dll(list))
  _(ensures ALL_REACH == \oset_empty())
{
  _(assume mutable_list(list))
  _(assume list != NULL ==> \malloc_root(list))
  _(ghost ALL_REACH = dll_reach(list) ;)

  DLNode * x = list;
  while(x != NULL)
    _(invariant dll(x))
    _(invariant mutable_list(x))
    _(invariant x != NULL ==> \malloc_root(x))
    _(invariant ALL_REACH == dll_reach(x))
  {
    _(assume x != NULL && x->next != NULL ==> (\malloc_root(x->next) == \malloc_root(x)))
    DLNode * next = x->next;
    free(x);
    _(ghost ALL_REACH = \oset_diff(ALL_REACH, \oset_singleton(x)) ;)
    x = next; 
    _(assume mutable_list(x))
  }
}
