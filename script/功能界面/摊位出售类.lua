--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-11-22 20:45:20
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 摊位出售类 = class()
local tp,zts,zts1
local insert = table.insert
local xxx = 0
local yyy = 0
local sts = {"单价","数量","总额","现金"}
local tos = 引擎.取金钱颜色
local mouseb = 引擎.鼠标弹起
local bw = require("gge包围盒")(0,0,120,20)
local box = 引擎.画矩形
local qjq = 引擎.取金钱颜色
local 技能数据 = {}
function 摊位出售类:初始化(根)
    self.ID = 115
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
	self.输入框 = 总控件:创建输入("摊位输入",0,0,100,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(12)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
   	self.输入框1 = 总控件:创建输入("价格输入",0,0,100,14)
   	self.输入框1:置数字模式()
	self.输入框1:置可视(false,false)
	self.输入框1:置限制字数(11)
	self.输入框1:置光标颜色(-16777216)
	self.输入框1:置文字颜色(-16777216)
end

function 摊位出售类:刷新(名称,角色名称,id,物品数据,bb数据,制造数据)
	self.上架物品=物品数据
	self.上架bb=bb数据
	self.上架制造=制造数据
	if self.物品 == nil then
	    self.物品={}
		for i=1,20 do
			self.物品[i] = tp._物品格子.创建(0,0,i,"给予_物品")
		end
	end
	for q=1,20 do
		self.物品[q]:置物品(tp.道具列表[q])
		if self.上架物品[q]~=nil then
			self.物品[q]:置灰色()
		end
	end
end

function 摊位出售类:打开(名称,角色名称,id,物品数据,bb数据,制造数据)
	if self.可视 then
		self.可视 = false
		self.输入框:置可视(false,false)
		self.输入框1:置可视(false,false)
		self.选中背景=nil
		self.资源组=nil
		self.物品=nil
		return
	else
		insert(tp.窗口_,self)
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		local 资源 = tp.资源
		self.选中背景=tp.资源:载入('wzife.wdf',"网易WDF动画",0x10921CA7)
		self.资源组 = {
			[1] = 资源:载入('wzife.wdf',"网易WDF动画",0X0967049D),
			[2] = 资源:载入('wzife.wdf',"网易WDF动画",0XCE137B78),
			[3] = 资源:载入('wzife.wdf',"网易WDF动画",0XE2C626FA),
			[4] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"给予"),
			[5] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		    [6] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"物品类"),
			[7] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"召唤兽类"),
			[8] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"更改招牌"),
			[9] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"收摊"),
		    [10] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"查看记录"),
		    [11] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"上架"),
			[12] = 资源:载入('wzife.wdf',"网易WDF动画",0X783C4453),--打造背景 0X839F03F8
			[13] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"制造类"),
		}
		self.物品={}
		for i=1,20 do
			self.物品[i] = tp._物品格子.创建(0,0,i,"给予_物品")
		end
		self.上架物品=物品数据
		self.上架bb=bb数据
		self.上架制造=制造数据
		local wp = tp._物品
		for q=1,20 do
			--local sp = wp()
			--sp:置对象(tp.道具列表[q])
			self.物品[q]:置物品(tp.道具列表[q])
            if self.上架物品[q]~=nil then
                self.物品[q]:置灰色()
            end
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.对象名称=名称
	    self.对象等级=等级
	    self.对象类型=类型
	    self.格子={}
	    self.bb=tp.队伍[1].宝宝列表
	    self.显示类型="物品"
	    self.输入框:置可视(true,true)
	    self.输入框:置文本(名称)
	    self.输入框1:置可视(true,true)
	    self.输入框1:置文本("")
	    self.摊主名称=角色名称
	    self.摊主id=id
	    self.bb选中=0
	    self.物品选中=0
	    self.制造选中=0
	end
end
function 摊位出售类:更新(dt) end

function 摊位出售类:物品显示(dt,x,y)
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
				    if 引擎.鼠标弹起(左键) then
                      --self:设置物品(i)
                       self.物品选中=i
                        if self.上架物品[i]~=nil then
                            self.输入框1:置文本(self.上架物品[i])
                            self.资源组[11].按钮文字="下架"
                        else
         	                self.资源组[11].按钮文字="上架"
          	            end
				  	end
				end
				self.焦点 = true
			end
		end
		-- print(self.物品[i].模型)
		--table.print(self.物品[i])
		xx = xx + 1
		if xx == 5 then
			xx = 0
			yy = yy + 1
		end
	end
end

