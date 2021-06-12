                ORG  0000H
	            LJMP START
	            ORG  0030H
    START:	    ACALL KEY_SCAN
    KEY_SCAN:   MOV  P2, #0F0H                 ;�и��еͣ�����֮ǰ����1
                MOV  A, P2                     ;������״��
                CJNE A, #0F0H, KEY_CHECK	   ;�ж����ް�������
                AJMP  KEY_SCAN
    KEY_CHECK:  ACALL DELAY
                MOV  P2, #0F0H 
                MOV  A, P2
                CJNE A, #0F0H, KEY_GET         ;ȷʵ�м�����
                AJMP KEY_SCAN
    KEY_GET:    MOV  R2,#0FEH
		        MOV  R4,#00H
    KEY_GOON:   MOV  P2, R2
                MOV  A, P2
                JB   ACC.4,LINE2               ;�����ڵڶ���
                MOV  A,#00H
                AJMP KEY_END
    LINE2:      JB   ACC.5, LINE3              ;�����ڵ�����
                MOV  A, #04H
                AJMP KEY_END
    LINE3:      JB   ACC.6, LINE4              ;�����ڵ�����
                MOV  A, #08H
                AJMP KEY_END
    LINE4:      JB   ACC.7, NEXT_COLUMN        ;��������һ��
                MOV  A, #0CH
                AJMP KEY_END
    NEXT_COLUMN:INC R4                         ;���м�1
                MOV A, R2
                JNB ACC.3,KEY_CHECK
                RL A
                MOV R2, A
                AJMP KEY_GOON
    KEY_END:    ADD  A, R4
                ACALL DISPLAY
    KEY_RELEASE:MOV  P2,#0F0H                  ; �ȼ��ͷ�
                MOV  A, P2
                CJNE A,#0F0H , KEY_RELEASE
                ACALL DELAY
                MOV  P2,#0F0H                  ; �ȼ��ͷ�
                MOV  A, P2
                CJNE A,#0F0H , KEY_RELEASE
                RET
    DISPLAY:    MOV   DPTR,#TAB
                MOVC  A,   @A+DPTR
                MOV   P0, A
                RET
    TAB:        DB 0C0H,0F9H,0A4H,0B0H,99H,92H,82H,0F8H
                DB 80H,90H,88H,83H,0C6H,0A1H,86H,8EH
    DELAY:      MOV    R4, #02H
    AA1:        MOV    R5,#0F8H
    AA:         DJNZ   R5,AA
                DJNZ   R4,AA1
                RET
	            END
