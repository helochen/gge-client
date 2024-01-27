
local 场景类_系统设置 = class()
local floor = math.floor
local ceil = math.ceil
local tp,zts
local insert = table.insert
local format = string.format
function 场景类_系统设置:初始化(根)
	self.ID = 26
	self.x = 325
	self.y = 120
	self.xx = 0
	self.yy = 0
	self.注释 = "系统设置"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 小型选项栏 = 根._小型选项栏
	tp = 根
	self.资源组 = {
		[1] = 资源:载入('wzife.wdf',"网易WDF动画",0x22429D80),
		[2] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xF11233BB),0,0,4,true,true),
		[3] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[4] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[5] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[6] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[7] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[8] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[9] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[10] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[11] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[12] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[13] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[14] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[15] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[16] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[17] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"保存配置"),
		[18] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"重选角色"),
		[19] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"连点模式"),
		[20] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"退出游戏"),
		[21] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"到主界面"),
		[22] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"游戏团队"),
		[23] = tp._滑块.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8D4BBC26),1,199,16,1),
		[24] = 自适应.创建(3,1,80,19,1,3,nil,18),--下拉框开始
		[25] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true), --下拉
		[26] = 小型选项栏.创建(自适应.创建(6,1,80,110,3,9),"self.游戏窗口设置"),--下拉选项
	}
	for i=2,22 do
		self.资源组[i]:绑定窗口_(26)
	end
	for i=3,16 do
		self.资源组[i]:置偏移(-3,2)
	end
	self.资源组[25]:绑定窗口_(26)
	zts = tp.字体表.普通字体
	self.窗口时间 = 0
	local XXX=读配置("./config.ini","mhxy","宽度") or "1000"
	local YYY=读配置("./config.ini","mhxy","高度") or "620"
	self.游戏窗口设置= XXX.."*"..YYY
end

function 场景类_系统设置:打开()
	if self.可视 then
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.资源组[3]:置打勾框(true)
		self.资源组[4]:置打勾框(tp.场景特效)
		self.资源组[5]:置打勾框(true)
		self.资源组[6]:置打勾框(true)
		self.资源组[7]:置打勾框(tp.音乐开启)
		self.资源组[8]:置打勾框(tp.音效开启)
		self.资源组[9]:置打勾框(true)
		self.资源组[10]:置打勾框(true)
		self.资源组[11]:置打勾框(true)
		self.资源组[12]:置打勾框(true)
		self.资源组[13]:置打勾框(true)
		self.资源组[14]:置打勾框(true)
		self.资源组[15]:置打勾框(true)
		self.资源组[16]:置打勾框(true)
		self.资源组[23]:置起始点(self.资源组[23]:取百分比转换(tp.音量,0,160))
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
		if 引擎.是否全屏 then
			self.游戏窗口设置 = "全屏窗口"
		else
			self.游戏窗口设置 = 全局游戏宽度.."*"..全局游戏高度
		end
	end
end

