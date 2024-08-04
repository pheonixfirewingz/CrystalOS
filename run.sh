#!/bin/bash
ROOT=$(pwd)
${ROOT}/Kernel/build.sh
mv ${ROOT}/build/Molton ${ROOT}/IosRoot/boot/Molton

if grub-file --is-x86-multiboot ${ROOT}/IosRoot/boot/Molton; then
  echo multiboot confirmed
else
  echo the file is not multiboot
  exit
fi
grub-mkrescue -o ${ROOT}/build/CrystalOS.iso ${ROOT}/IosRoot
qemu-system-x86_64 -cdrom ${ROOT}/build/CrystalOS.iso -m 3G -serial stdio -vga virtio -cpu host -enable-kvm -no-reboot -no-shutdown #-s -S
#ask to remove iso from user y or n default y
#echo "Remove iso file? (y/n)"
#read ANSWER
#if [ $ANSWER = "n" ]; then
#    exit
#else
  rm ${ROOT}/build/CrystalOS.iso
#fi
rm -r ${ROOT}/build