#include "dryad_dll_mem_reg_defs.h"

_(logic \bool mutable_list(MemReg * x) = x != NULL ==> \mutable(x) && \writable(x))

_(dryad)
MemReg * memory_region_init(BackingFile * file_, 
                            int file_offset_, 
                            int file_size_, 
                            int start_address_, 
                            int size_)
  _(ensures \result != NULL)
  _(ensures \result->file          == file_
         && \result->file_offset   == file_offset_
         && \result->file_size     == file_size_
         && \result->start_address == start_address_
         && \result->size          == size_
         && \result->prev          == NULL
         && \result->next          == NULL )
  _(ensures dll(\result))
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

_(dryad)
MemReg * memory_region_create_user_space_region()
// INV:BEGIN
  _(ensures dll(\result))
// INV:END
{
  MemReg * r  = memory_region_init(NULL, 0, 0, 0, 1);
  _(assume mutable_list(r))
  MemReg * r1 = memory_region_init(NULL, 0, 0, 786432, 65536);
  _(assume mutable_list(r1))
  r->next = r1;
  r1->prev = r;
  return r;
}