function 场景类_系统设置:显示(dt,x,y)
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y)
	self.资源组[7]:更新(x,y)
	self.资源组[8]:更新(x,y)
	self.资源组[9]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[11]:更新(x,y)
	self.资源组[12]:更新(x,y)
	self.资源组[13]:更新(x,y)
	self.资源组[14]:更新(x,y)
	self.资源组[15]:更新(x,y)
	self.资源组[16]:更新(x,y)
	self.资源组[17]:更新(x,y)
	self.资源组[18]:更新(x,y)
	self.资源组[19]:更新(x,y)
	self.资源组[20]:更新(x,y)
	self.资源组[21]:更新(x,y)
	self.资源组[22]:更新(x,y)
	self.资源组[25]:更新(x,y)
	if 引擎.是否全屏 then
		self.游戏窗口设置 = "全屏窗口"
	else
		self.游戏窗口设置 = 全局游戏宽度.."*"..全局游戏高度
	end
	--########################################################?自己修改?##########################################
	if self.资源组[2]:事件判断() then
		self:打开()
		return
	elseif self.资源组[4]:事件判断() then
		tp.场景特效 = not self.资源组[4].打勾框
		if not tp.场景特效 then
			写配置("./config.ini","mhxy","场景特效",tp.场景特效)
			self.资源组[4]:置打勾框(tp.场景特效)
			tp.场景.地图.传送tx = nil
			self.特效cw = nil
			tp.提示:写入("#Y您已关闭特效！")
		else
			self.资源组[4]:置打勾框(tp.场景特效)
			写配置("./config.ini","mhxy","场景特效",tp.场景特效)
			tp.提示:写入("#Y您已开启特效,需切换地图后生效！")
		end
	elseif self.资源组[7]:事件判断() then
		tp.音乐开启 = not self.资源组[7].打勾框
		if not tp.音乐开启 then
			tp.音乐:停止()
			写配置("./config.ini","mhxy","音乐播放",tp.音乐开启)
			self.资源组[7]:置打勾框(tp.音乐开启)
		else
			tp.音乐:播放()
			self.资源组[7]:置打勾框(tp.音乐开启)
			写配置("./config.ini","mhxy","音乐播放",tp.音乐开启)
		end
	elseif self.资源组[8]:事件判断() then
		tp.音效开启 = not self.资源组[8].打勾框
		self.资源组[8]:置打勾框(tp.音效开启)
		写配置("./config.ini","mhxy","音效开启",tp.音效开启)
	elseif self.资源组[17]:事件判断() then--保存
		写配置("./config.ini","mhxy","音量",ceil(160*self.资源组[23]:取百分比()))
		tp.音量=ceil(160*self.资源组[23]:取百分比())
		系统参数.音量=tp.音量
		tp.提示:写入("#Y保存成功!")
	elseif self.资源组[18]:事件判断() then--重选角色
		tp.提示:写入("#Y该功能暂停使用！")
		-- if #tp.队伍数据 > 0 then
		-- 	tp.提示:写入("#Y请先退出当前队伍！")
		-- 	return
		-- end
		-- self:打开()
		-- tp.进程 = 1
		-- 系统退出=true
		-- 客户端:断开()
	elseif self.资源组[20]:事件判断() then--退出
		if 开发调试 then
			local pb_data = {
				version = 版本,
				action = -1
			}
			客户端:发送PB数据(100, pb_data)
		else
			发送数据(5)
		end
		引擎关闭开始()
	elseif self.资源组[21]:事件判断() then--到主界面
		tp.提示:写入("#Y该功能暂停使用！")
		-- self:打开()
		-- tp.进程 = 1
		-- 系统退出=true
		-- 客户端:断开()
	elseif self.资源组[22]:事件判断() then--游戏团队
		tp.提示:写入(tostring(全局msg制作团队))
		-- __gge.messagebox(tostring(全局msg制作团队),"游戏团队",16)
	elseif self.资源组[19]:事件判断() then--游戏团队
		if 连点模式 then
			连点模式=false
			tp.提示:写入("#Y你关闭了连点模式")
		else
			连点模式=true
			tp.提示:写入("#Y你开启了连点模式，长按鼠标3秒后可持续给人物或召唤兽分配属性点")
		end
	elseif self.资源组[25]:事件判断() then
		local tbt = {"850*620","1024*768","1280*720","1280*768","1280*800","全屏窗口"}--"640*480","800*600","1024*768","1280*720","1280*768","1280*800","全屏窗口"
		self.资源组[26]:打开(tbt)
		self.资源组[26]:置选中(self.游戏窗口设置)
	end
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+358,self.y+6)
	-- self.资源组[3]:显示(self.x+120,self.y+29,true)
	self.资源组[4]:显示(self.x+205,self.y+29,true)
	self.资源组[5]:显示(self.x+120,self.y+62,true)
	self.资源组[6]:显示(self.x+205,self.y+62,true)
	self.资源组[7]:显示(self.x+120,self.y+95,true)
	self.资源组[8]:显示(self.x+205,self.y+95,true)
	self.资源组[9]:显示(self.x+120,self.y+155,true)
	self.资源组[10]:显示(self.x+205,self.y+155,true)
	self.资源组[11]:显示(self.x+120,self.y+184,true)
	self.资源组[12]:显示(self.x+205,self.y+184,true)
	self.资源组[13]:显示(self.x+120,self.y+217,true)
	self.资源组[14]:显示(self.x+205,self.y+217,true)
	self.资源组[15]:显示(self.x+120,self.y+250,true)
	self.资源组[16]:显示(self.x+205,self.y+250,true)
	self.资源组[17]:显示(self.x+49,self.y+290,true)
	self.资源组[18]:显示(self.x+149,self.y+290,true)
	self.资源组[19]:显示(self.x+249,self.y+290,true)
	self.资源组[20]:显示(self.x+49,self.y+320,true)
	self.资源组[21]:显示(self.x+149,self.y+320,true)
	self.资源组[22]:显示(self.x+249,self.y+320,true)
	self.资源组[23]:显示(self.x + 112,self.y + 125,x,y,self.鼠标)
	local XX,YY = 110,31--256,99
	self.资源组[24]:显示(self.x+XX,self.y+YY)
	self.资源组[25]:显示(self.x+XX+66,self.y+YY+1)
	self.资源组[26]:显示(self.x+XX,self.y+YY+18,x,y,self.鼠标)
	zts:置颜色(-16777216)
	zts:显示(self.x+XX+6,self.y+YY+2,self.游戏窗口设置)
	--============
	zts:置颜色(-256)
	zts:显示(self.x+66,self.y+359,"过度游戏会出现疲劳；应当劳逸结合！")
	if self.资源组[23].接触 then--音量"
		tp.音量 = ceil(160*self.资源组[23]:取百分比())
		tp.音乐:置音量(tp.音量)
		self.焦点 = true
	end
	if self.资源组[26]:事件判断() then
		local 宽高s =self.资源组[26].弹出事件
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
			写配置("./config.ini","mhxy","宽度",全局游戏宽度)
			写配置("./config.ini","mhxy","高度",全局游戏高度)
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
		self.资源组[26].弹出事件 = nil
	end
end

function 场景类_系统设置:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
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