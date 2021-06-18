TITLE Lab Task 3 (lab3task3.asm)
INCLUDE Irvine32.inc

;initilaized 16bit unsigned integers

.data
A DB 2
B DB 1
C1 DB 2
D DB 3
E DB 2
val DB ?

.code

tmain PROC

;val = A + B * C1 + D - E

mov al,A
add al,B
mul C1
add al,D
sub al,E
mov val,al

call DumpRegs
exit

tmain ENDP

END tmain