				ORG 0000H
				LJMP START
				ORG 0030H
                AJMP INT
                ORG 0100H
    Start:      MOV IE,#81H
                MOV R3,#FEH
                AJMP $
    INT:        MOV P0,R3
                RR R3
    DELAY:      MOV R4,#02H         ;0000 0010
    AA1:        MOV R5,#0F8H        ;1111 1000
    AA:         DJNZ R5,AA  
                DJNZ R4,AA1
                RET
                END