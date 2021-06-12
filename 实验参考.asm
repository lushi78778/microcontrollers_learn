;1、流水灯实验（顺序流水灯）
            ORG 0000H
            LJMP MAIN
            ORG 0100H
    MAIN:
            MOV A,#0FEH    ;（逆序A，#7FH）
            MOV R2,#8
    LOOP1:  MOV P2,A
            LCALL DELIS
            RL A           ;（逆序RR A）
            DJNZ R2,LOOP1
            RET
;2、按键输入实验
            ORG 0000H
            LJMP MAIN
            ORG 0100H
    MAIN:
            JNB P3.0,KEY1
            JNB P3.1,KEY2
            JNB P3.2,KEY3
    KEY1:
            Cpl P1.0
    KEY2:
            CLR P1.0
    KEY3:
            SETB P1.0
;3、计数器实验（方式1，10状态翻转）
;4、定时实验（定时器0，方式1）
            000BH
            LJMP TIM0
            ORG 0100H
    MAIN:
            MOV SP,#30H
            MOV IP,#02H
            MOV IE,#82H
            MOV TMOD,#01H
            MOV TH0,#01H
            MOV TL0,            ;（5536转换成16进制）
            MOV R7,#10
            SETB TR0
            SJMP $
    TIM0:   DJNZ R7,ABC
            MOV R7,#10
    ABC:    Cpl P1.0
            RETI
;5、外部中断实验
            ORG 0000H
            LJMP MAIN
            ORG 0013H
            LJMP KEY
        MAIN:
            MOV SP,#60H
            MOV IP,#04H
            CLR IT0
            CLR IT1
            MOV IE,#84H     ; （10000100）
            MOV A,#0
            mov r2，#10
        KEY:
            INC A
            DJNZ R2,LOOP
            MOV A,#0
            Cpl P1.0
            mov r2，#10
            LOOP:
            RETI


