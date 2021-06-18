TITLE project prototype (porject.asm)
INCLUDE Irvine32.inc

.data 
filename byte 30 DUP(0), 0
filehandle dword ?
checkFilenameStr byte 30 DUP(0), 0
prompt1 byte "Enter Quiz name: ", 0
listofquizfile byte "listofquiz.txt",0
fileAlreadyExistsStr byte "Quiz with same name already exists.", 13, 10, 0

.code
CheckFileExists PROTO, pt:DWORD
CheckFileExists PROC pt:DWORD USES EDX 
	mov edi, pt
	mov eax

CheckFileExists ENDP

CreateNewFile PROC USES EDX ECX
	mov edx, offset prompt1
	call WriteString
	mov edx, offset checkFilenameStr
	mov ecx, sizeof	checkFilenameStr
	dec ecx
	call ReadString

	call CheckFileExists, ADDR checkFilenameStr
	cmp al, 1
	je fileAlreadyExists

	mov edx, offset filename
	call CreateOutputFile
	mov filehandle, eax
	jmp fileCreated

fileAlreadyExists:
	mov edx, offset fileAlreadyExistsStr
	call WriteString
fileCreated:
	ret
createNewFile ENDP

main PROC
	call CreateNewFile
	exit
main ENDP
END main
