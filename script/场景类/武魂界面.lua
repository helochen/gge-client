-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2020-09-23 02:02:55
-- @最后修改来自: baidwwy
-- @Last Modified time: 2021-04-29 17:55:46
local 场景类_武魂界面 = class()
local insert = table.insert
local mouseb = 引擎.鼠标弹起
local keyaz = 引擎.按键按住
local keyax = 引擎.按键按下
local tp,zts,zts1
local floor = math.floor
local format = string.format
local insert = table.insert
local remove = table.remove
local mouseb = 引擎.鼠标弹起
local zts,zts1,tp
local 取武魂=引擎.取武魂模型
local 武魂技能介绍={
聚灵="#G聚灵\n#W经验获取提高10%",
聚财="#G聚财\n#W银两获取提高10%",
重击="#G重击\n物理伤害结果提高5%",
怒火="#G怒火\n法术伤害结果提高5%",
规则="#G规则\n固定伤害结果提高5%",
疗愈="#G疗愈\n治疗技能效果提高5%",
蛊惑="#G蛊惑\n封印技能成功率提高5%",
沸血="#G沸血\n物理伤害暴击率提高5%",
灵涌="#G灵涌\n法术伤害暴击率提高5%",
残忍="#G残忍\n物理伤害暴击伤害提高15%",
暴戾="#G暴戾\n法术伤害暴击伤害提高15%",
回光返照="#G回光返照\n战斗中若受到致死攻击,有几率触发回光返照状态,持续至当前回合结束,此状态下受到的所有伤害将视作治疗,每场战斗最多触发一次",
多多益善·战="#G多多益善·战\n战斗中所有多目标物理技能有几率额外增加一个目标",
多多益善·法="#G多多益善·法\n战斗中所有多目标法术技能有几率额外增加一个目标",
多多益善·愈="#G多多益善·愈\n战斗中所有多目标治疗技能有几率额外增加一个目标",
多多益善·封="#G多多益善·封\n战斗中所有多目标封印技能有几率额外增加一个目标",
多多益善·固="#G多多益善·固\n战斗中所有多目标固伤技能有几率额外增加一个目标",
火焰之灵="#G火焰之灵\n造成物理伤害时有几率灼伤敌人,额外造成目标5%最大生命值伤害",
祝福之星="#G祝福之星\n死亡时有8%概率复活,并恢复10%生命",
不屈战意="#G不屈战意\n生命值低于10%时,伤害结果增加30%"
}
function 场景类_武魂界面:初始化(根)
	self.ID = 88
	self.x = 157
	self.y = 98
	self.xx = 0
	self.yy = 0
	self.注释 = "武魂界面"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.背景=资源:载入('wpal/121.wpal',"网易WDF动画",0x0000bb32)
	self.武魂幻化按钮=按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0x0000bb31),0,0,3,true,true)
	self.武魂技能重置按钮=按钮.创建(资源:载入('wzife.wd3',"网易WDF动画",0x75C6DBC0),0,0,3,true,true)
	self.武魂按钮=按钮.创建(资源:载入('wzife.wd3',"网易WDF动画",0x75C6DBC0),0,0,3,true,true)
	self.技能栏背景=资源:载入('wpal/121.wpal',"网易WDF动画",0x0000bb53)
	--self.武魂进阶按钮=按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"进阶")
	self.窗口时间 = 0
	self.选中 =0
end

function 场景类_武魂界面:打开()
	if self.可视 then
		self.可视 = false
	else
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    if tp.队伍[1].武魂.名称~=nil then
			local 武魂模型 = 取武魂(tp.队伍[1].武魂.名称)
			self.武魂显示=tp.资源:载入(武魂模型[2],"网易WDF动画",武魂模型[1])
		end
		self.选中 =0
	end
end

