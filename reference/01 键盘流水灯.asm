				;�ö�������(������I/O�ڷ���)��Ϊ���ж�0����P2��8λLEDѭ������
				ORG 0000H
				LJMP START
				ORG 0030H
	START:  	MOV A,#01H			            ;0000 0001
				MOV R7,#8			            ;1000
                PUSH ACC
                AJMP KEY_SCAN
    KEY_SCAN:   MOV  P2, #0F0H                 ;�и��еͣ�����֮ǰ����1
                MOV  A, P2                     ;������״��
                CJNE A, #0F0H, KEY_CHECK	   ;�ж����ް�������
                
                AJMP  KEY_SCAN
    KEY_CHECK:  ACALL DELAY
                MOV  P2, #0F0H                 ;1111 0000
                MOV  A, P2
                CJNE A, #0F0H, KEY_GET         ;ȷʵ�м�����
                AJMP KEY_SCAN
    KEY_GET:    MOV  R2,#0FEH                  ;1111 1110
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
                LJMP OUTPUT
	OUTPUT:		POP ACC
                MOV P0,A			;���
				RL A				;ѭ������
                PUSH ACC
				ACALL DELAY			;��ת�����DELAY��ִ��
                DJNZ R7,KEY_SCAN	;Rn�е�������1�����жϽ���Ƿ�Ϊ��0������Ϊ��0���������תOUTPUT
									;Ϊ��0���Ͳ�ת�ƣ�����ִ����һ��ָ�
				LJMP START  	    ;��ת��ʼ��		
    DELAY:      MOV R4,#02H         ;0000 0010
    AA1:        MOV R5,#0F8H        ;1111 1000
    AA:         DJNZ R5,AA  
                DJNZ R4,AA1
                RET
                END