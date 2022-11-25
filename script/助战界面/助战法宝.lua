--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-09-13 22:34:37
--======================================================================--
local 助战法宝 = class()

local floor = math.floor
local tp,zts1
local insert = table.insert


function 助战法宝:初始化(根)
	self.ID = 41
	self.xx = 0
	self.yy = 0
	self.x = 312
	self.y = 1
	self.注释 = "法宝"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	zts1 = tp.字体表.描边字体
	self.窗口时间 = 0
end

function 助战法宝:打开(数据)
	if self.可视 then
		self.可视 = false
		self.资源组 = nil
		self.物品 = nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.资源组 = {
			[1] = 自适应.创建(0,1,129,170,3,9),
			[2] = 自适应.创建(1,1,99,18,1,3,nil,18),
		}
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 助战法宝:刷新(数据)

end

function 助战法宝:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+6,self.y+3)
	tp.窗口标题背景_:置区域(0,0,40,16)
	tp.窗口标题背景_:显示(self.x+37,self.y+3)
	zts1:置字间距(3)
	zts1:显示(self.x+41,self.y+3,"法宝")
	zts1:置字间距(0)
	local xx = 0
	local yy = 1
end


function 助战法宝:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 助战法宝:初始移动(x,y)
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

function 助战法宝:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 助战法宝