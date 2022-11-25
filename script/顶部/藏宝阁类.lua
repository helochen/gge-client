
local 藏宝阁类 = class()
local tp
local 格子
function 藏宝阁类:初始化(根)
	tp = 根
	self.ID = 100
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	self.文字= tp.字体表.普通字体
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("银两输入",0,0,100,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(8)
	self.输入框:置数字模式()
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
end

function 藏宝阁类:打开(内容)
	if self.可视  then
		self.可视 = false
		self.界面显示 = 1
		self.我的数据 = nil
		-- self.资源=nil
		-- self.数据=nil
		self.输入框:置可视(false,false)
	else
	    table.insert(tp.窗口_,self)
	    local 资源 = tp.资源
		local 自适应 = tp._自适应
		local 按钮 = tp._按钮
		self.背景 = pwd("83")
		self.背景1 = pwd("84")
		self.资源 = {
			[1] = 按钮.创建(pwd("85"),0,0,4,true,true,"装备商城"),
			[2] = 按钮.创建(pwd("85"),0,0,4,true,true,"灵饰商城"),
			[3] = 按钮.创建(pwd("85"),0,0,4,true,true,"宝宝商城"),
			[4] = 按钮.创建(pwd("85"),0,0,4,true,true,"银两商城"),
			[5] = 按钮.创建(pwd("85"),0,0,4,true,true,"其他商城"),
			[6] = 按钮.创建(pwd("85"),0,0,4,true,true,"价格排序"),
			[7] = 按钮.创建(pwd("85"),0,0,4,true,true,"时间排序"),
			[8] = 按钮.创建(pwd("85"),0,0,4,true,true,"名称搜索"),
			[9] = 按钮.创建(pwd("85"),0,0,4,true,true,"购买商品"),
			[10] = 按钮.创建(pwd("85"),0,0,4,true,true,"我要出售"),
			[11] = 按钮.创建(pwd("85"),0,0,4,true,true,"我的物品"),
			[12] = pwd("86"),
			[13] = 按钮.创建(pwd("85"),0,0,4,true,true,"上架物品"),
			[14] = 按钮.创建(pwd("85"),0,0,4,true,true,"上架宠物"),
			[15] = 按钮.创建(pwd("85"),0,0,4,true,true,"上架银两"),
			[16] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x7AB5584C),0,0,4,true,true),--按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
			[17] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0xCB50AB1D),0,0,3,true,true),--按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
			[18] = 按钮.创建(pwd("85"),0,0,4,true,true,"取回物品"),
			[19] = 按钮.创建(pwd("85"),0,0,4,true,true,"人物商城"),
			[20] = 按钮.创建(pwd("85"),0,0,4,true,true,"出售角色"),
		}
		self.召唤兽底图 = pwd("92")
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.数据 = 内容
		self.装备 = self.数据.装备
		self.灵饰 = self.数据.灵饰
		self.银子 = self.数据.银两
		self.其他 = self.数据.其他
		self.召唤兽 = self.数据.召唤兽
		self.角色 = self.数据.角色
		self.显示数据 = {}
		self.选中编号 = 0
		self.选中背景 = pwd("90")
		self.界面显示 = 1  --1装备  2出售  3灵饰   4银子  5召唤兽 6其他
		self.显示id = 0
		格子 = tp._物品格子
		for n=1,#self.装备 do
			self.显示数据[n] = 格子.创建(0,0,n,"藏宝阁出售_物品")
			self.显示数据[n]:置物品(self.装备[n].物品)
			self.显示数据[n].价格 = tonumber(self.装备[n].价格)
			self.显示数据[n].结束时间 = self.装备[n].结束时间
			self.显示数据[n].编号 = n
		end
		self.页数 = 0
		self.总页数 = math.ceil(#self.装备/6)
		self.输入框:置可视(true,true)
		self.可视 = true
	end
end


function 藏宝阁类:刷新数据(内容)
	self.数据 = 内容
	self.装备 = self.数据.装备
	self.灵饰 = self.数据.灵饰
	self.银子 = self.数据.银两
	self.其他 = self.数据.其他
	self.召唤兽 = self.数据.召唤兽
	self.角色 = self.数据.角色
	self:重置数据(self.界面显示)
	self.我的数据 = nil
end

function 藏宝阁类:重置数据(类型)
	if 类型 == 1 then
		self.页数 = 0
		self.总页数 = math.ceil(#self.装备/6)
		self.显示数据 = {}
		local 格子 = tp._物品格子
		for n=1,#self.装备 do
			self.显示数据[n] = 格子.创建(0,0,n,"藏宝阁出售_物品")
			self.显示数据[n]:置物品(self.装备[n].物品)
			self.显示数据[n].价格 = tonumber(self.装备[n].价格)
			self.显示数据[n].结束时间 = self.装备[n].结束时间
			self.显示数据[n].编号 = n
		end
	elseif 类型 == 3 then
		self.页数 = 0
		self.总页数 = math.ceil(#self.灵饰/6)
		self.显示数据 = {}
		local 格子 = tp._物品格子
		for n=1,#self.灵饰 do
			self.显示数据[n] = 格子.创建(0,0,n,"藏宝阁出售_物品")
			self.显示数据[n]:置物品(self.灵饰[n].物品)
			self.显示数据[n].价格 = tonumber(self.灵饰[n].价格)
			self.显示数据[n].结束时间 = self.灵饰[n].结束时间
			self.显示数据[n].编号 = n
		end
	elseif 类型 == 4 then
		self.页数 = 0
		self.总页数 = math.ceil(#self.召唤兽/6)
		self.显示数据 = {}
		for n=1,#self.召唤兽 do
			self.显示数据[n]={}
			local xn = 引擎.取头像(self.召唤兽[n].召唤兽.模型)
			self.显示数据[n].小动画 = tp.资源:载入(xn[7],"网易WDF动画",xn[1])
			self.显示数据[n].价格 = tonumber(self.召唤兽[n].价格)
			self.显示数据[n].结束时间 = self.召唤兽[n].结束时间
			self.显示数据[n].编号 = n
			self.显示数据[n].名称 = self.召唤兽[n].召唤兽.名称
			self.显示数据[n].等级 = self.召唤兽[n].召唤兽.等级
			self.显示数据[n].种类 = self.召唤兽[n].召唤兽.种类
		end
	elseif 类型 == 7 then
		self.页数 = 0
		self.总页数 = math.ceil(#self.角色/6)
		self.显示数据 = {}
		for n=1,#self.角色 do
			self.显示数据[n]={}
			local xn = 引擎.取头像(self.角色[n].角色信息.模型)
			self.显示数据[n].小动画 = tp.资源:载入(xn[7],"网易WDF动画",xn[2])
			self.显示数据[n].价格 = tonumber(self.角色[n].价格)
			self.显示数据[n].结束时间 = self.角色[n].结束时间
			self.显示数据[n].编号 = n
			self.显示数据[n].名称 = self.角色[n].角色信息.名称
			self.显示数据[n].等级 = self.角色[n].角色信息.等级
			self.显示数据[n].门派 = self.角色[n].角色信息.门派
		end
	elseif 类型 == 5 then
		self.页数 = 0
		self.总页数 = math.ceil(#self.银子/6)
		self.显示数据 = {}
		for n=1,#self.银子 do
			self.显示数据[n] = {}
			self.显示数据[n].小动画 = tp.资源:载入("item.wdf","网易WDF动画", 0xFA49DAFD)
			self.显示数据[n].价格 = tonumber(self.银子[n].价格)
			self.显示数据[n].结束时间 = self.银子[n].结束时间
			self.显示数据[n].数额 = self.银子[n].数额
			self.显示数据[n].编号 = n
		end
	elseif 类型 == 6 then
		self.页数 = 0
		self.总页数 = math.ceil(#self.其他/6)
		self.显示数据 = {}
		local 格子 = tp._物品格子
		for n=1,#self.其他 do
			self.显示数据[n] = 格子.创建(0,0,n,"藏宝阁出售_物品")
			self.显示数据[n]:置物品(self.其他[n].物品)
			self.显示数据[n].价格 = tonumber(self.其他[n].价格)
			self.显示数据[n].结束时间 = self.其他[n].结束时间
			self.显示数据[n].编号 = n
		end
	end
	self.显示id = 0
	self.选中编号 = 0
end

function 藏宝阁类:更新(dt,x,y)
	if self.界面显示 ~= 2  then
		for i=1,11 do
			self.资源[i]:更新(x,y)
		end
		self.资源[16]:更新(x,y)
		self.资源[17]:更新(x,y)
		self.资源[18]:更新(x,y)
		self.资源[19]:更新(x,y)


		if self.资源[10]:事件判断() then
			self.界面显示 = 2
			self.我的数据 = nil
		elseif self.资源[1]:事件判断() then  --装备
			self:重置数据(1)
			self.界面显示 = 1
			self.我的数据 = nil
		elseif self.资源[2]:事件判断() then  --灵饰
			self:重置数据(3)
			self.界面显示 = 3
			self.我的数据 = nil
		elseif self.资源[3]:事件判断() then --召唤兽
			self:重置数据(4)
			self.界面显示 = 4
			self.我的数据 = nil
		elseif self.资源[4]:事件判断() then --银两
			self:重置数据(5)
			self.界面显示 = 5
			self.我的数据 = nil
		elseif self.资源[5]:事件判断() then --其他
			self:重置数据(6)
			self.界面显示 = 6
			self.我的数据 = nil
		elseif self.资源[19]:事件判断() then --人物
			self:重置数据(7)
			self.界面显示 = 7
			self.我的数据 = nil
		elseif self.资源[6]:事件判断() then --价格排序
			self:价格排序()
			self.我的数据 = nil
		elseif self.资源[7]:事件判断() then --时间排序
			self:时间排序()
			self.我的数据 = nil
		elseif self.资源[8]:事件判断() then --时间排序
			if self.输入框:取文本() == "" then
				tp.提示:写入("#y/请正确输入您要搜索的物品名称")
			else
				self:关键字排序()
				self.我的数据 = nil
			end
		elseif self.资源[9]:事件判断() then
			if self.选中编号 == 0 then
				tp.提示:写入("#y/请选择你要购买的物品")
			else
				发送数据(113,{编号=self.显示数据[self.选中编号].编号,类型=self.界面显示})
			end
		elseif self.资源[18]:事件判断() then
			if self.选中编号 == 0 then
				tp.提示:写入("#y/请选择你要取回的物品")
			else
				发送数据(106,{编号=self.显示数据[self.选中编号].编号,类型=self.界面显示})
			end
		elseif self.资源[11]:事件判断() then
			self:我的排序()
		end

		if self.资源[16]:事件判断() then
			if self.页数 <= 0 then
				tp.提示:写入("#y/当前是第一页了")
			else
				self.页数 = self.页数 -1
			end
		elseif self.资源[17]:事件判断() then
			if self.页数 < self.总页数 - 1 then
				self.页数 = self.页数 + 1
			else
				tp.提示:写入("#y/已经到了最后一页了")
			end
		end
	elseif self.界面显示 == 2 then
		self.资源[13]:更新(x,y)
		self.资源[14]:更新(x,y)
		self.资源[15]:更新(x,y)
		self.资源[20]:更新(x,y)
		if self.背景1:是否选中() and  引擎.鼠标弹起(右键) then
			self:打开()
			return
		end
		if self.资源[13]:事件判断() then --物品
			发送数据(104)
			self:打开()
			return
		elseif self.资源[14]:事件判断() then --召唤兽
			发送数据(109)
			self:打开()
			return
		elseif self.资源[15]:事件判断() then --银两
			发送数据(107)
			self:打开()
			return
		elseif self.资源[20]:事件判断() then --角色
			tp.窗口.藏宝阁角色出售:打开()
			self:打开()
			return
		end
	end
end


function 藏宝阁类:显示(dt,x,y)
	self:更新(dt,x,y)
	self.焦点 = false
	if self.界面显示 ~= 2 then
		self.背景:显示(self.x+50,self.y+50)
		self.资源[1]:显示(self.x+99,self.y+100)
		self.资源[2]:显示(self.x+199,self.y+100)
		self.资源[3]:显示(self.x+299,self.y+100)
		self.资源[4]:显示(self.x+399,self.y+100)
		self.资源[5]:显示(self.x+499,self.y+100)--
		self.资源[6]:显示(self.x+570,self.y+75)
		self.资源[7]:显示(self.x+650,self.y+75)
		self.资源[8]:显示(self.x+490,self.y+75)
		self.资源[9]:显示(self.x+620,self.y+495)
		self.资源[10]:显示(self.x+70,self.y+495)
		self.资源[11]:显示(self.x+170,self.y+495)
		self.资源[12]:显示(self.x+390,self.y+76)
		self.资源[19]:显示(self.x+599,self.y+100)
		self.文字:置颜色(黑色)
	    self.文字:显示(self.x+480,self.y+500,"点卡:"..self.数据.货币)
		if self.页数 > 0  then
			self.资源[16]:显示(self.x+690,self.y+163)
		end
		if self.页数 < self.总页数-1 then
			self.资源[17]:显示(self.x+690,self.y+455)
		end
		if self.我的数据 ~= nil then
			self.资源[18]:显示(self.x+270,self.y+495)
		end
		if self.界面显示 == 1 then
		    self:装备显示(x,y)
		    self.文字:置颜色(白色)
		    self.文字:显示(self.x+200,self.y+137,"装备名称")
		    self.文字:显示(self.x+300,self.y+137,"装备等级")
		    self.文字:显示(self.x+400,self.y+137,"装备类型")
		    self.文字:显示(self.x+500,self.y+137,"购买价格")
		    self.文字:显示(self.x+600,self.y+137,"剩余时间")
		elseif self.界面显示 == 3 then
			self:灵饰显示(x,y)
		    self.文字:置颜色(白色)
			self.文字:显示(self.x+200,self.y+137,"灵饰名称")
		    self.文字:显示(self.x+300,self.y+137,"灵饰等级")
		    self.文字:显示(self.x+400,self.y+137,"灵饰类型")
		    self.文字:显示(self.x+500,self.y+137,"购买价格")
		    self.文字:显示(self.x+600,self.y+137,"剩余时间")
		elseif self.界面显示 == 4 then
			self:召唤兽显示(x,y)
		    self.文字:置颜色(白色)
			self.文字:显示(self.x+200,self.y+137,"宝宝名称")
		    self.文字:显示(self.x+300,self.y+137,"宝宝等级")
		    self.文字:显示(self.x+400,self.y+137,"宝宝类型")
		    self.文字:显示(self.x+500,self.y+137,"购买价格")
		    self.文字:显示(self.x+600,self.y+137,"剩余时间")
		elseif self.界面显示 == 5 then
			self:银子显示(x,y)
			self.文字:置颜色(白色)
			self.文字:显示(self.x+200,self.y+137,"银两名称")
		    self.文字:显示(self.x+300,self.y+137,"银两数量")
		    self.文字:显示(self.x+400,self.y+137,"单价估值")
		    self.文字:显示(self.x+500,self.y+137,"购买价格")
		    self.文字:显示(self.x+600,self.y+137,"剩余时间")
		elseif self.界面显示 == 6 then
			self:其他显示(x,y)
		    self.文字:置颜色(白色)
			self.文字:显示(self.x+200,self.y+137,"物品名称")
		    self.文字:显示(self.x+300,self.y+137,"物品数量")
		    self.文字:显示(self.x+500,self.y+137,"购买价格")
		    self.文字:显示(self.x+600,self.y+137,"剩余时间")
		elseif self.界面显示 == 7 then
			self:角色显示(x,y)
		    self.文字:置颜色(白色)
			self.文字:显示(self.x+200,self.y+137,"名称")
			self.文字:显示(self.x+90,self.y+137,"造型")
		    self.文字:显示(self.x+300,self.y+137,"等级")
		    self.文字:显示(self.x+400,self.y+137,"门派")
		    self.文字:显示(self.x+500,self.y+137,"购买价格")
		    self.文字:显示(self.x+600,self.y+137,"剩余时间")
		end
		self.输入框:置坐标(self.x+392,self.y+78)
		self.控件类:更新(dt,x,y)
		if self.输入框._已碰撞 then
			self.焦点 = true
		end
		self.控件类:显示(x,y)
	else
		self.背景1:显示(self.x+50,self.y+50)
		self.资源[13]:显示(self.x+560,self.y+410)
		self.资源[14]:显示(self.x+350,self.y+410)
		--self.资源[15]:显示(self.x+145,self.y+410)
		self.资源[20]:显示(self.x+350,self.y+460)
	end
end

function 藏宝阁类:银子显示(x,y)
	self.显示id = 0
	for n=1,6 do
		if self.显示数据[n+self.页数*6] ~= nil  then
			if self.显示数据[n+self.页数*6].小动画:是否选中(x,y) then
				self.显示id = n+self.页数*6
			end
			if self.选中编号 == n+self.页数*6 then
				self.选中背景:显示(self.x+80 - 3, self.y+102+n*56)
			end
			self.文字:置颜色(黑色)
			self.显示数据[n+self.页数*6].小动画:显示(self.x+80, self.y+102+n*56)
			self.文字:显示(self.x+210,self.y+122+n*56,"银两")
			self.文字:显示(self.x+298,self.y+122+n*56,math.floor(self.显示数据[n+self.页数*6].数额/10000).."万")
			self.文字:显示(self.x+398,self.y+122+n*56,"约1点="..math.floor(self.显示数据[n+self.页数*6].数额/self.显示数据[n+self.页数*6].价格/10000).."万")
			self.文字:显示(self.x+498,self.y+122+n*56,self.显示数据[n+self.页数*6].价格)
			self.文字:显示(self.x+615,self.y+122+n*56,math.ceil((self.显示数据[n+self.页数*6].结束时间-os.time())/86400).."天")
		end
	end
	if self.显示id ~= 0 then
		if 引擎.鼠标弹起(左键) then
			self.选中编号 = self.显示id
		end
	end
end

function 藏宝阁类:价格排序()
	if  self.价格排序开关 == nil or self.价格排序开关 == 1 then
		table.sort(self.显示数据, function (a, b)
			return a.价格 < b.价格
		end)
		self.价格排序开关 = 2
	elseif self.价格排序开关 == 2 then
		table.sort(self.显示数据, function (a, b)
			return a.价格 > b.价格
		end)
		self.价格排序开关 = 1
	end
end

function 藏宝阁类:时间排序()
if  self.时间排序开关 == nil or self.时间排序开关 == 1 then
		table.sort(self.显示数据, function (a, b)
			return a.结束时间 < b.结束时间
		end)
		self.时间排序开关 = 2
	elseif self.时间排序开关 == 2 then
		table.sort(self.显示数据, function (a, b)
			return a.结束时间 > b.结束时间
		end)
		self.时间排序开关 = 1
	end
end

function 藏宝阁类:我的排序()
	self.文字:置颜色(黑色)
	if self.界面显示 == 1 then
		self.显示数据 = {}
		for n=1,#self.装备 do
			if self.装备[n].所有者 == tp.场景.人物.id  then
				self.显示数据[#self.显示数据+1] = 格子.创建(0,0,n,"藏宝阁出售_物品")
				self.显示数据[#self.显示数据]:置物品(self.装备[n].物品)
				self.显示数据[#self.显示数据].价格 = tonumber(self.装备[n].价格)
				self.显示数据[#self.显示数据].结束时间 = self.装备[n].结束时间
				self.显示数据[#self.显示数据].编号 = n
			end
		end
		self.页数 = 0
		self.总页数 = math.ceil(#self.显示数据/6)
	elseif self.界面显示 == 3 then
		self.显示数据 = {}
		for n=1,#self.灵饰 do
			if self.灵饰[n].所有者 == tp.场景.人物.id  then
				self.显示数据[#self.显示数据+1] = 格子.创建(0,0,n,"藏宝阁出售_物品")
				self.显示数据[#self.显示数据]:置物品(self.灵饰[n].物品)
				self.显示数据[#self.显示数据].价格 = tonumber(self.灵饰[n].价格)
				self.显示数据[#self.显示数据].结束时间 = self.灵饰[n].结束时间
				self.显示数据[#self.显示数据].编号 = n
			end
		end
		self.页数 = 0
		self.总页数 = math.ceil(#self.显示数据/6)
	elseif self.界面显示 == 4 then
		self.显示数据 = {}
		for n=1,#self.召唤兽 do
			if self.召唤兽[n].所有者 == tp.场景.人物.id  then
				self.显示数据[#self.显示数据+1]={}
				local xn = 引擎.取头像(self.召唤兽[n].召唤兽.模型)
				self.显示数据[#self.显示数据].小动画 = tp.资源:载入(xn[7],"网易WDF动画",xn[1])
				self.显示数据[#self.显示数据].价格 = tonumber(self.召唤兽[n].价格)
				self.显示数据[#self.显示数据].结束时间 = self.召唤兽[n].结束时间
				self.显示数据[#self.显示数据].编号 = n
				self.显示数据[#self.显示数据].名称 = self.召唤兽[n].召唤兽.名称
				self.显示数据[#self.显示数据].等级 = self.召唤兽[n].召唤兽.等级
				self.显示数据[#self.显示数据].种类 = self.召唤兽[n].召唤兽.种类
			end
		end
		self.页数 = 0
		self.总页数 = math.ceil(#self.显示数据/6)
	elseif self.界面显示 == 6 then
		self.显示数据 = {}
		for n=1,#self.其他 do
			if self.其他[n].所有者 == tp.场景.人物.id  then
				self.显示数据[#self.显示数据+1] = 格子.创建(0,0,n,"藏宝阁出售_物品")
				self.显示数据[#self.显示数据]:置物品(self.其他[n].物品)
				self.显示数据[#self.显示数据].价格 = tonumber(self.其他[n].价格)
				self.显示数据[#self.显示数据].结束时间 = self.其他[n].结束时间
				self.显示数据[#self.显示数据].编号 = n
			end
		end
		self.页数 = 0
		self.总页数 = math.ceil(#self.显示数据/6)
	elseif 类型 == 7 then
		self.页数 = 0
		self.总页数 = math.ceil(#self.角色/6)
		self.显示数据 = {}
		for n=1,#self.角色 do
			self.显示数据[n]={}
			local xn = 引擎.取头像(self.角色[n].角色信息.模型)
			self.显示数据[n].小动画 = tp.资源:载入(xn[9],"网易WDF动画",xn[8])
			self.显示数据[n].价格 = tonumber(self.角色[n].价格)
			self.显示数据[n].结束时间 = self.角色[n].结束时间
			self.显示数据[n].编号 = n
			self.显示数据[n].名称 = self.角色[n].角色信息.名称
			self.显示数据[n].等级 = self.角色[n].角色信息.等级
			self.显示数据[n].门派 = self.角色[n].角色信息.门派
		end
	end
	self.显示id = 0
	self.选中编号 = 0
	self.我的数据 = true
end

function 藏宝阁类:关键字排序()
	local 关键字 = self.输入框:取文本()
	self.文字:置颜色(黑色)
	if self.界面显示 == 1 then
		self.页数 = 0
		self.总页数 = math.ceil(#self.装备/6)
		self.显示数据 = {}
		for n=1,#self.装备 do
			if self.装备[n].物品.名称 == 关键字 then
				self.显示数据[#self.显示数据+1] = 格子.创建(0,0,n,"藏宝阁出售_物品")
				self.显示数据[#self.显示数据+1]:置物品(self.装备[n].物品)
				self.显示数据[#self.显示数据].价格 = tonumber(self.装备[n].价格)
				self.显示数据[#self.显示数据].结束时间 = self.装备[n].结束时间
				self.显示数据[#self.显示数据].编号 = n
			end
		end
	elseif self.界面显示 == 3 then
		self.页数 = 0
		self.总页数 = math.ceil(#self.灵饰/6)
		self.显示数据 = {}
		for n=1,#self.灵饰 do
			if self.灵饰[n].物品.名称 == 关键字 then
				self.显示数据[#self.显示数据+1] = 格子.创建(0,0,n,"藏宝阁出售_物品")
				self.显示数据[#self.显示数据]:置物品(self.灵饰[n].物品)
				self.显示数据[#self.显示数据].价格 = tonumber(self.灵饰[n].价格)
				self.显示数据[#self.显示数据].结束时间 = self.灵饰[n].结束时间
				self.显示数据[#self.显示数据].编号 = n
			end
		end
	elseif self.界面显示 == 4 then
		self.页数 = 0
		self.总页数 = math.ceil(#self.召唤兽/6)
		self.显示数据 = {}
		for n=1,#self.召唤兽 do
			if self.召唤兽[n].召唤兽.名称 == 关键字 then
				self.显示数据[#self.显示数据+1]={}
				local xn = 引擎.取头像(self.召唤兽[n].召唤兽.模型)
				self.显示数据[#self.显示数据].小动画 = tp.资源:载入(xn[7],"网易WDF动画",xn[1])
				self.显示数据[#self.显示数据].价格 = tonumber(self.召唤兽[n].价格)
				self.显示数据[#self.显示数据].结束时间 = self.召唤兽[n].结束时间
				self.显示数据[#self.显示数据].编号 = n
				self.显示数据[#self.显示数据].名称 = self.召唤兽[n].召唤兽.名称
				self.显示数据[#self.显示数据].等级 = self.召唤兽[n].召唤兽.等级
				self.显示数据[#self.显示数据].种类 = self.召唤兽[n].召唤兽.种类
			end
		end
	elseif self.界面显示 == 6 then
		self.页数 = 0
		self.总页数 = math.ceil(#self.其他/6)
		self.显示数据 = {}
		for n=1,#self.其他 do
			if self.其他[n].物品.名称 == 关键字 then
				self.显示数据[#self.显示数据+1] = 格子.创建(0,0,n,"藏宝阁出售_物品")
				self.显示数据[#self.显示数据]:置物品(self.其他[n].物品)
				self.显示数据[#self.显示数据].价格 = tonumber(self.其他[n].价格)
				self.显示数据[#self.显示数据].结束时间 = self.其他[n].结束时间
				self.显示数据[#self.显示数据].编号 = n
			end
		end
	elseif 类型 == 7 then
		self.页数 = 0
		self.总页数 = math.ceil(#self.角色/6)
		self.显示数据 = {}
		for n=1,#self.角色 do
			self.显示数据[n]={}
			local xn = 引擎.取头像(self.角色[n].角色信息.模型)
			self.显示数据[n].小动画 = tp.资源:载入(xn[9],"网易WDF动画",xn[8])
			self.显示数据[n].价格 = tonumber(self.角色[n].价格)
			self.显示数据[n].结束时间 = self.角色[n].结束时间
			self.显示数据[n].编号 = n
			self.显示数据[n].名称 = self.角色[n].角色信息.名称
			self.显示数据[n].等级 = self.角色[n].角色信息.等级
			self.显示数据[n].门派 = self.角色[n].角色信息.门派
		end

	end
	self.显示id = 0
	self.选中编号 = 0
end

function 藏宝阁类:召唤兽显示(x,y)
	self.右键关闭 = nil
	self.显示id = 0
	self.文字:置颜色(黑色)
	for n=1,6 do
		if self.显示数据[n+self.页数*6] ~= nil  then
			self.召唤兽底图:显示(self.x+82, self.y+105+n*56)
			if self.显示数据[n+self.页数*6].小动画:是否选中(x,y) then
				self.显示id = n+self.页数*6
				if 引擎.鼠标弹起(右键) then
					self.右键关闭 = true
					tp.窗口.召唤兽查看栏:打开(self.召唤兽[self.显示id].召唤兽)
				end
			end
			if self.选中编号 == n+self.页数*6 then
				self.选中背景:显示(self.x+80 - 3, self.y+102+n*56)
			end
			self.显示数据[n+self.页数*6].小动画:显示(self.x+82, self.y+105+n*56)
			self.文字:显示(self.x+198,self.y+122+n*56,self.显示数据[n+self.页数*6].名称)
			self.文字:显示(self.x+305,self.y+122+n*56,self.显示数据[n+self.页数*6].等级)
			self.文字:显示(self.x+398,self.y+122+n*56,self.显示数据[n+self.页数*6].种类)
			self.文字:显示(self.x+498,self.y+122+n*56,self.显示数据[n+self.页数*6].价格)
			self.文字:显示(self.x+615,self.y+122+n*56,math.ceil((self.显示数据[n+self.页数*6].结束时间-os.time())/86400).."天")
		end
	end
	if self.显示id ~= 0 then
		if 引擎.鼠标弹起(左键) then
			self.选中编号 = self.显示id
		end
	end
end

function 藏宝阁类:角色显示(x,y)
	self.右键关闭 = nil
	self.显示id = 0
	self.文字:置颜色(黑色)
	for n=1,6 do
		if self.显示数据[n+self.页数*6] ~= nil  then
			if self.显示数据[n+self.页数*6].小动画:是否选中(x,y) then
				self.显示id = n+self.页数*6
				if 引擎.鼠标弹起(右键) then
					self.右键关闭 = true
					发送数据(112,{编号=self.显示数据[self.显示id].编号,名称=self.显示数据[n+self.页数*6].名称})
				end
			end
			if self.选中编号 == n+self.页数*6 then
				self.选中背景:显示(self.x+80 - 3, self.y+102+n*56)
			end
			self.显示数据[n+self.页数*6].小动画:显示(self.x+77, self.y+105+n*56)
			self.文字:显示(self.x+195,self.y+122+n*56,self.显示数据[n+self.页数*6].名称)
			-- self.文字:显示(self.x+305,self.y+122+n*56,self.显示数据[n+self.页数*6].模型)
			self.文字:显示(self.x+305,self.y+122+n*56,self.显示数据[n+self.页数*6].等级)
			self.文字:显示(self.x+398,self.y+122+n*56,self.显示数据[n+self.页数*6].门派)
			self.文字:显示(self.x+498,self.y+122+n*56,self.显示数据[n+self.页数*6].价格)
			self.文字:显示(self.x+615,self.y+122+n*56,math.ceil((self.显示数据[n+self.页数*6].结束时间-os.time())/86400).."天")
		end
	end
	if self.显示id ~= 0 then
		if 引擎.鼠标弹起(左键) then
			self.选中编号 = self.显示id
		end
	end
end

function 藏宝阁类:灵饰显示(x,y)
	self.文字:置颜色(黑色)
	for n=1,6 do
		if self.显示数据[n+self.页数*6] ~= nil and self.显示数据[n+self.页数*6].物品 ~= nil then
			if self.显示数据[n+self.页数*6].焦点 and not tp.消息栏焦点 then
				tp.提示:道具行囊(x,y,self.显示数据[n+self.页数*6].物品)
				if 引擎.鼠标弹起(左键) then
					self.选中编号 = n+self.页数*6
				end
				self.显示id = n+self.页数*6
			end
			if self.选中编号 == n+self.页数*6 then
				self.选中背景:显示(self.x+80 - 3, self.y+102+n*56)
			end
			self.显示数据[n+self.页数*6]:置坐标(self.x+76, self.y+104+n*56)
			self.显示数据[n+self.页数*6]:显示(dt,x,y,self.鼠标)
			self.文字:显示(self.x+198,self.y+122+n*56,self.显示数据[n+self.页数*6].物品.名称)
			self.文字:显示(self.x+305,self.y+122+n*56,self.显示数据[n+self.页数*6].物品.级别限制 or "")
			self.文字:显示(self.x+405,self.y+122+n*56,"灵饰")
			self.文字:显示(self.x+498,self.y+122+n*56,self.显示数据[n+self.页数*6].价格)
			self.文字:显示(self.x+615,self.y+122+n*56,math.ceil((self.显示数据[n+self.页数*6].结束时间-os.time())/86400).."天")
		end
	end
end

function 藏宝阁类:装备显示(x,y)
	self.文字:置颜色(黑色)
	for n=1,6 do
		if self.显示数据[n+self.页数*6] ~= nil and self.显示数据[n+self.页数*6].物品 ~= nil then
			if self.显示数据[n+self.页数*6].焦点 and not tp.消息栏焦点 then
				tp.提示:道具行囊(x,y,self.显示数据[n+self.页数*6].物品)
				if 引擎.鼠标弹起(左键) then
					self.选中编号 = n+self.页数*6
				end
				self.显示id = n+self.页数*6
			end
			if self.选中编号 == n+self.页数*6 then
				self.选中背景:显示(self.x+80 - 3, self.y+102+n*56)
			end
			self.显示数据[n+self.页数*6]:置坐标(self.x+76, self.y+104+n*56)
			self.显示数据[n+self.页数*6]:显示(dt,x,y,self.鼠标)
			self.文字:显示(self.x+198,self.y+122+n*56,self.显示数据[n+self.页数*6].物品.名称)
			self.文字:显示(self.x+305,self.y+122+n*56,self.显示数据[n+self.页数*6].物品.级别限制 or "无")
			self.文字:显示(self.x+405,self.y+122+n*56,"装备")
			self.文字:显示(self.x+498,self.y+122+n*56,self.显示数据[n+self.页数*6].价格)
			self.文字:显示(self.x+615,self.y+122+n*56,math.ceil((self.显示数据[n+self.页数*6].结束时间-os.time())/86400).."天")
		end
	end
end

function 藏宝阁类:其他显示(x,y)
	self.文字:置颜色(黑色)
	for n=1,6 do
		if self.显示数据[n+self.页数*6] ~= nil and self.显示数据[n+self.页数*6].物品 ~= nil then
			if self.显示数据[n+self.页数*6].焦点 and not tp.消息栏焦点 then
				tp.提示:道具行囊(x,y,self.显示数据[n+self.页数*6].物品)
				if 引擎.鼠标弹起(左键) then
					self.选中编号 = n+self.页数*6
				end
				self.显示id = n+self.页数*6
			end
			if self.选中编号 == n+self.页数*6 then
				self.选中背景:显示(self.x+80 - 3, self.y+102+n*56)
			end
			self.显示数据[n+self.页数*6]:置坐标(self.x+76, self.y+104+n*56)
			self.显示数据[n+self.页数*6]:显示(dt,x,y,self.鼠标)
			self.文字:显示(self.x+198,self.y+122+n*56,self.显示数据[n+self.页数*6].物品.名称)
			self.文字:显示(self.x+305,self.y+122+n*56,self.显示数据[n+self.页数*6].等级 or "无")
			self.文字:显示(self.x+335,self.y+122+n*56,self.显示数据[n+self.页数*6].类型)
			self.文字:显示(self.x+498,self.y+122+n*56,self.显示数据[n+self.页数*6].价格)
			self.文字:显示(self.x+615,self.y+122+n*56,math.ceil((self.显示数据[n+self.页数*6].结束时间-os.time())/86400).."天")
		end
	end
end







function 藏宝阁类:检查点(x,y)
	if self.背景:是否选中(x,y)  then
		return true
	end
end

function 藏宝阁类:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
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

function 藏宝阁类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end


return 藏宝阁类