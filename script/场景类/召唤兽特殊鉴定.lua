--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-04-29 17:55:47
--======================================================================--
local 场景类_召唤兽特殊鉴定 = class()
local zts,zts1,bb,tp,资源,按钮,自适应
local insert = table.insert
local 取宝宝 = 引擎.取宝宝
local ani = 引擎.取战斗模型
local 天赋名称={"金钟罩","搏命","黄泉笑","蛟龙出海","得天独厚","天见尤怜","多多益善","奋蹄扬威","混元气劲","伐骨抽髓"}
local 天赋图标={0x00000124,0x00000125,0x00000126,0x00000127,0x00000128,0x00000129,0x00000130,0x00000131,0x00000132,0x00000133}
local 天赋介绍={
	"#Y金钟罩\n#G主动技能\n\n为最多3个目标添加状态，可以吸收伤害，最多持续4回合，达到伤害吸收上限后消失，冷却10回合",
	"#Y搏命\n#G主动技能\n\n保留一点气血，对目标造成自身最大生命值的固定伤害，有几率触发步步回春状态，每回合持续恢复5%最大生命值上限的气血，持续5回合。（生命值低于60%不可使用）",
	"#Y黄泉笑\n#G主动技能\n\n消耗10%当前气血，对单个目标造成3次物理伤害，每击杀一个目标则提高伤害属性，持续至战斗结束",
	"#Y蛟龙出海\n#G主动技能\n\n对3个目标造成法术伤害，每分配300点魔力属性增加1个伤害目标，以及5%的额外法术暴击率。（可与法术暴击技能效果叠加）",
	"#Y得天独厚\n#C被动技能\n\n不会受到暴击效果，并且受到的最大伤害不会高于自身气血上限的35%，需要体质加点大于500生效",
	"#Y天见尤怜\n#C被动技能\n\n当前气血低于一定值时，受到的所有伤害减免",
	"#Y多多益善\n#C被动技能\n\n使所有法术系技能有几率增加1个目标",
	"#Y奋蹄扬威\n#C被动技能\n\n造成物理伤害时会忽视目标一定防御",
	"#Y混元气劲\n#C被动技能\n\n使用法术时，真气消耗增加50%，造成的伤害会按照当前真气追击额外伤害",
	"#Y伐骨抽髓\n#C被动技能\n\n造成物理伤害时，有几率附加目标当前气血百分比的伤害"
}

function 场景类_召唤兽特殊鉴定:初始化(根)
	self.ID = 120
	self.xx = 0
	self.yy = 0
	self.注释 = "召唤兽特殊鉴定"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	资源 = 根.资源
	按钮 = 根._按钮
	自适应 = tp._自适应
	self.背景=资源:载入('wpal/121.wpal',"网易WDF动画",0x000bb113)
	self.重置属性=按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"重置属性")
	self.使用珍经=按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"使用珍经")
	self.喂养={}
	for i=1,6 do
		self.喂养[i]=按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"喂养")
	end
	zts = tp.字体表.方正简体
	zts1 = tp.字体表.描边字体
	self.窗口时间 = 0
end

function 场景类_召唤兽特殊鉴定:刷新数据(b)
	bb=b
end

function 场景类_召唤兽特殊鉴定:打开(b)
	if self.可视 then
		if b ~= nil and  b ~= bb then
			bb = b
		end
		self.可视 = false
	else
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		bb = b
		self:置形象()
	end
end

