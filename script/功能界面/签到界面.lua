local 系统类_每日签到 = class()

local floor = math.floor
local min = math.min
local tp,zts1,zts2
local xxx = 0
local yyy = 0
local max = 1
local insert = table.insert
local mouseb = 引擎.鼠标弹起

function 系统类_每日签到:初始化(根)
	self.ID = 41
	--宽高 549 431
	self.x = 全局游戏宽度/2-600/2
	self.y = 全局游戏高度/2-432/2
	self.xx = 0
	self.yy = 0
	self.注释 = "每日签到"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.状态 = 1
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zta = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	zts2 = tp.字体表.普通字体__
	self.分类选中=""
	self.子类选中=""
	self.玩法介绍内容=""
	self.丰富文本说明 = 根._丰富文本(476,265)

end

function 系统类_每日签到:打开(数据)
	if self.可视 then
		self.可视 = false
		self.资源组 = nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 自适应 = tp._自适应
		local 按钮 = tp._按钮
		self.资源组 = {
			[1] = pwd("8"),
			[2] = 按钮.创建(pwd("14"),0,0,4,true,true),
			[3] = 按钮.创建(pwd("7"),0,0,4,true,true),
			[4] = pwd("32"),
			[5] = pwd("31"),
			[6] = pwd("33"),
			[7] = pwd("34"),
		}
		self.状态 = 1
		self.加入 = 0
		self.数据=数据
 		self.几号 = self.数据.几号
 		self.月份 = self.数据.月份
 		self.当月天数=self.数据.当月天数
 		local 当前时间 = os.time()
 		self.周几 = os.date("%w",os.time()-(os.date("%d", os.time())-1)*86400)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		self.起始位置 = self.周几 + 1
		self.上月天数 = os.date("%d",os.time({year=os.date("%Y"),month=os.date("%m"),day=0}))
	end
end

function 系统类_每日签到:刷新(数据)
	self.数据=数据
	self.几号 = self.数据.几号
	self.月份 = self.数据.月份
	self.当月天数=self.数据.当月天数
end


function 系统类_每日签到:显示(dt,x,y)

	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.丰富文本说明:更新(dt,x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[3]:事件判断() then
		发送数据(44,{月份=self.月份,几号=self.几号})
	end
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+603,self.y+2)
	self.资源组[3]:显示(self.x+505,self.y+105)
	local xx = 0
	local yy = 0
	for i=1,42 do
		if xx>=7 then
		    yy=yy+1
		    xx=0
		end
		if i < self.起始位置+0 then
			self.资源组[4]:显示(self.x+16+xx*62,self.y+52+yy*45)
			zts1:显示(self.x+15+xx*62,self.y+52+yy*45,self.上月天数-self.周几+i)
		elseif i >= self.起始位置+0 and i<=self.当月天数+self.周几 then
			self.资源组[5]:显示(self.x+16+xx*62,self.y+52+yy*45)
			zts1:显示(self.x+15+xx*62,self.y+52+yy*45,i-self.周几)
			if self.数据[i-self.周几] then
			    self.资源组[7]:显示(self.x+14+xx*62,self.y+75+yy*45)
			else
				self.资源组[6]:显示(self.x+14+xx*62,self.y+75+yy*45)
			end
		else
			self.资源组[4]:显示(self.x+16+xx*62,self.y+52+yy*45)
			zts1:显示(self.x+15+xx*62,self.y+52+yy*45,i-self.当月天数-self.周几)
		end
		xx=xx+1
	end

	zts1:置颜色(白色)
	zts1:显示(self.x+492,self.y+65,os.date("%Y", os.time()).."年"..os.date("%m", os.time()).."月"..os.date("%d", os.time()).."日")
	zts1:显示(self.x+512,self.y+80,os.date("%X", os.time()))
	zta:置颜色(白色)
	zta:显示(self.x+10,self.y+326,"注：等级大于60级及每日活跃度达到300以上才可以进行签到。")
	zta:显示(self.x+10,self.y+343,"   累计签到7天修炼果*5、500W银子、累计签到14天随机高级兽诀、1000W银子")
	zta:显示(self.x+10,self.y+360,"   累计签到21天随机特殊兽诀、5000W银子、累计签到28天随机150级无级别装备、5000W银子")
end

function 系统类_每日签到:检查点(x,y)
	if self.资源组[1] ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 系统类_每日签到:初始移动(x,y)
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

function 系统类_每日签到:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 系统类_每日签到