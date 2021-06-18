TITLE Question (lab2.asm)
INCLUDE Irvine32.inc

.data
array1 WORD 25h, 30h, 70h
array2 WORD 1000h, 2000h, 3000h
array3 WORD LENGTHOF array1 DUP(?)

.code

emain PROC

mov esi, OFFSET array1
mov ecx, LENGTHOF array1
mov ebx, 0

L1:
mov ax, [esi]
add ax, [array2 + ebx]
mov [array3 + ebx], ax
add ebx, TYPE array2
add esi, TYPE array1
LOOP L1

call DumpRegs
exit

emain ENDP

END emain

