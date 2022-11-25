--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-01-01 20:07:23
--============================,==========================================--
local 场景类_抽奖系统栏 = class()

local qmx = 引擎.取模型
local zts,zts1,tp
local insert = table.insert

function 场景类_抽奖系统栏:初始化(根)
	self.ID = 266
	self.x = 345
	self.y = 120
	self.xx = 0
	self.yy = 0
	self.注释 = "抽奖系统栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.按钮禁止 = false
	self.窗口时间 = 1
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	zts2 = require("gge文字类").创建("wdf/font/宋体.ttf",12,false,false,true):置行间距(1)
	zts3 = require("gge文字类").创建("wdf/font/宋体.ttf",14,false,false,true):置行间距(1)
	zts4 = require("gge文字类").创建("wdf/font/宋体.ttf",14,false,false,true):置行间距(1)
	zts5 = require("gge文字类").创建("wdf/font/宋体.ttf",12,false,false,true):置行间距(1)
end

function 场景类_抽奖系统栏:打开()
	if self.可视 then
		self.可视 = false
		self.资源组=nil
		return
	else
		insert(tp.窗口_,self)
		self:加载数据()
		self.物品数据2 = tp.物品数据库提示
		self.物品库 = self.物品数据2.物品
	    self.物品库1 = self.物品数据2.物品1
	    self.物品库2 = self.物品数据2.物品2
	    self.物品库3 = self.物品数据2.物品3
	    self.物品库4 = self.物品数据2.物品4
	    self.次数 = self.物品数据2.抽奖次数
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_抽奖系统栏:加载数据()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,285,191,3,9),
		--[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(13,4,70,22,1,3),0,0,4,true,true,"点击抽奖"),
        [4] = 按钮.创建(自适应.创建(13,4,45,22,1,3),0,0,4,true,true,"停止"),
		[5] = 资源:载入('wzife.wd4',"网易WDF动画",0x8789ADD0),
		[6] = 资源:载入('wzife.wd4',"网易WDF动画",0x15FD4546),
		[7] = 资源:载入('wzife.wd4',"网易WDF动画",0x996D0CAE),
		[8] = 自适应.创建(2,1,97,97,3,9),
		[9] = 自适应.创建(1,1,281,18,1,3,nil,18),
		[10] = 自适应.创建(3,1,120,19,1,3),
		[11] = 资源:载入('wzife.wd4',"网易WDF动画",0x70274B36),
		[12] = 资源:载入('wzife.wd1',"网易WDF动画",0x3C5980),
	}
	for n=3,4 do
	    self.资源组[n]:绑定窗口_(266)
	end
	-- self.资源组[3]:置偏移(-1,0)
end

