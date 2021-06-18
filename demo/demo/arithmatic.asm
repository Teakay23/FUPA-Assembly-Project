TITLE Question 5 (arithmatic.asm)
INCLUDE Irvine32.inc

.data
AskStartTime BYTE "Enter quiz open time. ", 0Dh, 0Ah, "Hours: ", 0, "Minutes: ", 0
AskEndTime BYTE "Enter quiz close time.", 0Dh, 0Ah, "Hours: ", 0, "Minutes: ", 0
StartTimeFile WORD 2 DUP(?)
EndTimeFile WORD 2 DUP(?)
StartTimeError BYTE "Invalid input for time. Try again.", 0Dh, 0Ah, 0

timeCmp SYSTEMTIME <>

.code
main PROC
	call clrscr

startLabel1:
	mov edx, offset AskStartTime
	call writestring
	call ReadDec
	cmp eax, 24
	jae StartError1
	mov StartTimeFile, ax
	jmp startLabel2
	StartError1:
		mov edx, offset StartTimeError
		call writestring
		jmp startLabel1
startLabel2:
	mov edx, offset AskStartTime
	add edx, 32
	call writestring
	call ReadDec
	cmp eax, 60
	jae StartError2
	mov StartTimeFile[2], ax
	jmp endLabel1
	StartError2:
		mov edx, offset StartTimeError
		call writestring
		jmp startLabel2

	call crlf
endLabel1:
	mov edx, offset AskEndTime
	call writestring
	call ReadDec
	cmp eax, 0
	je endError1
	mov ebx, 24
	sub bx, StartTimeFile
	sub bx, ax
	jz endError1
	mov bx, StartTimeFile
	mov EndTimeFile, bx
	add EndTimeFile, ax
	mov bx, StartTimeFile[2]
	mov EndTimeFile[2], bx
	jmp _continueTime
	endError1:
		lea edx, StartTimeError
		call writestring
		jmp endLabel1

_continueTime:
	mov eax, 0
	mov ax, StartTimeFile
	call WriteDec
	mov ax, StartTimeFile[2]
	call WriteDec
	mov ax, EndTimeFile
	call WriteDec
	mov ax, EndTimeFile[2]
	call WriteDec


	call crlf
	call crlf
	INVOKE GetSystemTime, Addr timeCmp
	add timeCmp.wHour, 5
	mov eax, 0
	mov ax, timeCmp.wHour
	call WriteDec
	call crlf
	mov ax, timeCmp.wMinute
	call WriteDec


	exit
main ENDP
END main