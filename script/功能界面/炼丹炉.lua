--======================================================================--

--======================================================================--
local 炼丹炉 = class()
local floor = math.floor
local tp,zts,zt
local format = string.format
local insert = table.insert
local 八卦
function 炼丹炉:初始化(根)
	self.x = 70
	self.y = 140
	self.xx = 0
	self.yy = 0
	self.注释 = "炼丹炉"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根


	self.窗口时间 = 0
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.普通字体___

	self.坐标 = {
		{x=117,y=72},
		{x=169,y=90},
		{x=189,y=144},
		{x=171,y=197},
		{x=117,y=217},
		{x=64,y=199},
		{x=44,y=144},
		{x=62,y=92},
	}
	self.选中 = 0
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('坐骑总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("炼丹炉数量输入",0,0,100,14)
	self.输入框:置可视(false,false)
	self.输入框:置数字模式()
	self.输入框:置限制字数(12)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	self.输入框:置文本(0)
	八卦 = {"乾","巽","坎","艮","坤","震","离","兑"}
	self.最大奖励 = {}
	self.开奖数据 = {}

end

function 炼丹炉:打开(数据)
	if self.可视 then
		self.可视 = false
		self.输入框:置焦点(false)
		self.输入框:置可视(false,false)
		self.最大奖励 = {}
		self.资源组=nil
		self.bw=nil
		self.物品=nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.资源组 = {
			[1] = 资源:载入('wzife.wd1',"网易WDF动画",0x9E956BF6),
			[2] = 自适应.创建(3,1,97,19,1,3),--数量框
			[3] = 按钮.创建(自适应.创建(12,4,57,22,1,3),0,0,4,true,true,"注 入 "),
			[4] = 按钮.创建(自适应.创建(12,4,57,22,1,3),0,0,4,true,true,"关 闭 "),
			[5] = 资源:载入('wzife.wd1',"网易WDF动画",0xAC5A14B2),
			[6] = 资源:载入('wzife.wd1',"网易WDF动画",0xAC5A14B2),
			[7] = 资源:载入('wzife.wd1',"网易WDF动画",0xE809BF6D),
			[8] = 资源:载入('wzife.wd1',"网易WDF动画",0xE8725FA6),
		}
		self.bw = {}
		for i=1,8 do
		    self.bw[i] = require("gge包围盒")(0,0,36,36)
		end
		local 格子 = tp._物品格子
		self.物品 = {}
		for i=1,20 do
			self.物品[i] = 格子(0,0,i1,"炼丹")
		end
		self.时间=数据.时间
		self.灵气 = 数据.灵气
		self.下注信息 = 数据.数据
		self.最大奖励 = {}
		if self.下注信息 ~= nil then
			self.最大奖励[1],self.最大奖励[2],self.最大奖励[3] = self:取最大奖励(self.下注信息)
		end
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.输入框:置可视(true,true)
	    self.输入框:置文本(0)
	    for i=1,20 do
			self.物品[i]:置物品(数据.物品数据.道具[i])
		end

	end
end
function 炼丹炉:刷新(数据)
	self.时间 = 数据
end
function 炼丹炉:更新(数据)
	self.灵气 = 数据.灵气
	self.下注信息 = 数据.数据
	self.最大奖励 = {}
	if self.下注信息 ~= nil then
		self.最大奖励[1],self.最大奖励[2],self.最大奖励[3] = self:取最大奖励(self.下注信息)
	end
end

function 炼丹炉:开奖(数据)
	for i=1,#八卦 do
		if 八卦[i] == 数据.吉位 then
			self.开奖数据.吉位 = i
		end
		if 八卦[i] == 数据.八卦位 then
			self.开奖数据.八卦位 = i
		end
	end
	self.选中 = 0
end
function 炼丹炉:显示(dt,x,y)
	self.焦点 = false
	self.资源组[3]:更新(x,y,self.选中~=0)
	self.资源组[4]:更新(x,y)
	-- self.资源组[5]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	for i=1,8 do
		self.bw[i]:置坐标(self.x+self.坐标[i].x,self.y+self.坐标[i].y)
		if self.bw[i]:检查点(x,y) and self.时间 <= 115 then
			if self.下注信息 ~= nil and self.下注信息[八卦[i]] ~= nil then
				tp.提示:自定义(self.x+self.坐标[i].x,self.y+self.坐标[i].y,"#Y灵气:"..self.下注信息[八卦[i]])
			end
			if 引擎.鼠标弹起(左键) then
				self.选中 = i
				self.资源组[5]:置当前帧(i-1)
				self.资源组[5]:更新纹理()
			end
		end
		if self.下注信息 ~= nil and self.下注信息[八卦[i]] ~= nil then
			self.资源组[7]:显示(self.x+self.坐标[i].x,self.y+self.坐标[i].y)
		end
	end
	if self.选中 ~= 0 and self.时间 <= 120 then
		self.资源组[5]:显示(self.x,self.y)
	end
	self.资源组[2]:显示(self.x+318,self.y+280)
	self.资源组[2]:显示(self.x+318,self.y+307)
	self.资源组[3]:显示(self.x+440,self.y+280)
	self.资源组[4]:显示(self.x+440,self.y+307)
	self.资源组[8]:显示(self.x,self.y)
	if self.时间 > 115 then
		if self.时间 <= 121 then
			zts:显示(self.x+65,self.y+40,"倒计时：炼丹结束")
		else
		    zts:显示(self.x+65,self.y+40,"倒计时：火热炼丹中")
		end
		if self.时间 >= 121 then
			self.资源组[6]:置提速(0.5)
			self.资源组[6]:更新()
			self.资源组[8]:更新()
		end
		if self.时间 == 121 then
			self.资源组[6]:置当前帧(self.开奖数据.吉位-1)
			self.资源组[6]:更新纹理()
			self.开奖数据 = {}
			self.资源组[5]:置当前帧(self.开奖数据.八卦位-1)
			self.资源组[5]:更新纹理()
		end
		if self.时间 > 115 and self.时间 <= 121 then
			self.资源组[5]:显示(self.x,self.y)
		end
		self.资源组[6]:显示(self.x,self.y)
	else
		zts:显示(self.x+65,self.y+40,"倒计时："..self.时间.."秒")
	end
	zts:显示(self.x+245,self.y+281,"注入灵气：")
	zts:显示(self.x+245,self.y+308,"当前灵气：")
	zts1:显示(self.x+320,self.y+309,self.灵气)
	if self.下注信息 ~= nil then
		zts1:显示(self.x+40,self.y+309,self.最大奖励[1])
		zts1:显示(self.x+110,self.y+309,self.最大奖励[2])
		zts1:显示(self.x+180,self.y+309,self.最大奖励[3])
		zts1:显示(self.x+320,self.y+309,self.灵气)
		zts1:显示(self.x+320,self.y+309,self.灵气)
		zts1:显示(self.x+320,self.y+309,self.灵气)
	end
	self.输入框:置坐标(self.x + 320,self.y + 283)
	self.控件类:更新(dt,x,y)
	self.控件类:显示(dt,x,y)
	local is = 0
	for h=1,4 do
		for l=1,5 do
			is = is + 1
			self.物品[is]:置坐标(l * 51 + 223 + self.x,h * 51 + self.y + 12)
			if self.物品[is].物品~=nil then
				self.物品[is]:显示(dt,x,y,self.鼠标)
			end
			if self.物品[is].物品 ~= nil and self.物品[is].焦点 then
				tp.提示:道具行囊(x,y,self.物品[is].物品)
			end
		end
	end

	if self.资源组[3]:事件判断() then
		if tonumber(self.输入框:取文本()) == nil then
			tp.提示:写入("#Y/请正确输入你要注入的灵气数额!")
			return
		elseif tonumber(self.输入框:取文本()) <= 0 then
			tp.提示:写入("#Y/最低注入灵气数额要大于0!")
			return
		elseif self.选中 == 0 then
			tp.提示:写入("#Y/请选择你要投入的炼丹方位!")
			return
		end
		发送数据(99.1,{编号=self.选中,数额=tonumber(self.输入框:取文本())})
	elseif self.资源组[4]:事件判断() then
		self:打开()
		发送数据(99)
		return
	end
end

function 炼丹炉:取最大奖励(数据)
	local 数组 = {[1]=0,[2]=0,[3]=0}
	local 信息= 0
	local 临时信息 = {}
	for i,v in pairs(数据) do
		临时信息[#临时信息+1] = {名称=i,数额=v}
	end
	table.sort(临时信息,function(a,b) return a.数额>b.数额 end )
	信息 = 临时信息[1].数额
	if math.floor(信息/1000) > 0 then
	    数组[1] = math.floor(信息/1000)
	    信息 = 信息 - 数组[1]*1000
	    数组[2] = math.floor(信息/100)
	    信息 = 信息 - 数组[2]*100
	    数组[3] = math.floor(信息/10)
	elseif math.floor(信息/100) > 0 then
		数组[2] = math.floor(信息/100)
	    信息 = 信息 - 数组[2]*100
	    数组[3] = math.floor(信息/10)
	elseif math.floor(信息/10) > 0 then
	    数组[3] = math.floor(信息/10)
	end
	return 数组[1],数组[2],数组[3]
end

function 炼丹炉:检查点(信息)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end



function 炼丹炉:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 炼丹炉:初始移动(x,y)
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

function 炼丹炉:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 炼丹炉