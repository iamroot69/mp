.MODEL SMALL
.386
.STACK 100H

.DATA
ARRAY DB 12H,43H,5AH,35H,27H
MSG1 DB "FOUND AT $"
MSG2 DB "NOT FOUND $"

.CODE
MOV AX,@DATA
MOV DS,AX  ;LOADING INTO DATA SEGMENT


LEA BX,ARRAY ;BASE ADDRESS OF ARRAY
XOR SI,SI ;INDEX LIKE i
MOV CX,05H ;COUNT OF LOOP

SEARCH:
MOV AL, ARRAY[BX+SI]
CMP AL, 0H ;SEARCHING 0H
JE RESULT
INC SI
LOOP SEARCH
;if not found
LEA DX,MSG2
MOV AH, 09H
INT 21H
JMP STOP

RESULT:
MOV AH,09H
LEA DX,MSG1
INT 21H

MOV AL,5H
SUB AL,CL
AND AL,0FH
ADD AL,'0'
MOV DL,AL
MOV AH,02H
INT 21H

STOP:
MOV AH,4CH
INT 21H
END