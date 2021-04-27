;计数器实验
		   ORG 0000H		;定义程序的起始地址
		   LJMP START		;做跳转到0003H
		   ORG 0030H		;开始地址
START:     MOV TMOD,#50H	;让定时计数器T1工作在计数方式 0101，0001
           MOV TH1,#0		;TH1从零开始计数
		   MOV TL1,#0		;TL1从零开始计数
		   SETB TR1			;打开定时计数器
	LOOP:  MOV P1,TL1		;等待中断计数, (TL1 0~255 进位是给TH1)
	       AJMP LOOP		;一直循环
		   END					   `