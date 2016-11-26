#include "dryad_bsd_queue.h"

_(logic \bool mutable_qhead(QHead * x) = x != NULL ==> \mutable(x) && \writable(x))
_(logic \bool mutable_list(QNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
QHead * simpleq_insert_tail(QHead * head, QNode * x)
// INV:BEGIN
  _(requires head != NULL)
  _(requires queue(head))

  _(requires x != NULL && x->next == NULL)
  _(requires sll(x))
  _(requires \oset_disjoint(queue_reach(head), sll_reach(x)))
// INV:END

  _(ensures queue(\result))
{
  _(assume mutable_qhead(head))

  if (head->last == NULL) {
    head->first = x;
  } else {
    QNode * last = head->last;
    _(assume mutable_list(last))
    last->next = x;
  }

  head->last = x;
  
  return head;
}

