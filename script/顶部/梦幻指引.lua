local 场景类_梦幻指引 = class()

local floor = math.floor
local min = math.min
local tp,zts1,zts2
local xxx = 0
local yyy = 0
local 日常任务={"初出江湖","钟馗抓鬼","师门任务","押镖任务","官职任务","平定安邦","科举活动","生死劫挑战","帮派青龙","帮派玄武","藏宝图","封妖任务","妖王活动"}
local 日常任务活跃={"20次*2","50次*2","20次*2","50次*2","20次*2","20次*2","1次*50","3次*20","100次*1","100次*1","无","3次*20","3次*20"}
local 限时活动={"捣乱的水果","妖魔鬼怪","宝藏山寻宝","十二星宿","游泳比赛","门派闯关","幻域迷宫","镖王活动","皇宫飞贼","知了先锋","小知了王","知了王","地煞星","天罡星","世界BOSS"}
local 限时活动活跃={"25次*2","25次*2","无","5次*10","1次*30","1次*50","1次*30","1次*30","5次*10","20次*2","20次*3","10次*5","5次*20","5次*20","2次*50"}
local 进阶大神={"进阶召唤兽","法宝任务","坐骑任务","飞升任务","渡劫任务","勇闯通天塔"}
local 副本任务={"乌鸡国","车迟斗法","水陆大会"}
local 副本任务活跃={"1次*50","1次*50","1次*50"}
local max = 1
local insert = table.insert
local mouseb = 引擎.鼠标弹起
local 按钮,资源
function 场景类_梦幻指引:初始化(根)
	self.ID = 41
	--宽高 549 431
	self.x = 全局游戏宽度/2-660/2
	self.y = 全局游戏高度/2-452/2
	self.xx = 0
	self.yy = 0
	self.注释 = "梦幻指引"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	资源 = 根.资源
	按钮 = 根._按钮
	self.状态 = 1
	self.子类状态 = 1
	self.选中 = 1
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	zts2 = tp.字体表.普通字体__
	self.分类={}
	self.子类={}
	self.分类选中=""
	self.子类选中=""
	self.玩法介绍内容=""
	self.丰富文本说明 = 根._丰富文本(476,265)
	self.加入 = 0
end

function 场景类_梦幻指引:打开(数据)
	if self.可视 then
		self.可视 = false
		self.加入 = 0
		self.资源组 = nil
		self.按键数组=nil
		return
	else
		insert(tp.窗口_,self)
		self:加载数据()
		self.状态 = 1
		self.加入 = 0
		self.子类状态 = 1
		self.数据=数据
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		self.翻页数据 = math.floor(#日常任务/6)
		self.按键数组={}
		for i=1,6 do
			self.按键数组[#self.按键数组+1]=按钮.创建(pwd("11"),0,0,4,true,true,"查看攻略")
		end

		self.zts =require("gge文字类").创建(nil,20,false,false,true)
	end
end
function 场景类_梦幻指引:加载数据()
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = pwd("10"),
		[2] = 自适应.创建(5,1,590,300,3,9),
		[3] = 按钮.创建(pwd("5"),0,0,4,true,true),
		[4] = 按钮.创建(pwd("14"),0,0,4,true,true),
		[5] = 按钮.创建(pwd("1"),0,0,4,true,true,"				日常任务"),
		[6] = 按钮.创建(pwd("1"),0,0,4,true,true,"				限时活动"),
		[7] = 按钮.创建(pwd("1"),0,0,4,true,true,"				进阶大神"),
		[8] = 按钮.创建(pwd("1"),0,0,4,true,true,"				副本任务"),
		[9] = pwd("30"),
		[13] = 按钮.创建(pwd("9"),0,0,4,true,true),
		[14] = 按钮.创建(pwd("6"),0,0,4,true,true),
		[15] = 按钮.创建(pwd("2"),0,0,4,true,true),
		[16] = 自适应.创建(9,1,270,75,3,9),
		[17] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),--上滚动
		[18] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下滚动
		[19] = 资源:载入('wzife.wd1',"网易WDF动画",0xE6490543),
	}
	for i=4,8 do
		self.资源组[i]:绑定窗口_(41)
	end
	for i=1,3 do
		self.资源组[9+i] = 按钮.创建(pwd("27"),0,0,4,true,true)
	end
end

