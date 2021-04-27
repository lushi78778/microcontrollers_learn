			 ORG 0000H
			 LJMP START
			 ORG 0030H
START:       MOV R0,#00H
DISPLAY:     MOV P0,R0
             ACALL DELAY
			 INC R0
			 CJNE R0,#0FFH, DISPLAY
			 AJMP START

DELAY:       MOV R5,#02H
DEL1:        MOV R6,#0F0H
DEL2:        MOV R7,#0F0H
DEL3:        DJNZ R7,DEL3
             DJNZ R6, DEL2
			 DJNZ R5, DEL1
			 RET
			 END