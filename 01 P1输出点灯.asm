			;P1������
			ORG 0000H
			LJMP START
			ORG 0030H
	START:  MOV  A, #0FEH   ;1111 1110 �߸�����һ����
	OUTPIT: MOV P1,A		;P1.0���
			END