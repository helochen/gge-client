--======================================================================--
--	☆ 作者：飞蛾扑火 QQ：1415559882
--======================================================================--
local 助战技能栏 = class()
local zts,bb,tp,zts1
local yx = {{68,4},{25,28},{111,28},{24,75},{111,75},{68,97}}
local insert = table.insert
local bds = {"攻击资质","防御资质","体力资质","法力资质","速度资质","躲闪资质"}
local bds1 = {"寿命","成长","五行"}
local mousea = 引擎.鼠标弹起
function 助战技能栏:初始化(根)
	self.ID = 48
	self.xx = 0
	self.yy = 0
	self.注释 = "坐骑资质栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	self.状态 = 1
	self.窗口时间 = 0
	self.技能选择开关=false
end

function 助战技能栏:打开(b)
	if self.可视 then
		if b ~= nil and  b ~= bb then
			bb = b
			self.数据 = tp.助战列表[bb]
			self.技能选择开关=false
			return
		end
		self.状态 = nil
		self.可视 = false
		self.技能 ={}
		self.资源组 = nil
		self.无技能 = nil
		self.技能选择界面 = nil
		self.技能选择界面条 = nil
		self.技能关闭 = nil
		self.特殊技能 = nil
		self.门派技能 = nil
		self.真实技能 = nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.资源组 = {
			[1] = 自适应.创建(0,1,242,320,3,9),
			[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
			[6] = 资源:载入('wzife.wd1',"网易WDF动画",0x68D384BD),
			[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"确认学习"),
			[13] = 自适应.创建(3,1,95,19,1,3),
			[14] = 自适应.创建(1,1,204,18,1,3,nil,18),
		}
		self.无技能={}
		for i=1,3 do
			self.无技能[i]=按钮.创建(资源:载入("wzife.wdf","网易WDF动画",0xCEC838D7),0,0,1,true,true)
		end
		if 暖风界面 then
			self.资源组[6]=资源:载入('uilf1.wdf',"网易WDF动画",0xEEE36C22)
		end
		self.资源组[2]:绑定窗口_(48)
		self.技能选择界面 = 自适应.创建(0,1,200,200,3,9)
		self.技能选择界面条 = 自适应.创建(1,1,162,18,1,3,nil,18)
		self.技能关闭=按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true)
		local jn = tp._技能格子
		self.特殊技能={}
		for i=1,6 do
		    self.特殊技能[i] = jn(0,0,i,"特殊技能")
		end
		self.门派技能={}
		for i=1,9 do
		    self.门派技能[i] = jn(0,0,i,"门派技能")
		end
		self.真实技能={}
		for i=1,3 do
			self.真实技能[i] = jn(0,0,i,"技能")
		end
		bb = b
		self.数据 = tp.助战列表[bb]
		self.技能={}
		for i=1,#self.数据.技能 do
			self.技能[i] = self.数据.技能[i]
		end
		self.等级 = self.数据.等级
		for i=1,6 do
			self.特殊技能[i]:置技能(self.数据.特殊技能[i])
		end
		self.状态 = 1
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.技能选择开关=false
	    self.可视 = true
	end
end

