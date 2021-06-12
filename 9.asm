            DBUF0  EQU    30H                   
            ORG    0000H
            LJMP   START
            ORG    0030H
    START:
            MOV    30H,    #8                  
            MOV    31H,    #9
            MOV    32H,    #0Ch
            MOV    33H,    #5
            MOV    34H,    #1
    DISP: 
            MOV    R0,     #DBUF0  
            MOV    R2,     #5                      
    DP10: 
            MOV    DPTR,   #SEGTAB                      
            MOV    A,      @R0
            MOVC   A,      @A+DPTR              
            MOV    P0,    A
            ACALL DELAY
            INC    R0
            DJNZ   R2,     DP10
            SJMP   DISP
    SEGTAB: DB 0C0H,0F9H,0A4H,0B0H,99H,92H        
            DB 82H,0F8H,80H,90H,88H,83H      
            DB 0C6H,0A1H,86H,8EH,0FFH,00H      
    DELAY:  MOV   R5,  #10                
            MOV   R6,  #0    
            MOV   R7,  #0    
    DLOOP:  DJNZ  R7,  DLOOP
            DJNZ  R6,  DLOOP
            DJNZ  R5,  DLOOP
            RET
            END
