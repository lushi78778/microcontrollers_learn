				;��P1��������ڣ���д����ʹ��������ܴ��ҵ�������ѭ��������
				ORG 0000H
				LJMP START
				ORG 0030H
	START:  	MOV A,#01H			;0000 0001
				MOV R2,#8			;1000
	OUTPUT:		MOV P1,A			;
				RL A
				ACALL DELAY
				DJNZ R2,OUTPUT
				AJMP START
	DELAY:  	MOV R6,#0
				MOV R7,#0
	DELAYLOOP: 	DJNZ R6,DELAYLOOP
				DJNZ R7,DELAYLOOP
				RET
				END