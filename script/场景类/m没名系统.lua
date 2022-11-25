--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19.
-- @Last Modified time: 2021-02-03 00:38:39
--======================================================================--
local 场景类_奇经八脉 = class()

local floor = math.floor
local format = string.format
local insert = table.insert
local remove = table.remove
local mouseb = 引擎.鼠标弹起
local zts,zts1,tp

function 场景类_奇经八脉:初始化(根)
	self.ID = 332
	self.x = 110
	self.y = 47
	self.xx = 0
	self.yy = 0
	self.注释 = "奇经八脉"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.选中 = nil
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	self.窗口时间 = 0
end

function 场景类_奇经八脉:打开(数据)
	if self.可视 then
		self.头像 = nil
		self.选中 = nil
		self.可视 = false
		self.资源组 = nil
		self.资源组 = nil
		self.魂环组= nil
		self.法相组= nil
		self.异火组= nil
		self.神器组= nil
		return
	else
		-- self.数据 = 数据
		self.是否选的=0
		insert(tp.窗口_,self)
		self:加载数据()
		self:刷新数据(数据)
		tp.运行时间 = tp.运行时间 + 1
	 	self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end
function 场景类_奇经八脉:刷新数据(数据)
	self.数据=数据
	for i=1,#self.数据 do
		self.数据[i].位置=i
		if self.数据[i].境界==0 then
			self.数据[i].境界=self.数据[i].境界+1
			self.增加=true
		end
		if  self.数据[i].类型=="异火" then
			self.资源组[22]=self.异火组[self.数据[i].名称]
		end
		if self.数据[i].类型=="魂环" then
			self.资源组[24]=self.魂环组[self.数据[i].境界]
		end
		if self.数据[i].类型=="神器" then
			self.资源组[23]=self.神器组[self.数据[i].境界]
		end
		if self.数据[i].类型=="法相" then
			if tp.队伍[1].性别=="男" then
				self.资源组[21]=self.法相组[self.数据[i].境界+9]
			else
				self.资源组[21]=self.法相组[self.数据[i].境界]
			end
		end
		if self.增加 then
			self.数据[i].境界=self.数据[i].境界-1
		end
	end

end

function 场景类_奇经八脉:加载数据()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应

	self.资源组 = {
		[1] = 自适应.创建(0,1,630,567,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[6] = {},
		[7] = 资源:载入('wzife.wd4',"网易WDF动画",0x22D22D6D),
		[8] = 自适应.创建(5,1,600,519,3,9),
		[9] = 资源:载入('wzife.wd1',"网易WDF动画",0x1f24a7ee).精灵,--竖线
		[10] = 自适应.创建(1,1,592,18,1,3,nil,18),
		[11] = 资源:载入('wzife.wdf',"网易WDF动画",0xdd5d619),
		[12] = 资源:载入('wzife.wdf',"网易WDF动画",0xa856705b),
		[13] = 资源:载入('wzife.wd1',"网易WDF动画",0xECEDD9A8).精灵,--横线
		[21]={},
		[22]={},
		[23]={},
		[24]={},

	}
	self.魂环组={
		[1] = 资源:载入('shape.dll',"网易WDF动画",0x000D4719),
		[2] = 资源:载入('shape.dll',"网易WDF动画",0x000D4719),
		[3] = 资源:载入('shape.dll',"网易WDF动画",0x000D4719),
		[4] = 资源:载入('shape.dll',"网易WDF动画",0x000D4719),
		[5] = 资源:载入('shape.dll',"网易WDF动画",0x000D4719),
		[6] = 资源:载入('shape.dll',"网易WDF动画",0x000D4719),
		[7] = 资源:载入('shape.dll',"网易WDF动画",0x000D4719),

	}
	self.法相组={
		[1] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[2] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[3] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[4] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[5] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[6] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[7] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[8] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[9] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[10] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[11] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[12] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[13] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[14] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[15] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[16] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[17] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),
		[18] = tp.资源:载入("shape.dll","网易WDF动画",0x001BBE3F),


	}
	self.异火组={
		青莲地心火 = tp.资源:载入("shape.dll","网易WDF动画",0x0021C4AB),
		虚无吞炎 =  tp.资源:载入("shape.dll","网易WDF动画",0x0021C4AB),
	}
	self.神器组={
		[1] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[2] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[3] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[4] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[5] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[6] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[7] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[8] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[9] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[10] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[11] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[12] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[13] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[14] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[15] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[16] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[17] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),
		[18] = tp.资源:载入("shape.dll","网易WDF动画",0X0015159D),



	}
	--tp.提示:写入("#G没啥好名字起啊.,希望各位玩家多多提建议,采纳给奖励")
	self.资源组[9]:置区域(0,0,200,500)
	self.资源组[13]:置区域(0,0,185,5)

end

