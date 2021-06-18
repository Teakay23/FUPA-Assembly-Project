TITLE LAB7 (Lab7.asm)
INCLUDE Irvine32.inc

.data

array BYTE 3,7,4,9,6,2,11,5,12,1

.code

memProc PROC

push esi
push ecx
push ebx

mov esi, OFFSET array
mov ecx, LENGTHOF array
mov ebx, 1
call DumpMem

pop ebx
pop ecx
pop esi

ret

memProc ENDP

amain PROC

mov esi, OFFSET array
mov ecx, LENGTHOF array
mov ebx, 1
call DumpMem

mov edx, 0
mov ecx, LENGTHOF array
sub ecx, 1
mov esi, 0

L1:

mov al, array[esi]
mov ah, array[esi+1]
cmp al, ah
jbe BE
mov bl, array[esi]
mov bh, array[esi+1]
mov array[esi], bh
mov array[esi+1], bl

BE:
call memProc
inc esi
mov edi, LENGTHOF array
sub edi, 1
sub edi, edx
cmp esi, edi
jae AE
jmp L1

AE:
inc edx
mov esi, 0
LOOP L1

mov esi, OFFSET array
mov ecx, LENGTHOF array
mov ebx, 1
call DumpMem

exit

amain ENDP
END amain

