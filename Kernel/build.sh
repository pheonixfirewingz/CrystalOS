set -e  # Exit immediately if a command exits with a non-zero status

clear
ROOT=$(pwd)
echo "Building Kernel in directory: ${ROOT}"
SRC_DIR="${ROOT}/Kernel/src"
BUILD_DIR="${ROOT}/build"

# Create build directory if it doesn't exist
mkdir -p "${BUILD_DIR}"

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
        -Werror -Wall -Wextra -m64 -ffreestanding -nostdlib \
        -fno-exceptions -mno-avx -Wnull-dereference -Winit-self \
        -Wmisleading-indentation -Wunused -Wuninitialized \
        -Wuse-after-free -Wno-missing-field-initializers \
        -Wfatal-errors -Wshadow -Wbad-function-cast \
        -Wsuggest-attribute=const -Wsuggest-attribute=pure \
        -Wsuggest-attribute=noreturn -Wsuggest-attribute=format \
        -Wsuggest-attribute=cold -Wpedantic
    OBJECT_FILES+=("${BUILD_DIR}/$1.c.o")
}

compile_asm_file "bootstrap"
compile_asm_file "bootstrap64"
compile_c_file "main"

# Link files together to form kernel
echo "Linking files to form kernel"
ld -n -m elf_x86_64 -T "${SRC_DIR}/KLinker.ld" -o "${BUILD_DIR}/Molton" "${OBJECT_FILES[@]}"

echo "Kernel build successful!"