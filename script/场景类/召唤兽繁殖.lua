--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-04-29 17:55:47
--======================================================================--
local 场景类_召唤兽繁殖 = class()
local zts,zts1,bb,tp,资源,按钮,自适应
local insert = table.insert
local 取宝宝 = 引擎.取宝宝
local qmxs = 引擎.取战斗模型
local bw = require("gge包围盒")(0,0,120,37)
local tx = 引擎.取头像
local mouseb = 引擎.鼠标弹起
local box = 引擎.画矩形

function 场景类_召唤兽繁殖:初始化(根)
	self.ID = 123
	self.x = math.floor(全局游戏宽度/2-全局游戏宽度/4)
	self.y = math.floor(全局游戏高度/2-全局游戏高度/6)
	self.xx = 0
	self.yy = 0
	self.注释 = "召唤兽繁殖"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	资源 = 根.资源
	按钮 = 根._按钮
	自适应 = tp._自适应
	self.背景=资源:载入('wpal/121.wpal',"网易WDF动画",0x000bb123)
	self.普通繁殖=按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"普通繁殖")
	self.高级繁殖=按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"高级繁殖")
	self.上翻=按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true)
	self.下翻=按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true)
	self.未知=资源:载入('wzife.wd1',"网易WDF动画",0x62F1C735)

	zts = tp.字体表.方正简体
	zts1 = tp.字体表.描边字体
	self.窗口时间 = 0
	self.加入 = 0
	self.头像组 = {}
end

function 场景类_召唤兽繁殖:刷新数据(b)
	bb=b
end

