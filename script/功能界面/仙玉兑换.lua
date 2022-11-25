local 仙玉兑换 = class()
local insert = table.insert
local 名称数据={}
local bw = require("gge包围盒")(0,0,520,20)
local 选中编号=0
local tp,zts,zts1
function 仙玉兑换:初始化(根)
  self.ID = 62502
	self.x = 202
	self.y = 88
	self.xx = 0
	self.yy = 0
	self.注释 = "给予类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
  zts = tp.字体表.普通字体
  zts1 = tp.字体表.描边字体
  self.控件类 = require("ggeui/加载类")()
  local 总控件 = self.控件类:创建控件('给予总控件')
  总控件:置可视(true,true)
  self.输入框 = 总控件:创建输入("仙玉兑换数量输入",0,0,100,14)
  self.输入框:置数字模式()
  self.输入框:置可视(false,false)
  self.输入框:置限制字数(8)
  self.输入框:置光标颜色(-16777216)
  self.输入框:置文字颜色(-16777216)
end

function 仙玉兑换:打开(内容)
  if self.可视 then
		self.选中人物 = 0
		self.可视 = false
    self.资源组 = nil
    self.输入框:置可视(false,false)
    return
	else
		insert(tp.窗口_,self)
    local 按钮 = tp._按钮
    local 自适应 = tp._自适应
    self.资源组 = {
    [1] = 自适应.创建(0,1,380,229,3,9),
    [2] = 自适应.创建(1,1,342,18,1,3,nil,18),
    [3] = 按钮.创建(自适应.创建(18,4,16,16,4,1),0,0,4,true,true), --关闭
    [4] = 自适应.创建(5,1,356,184,3,9),
    [5] = 自适应.创建(3,1,109,19,1,3),
    [6] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"确定兑换"),

    }
    self.输入框:置可视(true,true)
    self.输入框:置文本(1)
    tp.运行时间 = tp.运行时间 + 1
    self.窗口时间 = tp.运行时间
    self.可视 = true
    self.余额 = 内容.余额+0
    self.类型 = 内容.类型
    -- self.余额 = tonumber(内容.余额)
  end


end


function 仙玉兑换:显示(dt,x,y)
  self.焦点 = false
  self.资源组[3]:更新(x,y)
  self.资源组[6]:更新(x,y)
 self.资源组[1]:显示(self.x,self.y)
  self.资源组[2]:显示(self.x+6,self.y+3)
  self.资源组[3]:显示(self.x+355,self.y+6)
  self.资源组[4]:显示(self.x+12,self.y+33)
  self.资源组[5]:显示(self.x+125,self.y+105)
  self.资源组[5]:显示(self.x+125,self.y+135)
  self.资源组[6]:显示(self.x+148,self.y+170)
  tp.窗口标题背景_:置区域(0,0,112,16)
  tp.窗口标题背景_:显示(self.x+130,self.y+3)
  zts1:置字间距(3)
  zts1:显示(self.x+135,self.y+3,self.类型.."兑换仙玉")
  zts:置颜色(黑色):显示(self.x+60,self.y+80,"请输入兑换数量：")
  if self.类型 == "银两" then
    self.输入框:置坐标(self.x + 130,self.y + 139)
    zts:置颜色(黑色):显示(self.x+60,self.y+55,"当前兑换比例：150000银两 : 1点仙玉")
    zts:置颜色(黑色):显示(self.x+248,self.y+107,"银两")
    zts:置颜色(黑色):显示(self.x+248,self.y+137,"仙玉")
    zts:置颜色(黑色):显示(self.x+60,self.y+137,"请填写->")
    zts:置颜色(黑色):显示(self.x+60,self.y+107,"　需要->")
    if self.输入框:取文本() ~= nil and self.输入框:取文本()  ~= "" then
      zts:置颜色(黑色):显示(self.x+130,self.y+109,150000*self.输入框:取文本())
    end
  elseif self.类型 == "点卡" then
    self.输入框:置坐标(self.x + 130,self.y + 108)
    zts:置颜色(黑色):显示(self.x+60,self.y+55,"当前兑换比例：1点卡 : 100点仙玉")
    zts:置颜色(黑色):显示(self.x+248,self.y+107,"点卡")
    zts:置颜色(黑色):显示(self.x+248,self.y+137,"仙玉")
    zts:置颜色(黑色):显示(self.x+60,self.y+107,"请填写->")
    zts:置颜色(黑色):显示(self.x+60,self.y+137,"可兑换->")
    if self.输入框:取文本() ~= nil and self.输入框:取文本()  ~= "" then
      zts:置颜色(黑色):显示(self.x+130,self.y+137,100*self.输入框:取文本())
    end
  end


  self.控件类:更新(dt,x,y)
  self.控件类:显示(x,y)


  if self.资源组[3]:事件判断() then
    self:打开()
    return
  elseif self.资源组[6]:事件判断() then
    if tonumber(self.输入框:取文本())==nil or self.输入框:取文本()=="" then
      tp.提示:写入("#Y/输入错误")
      return
    end
    if self.类型 == "银两" then
      if 150000*tonumber(self.输入框:取文本()) < self.余额 then
        --发送数据(3726,{道具=self.物品选中,数量=self.输入框:取文本()+0})
        发送数据(188,{类型="银两",银两=150000*tonumber(self.输入框:取文本()),仙玉=tonumber(self.输入框:取文本())})
      else
        tp.提示:写入("#Y/你没有这么多银两可以兑换！")
      end

    elseif self.类型 == "点卡" then
      if tonumber(self.输入框:取文本()) < self.余额 then
        发送数据(188,{类型="点卡",点卡=tonumber(self.输入框:取文本()),仙玉=100*tonumber(self.输入框:取文本())})
      else
        tp.提示:写入("#Y/你没有这么多点卡可以兑换！")
      end
    end
    return
  end


end

function 仙玉兑换:初始移动(x,y)
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

function 仙玉兑换:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy


	end
end
function 仙玉兑换:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

return 仙玉兑换