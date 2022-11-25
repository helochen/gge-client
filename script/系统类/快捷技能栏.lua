--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-08-01 21:40:38
--======================================================================--
local 系统类_快捷技能栏 = class()
local tp,zts1
local mouseb = 引擎.鼠标按下
local keyb   = 引擎.按键弹起
local bw     = require("gge包围盒")(全局游戏宽度-380,全局游戏高度-65,262,31)
local ski    = 引擎.取技能
local gl     = 引擎.置纹理过滤

function 系统类_快捷技能栏:初始化(根)
	local 资源 = 根.资源
	self.格子 = 资源:载入('wzife.wdf',"网易WDF动画",0x0493FA27)
	tp = 根
	zts1 = 根.字体表.描边字体
	self.图片组 = {}
	self.操作员 = nil
	self.技能格子={}
	local jn = tp._技能格子
	for i=1,8 do
	    self.技能格子[i] = jn(0,0,i,"辅助技能")
	end
end

function 系统类_快捷技能栏:设置技能(参数,x,y)
	local 选中编号=0
	for i=1,8 do
		self.格子:显示(全局游戏宽度-380+i*33,全局游戏高度-65)
		if self.格子:是否选中(x,y) then
			选中编号=i
		end
	end
	if 选中编号==0 then
		return
	end
	发送数据(11,{位置=选中编号,名称=参数.名称,类型=参数.类型})
end

function 系统类_快捷技能栏:刷新(数据,禁止)
	if 禁止==nil then
		tp.快捷技能显示 = not tp.快捷技能显示
	end
	--local 数据={{名称="仙灵店铺"},{名称="横扫千军"},{名称="火眼金睛"},{名称="打坐"},{名称="调息"}}
	if tp.快捷技能显示 then
		for i=1,8 do
			-- print(self.技能格子[i])
			self.技能格子[i]:置技能(数据[i])
			if self.技能格子[i].技能~=nil then
				self.技能格子[i].技能.模型=self.技能格子[i].技能.小模型
			end
			--table.print(self.技能格子[i])
		end
	end
end

function 系统类_快捷技能栏:显示(dt,x,y)
	self.鼠标=false
	if not tp.快捷技能显示 then
		return
	end
	for i=1,8 do
		self.格子:显示(全局游戏宽度-380+i*33,全局游戏高度-65)
		if self.格子:是否选中(x,y) then
			self.鼠标=true
		end
		self.技能格子[i]:置坐标(全局游戏宽度-376+i*33,全局游戏高度-61)
		self.技能格子[i]:显示(x,y,self.鼠标)
		zts1:显示(全局游戏宽度-372+i*33,全局游戏高度-81,"F"..i)
		if self.技能格子[i].焦点 then
			tp.提示:技能(x,y,self.技能格子[i].技能)
			if 引擎.鼠标弹起(右键) then --and self.技能格子[i].技能~=nil then
				if tp.战斗中==false then
					发送数据(13,{序列=i})
				elseif self.技能格子[i]~=nil and 战斗类.进程=="命令"  then
					if self:取战斗可用(self.技能格子[i].技能.名称) then
						战斗类.战斗指令:设置法术参数(self.技能格子[i],"快捷技能")
					else
						tp.提示:写入("#Y/该技能无法在战斗中使用")
					end
				end
			end
		end
	end
	local ax = self:快捷焦点按下()
	if ax~=0 then
		if tp.战斗中==false then
			发送数据(13,{序列=ax})
		elseif self.技能格子[ax]~=nil and self.技能格子[ax].技能~=nil and 战斗类.进程=="命令"  then
			if self.技能格子[ax].技能.名称~=nil and self:取战斗可用(self.技能格子[ax].技能.名称) then
				战斗类.战斗指令:设置法术参数(self.技能格子[ax],"快捷技能")
			else
				tp.提示:写入("#Y/该技能无法在战斗中使用")
			end
		end
	end
end

function 系统类_快捷技能栏:取战斗可用(名称)
	if self:物攻技能(名称) then
		return true
	elseif self:封印技能(名称) then
		return true
	elseif self:增益技能(名称) then
		return true
	elseif self:减益技能(名称) then
		return true
	elseif self:法攻技能(名称) then
		return true
	elseif self:恢复技能(名称) then
		return true
	elseif 名称=="妙手空空" then
		return true
	end
end

function 系统类_快捷技能栏:恢复技能(名称)
  local 临时名称={"起死回生","回魂咒","无穷妙道","还阳术","舍身取义","活血","慈航普渡","地涌金莲","莲花心音","妙悟","星月之惠","玉清诀","晶清诀","冰清诀","水清诀","四海升平","命归术","气归术","凝神诀","凝气诀","命疗术","心疗术","气疗术","归元咒","乾天罡气","我佛慈悲","杨柳甘露","推拿","推气过宫","解毒","百毒不侵","宁心","解封","清心","驱魔","驱尸","寡欲令","复苏"}
 for n=1,#临时名称 do
     if 临时名称[n]==名称 then return true end
   end
 return false
