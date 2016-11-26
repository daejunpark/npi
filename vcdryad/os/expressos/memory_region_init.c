#include "dryad_dll_mem_reg_defs.h"

_(logic \bool mutable_list(MemReg * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
MemReg * memory_region_init(BackingFile * file_, 
                            int file_offset_, 
                            int file_size_, 
                            int start_address_, 
                            int size_)
  _(ensures \result->file          == file_)
  _(ensures \result->file_offset   == file_offset_)
  _(ensures \result->file_size     == file_size_)
  _(ensures \result->start_address == start_address_)
  _(ensures \result->size          == size_)

// INV:BEGIN
  _(ensures \result->prev          == NULL)
  _(ensures \result->next          == NULL)
  _(ensures \result != NULL)
  _(ensures dll(\result))
// INV:END

{
  MemReg * mr = (MemReg *) malloc(sizeof(MemReg));
  _(assume mr != NULL)
  mr->file = file_;
  mr->file_offset = file_offset_;
  mr->file_size = file_size_;
  mr->start_address = start_address_;
  mr->size = size_;
  mr->prev = NULL;
  mr->next = NULL;
  return mr;
}