function 场景类_奇经八脉:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[8]:显示(self.x+14,self.y+30)
	self.资源组[2]:更新(x,y)
	if self.资源组[2]:事件判断() then
	   self.可视=false
	end
	self.资源组[9]:显示(self.x+25,self.y+40)
	self.资源组[9]:显示(self.x+400,self.y+40)
	self.资源组[9]:显示(self.x+212.5,self.y+40)

	self.资源组[10]:显示(self.x+6,self.y+3)
	self.资源组[13]:显示(self.x+25,self.y+240)
	self.资源组[13]:显示(self.x+415,self.y+240)



	self.资源组[13]:显示(self.x+25,self.y+400)
	self.资源组[13]:显示(self.x+200,self.y+400)
	self.资源组[13]:显示(self.x+300,self.y+400)
	self.资源组[13]:显示(self.x+415,self.y+400)



	--self.资源组[12]:显示(self.x+25,self.y+40)
	--self.资源组[12]:显示(self.x+400,self.y+40)
	--self.资源组[12]:显示(self.x+220,self.y+360)
	self.资源组[11]:显示(self.x+106,self.y+23)

	self.资源组[2]:显示(self.x+603,self.y+6)
	tp.窗口标题背景_:置区域(0,0,81,16)
	tp.窗口标题背景_:显示(self.x+272,self.y+3)
	zts1:置字间距(2)
	zts1:显示(self.x+281,self.y+3,"四大神兽")
	zts1:置字间距(0)
	-- self.资源组[3]:显示(self.x+350,self.y+415,true)
	-- self.资源组[4]:显示(self.x+445,self.y+415,true)
	-- self.资源组[5]:显示(self.x+520,self.y+415,true)

	self.资源组[24]:更新(dt)
	self.资源组[24]:显示(self.x+550,self.y+200)
	self.资源组[22]:更新(dt)
	self.资源组[22]:显示(self.x+100,self.y+150)
	self.资源组[23]:更新(dt)
	self.资源组[23]:显示(self.x+550,self.y+500)
	self.资源组[21]:更新(dt)
	self.资源组[21]:显示(self.x+100,self.y+500)
	if  tp.窗口_[tp.选中窗口]~=nil and tp.窗口_[tp.选中窗口].ID==self.ID then
			if self.资源组[21]:是否选中(x,y) then
				self.资源组[21]:置高亮()
				if  引擎.鼠标弹起(0) then
					tp.窗口.没名系统处理:打开(self.数据[1])
				end
			else
				self.资源组[21]:取消高亮()
			end
			if self.资源组[21]:是否选中(x,y)~=true and  self.资源组[24]:是否选中(x,y) then
				self.资源组[24]:置高亮()
				if  引擎.鼠标弹起(0) then
					tp.窗口.没名系统处理:打开(self.数据[4])
				end
			else
				self.资源组[24]:取消高亮()
			end
			if self.资源组[21]:是否选中(x,y)~=true and  self.资源组[22]:是否选中(x,y) then
				self.资源组[22]:置高亮()
				if  引擎.鼠标弹起(0) then
					tp.窗口.没名系统处理:打开(self.数据[2])
				end
			else
				self.资源组[22]:取消高亮()
			end

			if self.资源组[21]:是否选中(x,y)~=true and  self.资源组[23]:是否选中(x,y) then
				self.资源组[23]:置高亮()
				if  引擎.鼠标弹起(0) then
					tp.窗口.没名系统处理:打开(self.数据[3])
				end
			else
				self.资源组[23]:取消高亮()
			end
	end
	for i=1,4 do
		  if self.数据[i].等级==0 then
			self.资源组[20+i]:置颜色(1342177280)
		   elseif self.数据[i].等级==1 then
		   	  self.资源组[20+i]:置颜色(0XFF83c583)
		   elseif self.数据.等级==2 then
		   	  self.资源组[20+i]:置颜色(0XFF732d2b)
		   elseif self.数据[i].等级==3 then
		   	  self.资源组[20+i]:置颜色(0XFF735b2b)
		   elseif self.数据[i].等级==4 then
		   	  self.资源组[20+i]:置颜色(0XFFb2ab41)
		   elseif self.数据[i].等级==5 then
		   	  self.资源组[20+i]:置颜色(0XFF94be44)
		   elseif self.数据[i].等级==6 then
		   	  self.资源组[20+i]:置颜色(0XFF4fe14f)
		   elseif self.数据[i].等级==7 then
		   	  self.资源组[20+i]:置颜色(0XFF4fe1b9)
		   elseif self.数据[i].等级==8 then
		   	  self.资源组[20+i]:置颜色(0XFFfc1822)
		  end
	end

	-- self.资源组[21]:置颜色(1342177280)
	-- self.资源组[22]:置颜色(1342177280)
	-- self.资源组[23]:置颜色(1342177280)
	-- self.资源组[24]:置颜色(1342177280)
end

function 场景类_奇经八脉:检查点(x,y)
	if self.可视 and self.资源组 ~= nil and  self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_奇经八脉:初始移动(x,y)
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

function 场景类_奇经八脉:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end





return 场景类_奇经八脉