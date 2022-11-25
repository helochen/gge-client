local 拍卖系统管理 = class()
local insert = table.insert
local floor = math.floor
local min = math.min
local max = math.max
local ceil = math.ceil
local tp,ptzt,mbzt
local box = 引擎.画矩形
local bw = require("gge包围盒")(0,0,54,54)
local bw1 = require("gge包围盒")(0,0,242,20)
function 拍卖系统管理:初始化(根)
	self.ID = 803
	self.x = math.floor((全局游戏宽度-580)/2)
	self.y = math.floor((全局游戏高度-481)/2)
	self.xx = 0
	self.yy = 0
	self.注释 = "拍卖系统管理"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
	ptzt = tp.字体表.普通字体
	mbzt = tp.字体表.描边字体
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("银两输入",0,0,96,16)
	self.输入框:置可视(false,false)
	self.输入框:置数字模式()
	self.输入框:置限制字数(12)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	self.保证金输入框 = 总控件:创建输入("保证金输入",0,0,96,16)
	self.保证金输入框:置可视(false,false)
	self.保证金输入框:置数字模式()
	self.保证金输入框:置限制字数(12)
	self.保证金输入框:置光标颜色(-16777216)
	self.保证金输入框:置文字颜色(-16777216)
	self.起拍输入框 = 总控件:创建输入("起拍时间输入",0,0,196,16)
	self.起拍输入框:置限制字数(20)
	self.起拍输入框:置可视(false,false)
	self.起拍输入框:置光标颜色(-16777216)
	self.起拍输入框:置文字颜色(-16777216)
	self.结束输入框 = 总控件:创建输入("结束时间输入",0,0,196,16)
	self.结束输入框:置限制字数(20)
	self.结束输入框:置可视(false,false)
	self.结束输入框:置光标颜色(-16777216)
	self.结束输入框:置文字颜色(-16777216)
	self.加价输入框 = 总控件:创建输入("加价输入",0,0,196,16)
	self.加价输入框:置限制字数(12)
	self.加价输入框:置可视(false,false)
	self.加价输入框:置光标颜色(-16777216)
	self.加价输入框:置文字颜色(-16777216)
end

function 拍卖系统管理:打开(数据)
	if self.可视 then
		self.可视 = false
		self.资源组 = nil
		self.按钮组 = nil
		self.输入框:置可视(false,false)
		self.保证金输入框:置可视(false,false)
		self.起拍输入框:置可视(false,false)
		self.结束输入框:置可视(false,false)
		self.输入框:置文本("")
		self.保证金输入框:置文本("")
		self.起拍输入框:置文本("")
		self.结束输入框:置文本("")
		self.加价输入框:置文本("")
		return
	else
		insert(tp.窗口_,self)
		self:加载数据()
		self.输入框:置可视(true,true)
		self.保证金输入框:置可视(true,true)
		self.起拍输入框:置可视(true,true)
		self.结束输入框:置可视(true,true)
		self.加价输入框:置可视(true,true)
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.分类="物品"
	    self.选中=0
	    self.类型="点卡"
		self.物品 = {}
		for i=1,20 do
			self.物品[i] = tp._物品格子.创建(0,0,i,"炼妖物品")
			self.物品[i]:置物品(数据[i])
		end
		self.选中物品 = tp._物品格子.创建(0,0,0,"炼妖_物品")
	end
end

function 拍卖系统管理:加载数据()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应

	self.资源组 = {
		[1] = 自适应.创建(0,1,580,481,3,9),--底图
		[2] = 自适应.创建(1,1,548,18,1,3,nil,18),--顶部背景框
		[3] = 自适应.创建(2,1,256,210,3,9),--模型背景框
		[4] = 自适应.创建(3,1,110,19,1,3),--输入背景框框
		[5] = 自适应.创建(3,1,210,19,1,3),--输入背景框框
	}
	self.按钮组 = {
		[1] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[2] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"　物品"),
		[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true," 召唤兽"),
		[4] = 按钮.创建(自适应.创建(12,4,101,22,1,3),0,0,4,true,true,"开启拍卖系统"),
		[5] = 按钮.创建(自适应.创建(12,4,101,22,1,3),0,0,4,true,true,"关闭拍卖系统"),
		[6] = 按钮.创建(自适应.创建(12,4,101,22,1,3),0,0,4,true,true,"清空全部数据"),
		[7] = 按钮.创建(自适应.创建(12,4,101,22,1,3),0,0,4,true,true,"查询拍品数量"),
		[8] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"切换"),
		[9] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"清除输入"),
		[10] = 按钮.创建(自适应.创建(12,4,101,22,1,3),0,0,4,true,true,"　提交数据"),
	}

	for n=1,10 do
	    self.按钮组[n]:绑定窗口_(803)
	end
end

function 拍卖系统管理:刷新数据(数据)
	for i=1,20 do
		self.物品[i]:置物品(nil)
		self.物品[i]:置物品(数据[i])
	end
	self.选中物品:置物品(nil)
	self.选中=0
end

