--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-04-29 17:55:47
--======================================================================--
local 场景类_玩家 = class()
local floor = math.floor
local random = 引擎.取随机整数
local xys = 生成XY
local qmxs = 引擎.取模型
local remove = table.remove
local insert = table.insert
local rwzt,tp
local jds = 取两点角度
local jls = 取两点距离
local yds = 取移动坐标
local szb = 取四至八方向
local ARGB = ARGB
local mouse = 引擎.鼠标弹起
local pairs = ipairs
local qyg = 引擎.取野怪
local 光环补差x,光环补差y = 0,0
local 坐骑补差x,坐骑补差y=0,0
local 临时资源
local 临时资源1
local 临时资源包
local qzdjy = 引擎.取锦衣模型
local qzdjys = 取锦衣身体模型
local 名称颜色 = -350300386
local 称谓颜色 = -931286529
local tszq = 引擎.新增坐骑

function 场景类_玩家:初始化(玩家)
	if tp == nil then
		tp = 引擎.场景
		rwzt = tp.字体表.人物字体
	end
	玩家.y = 玩家.y + (random(1,12) / 100)
	self.玩家 = {}
	self.组队标志=tp.资源:载入('addon.wdf',"网易假人动画",0x2231EBB4)
	self.战斗动画=tp.资源:载入('addon.wdf',"网易假人动画",0x97C79EDB)
	self.名称 = 玩家.名称
	self.坐标 = xys(floor(玩家.x),floor(玩家.y)+0.1)
	self.真实坐标 = xys(floor(玩家.x),floor(玩家.y)+0.1)
	self.编号 = 玩家.编号
	self.x=玩家.x
	self.y=玩家.y
	self.玩家ID = 玩家.id
	self.行为 = "静立"
	self.方向 = 玩家.方向
	self.记忆方向 = self.方向
	self.真实编号 = 玩家.真实编号
	self.当前称谓=玩家.当前称谓
	self.执行事件 = nil
	self.初始坐标 = xys(floor(玩家.x),floor(玩家.y)+0.1)
	self.行走坐标 = xys(floor(玩家.x),floor(玩家.y)+0.1)
	self.事件ID = 玩家.事件ID
	self.武器 = 玩家.武器
	self.模型 = 玩家.模型
	self.组合 = 玩家.组合
	self.行走开关 = false
	self.队长开关 = 玩家.队长
	self.队伍 = 玩家.队伍
	self.类型 = "玩家"
	self.所在地图 = nil
	self.组员数量 = 0
	self.队员编号 = 玩家.队员编号
	self.坐骑 = 玩家.坐骑
	self.染色组 = 玩家.染色组
	self.装备 = 玩家.装备
	self.灵饰 = 玩家.灵饰
	self.锦衣 = 玩家.锦衣
	self.法宝 = 玩家.法宝
	self.染色方案 = 玩家.染色方案
	self.等级 = 玩家.等级
	self.性别 = 玩家.性别
	self.种族 = 玩家.种族
	self.帮派 = 玩家.帮派
	self.门派 = 玩家.门派
	self.战斗开关=玩家.战斗开关
	self.摊位名称=玩家.摊位名称
	self.变身=玩家.变身数据
	self.变异=玩家.变异
	self.pk开关 = 玩家.pk开关
	self.强p开关 = 玩家.强p开关
	self.申请玩家 = nil
	self.特效组={}
	--self.炫彩 = 玩家.炫彩
	--self.炫彩组 = 玩家.炫彩组
	if 玩家显示开关 then
		local 资源 = qmxs(self.模型)
		if self.武器 ~= nil then
			self:穿戴装备(self.武器)
		elseif 玩家.显示饰品 then
			self:穿戴装备(self.武器)
		else
			资源 = qmxs(self.模型)
			if self.锦衣 ~= nil and self.锦衣[1] ~= nil and self.锦衣[1].名称 ~= nil and (self.变身 == nil or 变身显示 == false) then
				if self.锦衣[1].名称 == "夜影" or self.锦衣[1].名称 == "夏日清凉" or self.锦衣[1].名称 == "华风汉雅" or self.锦衣[1].名称 == "萌萌小厨" then
					临时资源 = qzdjy(self.模型.."_静立_"..self.锦衣[1].名称)
					临时资源1 = qzdjy(self.模型.."_行走_"..self.锦衣[1].名称)
					临时资源包 = "shape0.npk"
					if self.锦衣[1].名称 == "华风汉雅" or self.锦衣[1].名称 == "萌萌小厨" then
						临时资源包 = "shape2.npk"
					end
					self.玩家 = {["静立"] = tp.资源:载入(临时资源包,"网易锦衣动画",临时资源),["行走"] = tp.资源:载入(临时资源包,"网易锦衣动画",临时资源1)}
					if self.锦衣[1].名称 == "夏日清凉" or self.锦衣[1].名称 == "华风汉雅" or self.锦衣[1].名称 == "萌萌小厨" then
						临时资源 = qzdjys(self.模型.."_静立_"..self.锦衣[1].名称.."_头")
						临时资源1 = qzdjys(self.模型.."_行走_"..self.锦衣[1].名称.."_头")
						self.玩家["身体_静立"] = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源)
						self.玩家["身体_行走"] = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源1)
					else
						self.玩家["身体_静立"] = nil
						self.玩家["身体_行走"] = nil
					end
				else
					资源 = qmxs(self.锦衣[1].名称.."_"..self.模型)
					self.玩家 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])}
				end
			else
				self.玩家 = {
					["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),
				}
				self.玩家.行走 = tp.资源:载入(资源[3],"网易WDF动画",资源[2])
			end
		end
		if self.坐骑 == nil or self.坐骑.模型 == nil then
			self.坐骑 = nil
		end
		if self.锦衣 ~= nil and self.锦衣[3] ~= nil then
			self:穿戴光环(self.锦衣[3])
		end
		if self.锦衣 ~= nil and self.锦衣[4] ~= nil then
			self:穿戴足迹(self.锦衣[4])
		end
		if self.变身~=nil and 变身显示 then
		    资源=qmxs(self.变身)
		    self.玩家 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])}
			if self.变异 and 染色信息[self.变身]~=nil then
			    self.染色方案2 = 染色信息[self.变身].id
				self.染色组2 = 染色信息[self.变身].方案
		    	self:置染色(self.染色方案2,self.染色组2[1],self.染色组2[2],self.染色组2[3])
				self:置方向(self.方向)
			end
		end
		if 玩家.染色方案 ~= nil and 玩家.染色组 ~= nil and self.锦衣[1] == nil and (self.变身==nil or 变身显示 == false) then
			if next(玩家.染色组) ~= nil then
				self.染色方案 = 玩家.染色方案
				self.染色组 = 玩家.染色组
				self:置染色(玩家.染色方案,玩家.染色组[1],玩家.染色组[2],玩家.染色组[3])
			end
		end
		if self.坐骑~=nil then
			self:坐骑改变()
		end
	end

	self.喊话=require("script/显示类/喊话").创建(tp)
	self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-15)
	if 玩家.称谓 ~= "" and 玩家.称谓 ~= 0 and 玩家.称谓 ~= nil then
		self.称谓 = 玩家.当前称谓
		self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2,-15)
		self.名称偏移.y = - 35
	elseif 玩家.当前称谓 ~= "" and 玩家.当前称谓 ~= 0 and 玩家.当前称谓 ~= nil then
		self.称谓 = 玩家.当前称谓
		self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2,-15)
		self.名称偏移.y = - 35
	end
	if self.称谓 ~= nil and self.称谓 ~= "" then
		if self.称谓=="至尊财神" then
			self.至尊财神=tp.资源:载入('wzife.wd5',"网易假人动画",0x01000051)
		elseif self.称谓=="狂暴之力" then
			self.狂暴之力=tp.资源:载入('wzife.wd5',"网易假人动画",0x01000074)
		elseif self.称谓=="武林圣者" then
			self.武林圣者=tp.资源:载入('wzife.wd5',"网易假人动画",0x01000076)
		elseif self.称谓=="超凡入圣" then
			self.超凡入圣=tp.资源:载入('wzife.wd5',"网易假人动画",0x01000087)
		elseif self.称谓=="洞察先机" then
			self.洞察先机=pwd("39")
		elseif self.称谓=="独步青云" then
			self.独步青云=pwd("40")
		elseif self.称谓=="风华绝代" then
			self.风华绝代=pwd("41")
		elseif self.称谓=="风云再起" then
			self.风云再起=pwd("42")
		elseif self.称谓=="盖世无双" then
			self.盖世无双=pwd("43")
		elseif self.称谓=="盖世英豪" then
			self.盖世英豪=pwd("44")
		elseif self.称谓=="九五之尊" then
			self.九五之尊=pwd("45")
		elseif self.称谓=="龙皇" then
			self.龙皇=pwd("46")
		elseif self.称谓=="神豪" then
			self.神豪=pwd("47")
		elseif self.称谓=="战神" then
			self.战神=pwd("48")
		elseif self.称谓=="纵横三界王者风云" then
			self.纵横三界王者风云=pwd("49")
		end
	end
	self.目标格子 = {}
	self.方向开关 = 4--self.玩家.静立.方向数 == 8
	self.移动 = false
	if self.玩家.静立 ~= nil then
		self.静止转移 = self.玩家.静立.帧数 <= 4 or (self.执行事件 == "明雷怪" or self.行走开关)
		self:置方向(self.方向)
	end
	self.触发事件 = 玩家.触发事件
	self.触发计次 = 0
	self.显示1 = true
