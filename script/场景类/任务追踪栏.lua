--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-10-02 18:47:30
--======================================================================--
local 场景类_任务追踪栏 = class()

local floor = math.floor
local format = string.format
local insert = table.insert
local remove = table.remove
local tp
local xxx = 0
local yyy = 0
local box = 引擎.画矩形
local min = math.min
local max = math.max
local ceil = math.ceil
local mousea = 引擎.鼠标按下
local mouseb = 引擎.鼠标弹起

function 场景类_任务追踪栏:初始化(根)
	self.x = 全局游戏宽度-200
	self.y = 100
	self.xx = 0
	self.yy = 0
	self.焦点 = false
	self.移动窗口 = false
	self.可移动窗口 = false
	local 资源 = 根.资源
	local 按钮 = require("script/系统类/按钮")
	tp = 根
	self.资源组 = {
		[1] = 根._自适应.创建(71,1,1,1,3,9),
		[2] = 按钮(资源:载入('wzife.wd4',"网易WDF动画",0xD465F50F),0,0,4),
		[3] = 按钮(资源:载入('wzife.wd4',"网易WDF动画",0x44F2D2D3),0,0,4),--任务0xfcd5c71c
		[4] = 按钮(资源:载入('wzife.wd4',"网易WDF动画",0x77608510),0,0,4),
		[5] = 按钮(资源:载入('wzife.wd4',"网易WDF动画",0x335CECBC),0,0,4),--右箭头0x9c17654c
		[6] = tp._滑块(资源:载入('wzife.wd4',"网易WDF动画",0x7F027E7B),4,10,139,2),
		[7] = 按钮(资源:载入('wzife.wd4',"网易WDF动画",0xB7F2FF5E),0,0,4),
		[8] = 按钮(资源:载入('wzife.wd4',"网易WDF动画",0x36DDB607),0,0,4),
		[9] = 根._自适应.创建(75,1,1,1,3,9),
		[10] = 资源:载入('common/item.wdf',"网易WDF动画",1928344100),
		[11] = 资源:载入('common/item.wdf',"网易WDF动画",0xCDDC07C1),
	}
	self.资源组[1]:置宽高(200,30)
	self.资源组[9]:置宽高(200,177)
	self.状态 = 2
	self.介绍加入 = 0
	self.窗口时间 = 0
	self.罗羹效果 = false
	self.介绍文本 = require("script/系统类/丰富文本")(180,170)
	:添加元素("L",-16776961)
	self.task = 根.任务列表
	self.数据记录={}
	self.wz文字 = require("gge文字类").创建(wdf配置.."/font/hyh1gjm.ttf",21,false,true,false)
end

