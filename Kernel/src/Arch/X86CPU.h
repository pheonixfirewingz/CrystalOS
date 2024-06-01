#pragma once
#include <Share/KTypes.h>

void getCPUID(u32 *eax, u32 *ebx, u32 *ecx, u32 *edx);
void clearAReg();
void clearBReg();
void clearCReg();
void clearDReg();
u32 getCR0();
u32 getCR1();
u32 getCR2();
u32 getCR3();
u32 getCR4();
u32 getEDI();
u32 getFlags();
void setCR0(const u32 value);
void setCR1(const u32 value);
void setCR2(const u32 value);
void setCR3(const u32 value);
void setCR4(const u32 value);
void setEDI(const u32 value);
void setFlags(const u32 value);
u8 isSSESupported();
u8 isSSE2Supported();
u8 isSSE3Supported();
u8 isSSSE3Supported();
u8 isSSE41Supported();
u8 isSSE42Supported();
u8 isAVXSupported();
u8 is64bitSupported();

void enableSSE();

void enablePaging();