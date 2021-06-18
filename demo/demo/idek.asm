TITLE My First Program (Test.asm)
INCLUDE Irvine32.inc

.data
status_byte BYTE 10011010b

Msg1 BYTE "The document just read is shorter than anticipated", 0
Msg2 BYTE "The document just read is longer than anticipated", 0
Msg3 BYTE "Current document is too close to the preceding document", 0
Msg4 BYTE "Two documents were detected at the same time", 0
Msg5 BYTE "The document is skewed (crooked) in the transport", 0
Msg6 BYTE "The document fails to feed into the transport", 0
Msg7 BYTE "The document jammed in the transport", 0
Msg8 BYTE "An unknown/unspecified error occured", 0

MessageOffset DWORD offset Msg1, offset Msg2, offset Msg3, offset Msg4, offset Msg5, offset Msg6, offset Msg7, offset Msg8

.code
maint PROC

	mov al, 00000001b
	mov esi, 0
	mov ecx, 8

L1:
	test status_byte, al
	jz NoMsg
	mov edx, MessageOffset[esi]
	call WriteString
	call crlf
NoMsg:
	shl al, 1
	add esi, 4
	LOOP L1

	exit
maint ENDP
END maint	