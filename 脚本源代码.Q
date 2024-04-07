// 此脚本代码由烟汐忆梦_YM重构 免费开放使用
Global openAutoJumpTurn // 记录是否打开自动开始
openAutoJumpTurn = false
UserVar timeWait = 140 "点击延迟速度"
UserVar loadingWait = 10 "黑屏加载等待延迟时间"
Global quickClickWait // 快速点击延迟速度(优化点击用)
quickClickWait = timeWait * 0.65 // 计算优化延迟

Rem 起始点

MoveTo 560, 655//点开始
Delay timeWait
LeftClick 1
Delay timeWait
// 进入选关页面

MoveTo 380, 685 //先点一下"新手页面"重置页面类信息
Delay quickClickWait
LeftClick 1
Delay quickClickWait
MoveTo 891, 686 //点两下"专家" 切换到"黑暗城堡所在的页面" (专家二号页)
Delay quickClickWait
LeftClick 1
Delay quickClickWait
LeftClick 1
Delay timeWait

MoveTo 365, 400 //点黑暗城堡
Delay timeWait
LeftClick 1
Delay timeWait
MoveTo 410, 300 //点简单
Delay quickClickWait
LeftClick 1
Delay timeWait
MoveTo 860, 330 //点放气
Delay quickClickWait
LeftClick 1
Delay 200

FindColor 325, 240, 945, 335, "00E871", hasSavePosx, hasSavePosy
If hasSavePosx > 0 And hasSavePosy > 0 Then 
	// 判断是否出了覆盖存档提示
	// 如果是 去点击OK覆盖
	Delay 150
	MoveTo 757, 524 //点OK
	Delay 40
	LeftClick 1
	Delay timeWait
End If

// 等待加载
MoveTo 650, 530
Delay 300
Rem 加载时判断屏幕颜色为黑色
IfColor 485,450,"000000",0 Then // 加载时 检测屏幕点 如果为黑色 就等待 
    //颜色一样 ： 等待
    Delay 310
    Goto 加载时判断屏幕颜色为黑色
End If
Delay (450 + loadingWait)

Rem 检测弹窗弹出正常
IfColor 635, 460, "D5915C", 2 Then
	MoveTo 650, 530
	Delay quickClickWait
	LeftClick 1// 放气模式提示消除 : 点ok
	Delay timeWait
Else 
	Goto 检测弹窗弹出正常
End If
Delay 800

// =-=-=-= 游戏开始 =-=-=-=

If openAutoJumpTurn = false Then
	// 判断自动开始是否打开	
	MoveTo 1063, 65
	Delay quickClickWait
	LeftClick 1 // 打开设置检测
	Delay 150
	IfColor 735, 190, "00EB77", 2 Then// 加载时 检测屏幕点 近似等于绿色 就说明已经启用 
		Delay quickClickWait
	Else 
		MoveTo 735, 190
		Delay quickClickWait
		LeftClick 1 // 打开自动开始
	openAutoJumpTurn = true
	KeyPress "Esc", 1
	Delay 150
	End If
End If

KeyPress "K", 1//放置猴村
MoveTo 660, 240
Delay 40
LeftClick 1
Delay timeWait
LeftClick 1
Delay timeWait
KeyPress "/", 1// 001升级
Delay timeWait
KeyPress "/", 1// 001升级
Delay timeWait 
KeyPress "K", 1// 放置猴村
MoveTo 580, 240
Delay quickClickWait
LeftClick 1
Delay timeWait
LeftClick 1
Delay timeWait
KeyPress ",", 1//100升级
Delay timeWait
KeyPress "/", 1//001升级
Delay timeWait
KeyPress "/", 1//001升级
Delay timeWait

KeyPress "A", 1 // 法师猴
MoveTo 550, 325
Delay quickClickWait
LeftClick 1
Delay timeWait
LeftClick 1
Delay timeWait
KeyPress ".", 1 // 法师010升级
Delay timeWait
KeyPress ".", 1 // 法师010升级
Delay timeWait
KeyPress "/", 1 // 法师001升级
Delay timeWait
KeyPress "/", 1 // 法师001升级
Delay timeWait
KeyPress "/", 1 // 法师001升级
Delay timeWait

// 有了攻击猴 点击开始回合 优化时间
MoveTo 1222, 713
Delay quickClickWait
LeftClick 1
Delay quickClickWait


KeyPress "U", 1 // 放置英雄
MoveTo 610, 325
Delay timeWait
LeftClick 1
Delay timeWait

// 加速游戏
MoveTo 1222, 713
Delay quickClickWait
LeftClick 1
Delay quickClickWait 

