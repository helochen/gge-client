local 魂环穿戴与洗练 = class()

local floor = math.floor
local min = math.min
local tp,zts1,zts2
local xxx = 0
local yyy = 0
local max = 1
local insert = table.insert
local mouseb = 引擎.鼠标弹起
local ARGB = ARGB
local wz = require("gge文字类")

function 魂环穿戴与洗练:初始化(根)
	self.ID = 41
	--宽高 549 431
	self.x = 330
	self.y = 280
	self.xx = 0
	self.yy = 0
	self.注释 = "魂环洗练"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.状态 = 1
	self.窗口时间 = 0
	tp = 根
	self.分类选中=""
	self.子类选中=""
	self.玩法介绍内容=""

end
function 魂环穿戴与洗练:打开(内容)
	if self.可视 then
		self.可视 = false
		self.资源组 = nil
		self.数据=nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 自适应 = tp._自适应
		local 按钮 = tp._按钮
		self.资源组 = {
		    [0] = 自适应.创建(1,1,332,18,1,3,nil,18),
			[1] = 自适应.创建(0,1,200,100,3,9),
			[2] = 按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true," 穿 戴"),
			[3] = 按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true," 洗 练"),
		}
		self.窗口时间 = tp.运行时间
		self.可视 = true
		self.魂环=内容.魂环
		self.魂环角色id=内容.魂环角色id
		self.魂环道具id=内容.魂环道具id
	end
end
function 魂环穿戴与洗练:刷新(内容)
    self.数据=内容
end
function 魂环穿戴与洗练:显示(dt,x,y)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[2]:显示(self.x+35,self.y+50)
	self.资源组[3]:显示(self.x+105,self.y+50)
	if self.资源组[2]:事件判断() then
		if tp.窗口.灵饰.可视 ~= true then
			tp.窗口.灵饰:打开(self.x-20,self.y-176)
		end
	  发送数据(3703,{类型="道具",道具=self.魂环角色id,魂环="魂环"})
	  self.可视= false
	elseif self.资源组[3]:事件判断() then
	  tp.窗口.魂环洗练:打开(self.魂环,self.魂环道具id)
	  self.可视= false
	end
end
function 魂环穿戴与洗练:检查点(x,y)
	if self.可视 and self.资源组[1] ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 魂环穿戴与洗练:初始移动(x,y)
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

function 魂环穿戴与洗练:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 魂环穿戴与洗练