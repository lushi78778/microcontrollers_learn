                ;定时器试验
                TICK       EQU  10000      ;10000的二进制为 10011100010000，十六进制为2710   tick = 10000
                T100uS     EQU  256-100    ;T100uS = 256-100 
                C100uS     EQU  30H        ;*C100uS = 30H    
                LED       BIT   P1.0	   ;P1.0是LED
                ORG       0000H			   
                LJMP      START            ;跳转到开始    
                ORG       000BH               
                LJMP      T0INT                
                ORG       0030H
        T0INT:  PUSH   PSW                 ;保护程序状态字    
                MOV    A, C100uS+1         ;将31H里面数给A，即10000的低8位给A
                JNZ    GOON		   ;判断是不是0，不是0->goon
                DEC    C100uS                 
        GOON: 
                DEC    C100uS+1	           ;将31H里面数减1，即10000的低8位减1
                MOV    A, C100uS           ;将30H里面数给A
                ORL    A, C100uS+1         ;10000高8位和低8位取或，判断是否计数到10000了
                JNZ    EXIT                
                MOV   C100uS, #HIGH(TICK)  
                MOV   C100uS+1, #LOW(TICK)
                CPL   LED             
        EXIT:
                POP   PSW
                RETI
        START:
                MOV    TMOD, #02H          ;工作方式寄存器，T0工作在方式二   
                MOV    TH0, #T100uS           
                MOV    TL0, #T100uS
                MOV    IE, #10000010B      ;中断，看书  
                SETB   TR0                 ;定时计数器打开计时   
                CLR    LED				   ;clear 二极管
                MOV    C100uS, #HIGH(TICK) ;30H里面存放27H，10000的高8位
                MOV    C100uS+1, #LOW(TICK);31H里面存放10H ,10000的低8位
        LOOP:   AJMP   LOOP
                END 