end

function 场景类_玩家:取目标()
	if self.目标格子[1] == nil then
		return
	end
	self.终点 =  xys(floor(self.目标格子[1].x*20),floor(self.目标格子[1].y*20))
end


function 场景类_玩家:更改称谓(内容)
	if  内容.当前称谓 ~= 0 and 内容.当前称谓 ~= nil then
		if self.称谓 ~= nil and self.称谓 ~= "" then
			self.名称偏移.y = self.名称偏移.y + 35
			if self.称谓 ~= nil and self.称谓 ~= "" then
				if self.称谓=="至尊财神" then
					self.至尊财神=nil
				elseif self.称谓=="狂暴之力" then
					self.狂暴之力=nil
				elseif self.称谓=="武林圣者" then
					self.武林圣者=nil
				elseif self.称谓=="超凡入圣" then
					self.超凡入圣=nil
				elseif self.称谓=="洞察先机" then
					self.洞察先机=nil
				elseif self.称谓=="独步青云" then
					self.独步青云=nil
				elseif self.称谓=="风华绝代" then
					self.风华绝代=nil
				elseif self.称谓=="风云再起" then
					self.风云再起=nil
				elseif self.称谓=="盖世无双" then
					self.盖世无双=nil
				elseif self.称谓=="盖世英豪" then
					self.盖世英豪=nil
				elseif self.称谓=="九五之尊" then
					self.九五之尊=nil
				elseif self.称谓=="龙皇" then
					self.龙皇=nil
				elseif self.称谓=="神豪" then
					self.神豪=nil
				elseif self.称谓=="战神" then
					self.战神=nil
				elseif self.称谓=="纵横三界王者风云" then
					self.纵横三界王者风云=nil
				end
			end
		end
		if 内容.当前称谓 ~= "" then
			self.称谓 = 内容.当前称谓
			self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2,-15)
			self.名称偏移.y =  - 35
		elseif 内容.当前称谓 == "" and self.称谓 ~= "" then
			self.名称偏移.y = self.名称偏移.y + 35
			self.称谓 =""
		end
		if self.称谓 ~= nil and self.称谓 ~= "" then
			if self.称谓=="至尊财神" then
				self.至尊财神=tp.资源:载入('wzife.wd5',"网易假人动画",0x01000051)
			elseif self.称谓=="狂暴之力" then
				self.狂暴之力=tp.资源:载入('wzife.wd5',"网易假人动画",0x01000074)
			elseif self.称谓=="武林圣者" then
				self.武林圣者=tp.资源:载入('wzife.wd5',"网易假人动画",0x01000076)
			elseif self.称谓=="超凡入圣" then
				self.超凡入圣=tp.资源:载入('wzife.wd5',"网易假人动画",0x01000087)
			elseif self.称谓=="洞察先机" then
				self.洞察先机=pwd("39")
			elseif self.称谓=="独步青云" then
				self.独步青云=pwd("40")
			elseif self.称谓=="风华绝代" then
				self.风华绝代=pwd("41")
			elseif self.称谓=="风云再起" then
				self.风云再起=pwd("42")
			elseif self.称谓=="盖世无双" then
				self.盖世无双=pwd("43")
			elseif self.称谓=="盖世英豪" then
				self.盖世英豪=pwd("44")
			elseif self.称谓=="九五之尊" then
				self.九五之尊=pwd("45")
			elseif self.称谓=="龙皇" then
				self.龙皇=pwd("46")
			elseif self.称谓=="神豪" then
				self.神豪=pwd("47")
			elseif self.称谓=="战神" then
				self.战神=pwd("48")
			elseif self.称谓=="纵横三界王者风云" then
				self.纵横三界王者风云=pwd("49")
			end
		end
	end
end

function 场景类_玩家:开始移动()
	if self.目标格子[1] == nil then
		self:停止移动()
		return
	end
	self.行为 = "行走"

	local 方向 = 取八方向(jds(self.真实坐标,self.终点),not self.方向开关)
	if jls(self.真实坐标,self.终点) < 4 then -- 小于可移动点直接到达位置
		self.真实坐标 = self.终点
		remove(self.目标格子, 1)
		if #self.目标格子 <= 0 then
			self:停止移动()
		end
		self:取目标()
		return false
	end
	self.真实坐标 = yds(self.真实坐标,self.终点,3)
	self.x,self.y=self.真实坐标.x,self.真实坐标.y
	if self.显示1 then
		self:置方向(方向)
	end
end

function 场景类_玩家:停止移动()
	self.目标格子 = {}
	self.行为 = "静立"
	self.移动 = false
	self.行走开关 = false
end