function 场景类_梦幻指引:显示(dt,x,y)

	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y,self.状态 ~= 1)
	self.资源组[6]:更新(x,y,self.状态 ~= 2)
	self.资源组[7]:更新(x,y,self.状态 ~= 3)
	self.资源组[8]:更新(x,y,self.状态 ~= 4)
	self.资源组[10]:更新(x,y,self.数据.活跃数据.活跃度>=100)
	self.资源组[11]:更新(x,y,self.数据.活跃数据.活跃度>=300)
	self.资源组[12]:更新(x,y,self.数据.活跃数据.活跃度>=500)
	self.资源组[13]:更新(x,y)
	self.资源组[14]:更新(x,y)
	self.资源组[15]:更新(x,y)
	self.丰富文本说明:更新(dt,x,y)
	if self.资源组[3]:事件判断() then
		发送数据(43)
		self:打开()
		return false
	elseif self.资源组[4]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[5]:事件判断() then
		self.状态 = 1
		self.加入 = 0
	elseif self.资源组[6]:事件判断() then --玩法介绍
		self.翻页数据 = math.floor(#限时活动/6)
		self.状态 = 2
		self.加入 = 0
	elseif self.资源组[7]:事件判断() then
		self.翻页数据 = math.floor(#进阶大神/6)
		self.状态 = 3
		self.加入 = 0
	elseif self.资源组[8]:事件判断() then
		self.翻页数据 = math.floor(#副本任务/6)
		self.状态 = 4
		self.加入 = 0
	elseif self.资源组[10]:事件判断() then
		发送数据(41,{序列=1})
	elseif self.资源组[11]:事件判断() then
		发送数据(41,{序列=3})
	elseif self.资源组[12]:事件判断() then
		发送数据(41,{序列=5})
	elseif self.资源组[13]:事件判断() then
	elseif self.资源组[14]:事件判断() then
		if tp.窗口.排行榜.可视==false then
			tp.窗口.排行榜:打开()
			发送数据(39,{"赞助排行"})
		else
			tp.窗口.排行榜:打开()
		end
		self:打开()
		return
	elseif self.资源组[15]:事件判断() then
		发送数据(48)
	elseif self.资源组[17]:事件判断() then
		if self.加入 >0 then
			self.加入 = self.加入 -1
		end
	elseif self.资源组[18]:事件判断() then
		if self.加入 < self.翻页数据 then
			self.加入 = self.加入 + 1
		end
	end
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+48,self.y+3+26+36)
	self.资源组[3]:显示(self.x+39,self.y+383-13)
	self.资源组[4]:显示(self.x+639,self.y)
	self.资源组[5]:显示(self.x+50,self.y+33,true,nil,nil,self.状态 == 1,2)
	self.资源组[6]:显示(self.x+200,self.y+33,true,nil,nil,self.状态 == 2,2)
	self.资源组[7]:显示(self.x+350,self.y+33,true,nil,nil,self.状态 == 3,2)
	self.资源组[8]:显示(self.x+500,self.y+33,true,nil,nil,self.状态 == 4,2)
	self.资源组[9]:显示(self.x+124,self.y+389)
	self.资源组[10]:显示(self.x+163,self.y+392,true,nil,nil,self.数据.活跃数据.活跃度 >= 100,2)
	self.资源组[11]:显示(self.x+165+80,self.y+392,true,nil,nil,self.数据.活跃数据.活跃度 >= 300,2)
	self.资源组[12]:显示(self.x+165+80+81,self.y+392,true,nil,nil,self.数据.活跃数据.活跃度 >= 500,2)
	self.资源组[13]:显示(self.x+471,self.y+391)
	self.资源组[14]:显示(self.x+551,self.y+391)
	self.资源组[15]:显示(self.x+600,self.y+391)
	zts:显示(self.x+145,self.y+430,"100活跃度")
	zts:显示(self.x+228,self.y+430,"300活跃度")
	zts:显示(self.x+308,self.y+430,"500活跃度")
	zts:显示(self.x+365,self.y+390,"当前活跃："..self.数据.活跃数据.活跃度)
	zts:显示(self.x+365,self.y+405,"累积活跃："..self.数据.累积活跃.当前积分)
	zts:显示(self.x+308,self.y+430,"500活跃度")
	zts:显示(self.x+475,self.y+430,"活动日历")
	zts:显示(self.x+550,self.y+430,"排 行")
	zts:显示(self.x+601,self.y+430,"兑 换")
	zts2:显示(self.x+508,self.y+401,os.date("%d", os.time()).."日")
	self.zts:显示(self.x+308,self.y+0, self.注释)
	local xx=0
	local yy=0
	if self.状态 == 1 then--日常任务
		local bbsa = #日常任务
		self.资源组[17]:更新(x,y,self.加入>0)
		self.资源组[18]:更新(x,y,self.加入<self.翻页数据)
		for i=1,6 do
			if xx>=2 then
			    yy=yy+1
			    xx=0
			end
			self:取图标({总类="日常任务",分类=i+self.加入*6})
			if 日常任务[i+self.加入*6]~=nil then
				self.按键数组[i]:更新(x,y)
			    self.资源组[16]:显示(self.x+68+xx*280,self.y+92+yy*85)
				self.资源组[19]:显示(self.x+88+xx*280,self.y+92+13+yy*85)
				self.资源组[20]:显示(self.x+88+xx*280,self.y+92+13+yy*85)
				self.按键数组[i]:显示(self.x+88+158+xx*280,self.y+92+40+yy*85)
				zts:置颜色(黑色)
				zts:显示(self.x+88+58+xx*280,self.y+92+15+yy*85,日常任务[i+self.加入*6])
				zts:显示(self.x+88+58+xx*280,self.y+92+45+yy*85,"活跃度："..日常任务活跃[i+self.加入*6])
			end
			if self.按键数组[i]:事件判断() then
			    tp.窗口.玩法介绍:打开({总类="日常任务",分类=i+self.加入*6})
			end
			xx=xx+1
		end
		self.资源组[17]:显示(self.x+620,self.y+80-16)
		self.资源组[18]:显示(self.x+620,self.y+330+17)
	elseif self.状态 == 2 then--玩法介绍
		local bbsa = #限时活动
		self.资源组[17]:更新(x,y,self.加入>0)
		self.资源组[18]:更新(x,y,self.加入<self.翻页数据)
		for i=1,6 do
			if xx>=2 then
			    yy=yy+1
			    xx=0
			end
			self:取图标({总类="限时活动",分类=i+self.加入*6})
			if 限时活动[i+self.加入*6]~=nil then
			    self.资源组[16]:显示(self.x+68+xx*280,self.y+92+yy*85)
				self.资源组[19]:显示(self.x+88+xx*280,self.y+92+13+yy*85)
				self.资源组[20]:显示(self.x+88+xx*280,self.y+92+13+yy*85)
				self.按键数组[i]:更新(x,y)
				self.按键数组[i]:显示(self.x+88+158+xx*280,self.y+92+40+yy*85)
				zts:置颜色(黑色)
				zts:显示(self.x+88+58+xx*280,self.y+92+15+yy*85,限时活动[i+self.加入*6])
				zts:显示(self.x+88+58+xx*280,self.y+92+45+yy*85,"活跃度："..限时活动活跃[i+self.加入*6])
			end
			if self.按键数组[i]:事件判断() then
			    tp.窗口.玩法介绍:打开({总类="限时活动",分类=i+self.加入*6})
			end
			xx=xx+1
		end
		self.资源组[17]:显示(self.x+620,self.y+80-16)
		self.资源组[18]:显示(self.x+620,self.y+330+17)
	elseif self.状态==3 then--每日签到
		local bbsa = #进阶大神
		self.资源组[17]:更新(x,y,self.加入>0)
		self.资源组[18]:更新(x,y,self.加入<self.翻页数据)
		for i=1,6 do
			if xx>=2 then
			    yy=yy+1
			    xx=0
			end
			self:取图标({总类="进阶大神",分类=i+self.加入*6})
			if 进阶大神[i+self.加入*6]~=nil then
			    self.资源组[16]:显示(self.x+68+xx*280,self.y+92+yy*85)
				self.资源组[19]:显示(self.x+88+xx*280,self.y+92+13+yy*85)
				self.资源组[20]:显示(self.x+88+xx*280,self.y+92+13+yy*85)
				self.按键数组[i]:更新(x,y)
				self.按键数组[i]:显示(self.x+88+158+xx*280,self.y+92+40+yy*85)
				zts:置颜色(黑色)
				zts:显示(self.x+88+58+xx*280,self.y+92+15+yy*85,进阶大神[i+self.加入*6])
			end
			if self.按键数组[i]:事件判断() then
			    tp.窗口.玩法介绍:打开({总类="进阶大神",分类=i+self.加入*6})
			end
			xx=xx+1
		end
		self.资源组[17]:显示(self.x+620,self.y+80-16)
		self.资源组[18]:显示(self.x+620,self.y+330+17)
	elseif self.状态 == 4 then--梦幻之旅
		local bbsa = #副本任务
		self.资源组[17]:更新(x,y,self.加入>0)
		self.资源组[18]:更新(x,y,self.加入<self.翻页数据)
		for i=1,6 do
			if xx>=2 then
			    yy=yy+1
			    xx=0
			end
			self:取图标({总类="副本任务",分类=i+self.加入*6})
			if 副本任务[i+self.加入*6]~=nil then
			    self.资源组[16]:显示(self.x+68+xx*280,self.y+92+yy*85)
				self.资源组[19]:显示(self.x+88+xx*280,self.y+92+13+yy*85)
				self.资源组[20]:显示(self.x+88+xx*280,self.y+92+13+yy*85)
				self.按键数组[i]:更新(x,y)
				self.按键数组[i]:显示(self.x+88+158+xx*280,self.y+92+40+yy*85)
				zts:置颜色(黑色)
				zts:显示(self.x+88+58+xx*280,self.y+92+15+yy*85,副本任务[i+self.加入*6])
				zts:显示(self.x+88+58+xx*280,self.y+92+45+yy*85,"活跃度："..副本任务活跃[i+self.加入*6])
			end
			if self.按键数组[i]:事件判断() then
			    tp.窗口.玩法介绍:打开({总类="副本任务",分类=i+self.加入*6})
			end
			xx=xx+1
		end
		self.资源组[17]:显示(self.x+620,self.y+80-16)
		self.资源组[18]:显示(self.x+620,self.y+330+17)
	end
end

function 场景类_梦幻指引:取图标(内容)
	if 内容.总类=="日常任务" then
	    if 内容.分类==1 then
	        self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",3971456754)
	    elseif 内容.分类==2 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",1387446262)
	   	elseif 内容.分类==3 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0x45BDA0CD)
	    elseif 内容.分类==4 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",4271545734)
	    elseif 内容.分类==5 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",4271545734)
	    elseif 内容.分类==6 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",1153796395)
	    elseif 内容.分类==7 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",211127435)
	    elseif 内容.分类==8 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",1102456535)
	    elseif 内容.分类==9 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0x97C77FD8)
	    elseif 内容.分类==10 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0x97C77FD8)
	    elseif 内容.分类==11 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",211127435)
	    elseif 内容.分类==12 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",1572601177)
	    elseif 内容.分类==13 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",567106113)
	    end
	elseif 内容.总类=="限时活动" then
	    if 内容.分类==1 then
	        self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0x5A0E9307)
	    elseif 内容.分类==2 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",1241924823)
	   	elseif 内容.分类==3 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0x517A3AFF)
	    elseif 内容.分类==4 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0x016F4E03)
	    elseif 内容.分类==5 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0xA8BB247D)
	    elseif 内容.分类==6 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0x6CAD36E8)
	    elseif 内容.分类==7 then
	    	self.资源组[20]=资源:载入('item.wd1',"网易WDF动画",0xAEB5E00E)
	    elseif 内容.分类==8 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0x8FF330C0)
	    elseif 内容.分类==9 then
	    	self.资源组[20]=资源:载入('item.wd1',"网易WDF动画",0xD2DFDC4D)
	    elseif 内容.分类==10 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",94724302)
	    elseif 内容.分类==11 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0x9F6993FA)
	    elseif 内容.分类==12 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0xB39A2CAB)
	    elseif 内容.分类==13 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0x02A776DE)
	    elseif 内容.分类==14 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0x6CAD36E8)
	    elseif 内容.分类==15 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0x6CAD36E8)
	    end
	elseif 内容.总类=="进阶大神" then
	    if 内容.分类==1 then
	        self.资源组[20]=资源:载入('item.wd1',"网易WDF动画",0xD9BBCB07)
	    elseif 内容.分类==2 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0x60523FF1)
	   	elseif 内容.分类==3 then
	    	self.资源组[20]=资源:载入('item.wd1',"网易WDF动画",0x8E40DEC2)
	    elseif 内容.分类==4 then
	    	self.资源组[20]=资源:载入('item.wd1',"网易WDF动画",0x454120AE)
	    elseif 内容.分类==5 then
	    	self.资源组[20]=资源:载入('item.wd1',"网易WDF动画",0x5F338146)
	    elseif 内容.分类==6 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0xF5601CC2)
	    end
	elseif 内容.总类=="副本任务" then
	    if 内容.分类==1 then
	        self.资源组[20]=资源:载入('item.wd1',"网易WDF动画",0x002A5EAF)
	    elseif 内容.分类==2 then
	    	self.资源组[20]=资源:载入('item.wdf',"网易WDF动画",0x25492E36)
	    end
	end
end

function 场景类_梦幻指引:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_梦幻指引:初始移动(x,y)
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

function 场景类_梦幻指引:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_梦幻指引