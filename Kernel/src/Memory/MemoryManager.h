#pragma once

#include "KTypes.h"
#include "MutliBoot.h"

u8 memMamInit(multiboot_info_t* info);
void memMamCleanup();

void* kmalloc(const u64 size);
void* kmallocAligned(const u64 size,const u64 align);
void kfree(void* ptr);

// malloc and free are just wrappers around calloc and free
void* calloc(const u64 size);
void* callocAligned(const u64 size,const u64 align);
void  free(void* ptr);

#define malloc(size) calloc(size)
#define mallocAligned(size, align) callocAligned(size, align)


