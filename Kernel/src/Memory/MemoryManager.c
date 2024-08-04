#include "MemoryManager.h"
#include "KTypes.h"
#include "Printf.h"
#include "PhysicalPaging.h"

struct MemBlock
{
    void *ptr;
    u64 size;
    u32 flags;
    struct MemBlock *next;
    struct MemBlock *prev;
};

struct MemBlock *firstBlock = 0;


u8 memMamInit(multiboot_info_t *info)
{
    (void)info;
    return 1;
}

void memMamCleanup()
{
}
