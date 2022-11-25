--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-11-22 20:45:13
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 指定类 = class()
local tp,zts,zts1
local insert = table.insert
local sj = {"力量","敏捷","体质","耐力","魔力"}
local tx = {"神佑","简易","再生","愤怒","暴怒"}
function 指定类:初始化(根)
   	self.ID = 7758
	self.x = 185
	self.y = 100
	self.xx = 0
	self.yy = 0
	self.注释 = "指定类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
  	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('指定总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("指定双加输入",0,0,100,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(20)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	zts = 根.字体表.普通字体
	zts1 = 根.字体表.描边字体
	tp=根
	self.双加选择1 = ""
	self.双加选择2 = ""
	self.特效选择 = ""
	self.开关 = false
end

function 指定类:打开(数据)
	if self.可视 then
		self.可视 = false
		self.输入框:置可视(false,false)
		self.双加选择1 = ""
		self.双加选择2 = ""
		self.特效选择 = ""
		self.资源组 = nil
		return
	else
		self.数据 = 数据
		insert(tp.窗口_,self)
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		local 资源 = tp.资源
		self.资源组 = {
			[1] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"指定双加"),
			[2] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"指定特效"),
			[3] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"指定特技"),
			[4] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"指定完成"),
			[5] = 按钮.创建(自适应.创建(12,4,72,20,1,3),0,0,4,true,true,"放弃指定"),
			[6] = 自适应.创建(0,1,465,200,3,9),--背景
			[7] = 自适应.创建(3,1,66,19,1,3),--输入背景
			[8] = 自适应.创建(1,1,460,18,1,3,nil,18), --横条
			[9] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下拉选择框
			[10] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下拉选择框
			[11] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下拉选择框
			[12] = tp._小型选项栏.创建(自适应.创建(6,1,80,140,3,9),""), --分类选项
			[13] = tp._小型选项栏.创建(自适应.创建(6,1,80,140,3,9),""), --分类选项
			[14] = tp._小型选项栏.创建(自适应.创建(6,1,80,140,3,9),""), --分类选项
		}
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.输入框:置可视(true,true)
	    self.输入框:置文本("")
	end
end
function 指定类:更新(dt) end

function 指定类:显示(dt,x,y)
	self.资源组[1]:更新(x,y,self.双加选择1~="" and self.双加选择2~="")
	self.资源组[2]:更新(x,y,self.特效选择~="")
	self.资源组[3]:更新(x,y,self.输入框:取文本()~="")
	self.资源组[4]:更新(x,y,self.开关==false)
	self.资源组[5]:更新(x,y,self.开关==false)
	self.资源组[9]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[11]:更新(x,y)

	self.资源组[6]:显示(self.x,self.y)
	self.资源组[8]:显示(self.x+5,self.y+5)
	tp.窗口标题背景_:置区域(0,0,92,16)
	tp.窗口标题背景_:显示(self.x+180,self.y+3)
	zts1:置字间距(2)
	zts1:显示(self.x+190,self.y+3,"指定界面")
	zts1:置字间距(0)

	zts:置颜色(红色)
	zts:显示(self.x+20,self.y+35,"双加[1]")
	zts:显示(self.x+20,self.y+70,"双加[2]")

	zts:置颜色(红色)
	zts:显示(self.x+50,self.y+100,"请选择或输入要指定的内容,指定会消耗相应的仙玉。")
	zts:显示(self.x+50,self.y+125,"您当前装备星级为"..self.数据.."星,指定一项将消耗"..((self.数据+1)*10000).."点仙玉")
	zts:置颜色(白色)

	self.资源组[4]:显示(self.x+66,self.y+150)
	self.资源组[5]:显示(self.x+300,self.y+150)
	self.资源组[7]:显示(self.x+75,self.y+35)
	self.资源组[7]:显示(self.x+75,self.y+70)
	self.资源组[1]:显示(self.x+160,self.y+70)

	self.资源组[11]:显示(self.x+135,self.y+35)
	self.资源组[12]:显示(self.x+70,self.y+52,x,y,true)
	self.资源组[9]:显示(self.x+135,self.y+70)
	self.资源组[13]:显示(self.x+70,self.y+87,x,y,true)

	zts:显示(self.x+240,self.y+35,"特技")
	zts:显示(self.x+240,self.y+70,"特效")
	self.资源组[7]:显示(self.x+285,self.y+35)
	self.资源组[7]:显示(self.x+285,self.y+70)
	self.资源组[3]:显示(self.x+370,self.y+35)
	self.资源组[2]:显示(self.x+370,self.y+70)
	self.资源组[10]:显示(self.x+345,self.y+70)
	self.资源组[14]:显示(self.x+280,self.y+87,x,y,true)

	self.输入框:置坐标(self.x+288,self.y+37)
	self.控件类:更新(dt,x,y)
	self.控件类:显示(x,y)
	self.焦点 = false


	if self.资源组[11]:事件判断() then --双加1
		self.资源组[12]:打开(sj)
		self.开关 = true
	end
	if self.资源组[12]:事件判断() then
		self.双加选择1=self.资源组[12].弹出事件
		self.资源组[12].弹出事件=nil
		self.开关 = false
	end

	if self.资源组[9]:事件判断() then --双加2
		self.资源组[13]:打开(sj)
		self.开关 = true
	end
	if self.资源组[13]:事件判断() then
		self.双加选择2=self.资源组[13].弹出事件
		self.资源组[13].弹出事件=nil
		self.开关 = false
	end

	if self.资源组[10]:事件判断() then --特效
		self.资源组[14]:打开(tx)
		self.开关 = true
	end
	if self.资源组[14]:事件判断() then
		self.特效选择=self.资源组[14].弹出事件
		self.资源组[14].弹出事件=nil
		self.开关 = false
	end
	zts:置颜色(黑色)
	if self.双加选择1 ~= "" then
		zts:显示(self.x+78,self.y+37,self.双加选择1)
	end
	if self.双加选择2 ~= "" then
		zts:显示(self.x+78,self.y+72,self.双加选择2)
	end
	if self.特效选择 ~= "" then
		zts:显示(self.x+288,self.y+72,self.特效选择)
	end
	if self.资源组[1]:事件判断() then
		发送数据(101,{类型=1,双加1=self.双加选择1,双加2=self.双加选择2})
	elseif self.资源组[2]:事件判断() then
		发送数据(101,{类型=2,数据=self.特效选择})
	elseif self.资源组[3]:事件判断() then
		发送数据(101,{类型=3,数据=self.输入框:取文本()})
	elseif self.资源组[4]:事件判断() then
		发送数据(101,{类型=4})
		self:打开()
		return
	elseif self.资源组[5]:事件判断() then
		self:打开()
		return
	end
end

function 指定类:检查点(x,y)
	if self.可视 and self.资源组 ~= nil and self.资源组[6]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 指定类:初始移动(x,y)
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

function 指定类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 指定类