				;�ⲿ�ж�ʵ��
				LED BIT P1.0	  	;��P1.0�����֣����ķ�����ӹܣ�
				ORG 0000H		  	;����������ʼ��ַ
				LJMP START		  	;����ת��0003H
				ORG 0003H		  	;�ն���ڵ�ַ���ж� ��ʼ��ַ
				LJMP INTERRUPT	  	;��ת���������նϵ�ַ
				ORG 0030H		  	;������
	INTERRUPT:  PUSH PSW		  	;�жϣ�PSW��ջ{����PSW������״̬�֣�}
				CPL LED		  		;Ѱַλ��������ӹܣ�ȡ��
				POP PSW		  		;PSW��ջ
				RETI			  	;���жϳ����з���
	START:      CLR LED		  		;clear LED �������
				MOV TCON, #01H 		;�ⲿ�ж�0�½��ش���
				MOV IE,#81H	  		;IE��������ж�
	INITIONAL:  SETB P3.2	  		;P3.2���� 
				AJMP INITIONAL 		;P3.2���ָߵ�ƽ
				END