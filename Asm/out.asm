.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib "../Debug/StaticLib.lib"
ExitProcess PROTO:DWORD 
.stack 4096


 outlich PROTO : DWORD

 outrad PROTO : DWORD

 concat PROTO : DWORD, : DWORD, : DWORD

 poww PROTO : DWORD, : DWORD, : DWORD

 compare PROTO : DWORD, : DWORD, : DWORD

 rnd PROTO : DWORD, : DWORD, : DWORD

 slength PROTO : DWORD, : DWORD

 atoii  PROTO : DWORD,  : DWORD

.const
		newline byte 13, 10, 0
		LTRL1 byte 'Result: ', 0
		LTRL2 dword 17
		LTRL3 byte '----------------------', 0
		LTRL4 dword 2
		LTRL5 dword 4
		LTRL6 byte '(', 0
		LTRL7 byte '>=', 0
		LTRL8 byte ') :', 0
		LTRL9 byte 'True', 0
		LTRL10 byte 'False', 0
		LTRL11 byte 'H', 0
		LTRL12 byte 'i', 0
		LTRL13 byte '!', 0
		LTRL14 byte 'Compare: ', 0
		LTRL15 dword 1
		LTRL16 byte 'The lines are the same', 0
		LTRL17 byte 'The lines are not the same', 0
		LTRL18 byte 'Exponentiation of a number: ', 0
		LTRL19 dword 8
		LTRL20 dword 3
		LTRL21 byte 'Arithmetic expression:  ', 0
		LTRL22 dword 5
		LTRL23 byte '77', 0
		LTRL24 byte 'Converting a string to a number: ', 0
		LTRL25 byte 'Hello, World!', 0
		LTRL26 byte 'Line length:', 0
		LTRL27 dword 41
		LTRL28 dword 6
		LTRL29 byte 'Remainder after division 41 by 6 : ', 0
		LTRL30 byte 'Number after shifted to the left : ', 0
		LTRL31 byte 'POIT ', 0
		LTRL32 byte ' ISIT', 0
		LTRL33 byte 'Error', 0
		LTRL34 byte 'Cycle from 1 to 5: ', 0
		LTRL35 byte ' ', 0
.data
		temp sdword ?
		buffer byte 256 dup(0)
		minres dword 0
		standstr dword ?
		maineights dword 0
		mainstr dword ?
		mainabc dword 0
		mainabcd dword 0
		standmh dword ?
		standmi dword ?
		standmiv dword ?
		standdsa dword ?
		standytr dword ?
		standasd dword 0
		standp dword 0
		standu dword 0
		standv dword 0
		standr dword 0
		standc dword ?
		stande dword 0
		standk dword 0
		standlen dword ?
		standnumb dword 0
		standremainde dword 0
		standresult dword 0
		standsdv dword 0
		standpoit dword ?
		standisit dword ?
		standpoi dword 0
		standisi dword 0
		standab dword 0
.code

;----------- min ------------
min PROC,
	minx : sdword, miny : sdword  
; --- save registers ---
push ebx
push edx
; ----------------------
mov edx, minx
cmp edx, miny

jg right1
jl wrong1
right1:
push minx

pop ebx
mov minres, ebx

jmp next1
wrong1:
push miny

pop ebx
mov minres, ebx

next1:
; --- restore registers ---
pop edx
pop ebx
; -------------------------
mov eax, minres
ret
min ENDP
;------------------------------


;----------- stand ------------
stand PROC,
	standa : dword, standb : dword  
; --- save registers ---
push ebx
push edx
; ----------------------

push standb
push standa
push offset buffer
call concat
mov standstr, eax
push offset newline
call outrad


push offset LTRL1
call outrad


push standstr
call outrad

push offset newline
call outrad

; --- restore registers ---
pop edx
pop ebx
; -------------------------
ret
stand ENDP
;------------------------------


;----------- MAIN ------------
main PROC
push LTRL2

pop ebx
mov maineights, ebx


push maineights
call outlich

push offset newline
call outrad


push offset LTRL3
call outrad

push offset newline
call outrad

push LTRL4

pop ebx
mov mainabc, ebx

push LTRL5

pop ebx
mov mainabcd, ebx


push offset LTRL6
call outrad


push mainabc
call outlich


push offset LTRL7
call outrad


push mainabcd
call outlich


push offset LTRL8
call outrad

mov edx, mainabc
cmp edx, mainabcd

