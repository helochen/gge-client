--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-03-05 07:07:40
--======================================================================--
local 场景类_事件 = class()

local floor = math.floor
local random = math.random
local zts
local xys = 生成XY
local remove = table.remove
local qmx = 引擎.取模型
local qwp = 引擎.取物品


function 场景类_事件:初始化(根,假人,出现特效,播放音效)
	local 资源 = qmx(假人.模型)
	local 重新绘成 = true
	if 假人.主角 == nil then
		self.假人 = {
			["静立"] = 根.资源:载入(资源[3],"网易WDF动画",资源[1]),
			["行走"] = 根.资源:载入(资源[3],"网易WDF动画",资源[2])
		}
	else
		if 假人.模型 == 根.队伍[1].模型 then
		    self.假人 = {
				["静立"] = 根.场景.人物.人物.静立,
				["行走"] = 根.场景.人物.人物.行走
			}
			if 根.场景.人物.人物["武器_静立"] ~= nil then
				self.假人["武器_静立"] = 根.场景.人物.人物["武器_静立"]
				self.假人["武器_行走"] = 根.场景.人物.人物["武器_静立"]
			end
			重新绘成 = false
		else
			if 假人.模型 == "巫蛮儿坐下" or 假人.模型 == "杀破狼坐下" or 假人.模型 == "羽灵神坐下" or 假人.模型 == "偃无师坐下" or 假人.模型 == "桃夭夭坐下" or 假人.模型 == "鬼潇潇坐下" then
				假人.最后帧方式 = 0
			end
			self.假人 = {
				["静立"] = 根.资源:载入(资源[3],"网易WDF动画",资源[1]),
				["行走"] = 根.资源:载入(资源[3],"网易WDF动画",资源[2])
			}
		end
	end
	self.名称 = 假人.名称
	self.坐标 = xys(floor(假人.X*20),floor(假人.Y*20))
	self.真实坐标 = xys(self.坐标.x,self.坐标.y)
	self.行为 = "静立"
	self.主角 = 假人.主角
	self.方向 = 假人.方向
	self.模型 = 假人.模型
	self.武器 = 假人.武器
	self.坐骑 = 假人.坐骑
	self.翅膀 = 假人.翅膀
	self.编号 = 假人.编号
	self.喊话 = require("script/显示类/喊话").创建(根)
	self.初始方向 = self.方向
	if 重新绘成 then
		if self.武器 ~= nil then
			self:置武器(self.武器,self.模型)
		end
		if 假人.染色方案 ~= nil then
			self:置染色(假人.染色方案,假人.染色组[1],假人.染色组[2],假人.染色组[3])
		end
	else
		self.记忆方向 = 根.场景.人物.方向
	end
	self.名称偏移 = xys(根.字体表.人物字体:取宽度(self.名称) / 2,-15)
	self.目标格子 = {}
	self.移动 = false
	self.特效 = nil
	if 出现特效 ~= nil then
		self.出现特效 = 根:载入特效(出现特效)
	end
	self:置方向(self.方向)
	self.方向组 = nil
	self.间隔 = 0
	self.间隔计次 = 0
	if tp == nil then
		tp = 根
	end
	zts = 根.字体表.人物字体
	self.最后帧方式 = 0
	if 假人.最后帧方式 ~= nil then
		self.最后帧方式 = 假人.最后帧方式
		if 假人.最后帧方式 == 1 then
			self.假人.静立.当前帧 = self.假人.静立.结束帧
			self.假人.静立:更新纹理()
		end
	end
end

function 场景类_事件:下一点(xy)
	if xy then
		if #self.目标格子 > 1 then
			local 位置 = #self.目标格子
			for i,v in ipairs(self.目标格子) do
				if 引擎.场景.场景.地图.寻路:判断直线障碍(xy,v) then
					位置 = i
					break
				end
			end
			for i=1,位置 do
				if #self.目标格子 > 1 then
					remove(self.目标格子, 1)
				end
			end
		end
	end
end

function 场景类_事件:开始移动()
	if self.目标格子[1] == nil then
		self:停止移动()
		return
	end
	self.行为 = "行走"
	local b = xys(floor(self.目标格子[1].x*20),floor(self.目标格子[1].y*20))
	local 方向 = 取八方向(取两点角度(self.真实坐标,b),not self.方向开关)
	if 取两点距离(self.真实坐标,b) < 2 then -- 小于可移动点直接到达位置
		self.真实坐标 = b
		if self.编号 == 1 then
			引擎.场景.角色坐标 = self.真实坐标
		end
		remove(self.目标格子, 1)
		self:下一点(self.目标格子[1])
		if #self.目标格子 <= 0 then
			self:停止移动()
		end
		return false
	end
	self.真实坐标 = 取移动坐标(self.真实坐标,b,2)
	if self.编号 == 1 then
		tp.角色坐标 = self.真实坐标
	end
	self:置方向(方向)