function 场景类_玩家:更新(dt,x,y)
	if self.行走开关 == true then
		self:取目标()
		self.移动 = true
	end
	if self.显示1 then
		local asa = 1
		if self.行为 == "行走" then
			asa = 1.4
		end
		if self.玩家[self.行为] ~= nil then
			self.玩家[self.行为]:更新(dt*asa)
			if self.玩家["武器_"..self.行为] ~= nil then
				self.玩家["武器_"..self.行为]:更新(dt*asa)
			end
			if self.玩家["身体_"..self.行为] ~= nil then
				self.玩家["身体_"..self.行为]:更新(dt*asa)
			end
		    if self.玩家["坐骑_"..self.行为] ~= nil then
				 self.玩家["坐骑_"..self.行为]:更新(dt*asa)
				if self.玩家["坐骑饰品_"..self.行为] ~= nil then
					self.玩家["坐骑饰品_"..self.行为]:更新(dt*asa)
				end
			end
			if self.玩家["光环_"..self.行为] ~= nil then
				self.玩家["光环_"..self.行为]:更新(dt*asa)
			end
			if self.玩家["足迹_"..self.行为] ~= nil then
				self.玩家["足迹_"..self.行为]:更新(dt*asa)
			end
			if self.玩家[self.行为]:是否选中(x,y) and tp:可操作() and not tp.第一窗口移动中 then
				tp.选中玩家 = true
				if mouse(0) and jls(tp.角色坐标,self.坐标) < 250 and self.执行事件 ~= "摆摊" and not self.开启跟随 and self.特效 == nil then
					if not self.静止转移 then
						-- self:事件开始()
						if tp.窗口.对话栏.可视 then
							self:事件方向(tp.角色坐标,self.坐标)
						end
					end
				end
			end
		end
	--end
	 	for i=1,#self.特效组 do
			if self.特效组[i] ~= nil then
			self.特效组[i]:更新(dt)
			end
     	end
	end
end

