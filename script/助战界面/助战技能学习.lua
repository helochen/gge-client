--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-04-25 03:37:55
--======================================================================--
local 助战技能学习 = class()

local floor = math.floor
local bw = require("gge包围盒")(0,0,164,37)
local box = 引擎.画矩形
local tp,zys
local ARGB = ARGB
local insert = table.insert

function 助战技能学习:初始化(根)
	self.ID = 22
	self.x = 372
	self.y = 105
	self.xx = 0
	self.yy = 0
	self.注释 = "技能学习"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.介绍文本 = 根._丰富文本(150,150,根.字体表.普通字体)
	self.窗口时间 = 0
	self.选中 = nil
	self.选中1 = nil
	self.选中包含技能加入 = nil
	self.师门技能 = nil
	self.包含技能 = nil
	self.本次需求 = nil
	self.刷新文本 = false
	tp = 根
	zys = tp.资源
end

function 助战技能学习:打开(内容)
	if self.可视 then
		self.介绍文本:清空()
		self.选中师门技能 = nil
		self.选中包含技能 = nil
		self.选中包含技能加入 = nil
		self.包含技能 = nil
		self.刷新文本 = false
		self.可视 = false
		self.资源组=nil
		return
	else
		insert(tp.窗口_,self)
		self.助战 = 内容
		self.助战.师门技能 = 内容.师门技能
		if self.助战.门派 == "无门派" then
		    tp.提示:写入("#Y/拜入门派才可以学习师门技能")
		    return false
		end
		self:加载数据()
		self.师门技能 = {}
		self.包含技能 = {}
		self.选中 = 0
		self.加入 = 0
		tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end
function 助战技能学习:刷新(内容)
self.助战 = 内容
self.助战.师门技能 = 内容.师门技能
end
function 助战技能学习:加载数据()
	local 按钮 = tp._按钮
	local 资源 = tp.资源
	local 自适应 = tp._自适应
	self.资源组 = {
	--	[1] = 资源:载入('wzife.wdf',"网易WDF动画",0x9ED74AA6),
	[1] = 资源:载入('wzife.wdf',"网易WDF动画",0x9ED74AA6),
		--[1] = 自适应.创建(0,1,385,473,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFD3D61F2),0,0,4,true,true),
		[4] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x09217E13),0,0,4,true,true),
		[5] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFD3D61F2),0,0,4,true,true),
		[6] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x09217E13),0,0,4,true,true),
		[7] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x2BD1DEF7),0,0,4,true,true,"学习"),
	}
	for n=2,7 do
		self.资源组[n]:绑定窗口_(22)
	end
end