function 场景类_任务追踪栏:加载(名称_,介绍_,描述_,取中间数据_)
	insert(self.task,{名称=名称_,介绍=介绍_,描述=描述_,取中间数据=取中间数据_})
	self.介绍文本:清空()
	for i=1,#self.task do
		if self.task[i].名称=="摄妖香" and self.task[i].取中间数据~=nil and self.task[i].取中间数据>0 then
		    引擎.场景.摄妖香剩余功效时辰=self.task[i].取中间数据
		else
			if self.task[i].名称=="罗羹效果" then
			    self.罗羹效果=true
			end
			self.介绍文本:添加文本(format("#G/%s\n◆%s",self.task[i].名称,self.task[i].介绍))
		end
	    if i < #self.task then
		    self.介绍文本:添加文本("")
		end
	end
	for i=1,#self.介绍文本.显示表 - 10 do
		self.介绍文本:滚动(1)
	end
	if #self.介绍文本.显示表 > 10 and self.介绍加入 ~= 0 then
		self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.介绍加入+1,10,#self.介绍文本.显示表))
		self.介绍加入 = min(ceil((#self.介绍文本.显示表-10)*self.资源组[6]:取百分比()),#self.介绍文本.显示表-10)
		self.介绍文本.加入 = self.介绍加入
	end
end

function 场景类_任务追踪栏:修改内容(名称,内容,描述,取中间数据_)
	for i=1,#self.task do
		if self.task[i].名称 == 名称 then
		   	self.task[i].介绍 = 内容
		   	self.task[i].描述 = 描述
		   	if self.选中 ~= 0 and self.task[self.选中].名称 == 名称  then
		   		self.介绍文本:清空()
				if 描述 ~= nil then
					self.介绍文本:添加文本("")
					self.介绍文本:添加文本("")
					self.介绍文本:添加文本("#ms")
					self.介绍文本:添加文本("#L/"..描述)
				end
				for i=1,#self.介绍文本.显示表 - 13 do
					self.介绍文本:滚动(1)
				end
				-- self.资源组[6]:置起始点(0)
				self.介绍加入 = 0
		   	end
		   	break
		end
	end
end

function 场景类_任务追踪栏:删除(名称)
	for i=1,#self.task do
	    if self.task[i].名称 == 名称 then
	    	if #self.task > 12 then
		    	self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.加入-1,11,#self.task))
		    	self.选中 = self.选中 - 1
		    else
		    	self.选中 = max(self.选中 - 1,0)
		    	self.加入 = 0
		    end
	    	if self.状态 == 1 and self.选中 ~= 0 and 名称 == self.task[self.选中].名称 then
	    		self.介绍文本:清空()
	    	end
		   	remove(self.task,i)
		   	break
		end
	end
end

function 场景类_任务追踪栏:刷新(名称,介绍,描述,取中间数据_)
	self.数据记录[#self.数据记录+1]={名称=名称,介绍=介绍,描述=描述_,取中间数据=取中间数据_}
	self.介绍文本:清空()
	local 聂妖香 = false
	local 聂妖香 = false
	local 变身卡 = false
	local 双倍 = false
	local 三倍 = false
	local 罗羹效果 = false
	for i=1,#self.数据记录 do
		if self.数据记录[i].名称=="摄妖香"  then
			tp.窗口.人物框:加入小图标信息(3,介绍)
		    聂妖香 =true
		elseif self.数据记录[i].名称=="变身卡"  then
			tp.窗口.人物框:加入小图标信息(4,介绍)
		    变身卡 =true
		elseif self.数据记录[i].名称=="双倍时间"  then
			tp.窗口.人物框:加入小图标信息(1,介绍)
		    双倍 =true
		elseif self.数据记录[i].名称=="精修时间"  then
			tp.窗口.人物框:加入小图标信息(2,介绍)
		    三倍 =true
		elseif self.数据记录[i].名称=="罗羹效果"  then
			tp.窗口.人物框:删除小图标信息(5)
			tp.窗口.人物框:加入小图标信息(5,介绍)
		    罗羹效果 =true

		else
			self.介绍文本:添加文本(format("#R/%s\n◆%s",self.数据记录[i].名称,self.数据记录[i].介绍))
		    if i < #self.数据记录 then
			    self.介绍文本:添加文本("")
			end
		end
	end
	if not 聂妖香 then
		tp.窗口.人物框:删除小图标信息(3)
	end
	if not 变身卡 then
		tp.窗口.人物框:删除小图标信息(4)
	end
	if not 双倍 then
		tp.窗口.人物框:删除小图标信息(1)
	end
	if not 三倍 then
		tp.窗口.人物框:删除小图标信息(2)
	end
	if not 罗羹效果 then
		tp.窗口.人物框:删除小图标信息(5)
	end
	for i=1,#self.介绍文本.显示表 - 10 do
		self.介绍文本:滚动(1)
	end
	if #self.介绍文本.显示表 > 10 and self.介绍加入 ~= 0 then
		self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.介绍加入+1,10,#self.介绍文本.显示表))
		self.介绍加入 = min(ceil((#self.介绍文本.显示表-10)*self.资源组[6]:取百分比()),#self.介绍文本.显示表-10)
		self.介绍文本.加入 = self.介绍加入
	end
end

function 场景类_任务追踪栏:显示(dt,x,y)
	if not tp.剧情开关.任务追踪 then
		return
	end
	self.x = 全局游戏宽度-200
	self.焦点 = false
	self.资源组[self.状态]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	if self.资源组[self.状态]:事件判断(x,y) then
		if self.状态 == 2 then
			self.状态 = 8
			self.可移动窗口 = true
		else
		    self.状态 = 2
		    self.可移动窗口 = false
		end
	elseif self.资源组[4]:事件判断(x,y) then
		tp.剧情开关.任务追踪 = false
	end
	self.资源组[1]:显示(self.x,self.y-5)
	self.资源组[9]:显示(self.x,self.y+30)
	self.wz文字:置字间距(1)
	self.wz文字:置颜色(0xFFFFFFFF)
	self.wz文字:显示(self.x+5,self.y+5-5,"任务追踪")
	self.资源组[self.状态]:显示(self.x+127,self.y+4)
	self.资源组[3]:显示(self.x+148,self.y+4)
	self.资源组[4]:显示(self.x+170,self.y+4)
	-- if self.罗羹效果 then
	--     self.资源组[10]:显示(self.x-100,self.y-100)
	-- end
	if #self.介绍文本.显示表 > 10 then
		self.资源组[5]:更新(x,y,self.介绍加入 > 0)
		self.资源组[7]:更新(x,y,self.介绍加入 < #self.介绍文本.显示表 - 10)
		if self.资源组[5]:事件判断() then
			self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.介绍加入-1,10,#self.介绍文本.显示表))
		elseif self.资源组[7]:事件判断() then
			self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.介绍加入+1,10,#self.介绍文本.显示表))
		end
		self.资源组[5]:显示(self.x+185,self.y+31)
		box(self.x+185,self.y+44,self.x+195,self.y+183,ARGB(160,30,30,30))
		self.资源组[6]:显示(self.x+185,self.y+44,x,y,true)
		self.资源组[7]:显示(self.x+185,self.y+183)
		self.介绍加入 = min(ceil((#self.介绍文本.显示表-10)*self.资源组[6]:取百分比()),#self.介绍文本.显示表-10)
		self.介绍文本.加入 = self.介绍加入
	end
	self.介绍文本:显示(self.x+10,self.y+34,4294967295)
	if self.资源组[6].接触 or tp.按钮焦点 then
		self.焦点 = true
	end
	if self.可移动窗口 and self:检查点(x,y) then
		if mousea(0) then
			self:初始移动(x,y)
		end
		if self.移动窗口 and not tp.隐藏UI and not tp.消息栏焦点 then
			self:开始移动(x,y)
		end
	end
	if self.移动窗口 and (mouseb(0) or tp.隐藏UI or tp.消息栏焦点) then
		self.移动窗口 = false
	end
end

function 场景类_任务追踪栏:检查点(x,y)
	if not tp.战斗中 and tp.剧情开关.任务追踪 and ((self.可移动窗口 and self.资源组[1]:是否选中(x,y) ) or self.焦点)  then--or self.资源组[9]:是否选中(x,y)
		return true
	end
end

function 场景类_任务追踪栏:初始移动(x,y)
	if tp.消息栏焦点 then
  		return
 	end
	if not self.焦点 then
		self.移动窗口 = true
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_任务追踪栏:开始移动(x,y)
	self.x = x - self.xx
	self.y = y - self.yy
end

return 场景类_任务追踪栏