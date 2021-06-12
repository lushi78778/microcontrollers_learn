			RELAY BIT P1.0
			LED BIT P1.1
			ORG 0000H
			LJMP START
			ORG 0030H
	START:  CLR RELAY			;清空
			SETB LED			;置一，点亮
			ACALL DELAY			;jump DELAY
			SETB RELAY			;P1拉高
			CLR LED				;灭灯
			ACALL DELAY			;jump DELAY
			AJMP START
	DELAY:  MOV R5,#0
			MOV R6,#0
			MOV R7,#0
	DLOOP:  DJNZ R7,DLOOP
			DJNZ R6,DLOOP
			DJNZ R5,DLOOP
			RET
			END
