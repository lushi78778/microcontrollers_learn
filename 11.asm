                ORG  0000H
	            LJMP START
	            ORG  0030H
    START:	    ACALL KEY_SCAN
    KEY_SCAN:   MOV  P2, #0F0H                 ;行高列低，读行之前先置1
                MOV  A, P2                     ;读键盘状况
                CJNE A, #0F0H, KEY_CHECK	   ;判断有无按键按下
                AJMP  KEY_SCAN
    KEY_CHECK:  ACALL DELAY
                MOV  P2, #0F0H 
                MOV  A, P2
                CJNE A, #0F0H, KEY_GET         ;确实有键按下
                AJMP KEY_SCAN
    KEY_GET:    MOV  R2,#0FEH
		        MOV  R4,#00H
    KEY_GOON:   MOV  P2, R2
                MOV  A, P2
                JB   ACC.4,LINE2               ;按键在第二行
                MOV  A,#00H
                AJMP KEY_END
    LINE2:      JB   ACC.5, LINE3              ;按键在第三行
                MOV  A, #04H
                AJMP KEY_END
    LINE3:      JB   ACC.6, LINE4              ;按键在第四行
                MOV  A, #08H
                AJMP KEY_END
    LINE4:      JB   ACC.7, NEXT_COLUMN        ;按键在下一列
                MOV  A, #0CH
                AJMP KEY_END
    NEXT_COLUMN:INC R4                         ;换列加1
                MOV A, R2
                JNB ACC.3,KEY_CHECK
                RL A
                MOV R2, A
                AJMP KEY_GOON
    KEY_END:    ADD  A, R4
                ACALL DISPLAY
    KEY_RELEASE:MOV  P2,#0F0H                  ; 等键释放
                MOV  A, P2
                CJNE A,#0F0H , KEY_RELEASE
                ACALL DELAY
                MOV  P2,#0F0H                  ; 等键释放
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
