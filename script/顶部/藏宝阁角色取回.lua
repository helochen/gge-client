
local 藏宝阁角色出售 = class()
local tp

function 藏宝阁角色出售:初始化(根)
	tp = 根
	self.ID = 106
	self.x = 全局游戏宽度/2-600/2
	self.y = 全局游戏高度/2-432/2
	self.xx = 0
	self.yy = 0
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	self.金钱文字 = tp.字体表.普通字体

	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.出售银两 = 总控件:创建输入("银两输入",0,0,100,14)
	self.出售银两:置可视(false,false)
	self.出售银两:置限制字数(8)
	self.出售银两:置数字模式()
	self.出售银两:屏蔽快捷键(true)
	self.出售银两:置光标颜色(-16777216)
	self.出售银两:置文字颜色(-16777216)

	self.出售价格 = 总控件:创建输入("价格输入",0,0,100,14)
	self.出售价格:置可视(false,false)
	self.出售价格:置限制字数(8)
	self.出售价格:置数字模式()
	self.出售价格:屏蔽快捷键(true)
	self.出售价格:置光标颜色(-16777216)
	self.出售价格:置文字颜色(-16777216)
end
function 藏宝阁角色出售:打开(内容)
	if self.可视 then
		self.可视 = false
		self.出售银两:置可视(false,false)
		self.出售价格:置可视(false,false)
	else
		table.insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.背景 = pwd("94")
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.存入 = tp._按钮.创建(tp._自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取回 ")
		self.取消 = tp._按钮.创建(tp._自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取消 ")
		self.出售银两:置可视(true)
		self.出售价格:置可视(true)
		self.可视 = true
	end
end

function 藏宝阁角色出售:更新(dt)
end


function 藏宝阁角色出售:显示(dt,x,y)
	self.焦点 = false
	self.存入:更新(x,y)
	self.取消:更新(x,y)
	self.背景:显示(self.x,self.y)
	self.出售银两:置坐标(self.x+95,self.y+75)
	self.出售价格:置坐标(self.x+95,self.y+105)
	self.存入:显示(self.x+30,self.y+145)
	self.取消:显示(self.x+120,self.y+145)
	if self.取消:事件判断() then
		self:打开()
		return
	elseif self.存入:事件判断() then
		if tonumber(self.出售银两:取文本()) == nil or tonumber(self.出售价格:取文本()) == nil then
    		tp.提示:写入("#Y/请正确输入ID以及密码！")
			return
		end
        发送数据(114,{编号=self.出售银两:取文本()+0,价格=self.出售价格:取文本()+0})
	end
	-- if self.出售价格._已碰撞 then
	-- 	self.焦点 = true
	-- end
	-- if self.出售银两._已碰撞 then
	-- 	self.焦点 = true
	-- end
	self.控件类:更新(dt,x,y)
	self.控件类:显示(x,y)
end

function 藏宝阁角色出售:检查点(x,y)
	if self.背景:是否选中(x,y)  then
		return true
	end
end

function 藏宝阁角色出售:初始移动(x,y)
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

function 藏宝阁角色出售:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end


return 藏宝阁角色出售