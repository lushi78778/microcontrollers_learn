;1����ˮ��ʵ�飨˳����ˮ�ƣ�
            ORG 0000H
            LJMP MAIN
            ORG 0100H
    MAIN:
            MOV A,#0FEH    ;������A��#7FH��
            MOV R2,#8
    LOOP1:  MOV P2,A
            LCALL DELIS
            RL A           ;������RR A��
            DJNZ R2,LOOP1
            RET
;2����������ʵ��
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
;3��������ʵ�飨��ʽ1��10״̬��ת��
;4����ʱʵ�飨��ʱ��0����ʽ1��
            000BH
            LJMP TIM0
            ORG 0100H
    MAIN:
            MOV SP,#30H
            MOV IP,#02H
            MOV IE,#82H
            MOV TMOD,#01H
            MOV TH0,#01H
            MOV TL0,            ;��5536ת����16���ƣ�
            MOV R7,#10
            SETB TR0
            SJMP $
    TIM0:   DJNZ R7,ABC
            MOV R7,#10
    ABC:    Cpl P1.0
            RETI
;5���ⲿ�ж�ʵ��
            ORG 0000H
            LJMP MAIN
            ORG 0013H
            LJMP KEY
        MAIN:
            MOV SP,#60H
            MOV IP,#04H
            CLR IT0
            CLR IT1
            MOV IE,#84H     ; ��10000100��
            MOV A,#0
            mov r2��#10
        KEY:
            INC A
            DJNZ R2,LOOP
            MOV A,#0
            Cpl P1.0
            mov r2��#10
            LOOP:
            RETI