function 助战技能学习:显示(dt,x,y)
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,self.选中 ~= 0 and self.加入 > 0)
	self.资源组[4]:更新(x,y,self.选中 ~= 0 and self.加入 < #self.助战.师门技能[self.选中].包含技能 - 4)
	self.资源组[5]:更新(x,y,false)
	self.资源组[6]:更新(x,y,false)
	self.资源组[7]:更新(x,y,self.选中 ~= 0 and self.助战.师门技能[self.选中].等级 < 180,1)
	self.焦点 = false
	if self.鼠标 then
		if self.资源组[2]:事件判断() then
			self:打开()
			return false
		elseif self.资源组[3]:事件判断() then
			self.加入 = self.加入 - 1
		elseif self.资源组[4]:事件判断() then
			self.加入 = self.加入 + 1
		elseif self.资源组[7]:事件判断() then
			发送数据(114.1,{编号=self.助战.编号,序列=self.选中})
			if tp.队伍[1].当前经验 >= self.本次需求.经验 and (tp.金钱 >= self.本次需求.金钱 or tp.储备 >= self.本次需求.金钱) then
				if self.助战.等级+10 >= self.助战.师门技能[self.选中].等级 then
					for n=1,#self.助战.师门技能[self.选中].包含技能 do
					 	if self.助战.师门技能[self.选中].包含技能[n].学会 then
						 	self.助战.师门技能[self.选中].包含技能[n].等级 = self.助战.师门技能[self.选中].等级
						end
					end
					self.助战.师门技能[self.选中].等级 = self.助战.师门技能[self.选中].等级 + 1
					self.介绍文本:清空()
					self.介绍文本:添加文本("#N/【等级】"..self.助战.师门技能[self.选中].等级)
					self.本次需求 = {经验= 技能消耗.经验[self.助战.师门技能[self.选中].等级+2],金钱 = 技能消耗.金钱[self.助战.师门技能[self.选中].等级+2]}
				else
					tp.提示:写入("#Y/提高人物的等级才能够升级")
				end
			end
		end
	end
	-- 显示
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x + 364,self.y + 6)
	self.资源组[3]:显示(self.x + 355,self.y + 40)
	self.资源组[4]:显示(self.x + 355,self.y + 168)
	self.资源组[5]:显示(self.x + 354,self.y + 202)
	self.资源组[6]:显示(self.x + 354,self.y + 330)
	self.资源组[7]:显示(self.x + 154,self.y + 440,true)
	local fonts = tp.字体表.普通字体
	fonts:置颜色(ARGB(255,0,0,0))
	if self.助战.门派 ~= "无门派" then
		for n=1,7 do
			bw:置坐标(self.x+18,self.y+35+n*40-5)
			if self.选中 ~= n then
				if bw:检查点(x,y) and not tp.消息栏焦点 and self.鼠标 then
					box(self.x+16,self.y+35+n*40-9,self.x+181,self.y+72+n*40-9,ARGB(255,201,207,109))
					if 引擎.鼠标弹起(0) then
						self.选中 = n
						self.加入 = 0
						self.包含技能 = {}
						self.介绍文本:清空()
						self.介绍文本:添加文本("#N/【等级】"..self.助战.师门技能[self.选中].等级)
						self.本次需求 = {经验= 技能消耗.经验[self.助战.师门技能[self.选中].等级+1],金钱 = 技能消耗.金钱[self.助战.师门技能[self.选中].等级+1]}
					end
					self.焦点 = true
				end
			else
				local ys = ARGB(255,91,90,219)
				if bw:检查点(x,y) then
					ys = ARGB(255,108,110,180)
					self.焦点 = true
				end
				box(self.x+16,self.y+35+n*40-9,self.x+181,self.y+72+n*40-9,ys)
			end
			local sm = self.助战.师门技能[n]
			local ski = 引擎.取技能(sm.名称)   --1介绍 6资源 7小图标 8大图标
			if self.师门技能[n] == nil then
				self.师门技能[n] = tp.资源:载入(ski[6],"网易WDF动画",ski[8])
			end
			self.师门技能[n]:显示(self.x+18,self.y+35+n*40-5)
			fonts:显示(self.x + 18+35,self.y + 35 +n*40+2,self.助战.师门技能[n].名称)
			fonts:显示(self.x + 18+112,self.y + 35 +n*40+2 ,self.助战.师门技能[n].等级.."/180")
		end
		-- 技能信息类
		if self.选中 ~= nil and self.选中 ~= 0 then
			--if #self.助战.师门技能[self.选中].包含技能 > 0 then
				--end
			if #self.助战.师门技能[self.选中].包含技能 > 0 then
				for i=1,#self.助战.师门技能[self.选中].包含技能 do
				local ski1 = 引擎.取技能(self.助战.师门技能[self.选中].包含技能[i].名称)
				self.包含技能[i] =  tp.资源:载入(ski1[6],"网易WDF动画",ski1[8])
				end
				for i=1,4 do
					if self.包含技能[i] ~= nil then
						if not self.助战.师门技能[self.选中].包含技能[i].学会 then
						   self.包含技能[i+self.加入]:灰度级()
					        end
						self.包含技能[i+self.加入]:显示(self.x+208,self.y+i*30+37)
						fonts:显示(self.x+235,self.y+i*30+42,self.助战.师门技能[self.选中].包含技能[i+self.加入].名称)
						if self.包含技能[i]:是否选中(x,y) and self.鼠标 then
					      tp.提示:技能(x,y,self.助战.师门技能[self.选中].包含技能[i],self.助战.师门技能[self.选中].包含技能[i].剩余冷却回合)
			                end
					end
				end
			end
			fonts:显示(self.x + 83,self.y + 362,tp.队伍[1].当前经验)
			fonts:显示(self.x + 83,self.y + 385,tp.金钱)
			fonts:显示(self.x + 83,self.y + 407,tp.存银)
			if self.本次需求 ~= nil then
				fonts:显示(self.x + 290,self.y + 362,self.本次需求.经验)
				fonts:显示(self.x + 290,self.y + 385,self.本次需求.金钱)
			else
				fonts:显示(self.x + 290,self.y + 362,"未学会技能")
				fonts:显示(self.x + 290,self.y + 385,"未学会技能")
			end
			fonts:显示(self.x + 290,self.y + 407,tp.储备)
		end
	end
	self.介绍文本:显示(self.x+205,self.y+205)
end

function 助战技能学习:检查点(x,y)
	if self.资源组~=nil and self.资源组[1]:是否选中(x,y)  then
		 return true
	end
end

function 助战技能学习:初始移动(x,y)
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

function 助战技能学习:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 助战技能学习