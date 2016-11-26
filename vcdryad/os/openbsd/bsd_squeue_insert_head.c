#include "dryad_bsd_queue.h"

_(logic \bool mutable_qhead(QHead * x) = x != NULL ==> \mutable(x) && \writable(x))
_(logic \bool mutable_list(QNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
QHead * simpleq_insert_head(QHead * head, QNode * x)
// INV:BEGIN
  _(requires head != NULL)
  _(requires queue(head))
  _(requires x != NULL)
  _(requires sll(x))
  _(requires \oset_disjoint(queue_reach(head), sll_reach(x)))
// INV:END

  _(ensures queue(\result))
{
  _(assume mutable_qhead(head))
  _(assume mutable_list(x))

  QNode * lst = head->last;
  QNode * fst = head->first;

  x->next = fst;

  if (x->next == NULL) {
    head->last = x;
  }
  head->first = x;
  return head;
}

