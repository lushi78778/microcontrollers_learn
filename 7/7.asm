;������ʵ��
		   ORG 0000H		;����������ʼ��ַ
		   LJMP START		;����ת��0003H
		   ORG 0030H		;��ʼ��ַ
START:     MOV TMOD,#50H	;�ö�ʱ������T1�����ڼ�����ʽ 0101��0001
           MOV TH1,#0		;TH1���㿪ʼ����
		   MOV TL1,#0		;TL1���㿪ʼ����
		   SETB TR1			;�򿪶�ʱ������
	LOOP:  MOV P1,TL1		;�ȴ��жϼ���, (TL1 0~255 ��λ�Ǹ�TH1)
	       AJMP LOOP		;һֱѭ��
		   END					   `