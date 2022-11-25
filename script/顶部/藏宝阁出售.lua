
local 藏宝阁出售 = class()
local bw = require("gge包围盒")(150,192,64,18)

local tp
function 藏宝阁出售:初始化(根)
	self.ID = 101
	self.可视 = false
	self.x = 全局游戏宽度/2-600/2
	self.y = 全局游戏高度/2-432/2
	self.xx = 0
	self.yy = 0
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	self.窗口时间 = 0
	zts = tp.字体表.普通字体

	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("银两输入",0,0,100,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(10)
	self.输入框:置数字模式()
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
end

function 藏宝阁出售:打开(内容,类型)
	if self.可视 then
		self.可视 = false
		self.输入框:置可视(false,false)
	else
		table.insert(tp.窗口_,self)
	    local 资源 = tp.资源
		local 自适应 = tp._自适应
		local 按钮 = tp._按钮
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.背景 = pwd("89")  --物品
		self.召唤兽背景 = pwd("88")
		self.显示模式 = 1
		self.出售 = 按钮.创建(pwd("85"),0,0,4,true,true,"上架商品")
		self.选中背景 = pwd("90")
		self.选中背景1 = pwd("91")
		if 类型 == "召唤兽" then
			self.显示模式 = 2
			self.bb数据 = 内容
			self.bb选中 = 0
		else
			self.物品列表 = 内容.道具
			self.物品数据 = {}
			self.选中编号 = 0
			self.物品 = {}
			local 格子 = tp._物品格子
			for i=1,20 do
				self.物品[i] = 格子.创建(0,0,i,"藏宝阁出售_物品")
			end
			for i=1,20 do
				self.物品[i]:置物品(self.物品列表[i])
			end
		end
		self.输入框:置可视(true,true)
		self.可视 = true
	end
end

function 藏宝阁出售:更新(dt,x,y)
	self.出售:更新(x,y)
	if self.背景:是否选中() and  引擎.鼠标弹起(右键) then
		self:打开()
		self.显示模式 = 1
		return
	end
	if self.召唤兽背景:是否选中() and  引擎.鼠标弹起(右键) then
		self:打开()
		self.显示模式 = 1
		return
	end
	if self.出售:事件判断() then
	   if self.显示模式 == 1 then
   			if self.选中编号 == 0 then
   				tp.提示:写入("#y/请先选中一个物品")
				return 0
   			elseif tonumber(self.输入框:取文本()) == nil then
   				tp.提示:写入("#y/请输入你要出售的价格")
				return 0
			elseif 	tonumber(self.输入框:取文本()) >= 5000 then
				tp.提示:写入("#y/上架金额不能超过五千点卡")
				return 0
   			else
   				发送数据(105,{编号=self.选中编号,价格=self.输入框:取文本()})
   			end
			self:打开()
			self.显示模式 = 1
			return
	   elseif self.显示模式 == 2 then
   			if self.bb选中 == 0 then
   				tp.提示:写入("#y/请先选中一个召唤兽")
				return 0
   			elseif tonumber(self.输入框:取文本()) == nil then
   				tp.提示:写入("#y/请输入你要出售的价格")
				return 0
			elseif 	tonumber(self.输入框:取文本()) >= 5000 then
				tp.提示:写入("#y/上架金额不能超过五千点卡")
				return 0
   			else
   				发送数据(110,{编号=self.bb选中,价格=self.输入框:取文本()})
   			end
			self:打开()
			self.显示模式 = 1
			return
	   end
	end
end

function 藏宝阁出售:显示(dt,x,y)
	self:更新(dt,x,y)
	self.右键关闭 = nil
	if self.显示模式 == 1  then
		self.输入框:置坐标(self.x + 295,self.y + 350)
		self.背景:显示(325,160)
		self.显示id = 0
		local xx = 0
		local yy = 0
		for i=1,20 do
			if  self.物品~=nil and self.物品[i]~=nil and self.物品[i].物品~=nil then
				self.物品[i]:置坐标(self.x + xx * 51 + 220,self.y + yy * 51 + 108)
				self.物品[i]:显示(dt,x,y,self.鼠标)
				if self.物品[i].焦点 and not tp.消息栏焦点 then
					tp.提示:道具行囊(x,y,self.物品[i].物品)
					if 引擎.鼠标弹起(左键) then
						self.选中编号 = i
					end
					self.焦点 = true
				end
			end
			if self.选中编号 == i then
				self.选中背景:显示(self.x + xx * 51 + 220,self.y + yy * 51 + 108)
			end
			xx = xx + 1
			if xx == 5 then
				xx = 0
				yy = yy + 1
			end
		end
	else
		self.召唤兽背景:显示(265,142)
		self.输入框:置坐标(self.x + 235,self.y + 340)
		for n = 1, 10, 1 do
			if self.bb数据[n] ~= nil then
				if self.bb选中 == n then
					self.选中背景1:显示(284, 178 + 19 * n)
				end
				zts:置颜色(黑色):显示(286, 180 + 19 * n, self.bb数据[n].名称)
				bw:置坐标(284, 178 + 19 * n)
				if bw:检查点(x,y) then
					if 引擎.鼠标弹起(左键) then
						self.bb选中 = n
					elseif 引擎.鼠标弹起(右键) then
						self.右键关闭 = true
						tp.窗口.召唤兽查看栏:打开(self.bb数据[n])
					end
				end
			end
		end
	end
	self.控件类:更新(dt,x,y)
		if self.输入框._已碰撞 then
			self.焦点 = true
		end
	self.控件类:显示(x,y)
	self.出售:显示(500,442)
end

function 藏宝阁出售:检查点(x,y)
	if self.背景:是否选中(x,y) or self.召唤兽背景:是否选中(x,y)  then
		return true
	end
end

function 藏宝阁出售:初始移动(x,y)
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

function 藏宝阁出售:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 藏宝阁出售