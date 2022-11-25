local 场景类_玩法介绍 = class()

local floor = math.floor
local min = math.min
local tp,zts1,zts2
local xxx = 0
local yyy = 0
local 日常任务={"初出江湖","钟馗抓鬼","师门任务","押镖任务","官职任务","平定安邦","科举活动","生死劫挑战","帮派青龙","帮派玄武","藏宝图","封妖任务","妖王活动"}
local 限时活动={"捣乱的水果","妖魔鬼怪","宝藏山寻宝","十二星宿","游泳比赛","门派闯关","幻域迷宫","镖王活动","皇宫飞贼","知了先锋","小知了王","知了王","地煞星","天罡星","世界BOSS"}
local 进阶大神={"进阶召唤兽","法宝任务","坐骑任务","飞升任务","渡劫任务","勇闯通天塔"}
local 副本任务={"乌鸡国","车迟斗法","水陆大会"}
local 文本介绍=""
local max = 1
local insert = table.insert
local mouseb = 引擎.鼠标弹起
local 按钮
function 场景类_玩法介绍:初始化(根)
	self.ID = 100
	self.x = 全局游戏宽度/2-660/2+200
	self.y = 全局游戏高度/2-452/2-8
	self.xx = 0
	self.yy = 0
	self.注释 = "玩法介绍"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 自适应 = 根._自适应
	按钮 = 根._按钮
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zta = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	zts2 = tp.字体表.普通字体__
	self.丰富文本说明 = 根._丰富文本(250,370)
	self.丰富文本说明1 = 根._丰富文本(250,40)
	self.介绍加入=0
end

function 场景类_玩法介绍:打开(数据)
	if self.可视 then
		self.可视 = false
		self.资源组 = nil
	else
		insert(tp.窗口_,self)
		self.数据=数据
		self.资源组 = {
			[1] = pwd("4"),
		}
		self.丰富文本说明:清空()
		self.丰富文本说明1:清空()
		if self.数据.总类=="日常任务" then
		    玩法介绍=读入文件([[任务攻略\]]..日常任务[self.数据.分类]..".txt")
		elseif self.数据.总类=="限时活动" then
			玩法介绍=读入文件([[任务攻略\]]..限时活动[self.数据.分类]..".txt")
		elseif self.数据.总类=="进阶大神" then
			玩法介绍=读入文件([[任务攻略\]]..进阶大神[self.数据.分类]..".txt")
		elseif self.数据.总类=="副本任务" then
			玩法介绍=读入文件([[任务攻略\]]..副本任务[self.数据.分类]..".txt")
		end
		self.丰富文本说明:置默认颜色(黑色)
		self.丰富文本说明:添加文本(玩法介绍)
		self.丰富文本说明.滚动值 = self.丰富文本说明.行数量
		self.丰富文本说明:滚动(self.丰富文本说明.滚动值)
		self.丰富文本说明:滚动(-23)
		self.丰富文本说明1:添加文本("#23#23#23#23#23#23#23#23#23#23#23")
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 场景类_玩法介绍:显示(dt,x,y)
	self.丰富文本说明:更新(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	if 引擎.取鼠标滚轮() >0 then--鼠标上滚动
		if self.丰富文本说明.滚动值 < #self.丰富文本说明.显示表 -23 then
			self.丰富文本说明:滚动(1)
			self.介绍加入=self.介绍加入-1
		end
	elseif 引擎.取鼠标滚轮() <0  then--鼠标下滚动
		if self.丰富文本说明.滚动值 > 0 then
			self.丰富文本说明:滚动(-1)
			self.介绍加入=self.介绍加入+1
		end
	end
	self.丰富文本说明:显示(self.x+15,self.y+75)
	self.丰富文本说明1:显示(self.x+30,self.y+35)
end

function 场景类_玩法介绍:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_玩法介绍:初始移动(x,y)
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

function 场景类_玩法介绍:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_玩法介绍