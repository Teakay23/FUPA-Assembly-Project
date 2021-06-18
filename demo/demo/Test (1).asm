TITLE My First Program (Test.asm)
INCLUDE Irvine32.inc

.data
AskSectionName byte "Enter Section Names (20 character max):",10,13, 0
AskTestName byte "Enter Quiz Name (50 characters max): ", 0
TestName byte "FAST-NU FUPA Test", 0, 32 DUP(0)
SectionStr byte "Section(s):", 0
SectionStr2 byte "Section", 0
Section1Name byte "English", 0, 12 DUP(0)
Section2Name byte "Mathematics", 0, 8 DUP(0)
Section3Name byte "Physics", 0, 12 DUP(0)
Section4Name byte "Chemistry", 0, 10 DUP(0)
Section5Name byte "Prog. Fundamentals", 0, 1 DUP(0)
QuestionNoStr byte "Question No.", 0

msg1 byte "Enter number of sections (max:5) : ", 0
msg1_support byte "You entered sections out of range (range:1-5). Please re-enter.", 0
msg2 byte "Enter number of questions per section (max:20) : ", 0
msg2_support byte "You entered the number out of range (range:1-20). Please re-enter.", 0
msg3 byte "Enter number of minutes per section (range:1-20): ", 0
enterQ byte "Enter Question ", 0
enterC byte "Enter Choice : ", 0
enterA byte "Enter an alphabet pointing the right answer (a/b/c/d) : ", 0
enterA_support byte "The alphabet is not in range. (Range:a,b,c,d). Please re-enter.", 0
enterA_flag Byte ?

totaltime dword ?
currtime dword ?
timeleftmin dword ? ;time left
timeleftsec dword ? ;seconds left
numSections Byte ?
numQuestions Byte ?
Question1 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question2 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question3 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question4 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question5 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question6 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question7 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question8 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question9 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question10 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question11 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question12 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question13 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question14 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question15 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question16 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question17 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question18 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question19 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 1 dup(0)
Question20 Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Ah, 1 dup(0)

