				;用P1口做输出口，编写程序使发光二极管从右到左轮流循环点亮。
				ORG 0000H
				LJMP START
				ORG 0030H
	START:  	MOV A,#01H			;0000 0001
				MOV R2,#8			;1000
	OUTPUT:		MOV P1,A			;输出
				RL A				;循环左移
				ACALL DELAY			;跳转到标号DELAY处执行
				DJNZ R2,OUTPUT		;Rn中的数减“1”，判断结果是否为“0”，不为“0”程序就跳转OUTPUT
									;为“0”就不转移，继续执行下一条指令。
				AJMP START			
	DELAY:  	MOV R6,#0			; 延时
				MOV R7,#0
	DELAYLOOP: 	DJNZ R6,DELAYLOOP	; 延时
				DJNZ R7,DELAYLOOP
				RET
				END