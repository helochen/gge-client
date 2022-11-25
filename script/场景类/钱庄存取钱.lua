--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-06-04 20:20:25
--======================================================================--
local 场景类_钱庄存取钱 = class()
local tp,zts,zts1
local insert = table.insert
local xxx = 0
local yyy = 0
local sts = {"现    金","存    款","存入金额","取出金额"}
local tos = 引擎.取金钱颜色
local mouseb = 引擎.鼠标弹起
local 现金=0
local 存款=0
local 存入金额=0
local 取出金额=0
function 场景类_钱庄存取钱:初始化(根)
	self.ID = 17
	self.x = 280
	self.y = 200
	self.xx = 0
	self.yy = 0
	self.注释 = "钱庄存取钱"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('商店总控件')
	总控件:置可视(true,true)
	self.物品数量 = 总控件:创建输入("物品数量",0,0,100,14)
	self.物品数量:置可视(false,false)
	self.物品数量:置数字模式()
	self.物品数量:置限制字数(10)
	self.物品数量:屏蔽快捷键(true)
	self.物品数量:置光标颜色(-16777216)
	self.物品数量:置文字颜色(-16777216)
	self.输入框 = 总控件:创建输入("商店数量输入",0,0,100,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(10)
	self.输入框:置数字模式()
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	self.输入框:置文本("")
	self.上一次 = 1
	self.窗口时间 = 0
	tp = 根
	zts = 根.字体表.普通字体
	zts1 = 根.字体表.描边字体
end

function 场景类_钱庄存取钱:打开(银子,存银)
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
			[1] = 自适应.创建(0,1,300,221,3,9),
			[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
			[3] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"存入"),
			[4] = 自适应.创建(3,1,100,19,1,3),
			[5] = 自适应.创建(3,1,94,19,1,3),
			[6] = 自适应.创建(1,1,240,18,1,3,nil,18),
			[7] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取出"),
			[8] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取消"),
		}
		for n=2,3 do
		   self.资源组[n]:绑定窗口_(17)
		end
		self.资源组[7]:绑定窗口_(17)

		现金 = 银子
		存款 = 存银
	    self.输入框:置可视(true,true)
	    self.物品数量:置可视(true,true)
	    self.输入框:置文本("")
	    self.物品数量:置文本("")
	    tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_钱庄存取钱:刷新(银子,存银)
	现金 = 银子
	存款 = 存银
	if tp.窗口.钱庄存取钱.可视 then
		tp.窗口.钱庄存取钱:打开(现金,存款)
	end
end

function 场景类_钱庄存取钱:显示(dt,x,y)
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[7]:更新(x,y)
	self.资源组[8]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		return
	elseif self.资源组[3]:事件判断() then
		发送数据(3740,{存入金额=存入金额})
	elseif self.资源组[7]:事件判断() then
		发送数据(3741,{取出金额=取出金额})
	elseif self.资源组[8]:事件判断() then
		self:打开()
		return
	end
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[6]:显示(self.x+20,self.y+5)
	tp.窗口标题背景_:置区域(0,0,110,16)
	tp.窗口标题背景_:显示(self.x+84,self.y+5)
	zts1:显示(self.x+89,self.y+3,"钱庄存取钱业务")
	zts:置颜色(4294967295)
	zts:置字间距(0)
	for i=0,3 do
		self.资源组[4]:显示(self.x+133,self.y+37+i*35)
		zts:显示(self.x+60,self.y+40+i*35,sts[i+1])
	end
	zts:置字间距(0)
	self.资源组[2]:显示(self.x+274,self.y+6)
	self.资源组[3]:显示(self.x+40,self.y+180,true)
	self.资源组[7]:显示(self.x+120,self.y+180,true)
	self.资源组[8]:显示(self.x+200,self.y+180,true)
	local xx = 0
	local yy = 0
	zts:置颜色(tos(现金))
	zts:显示(self.x + 138,self.y + 39,现金)
	zts:置颜色(tos(存款))
	zts:显示(self.x + 138,self.y + 39+37,存款)
	self.物品数量:置坐标(self.x +138,self.y + 36+37+37)
	if self.物品数量:取文本() == "" then
		self.物品数量:置文本()
	end
	self.输入框:置坐标(self.x + 138,self.y + 36+37+37+37)
	if self.输入框:取文本() == "" then
		self.输入框:置文本()
	end
	存入金额 = tonumber(self.物品数量:取文本())
	取出金额 = tonumber(self.输入框:取文本())
	self.控件类:更新(dt,x,y)
	if self.输入框._已碰撞 or self.物品数量._已碰撞 then
		self.焦点 = true
	end
	self.控件类:显示(x,y)
end

function 场景类_钱庄存取钱:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_钱庄存取钱:初始移动(x,y)
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

function 场景类_钱庄存取钱:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy

	end
end

return 场景类_钱庄存取钱