function 场景类_玩家:显示(dt,x,y,pys)
	self:更新(dt,x,y,pys)
    self.战斗动画:更新()
    if self.至尊财神 ~= nil then
	    self.至尊财神:更新()
	elseif self.武林圣者 ~= nil  then
		self.武林圣者:更新()
	elseif self.狂暴之力 ~= nil  then
	    self.狂暴之力:更新()
	elseif self.超凡入圣 ~= nil  then
		self.超凡入圣:更新()
	elseif self.洞察先机 ~= nil  then
		self.洞察先机:更新()
	elseif self.独步青云 ~= nil  then
		self.独步青云:更新()
	elseif self.风华绝代 ~= nil then
		self.风华绝代:更新()
	elseif self.风云再起 ~= nil then
		self.风云再起:更新()
	elseif self.盖世无双 ~= nil then
		self.盖世无双:更新()
	elseif self.盖世英豪 ~= nil then
		self.盖世英豪:更新()
	elseif self.九五之尊 ~= nil then
		self.九五之尊:更新()
	elseif self.龙皇 ~= nil then
		self.龙皇:更新()
	elseif self.神豪 ~= nil then
		self.神豪:更新()
	elseif self.战神 ~= nil then
		self.战神:更新()
	elseif self.纵横三界王者风云 ~= nil then
		self.纵横三界王者风云:更新()
	end
	if self.移动 then
		self:开始移动(dt)
	end
	local yx = false
	if self.坐骑 ~= nil and self.坐骑.模型 ~= nil then
		坐骑补差x,坐骑补差y=引擎.补差(self.坐骑.模型,self.模型)
	else
	    坐骑补差x,坐骑补差y=0,0
	end
	if jls(tp.角色坐标,self.真实坐标) < 650 then
		if self.摊位名称~=nil and 玩家摊位显示开关 then
			local 摊位xy=xys(floor(self.x),floor(self.y)) + pys
			local 摊位长度=string.len(self.摊位名称)
			if 摊位长度<=4 then
				小摊位:显示(摊位xy.x+坐骑补差x,摊位xy.y-100+坐骑补差y)
				摊位文字:显示(摊位xy.x-13+(4-摊位长度)*1.8+坐骑补差x,摊位xy.y-114,tostring(self.摊位名称))
				if 小摊位:是否选中(x,y) and 引擎.鼠标弹起(右键) then
					发送数据(3725,{id=self.玩家ID})
				end
			elseif 摊位长度<=4 then
				中摊位:显示(摊位xy.x+坐骑补差x,摊位xy.y-100+坐骑补差y)
				摊位文字:显示(摊位xy.x-25+(8-摊位长度)*1.8+坐骑补差x,摊位xy.y-114+坐骑补差y,tostring(self.摊位名称))
				if 中摊位:是否选中(x,y) and 引擎.鼠标弹起(右键) then
					发送数据(3725,{id=self.玩家ID})
				end
			else
				大摊位:显示(摊位xy.x+坐骑补差x,摊位xy.y-100+坐骑补差y)
				摊位文字:显示(摊位xy.x-40+(12-摊位长度)*1.8+坐骑补差x,摊位xy.y-114+坐骑补差y,tostring(self.摊位名称))
				if 大摊位:是否选中(x,y) and 引擎.鼠标弹起(右键) then
					发送数据(3725,{id=self.玩家ID})
				end
			end
		end
		if tp.窗口.对话栏.可视 == false and self.方向 ~= self.记忆方向 and (self.执行事件 ~= "明雷怪" and not self.行走开关) then
			self:置方向(self.方向)
		end
		local s = xys(floor(self.真实坐标.x),floor(self.真实坐标.y))
		tp.影子:显示(s + pys)
		if 玩家显示开关 then
			if self.玩家["光环_"..self.行为] ~= nil and tp.场景.人物.光环特效 then
				self.玩家["光环_"..self.行为]:显示(s + pys)
				光环补差x,光环补差y=引擎.补差(self.锦衣[3],self.模型)
			end
			if self.玩家["足迹_"..self.行为] ~= nil and tp.场景.人物.足迹特效 then
				self.玩家["足迹_"..self.行为]:显示(s + pys)
			end
			if self.玩家["坐骑_"..self.行为] ~= nil then
				self.玩家["坐骑_"..self.行为]:显示(s + pys)
				if self.玩家["坐骑饰品_"..self.行为] ~= nil then
					self.玩家["坐骑饰品_"..self.行为]:显示(s + pys)
				end
			end
			if self.玩家["身体_"..self.行为] ~= nil then
				self.玩家["身体_"..self.行为]:显示(s.x + pys.x  + 光环补差x + 坐骑补差x,s.y + pys.y +光环补差y+坐骑补差y)
			end
			if self.玩家[self.行为] ~= nil then
				self.玩家[self.行为]:显示(s.x + pys.x + 光环补差x + 坐骑补差x,s.y + pys.y  +光环补差y+坐骑补差y)
			end
			if self.玩家["武器_"..self.行为] ~= nil then
				self.玩家["武器_"..self.行为]:显示(s.x + pys.x + 光环补差x + 坐骑补差x,s.y + pys.y  +光环补差y+坐骑补差y)
			end
			if (self.玩家[self.行为]:是否选中(x,y) or (self.玩家["武器_"..self.行为]~=nil and self.玩家["武器_"..self.行为]:是否选中(x,y)) or yx)  and (tp.鼠标.取当前() == "组队" or tp.鼠标.取当前()=="给予" or tp.鼠标.取当前()=="交易" or tp.鼠标.取当前()=="平时攻击") then
				self.移动 = false
				if mouse(0) and tp.鼠标.取当前() == "组队" then
					if self.队长开关 then
						人物点击=true
						发送数据(4002,{id=self.玩家ID})
						tp.鼠标.还原鼠标()
					else
						tp.提示:写入("#Y/先看下他是不是队长吧")
					end
				elseif mouse(0) and tp.鼠标.取当前()=="给予" then
					人物点击=true
					发送数据(3716,{id=self.玩家ID})
					tp.鼠标.还原鼠标()
				elseif mouse(0) and tp.鼠标.取当前()=="平时攻击" then
					人物点击=true
					tp.鼠标.还原鼠标()
					发送数据(33,{序列=self.玩家ID})
				elseif mouse(0) and tp.鼠标.取当前()=="交易" then
					人物点击=true
					发送数据(3718,{id=self.玩家ID})
					tp.鼠标.还原鼠标()
				end
			end
			if self.玩家[self.行为]:是否选中(x,y) and tp:可操作() and not tp.第一窗口移动中 then
				self.玩家[self.行为]:置高亮()
				if self.玩家["光环_"..self.行为] ~= nil then
					self.玩家["光环_"..self.行为]:置高亮()
				end
				if self.玩家["足迹_"..self.行为] ~= nil then
					self.玩家["足迹_"..self.行为]:置高亮()
				end
				if self.玩家["武器_"..self.行为] ~= nil then
					self.玩家["武器_"..self.行为]:置高亮()
				end
				if self.玩家["坐骑_"..self.行为] ~= nil then
					self.玩家["坐骑_"..self.行为]:置高亮()
				end
				if 引擎.鼠标弹起(右键) then
				    if tp.窗口.人物界面.可视 and tp.窗口.人物界面.玩家id == self.玩家ID then
                        tp.窗口.人物界面:打开()
				    else
				        tp.窗口.人物界面:打开({self.名称,self.玩家ID,self.门派,self.模型})
				    end
				end
				local 名称颜色 =  0xFF00FF00
	            local 称谓颜色 =  0xFFFF0000
			else
				self.玩家[self.行为]:取消高亮()
				if self.玩家["光环_"..self.行为] ~= nil then
					self.玩家["光环_"..self.行为]:取消高亮()
				end
				if self.玩家["足迹_"..self.行为] ~= nil then
					self.玩家["足迹_"..self.行为]:取消高亮()
				end
				if self.玩家["武器_"..self.行为] ~= nil then
					self.玩家["武器_"..self.行为]:取消高亮()
				end

				if self.玩家["坐骑_"..self.行为] ~= nil then
					self.玩家["坐骑_"..self.行为]:取消高亮()
				end
			end
		end

		local 名称颜色 =  0xFF00FF00
	local 称谓颜色 =  0xFFFF0000
		if self.强p开关 ~= nil or self.名称 == "游戏管理员" then
			名称颜色 = 红色
		elseif self.pk开关 ~= nil then
			名称颜色 = 黄色
		end
		if self.称谓=="后起之秀"  or self.称谓=="三界菁英"  or self.称谓=="武林高手"  or self.称谓=="独孤求败"  or self.称谓=="九天罗刹"  or self.称谓=="皓月战神" or self.称谓=="梦幻元勋" or self.称谓=="叱咤三界" or self.称谓=="笑傲西游" or self.称谓=="唯吾独尊" then
			称谓颜色 = 0XFFce24ed
		elseif self.称谓 ~= nil and self.称谓 ~= "" and (string.match(self.称谓,"娘子") or string.match(self.称谓,"夫君")) then
			称谓颜色 = 0XFF000000
		elseif self.称谓=="富可敌国" or self.称谓=="降龙伏虎" or  self.称谓=="只手遮天" or  self.称谓=="幕神梦幻" then
			称谓颜色 = 黄色
		elseif self.称谓=="江湖豪侠" or self.称谓=="绝世豪侠" or self.称谓=="窈窕淑女" or self.称谓=="威震四方" then
			称谓颜色 = 0xFFFF68E1
		end
		if self.称谓 == nil or self.称谓 == "" then
			rwzt:置颜色(名称颜色)
			rwzt:显示x(s + pys - self.名称偏移,self.名称)
			rwzt:置阴影颜色(-1275068416)
		else
			rwzt:置颜色(称谓颜色)
			if  tp.场景.人物.称谓特效 then
			if self.称谓=="至尊财神" and self.至尊财神 ~= nil then
				self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2+65,20)
				self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-50)
			    self.至尊财神:显示(s+pys-self.称谓偏移)
			elseif self.称谓=="狂暴之力" and self.狂暴之力 ~= nil then
				self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2+115,20)
				self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-35)
			    self.狂暴之力:显示(s+pys-self.称谓偏移)
			elseif self.称谓=="武林圣者" and self.武林圣者 ~= nil then
				self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2+65,20)
				self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-35)
			    self.武林圣者:显示(s+pys-self.称谓偏移)
			elseif self.称谓=="超凡入圣" and self.超凡入圣 ~= nil then
				self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2+52,0)
				self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-35)
			    self.超凡入圣:显示(s+pys-self.称谓偏移)
			elseif self.称谓=="洞察先机" and self.洞察先机 ~= nil then
				self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2-30,-50)
				self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-55)
			    self.洞察先机:显示(s+pys-self.称谓偏移)
			elseif self.称谓=="独步青云" and self.独步青云 ~= nil then
				self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2-30,-50)
				self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-55)
			    self.独步青云:显示(s+pys-self.称谓偏移)
			elseif self.称谓=="风华绝代" and self.风华绝代 ~= nil then
				self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2-30,-40)
				self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-55)
			    self.风华绝代:显示(s+pys-self.称谓偏移)
			elseif self.称谓=="风云再起" and self.风云再起 ~= nil then
				self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2-30,-40)
				self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-45)
			    self.风云再起:显示(s+pys-self.称谓偏移)
			elseif self.称谓=="盖世无双" and self.盖世无双 ~= nil then
				self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2-30,-50)
				self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-55)
			    self.盖世无双:显示(s+pys-self.称谓偏移)
			elseif self.称谓=="盖世英豪" and self.盖世英豪 ~= nil then
				self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2-30,-70)
				self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-5)
			    self.盖世英豪:显示(s+pys-self.称谓偏移)
			elseif self.称谓=="九五之尊" and self.九五之尊 ~= nil then
				self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2-30,-80)
				self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-95)
			    self.九五之尊:显示(s+pys-self.称谓偏移)
			elseif self.称谓=="龙皇" and self.龙皇 ~= nil then
				self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2-20,-55)
				self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-60)
			    self.龙皇:显示(s+pys-self.称谓偏移)
			elseif self.称谓=="神豪" and self.神豪 ~= nil then
				self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2-20,-60)
				self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-65)
			    self.神豪:显示(s+pys-self.称谓偏移)
			elseif self.称谓=="战神" and self.战神 ~= nil then
				self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2-20,-55)
				self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-60)
			    self.战神:显示(s+pys-self.称谓偏移)
			elseif self.称谓=="纵横三界王者风云" and self.纵横三界王者风云 ~= nil then
				self.称谓偏移 = xys(tp.字体表.人物字体:取宽度(self.称谓) / 2-75,-70)
				self.名称偏移 = xys(tp.字体表.人物字体:取宽度(self.名称) / 2,-75)
			    self.纵横三界王者风云:显示(s+pys-self.称谓偏移)
			else
				rwzt:显示x(s + pys - self.称谓偏移,self.称谓)
			end
			rwzt:置阴影颜色(-1275068416)
			rwzt:置颜色(名称颜色)
			rwzt:显示x(s + pys - self.名称偏移,self.名称)
			rwzt:置阴影颜色(-1275068416)
		end
         end
		if self.特效 ~= nil then
			self.特效:更新(dt*self.帧率)
			if (self.特效.已载入 >= self.特效.结束帧) then
				self.特效 = nil
				return false
			end
			self.特效:显示(s + pys)
		end
		for i=1,#self.特效组 do
			if self.特效组[i] ~= nil then
				self.特效组[i]:显示(xys(floor(self.x),floor(self.y)) + pys)
				if (self.特效组[i].已载入 >= self.特效组[i].帧数-2) then
					self.特效组[i] = nil
					remove(self.特效组,i)
				end
			end
		end
		self.坐标.x = s.x
		self.坐标.y = s.y
		if self.队长开关 then
			self.组队标志:更新(dt)
			local Qs = 生成XY(floor(self.真实坐标.x),floor(self.真实坐标.y-100))
			if self.玩家["坐骑_"..self.行为]  ~= nil then
				Qs = 生成XY(floor(self.真实坐标.x),floor(self.真实坐标.y-130))
			else
				Qs = 生成XY(floor(self.真实坐标.x),floor(self.真实坐标.y-100))
			end
			self.组队标志:显示(Qs.x + pys.x +  坐骑补差x/2,Qs.y + pys.y  + 坐骑补差y/2)
		end
		self.显示1 = true
		if self.战斗开关 then
			self.显示坐标=xys(floor(self.x),floor(self.y)) + pys
			if self.玩家["坐骑_"..self.行为]  ~= nil then
				self.战斗动画:显示(self.显示坐标.x,self.显示坐标.y-130)
			else
				self.战斗动画:显示(self.显示坐标.x,self.显示坐标.y-100)
			end
		end
		self.喊话:显示()
	else
	    self.显示1 = false
	end