function 场景类_抽奖系统栏:显示(dt,x,y)
	self.焦点 = false
	--self.资源组[2]:更新(x,y)
	self.资源组[5]:更新()
	self.资源组[6]:更新()
	self.资源组[7]:更新()
	self.资源组[11]:更新()
	self.资源组[12]:更新()
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[9]:显示(self.x+6,self.y+3)
	self.资源组[5]:显示(self.x,self.y+3)
	self.资源组[6]:显示(self.x+10,self.y+192)
	self.资源组[7]:显示(self.x+10,self.y+10)
	self.资源组[11]:显示(self.x+50,self.y+50)
	self.资源组[11]:显示(self.x+100,self.y+50)
	self.资源组[11]:显示(self.x+150,self.y+50)
	self.资源组[11]:显示(self.x+200,self.y+50)
	self.资源组[11]:显示(self.x+250,self.y+50)
	self.资源组[12]:显示(self.x+45,self.y+80)
	tp.窗口标题背景_:置区域(0,0,75,16)
	tp.窗口标题背景_:显示(self.x+110,self.y+3)
	zts1:显示(self.x+117,self.y+3,"抽奖系统")
	zts3:置颜色(黄色):显示(self.x+50,self.y+120,"你当前剩余抽奖次数为：   次")
	zts3:置颜色(红色):显示(self.x+200,self.y+120,self.次数)
	if self.按钮禁止 == false then
       self.资源组[3]:更新(x,y)
    end
	self.资源组[3]:显示(self.x + 80,self.y + 155,true)
	if self.按钮禁止 == true then
	   self.资源组[4]:更新(x,y)
	end
	self.资源组[4]:显示(self.x + 160,self.y + 155,true)
	if self.停止显示 == false or self.停止显示 == nil then
		if self.停止 == nil then
		   zts5:置颜色(0xFFFF68E1):显示(self.x+120,self.y+85,"观照万象")
		else
		   if self.基础概率<= self.概率 then
		   	真正给予的物品 = 真正物品[5]
		   elseif self.基础概率 <= self.概率1 then
		   	真正给予的物品 = 真正物品[4]
		   elseif self.基础概率 <= self.概率2 then
		   	真正给予的物品 = 真正物品[3]
		   elseif self.基础概率 <= self.概率2 then
		   	真正给予的物品 = 真正物品[2]
		   else
		   	真正给予的物品 = 真正物品[1]
		   end
	       if 真正给予的物品 == 真正物品[1] then
	       	   真正颜色 = 白色
	       elseif 真正给予的物品 == 真正物品[2] then
	       	   真正颜色 = 绿色
	       elseif 真正给予的物品 == 真正物品[3] then
	           真正颜色 = 红色
	       elseif 真正给予的物品 == 真正物品[4] or 真正给予的物品 == 真正物品[5] then
	           真正颜色 = 0xFFFF68E1
	       end
		   zts5:置颜色(真正颜色):显示(self.x+120,self.y+85,真正给予的物品)
		   if self.刷新 == true then
	          发送数据(112.2,{道具=真正给予的物品})
	          self.刷新 = false
	      end
		end
	else
	  if self.停止 == 1 then
	    物品 = self.物品库[取随机数(1,#self.物品库)]
	    物品1 = self.物品库1[取随机数(1,#self.物品库1)]
	    物品2 = self.物品库2[取随机数(1,#self.物品库2)]
	    物品3 = self.物品库3[取随机数(1,#self.物品库3)]
	    物品4 = self.物品库4[取随机数(1,#self.物品库4)]
	    真正物品 = {物品,物品1,物品2,物品3,物品4}
	    真正给予物品 = 真正物品[取随机数(1,#真正物品)]
	    if 真正给予物品 == 真正物品[1] then
	    	真正颜色 = 白色
	    elseif 真正给予物品 == 真正物品[2] then
	    	真正颜色 = 绿色
	    elseif 真正给予物品 == 真正物品[3] then
	        真正颜色 = 红色
	    elseif 真正给予物品 == 真正物品[4] or 真正给予物品 == 真正物品[5] then
	    	真正颜色 = 0xFFFF68E1
	    end
		zts5:置颜色(真正颜色):显示(self.x+120,self.y+85,真正给予物品)
	  end
	end
	if self.资源组[3]:事件判断() and 引擎.鼠标弹起(左键) then
	  if self.次数 <= 0 then
	   tp.提示:写入("#Y你的抽奖次数不足，无法进行抽奖")
	   return
	  else
	   self.停止显示 = true
	   self.停止 = 1
	   self.按钮禁止 = true
	  end
	end
	if self.资源组[4]:事件判断() and 引擎.鼠标弹起(左键) then
	   self.停止显示 = false
	   self.停止 = 2
	   self.按钮禁止 = false
	   self.基础概率 = self.物品数据2.基础概率
	   self.概率 = self.物品数据2.概率
	   self.概率1 = self.物品数据2.概率1
	   self.概率2 = self.物品数据2.概率2
	   self.概率3 = self.物品数据2.概率3
	   self.刷新 = true
	   self:打开()
	   发送数据(112.1)
	end
end

function 场景类_抽奖系统栏:检查点(x,y)
	if self.可视 and  self.资源组~=nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_抽奖系统栏:初始移动(x,y)
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

function 场景类_抽奖系统栏:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_抽奖系统栏