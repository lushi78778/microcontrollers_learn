			ORG 0000H
			LJMP START
			ORG 0030H
	START:  MOV  A, #0FEH
	OUTPIT: MOV P1,A
			END