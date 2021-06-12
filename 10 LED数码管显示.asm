            DBUF   EQU  30H                      
            ORG    0000H
            LJMP   START
            ORG    0030H
    START:                     
            MOV   30H,  #8                       
            MOV   31H,  #0
            MOV   32H,  #5
            MOV   33H,  #1
            MOV   34H,  #2
            MOV   35H,  #0
            MOV   36H,  #2
            MOV   37H,  #0
    DISP0:  MOV   R0,  #DBUF                   
            MOV   R1,  #8
            MOV   R2,    #0               
            MOV   DPTR,  #SEGTAB           
    DP00:   MOV   A,  R2
            MOV   P1, A
            MOV   A,     @R0               
            MOVC  A,     @A+DPTR           
            MOV   P0,   A                
            ACALL  DELAY
            INC   R0
            INC   R2
            DJNZ  R1,    DP00
            SJMP  DISP0
    SEGTAB: DB 3fH,06H,5bH,4fH,66H
            DB 6dH,7dH,07H,7fH,6fH       
            DB 77H,7cH,39H,5eH,79H
    DELAY:                            
            MOV   R4,  #03H                 
    AA1:    MOV   R5,  #0FFH
    AA:     DJNZ  R5,  AA
            DJNZ  R4,  AA1
            RET
            END
