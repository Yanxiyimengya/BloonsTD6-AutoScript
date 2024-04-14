// 此脚本代码由烟汐忆梦_YM重构 免费开放使用
Global openAutoJumpTurn // 记录是否打开自动开始
openAutoJumpTurn = false
Global quickClickWait// 快速点击延迟速度(优化点击用)

UserVar timeWait = 140 "点击延迟速度"
UserVar loadingWait = 10 "黑屏加载等待延迟时间"
UserVar checkAutoStart = DropList{"开启":1 |"关闭":0} = 0 "自动检查自动开始模式" 
UserVar delayedStart = DropList{"开启":1 |"关闭":0 } = 1 "延迟开始（避免布阵时升级导致脚本失败）" 
UserVar lineup = DropList{"挂机猴钞":"猴钞" |"钉塔刷经验":"经验" } = 0 "阵容" 
UserVar upgradedMonkey = DropList{"飞镖猴":"Q"|"回旋镖猴":"W"|"大炮":"E"|"图钉塔":"R"|"冰猴":"T"|"胶水炮手":"Y"|"狙击手猴":"Z"|"猴子潜艇":"X"|"海盗猴":"C"|"皇家飞行员":"V"|"直升机飞行员":"B"|"迫击炮猴":"N"|"机枪猴":"M"|"法师猴":"A"|"超猴侠":"S"|"忍者猴":"D"|"炼金术士":"F"|"德鲁伊":"G"|"香蕉农场":"H"|"工程师猴":"L"|"刺钉工厂":"J"|"猴子村":"K"|"野兽之主":"I"} = 0 "想刷经验的猴子(仅钉塔刷经验模式有效)" 

quickClickWait = timeWait * 0.65// 计算优化延迟
animWait = timeWait
If animWait < 300 Then 
	animWait = 300
End If

Dim platforms(3)
platforms(0) = "BloonsTD6"
platforms(1) = "BloonsTD6-Epic"
platforms(2) = 0
Function GetHwnd()
    hwnd = 0// 气球塔防6窗口hwnd
    loopCount = 0
    While (hwnd = 0 Or loopCount < 3)
    	hwnd = Plugin.Window.Find("UnityWndClass", platforms(0))
    	loopCount = loopCount + 1
    Wend
    GetHwnd = hwnd
End Function // 获取游戏窗口句柄

Function SelectMap(difficulty, mapID)
	inPageID = mapID Mod 6 // 取模获得页面ID
	page = mapID \ 6 // 整除获取所在页面ID
	
	MoveTo 380, 690
	Delay 20
	LeftClick 1
	Delay 20// 先点一下"新手页面"重置一下页面类信息
	
	Select Case difficulty
		Case 0
			MoveTo 555, 690
			Delay 20
			LeftClick 1
			Delay 20
			//点"中级"
			MoveTo 380, 690
			Delay 20
			LeftClick 1
			Delay 20
			// 再点新手页面
		Case 1
			MoveTo 555, 690 //点"中级"
			Delay 20
			LeftClick 1
			Delay 20
		Case 2
			MoveTo 740, 690 //点"高级"
			Delay 20
			LeftClick 1
			Delay 20
		Case 3
			MoveTo 890, 690 //点"专家"
			Delay 20
			LeftClick 1
			Delay 20
	End Select
	
	For page
		Delay 20
		LeftClick 1
	Next
	Delay 20 // 进入地图所在页面
	
	Select Case inPageID
		Case 1
			MoveTo 358, 222 // 将光标移动到第1个地图
		Case 2
			MoveTo 641, 222 // 将光标移动到第2个地图
		Case 3
			MoveTo 924, 222// 将光标移动到第3个地图
		Case 4
			MoveTo 358, 400 // 将光标移动到第4个地图
		Case 5
			MoveTo 641, 400 // 将光标移动到第5个地图
		Case 6
			MoveTo 924, 400// 将光标移动到第6个地图
	End Select
	Delay 20
	
	LeftClick 1
	Delay timeWait // 点击进入
	
