clear
./build.sh
qemu-system-x86_64 -kernel ./zig-out/bin/Molton -serial stdio -vga virtio -m 4G -machine q35,accel=kvm:whpx:tcg -no-reboot -no-shutdown