jz right2
jg right2
jnz wrong2
right2:
mov standstr, offset LTRL9
jmp next2
wrong2:
mov standstr, offset LTRL10
next2:

push standstr
call outrad

push offset newline
call outrad


push offset LTRL3
call outrad

push offset newline
call outrad

mov standmh, offset LTRL11
mov standmi, offset LTRL12
mov standmiv, offset LTRL13

push standmh
call outrad


push standmi
call outrad


push standmiv
call outrad

push offset newline
call outrad


push offset LTRL3
call outrad

push offset newline
call outrad

mov standdsa, offset LTRL10
mov standytr, offset LTRL10

push offset LTRL14
call outrad


push standytr
push standdsa
push offset buffer
call compare
push eax

pop ebx
mov standasd, ebx

mov edx, standasd
cmp edx, LTRL15

jz right3
jnz wrong3
right3:

push offset LTRL16
call outrad

jmp next3
wrong3:

push offset LTRL17
call outrad

next3:
push offset newline
call outrad


push offset LTRL3
call outrad

push offset newline
call outrad


push offset LTRL18
call outrad

push LTRL19

pop ebx
mov standp, ebx


push standp
push LTRL4
push offset buffer
call poww
push eax

pop ebx
mov standp, ebx


push standp
call outlich

push offset newline
call outrad


push offset LTRL3
call outrad

push offset newline
call outrad

push LTRL4

pop ebx
mov standu, ebx

push LTRL20

pop ebx
mov standv, ebx


push offset LTRL21
call outrad

push standu
push standv
push LTRL4
pop ebx
pop eax
imul eax, ebx
push eax
pop ebx
pop eax
add eax, ebx
push eax
push LTRL5
push LTRL5
pop ebx
pop eax
add eax, ebx
push eax
push LTRL4
pop ebx
pop eax
cdq
idiv ebx
push eax
pop ebx
pop eax
sub eax, ebx
jnc bk
neg eax
bk: 
push eax

push LTRL19
push LTRL22
call min
push eax
pop ebx
pop eax
add eax, ebx
push eax

pop ebx
mov standr, ebx


push standr
call outlich

push offset newline
call outrad


push offset LTRL3
call outrad

push offset newline
call outrad

mov standc, offset LTRL23

push offset LTRL24
call outrad


push standc
push offset buffer
call atoii
push eax

pop ebx
mov stande, ebx


push stande
call outlich

push offset newline
call outrad


push offset LTRL3
call outrad

push offset newline
call outrad

mov standlen, offset LTRL25

push standlen
push offset buffer
call slength
push eax

pop ebx
mov standk, ebx


push offset LTRL26
call outrad


push standk
call outlich

push offset newline
call outrad


push offset LTRL3
call outrad

push offset newline
call outrad

push LTRL27

pop ebx
mov standnumb, ebx

push standnumb
push LTRL28
pop ebx
pop eax
cdq
mov edx,0
idiv ebx
push edx

pop ebx
mov standremainde, ebx


push offset LTRL29
call outrad


push standremainde
call outlich

push offset newline
call outrad


push offset LTRL3
call outrad

push offset newline
call outrad

push LTRL4

pop ebx
mov standsdv, ebx

push standsdv
push LTRL5
pop ebx 
pop eax 
mov cl, bl 
shl eax, cl
push eax

pop ebx
mov standresult, ebx


push offset LTRL30
call outrad


push standresult
call outlich

push offset newline
call outrad


push offset LTRL3
call outrad

push offset newline
call outrad

mov standpoit, offset LTRL31
mov standisit, offset LTRL32
push LTRL5

pop ebx
mov standpoi, ebx

push LTRL5

pop ebx
mov standisi, ebx

mov edx, standpoi
cmp edx, standisi

jz right4
jl right4
jnz wrong4
right4:

push standisit
push standpoit
call stand

jmp next4
wrong4:

push offset LTRL33
call outrad

next4:

push offset LTRL3
call outrad

push offset newline
call outrad

push LTRL15

pop ebx
mov standab, ebx


push offset LTRL34
call outrad

mov edx, standab
cmp edx, LTRL22

jnz cycle5
jmp cyclenext5
cycle5:

push standab
call outlich


push offset LTRL35
call outrad

push standab
push LTRL15
pop ebx
pop eax
add eax, ebx
push eax

pop ebx
mov standab, ebx

mov edx, standab
cmp edx, LTRL22

jnz cycle5
cyclenext5:

push standab
call outlich

push offset newline
call outrad

push 0
call ExitProcess
main ENDP
end main
