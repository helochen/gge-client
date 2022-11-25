
local 人物界面 = class()
local 按钮组 = {'给予',"组队","好友","团队","观察","交易","装备","攻击","信息","临时",}
local insert = table.insert
local zt
function 人物界面:初始化(根)
	self.可视 = false
	self.可移动 = true
	tp = 根
	self.窗口时间 = 0
	self.鼠标 = false
	self.焦点 = false
	self.x = 380
	self.y = 80
	self.xx = 0
	self.yy = 0
	zt = tp.字体表.普通字体__
end
function 人物界面:打开(数据)
	if self.可视 then
		self.可视 = false
		self.资源组 = nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.资源组 = {
			[1] = 资源:载入('wzife.wdf',"网易WDF动画",0x770F5F96), --介绍
			[2] = 资源:载入('wzife.wdf',"网易WDF动画",0xA0D00989), --按钮背景
		}
		for i=1,10 do
			self.资源组[i+2] = 按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x91D4E204),0,0,4,true,true,按钮组[i])
			self.资源组[i+2]:置偏移(-2,0)
		end

		self.玩家名称 = 数据[1]
		self.玩家id = 数据[2]
		self.玩家门派 = 数据[3]
		self.模型 = 数据[4]
		local s = 引擎.取头像(self.模型)
		self.资源组[13] = tp.资源:载入(s[7],"网易WDF动画",s[2])
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end


function 人物界面:检查点(x,y)
	if self.资源组 ~= nil and (self.资源组[1]:是否选中(x,y) or self.资源组[2]:是否选中(x,y)  or self.资源组[13]:是否选中(x,y))  then
		return true
	end
end

function 人物界面:显示(dt,x,y)
	for i=1,10 do
	    self.资源组[i+2]:更新(x,y)
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x,self.y+50)
	tp.人物头像背景_:显示(self.x-50,self.y-3)
	self.资源组[13]:显示(self.x-47,self.y)
	zt:置颜色(黄色)
	zt:显示(self.x+8,self.y+2,self.玩家名称)
	zt:显示(self.x+8,self.y+20,self.玩家id)  --修改id显示
	zt:显示(self.x+8,self.y+36,self.玩家门派 or "无门派")
	zt:置颜色(白色)
	local xxx,yyy = 0,0
	for i=1,10 do
		if yyy >= 5 then
			yyy = 0
			xxx = 1
		end
	    self.资源组[i+2]:显示(self.x+8+xxx*50,self.y+55+yyy*25,nil,2)
	    yyy = yyy + 1
	end
	if self.资源组[3]:事件判断() then --给予
		人物点击=true
		发送数据(3716,{id=self.玩家id})
	elseif self.资源组[4]:事件判断() then --组队
		人物点击=true
		发送数据(4002,{id=self.玩家id})
	elseif self.资源组[5]:事件判断() then
		发送数据(18,{名称=self.玩家名称,id=self.玩家id,类型=1})
	elseif self.资源组[6]:事件判断() then

	elseif self.资源组[7]:事件判断() then

	elseif self.资源组[8]:事件判断() then --交易类
		人物点击=true
		发送数据(3718,{id=self.玩家id})
	elseif self.资源组[9]:事件判断() then

	elseif self.资源组[10]:事件判断() then
		人物点击=true
		发送数据(33,{序列=self.玩家id})
	elseif self.资源组[11]:事件判断() then

	elseif self.资源组[12]:事件判断() then

	end
end

function 人物界面:初始移动(x,y)
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

function 人物界面:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

function 人物界面:更新(dt)end
return 人物界面