function 场景类_召唤兽繁殖:打开()
	if self.可视 then
		self.可视 = false
		self.主召唤兽 = nil
		self.副召唤兽 = nil
		self.主动 = nil
		self.副动 = nil
	else
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 场景类_召唤兽繁殖:显示(dt,x,y)
	self.焦点 = false
	self.背景:更新(x,y)
	self.背景:显示(self.x ,self.y )
	local bbs = tp.队伍[1].宝宝列表
	self.普通繁殖:更新(x,y,self.主召唤兽 ~= nil and self.副召唤兽 ~= nil)
	self.高级繁殖:更新(x,y,self.主召唤兽 ~= nil and self.副召唤兽 ~= nil)
	self.上翻:更新(x,y)
	self.下翻:更新(x,y)
	if self.主动 ~= nil then
		self.主动:更新(dt)
	end
	if self.副动 ~= nil then
		self.副动:更新(dt)
	end
	self.上翻:更新(x,y,self.加入 > 0)
	self.下翻:更新(x,y,self.加入 < #tp.队伍[1].宝宝列表 - 5)
	self.普通繁殖:显示(self.x + 208,self.y + 140)
	self.高级繁殖:显示(self.x + 298,self.y + 140)
	if self.上翻:事件判断() then
		self.加入 = self.加入 - 1
	elseif self.下翻:事件判断() then
		self.加入 = self.加入 + 1
	end
	self.上翻:显示(self.x + 158,self.y + 160)
	self.下翻:显示(self.x + 158,self.y + 352)
	if self.主动 ~= nil and self.主召唤兽 ~= nil then
		tp.影子:显示(self.x + 95,self.y + 130)
		self.主动:显示(self.x + 95,self.y + 130)
		if self.主宠物形象 ~= nil then
			self.主宠物形象:更新(dt)
			self.主宠物形象:显示(self.x + 95,self.y + 130)
		end
		zts2:置颜色(黑色)
		zts2:显示(self.x+185,self.y+31,tp.队伍[1].宝宝列表[self.主召唤兽].性别)
		zts2:显示(self.x+185,self.y+58,tp.队伍[1].宝宝列表[self.主召唤兽].繁殖)
	end
	if self.副动 ~= nil and self.副召唤兽 ~= nil then
		tp.影子:显示(self.x + 476,self.y + 130)
		self.副动:显示(self.x + 476,self.y + 130)
		if self.副宠物形象 ~= nil then
			self.副宠物形象:更新(dt)
			self.副宠物形象:显示(self.x + 476,self.y + 130)
		end
		zts2:显示(self.x+336,self.y+31,tp.队伍[1].宝宝列表[self.副召唤兽].性别)
		zts2:显示(self.x+336,self.y+58,tp.队伍[1].宝宝列表[self.副召唤兽].繁殖)
	end
	for i=1,5 do
		if bbs[i+self.加入] ~= nil  then
			local jx = self.x+33
			local jy = self.y+(i*43)+118
			bw:置坐标(jx,jy+1)
			if self.头像组[i+self.加入] == nil or self.头像组[i+self.加入][1] ~= bbs[i+self.加入].模型 then
				self.头像组[i+self.加入] = {bbs[i+self.加入].模型}
				local n = tx(self.头像组[i+self.加入][1])
				self.头像组[i+self.加入][2] = tp.资源:载入(n[7],"网易WDF动画",n[1])
			end
			if bw:检查点(x,y) then
				if mouseb(0) and self.鼠标 and not tp.消息栏焦点 then
					if self.主召唤兽 ~= i + self.加入 and self.副召唤兽 ~= i + self.加入 then
						if self.主召唤兽 == nil then
							self.主召唤兽 = i + self.加入
							self:主置形象()
						elseif self.副召唤兽 == nil then
							self.副召唤兽 = i + self.加入
							self:副置形象()
						elseif self.主召唤兽 ~= nil and self.副召唤兽 ~= nil then
							self.主召唤兽 = i + self.加入
							self:主置形象()
						end
					else
						if self.主召唤兽 == i + self.加入 then
							self.主召唤兽 = nil
							self:主置形象()
						elseif self.副召唤兽 == i + self.加入 then
							self.副召唤兽 = nil
							self:副置形象()
						end
					end
				end
				self.焦点 = true
			end
			if self.主召唤兽 == i + self.加入 or self.副召唤兽 == i + self.加入 then
				box(jx-2,jy-3,jx+128,jy+40,-2097481216)
			end
			tp.宠物头像背景_:显示(jx+1,jy)
			self.头像组[i+self.加入][2]:显示(jx+4,jy+4)
			if self.主召唤兽 == i + self.加入 or self.副召唤兽 == i + self.加入 then
				self.未知:显示(jx+92,jy+3)
			end
			if tp.队伍[1].宝宝列表[i+self.加入].参战信息 ~= nil then
				zts2:置颜色(-65536)
			else
				zts2:置颜色(-16777216)
			end
			zts2:显示(jx+41,jy+4,bbs[i+self.加入].名称)
			zts2:显示(jx+41,jy+21,bbs[i+self.加入].等级.."级")
		end
	end
	if self.主召唤兽 ~= nil and self.副召唤兽 ~= nil then
	    if tp.队伍[1].宝宝列表[self.副召唤兽].模型==tp.队伍[1].宝宝列表[self.主召唤兽].模型 then
			if tp.队伍[1].宝宝列表[self.副召唤兽].种类==tp.队伍[1].宝宝列表[self.主召唤兽].种类 and tp.队伍[1].宝宝列表[self.副召唤兽].性别~=tp.队伍[1].宝宝列表[self.主召唤兽].性别 then
			    local 平均成长=(tp.队伍[1].宝宝列表[self.副召唤兽].成长+tp.队伍[1].宝宝列表[self.主召唤兽].成长)/2
			    local 平均攻击=(tp.队伍[1].宝宝列表[self.副召唤兽].攻击资质+tp.队伍[1].宝宝列表[self.主召唤兽].攻击资质)/2
			    local 平均防御=(tp.队伍[1].宝宝列表[self.副召唤兽].防御资质+tp.队伍[1].宝宝列表[self.主召唤兽].防御资质)/2
			    local 平均体力=(tp.队伍[1].宝宝列表[self.副召唤兽].体力资质+tp.队伍[1].宝宝列表[self.主召唤兽].体力资质)/2
			    local 平均法力=(tp.队伍[1].宝宝列表[self.副召唤兽].法力资质+tp.队伍[1].宝宝列表[self.主召唤兽].法力资质)/2
			    local 平均速度=(tp.队伍[1].宝宝列表[self.副召唤兽].速度资质+tp.队伍[1].宝宝列表[self.主召唤兽].速度资质)/2
			    local 平均躲闪=(tp.队伍[1].宝宝列表[self.副召唤兽].躲闪资质+tp.队伍[1].宝宝列表[self.主召唤兽].躲闪资质)/2
			    local 平均技能=math.floor((#tp.队伍[1].宝宝列表[self.副召唤兽].技能+#tp.队伍[1].宝宝列表[self.主召唤兽].技能)/2)+1
			    local 资质波动范围={85,120}
			    local 成长波动范围={-0.1,0.5}
			    if tp.队伍[1].宝宝列表[self.副召唤兽].种类=="神兽" then
			        资质波动范围={95,135}
			        成长波动范围={-0.1,0.8}
			        self.消耗道具 = tp.资源:载入('wpal/121.wpal',"网易WDF动画",0x000bb121)
			        self.消耗道具:更新(x,y)
			        self.消耗道具:显示(self.x+266,self.y+86)
			        if self.消耗道具:是否选中(x,y) then
			        	tp.提示:自定义(x-42,y+27,"#G仙灵竹枝\n\n神兽繁殖每次消耗99个仙灵竹枝,普通繁殖消耗3亿银子,高级繁殖消耗2000仙玉,高级繁殖会提升高成长高资质(可能突破上限)仙灵宠物几率,还有概率出现双胞胎")
			        end
			    else
			    	self.消耗道具 = tp.资源:载入('wpal/121.wpal',"网易WDF动画",0x000bb119)
			        self.消耗道具:更新(x,y)
			        self.消耗道具:显示(self.x+266,self.y+86)
			        if self.消耗道具:是否选中(x,y) then
			        	tp.提示:自定义(x-42,y+27,"#G仙灵竹叶\n\n宠物繁殖每次消耗99个仙灵竹叶,普通繁殖消耗1.5亿银子,高级繁殖消耗1000仙玉,高级繁殖会提升高成长高资质(可能突破上限)仙灵宠物几率,还有概率出现双胞胎")
			        end
			    end
			    local 资质下限=资质波动范围[1]*0.01
			    local 资质上限=资质波动范围[2]*0.01
			    zts2:显示(self.x+299,self.y+170,""..平均成长+成长波动范围[1].."~"..平均成长+成长波动范围[2].."")
			    zts2:显示(self.x+293,self.y+195,""..math.floor(平均攻击*资质下限).."~"..math.floor(平均攻击*资质上限).."")
			    zts2:显示(self.x+293,self.y+220,""..math.floor(平均防御*资质下限).."~"..math.floor(平均防御*资质上限).."")
			    zts2:显示(self.x+293,self.y+245,""..math.floor(平均体力*资质下限).."~"..math.floor(平均体力*资质上限).."")
			    zts2:显示(self.x+293,self.y+270,""..math.floor(平均法力*资质下限).."~"..math.floor(平均法力*资质上限).."")
			    zts2:显示(self.x+293,self.y+295,""..math.floor(平均速度*资质下限).."~"..math.floor(平均速度*资质上限).."")
			    zts2:显示(self.x+293,self.y+320,""..math.floor(平均躲闪*资质下限).."~"..math.floor(平均躲闪*资质上限).."")
			    zts2:显示(self.x+323,self.y+345,""..平均技能.."")
			end
		end
		if self.普通繁殖:事件判断() then
			发送数据(5023,{主宠=self.主召唤兽,副宠=self.副召唤兽,消耗=1})
		end
		if self.高级繁殖:事件判断() then
			发送数据(5023,{主宠=self.主召唤兽,副宠=self.副召唤兽,消耗=2})
		end
	end
end

function 场景类_召唤兽繁殖:主置形象()
	if tp.队伍[1].宝宝列表[self.主召唤兽]  ~= nil and self.主召唤兽 ~= 0 then
		local n = qmxs(tp.队伍[1].宝宝列表[self.主召唤兽].模型)
		self.主动 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		if tp.队伍[1].宝宝列表[self.主召唤兽].饰品 ~= nil then
			n = qmxs(tp.队伍[1].宝宝列表[self.主召唤兽].模型.."_饰品")
			self.主宠物形象 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		end
		if tp.队伍[1].宝宝列表[self.主召唤兽].染色方案 ~= nil then
			self.主动:置染色(tp.队伍[1].宝宝列表[self.主召唤兽].染色方案,tp.队伍[1].宝宝列表[self.主召唤兽].染色组[1],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[2],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[3],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[4])
			self.主动:置方向(0)
		end
	end
end

function 场景类_召唤兽繁殖:副置形象()
	if tp.队伍[1].宝宝列表[self.副召唤兽]  ~= nil and self.副召唤兽 ~= 0 then
		local n = qmxs(tp.队伍[1].宝宝列表[self.副召唤兽].模型)
		self.副动 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		if tp.队伍[1].宝宝列表[self.副召唤兽].饰品 ~= nil then
			n = qmxs(tp.队伍[1].宝宝列表[self.副召唤兽].模型.."_饰品")
			self.副宠物形象 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		end
		if tp.队伍[1].宝宝列表[self.副召唤兽].染色方案 ~= nil then
			self.副动:置染色(tp.队伍[1].宝宝列表[self.副召唤兽].染色方案,tp.队伍[1].宝宝列表[self.副召唤兽].染色组[1],tp.队伍[1].宝宝列表[self.副召唤兽].染色组[2],tp.队伍[1].宝宝列表[self.副召唤兽].染色组[3],tp.队伍[1].宝宝列表[self.副召唤兽].染色组[4])
			self.副动:置方向(0)
		end
	end
end

function 场景类_召唤兽繁殖:检查点(x,y)
	if self.背景:是否选中(x,y)  then
		return true
	end
end

function 场景类_召唤兽繁殖:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_召唤兽繁殖:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_召唤兽繁殖