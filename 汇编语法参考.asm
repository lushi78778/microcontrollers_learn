    ;1.�ڲ����ݴ���
    MOV  A��Rn              ; A����Rn��
    MOV  A, direct          ; A����direct��       
    MOV  A��@Ri ��          ; A�� ((Ri))             
    MOV  A��#data           ; A��#data 
    MOV  Rn��A              ;  Rn����A��           
    MOV  Rn��direct         ;  Rn����direct��    
    MOV  Rn��#data          ;  Rn��# data          
    MOV   direct��A         ;direct ����A��
    MOV   direct��Rn        ;direct ����Rn��
    MOV   direct��@Ri       ;direct ��((Ri))
    MOV  direct1��direct2   ;direct1��(direct2)
    MOV   direct��#data     ;direct��#data
    MOV   @Ri,   A          ; ( Ri) ��( A)           
    MOV   @Ri,   direct     ; ( Ri) ��( direct) 
    MOV   @Ri,   #data      ; ( Ri) ��data
    MOV  DPTR�� #data16     ;DPTR��#data16 
    ;2.Ƭ�����ݴ���
    MOVX   A  ����DPTR      ; A������DPTR����
    MOVX  ��DPTR �� A       ;��DPTR������A��
    MOVX  A�� @Ri           ;  A��((Ri))
    MOVX  @Ri ,  A          ; (Ri)��(A)
    ;3.���ʳ̴�
    MOVC A��@A+PC           ;PC����PC��+1 ;A������A��+��PC����
    MOVC A��@A+DPTR         ;A������A��+��DPTR����
    ;4.��������
    ADD  A�� Rn             ;A����A��+��Rn ��    
    ADD  A�� direct         ;A����A��+��direct�� 
    ADD  A�� @Ri            ;A����A��+(��Ri��) 
    ADD  A�� #data          ;A����A��+ data
    ADDC  A�� Rn            ;A����A��+��Rn ��+��CY��
    ADDC  A�� direct        ;A����A��+��direct��+��CY��
    ADDC  A�� @Ri           ;A����A��+(��Ri��)+ ��CY��
    ADDC  A�� #data         ;A����A��+ data+��CY��
    INC  A                  ; A����A��+1
    INC  Rn                 ; Rn����Rn��+1
    INC  direct             ; direct����direct��+1
    INC  ��Ri               ;��Ri��������Ri����+1
    INC DPTR                ; DPTR����DPTR��+1
    SUBB A�� Rn             ;A����A���C��Rn���C��Cy��
    SUBB A�� direct         ;A����A���C��direct���C��Cy��
    SUBB A����Ri            ;A����A���C����Ri�����C��Cy��
    SUBB A��#data           ;A����A���C  data �C��Cy��
    DEC   A                 ; A��(A)-1
    DEC   Rn                ; Rn��(Rn)-1
    DEC  direct             ; direct��(direct)-1
    DEC  @Ri                ; (Ri) ��((Ri))-1
    MUL  AB                 ; BA��(A)��(B)
    DIV   AB                ;   A�̣�B�����A���£�B�� 
    ;5.�߼�����
    CLR  A                  ; A��00H 
    CPL  A                  ; A��(   ) 
    RL   A                  ;ѭ������
    RR A
    RLC A
    RRC A
    ANL  A��Rn              ;A����A���ģ�Rn��                  
    ANL  A��direct          ;A����A���ģ�direct ��
    ANL  A��@Ri             ;A����A���ģ���Ri����
    ANL   A��#data          ;A����A���� #data
    ANL  direct��A          ;direct ����direct ���ģ�A��
    ANL  direct��#data      ;direct ����direct ���� #data
    ORL  A��Rn              ;A����A���ţ�Rn��
    ORL  A��direct          ;A����A���ţ�direct ��
    ORL  A��@Ri             ;A����A���ţ���Ri����
    ORL   A��#data          ;A����A���� #data
    ORL  direct��A          ;direct ����direct ���ţ�A��
    ORL  direct��#data      ;direct ����direct ���� #data
    XRL  A��Rn              ;A����A������Rn��
    XRL  A��direct          ; A����A������direct ��
    XRL  A��@Ri             ;A����A��������Ri����
    XRL   A��#data          ;A����A���� #data
    XRL  direct��A          ;direct ����direct ������A ��
    XRL  direct��#data      ;direct ����direct ���� # data
    ;6.����ת��
    LJMP  addr16            ;PC��addr16           
    AJMP  addr11            ; PC��(PC)+2 
    SJMP   rel              ; PC��(PC)+2 + rel        
    JZ  rel                 ;����A��=0 ��PC��(PC)+2 + rel 
                            ;����A����0 ��PC��(PC)+2
    JNZ  rel                ;����A����0 ��PC��(PC)+2 + rel
                            ;����A��= 0 ��PC��(PC)+2
    CJNE  A, #data, rel     ;����A����data����PC����PC��+3+ rel
                            ;����A��=data����PC����PC��+3
    CJNE  A, direct, rel 	;����A���٣�direct������PC����PC��+3+rel 
                            ;����A��=��direct������PC����PC��+3
    CJNE  Rn, #data, rel 	;����Rn����data����PC����PC��+3+ rel 
                            ;����Rn��=data����PC����PC��+3
    CJNE  @Ri, #data, rel   ;������Ri������data����PC����PC��+3+ rel 
                            ;������Ri����=data����PC����PC��+3
    LCALL  addr16  		    ; PC��(PC)+3
                            ;SP��(SP)+1, (SP) ��(PC7��0)
                            ;SP��(SP)+1, (SP) ��(PC15��8) 
                            ;PC��addr16
    ACALL  addr11 	        ;  PC��(PC)+2 
                            ;  SP��(SP)+1, (SP) ��(PC7��0)
                            ;  SP��(SP)+1, (SP) ��(PC15��8)    
                            ;  PC10��0��addr11
    RET
    RETI
    ;7.λ����ָ��
    MOV  C,  bit            ; CY��(bit) 
    MOV  bit, C   ��        ; bit �� (CY) 
    CLR   C                 ;     CY��0         
    CLR    bit		        ;     bit ��0       
    SETB   C 		        ;     CY��1        
    SETB   bit 		        ;     bit ��1      
    ANL  C��bit             ;CY����CY���ģ�bit��
    ANL  C��/bit            ;CY����CY���ģ���
    ORL  C��bit             ;CY����CY���ţ�bit��
    ORL  C��/bit            ;CY����CY���ţ���
    CPL  C                  ;CY������
    CPL  bit                ;bit������
    JC   rel  		        ;����CY��=1�� �� PC��(PC)+2 + rel 
                            ;����CY��= 0�� �� PC��(PC)+2
    JNC   rel 		        ;����CY��= 0���� PC��(PC)+2 + rel
                            ;����CY��= 1�� �� PC��(PC)+2
    JB  bit ��rel           ;����bit��=1���� PC��(PC)+3 + rel
                            ;����bit��= 0���� PC��(PC)+3
    JNB  bit ��rel 	        ;����bit��= 0���� PC��(PC)+3 + rel
                            ;����bit��= 1���� PC��(PC)+3
    JBC  bit ��rel          ;����bit��=1���� PC��(PC)+3 + rel �ң�bit���� 0
                            ;����bit��= 0���� PC��(PC)+3
