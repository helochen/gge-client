
local 好友查找类 = class()

local tp,zts,zts1
local 取头像 = 引擎.取头像
local bw = require("gge包围盒")(0,0,153,58)
local mouseb = 引擎.鼠标弹起
local box = 引擎.画矩形
local insert = table.insert

function 好友查找类:初始化(根)
	self.ID = 99001
	self.x = 350
	self.y = 150
	self.xx = 0
	self.yy = 0
	self.焦点 = false
	self.注释 = "好友查找类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.窗口时间 = 0
	self.查找结果={}

	self.资源组 = {
		[12] = 资源:载入('wzife.wdf',"网易WDF动画",0X60D3F930),
	    [13] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"查找"),
	    [14] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"添加好友"),
	    [15] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"临时好友"),
	    [16] = 按钮.创建(自适应.创建(12,3,60,22,1,3),0,0,4,true,true,"黑名单"),
	    [17] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
	}
	tp = 根
	zts = tp.字体表.普通字体

	cks = tp.人物仓库
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("查找名称输入",350 + 53,150 + 40,100,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(12)
	self.输入框:置文本("")
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	self.输入框1 = 总控件:创建输入("查找id输入",350 + 222,150 + 40,100,14)
	self.输入框1:置数字模式()
	self.输入框1:置可视(false,false)
	self.输入框1:置限制字数(11)
	self.输入框1:屏蔽快捷键(true)
	self.输入框1:置光标颜色(-16777216)
	self.输入框1:置文字颜色(-16777216)
end

function 好友查找类:打开()
	if self.可视 then
		self.可视 = false
	else
		insert(tp.窗口_,self)
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.输入框:置可视(true,true)
        self.输入框:置文本("")
        self.输入框1:置可视(true,true)
        self.输入框1:置文本("")
	end
end

function 好友查找类:显示(dt,x,y)
	self.资源组[12]:显示(350,150)
	self.资源组[13]:更新1(x,y)
	self.资源组[14]:更新1(x,y)
	self.资源组[15]:更新1(x,y)
	self.资源组[16]:更新1(x,y)
	self.资源组[17]:更新1(x,y)
	self.资源组[13]:显示(370,376)
	self.资源组[14]:显示(420,376)
	self.资源组[15]:显示(500,376)
	self.资源组[16]:显示(580,376)
	self.资源组[17]:显示(640,153)
	if self.资源组[12]:是否选中(x,y) and 引擎.鼠标弹起(右键) then
		self.查找开关=false
	elseif self.资源组[17]:事件判断() then
		self.查找开关=false
		self.输入框:置可视(false,false)
		self.输入框:置文本("")
		self.输入框1:置可视(false,false)
		self.输入框1:置文本("")
	elseif self.资源组[13]:事件判断() then
		if self.输入框:取文本()=="" and self.输入框1:取文本()==""  then
		  tp.提示:写入("#Y请先输入要查找的角色名称或ID")
		  return
		else
		  print("查找发送数据 "..self.输入框1:取文本())
		  发送数据(17,{名称=self.输入框:取文本(),id=self.输入框1:取文本()})
		end
	elseif self.资源组[14]:事件判断() then	--添加好友
		if self.输入框:取文本()=="" and self.输入框1:取文本()==""  then
		  tp.提示:写入("#Y请先输入要添加的角色名称或ID")
		  return
		else
		  发送数据(18,{名称=self.输入框:取文本(),id=self.输入框1:取文本(),组=当前好友分组})
		end
	elseif self.资源组[15]:事件判断() then	--临时
		if self.输入框:取文本()=="" and self.输入框1:取文本()==""  then
		  tp.提示:写入("#Y请先输入要添加的角色名称或ID")
		  return
		else
		  发送数据(18,{名称=self.输入框:取文本(),id=self.输入框1:取文本(),组=5})
		end
	elseif self.资源组[16]:事件判断() then	--黑名单
		if self.输入框:取文本()=="" and self.输入框1:取文本()==""  then
		  tp.提示:写入("#Y请先输入要添加的角色名称或ID")
		  return
		else
		  发送数据(18,{名称=self.输入框:取文本(),id=self.输入框1:取文本(),组=6})
		end
	end
	self.控件类:更新(dt,x,y)
	self.控件类:显示(x,y)
	if #self.查找结果~=0 then
		zts:置颜色(黑色)
		zts:显示(350+42,150+110,"昵称："..self.查找结果[1])
		zts:显示(350+42,150+130,"I  D："..self.查找结果[2])
		zts:显示(350+42,150+150,"等级："..self.查找结果[3])
		zts:显示(350+42,150+170,"门派："..self.查找结果[4])
	end
end

function 好友查找类:检查点(x,y)
  if self.可视 and self.资源组[12]:是否选中(x,y) then
    return true
  end
end

function 好友查找类:初始移动(x,y)
  tp.运行时间 = tp.运行时间 + 1
  if not tp.消息栏焦点 then
    self.窗口时间 = tp.运行时间
  end
  if not self.焦点 then
    tp.移动窗口 = true
  end
  if self.可视 and self.鼠标 and not self.焦点 then
    self.xx = x - self.x
    self.yy = y - self.y
  end
end

function 好友查找类:开始移动(x,y)
  if self.鼠标 then
    self.x = x - self.xx
    self.y = y - self.yy
  end
end

return 好友查找类