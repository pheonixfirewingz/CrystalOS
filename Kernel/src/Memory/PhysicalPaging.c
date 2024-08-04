#include "PhysicalPaging.h"

extern void setPageDirectory(void *ptr);
extern void* getPageDirectory();

// made with assistance of (natsukithesunnycat) of discord

//NOTE: using macros can be dangerous so if can be avoided try to avoid them as much as possible
#define PAGING_PAGE_SIZE 4096; // 4KB

// Table 4-15. Format of a PML4 Entry (PML4E) that References a Page-Directory-Pointer Table
union PageMapLevel4
{
    u64 data;
    struct
    {
        u64 present : 1;           // 0 bit P
        u64 rw : 1;                // 1 bit R/W
        u64 user : 1;              // 2 bit U/S
        u64 write_through : 1;     // 3 bit PWT
        u64 cache_disabled : 1;    // 4 bit PCD
        u64 accessed : 1;          // 5 bit A
        u64 ignored : 1;           // 6 bit ignored
        u64 page_size : 1;         // 7 bit PS must be 0
        u64 ignored_1 : 3;         // 10-8 bit ignored
        u64 hlat_or_ignored : 1;   // 11 bit ignored or R
        u64 physical_address : 39; // entry 12-51
        u64 ignored_2 : 10;        // 62-52 bit ignored
        u64 execute_disabled : 1;  // 63 bit DX
    };
};

// Table 4-16. Format of a Page-Directory-Pointer-Table Entry (PDPTE) that Maps a 1-GByte Page
union PageDirectoryPointerTableEntry1GB
{
    u64 data;
    struct
    {
        u64 present : 1;           // 0 bit P
        u64 rw : 1;                // 1 bit R/W
        u64 user : 1;              // 2 bit U/S
        u64 write_through : 1;     // 3 bit PWT
        u64 cache_disabled : 1;    // 4 bit PCD
        u64 accessed : 1;          // 5 bit A
        u64 ignored : 1;           // 6 bit ignored
        u64 page_size : 1;         // 7 bit PS must be 0
        u64 global : 1;            // 8 bit G only using if CR4.PGE = 1 else ignored
        u64 ignored_1 : 2;         // 10-9 bit ignored
        u64 hlat_or_ignored : 1;   // 11 bit ignored or R
        u64 page_attribute : 1;    // 12 bit page attribute
        u64 reserved : 16;         // 13-29 bit reserved
        u64 physical_address : 21; // entry 30-51
        u64 ignored_2 : 6;         // 58-52 bit ignored
        u64 protection_key : 4;    // 62-59 bitProtection key; if CR4.PKE = 1 or CR4.PKS = 1 else ignored
        u64 execute_disabled : 1;  // 63 bit DX
    };
};

// TablTable 4-17. Format of a Page-Directory-Pointer-Table Entry (PDPTE) that References a Page Directorye 4-17. Format of a Page-Directory-Pointer-Table Entry (PDPTE) that References a Page Directory
union PageDirectoryPointerTableEntry
{
    u64 data;
    struct
    {
        u64 present : 1;           // 0 bit P
        u64 rw : 1;                // 1 bit R/W
        u64 user : 1;              // 2 bit U/S
        u64 write_through : 1;     // 3 bit PWT
        u64 cache_disabled : 1;    // 4 bit PCD
        u64 accessed : 1;          // 5 bit A
        u64 ignored : 1;           // 6 bit ignored
        u64 page_size : 1;         // 7 bit PS must be 0
        u64 ignored_1 : 3;         // 10-8 bit ignored
        u64 hlat_or_ignored : 1;   // 11 bit ignored or R
        u64 physical_address : 39; // entry 12-51
        u64 ignored_2 : 10;        // 62-52 bit ignored
        u64 execute_disabled : 1;  // 63 bit DX
    };
};

// Table 4-18. Format of a Page-Directory Entry that Maps a 2-MByte Page
union PageDirectoryEntry2MB
{
    u64 data;
    struct
    {
        u64 present : 1;           // 0 bit P
        u64 rw : 1;                // 1 bit R/W
        u64 user : 1;              // 2 bit U/S
        u64 write_through : 1;     // 3 bit PWT
        u64 cache_disabled : 1;    // 4 bit PCD
        u64 accessed : 1;          // 5 bit A
        u64 dirty : 1;             // 6 bit Dirty; indicates whether software has written to the 2-MByte page referenced by this entry (see Section 4.8)
        u64 page_size : 1;         // 7 bit PS must be 0
        u64 global : 1;            // 8 bit G only using if CR4.PGE = 1 else ignored
        u64 ignored_1 : 2;         // 10-9 bit ignored
        u64 hlat_or_ignored : 1;   // 11 bit ignored or R
        u64 page_attribute : 1;    // 12 bit page attribute
        u64 reserved : 7;          // 13-20 bit reserved
        u64 physical_address : 20; // entry 21-51
        u64 ignored_2 : 6;         // 58-52 bit ignored
        u64 protection_key : 3;    // 62-59 bitProtection key; if CR4.PKE = 1 or CR4.PKS = 1 else ignored
        u64 execute_disabled : 1;  // 63 bit DX
    };
};

// Table 4-19. Format of a Page-Directory Entry that References a Page Table
union PageDirectoryEntry
{
    u64 data;
    struct
    {
        u64 present : 1;           // 0 bit P
        u64 rw : 1;                // 1 bit R/W
        u64 user : 1;              // 2 bit U/S
        u64 write_through : 1;     // 3 bit PWT
        u64 cache_disabled : 1;    // 4 bit PCD
        u64 accessed : 1;          // 5 bit A
        u64 ignored : 1;           // 6 bit ignored
        u64 page_size : 1;         // 7 bit PS must be 0
        u64 ignored_1 : 3;         // 10-8 bit ignored
        u64 hlat_or_ignored : 1;   // 11 bit ignored or R
        u64 physical_address : 39; // entry 12-51
        u64 ignored_2 : 10;        // 62-52 bit ignored
        u64 execute_disabled : 1;  // 63 bit DX
    };
};

// Table 4-20. Format of a Page-Table Entry that Maps a 4-KByte Page
union PageTableEntry
{
    u64 data;
    struct
    {
        u64 present : 1;           // 0 bit P
        u64 rw : 1;                // 1 bit R/W
        u64 user : 1;              // 2 bit U/S
        u64 write_through : 1;     // 3 bit PWT
        u64 cache_disabled : 1;    // 4 bit PCD
        u64 accessed : 1;          // 5 bit A
        u64 dirty : 1;             // 6 bit Dirty; indicates whether software has written to the 4-KByte page referenced by this entry (see Section 4.8)
        u64 page_size : 1;         // 7 bit PS
        u64 global : 1;            // 8 bit G only using if CR4.PGE = 1 else ignored
        u64 ignored_1 : 2;         // 10-9 bit ignored
        u64 hlat_or_ignored : 1;   // 11 bit ignored or R
        u64 physical_address : 39; // entry 12-51
        u64 ignored_2 : 6;         // 58-52 bit ignored
        u64 protection_key : 3;    // 62-59 bitProtection key; if CR4.PKE = 1 or CR4.PKS = 1 else ignored
        u64 execute_disabled : 1;  // 63 bit DX
    };
};

void initPaging(multiboot_info_t *info)
{
    (void)info;
}

void *pageAlloc(const u64 size)
{
    (void)size;
    return 0;
}

PhysicalAddress pageAllocAligned(const u64 size, const u64 align)
{
    (void)size;
    (void)align;
    return 0;
}

void pageFree(const PhysicalAddress ptr)
{
    (void)ptr;
}
