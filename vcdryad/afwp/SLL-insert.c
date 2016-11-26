#include "dryad_SRTL.h"

_(dryad)
Node * SLL_insert(Node * h, int v) 
    _(requires srtl(h))
    _(ensures srtl(h))
    _(ensures srtl(\result))
{
  _(ghost \oset ALL_REACH = srtl_reach(h))
  _(assume mutable_list(h))
  Node * i = h;
  Node * j = NULL;
  while(i != NULL && i->key <= v) 
    _(invariant srtl(h))
    _(invariant srtl(i))
    _(invariant srtl_lseg(h, i))
    _(invariant \oset_disjoint(srtl_lseg_reach(h, i), srtl_reach(i)))
    _(invariant srtl(j))
    _(invariant j == NULL ==> i == h)
    _(invariant j != NULL ==> srtl_lseg(h, j))
    _(invariant j != NULL ==> \oset_disjoint(srtl_lseg_reach(h, j), srtl_reach(j)))
    _(invariant j != NULL ==> j->next == i)
    _(invariant j != NULL ==> j->key <= v)
    _(invariant \oset_subset(srtl_reach(i), ALL_REACH))
    _(invariant \oset_subset(srtl_reach(j), ALL_REACH))
    _(invariant \oset_subset(srtl_lseg_reach(h, i), ALL_REACH))
    _(invariant \oset_subset(srtl_lseg_reach(h, j), ALL_REACH))
  {
    j = i;
    i = i->next;
  }
  if (i == h) {
    Node * hd = (Node *)malloc(sizeof(Node));
    _(assume hd != NULL)
    hd->key = v;
    hd->next = i;
    return hd;
  } 
  else {
    Node * e = (Node *)malloc(sizeof(Node));
    _(assume e != NULL)
    
    e->key = v;
    j->next = e;
    e->next = i;
    return h;
  } 
}
