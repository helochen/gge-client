--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-11-22 20:45:04
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 好友消息类 = class()
local tp
local insert = table.insert
local xxx = 0
local yyy = 0
local sts = {"单价","数量","总额","现金"}
local tos = 引擎.取金钱颜色
local mouseb = 引擎.鼠标弹起
local bw = require("gge包围盒")(0,0,120,20)
local box = 引擎.画矩形
local tx = 引擎.取头像
local min = math.min
local 按钮 = require("script/系统类/按钮")
local 字体
local ceil = math.ceil
local min = math.min

function 好友消息类:初始化(根)
   self.ID = 1150
	self.x = 300
	self.y = 100
	self.xx = 0
	self.yy = 0
	self.注释 = "好友消息类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.右关闭=1
  self.丰富文本 =  require("script/系统类/丰富文本")(300,105)
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
  local 滑块 = 根._滑块
  local 资源 = 根.资源
	self.资源组 = {
		[1] = 资源:载入('wzife.wdf',"网易WDF动画",0X2ABD8127),
		[2]= 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"发送"),
		[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"加为好友"),
		[4] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[5] = 按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true,"下一条"),
    [6] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
    [7] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
    [8] = 滑块.创建(自适应.创建(11,4,15,40,2,3,nil),4,14,95,2),
	}
	self.窗口时间 = 0
	tp = 根
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("摊位输入",self.x + 20,self.y + 250,300,71)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(120)
	self.输入框:置多行(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
end

function 好友消息类:打开(名称,id,友好,等级,模型,类型,消息)
  self.介绍加入=0
  if 名称==nil then
    self.可视=false
    self.输入框:置可视(false,false)
    return
  end
  insert(tp.窗口_,self)
  tp.运行时间 = tp.运行时间 + 1
  self.窗口时间 = tp.运行时间
  self.可视 = true
  self.名称=名称
  self.id=id
  self.友好=友好
  self.等级=等级
  if self.友好==nil then
    self.友好=0
  end
  self.类型=类型 --1为发送消息  2为接收消息  3 为系统消息
  self.消息=消息
  self.头像=nil
  if 模型~=nil then
    local x = tx(模型)
    self.头像= 按钮(tp.资源:载入(x[7],"网易WDF动画",x[2]),0,0,1)
  end
  if 字体==nil then 字体=tp.字体表.普通字体 end
  self.输入框:置可视(true,true)
  self.输入框:置文本("")
  self.丰富文本:清空()
  if f函数.文件是否存在([[data/]]..tp.队伍[1].数字id) then
    if f函数.文件是否存在([[data/]]..tp.队伍[1].数字id..[[/]]..id) then
      self.丰富文本:添加文本(读入文件([[data\]]..tp.队伍[1].数字id..[[\]]..id..[[\记录.txt]]))
    else
      os.execute("md "..[[data\]]..tp.队伍[1].数字id..[[\]]..id)
      local file =io.open([[data\]]..tp.队伍[1].数字id..[[\]]..id..[[\记录.txt]],"w")
      file:write("")
      file:close()
    end
  else
    os.execute("md "..[[data\]]..tp.队伍[1].数字id)
    os.execute("md "..[[data\]]..tp.队伍[1].数字id..[[\]]..id)
    local file =io.open([[data\]]..tp.队伍[1].数字id..[[\]]..id..[[\记录.txt]],"w")
    file:write("")
    file:close()
  end
  for i=1,#self.丰富文本.显示表 - 6 do
    self.丰富文本:滚动(1)
  end
  self.资源组[8]:置起始点(0)
end
function 好友消息类:更新(dt) end

function 好友消息类:显示(dt,x,y)
  self.焦点=false
  if self.头像==nil then return  end
  self.资源组[1]:显示(self.x,self.y)
  self.资源组[2]:显示(self.x+30,self.y+215)
  self.资源组[3]:显示(self.x+100,self.y+215)
  self.资源组[4]:显示(self.x+341,self.y+5)
  self.资源组[5]:显示(self.x+190,self.y+215)
  self.资源组[6]:显示(self.x+330,self.y+80)
  self.资源组[7]:显示(self.x+330,self.y+195)
  self.资源组[2]:更新1(x,y)
  self.资源组[3]:更新1(x,y)
  self.资源组[4]:更新1(x,y)
  self.资源组[5]:更新(x,y,消息闪烁)
  self.资源组[6]:更新(x,y,self.介绍加入 > 0)
  self.资源组[7]:更新(x,y,self.介绍加入 < #self.丰富文本.显示表 - 13)
  if self.资源组[4]:事件判断() then
    self:打开()
  elseif self.资源组[2]:事件判断() or 引擎.按键弹起(KEY.ENTER) then
    if self.输入框:取文本()=="" then
      tp.提示:写入("#Y您想说点什么给对方听呢？")
    else
      发送数据(24,{id=self.id,内容=self.输入框:取文本()})
      self.输入框:置文本("")
    end
  elseif self.资源组[5]:事件判断() and 消息闪烁 then
    发送数据(25)
  elseif self.资源组[6]:事件判断() then
    self.资源组[8]:置起始点(self.资源组[8]:取百分比转换(self.介绍加入-1,6,#self.丰富文本.显示表))
  elseif self.资源组[7]:事件判断() then
    self.资源组[8]:置起始点(self.资源组[8]:取百分比转换(self.介绍加入+1,6,#self.丰富文本.显示表))
  end
  tp.人物头像背景_:显示(self.x+17,self.y+32)
  self.头像:显示(self.x+20,self.y+35)
  字体:置颜色(黑色)
  字体:显示(self.x+120,self.y+38,self.名称)
  字体:显示(self.x+272,self.y+38,self.id)
  字体:显示(self.x+120,self.y+62,self.友好)
  字体:显示(self.x+272,self.y+62,self.等级)
  self.控件类:更新(dt,x,y)
  self.控件类:显示(x,y)
  if #self.丰富文本.显示表 > 6 then
    self.介绍加入 = min(ceil((#self.丰富文本.显示表-6)*self.资源组[8]:取百分比()),#self.丰富文本.显示表-6)
    -- print(self.介绍加入)
    self.丰富文本.加入 = self.介绍加入
    --  self.资源组[10]:显示(self.x + 395,self.y + 84,x,y,self.鼠标)
    self.资源组[8]:显示(self.x+331,self.y+100,x,y,self.鼠标)
  end
    self.丰富文本:显示(self.x+23,self.y+90)
end

function 好友消息类:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y) then
		return true
	end
end

function 好友消息类:初始移动(x,y)
  if 1==1 then return  end
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

function 好友消息类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy

		self.输入框:置坐标(self.x + 20,self.y + 250)
	end
end

return 好友消息类