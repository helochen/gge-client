--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-04-04 02:04:38
--======================================================================--
local 场景类_染色 = class()
local qmx = 引擎.取模型
local tp,zts,zts1
local insert = table.insert
function 场景类_染色:初始化(根)
	self.ID = 24
	self.x = 435
	self.y = 178
	self.xx = 0
	self.yy = 0
	self.注释 = "染色"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
end

function 场景类_染色:打开(分类) -- 服饰染色 召唤兽染色
	if self.可视 then
		self.彩果 = nil
		self.方向 = nil
		self.染色方案 = nil
		self.人物组 = nil
		self.染色组 = nil
		self.可视 = false
		self.资源组 = nil
		return
	else
		insert(tp.窗口_,self)
		self:加载数据()
		self.分类 = 分类 or "服饰染色"
		-- if tp.队伍[1].模型 == "巫蛮儿" or tp.队伍[1].模型 == "杀破狼" or tp.队伍[1].模型 == "羽灵神" or tp.队伍[1].模型 == "偃无师" or tp.队伍[1].模型 == "鬼潇潇"  or tp.队伍[1].模型 == "桃夭夭" then
		-- 	tp.提示:写入("#Y/该角色暂未开放染色")
		-- 	return
		-- end
		self.方向 = 4
		self.彩果 = 0
		self.人物组 = {}
		self.染色组 = {0,0,0}
		self.人物组 = {}
		self.染色方案 = 0
		local 资源 = tp.资源
		local q = qmx(tp.队伍[1].模型)
		local 人物模型 = 资源:载入(q[3],"网易WDF动画",q[1])
		if tp.队伍[1].装备[3] ~= nil then
			local wq = nil
			local v = tp:取武器子类(tp.队伍[1].装备[3].子类)
			if tp.队伍[1].装备[3].名称 == "龙鸣寒水" or tp.队伍[1].装备[3].名称 == "非攻" then
				v = "弓弩1"
			end
			local q = qmx(tp.队伍[1].模型,v)
			人物模型 = 资源:载入(q[3],"网易WDF动画",q[1])
			local m = tp:取武器附加名称(tp.队伍[1].装备[3].子类,tp.队伍[1].装备[3].级别限制,tp.队伍[1].装备[3].名称)
			local x = qmx(m.."_"..tp.队伍[1].模型)
			local wq = 资源:载入(x[3],"网易WDF动画",x[1])
			wq:置差异(wq.帧数-人物模型.帧数)
			self.人物组[2] = wq
		end
		self.染色方案 = tp.队伍[1].染色方案
		self.染色组   = {0,0,0}
		self.初始染色组 = self.染色组
		self.人物组[1] = 人物模型
		self:置染色()
		self:置方向()
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end
function 场景类_染色:加载数据()
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	local 资源 = tp.资源
	self.资源组 = {
		[1] = 资源:载入('wzife.wd1',"网易WDF动画",0xD7A969C2),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFAB3913C),0,0,4,true,true),
		[4] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x92ABEFD3),0,0,4,true,true),
		[5] = 按钮.创建(自适应.创建(19,4,22,23,4,3),0,0,4,true,true,"1"),
		[6] = 按钮.创建(自适应.创建(19,4,22,23,4,3),0,0,4,true,true,"2"),
		[7] = 按钮.创建(自适应.创建(19,4,22,23,4,3),0,0,4,true,true,"3"),
		[8] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"确定"),
		[9] = 自适应.创建(3,1,40,19,1,3)
	}
	for i=2,8 do
	  	self.资源组[i]:绑定窗口_(24)
	end
	self.资源组[8]:置偏移(-1,0)
end

function 场景类_染色:显示(dt,x,y)
	self.焦点 = false
	self.人物组[1]:更新(dt)
	self.资源组[2]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y)
	self.资源组[7]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[8]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[3]:事件判断() then
	--	self.染色组 = self.初始染色组
	   self.染色组   = {0,0,0}
		self:置染色()
		self.彩果 = 0

	elseif self.资源组[4]:事件判断() then
		self.方向 = self.方向 - 1
		if self.方向 < 0 then
			self.方向 = 7
		end
		self:置方向()
	elseif self.资源组[5]:事件判断() then
		self.染色组[1] = (self.染色组[1] or 0)  + 1
		if self.染色组[1] > 6 then
			self.染色组[1] = 0
		end
		self:置染色()
		--self.彩果 = self.彩果 + self.染色组[1]
		self.彩果=0
		for n=1,3 do


          self.彩果 = self.彩果 + self.染色组[n]

		 end
	elseif self.资源组[6]:事件判断() then
		self.染色组[2] = (self.染色组[2] or 0) + 1
		if self.染色组[2] > 6 then
			self.染色组[2] = 0
		end
		self:置染色()
		self.彩果=0
		for n=1,3 do


          self.彩果 = self.彩果 + self.染色组[n]

		 end
	elseif self.资源组[7]:事件判断() then
		self.染色组[3] = (self.染色组[3] or 0)  + 1
		if self.染色组[3] > 6 then
			self.染色组[3] = 0
		end
		self:置染色()
	self.彩果=0
		for n=1,3 do


          self.彩果 = self.彩果 + self.染色组[n]

		 end
	elseif self.资源组[8]:事件判断() then
		发送数据(3710,self.染色组)
	  --[[	if self.彩果 == 0 or 物品判断("彩果",self.彩果,true) then
			tp.队伍[1].染色组 = self.染色组
			tp.场景.人物:置染色(tp.队伍[1].染色方案,tp.队伍[1].染色组[1],tp.队伍[1].染色组[2],tp.队伍[1].染色组[3])
			tp.提示:写入("#Y/角色染色成功，本次消耗"..self.彩果.."个彩果")
			self.彩果 = 0
		else
			tp.提示:写入("#Y/彩果数量不足，无法染色")
		end --]]
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+149,self.y+6)
	self.资源组[5]:显示(self.x+18,self.y+200,nil,true)
	self.资源组[6]:显示(self.x+46,self.y+200,nil,true)
	self.资源组[7]:显示(self.x+74,self.y+200,nil,true)
	self.资源组[3]:显示(self.x+103,self.y+200,nil,nil,nil,nil,nil,2,0,1)
	self.资源组[4]:显示(self.x+130,self.y+200,nil,nil,nil,nil,nil,2,0,1)
	self.资源组[8]:显示(self.x+119,self.y+231)
	self.资源组[9]:显示(self.x+74,self.y+232)
	zts:置颜色(4294967295)
	zts:显示(self.x+14,self.y+235,"所需彩果")
	zts:置颜色(-16777216)
	zts:显示(self.x+81,self.y+236,self.彩果)
	zts1:置字间距(2.5)
	zts1:显示(self.x+54,self.y+3,self.分类)
	zts1:置字间距(0)
	tp.影子:显示(self.x+79,self.y+164)
	self.人物组[1]:显示(self.x+79,self.y+164)
	if self.人物组[2] ~= nil then
		self.人物组[2]:更新(dt)
		self.人物组[2]:显示(self.x+79,self.y+164)
	end
end

function 场景类_染色:置方向()
	self.人物组[1]:置方向(self.方向)
	if self.人物组[2] ~= nil then
		self.人物组[2]:置方向(self.方向)
	end
end

function 场景类_染色:置染色()
	self.人物组[1]:置染色(self.染色方案,self.染色组[1],self.染色组[2],self.染色组[3],0)
	self:置方向()
end

function 场景类_染色:检查点(x,y)
	if self.可视 and self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_染色:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_染色:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_染色