End Function // 进入指定的地图

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
		Delay 20 
		KeyPress ",", 1// 001升级
	EndFor
	For levelUP1
		Delay 20 
		KeyPress ".", 1// 001升级
	EndFor
	For levelUP2
		Delay 20 
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

	Select Case lineup
		Case "猴钞"
			// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=						刷猴钞模式
			Call PushTower(660, 240, "K", 0, 0, 2) // 002 猴村
			Call PushTower(580, 240, "K", 1, 0, 2)// 102 猴村
			Call PushTower(550, 325, "A", 0, 2, 3)// 023法师
		Case "经验"
			// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=						刷经验模式
			Call PushTower(1035, 455, "K", 0, 0, 2)// 002猴村
			Call PushTower(1020, 390, "J", 4, 2, 0) // 420刺钉
			Call PushTower(1020, 335, "F", 4, 2, 0) // 420炼金
			Call SeelToower(1035, 455)// 出售猴村2
			
			If (upgradedMonkey = "X" Or upgradedMonkey = "C") Then 
				// 水军猴子 775 560
				Call PushTower(775, 550, upgradedMonkey, 5, 5, 5) // 出猴子
			Else 
				// 陆地猴子 600 560
				Call PushTower(600, 540, upgradedMonkey, 5, 5, 5) // 出猴子
			End If
			
			
			
	End Select
	
End Function // 战斗准备时触发函数

Function StartingEvent()
	
	Select Case lineup
		Case "猴钞"
			// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=						刷猴钞模式
			Call PushTower(610, 325, "U", 0, 0, 0)// // 放置英雄
		Case "经验"
			// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=						刷经验模式 (不做任何事情)
	End Select
	
End Function// 开始战斗时候触发函数

Function AccelerationModeEvent()

	Select Case lineup
		Case "猴钞"
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
		Case "经验"
			// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=						刷经验模式
			
	End Select
	
	
End Function // 开始加速时候触发函数

Rem 起始点
LockMouse // 锁定鼠标
bdt6HWND = GetHwnd() // 获取窗口句柄
Call Plugin.Window.Move(bdt6HWND, -7, 0) // 将窗口移动至显示屏左上角
   
MoveTo 555, 660
Delay quickClickWait
LeftClick 1
Delay timeWait
// 点开始 进入选关页面

Call SelectMap(3, 10) // 进入专家模式的第10个地图 也就是黑暗城堡
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
Delay (animWait + loadingWait)

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

TracePrint openAutoJumpTurn
TracePrint checkAutoStart

If (openAutoJumpTurn = false And checkAutoStart = 1) Then
	// 判断自动开始是否打开	
	KeyPress "Esc", 1
	Delay animWait
	FindColorEx 835 ,220, 940, 240,"00EC78",0, 0.86, autoJumpX, autoJumpY// 加载时 检测屏幕点 蓝色 就说明已经启用 
	If Not (autoJumpX > 0 And autoJumpY > 0)  Then 
		MoveTo 890, 243
		Delay quickClickWait
		LeftClick 1 // 打开自动开始
		Delay quickClickWait
	End If
	openAutoJumpTurn = 1 // 设置不再自动检测
	KeyPress "Esc", 1
	Delay timeWait
End If

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
UnlockMouse // 解除锁定鼠标

// =-=-=-= 完成布阵 =-=-=-=

Rem 判断游戏是否结束
FindColorEx 5,30,30,60,"232F39",0, 0.92, intX,intY
If intX > 0 And intY > 0 Then 
	FindColorEx 5,420,280,750,"254D9B",0, 0.9, lvUPX, lvUPY // 检测是否为升级
	If lvUPX > 0 And lvUPY > 0 Then 
		Delay timeWait
		MoveTo 640, 640
		Delay 300
		LeftClick 1
		Delay quickClickWait
		LeftClick 1
		Delay (550 + timeWait)
		Goto 判断游戏是否结束
		// 这里判断是否突然升级 ：点两下取消升级页面
	Else
		// 找到颜色点,判定获胜
    	Delay (250 + timeWait)// 等待弹出动画
    	KeyPress "Esc", 1
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



Rem 结束脚本

EndScript
// 此脚本代码由烟汐忆梦_YM重构 免费开放使用
// BiliBili主页 https://space.bilibili.com/481430814?spm_id_from=333.788.0.0

