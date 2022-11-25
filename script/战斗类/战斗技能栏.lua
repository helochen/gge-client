--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-08-26 18:25:51
--======================================================================--
local 场景类_战斗技能栏 = class()
local tp
local ARGB = ARGB

function 场景类_战斗技能栏:初始化(根)
	self.ID = 103
	self.x = 392
	self.y = 115
	self.xx = 0
	self.yy = 0
	self.注释 = "战斗"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 资源:载入('wzife.wdf',"网易WDF动画",0x69823EE5),
		[2] = 资源:载入('wzife.wdf',"网易WDF动画",0x32F119A5),
		[3] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xF11233BB),0,0,4),
	}
	self.技能 = {}
	local 格子 = 根._技能格子
	for i=1,20 do
		self.技能[i] = 格子(0,0,i,"战斗技能栏")
	end
	self.资源组[3]:绑定窗口_(103)
	self.背景 = 1
	self.窗口时间 = 0
	self.上回合 = nil
	self.上回合人物 = nil
	self.上回合宠物 = nil
	self.上回合人物特技 = nil
	self.偏移 = {0,0}
	tp = 根
	self.当前类型=nil
	self.法术类型=nil
end

function 场景类_战斗技能栏:打开(技能组,法术类型,人物或宠物)
	if self.可视 then
		self.背景 = 1
		self.可视 = false
		self.当前类型=nil
		self.法术类型=nil
		--return false
		战斗类.战斗指令.法术开关=false
	else
		self.当前类型=人物或宠物
		self.法术类型=法术类型
		self.背景 = 1
		local i = 0
		-- print("战斗技能栏",table.tostring(技能组),上回合)
		for w=1,20 do
			self.技能[w]:置技能(nil)
	        if 技能组[w]~=nil then

			  local 临时技能=require("script/显示类/技能")()
              临时技能:置对象(技能组[w].名称)
              local 临时等级=技能组[w].等级
              技能组[w]=临时技能
              技能组[w].等级=临时等级
            end
			if 技能组[w] ~= nil then
				self.技能[w]:置技能(技能组[w],true)
				self.技能[w].剩余冷却回合 = 技能组[w].剩余冷却回合
				if self.技能[w].剩余冷却回合 ~= nil then
				end
				i = i + 1
			end
		end
		if i >= 10 then
			self.背景 = 2
			self.偏移[2] = -5
		else
		    self.偏移[2] = 0
		end
		tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	  	self.可视 = true
	  	战斗类.战斗指令.法术开关=true
	end
end

function 场景类_战斗技能栏:更新()
end

function 场景类_战斗技能栏:显示(dt,x,y)
	if not self.可视 then
		return
	end
	self:检查点(x,y)
	self.焦点 = false
	self.资源组[self.背景]:显示(self.x,self.y)
	-- if self.鼠标 then
		self.资源组[3]:更新(dt,x,y)
		self.资源组[3]:显示(self.x+165,self.y+6,true)
		--print(self.资源组[3]:事件判断())
		if self.资源组[3]:事件判断() then
			self:打开()
			return false
		end
	-- end

	local xx = 0
	local yy = 0
	for w=1,20 do
		self.技能[w]:置坐标(self.x+30+xx*88+self.偏移[1],self.y+32+yy*42+self.偏移[2])
		self.技能[w]:显示(x,y,true or self.鼠标)
		if self.技能[w].技能 ~= nil and self.技能[w].焦点 then
			tp.提示:技能(x,y,self.技能[w].技能,self.技能[w].剩余冷却回合)
			if self.技能[w].事件 and self.鼠标 and self.技能[w].剩余冷却回合 == nil then
				战斗类.战斗指令:设置法术参数(self.技能[w])
				self:打开()
			elseif 引擎.鼠标弹起(右键) and self.技能[w].剩余冷却回合 == nil then
				if self.当前类型=="人物" and self.法术类型=="法术" then
					self.上回合人物=w
					战斗类.战斗快捷键法术=self.技能[w]
				elseif self.当前类型=="宠物" and self.法术类型=="法术" then
					self.上回合宠物=w
					战斗类.宠物战斗快捷键法术=w--self.技能[w]
				end
				-- 战斗类.战斗指令:设置法术参数(self.技能[w])
				-- self:打开()
			end
			self.焦点 = true
		end
		xx = xx + 1
		if xx > 1 then
			xx = 0
			yy = yy + 1
		end
	end
	if self.上回合人物 ~= nil and self.当前类型=="人物" and self.法术类型=="法术" and self.技能[self.上回合人物].技能~= nil and self.技能[self.上回合人物].技能.名称~=nil then
		tp.字体表.普通字体:置颜色(-256):显示(self.x+15,self.y+269,self.技能[self.上回合人物].技能.名称)
	elseif self.上回合宠物 ~= nil and self.当前类型=="宠物" and self.法术类型=="法术" and self.技能[self.上回合宠物].技能~= nil and self.技能[self.上回合宠物].技能.名称~=nil  then
		tp.字体表.普通字体:置颜色(-256):显示(self.x+15,self.y+269,self.技能[self.上回合宠物].技能.名称)
	end
	if tp.按钮焦点 then
		self.焦点 = true
	end
	if 引擎.鼠标弹起(1) and not tp.禁止关闭 and self.鼠标 then
		self:打开()
	end
end

function 场景类_战斗技能栏:检查点(x,y)
	if self.可视 and self.资源组[self.背景]:是否选中(x,y)  then
		self.鼠标=true
		return true
   else
   	    self.鼠标=false
   	    return false
	end
end

function 场景类_战斗技能栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		--tp.场景.战斗.移动窗口 = true
	end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_战斗技能栏:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_战斗技能栏