                ;��ʱ������
                TICK       EQU  10000      ;10000�Ķ�����Ϊ 10011100010000��ʮ������Ϊ2710   tick = 10000
                T100uS     EQU  256-100    ;T100uS = 256-100 
                C100uS     EQU  30H        ;*C100uS = 30H    
                LED       BIT   P1.0	   ;P1.0��LED
                ORG       0000H			   
                LJMP      START            ;��ת����ʼ    
                ORG       000BH               
                LJMP      T0INT                
                ORG       0030H
        T0INT:  PUSH   PSW                 ;��������״̬��    
                MOV    A, C100uS+1         ;��31H��������A����10000�ĵ�8λ��A
                JNZ    GOON		   ;�ж��ǲ���0������0->goon
                DEC    C100uS                 
        GOON: 
                DEC    C100uS+1	           ;��31H��������1����10000�ĵ�8λ��1
                MOV    A, C100uS           ;��30H��������A
                ORL    A, C100uS+1         ;10000��8λ�͵�8λȡ���ж��Ƿ������10000��
                JNZ    EXIT                
                MOV   C100uS, #HIGH(TICK)  
                MOV   C100uS+1, #LOW(TICK)
                CPL   LED             
        EXIT:
                POP   PSW
                RETI
        START:
                MOV    TMOD, #02H          ;������ʽ�Ĵ�����T0�����ڷ�ʽ��   
                MOV    TH0, #T100uS           
                MOV    TL0, #T100uS
                MOV    IE, #10000010B      ;�жϣ�����  
                SETB   TR0                 ;��ʱ�������򿪼�ʱ   
                CLR    LED				   ;clear ������
                MOV    C100uS, #HIGH(TICK) ;30H������27H��10000�ĸ�8λ
                MOV    C100uS+1, #LOW(TICK);31H������10H ,10000�ĵ�8λ
        LOOP:   AJMP   LOOP
                END 
