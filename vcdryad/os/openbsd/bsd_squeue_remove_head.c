#include "dryad_bsd_queue.h"

_(logic \bool mutable_qhead(QHead * x) = x != NULL ==> \mutable(x) && \writable(x))
_(logic \bool mutable_list(QNode * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
QHead * simpleq_remove_head(QHead * head)
// INV:BEGIN
  _(requires head != NULL)
  _(requires head->first != NULL)
  _(requires queue(head))
// INV:END
  _(ensures queue(head))
{
  _(assume mutable_qhead(head))
  QNode * fst = head->first;
  _(assume mutable_list(fst))
  QNode * fst_nxt = fst->next;

  head->first = fst_nxt;
  
  if (fst_nxt == NULL) {
    head->last = fst_nxt;
  }
  return head;

}
