@ RUN: llvm-mc -triple armv7-elf -filetype asm -o - %s | FileCheck %s
@ RUN: llvm-mc -triple armv7-eabi -filetype obj -o - %s \
@ RUN:   | llvm-readobj -arm-attributes - | FileCheck %s --check-prefix=CHECK-OBJ
.eabi_attribute  Tag_CPU_arch, 10
@CHECK:   .eabi_attribute 6, 10
@CHECK-OBJ: Tag: 6
@CHECK-OBJ-NEXT: Value: 10
@CHECK-OBJ-NEXT: TagName: CPU_arch
@CHECK-OBJ-NEXT: Description: ARM v7

.eabi_attribute  Tag_ABI_align_needed, 10
@CHECK:   .eabi_attribute 24, 10
@CHECK-OBJ: Tag: 24
@CHECK-OBJ-NEXT: Value: 10
@CHECK-OBJ-NEXT: TagName: ABI_align_needed
@CHECK-OBJ-NEXT: Description: 8-byte alignment, 1024-byte extended alignment

.eabi_attribute  Tag_ABI_align_preserved, 10
@CHECK:   .eabi_attribute 25, 10
@CHECK-OBJ: Tag: 25
@CHECK-OBJ-NEXT: Value: 10
@CHECK-OBJ-NEXT: TagName: ABI_align_preserved
@CHECK-OBJ-NEXT: Description: 8-byte stack alignment, 1024-byte data alignment