function 场景类_武魂界面:刷新(内容)
	self.选中 =0
	tp.队伍[1].武魂.等级=内容.等级
	tp.队伍[1].武魂.阶数=内容.阶数
	tp.队伍[1].武魂.名称=内容.名称
	tp.队伍[1].武魂.技能=内容.技能
	if tp.队伍[1].武魂.名称~=nil then
		local 武魂模型 = 取武魂(tp.队伍[1].武魂.名称)
		self.武魂显示=tp.资源:载入(武魂模型[2],"网易WDF动画",武魂模型[1])
		if tp.队伍[1].武魂.阶数==0 then
		    self.阶数="壹"
		elseif tp.队伍[1].武魂.阶数==1 then
		    self.阶数="贰"
		elseif tp.队伍[1].武魂.阶数==2 then
		    self.阶数="叁"
		elseif tp.队伍[1].武魂.阶数==3 then
		    self.阶数="肆"
		elseif tp.队伍[1].武魂.阶数==4 then
		    self.阶数="伍"
		end
		local 等级转换=tp.队伍[1].武魂.阶数*10
		self.真实等级=等级转换+tp.队伍[1].武魂.等级
		self.加成=(tp.队伍[1].武魂.等级+tp.队伍[1].武魂.阶数*10)*5+tp.队伍[1].武魂.阶数*200
		if tp.队伍[1].武魂.技能[1]~=nil then
			local 武魂技能1图标数据=self:取技能图标(tp.队伍[1].武魂.技能[1])
			self.武魂技能1=tp.资源:载入(武魂技能1图标数据[2],"网易WDF动画",武魂技能1图标数据[1])
		elseif tp.队伍[1].武魂.技能[2]~=nil then
			local 武魂技能1图标数据=self:取技能图标(tp.队伍[1].武魂.技能[2])
			self.武魂技能2=tp.资源:载入(武魂技能1图标数据[2],"网易WDF动画",武魂技能1图标数据[1])
		elseif tp.队伍[1].武魂.技能[3]~=nil then
			local 武魂技能1图标数据=self:取技能图标(tp.队伍[1].武魂.技能[3])
			self.武魂技能3=tp.资源:载入(武魂技能1图标数据[2],"网易WDF动画",武魂技能1图标数据[1])
		elseif tp.队伍[1].武魂.技能[4]~=nil then
			local 武魂技能1图标数据=self:取技能图标(tp.队伍[1].武魂.技能[4])
			self.武魂技能4=tp.资源:载入(武魂技能1图标数据[2],"网易WDF动画",武魂技能1图标数据[1])
		end
	end
end