KeyPress "F", 1 // 放置炼金猴子
MoveTo 675, 325
Delay quickClickWait
LeftClick 1
Delay timeWait
LeftClick 1
Delay timeWait
KeyPress ",", 1//100升级
Delay timeWait
KeyPress ",", 1//100升级
Delay timeWait
KeyPress ",", 1//100升级
Delay timeWait
KeyPress ",", 1//100升级
Delay timeWait
KeyPress "/", 1//001升级
Delay timeWait

KeyPress "X", 1 // 放置潜水艇1
MoveTo 740, 310
Delay quickClickWait
LeftClick 1
Delay timeWait
LeftClick 1
Delay timeWait
KeyPress ",", 1//100升级
Delay timeWait
KeyPress ",", 1//100升级
Delay timeWait
KeyPress "/", 1//001升级
Delay timeWait
KeyPress "/", 1//001升级
Delay timeWait
KeyPress "/", 1//001升级
Delay timeWait

KeyPress "X", 1 // 放置潜水艇2
MoveTo 740, 260
Delay quickClickWait
LeftClick 1
Delay timeWait
LeftClick 1
Delay timeWait
KeyPress ",", 1//100升级
Delay timeWait
KeyPress ",", 1//100升级
Delay timeWait
KeyPress "/", 1//001升级
Delay timeWait
KeyPress "/", 1//001升级
Delay timeWait
KeyPress "/", 1//001升级
Delay timeWait

// 出售猴村1
MoveTo 680, 240
Delay quickClickWait
LeftClick 1
Delay timeWait
KeyPress "BackSpace", 1
Delay quickClickWait
// 出售猴村2
MoveTo 575, 240
Delay quickClickWait
LeftClick 1
Delay timeWait
KeyPress "BackSpace", 1
Delay quickClickWait

// 升级潜水艇
MoveTo 750, 315
Delay quickClickWait
LeftClick 1
Delay timeWait
KeyPress "/", 1//001升级
Delay timeWait
MoveTo 750, 260
Delay quickClickWait
LeftClick 1
Delay timeWait
KeyPress "/", 1//001升级
Delay timeWait
MoveTo 490, 630
Delay quickClickWait
LeftClick 1
Delay timeWait

// 可自定义部分 =-=-= 可攒经验之类的

KeyPress "Q", 1//开视野飞镖
Delay timeWait
MoveTo 340, 550
Delay quickClickWait
LeftClick 1
Delay timeWait
LeftClick 1
Delay timeWait
KeyPress "/", 1//001升级
Delay timeWait
KeyPress "/", 1//001升级
Delay timeWait

KeyPress "Q", 1//开视野飞镖
Delay timeWait
MoveTo 340, 265
Delay quickClickWait
LeftClick 1
Delay timeWait
LeftClick 1
Delay timeWait
KeyPress "/", 1//001升级
Delay timeWait
KeyPress "/", 1//001升级
Delay timeWait

// ↓ 在这里可自定义刷什么猴子的经验 ↓

// ...

// ↑ 在这里可自定义刷什么猴子的经验 ↑

KeyPress "Esc", 1
MoveTo 635, 640

// =-=-=-= 完成布阵 =-=-=-=

Rem 判断游戏是否结束
FindColor 5,30,55,120,"20262D",intX,intY
If intX > 0 And intY > 0 Then 
	// 获胜
    Delay 350
	MoveTo 635, 640
    Delay quickClickWait
	LeftClick 1
    Delay 350
	MoveTo 480, 600
    Delay quickClickWait
    LeftClick 1
	Delay 300
Else 
	FindColor 0, 30, 60, 100, "26323D", upgradePosx, upgradePosy
	If upgradePosx > 0 And upgradePosy > 0 Then 
		Delay 55
		MoveTo 635, 640
		Delay 300
		LeftClick 1
		Delay quickClickWait
		LeftClick 1
		// 这里判断是否突然升级 ：点两下取消升级页面
	End If
	Delay 400
	Goto 判断游戏是否结束
End If

Rem 获胜返回主页加载时判断屏幕颜色为黑色
IfColor 485,450,"000000",0 Then // 加载时 检测屏幕点 如果为黑色 就等待 
    //颜色一样 ： 等待
    Delay 310
    Goto 获胜返回主页加载时判断屏幕颜色为黑色
End If
Delay (420 + loadingWait)
// 重复
Goto 起始点
// 此脚本代码由烟汐忆梦_YM重构 免费开放使用
// BiliBili主页 https://space.bilibili.com/481430814?spm_id_from=333.788.0.0
