set -e  # Exit immediately if a command exits with a non-zero status

clear
ARCH=x86_64
ROOT=$(pwd)
echo "Building Kernel in directory: ${ROOT}"
SRC_DIR="${ROOT}/Kernel/src"
BUILD_DIR="${ROOT}/build"

# Create build directory if it doesn't exist
mkdir -p "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}/Arch/${ARCH}"
mkdir -p "${BUILD_DIR}/Memory"

# Array to store object files
OBJECT_FILES=()

compile_asm_file() {
    echo "Compiling assembly file: $1.asm"
    nasm -f elf64 "${SRC_DIR}/$1.asm" -o "${BUILD_DIR}/$1.asm.o"
    OBJECT_FILES+=("${BUILD_DIR}/$1.asm.o")
}

compile_c_file() {
    echo "Compiling C file: $1.c"
    gcc -c "${SRC_DIR}/$1.c" -o "${BUILD_DIR}/$1.c.o" \
        -Werror -Wall -Wextra -m64 -std=c2x -ffreestanding -nostdlib \
        -fno-exceptions -fno-pie -mcmodel=kernel -mno-red-zone -mno-mmx -mno-sse2 -mno-sse3 -mno-3dnow -mno-avx -Wnull-dereference -Winit-self \
        -Wmisleading-indentation -Wunused -Wuninitialized \
        -Wuse-after-free -Wno-missing-field-initializers \
        -Wfatal-errors -Wshadow -Wbad-function-cast \
        -Wsuggest-attribute=const -Wsuggest-attribute=pure \
        -Wsuggest-attribute=noreturn -Wsuggest-attribute=format \
        -Wsuggest-attribute=cold -Wpedantic -Wno-error=int-to-pointer-cast -Wno-error=implicit-function-declaration \
        -I "${SRC_DIR}"
    OBJECT_FILES+=("${BUILD_DIR}/$1.c.o")
}

compile_asm_file "Arch/${ARCH}/bootstrap"
compile_asm_file "Arch/${ARCH}/bootstrap64"
compile_c_file "Printf"
compile_c_file "Memory/MemoryManager"
compile_c_file "Memory/PhysicalPaging"
compile_c_file "Main"

# Link files together to form kernel
echo "Linking files to form kernel"
ld -n -m elf_x86_64 -T "${ROOT}/Kernel/KLinker.ld" -o "${BUILD_DIR}/Molton" "${OBJECT_FILES[@]}"

# Clean up object files
rm -f "${OBJECT_FILES[@]}"

echo "Kernel build successful!"