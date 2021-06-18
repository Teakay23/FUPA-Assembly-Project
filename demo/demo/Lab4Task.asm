TITLE Lab5 Activity 3 (lab5.asm)
INCLUDE Irvine32.inc

.data

arrayB BYTE 50, 90, 70
arrayW WORD 150, 250, 350
arrayD DWORD 600, 200, 1800

.code
gmain PROC

mov esi, 2

mov al, arrayB
add al, arrayB[esi]

mov bx, arrayW
add bx, arrayW[esi * TYPE arrayW]

mov ecx, arrayD
add ecx, arrayD[esi * TYPE arrayD]

call DumpRegs

exit

gmain ENDP
END gmain

TITLE Question 5 (arithmatic.asm)
INCLUDE Irvine32.inc

.data
;arr1 sbyte 3 DUP(-127)
;arr2 WORD 2, 2 DUP(?)
;	 DWORD 2 DUP(7FE09A9h), $

;result WORD 0

.code

;umain PROC

mov eax, 00002bf6h
mov edx, 00000002h

mov ebx, eax
mov eax, edx
mov ecx, 10000h
mul ecx
add ebx, eax
mov eax, ebx

;MOV AL, [arr1+1]
;MOV ESI, OFFSET[arr2 +6]            ; 0001 0009
;;mov al, byte ptr [esi]
;MOV DX, WORD PTR [arr2+7]           ; FE09
;ADD AL, AL
;MOV ECX, 0Ch
;JMP L1
;INC DL 
;INC CL
;L1: SUB CL,DL                       ; CL = 3
;MOV AL,DL                           ; AL = 09h
;L2: ADD AL, 2
;OOP L2                             ; AL = 0F
;MOV BYTE PTR [ESI],AL        ; [0001 0009] = 0F    07 FE 17 0Fh
;mov ecx, DWORD PTR [arr2+6]

;mov ecx, LENGTHOF arr
;mov esi, 0
;mov ax, 0

;L1:
;mov arr[esi], ax
;inc ax
;add esi, TYPE arr
;LOOP L1

;mov ecx, LENGTHOF arr / 2
;mov esi, OFFSET arr
;mov ax, 0

;L2:
;add ax, [esi]
;add esi, 4
;LOOP L2

;mov result, ax

call DumpRegs
exit

;umain ENDP

;END umain

