local 助战辅助技能 = class()

local floor = math.floor
local min = math.min
local tp,zts1,zts2
local xxx = 0
local yyy = 0
local max = 1
local insert = table.insert
local mouseb = 引擎.鼠标弹起

function 助战辅助技能:初始化(根)
	self.ID = 41
	--宽高 549 431
	self.x = 372
	self.y = 105
	self.xx = 0
	self.yy = 0
	self.注释 = "助战辅助技能"
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

function 助战辅助技能:打开(内容)
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
			[1] = 自适应.创建(0,1,315,450,3,9),
			--[2] = 按钮.创建(自适应.创建(12,4,36,22,1,3),0,0,4,true,true,"学习"),
			[16] = 自适应.创建(3,1,40,19,1,3),
		}
		for q = 1,14 do
		self.资源组[1+q] = 按钮.创建(自适应.创建(12,4,40,22,1,3),0,0,4,true,true,"学习")
		end
		self.状态 = 1
		self.加入 = 0
		self.选中 = 0
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		辅助技能 = 内容.辅助技能
		编号= 内容.编号
		强化技能 = 内容.强化技能
		self.辅助技能 = {[1]={等级=辅助技能.冥想,名称="冥想"},[2]={等级=辅助技能.暗器技巧,名称="暗器技巧"},[3]={等级=辅助技能.强壮,名称="强壮"},[4]={等级=辅助技能.强身,名称="强身术"}}
		self.强化技能 = {}
	for n =1,4 do
	local ski = 引擎.取技能(self.辅助技能[n].名称)
	self.辅助技能[n] = tp.资源:载入(ski[6],"网易WDF动画",ski[7])
	end
	for i =1,10 do
	local ski1 = 引擎.取技能(强化技能[i].名称)
	self.强化技能[i] = tp.资源:载入(ski1[6],"网易WDF动画",ski1[8])
	end
	end
end

function 助战辅助技能:刷新(内容)
辅助技能 = 内容.辅助技能
编号= 内容.编号
强化技能 = 内容.强化技能
end


function 助战辅助技能:显示(dt,x,y)
for n = 1,14 do
self.资源组[1+n]:更新(x,y)
end
for n = 1,14 do
if self.资源组[1+n]:事件判断() then
发送数据(114.3,{编号=编号,学习号=n+1})
end
end
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	for n = 1,14 do
	if n < 5 then
	self.资源组[1+n]:显示(self.x+30+n*70-70,self.y+118)
	elseif n < 9 then
	self.资源组[1+n]:显示(self.x+30+(n-4)*70-70,self.y+100+118)
	elseif n < 13 then
	self.资源组[1+n]:显示(self.x+30+(n-8)*70-70,self.y+100+118+100)
	else
	self.资源组[1+n]:显示(self.x+30+(n-12)*70-70,self.y+100+118+200)
	end
	end
	self.资源组[16]:显示(self.x+30,self.y+97)
	self.资源组[16]:显示(self.x+100,self.y+97)
	self.资源组[16]:显示(self.x+170,self.y+97)
	self.资源组[16]:显示(self.x+240,self.y+97)
	self.资源组[16]:显示(self.x+30,self.y+97+100)
	self.资源组[16]:显示(self.x+100,self.y+97+100)
	self.资源组[16]:显示(self.x+170,self.y+97+100)
	self.资源组[16]:显示(self.x+240,self.y+97+100)
	self.资源组[16]:显示(self.x+30,self.y+97+100+100)
	self.资源组[16]:显示(self.x+100,self.y+97+100+100)
	self.资源组[16]:显示(self.x+170,self.y+97+100+100)
	self.资源组[16]:显示(self.x+240,self.y+97+100+100)
	self.资源组[16]:显示(self.x+30,self.y+97+100+100+100)
    self.资源组[16]:显示(self.x+100,self.y+97+100+100+100)
	zts:置颜色(白色)
zts:显示(self.x+34+1*70-70,self.y+81,"冥想")
zts:显示(self.x+22+2*70-70,self.y+81,"暗器技巧")
zts:显示(self.x+34+3*70-70,self.y+81,"强壮")
zts:显示(self.x+30+4*70-70,self.y+81,"强身术")
zts:显示(self.x+30+1*70-70,self.y+81+100,"法术防御")
zts:显示(self.x+30+2*70-70,self.y+81+100,"气血上限")
zts:显示(self.x+30+3*70-70,self.y+81+100,"物理防御")
zts:显示(self.x+30+4*70-70,self.y+81+100,"魔法上限")
zts:显示(self.x+30+1*70-70,self.y+81+100+100,"抵抗封印")
zts:显示(self.x+30+2*70-70,self.y+81+100+100,"强化伤害")
zts:显示(self.x+30+3*70-70,self.y+81+100+100,"固定伤害")
zts:显示(self.x+30+4*70-70,self.y+81+100+100,"封印命中")
zts:显示(self.x+30+1*70-70,self.y+81+100+100+100,"治疗能力")
zts:显示(self.x+30+2*70-70,self.y+81+100+100+100,"法术伤害")

zts:显示(self.x+34+1*70-55,self.y+81+20,""..辅助技能.冥想)
zts:显示(self.x+22+2*70-55,self.y+81+20,""..辅助技能.暗器技巧)
zts:显示(self.x+34+3*70-55,self.y+81+20,""..辅助技能.强壮)
zts:显示(self.x+30+4*70-55,self.y+81+20,""..辅助技能.强身)
zts:显示(self.x+30+1*70-55,self.y+81+20+100,""..强化技能[1].等级)
zts:显示(self.x+30+2*70-55,self.y+81+20+100,""..强化技能[2].等级)
zts:显示(self.x+30+3*70-55,self.y+81+20+100,""..强化技能[3].等级)
zts:显示(self.x+30+4*70-55,self.y+81+20+100,""..强化技能[4].等级)
zts:显示(self.x+30+1*70-55,self.y+81+20+100+100,""..强化技能[5].等级)
zts:显示(self.x+30+2*70-55,self.y+81+20+100+100,""..强化技能[6].等级)
zts:显示(self.x+30+3*70-55,self.y+81+20+100+100,""..强化技能[7].等级)
zts:显示(self.x+30+4*70-55,self.y+81+20+100+100,""..强化技能[8].等级)
zts:显示(self.x+30+1*70-55,self.y+81+20+100+100+100,""..强化技能[9].等级)
zts:显示(self.x+30+2*70-55,self.y+81+20+100+100+100,""..强化技能[10].等级)
for n = 1,4 do
self.辅助技能[n]:显示(self.x+30+n*70-70,self.y+40)
end
for i = 1,10 do
if i < 5 then
self.强化技能[i]:显示(self.x+30+i*70-70,self.y+40+100)
elseif i < 9 then
self.强化技能[i]:显示(self.x+30+(i-4)*70-70,self.y+40+100+100)
else
self.强化技能[i]:显示(self.x+30+(i-8)*70-70,self.y+40+100+100+100)
end
end
	local xx = 0
	local yy = 0
end

function 助战辅助技能:检查点(x,y)
	if self.资源组[1] ~= nil  then
		return true
	end
end
function 助战辅助技能:初始移动(x,y)
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

function 助战辅助技能:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 助战辅助技能