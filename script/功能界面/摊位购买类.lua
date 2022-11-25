--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-02-22 12:29:28
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 摊位购买类 = class()

local tp,zts,zts1
local insert = table.insert
local xxx = 0
local yyy = 0
local sts = {"单价","数量","总额","现金"}
local tos = 引擎.取金钱颜色
local mouseb = 引擎.鼠标弹起
local bw = require("gge包围盒")(0,0,120,20)
local box = 引擎.画矩形


function 摊位购买类:初始化(根)
    self.ID = 116
	self.x = 366
	self.y = 78
	self.xx = 0
	self.yy = 0
	self.注释 = "给予类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.右键关闭=1
	self.窗口时间 = 0
	tp = 根
     self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
   	self.输入框 = 总控件:创建输入("摊位数量输入",0,0,100,14)
   	self.输入框:置数字模式()
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(20)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
end

function 摊位购买类:刷新(名称,角色名称,id,物品数据,bb数据,制造数据)
	self.制造=制造数据
	local wp = tp._物品
	for q=1,20 do
		self.物品[q]:置物品(物品数据[q])
		if 物品数据[q]~=nil then
			self.物品[q].价格=物品数据[q].价格
		end
	end
	self.对象名称=名称
	self.对象等级=等级
	self.对象类型=类型
	self.bb=bb数据
	self.摊主名称=角色名称
	self.摊主id=id
	self.摊位名称=名称
end

function 摊位购买类:打开(名称,角色名称,id,物品数据,bb数据,制造数据)
	if self.可视 then
	    self.bb选中=0
	    self.物品选中=0
		self.可视 = false
		self.输入框:置可视(false,false)
		self.选中背景 = nil
		self.资源组 = nil
		self.物品 = nil
		return
	else
		insert(tp.窗口_,self)
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		local 资源 = tp.资源
		self.选中背景=tp.资源:载入('wzife.wdf',"网易WDF动画",0x10921CA7)
		self.资源组 = {
				[1] = 资源:载入('wzife.wdf',"网易WDF动画",0X9F9301F5),
				[2] = 资源:载入('wzife.wdf',"网易WDF动画",0XCE137B78),
				[3] = 资源:载入('wzife.wdf',"网易WDF动画",0XE2C626FA),
				[4] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"给予"),
				[5] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
			    [6] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"物品类"),
				[7] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"召唤兽类"),
				[8] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"更改招牌"),
				[9] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"收摊"),
			    [10] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"查看记录"),
			    [11] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"购买"),
			    [12] = 资源:载入('wzife.wdf',"网易WDF动画",0X783C4453),--打造背景 0X839F03F8
			    [13] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"制造类"),
			}
	  	self.物品={}
		for i=1,20 do
			self.物品[i] = tp._物品格子.创建(0,0,i,"给予_物品")
		end
		self.制造=制造数据
		local wp = tp._物品
		for q=1,20 do
			self.物品[q]:置物品(物品数据[q])
			if 物品数据[q]~=nil then
	            self.物品[q].价格=物品数据[q].价格
			end
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.对象名称=名称
	    self.对象等级=等级
	    self.对象类型=类型
	    self.格子={}
	    self.bb=bb数据
	    self.显示类型="物品"
	    self.摊主名称=角色名称
	    self.摊主id=id
	    self.bb选中=0
	    self.制造选中=0
	    self.物品选中=0
	    self.摊位名称=名称
	    self.商品单价=0
	    self.商品数量=0
	    self.输入框:置可视(true,true)
	    self.输入框:置文本(1)
	end
end
function 摊位购买类:更新(dt) end

function 摊位购买类:物品显示(dt,x,y)
	self.资源组[2]:显示(self.x+20,self.y+95+20)
	local xx = 0
	local yy = 0
	for i=1,20 do
		if self.物品[i].格子==nil then
			self.物品[i]:置坐标(self.x + xx * 51 + 25,self.y + yy * 51 + 95+20)
			if self.物品选中==i then
				self.选中背景:显示(self.x + xx * 51 + 25-6,self.y + yy * 51 + 95+20+2)
			end
			self.物品[i]:显示(dt,x,y,self.鼠标)
			if self.物品[i].焦点 and not tp.消息栏焦点 then
				if self.物品[i].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.物品[i].物品)
					if 引擎.鼠标弹起(左键) and self.物品选中 ~= i then
						self.物品选中=i
						self.商品单价=self.物品[i].价格
						self.输入框:置文本(1)
					elseif 引擎.鼠标弹起(左键) and self.物品选中 == i then
						self.输入框:置文本(self.输入框:取文本()+1)
					end
				end
				self.焦点 = true
			end
		end
		xx = xx + 1
		if xx == 5 then
			xx = 0
			yy = yy + 1
		end
	end
end

function 摊位购买类:制造显示(dt,x,y)
	local 字体 = tp.字体表.普通字体
	self.资源组[3]:显示(self.x+20,self.y+95+20)
	local 序列n=0
	for n,v in pairs(self.制造) do
		if self.制造[n]~= nil then
			if self:取是否选中(n) then
				字体:置颜色(绿色)
			else
				字体:置颜色(黑色)
			end
			序列n=序列n+1
			bw:置坐标(self.x+37,self.y+80+序列n*25+20)
			if self.制造选中==n then
				box(self.x+37-10,self.y+80+序列n*25+20,self.x+37+208-20,self.y+80+序列n*25+20+20,-2097481216)
			end
			if self:取是否选中(n) then
				字体:置颜色(红色):显示(self.x+37,self.y+80+序列n*25+20,self.制造[n].名称)
				字体:置颜色(红色):显示(self.x+130,self.y+80+序列n*25+20,"制作等级:"..self.制造[n].等级.."级")
			else
				字体:置颜色(黑色):显示(self.x+37,self.y+80+序列n*25+20,self.制造[n].名称)
				字体:置颜色(黑色):显示(self.x+130,self.y+80+序列n*25+20,"制作等级:"..self.制造[n].等级.."级")
			end
			if bw:检查点(x,y)  then
				if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
					self.制造选中=n
					self.商品数量=1
					self.商品单价=self.制造[n].价格
	            end
			end
		end
 	end
