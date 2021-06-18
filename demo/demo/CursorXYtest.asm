TITLE My First Program (Test.asm)
INCLUDE Irvine32.inc

.data
filename byte "Student_Teacher_Menu.txt", 0
StudentTeacherMenuPrint byte 3050 DUP(0)
filehandle dword ?
.code

Student_Teacher_Colour PROC USES EAX ECX ESI
	mov ecx, 244
	mov esi, offset StudentTeacherMenuPrint
	cld
	colourloop1:
		lodsb
		call WriteChar
		LOOP colourloop1

	mov ecx, 21
outercolourloop:
	push ecx
	mov eax, lightblue+(black*16)
	call SetTextColor
	mov ecx, 60
	colourloop2:
		lodsb
		call WriteChar
		LOOP colourloop2

	mov eax, white+(black*16)
	call SetTextColor
	lodsb
	call WriteChar

	mov eax, lightred+(black*16)
	call SetTextColor
	mov ecx, 61
	colourloop3:
		lodsb
		call WriteChar
		LOOP colourloop3
	pop ecx
	LOOP outercolourloop

	mov eax, white+(black*16)
	call SetTextColor
	mov ecx, 244
	colourloop4:
		lodsb
		call WriteChar
		LOOP colourloop4

	ret
Student_Teacher_Colour ENDP

main PROC
	mov edx, offset filename
	call OpenInputFile
	mov filehandle, eax

	mov eax, filehandle
	mov ecx, 3500
	mov edx, offset StudentTeacherMenuPrint
	call ReadFromFile
	call Student_Teacher_Colour
	
	exit
main ENDP
END main