function 场景类_武魂界面:显示(dt,x,y)
	self.背景:更新(x,y)
	self.武魂幻化按钮:更新(x,y)
	self.武魂技能重置按钮:置文字("  技能重置")
	self.武魂技能重置按钮:更新(x,y)
	self.武魂按钮:更新(x,y,self.选中 ~= 0)
	self.背景:显示(self.x ,self.y )

	self.技能栏背景:更新(x,y)
	for i=1,4 do
		self.技能栏背景:显示(self.x+33+(i-1)*55 ,self.y+275 )
	end
	for i=1,4 do
		self.技能栏背景:显示(self.x+33+(i-1)*55 ,self.y+339 )
	end
	if tp.队伍[1].武魂.名称~=nil then
		self.武魂显示:显示(self.x + 56,self.y + 66)
		self.武魂显示:更新(dt)
		self.武魂幻化按钮:显示(self.x+260,self.y+30)
		self.武魂技能重置按钮:显示(self.x+242,self.y+348)
		zts:显示(self.x+18,self.y+40,"武\n魂")
		--zts:显示(self.x+15,self.y+80,"魂")
		if tp.队伍[1].武魂.阶数==0 then
		    self.阶数="壹"
		elseif tp.队伍[1].武魂.阶数==1 then
		    self.阶数="贰"
		elseif tp.队伍[1].武魂.阶数==2 then
		    self.阶数="叁"
		elseif tp.队伍[1].武魂.阶数==3 then
		    self.阶数="肆"
		elseif tp.队伍[1].武魂.阶数==4 then
		    self.阶数="伍"
		end
		zts:置颜色(红色)
		zts:显示(self.x+18,self.y+112,""..self.阶数.."")
		zts:置颜色(白色)
		zts:显示(self.x+18,self.y+150,"阶")
		self.加成=(tp.队伍[1].武魂.等级+tp.队伍[1].武魂.阶数*10)*5+tp.队伍[1].武魂.阶数*200
		zts1:显示(self.x+440,self.y+67,""..self.加成.."")
		zts1:显示(self.x+440,self.y+93,""..self.加成.."")
		zts1:显示(self.x+440,self.y+118,""..self.加成.."")
		zts1:显示(self.x+440,self.y+143,""..self.加成.."")
		zts1:显示(self.x+440,self.y+168,""..self.加成.."")
		zts1:显示(self.x+440,self.y+192,""..self.加成.."")
		zts1:显示(self.x+440,self.y+216,""..self.加成.."")
		zts1:显示(self.x+59,self.y+173,""..tp.队伍[1].武魂.等级.."\n级")
		local 等级转换=tp.队伍[1].武魂.阶数*10
		self.真实等级=等级转换+tp.队伍[1].武魂.等级+1
		local 经验需求=self.真实等级*3500000+300000*(self.真实等级-1)*16
		zts1:显示(self.x+438,self.y+277,""..经验需求.."")
		local 银两需求=self.真实等级*500000+500000*(self.真实等级-1)*8
		zts1:显示(self.x+438,self.y+301,""..银两需求.."")
		zts1:显示(self.x+438,self.y+325,"武魂珠*"..self.真实等级.."")
		if tp.队伍[1].武魂.等级%10 ~= 0 or tp.队伍[1].武魂.等级==0 then
			self.武魂按钮:更新(x,y)
			self.武魂按钮:置文字("升级")
			self.武魂按钮:显示(self.x+410 ,self.y+348 )
			self.武魂按钮:置偏移(26,1)
		else
			self.武魂按钮:更新(x,y)
			self.武魂按钮:置文字("进阶")
			self.武魂按钮:显示(self.x+410 ,self.y+348 )
			self.武魂按钮:置偏移(26,1)
		end
		if tp.队伍[1].武魂.技能[1]~=nil then
			local 武魂技能1图标数据=self:取技能图标(tp.队伍[1].武魂.技能[1])
			self.武魂技能1=tp.资源:载入(武魂技能1图标数据[2],"网易WDF动画",武魂技能1图标数据[1])
		    self.武魂技能1:更新(x,y)
		    self.武魂技能1:显示(self.x+35 ,self.y+341 )
		    if self.武魂技能1:是否选中(x,y) then
				--tp.物品格子焦点____:显示(self.x+33 ,self.y+339 )
				local 技能名称=tp.队伍[1].武魂.技能[1]
				local 提示信息=武魂技能介绍[技能名称]
				tp.提示:自定义(x,y,""..提示信息.."")
			end
		end
		if tp.队伍[1].武魂.技能[2]~=nil then
			local 武魂技能1图标数据=self:取技能图标(tp.队伍[1].武魂.技能[2])
			self.武魂技能2=tp.资源:载入(武魂技能1图标数据[2],"网易WDF动画",武魂技能1图标数据[1])
		    self.武魂技能2:更新(x,y)
		    self.武魂技能2:显示(self.x+90 ,self.y+341 )
		    if self.武魂技能2:是否选中(x,y) then
				--tp.物品格子焦点____:显示(self.x+88 ,self.y+339 )
				local 技能名称=tp.队伍[1].武魂.技能[2]
				local 提示信息=武魂技能介绍[技能名称]
				tp.提示:自定义(x,y,""..提示信息.."")
			end
		end
		if tp.队伍[1].武魂.技能[3]~=nil then
			local 武魂技能1图标数据=self:取技能图标(tp.队伍[1].武魂.技能[3])
			self.武魂技能3=tp.资源:载入(武魂技能1图标数据[2],"网易WDF动画",武魂技能1图标数据[1])
		    self.武魂技能3:更新(x,y)
		    self.武魂技能3:显示(self.x+145 ,self.y+341 )
		    if self.武魂技能3:是否选中(x,y) then
				--tp.物品格子焦点____:显示(self.x+143 ,self.y+339 )
				local 技能名称=tp.队伍[1].武魂.技能[3]
				local 提示信息=武魂技能介绍[技能名称]
				tp.提示:自定义(x,y,""..提示信息.."")
			end
		end
		if tp.队伍[1].武魂.技能[4]~=nil then
			local 武魂技能1图标数据=self:取技能图标(tp.队伍[1].武魂.技能[4])
			self.武魂技能4=tp.资源:载入(武魂技能1图标数据[2],"网易WDF动画",武魂技能1图标数据[1])
		    self.武魂技能4:更新(x,y)
		    self.武魂技能4:显示(self.x+200 ,self.y+341 )
		    if self.武魂技能4:是否选中(x,y) then
				--tp.物品格子焦点____:显示(self.x+198 ,self.y+339 )
				local 技能名称=tp.队伍[1].武魂.技能[4]
				local 提示信息=武魂技能介绍[技能名称]
				tp.提示:自定义(x,y,""..提示信息.."")
			end
		end
		if self.武魂幻化按钮:是否选中(x,y) then
			tp.提示:自定义(x,y,"点击可以为武魂刷新形象,不同形象会用不同的天赋技能")
		end
		if self.武魂按钮:事件判断() then
			if self.武魂按钮:取文字()=="升级" then
				发送数据(77.7,{经验=经验需求,银两=银两需求,数量=self.真实等级})
			elseif self.武魂按钮:取文字()=="进阶" then
			    发送数据(78.8,{经验=经验需求,银两=银两需求,数量=self.真实等级})
			end
		end
		if self.武魂技能重置按钮:事件判断() then
			if tp.队伍[1].武魂.技能==nil then
			    tp.提示:写入("你的武魂还没有领悟技能,每次进阶可以随机领悟一种技能")
			    return
			end
			发送数据(79.9)
		end
		if self.武魂幻化按钮:事件判断() then
			发送数据(80.8)
		end

	end