function 助战技能栏:显示(dt,x,y)
	self.右键关闭 = nil
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,#self.技能>0)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[3]:事件判断() then
		发送数据(75,{编号=bb,技能=self.技能})
	end
	self.资源组[1]:显示(self.x,self.y)
	if 暖风界面 then
	self.资源组[2]:显示(self.x+222,self.y+3)
	tp.窗口标题:显示(self.x+41,self.y)
	else
	self.资源组[2]:显示(self.x+216,self.y+5)
	self.资源组[14]:显示(self.x+6,self.y+3)

	tp.窗口标题背景_:置区域(0,0,84,16)
	tp.窗口标题背景_:显示(self.x+71,self.y+3)
	 end
	 self.资源组[3]:显示(self.x+130,self.y+150)
	zts1:置字间距(1)
	zts1:显示(self.x+76,self.y+3,"助战技能")
	zts1:显示(self.x+20,self.y+30,"门派技能(需加入门派)")
	zts1:显示(self.x+20,self.y+55,"自由选择学习3个门派技能")
	for i=1,3 do
		self.资源组[6]:显示(self.x+20+(i-1)*55,self.y+90)
		if self.技能[i] == nil then
			self.无技能[i]:更新(x,y,self.数据.门派~="无门派")
			tp.宠物头像背景_:显示(self.x+24+(i-1)*55,self.y+93)
			self.无技能[i]:显示(self.x+27+(i-1)*55,self.y+96)
			if self.无技能[i]:事件判断() then
				self.技能选择开关=true
			end
		else
			self.真实技能[i]:置技能({名称=self.技能[i]})
			self.真实技能[i]:置坐标(self.x+24+(i-1)*55,self.y+93)
			self.真实技能[i]:显示(x,y,self.鼠标)
			if self.真实技能[i].技能.模型:是否选中(x,y) then
				self.焦点 = true
				self.右键关闭 = 1
				tp.提示:技能(x,y,self.真实技能[i].技能)
				if mousea(1) then
					table.remove(self.技能,i)
				end
			end
		end
	end
	zts1:显示(self.x+20,self.y+170,"特殊技能")
	local x1 = 0
	local y1 = 0
	for i=1,6 do
		self.资源组[6]:显示(self.x+20+x1*55,self.y+200+y1*55)
		self.特殊技能[i]:置坐标(self.x+22+x1*55,self.y+203+y1*55)
		self.特殊技能[i]:显示(x,y,self.鼠标)
		x1 = x1 +1
		if x1> 2 then
			y1=1
			x1=0
		end
		if self.特殊技能[i].焦点 then
			self.焦点 = true
			tp.提示:技能(x,y,self.特殊技能[i].技能)
		end
	end
	zts1:置颜色(4294967295)
	zts1:置字间距(0)

	if self.技能选择开关 then
		self.技能关闭:更新(x,y)
		self.技能选择界面:显示(self.x,self.y+320)
		self.技能选择界面条:显示(self.x+6,self.y+323)
		self.技能关闭:显示(self.x+174,self.y+325)
		local 门派临时技能表 = self:取门派技能()
		local x2 = 0
		local y2 = 0
		for i=1,#门派临时技能表 do
			self.资源组[6]:显示(self.x+20+x2*55,self.y+350+y2*55)
			local 技能={名称=门派临时技能表[i]}
			self.门派技能[i]:置技能(技能)
			self.门派技能[i]:置坐标(self.x+24+x2*55,self.y+352+y2*55)
			self.门派技能[i]:显示(x,y,self.鼠标)
			x2 = x2 +1
			if x2> 2 then
				y2=y2+1
				x2=0
			end
			if self.门派技能[i].技能.模型:是否选中(x,y) then
				self.焦点 = true
				tp.提示:技能(x,y,self.门派技能[i].技能)
				if mousea(0) then
					for n=1,3 do
						if self.技能[n] == nil and not self:重复技能(self.门派技能[i].技能.名称) then
							self.技能[n] = self.门派技能[i].技能.名称
							break
						end
					end
				end
			end
		end
		if self.技能关闭:事件判断() then
			self.技能选择开关 =false
		end
	end
	if self.技能选择界面:是否选中(x,y) then
		self.右键关闭 = 1
	end
end
function 助战技能栏:重复技能(名称)
	for i=1,3 do
		if self.技能[n] ~= nil and self.技能[n] == 名称 then
			tp.提示:写入("#Y/该技能已经添加")
			return true
		end
	end
	return false
end
function 助战技能栏:检查点(x,y)
	if self.资源组 ~= nil and self.技能选择界面 ~= nil and (self.资源组[1]:是否选中(x,y) or self.技能选择界面:是否选中(x,y)) then
		return true
	end
end

function 助战技能栏:初始移动(x,y)
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

function 助战技能栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