end

function 场景类_玩家:置方向(d)
	if 玩家显示开关 and 玩家加载开关 then
		if self.变身 ~= nil and 变身显示 then
			d= 取四至八方向(d)
		end
		self.玩家["静立"]:置方向(d)
		self.玩家["行走"]:置方向(d)
		if self.玩家["武器_静立"] ~= nil and self.玩家["武器_行走"] ~= nil then
			self.玩家["武器_静立"]:置方向(d)
			self.玩家["武器_行走"]:置方向(d)
		elseif self.玩家["坐骑_静立"] ~= nil then
			self.玩家["坐骑_静立"]:置方向(d)
			self.玩家["坐骑_行走"]:置方向(d)
			if self.玩家["坐骑饰品_静立"] ~= nil then
				self.玩家["坐骑饰品_静立"]:置方向(d)
				self.玩家["坐骑饰品_行走"]:置方向(d)
			end
		end
		if self.玩家["身体_静立"] ~= nil and self.玩家["身体_行走"] ~= nil then
			self.玩家["身体_静立"]:置方向(d)
			self.玩家["身体_行走"]:置方向(d)
		end
		if self.玩家["翅膀_静立"] ~= nil then
			self.玩家["翅膀_静立"]:置方向(d)
			self.玩家["翅膀_行走"]:置方向(d)
		end
		if self.玩家["足迹_行走"] ~= nil then
			self.玩家["足迹_行走"]:置方向(d)
		end
		self.方向 = d
	end
end

function 场景类_玩家:更改染色(数据)
	if 玩家显示开关 and 玩家加载开关 then
		self.玩家["静立"]:置染色(数据.染色方案,数据.染色组[1],数据.染色组[2],数据.染色组[3],0)
		self.玩家["行走"]:置染色(数据.染色方案,数据.染色组[1],数据.染色组[2],数据.染色组[3],0)
	end
end
function 场景类_玩家:炫彩染色(染色方案,sj,类型)
	if 类型 == "人物" then
		self.玩家["静立"]:炫彩染色(染色方案,sj)
		if self.玩家.行走 ~= nil then
			self.玩家.行走:炫彩染色(染色方案,sj)
		end
		self:置方向(self.方向)
	end

end
function 场景类_玩家:设置动画(类型)
	insert(self.特效组,tp:载入特效(类型))
end

function 场景类_玩家:设置路径(数据)
    self.移动距离=数据.距离
	local a = xys(floor(self.x / 20),floor(self.y / 20))
    self.目标格子 = tp.场景.地图.寻路:寻路(a,数据)
	if self.目标格子 ~= nil and self.目标格子[1] ~= nil then
		self:取目标(self.目标格子[1],数据.id)
		self.移动=true
	else
		self.目标格子 = {}
	end
end

function 场景类_玩家:设置坐标(内容)
	self.x,self.y=内容.x,内容.y
	self:停止移动()
end

function 场景类_玩家:坐骑改变()
	if (self.变身 ~= nil and 变身显示) or (not 玩家显示开关 and not 玩家加载开关) then return  end
	local 模型=self.模型
	local 坐骑=self.坐骑.模型
	local 饰品=self.坐骑.饰品
	local 资源组 = {}
	local 站立坐骑 = 0
	if 坐骑 == nil then
		return
	end
	if tszq(模型,坐骑,"奔跑") ~= "" then
		资源组 = {}
		资源组.人物资源 = "xzsc.wdf" or "wpal/121.wpal"
		资源组.人物站立 = tszq(模型,坐骑,"站立")
		资源组.人物行走 = tszq(模型,坐骑,"奔跑")
		资源组.坐骑资源 = "xzsc.wdf" or "wpal/121.wpal"
		资源组.坐骑行走 = tszq(模型,坐骑,"奔跑")
		资源组.坐骑站立 = tszq(模型,坐骑,"站立")
	elseif 引擎.取站立坐骑(坐骑) ~= nil then
		站立坐骑 = 1
		资源组.坐骑资源 = "xzsc.wdf" or "wpal/121.wpal"
		资源组.坐骑行走 = 引擎.取站立坐骑(坐骑)[1]
		资源组.坐骑站立 = 引擎.取站立坐骑(坐骑)[2]
	else
		资源组 = 引擎.坐骑库(模型,坐骑,饰品 or "空")
	end
	if 资源组==nil then
	   return
	end
	if 站立坐骑 == 0 then
		self.玩家 = {["静立"] = tp.资源:载入(资源组.人物资源,"网易WDF动画",资源组.人物站立),["行走"] = tp.资源:载入(资源组.人物资源,"网易WDF动画",资源组.人物行走)}
	else
		self:置站立模型()
	end
	self.坐骑 = self.坐骑
	self.玩家["坐骑_静立"] = tp.资源:载入(资源组.坐骑资源,"网易WDF动画",资源组.坐骑站立)
	self.玩家["坐骑_行走"] = tp.资源:载入(资源组.坐骑资源,"网易WDF动画",资源组.坐骑行走)
	if self.坐骑.染色方案~=nil and self.坐骑.染色组~=0 and #self.坐骑.染色组~=0 then
		self.玩家["坐骑_静立"]:置染色(self.坐骑.染色方案,self.坐骑.染色组[1],self.坐骑.染色组[2],self.坐骑.染色组[3])
		self.玩家["坐骑_行走"]:置染色(self.坐骑.染色方案,self.坐骑.染色组[1],self.坐骑.染色组[2],self.坐骑.染色组[3])
	end
	if 资源组.坐骑饰品站立 ~= nil then
		self.玩家["坐骑饰品_静立"] = tp.资源:载入(资源组.坐骑饰品资源,"网易WDF动画",资源组.坐骑饰品站立)
		self.玩家["坐骑饰品_行走"] = tp.资源:载入(资源组.坐骑饰品资源,"网易WDF动画",资源组.坐骑饰品行走)
		if self.坐骑.饰品物件~=nil and self.坐骑.饰品物件.染色方案~=nil and #self.坐骑.饰品物件.染色组~=0 then
			self.玩家["坐骑饰品_静立"]:置染色(self.坐骑.饰品物件.染色方案,self.坐骑.饰品物件.染色组[1],self.坐骑.饰品物件.染色组[2],self.坐骑.饰品物件.染色组[3])
			self.玩家["坐骑饰品_行走"]:置染色(self.坐骑.饰品物件.染色方案,self.坐骑.饰品物件.染色组[1],self.坐骑.饰品物件.染色组[2],self.坐骑.饰品物件.染色组[3])
		end
	end
	if 站立坐骑 == 0 then
		self.玩家["武器_静立"] = nil
		self.玩家["武器_行走"] = nil
		self.玩家["身体_静立"] = nil
		self.玩家["身体_行走"] = nil
	end
	if self.染色方案~=nil and self.锦衣[1] == nil  and #self.染色组~=0 and 坐骑 ~= "独角兽" and 坐骑 ~= "独角兽1"and 坐骑 ~= "飞天龙马"  and 坐骑 ~= "霜雪龙宝" and 坐骑 ~= "冰晶雪魄" and 坐骑 ~= "冰晶魅灵" and 坐骑 ~= "青梅竹马"  and 坐骑 ~= "深海狂鲨"  and 坐骑 ~= "独角马"  and 坐骑 ~= "海豚恋人" and 坐骑~="冰晶魅灵" and 坐骑~="炫影天马" and 坐骑~="玲珑雪狐" and 坐骑~="玲珑雪狐女" and 坐骑~="烈焰雄狮" and 坐骑~="九尾神狐1" then
     	self:置染色(self.染色方案,self.染色组[1],self.染色组[2],self.染色组[3],0)
    end
	self:置方向(self.方向)
	if self.锦衣~= nil and self.锦衣[3] ~= nil then
		self:穿戴光环(self.锦衣[3])
	elseif self.锦衣 == nil or self.锦衣[3] == nil then
		self.玩家["光环_静立"] = nil
		self.玩家["光环_行走"] = nil
	end
	if self.锦衣~= nil and self.锦衣[4] ~= nil then
		self:穿戴足迹(self.锦衣[4])
	elseif self.锦衣 == nil or self.锦衣[4] == nil then
		self.玩家["足迹_行走"] = nil
	end
