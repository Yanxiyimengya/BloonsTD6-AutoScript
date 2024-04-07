// 此脚本代码由烟汐忆梦_YM重构 免费开放使用
Global openAutoJumpTurn // 记录是否打开自动开始
openAutoJumpTurn = false
UserVar timeWait = 140 "点击延迟速度"
UserVar loadingWait = 10 "黑屏加载等待延迟时间"
UserVar delayedStart = DropList{"开启":true |"关闭":false } = 1 "延迟开始（避免布阵时升级导致脚本失败）" 
Global quickClickWait // 快速点击延迟速度(优化点击用)
quickClickWait = timeWait * 0.65// 计算优化延迟

Const BoardColor = "52505F" // 判断是否过关时候用
Const BoardColorDark = "52505F" // 判断是否升级时候用

//Const BoardColor2 = "26202D" // 判断是否过关时候用
//Const BoardColorDark2 = "26323D"// 判断是否升级时候用

Function PressStartButton()
	MoveTo 1222, 713
	Delay quickClickWait
	LeftClick 1
	Delay quickClickWait
End Function

Function PushTower(posx, posy, key, levelUP0, levelUP1, levelUP2)
	MoveTo posx, posy // 移动鼠标
	KeyPress key, 1 // 选中指定塔
	Delay quickClickWait
	LeftClick 1 // 放置
	Delay quickClickWait
	LeftClick 1 // 选中
	For levelUP0
		Delay quickClickWait 
		KeyPress ",", 1// 001升级
	EndFor
	For levelUP1
		Delay quickClickWait 
		KeyPress ".", 1// 001升级
	EndFor
	For levelUP2
		Delay quickClickWait 
		KeyPress "/", 1// 001升级
	Next
	Delay quickClickWait
	KeyPress "Esc", 1 // 退出页面
End Function// 放塔函数

Function SeelToower(posx, posy)
	MoveTo posx, posy// 移动鼠标
	Delay quickClickWait
	LeftClick 1// 选中塔
	Delay quickClickWait
	KeyPress "BackSpace", 1 // 出售塔
	Delay quickClickWait
End Function// 售卖塔

Function UpgradeTower(posx, posy, levelUP0, levelUP1, levelUP2)
	MoveTo posx, posy // 移动鼠标
	Delay quickClickWait
	LeftClick 1 // 选中指定塔
	For levelUP0
		Delay quickClickWait 
		KeyPress ",", 1// 001升级
	EndFor
	For levelUP1
		Delay quickClickWait 
		KeyPress ".", 1// 001升级
	EndFor
	For levelUP2
		Delay quickClickWait 
		KeyPress "/", 1// 001升级
	Next
	Delay timeWait
	KeyPress "Esc", 1 // 退出页面
End Function

Function CombatReadinessEvent()
	
	// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=						刷猴钞模式
	Call PushTower(660, 240, "K", 0, 0, 2) // 002 猴村
	Call PushTower(580, 240, "K", 1, 0, 2)// 102 猴村
	Call PushTower(550, 325, "A", 0, 2, 3)// 023法师
	// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=						刷猴钞模式
	
End Function // 战斗准备时触发函数

Function StartingEvent()
	
	// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=						刷猴钞模式
	Call PushTower(610, 325, "U", 0, 0, 0)// // 放置英雄
	// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=						刷猴钞模式
	
End Function// 开始战斗时候触发函数

Function AccelerationModeEvent()
	
	// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=						刷猴钞模式
	Call PushTower(675, 325, "F", 4, 0, 1) // 401炼金
	Call PushTower(740, 310, "X", 2, 0, 3) // 203潜艇
	Call PushTower(740, 260, "X", 2, 0, 3) // 203潜艇
	Call SeelToower(680, 240) // 出售猴村1
	Call SeelToower(580, 250) // 出售猴村2
	Call UpgradeTower(740, 310, 0, 0, 1) // 升级潜水艇1
	Call UpgradeTower(740, 260, 0, 0, 1)// 升级潜水艇
	Call PushTower(340, 550, "Q", 0, 0, 2) // 002飞镖
	Call PushTower(340, 265, "Q", 0, 0, 2) // 002飞镖
	// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=						刷猴钞模式
	
End Function // 开始加速时候触发函数

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
Delay 150

Call CombatReadinessEvent()
Call PressStartButton() // 开始游戏 =-=-=-=
Call StartingEvent()
Call PressStartButton()// 加速游戏 =-=-=-=
Call AccelerationModeEvent()


// 可自定义部分 =-=-= 可攒经验之类的
// ↓ 在这里可自定义刷什么猴子的经验 ↓

// ...

// ↑ 在这里可自定义刷什么猴子的经验 ↑

MoveTo 640, 640

// =-=-=-= 完成布阵 =-=-=-=

Rem 判断游戏是否结束

FindColorEx 5,30,55,1080,"20262D",0, 0.95, intX,intY
If intX > 0 And intY > 0 Then 
	IfColor 111 ,660, "2152A4", 2 Then // 检测是否为升级
		Delay timeWait
		MoveTo 640, 640
		Delay 300
		LeftClick 1
		Delay quickClickWait
		LeftClick 1
		Delay 300
		Goto 判断游戏是否结束
		// 这里判断是否突然升级 ：点两下取消升级页面
	Else
		// 找到颜色点,判定获胜
    	Delay (250 + timeWait) // 等待弹出动画
    	MoveTo 640, 640
    	Delay quickClickWait
    	MoveTo 640, 640
		LeftClick 1
    	Delay (250 + timeWait) // 等待弹出动画
    	// 点击下一页
    	
		MoveTo 480, 600
    	Delay quickClickWait
    	LeftClick 1
		Delay (250 + timeWait)
		// 点击返回主页
	End If
	
	Delay 500// 延迟检测
Else 
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
