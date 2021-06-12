				;外部中断实验
				LED BIT P1.0	  	;给P1.0起名字（连的发光二接管）
				ORG 0000H		  	;定义程序的起始地址
				LJMP START		  	;做跳转到0003H
				ORG 0003H		  	;终断入口地址，中断 开始地址
				LJMP INTERRUPT	  	;跳转到真正的终断地址
				ORG 0030H		  	;主程序
	INTERRUPT:  PUSH PSW		  	;中断，PSW入栈{保护PSW（程序状态字）}
				CPL LED		  		;寻址位（发光二接管）取反
				POP PSW		  		;PSW出栈
				RETI			  	;从中断程序中返回
	START:      CLR LED		  		;clear LED 让他灭灯
				MOV TCON, #01H 		;外部中断0下降沿触发
				MOV IE,#81H	  		;IE允许产生中断
	INITIONAL:  SETB P3.2	  		;P3.2拉高 
				AJMP INITIONAL 		;P3.2保持高电平
				END