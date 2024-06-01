#pragma once

#define ALIGN(x) __attribute__((aligned(x)))
#define MAYBE_UNUSED __attribute__((unused))
#define NORETURN __attribute__((noreturn))
#define USED __attribute__((used))
#define WEAK __attribute__((weak))
#define EXPORT __attribute__((visibility("default")))
#define EXPORT_DATA __attribute__((visibility("default")))
#define EXPORT_FUNCTION __attribute__((visibility("default")))
#define EXPORT_SYMBOL __attribute__((visibility("default")))
#define NOINLINE __attribute__((noinline))
#define ALWAYS_INLINE __attribute__((always_inline))
#define INLINE __inline
#define PACKED __attribute__((packed))
#define UNALIGNED __attribute__((unaligned))
#define NAKED __attribute__((naked))
#define SECTION(x) __attribute__((section(x), used))