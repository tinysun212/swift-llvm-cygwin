# RUN: llvm-mc %s -arch=mips -mcpu=mips32r2 | \
# RUN:   FileCheck %s -check-prefix=CHECK-ASM
#
# RUN: llvm-mc %s -arch=mips -mcpu=mips32r2 -filetype=obj -o - | \
# RUN:   llvm-readobj -sections -section-data -section-relocations - | \
# RUN:     FileCheck %s -check-prefix=CHECK-OBJ

# CHECK-ASM: .4byte 3735929054
# CHECK-ASM: .8byte -2401050962867405073
# CHECK-ASM: .4byte label
# CHECK-ASM: .8byte label

# Checking if the data and reloations were correctly emitted
# CHECK-OBJ:  Section {
# CHECK-OBJ:    Name: .data
# CHECK-OBJ:    SectionData (
# CHECK-OBJ:      0000: DEADC0DE DEADC0DE DEADBEEF 00000000
# CHECK-OBJ:      0010: 00000000 00000000
# CHECK-OBJ:    )
# CHECK-OBJ:  }

# CHECK-OBJ:  Section {
# CHECK-OBJ:    Name: .rel.data
# CHECK-OBJ:    Relocations [
# CHECK-OBJ:      0xC R_MIPS_32 .data 0x0
# CHECK-OBJ:      0x10 R_MIPS_64 .data 0x0
# CHECK-OBJ:    ]
# CHECK-OBJ:  }

.data
label:
        .word 0xdeadc0de
        .dword 0xdeadc0dedeadbeef

        .word label
        .dword label
