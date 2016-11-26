#include "dryad_dl.h"

_(dryad)
void dl_dispose(DLNode * a, DLNode * b _(out \oset ALL_REACH))
  _(requires dll(a))
  _(requires dll(b))
  _(requires dll_lseg(a, b))
  _(requires \oset_disjoint(dll_lseg_reach(a, b), dll_reach(b)))
  _(requires a != NULL ==> a->prev == NULL)
  _(requires b != NULL ==> b->next == NULL)
  _(ensures ALL_REACH == \oset_empty())
{
  _(assume mutable_list(a))
  _(assume a != NULL ==> \malloc_root(a))
  _(ghost ALL_REACH = dll_reach(a) ;) // \oset_union(dll_reach(a), dll_reach(b)) ;)

  DLNode * prv = NULL;
  while(a != NULL) 
    _(invariant dll(a))
    _(invariant ALL_REACH == dll_reach(a))
    _(invariant mutable_list(a))
    _(invariant a != NULL ==> \malloc_root(a))
  {
    prv = a;
    a = a->next;
    _(assume mutable_list(a))
    _(assume a != NULL ==> \malloc_root(a))
    free(prv);
    _(ghost ALL_REACH = \oset_diff(ALL_REACH, \oset_singleton(prv)))
  }
}
