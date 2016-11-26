#include "dryad_dll_mem_reg_defs.h"

_(logic \bool mutable_list(MemReg * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
MemReg * memory_region_find(MemReg *head, int address)
  _(requires dll(head))
  _(ensures dll(\result))
{
  _(assume mutable_list(head))
  MemReg *h = head;
  while (h != NULL)
    _(invariant dll(h))
  {
    _(assume h->start_address + h->size < INT_MAX)
    _(assume h->start_address + h->size > INT_MIN)
    if (h->start_address <= address && address < h->start_address + h->size) {
      return h;
    }
    h = h->next;
  }
  return NULL;
}
