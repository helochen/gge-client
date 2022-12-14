--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-09-13 22:34:37
--======================================================================--
local 助战锦衣 = class()

local floor = math.floor
local tp,zts1
local insert = table.insert


function 助战锦衣:初始化(根)
	self.ID = 41
	self.xx = 0
	self.yy = 0
	self.x = 312
	self.y = 1
	self.注释 = "锦衣"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	zts1 = tp.字体表.描边字体
	self.窗口时间 = 0
end

function 助战锦衣:打开(数据)
	if self.可视 then
		for i=1,4 do
			self.物品[i]:置物品(nil)
		end
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
			[2] = 按钮(资源:载入('wzife.wdf',"网易WDF动画",0xF11233BB),0,0,4,true,true),
			[3] = 自适应.创建(1,1,99,18,1,3,nil,18),
			[4] = 资源:载入('wzife.wd1',"网易WDF动画",0x219FF008),
			[5] = 资源:载入('wzife.wdf',"网易WDF动画",0xC0520208),
			[6] = 资源:载入('wzife.wd2',"网易WDF动画",0xC2966B6F),
			[7] = 资源:载入('wzife.wdf',"网易WDF动画",0xCF39217A),
			[8] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"隐藏 "),
		}
		self.资源组[2]:绑定窗口_(41)
		self.资源组[8]:绑定窗口_(41)
		self.物品 = {}
		锦衣 = 数据.锦衣
		self.编号 = 数据.编号
		local 格子 = tp._物品格子
		for i=1,4 do
			self.物品[i] = 格子(0,0,i,"道具行囊_锦衣",tp.底图)
		end
		for i=1,4 do
			if 锦衣 ~= nil and 锦衣[i] ~= nil and 锦衣[i].名称 ~= nil then
				self.物品[i]:置物品(锦衣[i])
			end
		end
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 助战锦衣:刷新(数据)
锦衣 = 数据.锦衣
	for i=1,4 do
		self.物品[i]:置物品(nil)
		if 锦衣 ~= nil and 锦衣[i] ~= nil and  锦衣[i].名称 ~= nil then
			self.物品[i]:置物品(锦衣[i])
		end
	end
end

function 助战锦衣:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[8]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	end
	if self.资源组[8]:事件判断() then
		--发送数据(26.2)
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[3]:显示(self.x+6,self.y+3)
	self.资源组[2]:显示(self.x+106,self.y+6)
	self.资源组[8]:显示(self.x+38,self.y+140)
	tp.窗口标题背景_:置区域(0,0,40,16)
	tp.窗口标题背景_:显示(self.x+37,self.y+3)
	zts1:置字间距(3)
	zts1:显示(self.x+41,self.y+3,"锦衣")
	zts1:置字间距(0)
	local xx = 0
	local yy = 1
	for i=1,4 do
		xx = xx + 1
		self.资源组[3+i]:显示(self.x + xx * 58-49,self.y + yy * 57-31)
		self.物品[i]:置坐标(self.x + xx * 58-46,self.y + yy * 57-30)
		self.物品[i]:显示(dt,x,y,self.鼠标,nil,0.7)
		if self.物品[i].物品 ~= nil and self.物品[i].焦点 then
			tp.提示:道具行囊(x,y,self.物品[i].物品,true)
		end
		if xx >= 2 then
			xx = 0
			yy = yy + 1
		end
		if self.物品[i].事件 then
			if tp.场景.抓取物品 ~= nil and self.物品[i].物品 == nil and self.物品[i].焦点 then

			elseif tp.场景.抓取物品 ~= nil and self.物品[i].物品 ~= nil and self.物品[i].焦点 then

			elseif tp.场景.抓取物品 == nil and self.物品[i].物品 ~= nil and self.物品[i].焦点 then
				--if self.物品[i].物品.分类 == 15 then
				--	tp.队伍[1].锦衣[1] = {}
				--	tp.场景.人物:置模型()
				--elseif self.物品[i].物品.分类 == 16 then
				--	tp.场景.人物:卸下光环()
				--elseif self.物品[i].物品.分类 == 17 then
				--	tp.场景.人物:卸下足迹()
				--end
				--发送数据(26.3)
				发送数据(78.3,{编号=self.编号,物品编号=i})
			end
		elseif self.物品[i].右键 then
			if  self.物品[i].物品 ~= nil then
				--if self.物品[i].物品.分类 == 15 then
				--	tp.队伍[1].锦衣[1] = {}
				--	tp.场景.人物:置模型()
				--elseif self.物品[i].物品.分类 == 16 then
				--	tp.场景.人物:卸下光环()
				--elseif self.物品[i].物品.分类 == 17 then
				--	tp.场景.人物:卸下足迹()
				--end
				--发送数据(26.3)
			    发送数据(78.3,{编号=self.编号,物品编号=i})
			end
		end
	end
end


function 助战锦衣:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 助战锦衣:初始移动(x,y)
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

function 助战锦衣:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 助战锦衣