--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-02-07 03:45:40
--======================================================================--
local 场景类_系统设置 = class()

local floor = math.floor
local ceil = math.ceil
local tp,zts,zts1
local insert = table.insert
local format = string.format

function 场景类_系统设置:初始化(根)
	self.ID = 26
	self.x = 275
	self.y = 97
	self.xx = 0
	self.yy = 0
	self.注释 = "系统设置"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	self.窗口时间 = 0
end

function 场景类_系统设置:打开()
	if self.可视 then
		self.分类 = nil
		self.可视 = false
		self.资源组 = nil
		资源 = nil
		按钮 = nil
		自适应 = nil
		小型选项栏 = nil
		滑块 = nil
		return
	else
		insert(tp.窗口_,self)
		self.分类 = 1
		tp.系统设置 = {
			声音设置 = {140,140,true,true},
		}
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		local 小型选项栏 = tp._小型选项栏
		local 滑块 = tp._滑块
		self.资源组 = {
			[1] = 自适应.创建(0,1,455,427,3,9),
			[2] = 自适应.创建(1,1,417,18,1,3,nil,18),
			[3] = 自适应.创建(5,1,306,319,3,9),
			[4] = 自适应.创建(72,1,165,23,1,3,nil,18), --背景
			[5] = 按钮.创建(自适应.创建(18,4,16,16,4,1),0,0,4,true,true), --关闭
			[6] = 按钮.创建(自适应.创建(12,4,72,22,1,1),0,0,4,true,true,"系统设置"),
			[7] = 按钮.创建(自适应.创建(12,4,72,22,1,1),0,0,4,true,true,"音频设置"),
			[8] = 按钮.创建(自适应.创建(12,4,72,22,1,1),0,0,4,true,true,"画面偏好"),
			[9] = 按钮.创建(自适应.创建(30,4,26,26,4,1),0,0,5,true,true), --音乐按钮
			[10] = 按钮.创建(自适应.创建(30,4,26,26,4,1),0,0,5,true,true), --音效按钮
			[11] = 滑块.创建(资源:载入(tp.滑块资源,"网易WDF动画",0x8D4BBC26),1,160,16,1), --音量滑块
			[12] = 滑块.创建(资源:载入(tp.滑块资源,"网易WDF动画",0x8D4BBC26),1,160,16,1), --音效滑块
			[13] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"重选角色"),
			[14] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"退出游戏"),
			[15] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"到主界面"),
			[16] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"游戏团队"),
			[17] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true), --下拉
			[18] = 小型选项栏.创建(自适应.创建(6,1,80,110,3,9),"self.游戏窗口设置"),--下拉选项
			[19] = 自适应.创建(3,1,90,19,1,3),
			[20] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true), --下拉
			[21] = 小型选项栏.创建(自适应.创建(6,1,80,110,3,9),"底图效果"),--下拉选项

			[22] = 按钮.创建(资源:载入(tp.打勾框,"网易WDF动画",0xFF205590),0,0,1,true,true), --屏蔽玩家
			[23] = 按钮.创建(资源:载入(tp.打勾框,"网易WDF动画",0xFF205590),0,0,1,true,true), --屏蔽摊位
			[24] = 按钮.创建(资源:载入(tp.打勾框,"网易WDF动画",0xFF205590),0,0,1,true,true), --屏蔽特效
			[25] = 按钮.创建(资源:载入(tp.打勾框,"网易WDF动画",0xFF205590),0,0,1,true,true), --连点模式
			[26] = 按钮.创建(资源:载入(tp.打勾框,"网易WDF动画",0xFF205590),0,0,1,true,true), --变身造型
			[27] = 按钮.创建(资源:载入(tp.打勾框,"网易WDF动画",0xFF205590),0,0,1,true,true), --自动战斗
			[28] = 按钮.创建(资源:载入(tp.打勾框,"网易WDF动画",0xFF205590),0,0,1,true,true), --系统信息
			[29] = 按钮.创建(资源:载入(tp.打勾框,"网易WDF动画",0xFF205590),0,0,1,true,true), --活动信息
		}

		for i=9,10 do
			self.资源组[i].允许再次点击 = true
		end

		self.资源组3={
				[1] = 按钮.创建(自适应.创建(30,4,26,26,4,1),0,0,5,true,true), --音乐按钮
				[2] = 按钮.创建(自适应.创建(30,4,26,26,4,1),0,0,5,true,true), --音效按钮
				[3] = 按钮.创建(自适应.创建(30,4,26,26,4,1),0,0,5,true,true), --音效按钮
				[4] = 按钮.创建(自适应.创建(30,4,26,26,4,1),0,0,5,true,true), --音效按钮
				[5] = 按钮.创建(自适应.创建(30,4,26,26,4,1),0,0,5,true,true), --音乐按钮
				[6] = 按钮.创建(自适应.创建(30,4,26,26,4,1),0,0,5,true,true), --音效按钮
				[7] = 按钮.创建(自适应.创建(30,4,26,26,4,1),0,0,5,true,true), --音效按钮
				[8] = 按钮.创建(自适应.创建(30,4,26,26,4,1),0,0,5,true,true), --音效按钮
				[9] = 按钮.创建(自适应.创建(30,4,26,26,4,1),0,0,5,true,true), --音乐按钮
				[10] = 按钮.创建(自适应.创建(30,4,26,26,4,1),0,0,5,true,true), --音效按钮
				[11] = 按钮.创建(自适应.创建(30,4,26,26,4,1),0,0,5,true,true), --音效按钮
				[12] = 按钮.创建(自适应.创建(30,4,26,26,4,1),0,0,5,true,true), --音效按钮

		}
		self.资源组[22]:置打勾框(玩家显示开关)
		self.资源组[23]:置打勾框(玩家摊位显示开关)
		self.资源组[24]:置打勾框(tp.场景特效)
		self.资源组[25]:置打勾框(连点模式)
		self.资源组[26]:置打勾框(not 变身显示)
		self.资源组[27]:置打勾框(全局自动走路开关)
		self.资源组[28]:置打勾框(屏蔽系统消息)
		self.资源组[29]:置打勾框(屏蔽活动消息)

		self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(tp.音量,0,140))
		self.资源组[12]:置起始点(self.资源组[12]:取百分比转换(游戏音效,0,140))
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_系统设置:显示(dt,x,y)
	self.焦点 = false
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y,self.分类 ~= 1)
	self.资源组[7]:更新(x,y,self.分类 ~= 2)
	self.资源组[8]:更新(x,y,self.分类 ~= 3)
	self.资源组[13]:更新(x,y)
	self.资源组[14]:更新(x,y)
	self.资源组[15]:更新(x,y)
	self.资源组[16]:更新(x,y)
	self.资源组[17]:更新(x,y)
	self.资源组[20]:更新(x,y)
	self.资源组[22]:更新(x,y)
	self.资源组[23]:更新(x,y)
	self.资源组[24]:更新(x,y)
	self.资源组[25]:更新(x,y)
	self.资源组[26]:更新(x,y)
	self.资源组[27]:更新(x,y)
	self.资源组[28]:更新(x,y)
	self.资源组[29]:更新(x,y)
	if 引擎.是否全屏 then
		self.游戏窗口设置 = "全屏窗口"
	else
		self.游戏窗口设置 = 全局游戏宽度.."*"..全局游戏高度
	end

	if self.资源组[6]:事件判断() then
		self.分类 = 1
  	elseif self.资源组[5]:事件判断() then
		self:打开()
		return
	elseif self.资源组[7]:事件判断() then
		self.分类 = 2
		self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(tp.音量,0,140))
		self.资源组[12]:置起始点(self.资源组[12]:取百分比转换(游戏音效,0,140))
	elseif self.资源组[8]:事件判断() then
		 self.分类 = 3

	elseif self.资源组[13]:事件判断() then--重选角色
		tp.提示:写入("#Y该功能暂停使用！")
		-- if #tp.队伍数据 > 0 then
		-- 	tp.提示:写入("#Y请先退出当前队伍！")
		-- 	return
		-- end
		-- self:打开()
		-- tp.进程 = 1
		-- 系统退出=true
		-- 客户端:断开()
	elseif self.资源组[14]:事件判断() then--退出
		if 开发调试 then
			local pb_data = {
				version = 版本,
				action = -1
			}
			客户端:发送PB数据(100, pb_data)
		else
			发送数据(5)
		end
		os.exit()
	elseif self.资源组[15]:事件判断() then--到主界面
		self:打开()
		引擎.运行("g2d.exe")
		客户端:断开()
		引擎关闭开始()

	end

	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+6,self.y+3)
	self.资源组[3]:显示(self.x+137,self.y+32)
	tp.窗口标题背景_:置区域(0,0,78,16)
	tp.窗口标题背景_:显示(self.x+180,self.y+3)
	zts1:置字间距(3)
	zts1:显示(self.x+185,self.y+3,"系统设置")
	zts1:置字间距(0)
	self.资源组[5]:显示(self.x+430,self.y+6)
	self.资源组[6]:显示(self.x+21,self.y+40,true,nil,nil,self.分类 == 1,2)
	self.资源组[7]:显示(self.x+21,self.y+80,true,nil,nil,self.分类 == 2,2)
	self.资源组[8]:显示(self.x+21,self.y+120,true,nil,nil,self.分类 == 3,2)
	tp.竖排花纹背景_:置区域(0,0,18,393)
	tp.竖排花纹背景_:显示(self.x+111,self.y+27)

	self.资源组[13]:显示(self.x+149,self.y+360,true)
	self.资源组[14]:显示(self.x+349,self.y+390,true)
	self.资源组[15]:显示(self.x+249,self.y+360,true)
	self.资源组[16]:显示(self.x+349,self.y+360,true)

	if self.分类==1 then
		self.资源组[19]:显示(self.x+300,self.y+62)
		self.资源组[19]:显示(self.x+300,self.y+95)
		zts:置颜色(黑色)
		zts:显示(self.x+305,self.y+65,self.游戏窗口设置)
		zts:显示(self.x+305,self.y+98,"底图"..tp.底图)
		zts:显示(self.x+200,self.y+65,"游戏分辨率")
		zts:显示(self.x+200,self.y+98,"聊天框背景")

		zts:显示(self.x+155,self.y+131,"显示玩家(F9)")
		zts:显示(self.x+155,self.y+164,"开启动态特效")
		zts:显示(self.x+155,self.y+197,"屏蔽变身造型")
		zts:显示(self.x+155,self.y+230,"屏蔽系统消息")
		zts:显示(self.x+300,self.y+131,"屏蔽摊位(F11)")
		zts:显示(self.x+300,self.y+164,"连 点 模 式")
		zts:显示(self.x+300,self.y+197,"自 动 战 斗")
		zts:显示(self.x+300,self.y+230,"屏蔽活动消息")

		self.资源组[22]:显示(self.x+255,self.y+128)
		self.资源组[23]:显示(self.x+400,self.y+128)
		self.资源组[24]:显示(self.x+255,self.y+161)
		self.资源组[25]:显示(self.x+400,self.y+161)
		self.资源组[26]:显示(self.x+255,self.y+194)
		self.资源组[27]:显示(self.x+400,self.y+194)

		self.资源组[28]:显示(self.x+255,self.y+227)
		self.资源组[29]:显示(self.x+400,self.y+227)


		self.资源组[17]:显示(self.x+370,self.y+60)
		self.资源组[18]:显示(self.x+295,self.y+80,x,y,self.鼠标)

		self.资源组[20]:显示(self.x+370,self.y+93)
		self.资源组[21]:显示(self.x+295,self.y+113,x,y,self.鼠标)

		if self.资源组[18]:事件判断() then
			local 宽高s =self.资源组[18].弹出事件
			if 宽高s ~= "全屏窗口" then
				if 引擎.是否全屏 then
				    引擎.置全屏()
				end
				local 宽高XY =分割文本2(宽高s,"*")
				if not 判断是否数组(宽高XY) then
				    return false
				end
				local 宽高X,宽高Y=math.ceil(宽高XY[1]) or 850,math.ceil(宽高XY[2]) or 620
				引擎.置宽高(宽高X,宽高Y)
				全局游戏宽度 = 宽高X
				全局游戏高度 = 宽高Y
				withs = 全局游戏宽度
				hegts = 全局游戏高度
				with = 全局游戏宽度/2
				hegt = 全局游戏高度/2
				写配置("./配置.ini","mhxy","宽度",全局游戏宽度)
				写配置("./配置.ini","mhxy","高度",全局游戏高度)
				self.游戏窗口设置 = 宽高s
			else
				if (全局游戏宽度==1024 and 全局游戏高度==768 )or(全局游戏宽度==1280 and 全局游戏高度==720 )or(全局游戏宽度==1280 and 全局游戏高度==768 )or(全局游戏宽度==1280 and 全局游戏高度==800 )  then
				    引擎.置全屏()
				    self.游戏窗口设置 = 宽高s
					if not 引擎.是否全屏 then
					    self.游戏窗口设置 = 全局游戏宽度.."*"..全局游戏高度
					end
				end
			end
			self.资源组[18].弹出事件 = nil
		elseif self.资源组[21]:事件判断() then
			local 底图 = self.资源组[21].弹出事件
			self.资源组[21].弹出事件 = nil
			local 底图资源 = 0x1BDDA833
			local 资源包 = "xzsc.wdf"
			if 底图 == "底图1" then
				tp.底图 = 1
				底图资源 = 0x1BDDA833
				资源包 = "wzife.wdf"
			elseif 底图 == "底图2" then
				tp.底图 = 2
				底图资源 = 0x00000001
			elseif 底图 == "底图3" then
				tp.底图 = 3
				底图资源 = 0x00000002
			elseif 底图 == "底图4" then
				tp.底图 = 4
				底图资源 = 0x00000003
			elseif 底图 == "底图5" then
				tp.底图 = 5
				底图资源 = 0x00000004
			elseif 底图 == "底图6" then
				tp.底图 = 6
				底图资源 = 0x00000005
			elseif 底图 == "底图7" then
				tp.底图 = 7
				底图资源 = 0x00000006
			elseif 底图 == "底图8" then
				tp.底图 = 8
				底图资源 = 0x00000007
			end

			写配置("./配置.ini","mhxy","底图",tp.底图)
			tp.外部聊天框 = tp.资源:载入(资源包,"网易WDF动画",底图资源)
			tp.外部聊天框:置区域(0,0,360,1000)
			tp.提示:写入("#Y切换底图成功！")
		end

		if self.资源组[16]:事件判断() then--游戏团队
			tp.提示:写入(tostring(全局msg制作团队))
		elseif self.资源组[17]:事件判断() then
			local tbt = {"850*620","1024*768","1280*720","1280*768","1280*800","全屏窗口"}--"640*480","800*600","1024*768","1280*720","1280*768","1280*800","全屏窗口"
			self.资源组[18]:打开(tbt)
			self.资源组[18]:置选中(self.游戏窗口设置)
		elseif self.资源组[20]:事件判断() then
			local tbt = {"底图1","底图2","底图3","底图4","底图5","底图6","底图7","底图8"}--"640*480","800*600","1024*768","1280*720","1280*768","1280*800","全屏窗口"
			self.资源组[21]:打开(tbt)
			self.资源组[21]:置选中(self.游戏窗口设置)
		elseif self.资源组[22]:事件判断() then
			if 玩家显示开关 then
				玩家显示开关 = false
				玩家加载开关 = false
				for i,v in pairs(tp.场景.玩家) do
					tp.场景.玩家[i].玩家["静立"] = nil
					tp.场景.玩家[i].玩家["行走"] = nil
				end
				tp.提示:写入("#Y/玩家动画已经屏蔽,再次按下重新加载玩家动画.....")
			else
				玩家加载开关=true
				for i,v in pairs(tp.场景.玩家) do
					tp.场景.玩家[i]:重新加载动画()
				end
				玩家显示开关=true
				tp.提示:写入("#Y/玩家动画已经重新加载,请稍后.....")
			end
			self.资源组[22]:置打勾框(玩家显示开关)
		elseif self.资源组[23]:事件判断() then
			if 玩家摊位显示开关 then
			    玩家摊位显示开关=false
			    tp.提示:写入("#Y/摊位显示已关闭")
			else
				玩家摊位显示开关=true
				tp.提示:写入("#Y/摊位显示已开启")
			end
			self.资源组[23]:置打勾框(玩家摊位显示开关)
		elseif self.资源组[24]:事件判断() then
			if tp.场景特效 then
				tp.场景特效 = false
				写配置("./配置.ini","mhxy","场景特效",tp.场景特效)
				tp.场景.地图.传送tx = nil
				tp.提示:写入("#Y您已关闭特效！")
			else
				tp.场景特效 = true
				写配置("./配置.ini","mhxy","场景特效",tp.场景特效)
				tp.提示:写入("#Y您已开启特效,需切换地图后生效！")
			end
			self.资源组[24]:置打勾框(tp.场景特效)
		elseif self.资源组[25]:事件判断() then
			if 连点模式 then
				连点模式=false
				tp.提示:写入("#Y你关闭了连点模式")
			else
				连点模式=true
				tp.提示:写入("#Y你开启了连点模式，长按鼠标3秒后可持续给人物或召唤兽分配属性点")
			end
			self.资源组[25]:置打勾框(连点模式)
		elseif self.资源组[26]:事件判断() then
			if 变身显示 then
				变身显示 = false
			else
				变身显示 = true
			end
			for i,v in pairs(tp.场景.玩家) do
				tp.场景.玩家[i]:重新加载动画()
			end
			tp.场景.人物:置模型()
			tp.提示:写入("#Y/玩家动画正在重新加载,请稍后.....")
			self.资源组[26]:置打勾框(not 变身显示)
		elseif self.资源组[27]:事件判断() then
			if 全局自动走路开关 == true then
	        	全局自动走路开关 = false
	        	tp.提示:写入("#Y/自动挂机已关闭!在按住Ctrl + Z 开启自动遇怪.....")
	        else
	        	if tp.场景.场景最低等级 == nil then
	        		全局自动走路开关 = false
	        		tp.提示:写入("#Y/自动挂机开启失败!当前场景不属于野外区.....")
	        	else
	        		全局自动走路开关 = true
	        		tp.提示:写入("#Y/自动挂机已开启!在按住Ctrl + Z 关闭自动遇怪.....")
	        	end
	        end
			self.资源组[27]:置打勾框(全局自动走路开关)
		elseif self.资源组[28]:事件判断() then
			if 屏蔽系统消息 then
				屏蔽系统消息 = false
			else
				屏蔽系统消息 = true
			end
			tp.提示:写入("#Y/设置成功.....")
			self.资源组[28]:置打勾框(屏蔽系统消息)
		elseif self.资源组[29]:事件判断() then
			if 屏蔽活动消息 then
				屏蔽活动消息 = false
			else
				屏蔽活动消息 = true
			end
			tp.提示:写入("#Y/设置成功.....")
			self.资源组[29]:置打勾框(屏蔽活动消息)
		end

	elseif self.分类 == 2 then
		self.资源组[9]:更新(x,y,tp.音乐开启 )
		self.资源组[10]:更新(x,y,tp.系统设置.声音设置[4] ~= true)
		zts:置颜色(-16777216)
		zts:显示(self.x+165,self.y+70,"音频")
		zts:显示(self.x+195,self.y+101,"游戏音乐")
		zts:显示(self.x+195,self.y+141,"游戏音效")
		self.资源组[9]:显示(self.x+166,self.y+95,true,nil,nil,tp.音量 > 0,4)
		self.资源组[10]:显示(self.x+166,self.y+135,true,nil,nil,游戏音效>0,4)
		for i=1,2 do
			self.资源组[4]:显示(self.x+257,self.y+56+i*40)
		end
		self.资源组[11]:显示(self.x+258,self.y+98,x,y,self.鼠标)
		self.资源组[12]:显示(self.x+258,self.y+138,x,y,self.鼠标)
		if self.资源组[11].接触 then
			tp.音量 = ceil(140*self.资源组[11]:取百分比())
			tp.音乐:置音量(tp.音量)
			self.焦点 = true
			f函数.写配置(程序目录.."./配置.ini","mhxy","音量",tp.音量)
			if tp.音量 > 0 and not tp.音乐开启 then
				tp.音乐开启 = true
				写配置("./配置.ini","mhxy","音乐播放",tp.音乐开启)
				tp.音乐:播放()
			elseif tp.音量 <= 0 and tp.音乐开启 then
				tp.音乐:停止()
				tp.音乐开启 = false
				写配置("./配置.ini","mhxy","音乐播放",tp.音乐开启)
			end
		elseif self.资源组[12].接触 then
			游戏音效 = ceil(140*self.资源组[12]:取百分比())
			f函数.写配置(程序目录.."./配置.ini","mhxy","音效",游戏音效)
			self.焦点 = true
		end
		if self.资源组[9]:事件判断() then
			tp.音乐开启 = not tp.音乐开启
		  	if not tp.音乐开启 then
				tp.音乐:停止()
				tp.音量 = 0
				系统参数.音量=tp.音量
				tp.音乐:置音量(0)
				self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(tp.音量,0,140))
				写配置("./配置.ini","mhxy","音乐播放",tp.音乐开启)
			else
				tp.音乐:播放()
				tp.音量 = 100
				系统参数.音量=tp.音量
				tp.音乐:置音量(tp.音量)
				self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(tp.音量,0,140))
				写配置("./配置.ini","mhxy","音乐播放",tp.音乐开启)
			end
			f函数.写配置(程序目录.."./配置.ini","mhxy","音量",tp.音量)
		elseif self.资源组[10]:事件判断() then
			tp.音效开启 = not tp.音效开启
		  	if not tp.音效开启 then
		  		游戏音效=0
		  		self.资源组[12]:置起始点(self.资源组[12]:取百分比转换(游戏音效,0,140))
				写配置("./配置.ini","mhxy","音效开启",tp.音效开启)
			else
				游戏音效=100
				self.资源组[12]:置起始点(self.资源组[12]:取百分比转换(游戏音效,0,140))
				写配置("./配置.ini","mhxy","音效开启",tp.音效开启)
			end
			f函数.写配置(程序目录.."./配置.ini","mhxy","音效",游戏音效)
		end
	elseif self.分类 == 3 then
		zts:置颜色(-16777216)
		zts:显示(self.x+165,self.y+70,"画面风格")
		zts:显示(self.x+195,self.y+101,"默认界面")
		zts:显示(self.x+195,self.y+141,"水晶界面")
		zts:显示(self.x+295,self.y+101,"国韵界面")
		zts:显示(self.x+295,self.y+141,"雅致界面")
		self.资源组3[1]:更新(x,y,界面风格~=1)
		self.资源组3[2]:更新(x,y,界面风格~=2)
		self.资源组3[3]:更新(x,y,界面风格~=3)
		self.资源组3[4]:更新(x,y,界面风格~=4)
		self.资源组3[1]:显示(self.x+166,self.y+95,true,nil,nil,界面风格==1,4)
		self.资源组3[2]:显示(self.x+266,self.y+95,true,nil,nil,界面风格==2,4)
		self.资源组3[3]:显示(self.x+166,self.y+135,true,nil,nil,界面风格==3,4)
		self.资源组3[4]:显示(self.x+266,self.y+135,true,nil,nil,界面风格==4,4)
		if self.资源组3[1]:事件判断() then
		  	if 界面风格~=1 then
				local fc = tp._自适应.创建()
				fc:加载(tp)
				tp.窗口.底图框:加载()
				tp.窗口.消息框:加载()
				tp.窗口.时辰:加载()
				tp.窗口.人物框:加载()
				界面风格=1
				写配置("./配置.ini","mhxy","界面风格",1)
			end
		elseif self.资源组3[2]:事件判断() then
		  	if 界面风格~=2 then
				local fc = tp._自适应.创建()
				fc:加载2(tp)
				tp.窗口.底图框:加载()
				tp.窗口.消息框:加载()
				tp.窗口.时辰:加载()
				tp.窗口.人物框:加载()
				界面风格=2
				写配置("./配置.ini","mhxy","界面风格",2)
			end
		elseif self.资源组3[3]:事件判断() then
		  	if 界面风格~=3 then
				local fc = tp._自适应.创建()
				fc:加载3(tp)
				tp.窗口.底图框:加载()
				tp.窗口.消息框:加载()
				tp.窗口.时辰:加载()
				tp.窗口.人物框:加载()
				界面风格=3
				写配置("./配置.ini","mhxy","界面风格",3)
			end
		elseif self.资源组3[4]:事件判断() then
		  	if 界面风格~=4 then
				local fc = tp._自适应.创建()
				fc:加载4(tp)
				tp.窗口.底图框:加载()
				tp.窗口.消息框:加载()
				tp.窗口.时辰:加载()
				tp.窗口.人物框:加载()
				界面风格=4
				写配置("./配置.ini","mhxy","界面风格",4)
			end
		end

		zts:置颜色(-16777216)
		zts:显示(self.x+165,self.y+170,"字体设置")
		zts:显示(self.x+195,self.y+201,"默认字体")
		zts:显示(self.x+195,self.y+241,"二号字体")
		zts:显示(self.x+295,self.y+201,"三号字体")
		zts:显示(self.x+295,self.y+241,"四号字体")
		zts:显示(self.x+195,self.y+281,"五号字体")
		zts:显示(self.x+195,self.y+321,"六号字体")
		zts:显示(self.x+295,self.y+281,"七号字体")
		zts:显示(self.x+295,self.y+321,"八号字体")

		self.资源组3[5]:更新(x,y,界面字体~=1)
		self.资源组3[6]:更新(x,y,界面字体~=2)
		self.资源组3[7]:更新(x,y,界面字体~=3)
		self.资源组3[8]:更新(x,y,界面字体~=4)
		self.资源组3[9]:更新(x,y,界面字体~=5)
		self.资源组3[10]:更新(x,y,界面字体~=6)
		self.资源组3[11]:更新(x,y,界面字体~=7)
		self.资源组3[12]:更新(x,y,界面字体~=8)
		self.资源组3[5]:显示(self.x+166,self.y+195,true,nil,nil,界面字体==1,4)
		self.资源组3[6]:显示(self.x+266,self.y+195,true,nil,nil,界面字体==2,4)
		self.资源组3[7]:显示(self.x+166,self.y+235,true,nil,nil,界面字体==3,4)
		self.资源组3[8]:显示(self.x+266,self.y+235,true,nil,nil,界面字体==4,4)
		self.资源组3[9]:显示(self.x+166,self.y+275,true,nil,nil,界面字体==5,4)
		self.资源组3[10]:显示(self.x+266,self.y+275,true,nil,nil,界面字体==6,4)
		self.资源组3[11]:显示(self.x+166,self.y+315,true,nil,nil,界面字体==7,4)
		self.资源组3[12]:显示(self.x+266,self.y+315,true,nil,nil,界面字体==8,4)

		if self.资源组3[5]:事件判断() then
		  	if 界面字体~=1 then
				tp.字体表.描边字体=require("gge文字类")(nil,16,false,true,false)
				tp.字体表.描边字体:置描边颜色(-16777216)
				tp.字体表.描边字体:置颜色(4294967295)
				界面字体=1
				写配置("./配置.ini","mhxy","界面字体",1)
			end
		elseif self.资源组3[6]:事件判断() then
		  	if 界面字体~=2 then
				tp.字体表.描边字体=require("gge文字类")("wdf/font/hksnt.ttf",16,false,true,false)
				tp.字体表.描边字体:置描边颜色(-16777216)
				tp.字体表.描边字体:置颜色(4294967295)
				界面字体=2
				写配置("./配置.ini","mhxy","界面字体",2)
			end
		elseif self.资源组3[7]:事件判断() then
		  	if 界面字体~=3 then
				tp.字体表.描边字体=require("gge文字类")("wdf/font/hkyt.ttf",16,false,true,false)
				tp.字体表.描边字体:置描边颜色(-16777216)
				tp.字体表.描边字体:置颜色(4294967295)
				界面字体=3
				写配置("./配置.ini","mhxy","界面字体",3)
			end
		elseif self.资源组3[8]:事件判断() then
		  	if 界面字体~=4 then
				tp.字体表.描边字体=require("gge文字类")("wdf/font/hyb1gjm.ttf",16,false,true,false)
				tp.字体表.描边字体:置描边颜色(-16777216)
				tp.字体表.描边字体:置颜色(4294967295)
				界面字体=4
				写配置("./配置.ini","mhxy","界面字体",4)
			end
		elseif self.资源组3[9]:事件判断() then
		  	if 界面字体~=5 then
				tp.字体表.描边字体=require("gge文字类")("wdf/font/hyh1gjm.ttf",16,false,true,false)
				tp.字体表.描边字体:置描边颜色(-16777216)
				tp.字体表.描边字体:置颜色(4294967295)
				界面字体=5
				写配置("./配置.ini","mhxy","界面字体",5)
			end
		elseif self.资源组3[10]:事件判断() then
		  	if 界面字体~=6 then
				tp.字体表.描边字体=require("gge文字类")("wdf/font/hyj4gjm.ttf",16,false,true,false)
				tp.字体表.描边字体:置描边颜色(-16777216)
				tp.字体表.描边字体:置颜色(4294967295)
				界面字体=6
				写配置("./配置.ini","mhxy","界面字体",6)
			end
		elseif self.资源组3[11]:事件判断() then
		  	if 界面字体~=7 then
				tp.字体表.描边字体=require("gge文字类")("wdf/font/ygyxsziti2.0.ttf",16,false,true,false)
				tp.字体表.描边字体:置描边颜色(-16777216)
				tp.字体表.描边字体:置颜色(4294967295)
				界面字体=7
				写配置("./配置.ini","mhxy","界面字体",7)
			end
		elseif self.资源组3[12]:事件判断() then
		  	if 界面字体~=8 then
				tp.字体表.描边字体=require("gge文字类")("wdf/font/方正琥珀简体.ttf",16,false,true,false)
				tp.字体表.描边字体:置描边颜色(-16777216)
				tp.字体表.描边字体:置颜色(4294967295)
				界面字体=8
				写配置("./配置.ini","mhxy","界面字体",8)
			end
		end
	end
end


function 场景类_系统设置:检查点(x,y)
	if self.资源组~=nil and  self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_系统设置:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not 引擎.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_系统设置:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_系统设置