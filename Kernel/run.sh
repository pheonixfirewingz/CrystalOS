clear
./build.sh
qemu-system-x86_64 -cdrom zig-out/bin/disk.iso -debugcon stdio -vga virtio -m 4G -machine q35,accel=kvm -no-reboot -no-shutdown