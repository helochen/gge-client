--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-03-23 19:10:00
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 场景类_更多属性 = class()
local tp,zts,zts1,zts2,zts3,zts4
local mousea = 引擎.鼠标弹起
local insert = table.insert
local wbxx = {"法术伤害","物理暴击等级","穿刺等级","狂暴等级","法术暴击等级","法术伤害结果","封印命中等级","治疗能力","抗物理暴击等级","格挡值","抗法术暴击等级","抵抗封印等级","气血回复效果","法术防御"}
local sxxx = {"法术伤害","物理暴击等级","穿刺等级","狂暴等级","法术暴击等级","法术伤害结果","封印命中等级","治疗能力","抗物理暴击等级","格挡值","抗法术暴击等级","抵抗封印等级","气血回复效果","法术防御"}

function 场景类_更多属性:初始化(根)
	self.ID = 999998
	self.x = 291
	self.y = 117
	self.xx = 0
	self.yy = 0
	self.焦点 = false
	self.注释 = "更多属性"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	xs1 = tp.字体表.普通字体
	zts1 = tp.字体表.普通字体__
	zts2 = tp.字体表.普通字体_
	zts3 = tp.字体表.普通字体__
	self.窗口时间 = 0
end

function 场景类_更多属性:打开()
	if self.可视 then
		self.可视 = false
		self.资源组 = nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		self.资源组 = {
			[1] = 资源:载入('wzife.wdf',"网易WDF动画",0x00FF11EE),
		}
		self.x = tp.窗口.人物状态栏.x-208
		self.y =tp.窗口.人物状态栏.y
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_更多属性:显示(dt,x,y)
	local wjxx = tp.队伍[1]
	self.焦点 = false
	self.资源组[1]:显示(self.x+60,self.y+190)
	zts2:置颜色(0xFF06F60B)
	local xx = 0
	local yy = 1
	for i = 1,14 do
		xx = xx + 1
		if i <= 8 then
		    zts2:显示(self.x+91+xx*169-161,self.y+40+yy*25.5-40,wjxx[sxxx[i]])
		    if tp.队伍[1].幻化特性 ~= nil and tp.队伍[1].幻化特性[sxxx[i]] ~= nil then
		    	zts2:显示(self.x+115+xx*169-161,self.y+40+yy*25.5-40,"(+"..tp.队伍[1].幻化特性[sxxx[i]].."%)")
		    end
		else
			zts2:显示(self.x+91+xx*169-161,self.y+82+yy*25.5-40,wjxx[sxxx[i]])
			if tp.队伍[1].幻化特性 ~= nil and tp.队伍[1].幻化特性[sxxx[i]] ~= nil then
		    	zts2:显示(self.x+115+xx*169-161,self.y+82+yy*25.5-40,"(+"..tp.队伍[1].幻化特性[sxxx[i]].."%)")
		    end
		end
		if xx >= 1 then
			xx = 0
			yy = yy + 1
		end
	end
end

function 场景类_更多属性:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_更多属性:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_更多属性:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_更多属性