TITLE lab 8 (lab8.asm)
INCLUDE Irvine32.inc

.data

Byte1 byte 23h
Byte2 byte 54h
Byte3 byte 6Fh

.code
omain PROC

mov esi, OFFSET Byte1 ; Displaying Original Memory Values
mov ecx, 3
mov ebx, TYPE Byte1
call DumpMem

mov cl, byte3
mov bl, Byte2

SHRD ax, bx, 8
mov Byte3, ah

mov bl, Byte1

SHRD ax, bx, 8
mov Byte2, ah

SHRD ax, cx, 8
mov Byte1, ah

mov esi, OFFSET Byte1 ; Displaying Changed Memory Values
mov ecx, 3
mov ebx, TYPE Byte1
call DumpMem

exit

omain ENDP
END omain