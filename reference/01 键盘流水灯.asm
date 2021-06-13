				;用独立键盘(可以用I/O口仿真)作为外中断0控制P2口8位LED循环点亮
				ORG 0000H
				LJMP START
				ORG 0030H
	START:  	MOV A,#01H			            ;0000 0001
				MOV R7,#8			            ;1000
                PUSH ACC
                AJMP KEY_SCAN
    KEY_SCAN:   MOV  P2, #0F0H                 ;行高列低，读行之前先置1
                MOV  A, P2                     ;读键盘状况
                CJNE A, #0F0H, KEY_CHECK	   ;判断有无按键按下
                
                AJMP  KEY_SCAN
    KEY_CHECK:  ACALL DELAY
                MOV  P2, #0F0H                 ;1111 0000
                MOV  A, P2
                CJNE A, #0F0H, KEY_GET         ;确实有键按下
                AJMP KEY_SCAN
    KEY_GET:    MOV  R2,#0FEH                  ;1111 1110
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
                LJMP OUTPUT
	OUTPUT:		POP ACC
                MOV P0,A			;输出
				RL A				;循环左移
                PUSH ACC
				ACALL DELAY			;跳转到标号DELAY处执行
                DJNZ R7,KEY_SCAN	;Rn中的数减“1”，判断结果是否为“0”，不为“0”程序就跳转OUTPUT
									;为“0”就不转移，继续执行下一条指令。
				LJMP START  	    ;跳转初始化		
    DELAY:      MOV R4,#02H         ;0000 0010
    AA1:        MOV R5,#0F8H        ;1111 1000
    AA:         DJNZ R5,AA  
                DJNZ R4,AA1
                RET
                END