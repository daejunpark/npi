#include "dryad_dll_mem_reg_defs.h"

_(logic \bool mutable_list(MemReg * x) = x != NULL ==> \mutable(x) && \writable(x))

MemReg *memory_region_insert_before(MemReg *x, MemReg *y) 
  _(requires dll(x))
  _(requires dll(y))
  _(ensures  dll(\result))
;

_(dryad)
MemReg * memory_region_insert(MemReg *head, MemReg *node)
  _(requires dll(head))
  _(requires dll(node))
  _(ensures dll(\result))
{
  _(assume mutable_list(head))
  MemReg *curr = head;
  while (curr != NULL)
    _(invariant dll(curr))
  {
    _(assume node->start_address + node->size < INT_MAX)
    _(assume node->start_address + node->size > INT_MIN)
    if (node->start_address + node->size < curr->start_address) {
      curr = curr->next;
    } else {
      break;
    }
  }
  return memory_region_insert_before(curr, node);
}
