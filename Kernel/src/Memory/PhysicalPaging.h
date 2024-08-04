#pragma once
#include "MutliBoot.h"
#include "KTypes.h"

typedef void *PhysicalAddress;
typedef void *VirtualAddress;

void initPaging(multiboot_info_t *info);

PhysicalAddress pageAlloc(const u64 size);
PhysicalAddress pageAllocAligned(const u64 size, const u64 align);
void pageFree(const PhysicalAddress ptr);