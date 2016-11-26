#include "dryad_sls.h"

typedef
struct node_tuple{
  Node * hd;
  Node * tl;
} NodeTuple;

_(dryad)
Node * split(Node * x)
  _(requires srtl(x))
  _(ensures \old(srtl(x)))
  _(ensures srtl(\result))
  _(ensures srtl(x))
  _(ensures \oset_disjoint(srtl_reach(\result), srtl_reach(x)))
{
  _(assume mutable_list(x))
  //Node * y = x;
  Node * z = x;

  Node * curr = x;
  while(curr != NULL)
    _(invariant srtl_lseg(x, curr))
    _(invariant \oset_disjoint(srtl_lseg_reach(x, curr), srtl_reach(curr)))
    _(invariant srtl_lseg(x, z))
    _(invariant \oset_disjoint(srtl_lseg_reach(x, z), srtl_reach(z)))
    _(invariant srtl(curr))
    _(invariant srtl(z))
    _(invariant srtl_lseg(z, curr))
    _(invariant \oset_disjoint(srtl_lseg_reach(z, curr), srtl_reach(curr)))
    _(invariant mutable_list(curr))
    _(invariant mutable_list(z))
  {
    z = z->next;
    curr = curr->next;
    if (curr != NULL) {
      curr = curr->next;
    }
    _(assume mutable_list(curr))
    _(assume mutable_list(z))
  }
  if (z != NULL) {
    Node * tmp = z;
    z = z->next;
    tmp->next = NULL;
  } 

  return z;
}