function 摊位出售类:制造显示(dt,x,y)
	local 字体 = tp.字体表.普通字体
	self.资源组[3]:显示(self.x+20,self.y+95+20)

	for n=1,#技能数据 do
		if 技能数据[n].等级 >= 35 then
			if self:取是否选中制造(n) then
				字体:置颜色(绿色)
			else
				字体:置颜色(黑色)
			end
			bw:置坐标(self.x+37,self.y+80+n*25+20)
			if self.制造选中==n then
				box(self.x+37-10,self.y+80+n*25+20,self.x+37+208-20,self.y+80+n*25+20+20,-2097481216)
			end
			if self:取是否选中制造(n) then
				字体:置颜色(红色):显示(self.x+37,self.y+80+n*25+20,技能数据[n].名称)
				字体:置颜色(红色):显示(self.x+130,self.y+80+n*25+20,技能数据[n].等级.."级")
			else
				字体:置颜色(黑色):显示(self.x+37,self.y+80+n*25+20,技能数据[n].名称)
				字体:置颜色(黑色):显示(self.x+130,self.y+80+n*25+20,技能数据[n].等级.."级")
			end
			if bw:检查点(x,y)  then
				if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
					self.制造选中=n
					if self.上架制造[n]~=nil then
						self.输入框1:置文本(self.上架制造[n])
						self.资源组[11].按钮文字="下架"
					else
						self.资源组[11].按钮文字="上架"
					end
	            end
			end
		end
 	end
end

function 摊位出售类:bb显示(dt,x,y)
	local 字体 = tp.字体表.普通字体
	self.资源组[3]:显示(self.x+20,self.y+95+20)
	for n=1,#tp.队伍[1].宝宝列表 do
		if self:取是否选中(n) then
			字体:置颜色(绿色)
		else
			字体:置颜色(黑色)
		end
		bw:置坐标(self.x+37,self.y+80+n*25+20)
		if self.bb选中==n then
			box(self.x+37-10,self.y+80+n*25+20,self.x+37+208-20,self.y+80+n*25+20+20,-2097481216)
		end
		if self:取是否选中(n) then
			字体:置颜色(红色):显示(self.x+37,self.y+80+n*25+20,tp.队伍[1].宝宝列表[n].名称)
		else
			字体:置颜色(黑色):显示(self.x+37,self.y+80+n*25+20,tp.队伍[1].宝宝列表[n].名称)
		end
		if bw:检查点(x,y)  then
			if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
				--self:设置交易召唤兽(n)
				-- 点击事件=true
				self.bb选中=n
				if self.上架bb[n]~=nil then
					self.输入框1:置文本(self.上架bb[n])
					self.资源组[11].按钮文字="下架"
				else
					self.资源组[11].按钮文字="上架"
				end
            elseif 引擎.鼠标弹起(1) and self.鼠标 and not tp.消息栏焦点 then
                tp.窗口.召唤兽查看栏:打开(tp.队伍[1].宝宝列表[n])
            end
		end
 	end
end

function 摊位出售类:取是否选中(id)
	for n, v in pairs(self.上架bb) do
		if  id==n then return true end
	end
	return false
end
function 摊位出售类:取是否选中制造(id)
	for n, v in pairs(self.上架制造) do
		if  id==n then return true end
	end
	return false
end

