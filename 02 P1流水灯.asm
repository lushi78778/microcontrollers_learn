				;��P1��������ڣ���д����ʹ��������ܴ��ҵ�������ѭ��������
				ORG 0000H
				LJMP START
				ORG 0030H
	START:  	MOV A,#01H			;0000 0001
				MOV R2,#8			;1000
	OUTPUT:		MOV P1,A			;���
				RL A				;ѭ������
				ACALL DELAY			;��ת�����DELAY��ִ��
				DJNZ R2,OUTPUT		;Rn�е�������1�����жϽ���Ƿ�Ϊ��0������Ϊ��0���������תOUTPUT
									;Ϊ��0���Ͳ�ת�ƣ�����ִ����һ��ָ�
				AJMP START			
	DELAY:  	MOV R6,#0			; ��ʱ
				MOV R7,#0
	DELAYLOOP: 	DJNZ R6,DELAYLOOP	; ��ʱ
				DJNZ R7,DELAYLOOP
				RET
				END