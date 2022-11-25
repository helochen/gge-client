local 魂环洗练 = class()

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

function 魂环洗练:初始化(根)
	self.ID = 41
	--宽高 549 431
	self.x = 310
	self.y = 105
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
	zts = tp.字体表.普通字体
	zta = tp.字体表.普通字体
	zts1 = tp.字体表.普通字体
	hg1 = tp.文字类.创建(wdf配置.."/font/simsun.ttc", 17)
	hg2 = tp.文字类.创建(wdf配置.."/font/simsun.ttc", 16)
	hg3 = tp.字体表.普通字体
	self.分类选中=""
	self.子类选中=""
	self.玩法介绍内容=""
	a1 = 0
    a2 = 0
    a3 = 0
    a4 = 0
    a5 = 0
    a6 = 0
    a7 = 0
    a8 = 0
    a9 = 0
    a10 = 0
	消耗数量 = 0
	强化消耗 = 0
	锁定个数 = 0
end
function 魂环洗练:打开(魂环,魂环id)
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
			--[1] = 自适应.创建(0,1,260,350,3,9),
		[1] = 资源:载入('wpal/121.wpal',"网易WDF动画",0x0000b054),
		    [2] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEE171330),0,0,1,true,true),
		    [3] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEE171330),0,0,1,true,true),
		    [4] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEE171330),0,0,1,true,true),
		    [5] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEE171330),0,0,1,true,true),
		    [6] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEE171330),0,0,1,true,true),
		    [7] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEE171330),0,0,1,true,true),
		    [8] = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0xEE171330),0,0,1,true,true),
		    --[11] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
			[9] = 按钮.创建(自适应.创建(12,4,60,20,1,3),0,0,4,true,true," 洗 练 "),
			[10] = 按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true," 强 化 "),
			[12] = 资源:载入('hungu.wdf',"网易WDF动画",0x00001239),
			[13] = 资源:载入('hungu.wdf',"网易WDF动画",0x00001237),
			[14] = 资源:载入('hungu.wdf',"网易WDF动画",0x00001241),
			[15] = 资源:载入('hungu.wdf',"网易WDF动画",0x00001243),
			[16] = 资源:载入('hungu.wdf',"网易WDF动画",0x00001245),
			[17] = 资源:载入('hungu.wdf',"网易WDF动画",0x00001247),

		}
		self.资源组[2]:置打勾框(false)
		self.资源组[3]:置打勾框(false)
		self.资源组[4]:置打勾框(false)
		self.资源组[5]:置打勾框(false)
		self.资源组[6]:置打勾框(false)
		self.资源组[7]:置打勾框(false)
		self.资源组[8]:置打勾框(false)
		self.魂骨模型组={}
		self.魂环条数=0
		self.状态 = 1
		self.加入 = 0
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		self.魂环=魂环
		self.魂环id=魂环id
	end
end
function 魂环洗练:刷新(内容)
    self.魂环=内容[1]
    self.魂环id=内容[2]