end

function 场景类_玩家:置站立模型()
	local 资源 = qmxs(self.模型)
	if self.武器 ~= nil then
		self:穿戴装备(self.武器,1)
	else
		if self.锦衣 ~= nil and self.锦衣[1] ~= nil and self.锦衣[1].名称 ~= nil and (self.变身 == nil or 变身显示 == false) then
			if self.锦衣[1].名称 == "夜影" or self.锦衣[1].名称 == "夏日清凉" or self.锦衣[1].名称 == "华风汉雅" or self.锦衣[1].名称 == "萌萌小厨" then
				临时资源 = qzdjy(self.模型.."_静立_"..self.锦衣[1].名称)
				临时资源包 = "shape0.npk"
				if self.锦衣[1].名称 == "华风汉雅" or self.锦衣[1].名称 == "萌萌小厨" then
					临时资源包 = "shape2.npk"
				end
				self.玩家 = {["静立"] = tp.资源:载入(临时资源包,"网易锦衣动画",临时资源),["行走"] = tp.资源:载入(临时资源包,"网易锦衣动画",临时资源)}
				if self.锦衣[1].名称 == "夏日清凉" or self.锦衣[1].名称 == "华风汉雅" or self.锦衣[1].名称 == "萌萌小厨" then
					临时资源 = qzdjys(self.模型.."_静立_"..self.锦衣[1].名称.."_头")
					self.玩家["身体_静立"] = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源)
					self.玩家["身体_行走"] = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源)
				else
					self.玩家["身体_静立"] = nil
					self.玩家["身体_行走"] = nil
				end
			else
				资源 = qmxs(self.锦衣[1].名称.."_"..self.模型)
				self.玩家 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1])}
			end
		else
			self.玩家 = {
				["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),
			}
			self.玩家.行走 = tp.资源:载入(资源[3],"网易WDF动画",资源[1])
		end
	end

	if self.锦衣 ~= nil and self.锦衣[3] ~= nil then
		self:穿戴光环(self.锦衣[3])
	end
	if self.锦衣 ~= nil and self.锦衣[4] ~= nil then
		self:穿戴足迹(self.锦衣[4])
	end
	if self.变身~=nil and 变身显示 then
	    资源=qmxs(self.变身)
	    self.玩家 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1])}
		if self.变异 and 染色信息[self.变身]~=nil then
		    self.染色方案2 = 染色信息[self.变身].id
			self.染色组2 = 染色信息[self.变身].方案
	    	self:置染色(self.染色方案2,self.染色组2[1],self.染色组2[2],self.染色组2[3])
			self:置方向(self.方向)
		end
	end
	if self.染色方案 ~= nil and self.染色组 ~= nil and self.锦衣[1] == nil and (self.变身==nil or 变身显示 == false) then
		if next(self.染色组) ~= nil then
			self.染色方案 = self.染色方案
			self.染色组 = self.染色组
			self:置染色(self.染色方案,self.染色组[1],self.染色组[2],self.染色组[3])
		end
	end
end

function 场景类_玩家:卸下坐骑(id)
	if (self.变身 ~= nil and 变身显示) or (not 玩家显示开关 and not 玩家加载开关) then return  end
	self.玩家["坐骑_静立"] = nil
	self.玩家["坐骑_行走"] = nil
	self.玩家["坐骑饰品_静立"] = nil
	self.玩家["坐骑饰品_行走"] = nil
	self.坐骑 = nil
	if self.染色方案~=nil and #self.染色组~=0 and (self.锦衣 == nil or self.锦衣[1] == nil)  then
     	self:置染色(self.染色方案,self.染色组[1],self.染色组[2],self.染色组[3],0)
    end
    self:置方向(self.方向,id)
	if self.武器 ~= nil then
		self:穿戴装备(self.武器)
	else
		self.玩家["武器_静立"] = nil
	    self.玩家["武器_行走"] = nil
		self:刷新动画()
	end
	self.坐骑 = nil
	if self.锦衣~= nil and self.锦衣[3] ~= nil then
		self:穿戴光环(self.锦衣[3])
	elseif self.锦衣 == nil or self.锦衣[3] == nil then
		self.玩家["光环_静立"] = nil
		self.玩家["光环_行走"] = nil
	end
	if self.锦衣~= nil and self.锦衣[4] ~= nil then
		self:穿戴足迹(self.锦衣[4])
	elseif self.锦衣 == nil or self.锦衣[4] == nil then
		self.玩家["足迹_行走"] = nil
	end
