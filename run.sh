#!/bin/bash
clear
cd Kernel
./build.sh
cd ..
qemu-system-i386 -s -S -kernel Kernel/zig-out/bin/preMolton -serial stdio -vga virtio -m 4G -cpu host -enable-kvm -no-reboot -no-shutdown
#qemu-system-x86_64 -s -S -cdrom Kernel/zig-out/bin/disk.iso -serial stdio -vga virtio -m 4G -cpu host -enable-kvm -no-reboot -no-shutdown