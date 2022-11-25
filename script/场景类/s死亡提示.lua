--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-09-05 01:48:03
--================,======================================================--
local 场景类_宠物领养栏 = class()
local insert = table.insert
function 场景类_宠物领养栏:初始化(根)
	self.ID = 15
	self.x = 130
	self.y = 35
	self.xx = 0
	self.yy = 0
	self.注释 = "宠物领养栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
	zts1 = 根.字体表.描边字体
end

function 场景类_宠物领养栏:打开()
	if self.可视 then
		self.选中宠物 = 0
		self.可视 = false
		self.资源组 = nil
		self.宠物说明 = nil
		self.动画组 = nil
		return
	else
		insert(tp.窗口_,self)
		self:加载数据()
		self.选中宠物 = 0
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 场景类_宠物领养栏:加载数据()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 资源:载入('自用',"网易WDF动画",0x026547C3),
	}
	if 取随机数(1,100)<=40 then
		self.资源组[1]=资源:载入('自用',"网易WDF动画",0x026547C4)
	end
	if 取随机数(1,100)<=40 then
		self.资源组[1]=资源:载入('自用',"网易WDF动画",0x026547C5)
	end
end

function 场景类_宠物领养栏:显示(dt,x,y)
	self.资源组[1]:显示(self.x,self.y)
end

function 场景类_宠物领养栏:检查点(x,y)
	if self.资源组~=nil and  self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_宠物领养栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_宠物领养栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_宠物领养栏