function 场景类_召唤兽特殊鉴定:显示(dt,x,y)
	self.焦点 = false
	self.背景:更新(x,y)
	self.背景:显示(self.x ,self.y )
	zts1:置字间距(1)
	zts1:显示(self.x+98,self.y+2,"召唤兽鉴定")
	zts1:置字间距(0)
	self.重置属性:更新(x,y)
	self.使用珍经:更新(x,y)
	self.重置属性:显示(self.x+185 ,self.y+175 )
	self.使用珍经:显示(self.x+180 ,self.y+426 )
	tp.影子:显示(self.x+125 ,self.y+138)
	if self.宠物形象~=nil then
		self.宠物形象:更新(dt)
		self.宠物形象:显示(self.x+125 ,self.y+138)
	end
	if self.宠物饰品1 ~= nil then
		self.宠物饰品1:更新(dt)
		self.宠物饰品1:显示(jx,jy)
	end
	if self.宠物饰品2 ~= nil then
		self.宠物饰品2:更新(dt)
		self.宠物饰品2:显示(jx,jy)
	end
	if bb.种类=="仙灵" then
		local 序列=0
		for i=1,#天赋名称 do
			if bb.天赋~=nil and bb.天赋==天赋名称[i] then
		    	self.天赋信息=资源:载入('wpal/121.wpal',"网易WDF动画",天赋图标[i])
		    	self.天赋信息:更新(x,y)
				self.天赋信息:显示(self.x+190,self.y+125)
				序列=i
			end
		end
		if  self.天赋信息:是否选中(x,y) then
		    tp.提示:自定义(x-42,y+27,天赋介绍[序列])
		end
	end
	zts:置颜色(绿色)
	zts:显示(self.x+86,self.y+172,bb.性别)
	zts:显示(self.x+86,self.y+191,bb.繁殖)
	if bb.元宵数量==nil then
	    bb.元宵数量=500
	end
	if bb.炼兽数量==nil then
	    bb.炼兽数量=5
	end
	if bb.千金数量==nil then
	    bb.千金数量=100
	end
	zts:置颜色(黄色)
	zts:显示(self.x+81,self.y+209,bb.元宵数量)
	zts:显示(self.x+149,self.y+209,bb.炼兽数量)
	zts:显示(self.x+16,self.y+223,bb.千金数量)
	zts:置颜色(白色)
	local 攻击上限=0
	local 防御上限=0
	local 体力上限=0
	local 法力上限=0
	local 速度上限=0
	local 闪避上限=0
	local 成长上限=0
	if bb.种类=="神兽" or bb.种类=="仙灵" then
		local 宝宝=取神兽资质(bb.模型)
	    攻击上限=宝宝[1]
		防御上限=宝宝[2]
		体力上限=宝宝[3]
		法力上限=宝宝[4]
		速度上限=宝宝[5]
		闪避上限=宝宝[6]
	    成长上限=宝宝[7]
	else
		local 宝宝=取宝宝(bb.模型)
		攻击上限=宝宝[2]
		防御上限=宝宝[3]
		体力上限=宝宝[4]
		法力上限=宝宝[5]
		速度上限=宝宝[6]
		闪避上限=宝宝[7]
		成长上限=宝宝[8][5]
	end
	zts:显示(self.x+101,self.y+250,""..bb.攻击资质.." / "..攻击上限.."")
	zts:显示(self.x+101,self.y+279,""..bb.防御资质.." / "..防御上限.."")
	zts:显示(self.x+101,self.y+308,""..bb.体力资质.." / "..体力上限.."")
	zts:显示(self.x+101,self.y+337,""..bb.法力资质.." / "..法力上限.."")
	zts:显示(self.x+101,self.y+368,""..bb.速度资质.." / "..速度上限.."")
	zts:显示(self.x+101,self.y+398,""..bb.躲闪资质.." / "..闪避上限.."")
	zts:显示(self.x+101,self.y+428,""..bb.成长.." / "..成长上限.."")
	for i=1,6 do
		self.喂养[i]:更新(x,y)
		self.喂养[i]:显示(self.x+212 ,self.y+247+i+(i-1)*29 )
	end
end

function 场景类_召唤兽特殊鉴定:置形象()
	self.宠物形象 = nil
	self.宠物饰品1 = nil
	self.宠物饰品2 = nil
	if bb ~= nil then
		local n = ani(bb.模型)
		self.宠物形象 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		self.宠物形象:置方向(0)
		if ani(bb.模型.."_饰品") ~= nil and #ani(bb.模型.."_饰品") ~= 0 then
			n = ani(bb.模型.."_饰品")
			self.宠物饰品1 = tp.资源:载入(n[10],"网易WDF动画",n[6])
			self.宠物饰品1:置方向(0)
		end
		if bb.饰品2 ~= nil then
			n = ani(bb.模型.."_饰品2")
			self.宠物饰品2 = tp.资源:载入(n[10],"网易WDF动画",n[6])
			self.宠物饰品2:置方向(0)
		end
		if bb.染色方案 ~= nil and bb.染色组~=nil then
			self.宠物形象:置染色(bb.染色方案,bb.染色组[1],bb.染色组[2],bb.染色组[3])
			self.宠物形象:置方向(0)
		end
	end
end

function 场景类_召唤兽特殊鉴定:检查点(x,y)
	if self.背景:是否选中(x,y)  then
		return true
	end
end

function 场景类_召唤兽特殊鉴定:初始移动(x,y)
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

function 场景类_召唤兽特殊鉴定:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_召唤兽特殊鉴定