function 助战技能栏:取门派技能()
	local 临时门派技能 ={}
	if self.数据.门派 =="大唐官府" then
		临时门派技能={"后发制人","横扫千军","杀气诀","反间之计","安神诀"}
		if self.数据.等级 >= 120 then
			临时门派技能={"后发制人","横扫千军","破釜沉舟","杀气诀","反间之计","安神诀"}
		end
	elseif self.数据.门派 =="方寸山" then
		临时门派技能={"催眠符","失心符","失魂符","定身符","凝神术","落雷符","归元咒"}
		if self.数据.等级 >= 120 then
			临时门派技能={"催眠符","失心符","失魂符","定身符","碎甲符","落雷符","归元咒","分身术"}
		end
	elseif self.数据.门派 =="化生寺" then
		临时门派技能={"金刚护法","韦陀护法","金刚护体","一苇渡江","推拿","活血","推气过宫","我佛慈悲"}
		if self.数据.等级 >= 120 then
			临时门派技能={"金刚护法","韦陀护法","金刚护体","一苇渡江","推拿","活血","推气过宫","我佛慈悲","舍身取义"}
		end
	elseif self.数据.门派 =="女儿村" then
		临时门派技能={"楚楚可怜","满天花雨","雨落寒沙","莲步轻舞","如花解语","似玉生香"}
		if self.数据.等级 >= 120 then
			临时门派技能={"楚楚可怜","满天花雨","雨落寒沙","莲步轻舞","如花解语","似玉生香","飞花摘叶"}
		end
	elseif self.数据.门派 =="阴曹地府" then
		临时门派技能={"阎罗令","判官令","幽冥鬼眼","幽冥鬼眼","尸腐毒","锢魂术"}
		if self.数据.等级 >= 120 then
			临时门派技能={"阎罗令","判官令","幽冥鬼眼","幽冥鬼眼","尸腐毒","锢魂术","还阳术"}
		end
	elseif self.数据.门派 =="魔王寨" then
		临时门派技能={"飞砂走石","三昧真火","魔王回首","无敌牛虱","无敌牛妖","火甲术"}
		if self.数据.等级 >= 120 then
			临时门派技能={"飞砂走石","三昧真火","魔王回首","无敌牛虱","无敌牛妖","摇头摆尾"}
		end
	elseif self.数据.门派 =="狮驼岭" then
		临时门派技能={"变身","象形","鹰击","狮搏","定心术","连环击","连环击","极度疯狂"}
		if self.数据.等级 >= 120 then
			临时门派技能={"变身","象形","鹰击","狮搏","定心术","连环击","连环击","魔息术"}
		end
	elseif self.数据.门派 =="盘丝洞" then
		临时门派技能={"含情脉脉","瘴气","魔音摄魂","勾魂","摄魄","天罗地网"}
		if self.数据.等级 >= 120 then
			临时门派技能={"含情脉脉","瘴气","魔音摄魂","勾魂","摄魄","天罗地网","幻镜术"}
		end
	elseif self.数据.门派 =="天宫" then
		临时门派技能={"天神护体","天神护法","天诛地灭","五雷轰顶","天雷斩","错乱","镇妖"}
		if self.数据.等级 >= 120 then
			临时门派技能={"天神护体","天神护法","天诛地灭","五雷轰顶","天雷斩","错乱","镇妖","雷霆万钧"}
		end
	elseif self.数据.门派 =="龙宫" then
		临时门派技能={"龙卷雨击","龙腾","龙吟"}
		if self.数据.等级 >= 120 then
			临时门派技能={"龙卷雨击","龙腾","龙吟","二龙戏珠"}
		end
	elseif self.数据.门派 =="普陀山" then
		临时门派技能={"紧箍咒","杨柳甘露","日光华","靛沧海","巨岩破","苍茫树","地裂火","普渡众生"}
		if self.数据.等级 >= 120 then
			临时门派技能={"紧箍咒","杨柳甘露","日光华","靛沧海","巨岩破","苍茫树","地裂火","普渡众生","灵动九天"}
		end
	elseif self.数据.门派 =="五庄观" then
		临时门派技能={"烟雨剑法","飘渺式","日月乾坤","炼气化神","生命之泉"}
		if self.数据.等级 >= 120 then
			临时门派技能={"烟雨剑法","飘渺式","日月乾坤","炼气化神","生命之泉","天地同寿"}
		end
	elseif self.数据.门派 =="神木林" then
		临时门派技能={"落叶萧萧","荆棘舞","尘土刃","冰川怒","雾杀","血雨","星月之惠"}
		if self.数据.等级 >= 120 then
			临时门派技能={"落叶萧萧","荆棘舞","尘土刃","冰川怒","雾杀","血雨","星月之惠","炎护"}
		end
	elseif self.数据.门派 =="凌波城" then
		临时门派技能={"裂石","断岳势","天崩地裂","浪涌","惊涛怒","翻江搅海"}
		if self.数据.等级 >= 120 then
			临时门派技能={"裂石","断岳势","天崩地裂","浪涌","惊涛怒","翻江搅海","腾雷"}
		end
	elseif self.数据.门派 =="无底洞" then
		临时门派技能={"夺魄令","煞气诀","惊魂掌","摧心术","夺命咒","明光宝烛"}
		if self.数据.等级 >= 120 then
			临时门派技能={"夺魄令","煞气诀","惊魂掌","摧心术","夺命咒","明光宝烛","金身舍利","地涌金莲"}
		end
	end
	return 临时门派技能
end

return 助战技能栏