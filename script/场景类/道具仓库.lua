--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-08-23 01:20:24
--======================================================================--
local 场景类_道具仓库 = class()

local tp,zts,zts1
local tonumbe = tonumber
local insert = table.insert

function 场景类_道具仓库:初始化(根)
	self.ID = 27
	self.x = 222
	self.y = 185
	self.xx = 0
	self.yy = 0
	self.注释 = "道具仓库"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	-- 定义输入框
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('物品空间')
	总控件:置可视(true,true)
	self.物品数量 = 总控件:创建输入("物品数量",self.x + 53,self.y + 193,100,14)
	self.物品数量:置可视(false,false)
	self.物品数量:置数字模式()
	self.物品数量:置限制字数(3)
	self.物品数量:屏蔽快捷键(true)
	self.物品数量:置光标颜色(-16777216)
	self.物品数量:置文字颜色(-16777216)
	self.仓库数量 = 总控件:创建输入("仓库数量",self.x,self.y + 193,100,14)
	self.仓库数量:置可视(false,false)
	self.仓库数量:置数字模式()
	self.仓库数量:置限制字数(3)
	self.仓库数量:屏蔽快捷键(true)
	self.仓库数量:置光标颜色(-16777216)
	self.仓库数量:置文字颜色(-16777216)
	self.仓库开始 = 1
	self.仓库结束 = 20
	self.选中仓库 = nil
	self.选中物品 = nil
	self.选中物品数量 = nil
	self.选中仓库 = nil
	self.选中仓库数量 = nil
	self.仓库页数 = 1
	self.窗口时间 = 0
	self.验证组 = {}
	self.验证时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
end

