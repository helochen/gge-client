local 助战修炼界面 = class()

local floor = math.floor
local min = math.min
local tp,zts1,zts2
local xxx = 0
local yyy = 0
local max = 1
local insert = table.insert
local mouseb = 引擎.鼠标弹起

function 助战修炼界面:初始化(根)
	self.ID = 41
	--宽高 549 431
	self.x = 372
	self.y = 105
	self.xx = 0
	self.yy = 0
	self.注释 = "助战修炼界面"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.状态 = 1
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zta = tp.字体表.普通字体
	zts1 = tp.字体表.普通字体
	zts2 = tp.字体表.普通字体__
	self.分类选中=""
	self.子类选中=""
	self.玩法介绍内容=""
	self.丰富文本说明 = 根._丰富文本(476,265)

end

function 助战修炼界面:打开(内容)
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
			[1] = 自适应.创建(0,1,315,250,3,9),
			[2] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"提升十次"),
			[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"提升十次"),
			[4] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"提升十次"),
			[5] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"提升十次"),
		}
		self.状态 = 1
		self.加入 = 0
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		助战修炼 = 内容.助战修炼
		助战修炼经验 = 内容.助战修炼经验
		self.编号 = 内容.编号
	end
end

function 助战修炼界面:刷新(内容)
		助战修炼 = 内容.助战修炼
		助战修炼经验 = 内容.助战修炼经验
		self.编号 = 内容.编号
end


function 助战修炼界面:显示(dt,x,y)
self.资源组[2]:更新(x,y)
self.资源组[3]:更新(x,y)
self.资源组[4]:更新(x,y)
self.资源组[5]:更新(x,y)
if self.资源组[2]:事件判断() then
发送数据(113.1,{编号=self.编号,修炼类型="攻击修炼"})
elseif self.资源组[3]:事件判断() then
发送数据(113.1,{编号=self.编号,修炼类型="法术修炼"})
elseif self.资源组[4]:事件判断() then
发送数据(113.1,{编号=self.编号,修炼类型="防御修炼"})
elseif self.资源组[5]:事件判断() then
发送数据(113.1,{编号=self.编号,修炼类型="抗法修炼"})
end
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+235,self.y+60-2)
self.资源组[3]:显示(self.x+235,self.y+100-2)
self.资源组[4]:显示(self.x+235,self.y+140-2)
self.资源组[5]:显示(self.x+235,self.y+180-2)
zts:置颜色(白色)
	local 当前所需经验 = 0
	当前所需经验 = 计算修炼等级经验(助战修炼.攻击修炼,25)
	zts:显示(self.x+10,self.y+60,"攻击修炼 等级:"..助战修炼.攻击修炼.."/25 修炼经验"..助战修炼经验.攻击经验.."/"..当前所需经验)
	当前所需经验 = 计算修炼等级经验(助战修炼.法术修炼,25)
	zts:显示(self.x+10,self.y+100,"法术修炼 等级:"..助战修炼.法术修炼.."/25 修炼经验"..助战修炼经验.法术经验.."/"..当前所需经验)
	当前所需经验 = 计算修炼等级经验(助战修炼.防御修炼,25)
	zts:显示(self.x+10,self.y+140,"防御修炼 等级:"..助战修炼.防御修炼.."/25 修炼经验"..助战修炼经验.防御经验.."/"..当前所需经验)
	当前所需经验 = 计算修炼等级经验(助战修炼.抗法修炼,25)
	zts:显示(self.x+10,self.y+180,"抗法修炼 等级:"..助战修炼.抗法修炼.."/25 修炼经验"..助战修炼经验.抗法经验.."/"..当前所需经验)
	local xx = 0
	local yy = 0
end

function 助战修炼界面:检查点(x,y)
	if self.资源组[1] ~= nil  then
		return true
	end
end

function 助战修炼界面:初始移动(x,y)
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

function 助战修炼界面:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 助战修炼界面