end
function 魂环洗练:显示(dt,x,y)
	self.资源组[1]:显示(self.x,self.y)
    if self.魂环.名称== "百年·魂环" then
	   self.资源组[12]:显示(self.x+35,self.y+60)
	elseif self.魂环.名称== "千年·魂环" then
       self.资源组[13]:显示(self.x+35,self.y+60)
	elseif self.魂环.名称== "万年·魂环" then
       self.资源组[14]:显示(self.x+35,self.y+60)
	elseif self.魂环.名称== "十万年·魂环" then
       self.资源组[15]:显示(self.x+35,self.y+60)
	elseif self.魂环.名称== "百万年·魂环" then
       self.资源组[16]:显示(self.x+35,self.y+60)
	elseif self.魂环.名称== "神级·魂环" then
	   self.资源组[17]:显示(self.x+35,self.y+60)
	end
	for n = 2,10 do
	  self.资源组[n]:更新(x,y)
	end
	self.焦点 = false
	锁定个数 =a1+a2+a3+a4+a5+a6+a7
    消耗数量 = 1
	if 锁定个数 == 1 then
	消耗数量 = 消耗数量 + 1
	elseif 锁定个数 == 2 then
	消耗数量 = 消耗数量 + 3
	elseif 锁定个数 == 3 then
	消耗数量 = 消耗数量 + 7
	elseif 锁定个数 == 4 then
	消耗数量 = 消耗数量 + 15
	elseif 锁定个数 == 5 then
	消耗数量 = 消耗数量 + 31
	elseif 锁定个数 == 6 then
	消耗数量 = 消耗数量 + 61
	elseif 锁定个数 == 7 then
	消耗数量 = 消耗数量 + 127
	end
	强化消耗 = (self.魂环.等级+10)/2
	if self.资源组[2]:事件判断() then
		if a1 == 0 then
			self.资源组[2]:置打勾框(true)
			a1 = 1
		elseif a1 == 1 then
			a1 = 0
			self.资源组[2]:置打勾框(false)
		end
	elseif self.资源组[3]:事件判断() then
		if a2 == 0 then
			self.资源组[3]:置打勾框(true)
			a2 = 1
		elseif a2 == 1 then
			a2 = 0
			self.资源组[3]:置打勾框(false)
		end
	elseif self.资源组[4]:事件判断() then
		if a3 == 0 then
			self.资源组[4]:置打勾框(true)
			a3 = 1
		elseif a3 == 1 then
			a3 = 0
			self.资源组[4]:置打勾框(false)
	    end
	elseif self.资源组[5]:事件判断() then
		if a4 == 0 then
			self.资源组[5]:置打勾框(true)
			a4 = 1
		elseif a4 == 1 then
			a4 = 0
			self.资源组[5]:置打勾框(false)
		end
	elseif self.资源组[6]:事件判断() then
		if a5 == 0 then
			self.资源组[6]:置打勾框(true)
			a5 = 1
		elseif a5 == 1 then
			a5 = 0
			self.资源组[6]:置打勾框(false)
		end
	elseif self.资源组[7]:事件判断() then
		if a6 == 0 then
			self.资源组[7]:置打勾框(true)
			a6 = 1
		elseif a6 == 1 then
			a6 = 0
			self.资源组[7]:置打勾框(false)
	    end
	elseif self.资源组[8]:事件判断() then
		if a7 == 0 then
			self.资源组[8]:置打勾框(true)
			a7 = 1
		elseif a7 == 1 then
			a7 = 0
			self.资源组[8]:置打勾框(false)
		end
	end
	if a1 == 1 then
	   self.资源组[2]:置打勾框(true)
	end
	if a2 == 1 then
	   self.资源组[3]:置打勾框(true)
	end
	if a3 == 1 then
	   self.资源组[4]:置打勾框(true)
	end
	if a4 == 1 then
	   self.资源组[5]:置打勾框(true)
	end
	if a5 == 1 then
	   self.资源组[6]:置打勾框(true)
	end
	if a6 == 1 then
	   self.资源组[7]:置打勾框(true)
	end
	if a7 == 1 then
	   self.资源组[8]:置打勾框(true)
	end
    --tp.窗口标题:显示(self.x+60,self.y)
	zts1:置字间距(2)
	zts1:置颜色(黑色)
	zts1:显示(self.x+100,self.y+4,"魂环洗练")
	zts1:置字间距(0)
	hg1:置字间距(3)
	hg1:置颜色(黑色)
	hg1:显示(self.x+95,self.y+40,self.魂环.名称)
	hg1:置颜色(紫色)
    hg1:显示(self.x+100,self.y+100,"洗练属性:")
    hg3:置颜色(黑色)
    hg3:显示(self.x+100,self.y+60,"等级:  "..self.魂环.等级)
    hg3:显示(self.x+100,self.y+80,self.魂环.幻化属性.基础.类型..":  "..self.魂环.幻化属性.基础.数值)
	for n=1,#self.魂环.幻化属性.附加 do
	   self.资源组[n+1]:显示(self.x+50,self.y+95+n*25)
	   self.魂环条数=self.魂环条数+1
	   hg3:置颜色(黑色)
	   hg3:显示(self.x+100,self.y+98+n*25,self.魂环.幻化属性.附加[n].类型..":  "..self.魂环.幻化属性.附加[n].数值)
	   hg3:置颜色(绿色)
	   hg3:显示(self.x+230,self.y+98+n*25,"["..self.魂环.幻化属性.附加[n].强化.."]")
    end
	self.资源组[9]:显示(self.x+65,self.y+329)
	self.资源组[10]:显示(self.x+178,self.y+329)
	hg3:置颜色(红色)
	hg3:显示(self.x+20,self.y+310,"[洗魂符]")
	hg3:置颜色(黑色)
	hg3:显示(self.x+80,self.y+310,"洗练消耗："..消耗数量)
	hg3:显示(self.x+170,self.y+310,"强化消耗："..强化消耗)
	if self.资源组[9]:事件判断() then
	 	发送数据(3769,{锁定数据={[1]=a1,[2]=a2,[3]=a3,[4]=a4,[5]=a5,[6]=a6,[7]=a7},魂环id=self.魂环id,消耗数量=消耗数量,魂环条数=self.魂环条数})
	elseif 	self.资源组[10]:事件判断() then
		发送数据(3771,{魂环id=self.魂环id,强化消耗=强化消耗})
	end
	self.魂环条数=0
end

function 魂环洗练:检查点(x,y)
	if self.可视 and self.资源组[1] ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 魂环洗练:初始移动(x,y)
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

function 魂环洗练:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 魂环洗练