end

function 系统类_快捷技能栏:法攻技能(名称)
  local 临时名称={"天外飞剑","上古灵符","叱咤风云","天降灵葫","月光","八凶法阵","飞符炼魂","五行制化","孔雀明王经","摇头摆尾","黄泉之息","腾雷","飞花摘叶","风卷残云","魔焰滔天","亢龙归海","天罗地网","夺命咒","血雨","飞花摘叶","落叶萧萧","荆棘舞","尘土刃","冰川怒","自爆","唧唧歪歪","五雷咒","落雷符","雨落寒沙","五雷轰顶","雷霆万钧","龙卷雨击","龙吟","二龙戏珠","龙腾","苍茫树","靛沧海","日光华","地裂火","巨岩破","三昧真火","飞砂走石","判官令","阎罗令","水攻","烈火","落岩","雷击","泰山压顶","水漫金山","地狱烈火","奔雷咒"}
 for n=1,#临时名称 do
     if 临时名称[n]==名称 then return true end
   end
 return false
end

function 系统类_快捷技能栏:物攻技能(名称)
 local 临时名称={"剑荡四方","翻江搅海","破釜沉舟","惊涛怒","浪涌","猛击","百爪狂杀","鸿渐于陆","翩鸿一击","天命剑法","长驱直入","牛刀小试","天崩地裂","断岳势","裂石","满天花雨","破血狂攻","破碎无双","弱点击破","善恶有报","惊心一剑","壁垒击破","横扫千军","狮搏","象形","连环击","鹰击","烟雨剑法","飘渺式","天雷斩","裂石","断岳势","天崩地裂","浪涌","惊涛怒","力劈华山","死亡召唤","夜舞倾城","高级连击","理直气壮"}
 for n=1,#临时名称 do
     if 临时名称[n]==名称 then return true end
   end
 return false
end

function 系统类_快捷技能栏:封印技能(名称)
 local 临时名称={"摧心术","惊魂掌","瘴气","煞气诀","夺魄令","反间之计","催眠符","画地为牢","金刚镯","一笑倾城","碎甲符","风雷韵动","妖风四起","凋零之歌","落花成泥","雷浪穿云","顺势而为","碎玉弄影","失心符","落魄符","失忆符","追魂符","离魂符","失魂符","定身符","莲步轻舞","如花解语","似玉生香","娉婷嬝娜","镇妖","错乱","百万神兵","日月乾坤","威慑","含情脉脉","魔音摄魂","夺魄令","惊魂掌","煞气诀","象形"}
 for n=1,#临时名称 do
     if 临时名称[n]==名称 then return true end
   end
 return false
end

function 系统类_快捷技能栏:减益技能(名称)
local 临时名称={"尸腐毒","紧箍咒","勾魂","摄魄","雾杀"}
 for n=1,#临时名称 do
     if 临时名称[n]==名称 then return true end
   end
 return false
end

function 系统类_快捷技能栏:增益技能(名称)
 local 临时名称={"变身","御风","幻镜术","颠倒五行","碎星诀","不动如山","明光宝烛","法术防御","罗汉金钟","光辉之甲","同舟共济","真君显灵","偷龙转凤","魑魅缠身","烈焰真诀","莲心剑意","波澜不惊","钟馗论道","诸天看护","渡劫金身","太极护法","野兽之力","圣灵之甲","魔兽之印","天神护体","移魂化骨","蜜润","炎护","后发制人","杀气诀","安神诀","分身术","达摩护体","金刚护法","金刚护体","韦陀护法","一苇渡江","佛法无边","楚楚可怜","天神护法","乘风破浪","神龙摆尾","生命之泉","炼气化神","天地同寿","乾坤妙法","普渡众生","灵动九天","幽冥鬼眼","修罗隐身","火甲术","魔王回首","牛劲","定心术","极度疯狂","魔息术","天魔解体","盘丝阵","幻境术","不动如山","碎星诀","镇魂诀","明光宝烛","金身舍利","炎护","蜜润"}
 for n=1,#临时名称 do
     if 临时名称[n]==名称 then return true end
   end
 return false
end

function 系统类_快捷技能栏:快捷焦点按下()
	if keyb(KEY.F1) then
		return 1
	elseif keyb(KEY.F2) then
		return 2
	elseif keyb(KEY.F3) then
		return 3
	elseif keyb(KEY.F4) then
		return 4
	elseif keyb(KEY.F5) then
		return 5
	elseif keyb(KEY.F6) then
		return 6
	elseif keyb(KEY.F7) then
		return 7
	elseif keyb(KEY.F8) then
		return 8
	end
	return 0
end

function 系统类_快捷技能栏:检查点(x,y)
	return tp.快捷技能显示 and bw:检查点(x,y)
end

return 系统类_快捷技能栏