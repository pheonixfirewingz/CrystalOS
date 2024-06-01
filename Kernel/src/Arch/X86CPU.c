#include "X86CPU.h"
#include <Share/Attributes.h>

/* temp */
extern void println(const u8 *str);
extern void print_hex(int number);
extern void print_bit(int number, u8 mask);

#define MASK(x) (1 << (x))

void getCPUID(u32 *eax, u32 *ebx, u32 *ecx, u32 *edx)
{
    __asm__ volatile("cpuid" : "=a"(*eax), "=b"(*ebx), "=c"(*ecx), "=d"(*edx) : "0"(*eax), "2"(*ecx));
}

void clearAReg()
{
    __asm__ volatile("xor %eax, %eax");
}

void clearBReg()
{
    __asm__ volatile("xor %ebx, %ebx");
}

void clearCReg()
{
    __asm__ volatile("xor %ecx, %ecx");
}

void clearDReg()
{
    __asm__ volatile("xor %edx, %edx");
}

u32 getCR0()
{
    u32 eax = 0;
    __asm__ volatile("mov %%cr0, %0" : "=r"(eax));
    return eax;
}

u32 getCR1()
{
    u32 eax = 0;
    __asm__ volatile("mov %%cr1, %0" : "=r"(eax));
    return eax;
}

u32 getCR2()
{
    u32 eax = 0;
    __asm__ volatile("mov %%cr2, %0" : "=r"(eax));
    return eax;
}

u32 getCR3()
{
    u32 eax = 0;
    __asm__ volatile("mov %%cr3, %0" : "=r"(eax));
    return eax;
}

u32 getCR4()
{
    u32 eax = 0;
    __asm__ volatile("mov %%cr4, %0" : "=r"(eax));
    return eax;
}

u32 getEDI()
{
    u32 eax = 0;
    __asm__ volatile("mov %%edi, %0" : "=r"(eax));
    return eax;
}

u32 getFlags()
{
    u32 eax = 0;
    __asm__ volatile("pushf; pop %0" : "=r"(eax));
    return 0;
}

void setCR0(const u32 value)
{
    __asm__ volatile("mov %0, %%cr0" : : "r"(value));
}

void setCR1(const u32 value)
{
    __asm__ volatile("mov %0, %%cr1" : : "r"(value));
}

void setCR2(const u32 value)
{
    __asm__ volatile("mov %0, %%cr2" : : "r"(value));
}

void setCR3(const u32 value)
{
    __asm__ volatile("mov %0, %%cr3" : : "r"(value));
}

void setCR4(const u32 value)
{
    __asm__ volatile("mov %0, %%cr4" : : "r"(value));
}

void setEDI(const u32 value)
{
    __asm__ volatile("mov %0, %%edi" : : "r"(value));
}

void setFlags(const u32 value)
{
    __asm__ volatile("push %0; popf" : : "r"(value));
}


u8 isSSESupported()
{
    u32 eax = 1, ebx = 0, ecx = 0, edx = 0;
    getCPUID(&eax, &ebx, &ecx, &edx);
    (void)eax;
    (void)ebx;
    (void)ecx;
    if (edx & MASK(25))
        return 1;
    else
        return 0;
}

u8 isSSE2Supported()
{
    u32 eax = 1, ebx = 0, ecx = 0, edx = 0;
    getCPUID(&eax, &ebx, &ecx, &edx);
    (void)eax;
    (void)ebx;
    (void)ecx;
    if (edx & MASK(26))
        return 1;
    else
        return 0;
}

u8 isSSE3Supported()
{
    u32 eax = 1, ebx = 0, ecx = 0, edx = 0;
    getCPUID(&eax, &ebx, &ecx, &edx);
    (void)eax;
    (void)ebx;
    (void)edx;
    if (ecx & MASK(0))
        return 1;
    else
        return 0;
}

u8 isSSSE3Supported()
{
    u32 eax = 1, ebx = 0, ecx = 0, edx = 0;
    getCPUID(&eax, &ebx, &ecx, &edx);
    (void)eax;
    (void)ebx;
    (void)edx;
    if (ecx & MASK(9))
        return 1;
    else
        return 0;
}

u8 isSSE41Supported()
{
    u32 eax = 1, ebx = 0, ecx = 0, edx = 0;
    getCPUID(&eax, &ebx, &ecx, &edx);
    (void)eax;
    (void)ebx;
    (void)edx;
    if (ecx & MASK(19))
        return 1;
    else
        return 0;
}

u8 isSSE42Supported()
{
    u32 eax = 1, ebx = 0, ecx = 0, edx = 0;
    getCPUID(&eax, &ebx, &ecx, &edx);
    (void)eax;
    (void)ebx;
    (void)edx;
    if (ecx & MASK(20))
        return 1;
    else
        return 0;
}

u8 isAVXSupported()
{
    u32 eax = 1, ebx = 0, ecx = 0, edx = 0;
    getCPUID(&eax, &ebx, &ecx, &edx);
    (void)eax;
    (void)ebx;
    (void)edx;
    if (ecx & MASK(28))
        return 1;
    else
        return 0;
}

u8 is64bitSupported()
{
    u32 eax = 0x80000000, ebx = 0, ecx = 0, edx = 0;
    getCPUID(&eax, &ebx, &ecx, &edx);
    (void)ebx;
    (void)ecx;
    if (eax >= (u32)0x80000001)
    {
        eax = 0x80000001;
        getCPUID(&eax, &ebx, &ecx, &edx);
        if (edx & MASK(29))
            return 1;
        else
            return 0;
    }
    else
    {
        return 0;
    }
}

void enableSSE()
{
    u32 cr0 = getCR0();
    cr0 |= 1 << 1;
    cr0 |= 1 << 2;
    setCR0(cr0);
    u32 cr4 = getCR4();
    cr4 ^= 1 << 9;
    cr4 ^= 1 << 10;
    setCR4(cr4);
}

void enablePaging()
{
    u32 cr0 = getCR0();
    cr0 |= 1 << 31;
    setCR0(cr0);
}
