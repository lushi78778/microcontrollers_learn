    ;1.内部数据传送
    MOV  A，Rn              ; A←（Rn）
    MOV  A, direct          ; A←（direct）       
    MOV  A，@Ri 　          ; A← ((Ri))             
    MOV  A，#data           ; A←#data 
    MOV  Rn，A              ;  Rn←（A）           
    MOV  Rn，direct         ;  Rn←（direct）    
    MOV  Rn，#data          ;  Rn←# data          
    MOV   direct，A         ;direct ←（A）
    MOV   direct，Rn        ;direct ←（Rn）
    MOV   direct，@Ri       ;direct ←((Ri))
    MOV  direct1，direct2   ;direct1←(direct2)
    MOV   direct，#data     ;direct←#data
    MOV   @Ri,   A          ; ( Ri) ←( A)           
    MOV   @Ri,   direct     ; ( Ri) ←( direct) 
    MOV   @Ri,   #data      ; ( Ri) ←data
    MOV  DPTR， #data16     ;DPTR←#data16 
    ;2.片外数据传送
    MOVX   A  ，＠DPTR      ; A←（（DPTR））
    MOVX  ＠DPTR ， A       ;（DPTR）←（A）
    MOVX  A， @Ri           ;  A←((Ri))
    MOVX  @Ri ,  A          ; (Ri)←(A)
    ;3.访问程存
    MOVC A，@A+PC           ;PC←（PC）+1 ;A←（（A）+（PC））
    MOVC A，@A+DPTR         ;A←（（A）+（DPTR））
    ;4.算术运算
    ADD  A， Rn             ;A←（A）+（Rn ）    
    ADD  A， direct         ;A←（A）+（direct） 
    ADD  A， @Ri            ;A←（A）+(（Ri）) 
    ADD  A， #data          ;A←（A）+ data
    ADDC  A， Rn            ;A←（A）+（Rn ）+（CY）
    ADDC  A， direct        ;A←（A）+（direct）+（CY）
    ADDC  A， @Ri           ;A←（A）+(（Ri）)+ （CY）
    ADDC  A， #data         ;A←（A）+ data+（CY）
    INC  A                  ; A←（A）+1
    INC  Rn                 ; Rn←（Rn）+1
    INC  direct             ; direct←（direct）+1
    INC  ＠Ri               ;（Ri）←（（Ri））+1
    INC DPTR                ; DPTR←（DPTR）+1
    SUBB A， Rn             ;A←（A）–（Rn）–（Cy）
    SUBB A， direct         ;A←（A）–（direct）–（Cy）
    SUBB A，＠Ri            ;A←（A）–（（Ri））–（Cy）
    SUBB A，#data           ;A←（A）–  data –（Cy）
    DEC   A                 ; A←(A)-1
    DEC   Rn                ; Rn←(Rn)-1
    DEC  direct             ; direct←(direct)-1
    DEC  @Ri                ; (Ri) ←((Ri))-1
    MUL  AB                 ; BA←(A)×(B)
    DIV   AB                ;   A商，B余←（A）÷（B） 
    ;5.逻辑运算
    CLR  A                  ; A←00H 
    CPL  A                  ; A←(   ) 
    RL   A                  ;循环左移
    RR A
    RLC A
    RRC A
    ANL  A，Rn              ;A←（A）∧（Rn）                  
    ANL  A，direct          ;A←（A）∧（direct ）
    ANL  A，@Ri             ;A←（A）∧（（Ri））
    ANL   A，#data          ;A←（A）∧ #data
    ANL  direct，A          ;direct ←（direct ）∧（A）
    ANL  direct，#data      ;direct ←（direct ）∧ #data
    ORL  A，Rn              ;A←（A）∨（Rn）
    ORL  A，direct          ;A←（A）∨（direct ）
    ORL  A，@Ri             ;A←（A）∨（（Ri））
    ORL   A，#data          ;A←（A）∨ #data
    ORL  direct，A          ;direct ←（direct ）∨（A）
    ORL  direct，#data      ;direct ←（direct ）∨ #data
    XRL  A，Rn              ;A←（A）⊕（Rn）
    XRL  A，direct          ; A←（A）⊕（direct ）
    XRL  A，@Ri             ;A←（A）⊕（（Ri））
    XRL   A，#data          ;A←（A）⊕ #data
    XRL  direct，A          ;direct ←（direct ）⊕（A ）
    XRL  direct，#data      ;direct ←（direct ）⊕ # data
    ;6.控制转移
    LJMP  addr16            ;PC←addr16           
    AJMP  addr11            ; PC←(PC)+2 
    SJMP   rel              ; PC←(PC)+2 + rel        
    JZ  rel                 ;若（A）=0 则PC←(PC)+2 + rel 
                            ;若（A）≠0 则PC←(PC)+2
    JNZ  rel                ;若（A）≠0 则PC←(PC)+2 + rel
                            ;若（A）= 0 则PC←(PC)+2
    CJNE  A, #data, rel     ;若（A）≠data，则PC←（PC）+3+ rel
                            ;若（A）=data，则PC←（PC）+3
    CJNE  A, direct, rel 	;若（A）≠（direct），则PC←（PC）+3+rel 
                            ;若（A）=（direct），则PC←（PC）+3
    CJNE  Rn, #data, rel 	;若（Rn）≠data，则PC←（PC）+3+ rel 
                            ;若（Rn）=data，则PC←（PC）+3
    CJNE  @Ri, #data, rel   ;若（（Ri））≠data，则PC←（PC）+3+ rel 
                            ;若（（Ri））=data，则PC←（PC）+3
    LCALL  addr16  		    ; PC←(PC)+3
                            ;SP←(SP)+1, (SP) ←(PC7～0)
                            ;SP←(SP)+1, (SP) ←(PC15～8) 
                            ;PC←addr16
    ACALL  addr11 	        ;  PC←(PC)+2 
                            ;  SP←(SP)+1, (SP) ←(PC7～0)
                            ;  SP←(SP)+1, (SP) ←(PC15～8)    
                            ;  PC10～0←addr11
    RET
    RETI
    ;7.位操作指令
    MOV  C,  bit            ; CY←(bit) 
    MOV  bit, C   　        ; bit ← (CY) 
    CLR   C                 ;     CY←0         
    CLR    bit		        ;     bit ←0       
    SETB   C 		        ;     CY←1        
    SETB   bit 		        ;     bit ←1      
    ANL  C，bit             ;CY←（CY）∧（bit）
    ANL  C，/bit            ;CY←（CY）∧（）
    ORL  C，bit             ;CY←（CY）∨（bit）
    ORL  C，/bit            ;CY←（CY）∨（）
    CPL  C                  ;CY←（）
    CPL  bit                ;bit←（）
    JC   rel  		        ;若（CY）=1， 则 PC←(PC)+2 + rel 
                            ;若（CY）= 0， 则 PC←(PC)+2
    JNC   rel 		        ;若（CY）= 0，则 PC←(PC)+2 + rel
                            ;若（CY）= 1， 则 PC←(PC)+2
    JB  bit ，rel           ;若（bit）=1，则 PC←(PC)+3 + rel
                            ;若（bit）= 0，则 PC←(PC)+3
    JNB  bit ，rel 	        ;若（bit）= 0，则 PC←(PC)+3 + rel
                            ;若（bit）= 1，则 PC←(PC)+3
    JBC  bit ，rel          ;若（bit）=1，则 PC←(PC)+3 + rel 且（bit）← 0
                            ;若（bit）= 0，则 PC←(PC)+3