end
function 场景类_玩家:穿戴锦衣(锦衣)
	if not 玩家显示开关 and not 玩家加载开关 then
		return
	end
	if 锦衣 == nil then
		self.锦衣 = nil
	else
		self.锦衣 = 锦衣
	end
	if self.坐骑 ~= nil and 引擎.取站立坐骑(self.坐骑.模型) ~= nil then
		self:坐骑改变()
	elseif self.坐骑 == nil and self.武器 == nil then
		self:刷新动画()
	elseif self.坐骑 == nil and self.武器 ~= nil then
		self:穿戴装备(self.武器)
	end
	if self.锦衣~= nil and self.锦衣[3] ~= nil then
		self:穿戴光环(self.锦衣[3])
	elseif self.锦衣 == nil or self.锦衣[3] == nil then
		self.玩家["光环_静立"] = nil
		self.玩家["光环_行走"] = nil
	end
end
function 场景类_玩家:刷新动画()
	if 玩家显示开关 and 玩家加载开关 then
		local 资源 = qmxs(self.模型)
		if self.锦衣 ~= nil and self.锦衣[1] ~= nil and self.锦衣[1].名称 ~= nil and (self.变身 == nil or 变身显示 == false) then
			if self.锦衣[1].名称 == "夜影" or self.锦衣[1].名称 == "夏日清凉" or self.锦衣[1].名称 == "华风汉雅" or self.锦衣[1].名称 == "萌萌小厨" then
				临时资源 = qzdjy(self.模型.."_静立_"..self.锦衣[1].名称)
				临时资源1 = qzdjy(self.模型.."_行走_"..self.锦衣[1].名称)
				临时资源包 = "shape0.npk"
				if self.锦衣[1].名称 == "华风汉雅" or self.锦衣[1].名称 == "萌萌小厨" then
					临时资源包 = "shape2.npk"
				end
				self.玩家 = {["静立"] = tp.资源:载入(临时资源包,"网易锦衣动画",临时资源),["行走"] = tp.资源:载入(临时资源包,"网易锦衣动画",临时资源1)}
				if self.锦衣[1].名称 == "夏日清凉" or self.锦衣[1].名称 == "华风汉雅" or self.锦衣[1].名称 == "萌萌小厨" then
					临时资源 = qzdjys(self.模型.."_静立_"..self.锦衣[1].名称.."_头")
					临时资源1 = qzdjys(self.模型.."_行走_"..self.锦衣[1].名称.."_头")
					self.玩家["身体_静立"] = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源)
					self.玩家["身体_行走"] = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源1)
				else
					self.玩家["身体_静立"] = nil
					self.玩家["身体_行走"] = nil
				end
			else
				资源 = qmxs(self.锦衣[1].名称.."_"..self.模型)
				self.玩家 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])}
			end ---------
		else
			if self.变身 ~= nil and 变身显示 then
			    资源 = qmxs(self.变身)
			    if 资源 == nil then
			    	资源 = qmxs(self.模型)
			    end
			end
			self.玩家 = {
				["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),
			}
			self.玩家.行走 = tp.资源:载入(资源[3],"网易WDF动画",资源[2])
			if self.变异 and 染色信息[self.变身]~=nil then
			    self.染色方案2 = 染色信息[self.变身].id
				self.染色组2 = 染色信息[self.变身].方案
		    	self:置染色(self.染色方案2,self.染色组2[1],self.染色组2[2],self.染色组2[3])
				self:置方向(self.方向)
			end
		end
		if self.锦衣~= nil and self.锦衣[3] ~= nil then
		   self:穿戴光环(self.锦衣[3])
		elseif self.锦衣 == nil or self.锦衣[3] == nil then
			self.玩家["光环_静立"] = nil
			self.玩家["光环_行走"] = nil
		end
		if self.锦衣~= nil and self.锦衣[4] ~= nil then
		   self:穿戴足迹(self.锦衣[4])
		elseif self.锦衣 == nil or self.锦衣[4] == nil then
			self.玩家["足迹_行走"] = nil
		end
	else
		self.玩家 = {
				["静立"] = nil,
			}
		self.玩家.行走 = nil
	end
end

function 场景类_玩家:重新加载动画()

	local 资源 = qmxs(self.模型)
	if self.武器 ~= nil then
		self:穿戴装备(self.武器)
	else
		资源 = qmxs(self.模型)
		if self.锦衣 ~= nil and self.锦衣[1] ~= nil and self.锦衣[1].名称 ~= nil and (self.变身 == nil or 变身显示 == false) then
			if self.锦衣[1].名称 == "夜影" or self.锦衣[1].名称 == "夏日清凉" or self.锦衣[1].名称 == "华风汉雅" or self.锦衣[1].名称 == "萌萌小厨" then
				临时资源 = qzdjy(self.模型.."_静立_"..self.锦衣[1].名称)
				临时资源1 = qzdjy(self.模型.."_行走_"..self.锦衣[1].名称)
				临时资源包 = "shape0.npk"
				if self.锦衣[1].名称 == "华风汉雅" or self.锦衣[1].名称 == "萌萌小厨" then
					临时资源包 = "shape2.npk"
				end
				self.玩家 = {["静立"] = tp.资源:载入(临时资源包,"网易锦衣动画",临时资源),["行走"] = tp.资源:载入(临时资源包,"网易锦衣动画",临时资源1)}
				if self.锦衣[1].名称 == "夏日清凉" or self.锦衣[1].名称 == "华风汉雅" or self.锦衣[1].名称 == "萌萌小厨" then
					临时资源 = qzdjys(self.模型.."_静立_"..self.锦衣[1].名称.."_头")
					临时资源1 = qzdjys(self.模型.."_行走_"..self.锦衣[1].名称.."_头")
					self.玩家["身体_静立"] = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源)
					self.玩家["身体_行走"] = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源1)
				else
					self.玩家["身体_静立"] = nil
					self.玩家["身体_行走"] = nil
				end
			else
				资源 = qmxs(self.锦衣[1].名称.."_"..self.模型)
				self.玩家 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])}
			end
		else
			self.玩家 = {
				["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),
			}
			self.玩家.行走 = tp.资源:载入(资源[3],"网易WDF动画",资源[2])
		end
	end
	if self.坐骑 == nil or self.坐骑.模型 == nil then
		self.坐骑 = nil
	end
	if self.坐骑~=nil then
		self:坐骑改变()
	end
	if self.锦衣 ~= nil and self.锦衣[3] ~= nil then
		self:穿戴光环(self.锦衣[3])
	end
	if self.锦衣 ~= nil and self.锦衣[4] ~= nil then
		self:穿戴足迹(self.锦衣[4])
	end
	if self.变身~=nil and 变身显示 then
	    资源=qmxs(self.变身)
	    self.玩家 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])}
		if self.变异 and 染色信息[self.变身]~=nil then
		    self.染色方案2 = 染色信息[self.变身].id
			self.染色组2 = 染色信息[self.变身].方案
	    	self:置染色(self.染色方案2,self.染色组2[1],self.染色组2[2],self.染色组2[3])
			self:置方向(self.方向)
		end
	end
	if self.染色方案 ~= nil and self.染色组 ~= nil and self.锦衣[1] == nil and (self.变身==nil or 变身显示 == false) then
		if next(self.染色组) ~= nil then
			self.染色方案 = self.染色方案
			self.染色组 = self.染色组
			self:置染色(self.染色方案,self.染色组[1],self.染色组[2],self.染色组[3])
		end
	end

end

