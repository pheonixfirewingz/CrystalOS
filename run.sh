#!/bin/bash
./Kernel/build.sh
qemu-system-x86_64 -kernel build/Molton -m 4G -serial stdio -vga virtio -cpu host -enable-kvm -no-reboot -no-shutdown #-s -S