end

function 摊位购买类:bb显示(dt,x,y)
	local 字体 = tp.字体表.普通字体
	self.资源组[3]:显示(self.x+20,self.y+95+20)
	local 序列n=0
	for n, v in pairs(self.bb) do
		if self:取是否选中(n) then
			字体:置颜色(绿色)
		else
			字体:置颜色(黑色)
		end
		序列n=序列n+1
		bw:置坐标(self.x+37,self.y+80+序列n*25+20)
		if self.bb选中==n then
			box(self.x+37-10,self.y+80+序列n*25+20,self.x+37+208-20,self.y+80+序列n*25+20+20,-2097481216)
		end
		if self:取是否选中(n) then
			字体:置颜色(红色):显示(self.x+37,self.y+80+序列n*25+20,self.bb[n].名称)
		else
			字体:置颜色(黑色):显示(self.x+37,self.y+80+序列n*25+20,self.bb[n].名称)
		end
		if bw:检查点(x,y)  then
			if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
				self.bb选中=n
				self.商品数量=1
				self.商品单价=self.bb[n].价格
			end
		end
		if 引擎.鼠标弹起(1) and self.鼠标 and not tp.消息栏焦点 and self.bb选中 ~= 0 then
			tp.窗口.召唤兽查看栏:打开(self.bb[self.bb选中])
		end
	end

end

function 摊位购买类:取是否选中(id)
	return false
end

function 摊位购买类:显示(dt,x,y)
	local 字体 = tp.字体表.普通字体
	self.焦点=false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[6]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[7]:更新(x,y)
	self.资源组[13]:更新(x,y)
	--self.资源组[8]:更新(x,y)
	--self.资源组[9]:更新(x,y)
	--self.资源组[10]:更新(x,y)
	self.资源组[11]:更新(x,y)
	self.资源组[5]:显示(self.x+269,self.y+5)
	self.资源组[6]:显示(self.x+21,self.y+87)
	self.资源组[7]:显示(self.x+111,self.y+87)
	self.资源组[13]:显示(self.x+201,self.y+87)
	--self.资源组[8]:显示(self.x+165,self.y+30)
	--self.资源组[9]:显示(self.x+135,self.y+370)
	--self.资源组[10]:显示(self.x+35,self.y+370)
	self.资源组[11]:显示(self.x+130,self.y+395)
	self.输入框:置坐标(self.x + 202,self.y + 336)
	if self.资源组[5]:事件判断() then
		self:打开()
		return
	elseif self.资源组[6]:事件判断() then
		self.显示类型="物品"
	elseif self.资源组[7]:事件判断() then
		self.显示类型="bb"
	elseif self.资源组[13]:事件判断() then
		self.显示类型="制造"
	end
	if self.显示类型=="物品" then
		self:物品显示(dt,x,y)
	elseif self.显示类型 == "制造" then
		self:制造显示(dt,x,y)
	else
		self:bb显示(dt,x,y)
	end
	self.控件类:更新(dt,x,y)
	self.控件类:显示(x,y)
	字体:置颜色(黄色):显示(self.x + 115,self.y + 33,self.摊位名称)
	字体:置颜色(黑色)
	字体:显示(self.x + 62,self.y + 60,self.摊主名称)
	字体:显示(self.x + 207,self.y + 60,self.摊主id)
	字体:显示(self.x + 207,self.y + 60,self.摊主id)
	字体:显示(self.x + 68,self.y + 336,self.商品单价)
	-- 字体:显示(self.x + 202,self.y + 336,self.商品数量)
	if self.输入框:取文本() ~= nil and self.输入框:取文本()  ~= "" then
		字体:置颜色(tos(self.商品单价*self.输入框:取文本())):显示(self.x + 68,self.y + 365,self.商品单价*self.输入框:取文本())
		字体:置颜色(tos(tp.金钱)):显示(self.x + 198,self.y + 365,tp.金钱)
	end


	if self.资源组[11]:事件判断() then
		if self.显示类型=="bb" then
			if self.bb选中==0 then
				tp.提示:写入("#Y/请先选择要购买的召唤兽")
				return
			end
		elseif self.显示类型=="物品" then
			if self.物品选中==0 then
				tp.提示:写入("#Y/请先选择要购买的物品")
				return
			end
		elseif self.显示类型=="制造" then
			if self.制造选中==0 then
				tp.提示:写入("#Y/请先选择要购买的物品")
				return
			elseif self.制造[self.制造选中] == nil then
				tp.提示:写入("#Y/商品数据已经更新请重新打开")
				return
			end
		end
		if self.显示类型=="bb" then
			发送数据(3726,{bb=self.bb选中})
			self.bb选中 = 0
		elseif self.显示类型=="制造" then
			发送数据(3726.1,{制造={self.制造选中,self.制造[self.制造选中]},数量=self.输入框:取文本()+0})
		else
			发送数据(3726,{道具=self.物品选中,数量=self.输入框:取文本()+0})
		end
	end
end

function 摊位购买类:检查点(x,y)
	if self.可视 and self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 摊位购买类:初始移动(x,y)
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

function 摊位购买类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 摊位购买类