function 场景类_玩家:穿戴装备(武器,数字)
	if not 玩家显示开关 and not 玩家加载开关 then
		return
	end
	if 数字 == nil and ((self.变身 ~= nil and 变身显示 ) or 武器==nil) then
		self.玩家["武器_静立"] = nil
	    self.玩家["武器_行走"] = nil
	    self.武器=nil
	    if self.坐骑 ~= nil and 引擎.取站立坐骑(self.坐骑.模型) ~= nil then
	    	self:坐骑改变()
			return
		else
		    self:刷新动画()
		    return
		end
	end
	if self.坐骑 ~= nil and 引擎.取站立坐骑(self.坐骑.模型) ~= nil and 数字 == nil then
		self.武器 = 武器
    	self:坐骑改变()
		return
	end
	if self.玩家 ~= nil and self.玩家["坐骑_静立"] ~= nil and 数字 == nil then
		return false
	end
	self.武器 = 武器
	local v = tp:取武器子类(武器.子类)
	if 武器.名称 == "龙鸣寒水" or 武器.名称 == "非攻" then
		v = "弓弩1"
	end
	local 资源 = qmxs(self.模型,v)
	if self.锦衣 ~= nil and self.锦衣[1] ~= nil and self.锦衣[1].名称 ~= nil and (self.变身==nil or 变身显示 == false) then
		if self.锦衣[1].名称 == "夜影" or self.锦衣[1].名称 == "夏日清凉" or self.锦衣[1].名称 == "华风汉雅" or self.锦衣[1].名称 == "萌萌小厨" then
			临时资源 = qzdjy(self.模型..v.."_静立_"..self.锦衣[1].名称)
			临时资源1 = qzdjy(self.模型..v.."_行走_"..self.锦衣[1].名称)
			临时资源包 = "shape0.npk"
			if self.锦衣[1].名称 == "华风汉雅" or self.锦衣[1].名称 == "萌萌小厨" then
				临时资源包 = "shape2.npk"
			end
			if 数字 == nil then
				self.玩家 = {["静立"] = tp.资源:载入(临时资源包,"网易锦衣动画",临时资源),["行走"] = tp.资源:载入(临时资源包,"网易锦衣动画",临时资源1)}
			else
				self.玩家 = {["静立"] = tp.资源:载入(临时资源包,"网易锦衣动画",临时资源),["行走"] = tp.资源:载入(临时资源包,"网易锦衣动画",临时资源)}
			end
			if self.锦衣[1].名称 == "夏日清凉" or self.锦衣[1].名称 == "华风汉雅" or self.锦衣[1].名称 == "萌萌小厨" then
				临时资源 = qzdjys(self.模型..v.."_静立_"..self.锦衣[1].名称.."_头")
				临时资源1 = qzdjys(self.模型..v.."_行走_"..self.锦衣[1].名称.."_头")
				if 数字 == nil then
					self.玩家["身体_静立"] = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源)
					self.玩家["身体_行走"] = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源1)
				else
					self.玩家["身体_静立"] = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源)
					self.玩家["身体_行走"] = tp.资源:载入("shape0.npk","网易锦衣动画",临时资源)
				end
			else
				self.玩家["身体_静立"] = nil
				self.玩家["身体_行走"] = nil
			end
		else
			资源 = qmxs(self.锦衣[1].名称.."_"..self.模型)
			if 数字 == nil then
				self.玩家 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[2])}
			else
			    self.玩家 = {["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1])}
			end
		end
	else
		if 数字 == nil then
			self.玩家 = {
			["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"]=tp.资源:载入(资源[3],"网易WDF动画",资源[2])
		}
		else
		    self.玩家 = {
			["静立"] = tp.资源:载入(资源[3],"网易WDF动画",资源[1]),["行走"]=tp.资源:载入(资源[3],"网易WDF动画",资源[1])
		}
		end
	end

	local m = tp:取武器附加名称(武器.子类,武器.级别限制,武器.名称)
	local n = qmxs(m.."_"..self.模型)
	self.玩家["武器_静立"] = tp.资源:载入(n[3],"网易WDF动画",n[1])
	if 数字 == nil then
		self.玩家["武器_行走"] = tp.资源:载入(n[3],"网易WDF动画",n[2])
	else
	    self.玩家["武器_行走"] = tp.资源:载入(n[3],"网易WDF动画",n[1])
	end
	-- self.玩家["武器_静立"]:置差异(self.玩家["武器_静立"].帧数-self.玩家["静立"].帧数)
	-- self.玩家["武器_行走"]:置差异(self.玩家["武器_行走"].帧数-self.玩家["行走"].帧数)
	if self.染色方案~=nil and #self.染色组~=0 and (self.锦衣 == nil or self.锦衣[1] == nil) and (self.变身==nil or 变身显示 == false) then
     	self:置染色(self.染色方案,self.染色组[1],self.染色组[2],self.染色组[3],0)
    end
    if self.武器.染色方案~=0 and self.武器.染色组~=0 and self.武器.染色组~=nil and #self.武器.染色组>0 then
	    self.玩家["武器_静立"]:置染色(self.武器.染色方案,self.武器.染色组[1],self.武器.染色组[2],self.武器.染色组[3])
	    self.玩家["武器_行走"]:置染色(self.武器.染色方案,self.武器.染色组[1],self.武器.染色组[2],self.武器.染色组[3])
	end
	self:置方向(self.方向,id)
	self.静止转移 = self.玩家.静立.帧数 <= 4 or (self.执行事件 == "明雷怪" or self.行走开关)

end

function 场景类_玩家:穿戴光环(锦衣)
	if not 玩家显示开关 and not 玩家加载开关 then
		return
	end
	if self.变身 ~= nil and 变身显示 then
		-- tp.提示:写入("#Y/当前正处于变身状态中，无法取消")
		return false
	end
	local n = 引擎.取光环(锦衣.名称)
	self.玩家["光环_静立"]=tp.资源:载入(n[4],"网易假人动画",n[1])
    self.玩家["光环_行走"]=tp.资源:载入(n[4],"网易假人动画",n[2])
    self:置方向(self.方向)
end

function 场景类_玩家:卸下光环()
	self.玩家["光环_静立"] = nil
	self.玩家["光环_行走"] = nil
end

function 场景类_玩家:穿戴足迹(锦衣)
	if not 玩家显示开关 and not 玩家加载开关 then
		return
	end
	if self.变身 ~= nil and 变身显示  then
		-- tp.提示:写入("#Y/当前正处于变身状态中，无法取消")
		return false
	end
	local n = 引擎.取足迹(锦衣.名称)
    self.玩家["足迹_行走"]=tp.资源:载入(n[4],"网易假人动画",n[1])
    self:置方向(self.方向)
end

function 场景类_玩家:卸下足迹()
	self.玩家["足迹_行走"] = nil
end

function 场景类_玩家:置染色(染色方案,a,b,c)
	if not 玩家显示开关 and not 玩家加载开关 then
		return
	end
	self.玩家["静立"]:置染色(染色方案,a,b,c)
	if self.玩家.行走 ~= nil then
		self.玩家.行走:置染色(染色方案,a,b,c)
	end
	self:置方向(self.方向)
end
function 场景类_玩家:事件方向(a,b)
	if self.方向开关 then
		self:置方向(取八方向(floor(取两点角度(b,a))))
		tp.场景.人物:置方向(取八方向(floor(取两点角度(a,b))))
	else
		self:置方向(szb(取八方向(floor(取两点角度(b,a)))))
		tp.场景.人物:置方向(取八方向(floor(取两点角度(a,b))))
	end
end

return 场景类_玩家