;This array will clean or reinitialize the array to use them on the second run.
Reinitializer Byte 100 DUP (0), 0Ah, 0Dh, 20 dup (0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Dh, 20 dup(0), 0Ah, 0Ah, 1 dup(0)

;This "offarray" is a special array, it is storing the offset of all array so we can access all the above array by just adding 4 into this array
offarray dword offset Question1, offset Question2, offset Question3, offset Question4, offset Question5, offset Question6, offset Question7, offset Question8, offset Question9, offset Question10, offset Question11, offset Question12, offset Question13, offset Question14, offset Question15, offset Question16, offset Question17, offset Question18, offset Question19, offset Question20

filename BYTE "QuizFile.txt",0
filehandle DWORD ?

;shadow array to know whats been generated and what not. indexes correspond to question numbers. any with value other than 0 has been generated
shadow byte 20 DUP(0)

.code

AskForSectionNames PROC USES EAX ECX EDX EDI
	call ClrScr
	mov edx, offset AskSectionName
	call WriteString

	mov edx, offset Section1Name
	movzx ecx, numSections

	askSectionsLoop:
		push ecx
		mov ecx, 20
		mov al, 0
		mov edi, edx
		cld
		rep stosb
		mov ecx, 19
		call ReadString
		add edx, 20
		pop ecx
		LOOP askSectionsLoop

	call ClrScr
	ret
AskForSectionNames ENDP

PrintInMiddle PROTO, stringAddr:DWORD, lengthStr:DWORD, lineNumber:BYTE
PrintInMiddle PROC USES EAX EDX stringAddr:DWORD, lengthStr:DWORD, lineNumber:Byte	; Requires the string to be printed, its length and the line number
																					; of the line you want the string to be printed on
	call GetMaxXY
	shr dl, 1
	mov al, BYTE PTR lengthStr
	shr al, 1
	sub dl, al
	mov dh, lineNumber
	call GotoXY
	mov edx, stringAddr
	call WriteString
	call crlf
	
	ret
PrintInMiddle ENDP

DisplayTestInfo PROC USES EAX EBX EDX ECX ESI
	call ClrScr
	mov edx, offset TestName
	call StrLength
	INVOKE PrintInMiddle, Addr TestName, eax, 0
	call crlf

	mov edx, offset SectionStr
	call StrLength
	INVOKE PrintInMiddle, Addr SectionStr, eax, 2
	movzx ecx, numSections
	mov edx, offset Section1Name
	mov bl, 3

printSectionNames:
	call StrLength
	mov esi, eax
	INVOKE PrintInMiddle, edx, esi, bl
	inc bl
	add edx, 20
	LOOP printSectionNames
	call crlf
	
	call WaitMsg
	call ClrScr
	ret
DisplayTestInfo ENDP

Randomizer PROC USES EAX EBX ECX
	;function used: x(index) = (2y+3)%size
	call GetMseconds ;this gets milliseconds into eax. we will be using this as our y
	shl eax, 2
	add eax, 3
	xor edx,edx ; extends the number as edx:eax so we can use divide (mov edx,0)
	movzx ebx, numQuestions ;this is num of qs
	div ebx
	mov ecx, edx ; value of x
	mov ebx, offset shadow
	add ebx, edx 
	movzx eax, byte ptr [ebx]
	cmp eax, 0
	je newnumfound
					;in the case that we get an already used question number, we perform linear probing
	finder:
		add edx, 1
		mov eax, edx
		xor edx, edx
		movzx ebx, numQuestions
		div ebx
		mov ebx, offset shadow
		add ebx, edx
		movzx eax,byte ptr [ebx]
		cmp eax, 0
		je newnumfound
		jmp finder

	newnumfound:
		;new index val is is edx
		mov shadow[edx], 10
		mov eax, edx
		mov edx, offarray[eax*4]  ;actual me ise return krna he

;offset returned in edx
ret
Randomizer ENDP

ReadSectionQuestion PROC USES EAX ECX EDX		; requires an open input filehandle
	mov eax, filehandle
	mov edx, offset numSections
	mov ecx, 1
	call ReadFromFile
	mov eax, filehandle
	mov edx, offset numQuestions
	mov ecx, 1
	call ReadFromFile
	mov eax, filehandle
	mov edx, offset totaltime
	mov ecx, 4
	call ReadFromFile

	ret
ReadSectionQuestion ENDP

ReadQuestions PROC USES EAX ECX EDX				; requires an open input filehandle (reads questions for one section, has to be called every section)
	mov eax, lengthof Question1
	movzx ecx, numQuestions
	mul ecx
	mov ecx, eax
	mov eax, filehandle
	mov edx, offarray
	call ReadFromFile

	ret
ReadQuestions ENDP

WriteQuestions PROC USES EAX EDX ECX			; requires an open output filehandle
	mov eax, lengthof Question1
	mul numQuestions
	mov ecx, eax
	mov eax, filehandle
	mov edx, offarray
	call WriteToFile
	jc show_error_file
	ret
show_error_file:
	call WriteWindowsMsg
	ret
WriteQuestions ENDP

WriteSectionQuestion PROC USES EAX EDX ECX		; requires an open output filehandle (writes questions for one section, is called every section in MakeTest)
	mov eax, filehandle
	mov edx, offset numSections
	mov ecx, 1
	call WriteToFile
	mov eax, filehandle
	mov edx, offset numQuestions
	mov ecx, 1
	call WriteToFile
	mov eax, filehandle
	mov edx, offset totaltime
	mov ecx, 4
	call WriteToFile
	ret
WriteSectionQuestion ENDP

Reinitialize PROC USES ECX EBX ESI EDI

movzx ecx, numQuestions
mov ebx, offset offarray
L1:
	push ecx
	cld
	mov ecx, lengthof Reinitializer
	mov edi, [ebx]
	mov esi, offset Reinitializer
	rep movsb
	pop ecx
	add ebx, 4
loop L1

ret
Reinitialize ENDP

ChoiceLimiter PROC

	mov enterA_flag, 0
	cmp al, 'a'
	jz quit
	cmp al, 'b'
	jz quit
	cmp al, 'c'
	jz quit
	cmp al, 'd'
	jz quit
mov enterA_flag, 1

quit:
	ret
ChoiceLimiter ENDP

AskForTestName PROC USES EDX ECX
	call ClrScr
	mov edx, offset AskTestName
	call WriteString
	mov edx, offset TestName
	mov ecx, 50
	call ReadString

	ret
AskForTestName ENDP

MakeTest PROC USES EAX EBX ECX EDX ESI
	LOCAL QuestionCount:BYTE			; for writing question number

	call AskForTestName					; asking for the name of test
start:
	mov esi, offset Section1Name		; for writing the name of section the question will be put in
	mov edx, offset msg1
	call WriteString		;you will be asked for number of sections
	mov eax, 0
	call ReadDec			;you will input
	cmp al, 5				;it will check the number of section with the max number of section
	jbe _proceed			;if it is below or equal to max, it will proceed, otherwise, will be ask to re-enter again
	mov edx, offset msg1_support
	call WriteString
	call Crlf
	jmp start				;after the telling the problem with your input, you will be moved to start.
	
	_proceed:
		mov numSections, al
		mov edx, offset msg2
		call WriteString		;you will be asked for the number of questions
		mov eax, 0
		call ReadDec			;you will input
		cmp al, 20				;it will check the number of questions with the max number of question
		jbe _proceed1			;if it is below or equal to the max number, it will proceed, otherwise, will be ask to re-enter again
		mov edx, offset msg2_support
		call WriteString
		call Crlf
		jmp _proceed			;it will lead to enter the number of question.

	_proceed1:
		mov numQuestions, al
		mov edx, offset msg3
		call WriteString			; you will be asked for the number of minutes per section
		mov eax, 0
		call ReadDec
		cmp al, 20
		jbe _proceed2
		mov edx, offset msg2_support
		call WriteString
		call Crlf
		jmp _proceed1

	_proceed2:
		mov totaltime, eax
		call WriteSectionQuestion	; Added by Umer to write the number of sections and questions to start of file
		call AskForSectionNames		; asking for name of sections

	movzx ecx, numSections
	_for1:
		mov QuestionCount, 1		; for writing question number
		mov ebx, offset offarray	;the offset of first question stored in ebx taken from the array of offsets, It will also bring to the first question for the second section
		push ecx
		movzx ecx, numQuestions
		_for2:
			push ecx
			
			call clrscr				;The screen will be cleared for every new question
			
			INVOKE PrintInMiddle, Addr SectionStr2, lengthof SectionStr2-1, 0		; writing the name of section on top of the page
			push eax
			mov edx, esi
			call StrLength
			INVOKE PrintInMiddle, esi, eax, 1
			call Crlf
			pop eax
			
			mov edx, offset enterQ
			call WriteString		;You will be asked to enter the question

			push eax
			movzx eax, QuestionCount	; writing the question number
			call WriteDec
			pop eax
			inc QuestionCount
			call crlf

			mov edx, [ebx]
			mov ecx, 98				;the first 100 bytes are allocated for question
			call ReadString
			
			mov edx, offset enterC		;After entering the question, you will be asked to enter four choices
			call WriteString
			mov edx, [ebx]
			add edx, 102			;Since everything related to the question is getting stored in a single array, we formatted those array with a pattern, after 100 bytes, there are two for nextline '\n' feed and return carriage '\r' so that cursor moves to te beginning of next line
			mov ecx, 19				;20 bytes allocated for each choice
			call ReadString
			
			mov edx, offset enterC
			call WriteString			;Choice # 2
			mov edx, [ebx]
			add edx, 124				;offset of the position allocated for choice 2
			mov ecx, 19
			call ReadString
			
			mov edx, offset enterC		;Choice # 3
			call WriteString
			mov edx, [ebx]
			add edx, 146
			mov ecx, 19
			call ReadString
			
			mov edx, offset enterC		;Choice # 4
			call WriteString
			mov edx, [ebx]
			add edx, 168
			mov ecx, 19
			call ReadString
			
		AnswerChoice:
			mov edx, offset enterA		;prompt
			call WriteString
			mov edx, [ebx]
			add edx, 190			;Answer's byte
			mov eax, 0
			call ReadChar		;Since ReadChar doesn't echo the read character to the console
			call WriteChar		;It will be good to write that read character in the console :)
			call ChoiceLimiter
			cmp enterA_flag, 1
			jz _dothis
			mov [edx], al
			call Crlf
			jmp _proceed3
			_dothis:
				call crlf
				mov edx, offset enterA_support
				call WriteString
				call crlf
				jmp AnswerChoice

			_proceed3:
				add ebx, 4		;The offset for the next question array
				mov ecx, 0		;I like to clear the register before working with those, co-op with me
				pop ecx
				dec ecx			;The loop incrementer is popped and decremented, there's a reason for the decrement, in the next line comment
		
		jnz _for2		;The ideal and the first idea was to loop this process using loop, but loop is used for short jumps, so I have to use jnz
		
		call WriteQuestions		; Added by Umer to write questions to file for this section
		
		call Reinitialize		;This instruction will clean the array, put your filing work before this
		add esi, 20
		pop ecx
		dec ecx
	jnz _for1			;same reason for this jnz

;	mov ecx, lengthof Question1
;	mov esi, offset Question1
;	mov edi, type Question1
;	call DumpMem
;
;	mov ecx, lengthof Question2
;	mov esi, offset Question2
;	mov edi, type Question2
;	call DumpMem

ret
MakeTest ENDP


main PROC
	mov edx, offset filename	; opening file
	call CreateOutputFile
	mov filehandle, EAX

	call MakeTest				; making test

	mov eax, filehandle			; closing file
	call CloseFile
	

;	mov edx, offset filename
;	call OpenInputFile
;	mov filehandle, eax

;	call TakeTest

;	mov eax, filehandle
;	call CloseFile

	exit
main ENDP
END main