function 摊位出售类:显示(dt,x,y)
	local 字体 = tp.字体表.普通字体
	self.焦点=false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[6]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[7]:更新(x,y)
	self.资源组[8]:更新(x,y)
	self.资源组[9]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[11]:更新(x,y)
	self.资源组[13]:更新(x,y)
	self.资源组[5]:显示(self.x+269,self.y+5)
	self.资源组[6]:显示(self.x+21,self.y+87)
	self.资源组[7]:显示(self.x+111,self.y+87)
	self.资源组[13]:显示(self.x+201,self.y+87)

	self.资源组[8]:显示(self.x+165,self.y+30)
	self.资源组[9]:显示(self.x+135,self.y+370)
	self.资源组[10]:显示(self.x+35,self.y+370)
	self.资源组[11]:显示(self.x+180,self.y+335)
	self.输入框1:置文字颜色(qjq(tonumber(self.输入框1:取文本())or 0))
	self.输入框:置坐标(self.x + 62,self.y + 35)
	self.输入框1:置坐标(self.x + 92,self.y + 340)
	if self.资源组[5]:事件判断() then
		self:打开()
		return
	elseif self.资源组[6]:事件判断() then
		self.显示类型="物品"
	elseif self.资源组[7]:事件判断() then
		self.显示类型="bb"
	elseif self.资源组[13]:事件判断() then
		技能数据 = {}
		local rw = tp.队伍[1]
		for i=1,#tp.队伍[1].辅助技能 do
			if tp.队伍[1].辅助技能[i].名称 == "裁缝技巧" then
				技能数据[#技能数据+1] = {名称="裁缝技巧",等级=tp.队伍[1].辅助技能[i].等级}
			elseif tp.队伍[1].辅助技能[i].名称 == "打造技巧" then
				技能数据[#技能数据+1] = {名称="打造技巧",等级=tp.队伍[1].辅助技能[i].等级}
			elseif tp.队伍[1].辅助技能[i].名称 == "炼金术" then
				技能数据[#技能数据+1] = {名称="炼金术",等级=tp.队伍[1].辅助技能[i].等级}
			end
			if #技能数据>=3 then
				break
			end
		end
		if rw.师门技能 ~= nil then
	        for n=1,#rw.师门技能 do
	            for i=1,#rw.师门技能[n].包含技能 do
	              	if rw.师门技能[n].包含技能[i].名称 == "嗜血" or rw.师门技能[n].包含技能[i].名称 == "轻如鸿毛" or rw.师门技能[n].包含技能[i].名称 == "拈花妙指" or rw.师门技能[n].包含技能[i].名称 == "盘丝舞"
	             	or rw.师门技能[n].包含技能[i].名称 == "一气化三清" or rw.师门技能[n].包含技能[i].名称 == "浩然正气" or rw.师门技能[n].包含技能[i].名称 == "龙附"  or rw.师门技能[n].包含技能[i].名称 == "神兵护法"
	              	or rw.师门技能[n].包含技能[i].名称 == "魔王护持" or rw.师门技能[n].包含技能[i].名称 == "莲华妙法" or rw.师门技能[n].包含技能[i].名称 == "神力无穷" or rw.师门技能[n].包含技能[i].名称 == "尸气漫天"
	              	or rw.师门技能[n].包含技能[i].名称 == "堪察令" or rw.师门技能[n].名称 == "神兵鉴赏" then
	                   技能数据[#技能数据+1] = {名称=rw.师门技能[n].包含技能[i].名称,等级=rw.师门技能[n].包含技能[i].等级}
	                   if rw.师门技能[n].包含技能[i].名称 == "堪察令" then
	                   		技能数据[#技能数据].名称 = "灵宝图鉴"
	                   elseif rw.师门技能[n].名称 == "神兵鉴赏" then
	                   		技能数据[#技能数据].名称 = "神兵图鉴"
	                   end
	                end
	            end
	        end
	    end
	    self.显示类型="制造"
	elseif self.资源组[8]:事件判断() and self.输入框:取文本()~="" then
		发送数据(3721,{名称=self.输入框:取文本()})
	elseif self.资源组[9]:事件判断()  then
		发送数据(3724)
	end
	if self.显示类型=="物品" then
		self:物品显示(dt,x,y)
	elseif self.显示类型 == "制造" then
		self:制造显示(dt,x,y)
	else
		self:bb显示(dt,x,y)
	end
	self.控件类:更新(dt,x,y)
	if self.输入框._已碰撞 then
		self.焦点 = true
	end
	if self.输入框1._已碰撞 then
		self.焦点 = true
	end
	self.控件类:显示(x,y)
	字体:置颜色(黑色)
	字体:显示(self.x + 62,self.y + 65,self.摊主名称)
	字体:显示(self.x + 207,self.y + 65,self.摊主id)
	if self.资源组[11]:事件判断() then
		if self.显示类型=="bb" then
			if self.bb选中==0 then
				tp.提示:写入("#Y/请先设置要出售的召唤兽")
				return
			end
		elseif self.显示类型=="物品" then
			if self.物品选中==0 then
				tp.提示:写入("#Y/请先设置要出售的物品")
				return
			end
		elseif self.显示类型=="制造" then
			if self.制造选中==0 then
				tp.提示:写入("#Y/请先设置要出售的物品")
				return
			end
		end
		if self.资源组[11].按钮文字=="上架" then
			if self.输入框1:取文本()=="" or self.输入框1:取文本()+0<=0 then
				tp.提示:写入("#Y/请先设置商品的单价")
				return
			end
			if self.显示类型=="bb" then
				发送数据(3722,{bb=self.bb选中,价格=self.输入框1:取文本()})
			elseif self.显示类型=="制造" then
				发送数据(3722,{制造={self.制造选中,技能数据[self.制造选中]},价格=self.输入框1:取文本()})
			else
				发送数据(3722,{道具=self.物品选中,价格=self.输入框1:取文本()})
			end
		else
			if self.显示类型=="bb" then
				发送数据(3723,{bb=self.bb选中})
			else
				发送数据(3723,{道具=self.物品选中})
			end
		end
	end
end

function 摊位出售类:检查点(x,y)
	if self.可视 and self.资源组 ~=nil and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 摊位出售类:初始移动(x,y)
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

function 摊位出售类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 摊位出售类