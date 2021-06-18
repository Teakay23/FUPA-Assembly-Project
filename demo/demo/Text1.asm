TITLE project prototype (porject.asm)
INCLUDE Irvine32.inc

.data 
Question1 BYTE "Umer Ahmed 19K-0181", 60 DUP(?), 13, 10, "YOLO",0,0,0,0, "c"
Question2 BYTE "Zaid Ahmed xxK-xxxx", 60 DUP(?), 13, 10, "Suck you", "d"
filename BYTE "QuizFile.txt", 0
filehandle DWORD ?
Question3 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)


.code

maint PROC
	mov eax, lengthof Question3
	call WriteDec
	exit
maint ENDP
END maint