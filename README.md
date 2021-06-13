# microcontrollers_learn

## 介绍

### 单片机试验罢了
```
proteus     对应的仿真文件
asm         汇编文件
reference   参考程序
```

### 实验题目如下:
<ol>
<li>假定用P1口做输出口，连接8个发光二极管，编写程序使发光二极管显示7亮1灭（高电平亮，低电平灭）</li>
<li>用P1口做输出口，编写程序使发光二极管从右到左轮流循环点亮。</li>
<li>用P0口做输出口，编写程序使发光二极管按照二进制加法的规则点亮。
</li>
<li>用P1.0作为控制输出口，接继电器电路，使继电器重复吸合与断开；用P1.1作为控制输出口，接发光二极管，使其当继电器吸合时点亮，当继电器断开时熄灭；观察P1口仿真情况，理解继电器重复延时吸合与延时断开。
</li>
<li>用P1.0作输入接独立按键，P1.1作输出接一个发光二极管，P1.2连接继电器。编写程序读取开关状态，并在发光二极管上显示出来，同时控制继电器状态变化。
</li>
<li>INT0端（P3.2）接单次脉冲发生器（利用Keil仿真模拟），即仿真窗口P3.2点击;假设P1.0接LED发光二极管，以查看信号反转;当点击P3.2时（从高到低），LED发光二极管状态改变，P1.0状态变化。
</li>
<li>点击仿真窗口P3.5,连续按动按键，观察仿真窗口P1口变化，显示按键次数。
</li>
<li>连接P1.0到LED发光二极管,使发光二极管隔一秒点亮一次，点亮时间为一秒。
</li>
<li>P0连接静态数码管的输入端，让静态数码管显示“80C51”
</li>
<li>P0 连接74HC573(需要接上拉电阻，P0没有内部上拉)，输出段码，控制要显示的字符;P1.0，P1.1，P1.2分别连接74HC138的A、B、C端，输出位码，控制那一片LED数码管被选中，让8个LED数码管显示“80512020”。
</li>
<li>将P2口和矩阵键盘连接，其中矩阵键盘从上到下四行分别对应P2.4-P2.7，从左至右分别对应P2.3-P2.0;将P0口和静态显示LED数码管连接（P0口需要接上拉电阻），设从上到下，从右至左的按键依次编号为0-F;实现对应按键按下，则led数码管显示相应的按键编号。
</li>
</ol>


### 参考程序
1.用独立键盘(可以用I/O口仿真)作为外中断0控制P0口8位LED循环点亮,即按下一次按键,点亮一个灯,再按下按键左移—位点亮,如此循环。按键按下为低电平接通。
延迟程序如下:

```asm
DELAY:      MOV R4,#02H         ;0000 0010
AA1:        MOV R5,#0F8H        ;1111 1000
AA:         DJNZ R5,AA  
            DJNZ R4,AA1
            RET
            END
```
2.用P1.0口作输出口,接LED发光二极管,编写程序,利用定时器T1工作方式1实现数码管以1秒间隔时间周期性的亮灭(晶振频率为12MHz),中断方式完成。T0在工作方式1下,50ms溢出一次时,高八位为3CH第八位为0BOH