end

function 场景类_武魂界面:取技能图标(名称)
	local 图标数据={}
	if 名称=="回光返照" then
		图标数据[1]=0x0000bb54
		图标数据[2]="wpal/121.wpal"
	elseif 名称=="聚灵" then
		图标数据[1]=0x0000bb55
		图标数据[2]="wpal/121.wpal"
	elseif 名称=="残忍" then
		图标数据[1]=0x0000bb56
		图标数据[2]="wpal/121.wpal"
	elseif 名称=="规则" then
		图标数据[1]=0x0000bb57
		图标数据[2]="wpal/121.wpal"
	elseif 名称=="不屈战意" then
		图标数据[1]=0x0000bb58
		图标数据[2]="wpal/121.wpal"
	elseif 名称=="祝福之星" then
		图标数据[1]=0x0000bb59
		图标数据[2]="wpal/121.wpal"
	elseif 名称=="重击" then
		图标数据[1]=0x0000bb60
		图标数据[2]="wpal/121.wpal"
	elseif 名称=="暴戾" then
		图标数据[1]=0x0000bb61
		图标数据[2]="wpal/121.wpal"
	elseif 名称=="怒火" then
		图标数据[1]=0x0000bb62
		图标数据[2]="wpal/121.wpal"
	elseif 名称=="灵涌" then
		图标数据[1]=0x0000bb63
		图标数据[2]="wpal/121.wpal"
	elseif 名称=="疗愈" then
		图标数据[1]=0x0000bb64
		图标数据[2]="wpal/121.wpal"
	elseif 名称=="蛊惑" then
		图标数据[1]=0x0000bb65
		图标数据[2]="wpal/121.wpal"
	elseif 名称=="火焰之灵" then
		图标数据[1]=0x0000bb66
		图标数据[2]="wpal/121.wpal"
	elseif 名称=="沸血" then
		图标数据[1]=0x0000bb67
		图标数据[2]="wpal/121.wpal"
	elseif 名称=="聚财" then
		图标数据[1]=0x0000bb68
		图标数据[2]="wpal/121.wpal"
	elseif 名称=="多多益善·战" or 名称=="多多益善·法"or 名称=="多多益善·愈"or 名称=="多多益善·封"or 名称=="多多益善·固" then
		图标数据[1]=0x0000bb69
		图标数据[2]="wpal/121.wpal"
	end
	return 图标数据
end

function 场景类_武魂界面:检查点(x,y)
	if self.背景:是否选中(x,y)  then
		return true
	end
end

function 场景类_武魂界面:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_武魂界面:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_武魂界面