function 场景类_道具仓库:打开(道具,总数)
	if self.可视 then
		self.仓库开始 = 1
		self.仓库结束 = 20
		self.选中仓库 = nil
		self.选中物品 = nil
		self.选中物品数量 = nil
		self.选中仓库 = nil
		self.选中仓库数量 = nil
		for i=1,20 do
			self.物品[i]:置物品(nil)
			self.物品[i].确定 = false
		end
		for i=self.仓库开始,self.仓库结束 do
			self.仓库[i]:置物品(nil)
			self.仓库[i].确定 = false
		end
		self.物品数量:置可视(false,false)
		self.仓库数量:置可视(false,false)
		self.可视 = false
		self.资源组 = nil
		self.仓库 = nil
		self.物品 = nil
		return
	else
		self.仓库页数 = 1
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 =  tp._按钮
		local 自适应 = tp._自适应
		self.资源组 = {
			[1] = 自适应.创建(0,1,574,297,3,9), -- 297
			[2] = 按钮(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
			[3] = 按钮(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"寄存"),
			[4] = 按钮(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取出"),
			[5] = 自适应.创建(1,1,245,18,1,3,nil,18),
			[6] = 自适应.创建(3,1,53,19,1,3),
			[7] = 按钮(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"上一页"),
			[8] = 按钮(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"下一页"),
			[9] = 按钮(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"扩充"),
		}
		self.仓库 = {}
		self.物品 = {}
		local 格子 = tp._物品格子
		for i=1,20 do
			self.仓库[i] = 格子(0,0,i,"仓库")
			self.物品[i] = 格子(0,0,i,"物品")
		end
		for n=2,4 do
			self.资源组[n]:绑定窗口_(27)
		end
		self.资源组[9]:绑定窗口_(27)
		for n=7,8 do
			self.资源组[n]:绑定窗口_(27)
			self.资源组[n]:置偏移(-1,0)
		end

		self.物品数量:置可视(true,true)
		self.仓库数量:置可视(true,true)
		for i=1,20 do
			self.物品[i]:置物品(tp.道具列表[i])
			self.仓库[i]:置物品(道具[i])
		end
	    self.回收分类 = 回收分类
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.仓库总数=总数
	end
end
function 场景类_道具仓库:刷新道具()
	self.仓库开始 = 1
	self.仓库结束 = 20
 	for i=1,20 do
	  self.物品[i]:置物品(nil)
	  self.物品[i]:置物品(tp.道具列表[i])
	  self.物品[i].确定=nil
    end
	self.选择仓库 = nil
	self.选择仓库数量 = nil
	self.选择物品=nil
	self.选择物品数量=nil
end

function 场景类_道具仓库:刷新仓库(道具,总数)
	self.仓库开始 = 1
	self.仓库结束 = 20
 	for i=1,20 do
	  self.仓库[i]:置物品(nil)
	  self.仓库[i]:置物品(道具[i])
	  self.仓库[i].确定=nil
    end
 	self.仓库页数 =总数
 end
function 场景类_道具仓库:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,self.选择物品 ~= nil and self.选择物品数量 ~= nil)
	self.资源组[4]:更新(x,y,self.选择仓库 ~= nil and self.选择仓库数量 ~= nil)
	self.资源组[7]:更新(x,y)
	self.资源组[8]:更新(x,y)
	self.资源组[9]:更新(x,y)
	if self.选择物品~=nil and self.物品[self.选择物品].物品 ~= nil and (self.资源组[3]:事件判断() or (self.物品[self.选择物品].焦点 and 引擎.鼠标弹起(右键)) ) then
		发送数据(3730,{页数=self.仓库页数,物品=self.选择物品})
	elseif self.选择仓库~=nil and self.仓库[self.选择仓库].物品 ~= nil and (self.资源组[4]:事件判断() or (self.仓库[self.选择仓库].焦点 and 引擎.鼠标弹起(右键)) ) then
		发送数据(3731,{页数=self.仓库页数,物品=self.选择仓库})
  	elseif self.资源组[2]:事件判断() then
  	 self:打开()
  	 return
	elseif self.资源组[7]:事件判断() then
		发送数据(3729,{序列=self.仓库页数 - 1})
	elseif self.资源组[8]:事件判断() then
		发送数据(3729,{序列=self.仓库页数 + 1})
	elseif self.资源组[9]:事件判断() then
		发送数据(3742)
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x + 550,self.y + 6)
	self.资源组[3]:显示(self.x + 460,self.y + 246,true)
	self.资源组[4]:显示(self.x + 210,self.y + 246,true)
	self.资源组[9]:显示(self.x + 210,self.y + 270)
	self.资源组[5]:显示(self.x+20,self.y+3)
	self.资源组[5]:显示(self.x+302,self.y+3)
	tp.窗口标题背景_:置区域(0,0,69,16)
	tp.窗口标题背景_:显示(self.x+107,self.y+3)
	tp.窗口标题背景_:显示(self.x+396,self.y+3)
	zts1:显示(self.x+119,self.y+3,"仓  库")
	zts1:置字间距(2)
	zts1:显示(self.x+399,self.y+3,"道具行囊")
	zts:显示(self.x+21,self.y+249,"数 量")
	zts:显示(self.x+21,self.y+274,"仓 库")
	zts:显示(self.x+319,self.y+249,"数 量")
	self.资源组[6]:显示(self.x+64,self.y+245)
	self.资源组[6]:显示(self.x+64,self.y+270)
	self.资源组[6]:显示(self.x+362,self.y+245)
	tp.宽竖排花纹背景_:置区域(0,0,37,166)
	tp.宽竖排花纹背景_:显示(self.x+268,self.y+31)
	tp.宽竖排花纹背景_:置区域(0,549,37,38)
	tp.宽竖排花纹背景_:显示(self.x+268,self.y+200)
	tp.物品界面背景_:显示(self.x+14,self.y+29)
	tp.物品界面背景_:显示(self.x+305,self.y+29)
	self.资源组[7]:显示(self.x+125,self.y+246)
	self.资源组[8]:显示(self.x+125,self.y+270)
	zts1:置字间距(0)
	local xx = 0
	local yy = 0
	for i=1,20 do
		local jx = xx*51+306
		local jy = yy*51+29
		self.物品[i]:置坐标(jx + self.x,jy + self.y)
		self.物品[i]:显示(dt,x,y,self.鼠标)
		jx = jx-291
		self.仓库[self.仓库开始-1+i]:置坐标(jx + self.x,jy + self.y)
		self.仓库[self.仓库开始-1+i]:显示(dt,x,y,self.鼠标)
		if self.物品[i].焦点 then
			if self.物品[i].物品 ~= nil then
				tp.提示:道具行囊(x,y,self.物品[i].物品)
				if self.物品[i].事件 then
					if self.选择物品 ~= nil then
						self.物品[self.选择物品].确定 = false
					end
					self.选择物品 = i
					self.选择物品数量 = 1
					self.物品[i].确定 = true
					self.物品数量:置文本(self.选择物品数量)
					self.物品数量:置可视(true,true)
				elseif 引擎.鼠标弹起(右键) then
				 发送数据(3730,{页数=self.仓库页数,物品=i})

				end
			end
		elseif self.仓库[i].焦点 then
			if self.仓库[i].物品 ~= nil then
				tp.提示:道具行囊(x,y,self.仓库[i].物品)
				if self.仓库[i].事件 then
					if self.仓库[i].物品 ~= nil and self.仓库[i].焦点 then
						if self.选择仓库 ~= nil then
							self.仓库[self.选择仓库].确定 = false
						end
					    self.选择仓库 = i
					    self.选择仓库数量 = 1
					    self.仓库[i].确定 = true
					    self.仓库数量:置文本(self.选择仓库数量)
					  	self.仓库数量:置可视(true,true)
					end
               	elseif 引擎.鼠标弹起(右键) then
				 	发送数据(3731,{页数=self.仓库页数,物品=i})
				end
			end
		end
		xx = xx + 1
		if xx == 5 then
			xx = 0
			yy = yy + 1
		end
	end
	--if self.选择物品 ~= nil then
		--[[self.物品数量:置坐标(self.x+93,self.y-129)
		local s = tonumbe(self.物品数量:取文本())
		local v = tonumbe(self.物品[self.选择物品].物品.数量)
		if s == nil or s <= 0 then
			s = 1
		end
		if v == nil then
			v = 1
		end
		if s > v then
			if self.物品[self.选择物品].物品.数量 == 0 then
				self.物品数量:置文本(1)
			else
				self.物品数量:置文本(v)
			end
		end
	end
	if self.选择仓库 ~= nil then
		--[[local xz = tonumbe(self.仓库数量:取文本())
		local v = tonumbe(self.仓库[self.选择仓库].物品.数量)
		if xz == nil or xz <= 0 then
			xz = 1
			self.仓库数量:置文本(xz)
		end
		if xz > v then
			if v == 0 then
				self.仓库数量:置文本(1)
			else
				self.仓库数量:置文本(v)
			end
		end --]]
	--	self.仓库数量:置坐标(self.x-152,self.y-129)
	--end
	zts:置颜色(-16777216)
	zts:显示(self.x + 70,self.y + 274,self.仓库页数)
	zts:显示(self.x + 70,self.y + 249,self.仓库总数)
	--self.控件类:更新(dt,x,y)
	--self.控件类:显示(x,y)
	if  self.物品数量._已碰撞 or self.仓库数量._已碰撞  then
		self.焦点 = true
	end

end

function 场景类_道具仓库:检查点(x,y)
	if self.可视 and self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_道具仓库:初始移动(x,y)
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

function 场景类_道具仓库:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy

	end
end

function 场景类_道具仓库:判断仓库数量(页数)
	local i = 页数 * 20
	local sl = 0
	for m=i-19,i do
		if self.仓库[m].物品 == nil then
			sl = sl + 1
		end
	end
	return sl
end

function 场景类_道具仓库:增加仓库物品(页数,物品1,物品2,选择,数量)
	local i = 页数 * 20
	local sl = 0
	local xt = false
	for s=i-19,i do
		if self.仓库[s].物品 ~= nil and self.仓库[s].物品.名称 == 物品1.名称 and self.仓库[s].物品.可叠加  then
			xt = true
		end
	end
	for s=i-19,i do
		if self.仓库[s].物品 == nil and xt == false then
			self.仓库[s]:置物品(物品1)
			self.仓库[s].物品.数量 = 数量
			if 物品2.数量 == nil then
				物品2.数量 = 1
			end
			local sls = 物品2.数量 - 数量
			物品2.数量 = sls
			if 物品2.数量 ~= sls then
				引擎.关闭()
				return false
			end
			self.验证组={"物品",选择,sls}
			if sls <= 0 then
				物品2 = nil
				self.选择物品 = nil
				self.选择物品数量 = nil
				self.物品[选择].确定 = false
				self.物品数量:置可视(false,false)
			end
			sls = nil
			tp.道具仓库[s] = self.仓库[s].物品
			break
		elseif self.仓库[s].物品 ~= nil and self.仓库[s].物品.名称 == 物品1.名称 and self.仓库[s].物品.可叠加 and xt == true then
			if tonumber(self.仓库[s].物品.数量) < 9999 then
				self.仓库[s].物品.数量 = self.仓库[s].物品.数量 + 数量
				if self.仓库[s].物品.数量 > 9999 then
					local sl = self.仓库[s].物品.数量 - 9999
					self.仓库[s].物品.数量 = self.仓库[s].物品.数量 - sl
				end
				local sls = 物品2.数量 - 数量
				物品2.数量 = sls
				if 物品2.数量 ~= sls then
					引擎.关闭()
					return false
				end
				self.验证组={"物品",选择,sls}
				if sls <= 0 then
					物品2 = nil
					self.选择物品 = nil
					self.选择物品数量 = nil
					self.物品[选择].确定 = false
					self.物品数量:置可视(false,false)
				end
				tp.道具仓库[s] = self.仓库[s].物品
				sls = nil
				break
			else
			  	tp.提示:写入("#Y/超出最大可存放数量")
			end
		end
	end
	刷新道具逻辑(物品2,选择,true)
end

return 场景类_道具仓库