function 拍卖系统管理:显示(dt,x,y)
	self.焦点 = false
	self.右键关闭 = nil
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+6,self.y+3)
	self.资源组[4]:显示(self.x+430,self.y+90)
	self.资源组[4]:显示(self.x+430,self.y+120)
	self.资源组[4]:显示(self.x+430,self.y+150)
	self.资源组[5]:显示(self.x+330,self.y+210)
	self.资源组[5]:显示(self.x+330,self.y+270)
	self.资源组[4]:显示(self.x+430,self.y+300)
	tp.窗口标题背景_:置区域(0,0,80,16)
	tp.窗口标题背景_:显示(self.x+227,self.y+4)
	mbzt:置颜色(白色):显示(self.x+228,self.y+3,self.注释)

	self.控件类:更新(dt,x,y)
	self.控件类:显示(dt,x,y)

	for i=1,10 do
		self.按钮组[i]:更新(x,y)
	end

	self.按钮组[1]:显示(self.x+558,self.y+4)
	self.按钮组[2]:显示(self.x+75,self.y+40)
	self.按钮组[3]:显示(self.x+175,self.y+40)
	self.按钮组[4]:显示(self.x+61,self.y+317)
	self.按钮组[5]:显示(self.x+61,self.y+349)
	self.按钮组[6]:显示(self.x+191,self.y+317)
	self.按钮组[7]:显示(self.x+191,self.y+349)
	self.按钮组[8]:显示(self.x+497,self.y+148)
	self.按钮组[9]:显示(self.x+343,self.y+62)
	self.按钮组[10]:显示(self.x+388,self.y+335)

	self.输入框:置坐标(self.x+442,self.y+93)
	self.保证金输入框:置坐标(self.x+442,self.y+123)
	self.起拍输入框:置坐标(self.x+337,self.y+213)
	self.结束输入框:置坐标(self.x+337,self.y+273)
	self.加价输入框:置坐标(self.x+442,self.y+273+30)
	ptzt:置颜色(白色):显示(self.x+330,self.y+38,"当前选中数据：")
	ptzt:置颜色(白色):显示(self.x+330,self.y+93,"设置起拍价：")
	ptzt:置颜色(白色):显示(self.x+330,self.y+123,"设置保证金：")
	ptzt:置颜色(白色):显示(self.x+330,self.y+153,"设置价格类型：")
	ptzt:置颜色(白色):显示(self.x+330,self.y+183,"设置起拍时间：")
	ptzt:置颜色(白色):显示(self.x+330,self.y+243,"设置结束时间：")
	ptzt:置颜色(黄色):显示(self.x+433,self.y+183,"年-月-日-时-分-秒")
	ptzt:置颜色(黄色):显示(self.x+433,self.y+243,"2020-12-1-12-30-0")
	ptzt:置颜色(白色):显示(self.x+330,self.y+303,"设置加价幅度：")
	mbzt:置颜色(黄色):显示(self.x+310,self.y+330+30,"年-月-日省略为当天，分-秒省略为整点")
	mbzt:置颜色(黄色):显示(self.x+310,self.y+350+30,"如当天的20点30分，填写【20-30】即可")
	mbzt:置颜色(黄色):显示(self.x+310,self.y+370+30,"如当天的上午9点整，只需填写【9】即可")
	ptzt:置颜色(黄色):显示(self.x+310,self.y+390+30,"结束时间为空则自动取起拍时间+30分钟")
	ptzt:置颜色(黄色):显示(self.x+310,self.y+410+30,"保证金为空则自动取为起拍价的一半")
	ptzt:置颜色(黄色):显示(self.x+310,self.y+410+50,"加价幅度为空即不限制")




	if self.分类=="物品" then
		tp.物品界面背景_:显示(self.x+50,self.y+80)
		tp.物品格子背景_:显示(self.x+466,self.y+22)

		local p = 0
		for h=0,3 do
			for l=0,4 do
				p = p + 1
				self.物品[p]:置坐标(l * 51 + self.x+51,h * 51+self.y+80)
				self.物品[p]:显示(dt,x,y,self.鼠标)
				if self.物品[p].物品 ~= nil and self.物品[p].焦点 then
					tp.提示:道具行囊(x,y,self.物品[p].物品)
					if 引擎.鼠标弹起(0) then
						self.选中物品:置物品(self.物品[p].物品)
						self.选中 = p
					end
				end
			end
		end
		if self.选中~=0 then
			self.选中物品:置坐标(self.x+468,self.y+22)
			self.选中物品:显示(dt,x,y,self.鼠标)
			if self.选中物品.物品 ~= nil and self.选中物品.焦点 then
				tp.提示:道具行囊(x,y,self.选中物品.物品)
			end
			ptzt:置颜色(黑色):显示(self.x+442,self.y+153,self.类型)
		end
	elseif self.分类=="召唤兽" then
		self.资源组[3]:显示(self.x+50,self.y+80)
		self.资源组[4]:显示(self.x+430,self.y+35)
		self.右键关闭 = nil
		local bbs = tp.队伍[1].宝宝列表
		for i=1,7 do
			if bbs[i] ~= nil  then
				bw1:置坐标(self.x+55,self.y+113+(i-1)*21)
				if self.选中 ~= i then
					if bw1:检查点(x,y) and self.鼠标 and not tp.消息栏焦点 then
						box(self.x+55,self.y+113+(i-1)*21,self.x+300,self.y+133+(i-1)*21,-3551379)
						if 引擎.鼠标弹起(0) then
							self.选中 = i
						elseif 引擎.鼠标弹起(1) then
							self.右键关闭 = true
							tp.窗口.召唤兽查看栏:打开(tp.队伍[1].宝宝列表[i])
						end
						self.焦点 = true
					end
				else
					if bw1:检查点(x,y) then
						if 引擎.鼠标弹起(1) and self.鼠标 and not tp.消息栏焦点 then
							self.右键关闭 = true
							tp.窗口.召唤兽查看栏:打开(tp.队伍[1].宝宝列表[i])
						end
						self.焦点 = true
					end
					box(self.x+55,self.y+113+(i-1)*21,self.x+300,self.y+133+(i-1)*21,-10790181)
				end
				ptzt:置颜色(-16777216):显示(self.x+55,self.y+92,"召唤兽名称")
				ptzt:置颜色(-16777216):显示(self.x+205,self.y+92,"等级")
				ptzt:置颜色(-16777216):显示(self.x+55,self.y+116+(i-1)*21,bbs[i].名称)
				ptzt:置颜色(-16777216):显示(self.x+210,self.y+116+(i-1)*21,bbs[i].等级)

				if self.选中~=0 then
					ptzt:置颜色(-16777216):显示(self.x+442,self.y+38,bbs[self.选中].名称)
					ptzt:置颜色(黑色):显示(self.x+442,self.y+153,self.类型)
				end

			end
		end
	end



	if self.按钮组[1]:事件判断() then
		self:打开()
		return false
	elseif self.按钮组[2]:事件判断() then
		self.选中物品:置物品(nil)
		self.选中=0
		self.分类="物品"
	elseif self.按钮组[3]:事件判断() then
		self.选中物品:置物品(nil)
		self.选中=0
		self.分类="召唤兽"
	elseif self.按钮组[4]:事件判断() then--开启拍卖系统
		发送数据(6388,{事件="开启"})
	elseif self.按钮组[5]:事件判断() then--关闭拍卖系统
		发送数据(6388,{事件="关闭"})
	elseif self.按钮组[6]:事件判断() then--清空全部数据
		发送数据(6388,{事件="清空"})
	elseif self.按钮组[7]:事件判断() then--查看当前数据
		发送数据(6388,{事件="查询"})
	elseif self.按钮组[8]:事件判断() then--切换
		if self.类型=="点卡" then
			self.类型="点卡"
		else
		    self.类型="点卡"
		end
		tp.提示:写入("#Y/当前仅支持点卡拍卖")
	elseif self.按钮组[9]:事件判断() then--清除输入
		self.输入框:置文本("")
		self.保证金输入框:置文本("")
		self.起拍输入框:置文本("")
		self.结束输入框:置文本("")
		self.加价输入框:置文本("")
		self.选中物品:置物品(nil)
		self.选中=0
	elseif self.按钮组[10]:事件判断() then--提交数据
		if self.选中==0 or tonumber(self.输入框:取文本())==nil or self.起拍输入框:取文本()=="" then
			tp.提示:写入("#Y/输入错误")
			return false
		end
		local 起拍价 = tonumber(self.输入框:取文本())
		local 保证金 = ceil(起拍价/2)
		local 加价 = 1

		if self.保证金输入框:取文本()~="" then
			保证金 = tonumber(self.保证金输入框:取文本())
		end
		local 起拍时间 = self:时间戳转换(self.起拍输入框:取文本())
		local 结束时间 = 起拍时间+1800
		if self.结束输入框:取文本()~="" then
			结束时间 = self:时间戳转换(self.结束输入框:取文本())
		end
		if self.加价输入框:取文本()~="" then
			加价 = tonumber(self.加价输入框:取文本())
		end
	    发送数据(6388,{事件="添加",选中=self.选中,起拍价=起拍价,保证金=保证金,起拍时间=起拍时间,结束时间=结束时间,加价=加价,分类=self.分类,类型=self.类型})

	end


	if self.输入框._已碰撞 or self.起拍输入框._已碰撞 or self.结束输入框._已碰撞 or self.加价输入框._已碰撞 then
		self.焦点 = true
	end
end

function 拍卖系统管理:时间戳转换(str)
	local timeArray = 分割文本(str,"-")
	local nowTime = os.time()
	if #timeArray > 3 then
		return os.time({year=timeArray[1], month=timeArray[2], day=timeArray[3], hour=timeArray[4], min=timeArray[5], sec=timeArray[6]})
	else
		return os.time({year=tonumber(os.date("%Y",nowTime)),month=tonumber(os.date("%m",nowTime)),day=tonumber(os.date("%d",nowTime)),hour=timeArray[1], min=timeArray[2], sec=timeArray[3]})
	end
end

function 拍卖系统管理:检查点(x,y)
	if self.可视 and self.资源组~=nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 拍卖系统管理:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if  self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 拍卖系统管理:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 拍卖系统管理