end

function 场景类_事件:停止移动()
	self.目标格子 = {}
	self.行为 = "静立"
	self.移动 = false
end

function 场景类_事件:置模型(模型,武器)
	local 资源 = qmx(模型)
	self.假人 = {
		["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),
		["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])
	}
end

function 场景类_事件:显示(dt,x,y,pys)
	local 名称颜色 = -171588352
	local 称谓颜色 = -174995979
	if self.主角 then
		名称颜色 =  -350300386
		称谓颜色 =  -931286529
	end
	if self.出现特效 ~= nil then
		self.出现特效:更新(dt)
		if (self.出现特效.已载入 >= self.出现特效.结束帧) then
			self.出现特效 = nil
			return false
		end
		self.出现特效:显示(self.坐标 + pys)
		return false
	end
	local dts = dt
	if self.最后帧方式 == 1 then
		dts = 0
	elseif self.最后帧方式 == 2 then
		if self.假人[self.行为].当前帧 == self.假人[self.行为].结束帧 then
			dts = 0
		end
	end
	self.假人[self.行为]:更新(dts)
	if self.假人["武器_"..self.行为] ~= nil then
		self.假人["武器_"..self.行为]:更新(dts)
	end
	if self.假人[self.行为]:是否选中(x,y) then
		self.假人[self.行为]:置高亮()
		if self.假人["武器_"..self.行为] ~= nil then
			self.假人["武器_"..self.行为]:置高亮()
		end
		名称颜色 = -419495936
		称谓颜色 = -419495936
	else
		self.假人[self.行为]:取消高亮()
		if self.假人["武器_"..self.行为] ~= nil then
			self.假人["武器_"..self.行为]:取消高亮()
		end
	end
	local s = xys(floor(self.真实坐标.x),floor(self.真实坐标.y))
	self.假人[self.行为]:显示(s + pys)
	if self.假人["武器_"..self.行为] ~= nil then
		self.假人["武器_"..self.行为]:显示(s + pys)
	end
	zts:置颜色(名称颜色)
	zts:显示x(s + pys - self.名称偏移,self.名称)
	zts:置阴影颜色(-1275068416)
	if self.特效 ~= nil then
		self.特效:更新(dt)
		if (self.特效.已载入 >= self.特效.结束帧) then
			self.特效 = nil
			return false
		end
		self.特效:显示(s + pys)
	end
	if self.方向组 ~= nil then
		self.间隔计次 = self.间隔计次 + 1
		if self.间隔计次 >= self.间隔 then
			if #self.方向组 == 0 then
				self.方向组 = nil
				self.间隔 = 0
				self.间隔计次 = 0
				return false
			end
			self:置方向(self.方向组[1])
			remove(self.方向组,1)
			self.间隔计次 = 0
		end
	end
	if self.移动 then
		self:开始移动(dt)
	end
	self.喊话:显示(s.x + pys.x,s.y + pys.y,dt,x,y)
	self.坐标.x = s.x
	self.坐标.y = s.y
end

function 场景类_事件:置方向(d)
	self.假人["静立"]:置方向(d)
	self.假人["行走"]:置方向(d)
	if self.假人["武器_静立"] ~= nil then
		self.假人["武器_静立"]:置方向(d)
		self.假人["武器_行走"]:置方向(d)
	end
	self.方向 = d
end

function 场景类_事件:置武器(武器,模型)
	local djs = qwp(武器)
	local zl = tp:取武器子类(djs[4])
	if 武器 == "龙鸣寒水" then
		zl = "弓弩1"
	end
	local 资源 = qmx(模型,zl)
	self.假人["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1])
	self.假人["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])
	local m = tp:取武器附加名称(zl,djs[5],武器)
	local n = qmx(m.."_"..模型)
	self.假人["武器_静立"] = tp.资源:载入(n[3],"网易WDF动画",n[1])
	self.假人["武器_行走"] = tp.资源:载入(n[3],"网易WDF动画",n[2])
	self.假人["武器_静立"]:置差异(self.假人["武器_静立"].帧数-self.假人["静立"].帧数)
	self.假人["武器_行走"]:置差异(self.假人["武器_行走"].帧数-self.假人["行走"].帧数)
end

function 场景类_事件:置染色(染色方案,a,b,c)
	self.假人["静立"]:置染色(染色方案,a,b,c)
	self.假人["行走"]:置染色(染色方案,a,b,c)
	self:置方向(self.方向)
end

return 场景类_事件