--======================================================================--
--======================================================================--
local 系统类_提示框 = class()
local floor = math.floor
local format = string.format
local remove = table.remove
local insert = table.insert
local jls = nil
local min = math.min
local gxs = 引擎.取物品功效
local qwp = 引擎.取物品
local tp = nil
local ARGB = ARGB
local pairs = pairs
local ff
function 系统类_提示框:初始化(根)
	ff = 根._丰富文本
	self.介绍文本 = ff(246,480,根.字体表.普通字体)
	self.道具文本 = ff(187,480,根.字体表.普通字体)
	:添加元素("f",0xFFFF6EC7)
	self.文本 = {}
	self.寄存内容 = {}
	self.寄存高度 = {}
	self.最高 = 0
	jls = 根.提示框
	tp = 根
end
function 提示(a)
  tp.提示:写入(a)
end
function 系统类_提示框:显示()
	if #self.文本 == 0 then
		return false
	end
	for n=1,#self.文本 do
		if self.文本[n] ~= nil then
			self.文本[n].tiem = self.文本[n].tiem - 1
			if self.文本[n].tiem <= 0 then
				table.remove(self.文本, n)
			end
		end
	end
	for n=1,#self.文本 do
		if self.文本[n] ~= nil then
			local h=self.文本[n].h
			jls:置宽高(全局游戏宽度-460,h+16)
			jls:显示(self.文本[n].x,self.文本[n].y)
			self.文本[n].ffs:显示(self.文本[n].x+6.5,self.文本[n].y+6.5)
		end
	end
end
function 系统类_提示框:写入(txt)
	local yy = 60
	local x = 0
	if #self.文本 > 8 then
		remove(self.文本, 1)
	end
	local txts = {
		x = 310,
		y = 300,
		tiem = 150+#self.文本*7,
		ffs =  ff(380,300)
	}
	local ab = txts.ffs:添加文本(txt)
	txts.h = ab-6
	if #self.文本 > 0 then
		local cs = 1
		local zgd = 300
		for i=1,#self.文本 do
			zgd = zgd - self.文本[i].h - 18
		end
		while true do
			self.文本[cs].y = zgd
			zgd = zgd + self.文本[cs].h +18
			cs = cs + 1
			if cs > #self.文本 then
				break
			end
		end
	end
	insert(self.文本,txts)
end
function 系统类_提示框:小地图(x,y,text)
	local x = x + 28
	local y = y
	local w = 86
	local h = 16
	if y - h <= 0 then
		y = 0
	end
	if x + w+18 >= 992 then
		x = 992-w
	end
	if y + h >= 612 then
		y = 612 - h
	end
	jls:置宽高(w+15,h+16)
	jls:显示(x,y)
	tp.字体表.普通字体:置颜色(-256):显示(x + 16,y + 8,text)
end
function 系统类_提示框:战斗提示(x,y,text,f)
	local x = x+25
	local y = y-10
	local w = floor(tp.字体表.普通字体:取宽度(text))-1
	local h = 12
	if x + w >= 全局游戏宽度-20 then
		x = 全局游戏宽度-20-w
		if f then
			x = x - (w/1.3)
		end
	end
	if y+30 >= 600 then
		y = 600-h-18
	end
	if y <= 2 then
		y = 2
	end
	jls:置宽高(w+15,h+16)
	jls:显示(x,y)
	tp.字体表.普通字体:置颜色(-256):显示(x + 7,y + 7,text)
end
function 系统类_提示框:其他提示(x,y,f)
	local x = x+25
	local y = y-10
	local w = 105
	local h = 27
	if f ~= nil and f.性别 ~= nil then
		h = 43
	end
	if x + w >= 全局游戏宽度-20 then
		x = 全局游戏宽度-20-w
		if f then
			x = x - (w/1.8)
		end
	end
	jls:置宽高(w+15,h+16)
	jls:显示(x,y)
	local zt = tp.字体表.普通字体
	zt:置颜色(-256)
	if h == 43 then
		zt:显示(x + 7,y + 7,format("气血:%d/%d",f.气血,f.最大气血))
		zt:显示(x + 7,y + 23,format("魔法:%d/%d",f.魔法,f.最大魔法))
		zt:显示(x + 7,y + 39,format("愤怒:%d/150",f.愤怒))
	else
		zt:显示(x + 7,y + 7,format("气血:%d/%d",f.气血,f.最大气血))
		zt:显示(x + 7,y + 23,format("魔法:%d/%d",f.魔法,f.最大魔法))
	end
end
function 系统类_提示框:自定义(x,y,txt)
	local x = x + 25
	local y = y
	self.介绍文本:清空()
	self.介绍文本:添加文本(txt)
	local w = self.介绍文本.显示表.宽度
	local h = self.介绍文本.显示表.高度
	if x + w >= 全局游戏宽度-20 then
		x = 全局游戏宽度-20 - w
	end
	if y + h >= 600 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = self.介绍文本
	self.寄存内容[1].x = x + 6
	self.寄存内容[1].y = y + 6
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end
function 系统类_提示框:装备回收(x,y,ad)
	local x = x + 30
	local y = y
	local w = 135
	local h = 415
	self.道具文本:清空()
	self.道具文本:添加文本("#Y/"..ad)
	if x < 3 then
		x = 3
	end
	if x + w >= 全局游戏宽度-20 then
		x = 全局游戏宽度-20 - w
	end
	if y + h > 600 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = png
	self.寄存内容[1].x = x+10
	self.寄存内容[1].y = y+10
	self.寄存内容[2] = {}
	self.寄存内容[2].内容 = self.道具文本
	self.寄存内容[2].x = x + 5
	self.寄存内容[2].y = y + 5
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end
function 系统类_提示框:技能(x,y,skill,冷却,ps)
	local x = x + 30
	local y = y
	local w = 243
	self.介绍文本:清空()
	self.介绍文本:添加文本("")
	self.介绍文本:添加文本("")
	self.介绍文本:添加文本(skill.介绍)
	if skill.消耗说明 ~= nil then
		self.介绍文本:添加文本("#G/消耗："..skill.消耗说明)
	end
	if skill.使用条件 ~= nil and skill.学会 == false and not tp.战斗中 and not ps then
		self.介绍文本:添加文本(format("#G/条件：%s",skill.使用条件))
	end
	if skill.冷却 ~= nil then
		self.介绍文本:添加文本(format("#G/冷却：%s",skill.冷却))
	end
	if 冷却 ~= nil then
		self.介绍文本:添加文本(format("#R/剩余冷却回合：%d回合",冷却))
	end
	local h = self.介绍文本.显示表.高度-10
	if x + w >= 全局游戏宽度-20 then
		x = 全局游戏宽度-20 - w
	end
	if y + h >= 600 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = self.介绍文本
	self.寄存内容[1].x = x + 9
	self.寄存内容[1].y = y - 5
	self.寄存内容[2] = {}
	tp.字体表.人物字体_:置阴影颜色(nil)
	self.寄存内容[2].文字 = tp.字体表.人物字体_
	self.寄存内容[2].颜色 = ARGB(255,0,255,0)
	self.寄存内容[2].文本 = skill.名称
	self.寄存内容[2].坐标 = {[1]=x+10,[2] =y+10}
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end

function 系统类_提示框:经脉技能(x,y,skill,冷却,ps)
	local x = x + 30
	local y = y
	local w = 243
	if self:取经脉介绍(skill.名称) ~= nil and self:取经脉介绍(skill.名称)[1] ~= nil and skill.名称 ~= "额外能力"  then
		skill.介绍 = self:取经脉介绍(skill.名称)[1]
	end
	self.介绍文本:清空()
	self.介绍文本:添加文本("")
	self.介绍文本:添加文本("")
	self.介绍文本:添加文本(skill.介绍)
	if skill.消耗说明 ~= nil then
		self.介绍文本:添加文本("#G/消耗："..skill.消耗说明)
	end
	if skill.使用条件 ~= nil and skill.学会 == false and not tp.战斗中 and not ps then
		self.介绍文本:添加文本(format("#G/条件：%s",skill.使用条件))
	end
	if skill.冷却 ~= nil then
		self.介绍文本:添加文本(format("#G/冷却：%s",skill.冷却))
	end
	if 冷却 ~= nil then
		self.介绍文本:添加文本(format("#R/剩余冷却回合：%d回合",冷却))
	end
	local h = self.介绍文本.显示表.高度-10
	if x + w >= 全局游戏宽度-20 then
		x = 全局游戏宽度-20 - w
	end
	if y + h >= 600 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = self.介绍文本
	self.寄存内容[1].x = x + 9
	self.寄存内容[1].y = y - 5
	self.寄存内容[2] = {}
	tp.字体表.人物字体_:置阴影颜色(nil)
	self.寄存内容[2].文字 = tp.字体表.人物字体_
	self.寄存内容[2].颜色 = ARGB(255,0,255,0)
	self.寄存内容[2].文本 = skill.名称
	self.寄存内容[2].坐标 = {[1]=x+10,[2] =y+10}
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end

function 系统类_提示框:印记(x,y,yj)
	local x = x + 25
	local y = y + 25
	local xs = 0
	self.道具文本:清空()
    for i,v in pairs(yj) do
		self.道具文本:添加文本(format("#Y/%s印记#R/%d#Y/层",i,v))
		xs = 1
	end
	if xs == 0 then
		return false
	end
	local h = self.道具文本.显示表.高度
	if x >= 全局游戏宽度-100 then
		x = 全局游戏宽度-100
	end
	if y + h > 600 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = self.道具文本
	self.寄存内容[1].x = x+7
	self.寄存内容[1].y = y+8
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=80,[4]=h}
	self.寄存内容.开启提示 = true
end
function 系统类_提示框:内丹提示(x,y,png,ad)
	local x = x + 30
	local y = y
	local w = 238
	self.道具文本:清空()
	if ad.等级 ~= nil then
	    self.道具文本:添加文本("#G/"..ad.等级.."层/5层")
	end
	self.道具文本:添加文本(ad.说明)
	if ad.效果 ~= nil then
	    self.道具文本:添加文本("#Y/"..ad.效果)
	end
	local h = self.道具文本.显示表.高度+38
	if h < 80 then
		h = 80
	end
	if x < 3 then
		x = 3
	end
	if x + w >= 全局游戏宽度-20 then
		x = 全局游戏宽度-20 - w
	end
	if y + h > 600 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = png
	self.寄存内容[1].x = x+10
	self.寄存内容[1].y = y+10
	if ad.名称 ~= nil then
	    self.寄存内容[2] = {}
		self.寄存内容[2].内容 = self.道具文本
		self.寄存内容[2].x = x + 49
		self.寄存内容[2].y = y + 30
	else
		self.寄存内容[2] = {}
		self.寄存内容[2].内容 = self.道具文本
		self.寄存内容[2].x = x + 5
		self.寄存内容[2].y = y + 48
	end
	if ad.技能 ~= nil then
		self.寄存内容[3] = {}
		self.寄存内容[3].文字 = tp.字体表.人物字体_
		self.寄存内容[3].颜色 = -256
		self.寄存内容[3].文本 = ad.技能
		self.寄存内容[3].坐标 = {[1]=x+55,[2] =y+20}
	else
		self.寄存内容[3] = {}
		self.寄存内容[3].文字 = tp.字体表.人物字体_
		self.寄存内容[3].颜色 = -256
		self.寄存内容[3].文本 = ad.名称
		self.寄存内容[3].坐标 = {[1]=x+50,[2] =y+11}
	end

	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end
function 系统类_提示框:红尘试炼(x,y,ad)
	local x = x + 30
	local y = y
	local w = 135
	local h = 15
	self.道具文本:清空()
	self.道具文本:添加文本("#Y/红尘试炼·"..(ad[5] or ad[1]))
	if x < 3 then
		x = 3
	end
	if x + w >= 全局游戏宽度-20 then
		x = 全局游戏宽度-20 - w
	end
	if y + h > 600 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = png
	self.寄存内容[1].x = x+10
	self.寄存内容[1].y = y+10
	self.寄存内容[2] = {}
	self.寄存内容[2].内容 = self.道具文本
	self.寄存内容[2].x = x + 5
	self.寄存内容[2].y = y + 5
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end
local function 取境界(j,w)
	if w==1 then
		if j == 0 then
			return "#C/略晓变化"
		elseif j == 1 then
			return "#W/略晓变化"
	    elseif j == 2 then
			return "#S/驾轻就熟"
		elseif j == 3 then
			return "#S/心领神会"
		elseif j == 4 then
			return "#S/出类拔萃"
		elseif j == 5 then
			return "#S/腾云驾雾"
		elseif j == 6 then
			return "#S/降龙伏虎"
		elseif j == 7 then
			return "#S/神乎其技"
		elseif j == 8 then
			return "#S/纵横三界"
	  	elseif j == 9 then
			return "#S/不堕轮回"
		end
 	elseif w==2 then
	 	if  j==0 or j==1 then
			return "#C/了然于胸"
		elseif j == 2 then
			return "#W/妙领天机"
		elseif j == 3 then
			return "#S/渐入佳境"
		elseif j == 4 then
			return "#S/预知福祸"
		elseif j == 5 then
			return "#S/脱胎换骨"
		elseif j == 6 then
			return "#S/出神入化"
		elseif j == 7 then
			return "#S/呼风唤雨"
		elseif j == 8 then
			return "#S/随心所欲"
		elseif j == 9 then
			return "#S/登峰造极"
	   	elseif j == 10 then
			return "#S/道满根归"
	   	elseif j == 11 then
			return "#S/不堕轮回"
	   	elseif j == 12 then
			return "#S/法力无边"
		end
  	elseif w==3 then
	 	if  j==0 or j==1 then
			return "#C/一日千里"
		elseif j == 2 then
			return "#W/脱胎换骨"
		elseif j == 3 then
			return "#S/负海担山"
		elseif j == 4 then
			return "#S/霞举飞升"
		elseif j == 5 then
			return "#S/移星换斗"
		elseif j == 6 then
			return "#S/变幻莫测"
		elseif j == 7 then
			return "#S/擎日挽月"
		elseif j == 8 then
			return "#S/道满根归"
		elseif j == 9 then
			return "#S/不堕轮回"
	   	elseif j == 10 then
			return "#S/举世无双"
	   	elseif j == 11 then
			return "#S/纵横三界"
	   	elseif j == 12 then
		 	return "#S/笑傲西游"
	   	elseif j == 13 then
		 	return "#S/法力无边"
	   	elseif j == 14 then
		 	return "#S/反璞归真"
	   	elseif j == 15 then
		 	return "#S/天人合一"
	   	end
	elseif w==4 then
		if  j==0 or j==1 then
			return "#C/一日千里"
		elseif j == 2 then
			return "#W/脱胎换骨"
		elseif j == 3 then
			return "#S/负海担山"
		elseif j == 4 then
			return "#S/霞举飞升"
		elseif j == 5 then
			return "#S/移星换斗"
		elseif j == 6 then
			return "#S/变幻莫测"
		elseif j == 7 then
			return "#S/擎日挽月"
		elseif j == 8 then
			return "#S/道满根归"
		elseif j == 9 then
			return "#S/不堕轮回"
	   	elseif j == 10 then
			return "#S/举世无双"
	   	elseif j == 11 then
			return "#S/纵横三界"
	   	elseif j == 12 then
		 	return "#S/笑傲西游"
	   	elseif j == 13 then
		 	return "#S/法力无边"
	   	elseif j == 14 then
		 	return "#S/反璞归真"
	   	elseif j == 15 then
		 	return "#S/天人合一"
		elseif j == 16 then
		 	return "#S/元神初具"
		elseif j == 17 then
		 	return "#S/再历劫尘"
		elseif j == 18 then
		 	return "#f/欲火涅槃"
	   	end
  	end
end

function 系统类_提示框:取符石组合介绍(数据)
  local jies = {}
    if 数据.符石组合=="无心插柳" then
        if 数据.等级 == 1 then
            jies.介绍="每回合第1下物理攻击怪物目标时溅射其他目标并造成当前伤害的15%伤害。"
        elseif 数据.等级 == 2 then
            jies.介绍="每回合第1下物理攻击怪物目标时溅射其他目标并造成当前伤害的20%伤害。"
        elseif 数据.等级 == 3 then
          	jies.介绍="每回合第1下物理攻击怪物目标时溅射其他目标并造成当前伤害的25%伤害。"
        elseif 数据.等级 == 4 then
          	jies.介绍="每回合第1下物理攻击怪物目标时溅射其他目标并造成当前伤害的30%伤害。"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="万丈霞光" then
        if 数据.等级 == 1 then
            jies.介绍="增加50点治疗能力，包括师门技能和特技"
        elseif 数据.等级 == 2 then
            jies.介绍="增加80点治疗能力，包括师门技能和特技"
        elseif 数据.等级 == 3 then
          jies.介绍="增加120点治疗能力，包括师门技能和特技"
        elseif 数据.等级 == 4 then
          jies.介绍="增加200点治疗能力，包括师门技能和特技"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="飞檐走壁" then
        if 数据.等级 == 1 then
            jies.介绍="释放法术时降低8%的MP消耗"
        elseif 数据.等级 == 2 then
            jies.介绍="释放法术时降低12%的MP消耗"
        elseif 数据.等级 == 3 then
          jies.介绍="释放法术时降低16%的MP消耗"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="百步穿杨" then
        if 数据.等级 == 1 then
            jies.介绍="物理类攻击时有20%的几率给目标额外造成200点伤害"
        elseif 数据.等级 == 2 then
            jies.介绍="物理类攻击时有20%的几率给目标额外造成450点伤害"
        elseif 数据.等级 == 3 then
          jies.介绍="物理类攻击时有20%的几率给目标额外造成600点伤害"
        elseif 数据.等级 == 4 then
          jies.介绍="物理类攻击时有20%的几率给目标额外造成800点伤害"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="隔山打牛" then
        if 数据.等级 == 1 then
            jies.介绍="法术攻击时有20%的几率临时提升自身80点灵力"
        elseif 数据.等级 == 2 then
            jies.介绍="法术攻击时有20%的几率临时提升自身120点灵力"
        elseif 数据.等级 == 3 then
          jies.介绍="法术攻击时有25%的几率临时提升自身170点灵力"
        elseif 数据.等级 == 4 then
          jies.介绍="法术攻击时有25%的几率临时提升自身200点灵力"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="心随我动" then
        if 数据.等级 == 1 then
            jies.介绍="遭受物理类攻击时有25%几率抵挡250点伤害"
        elseif 数据.等级 == 2 then
            jies.介绍="遭受物理攻击时有25%几率抵挡400点伤害"
        elseif 数据.等级 == 3 then
          jies.介绍="遭受物理类攻击时有25%几率抵挡700点伤害"
        elseif 数据.等级 == 4 then
          jies.介绍="遭受物理类攻击时有25%几率抵挡900点伤害"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="云随风舞" then
        if 数据.等级 == 1 then
            jies.介绍="遭受法术攻击时有20%几率抵挡200点伤害"
        elseif 数据.等级 == 2 then
            jies.介绍="遭受法术攻击时有20%几率抵挡400点伤害"
        elseif 数据.等级 == 3 then
          jies.介绍="遭受法术攻击时有20%几率抵挡700点伤害"
        elseif 数据.等级 == 4 then
          jies.介绍="遭受法术攻击时有20%几率抵挡800点伤害"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="风卷残云" then
        if 数据.等级 == 1 then
          jies.介绍="击倒鬼魂目标时有5%几率将其打飞出场"
        elseif 数据.等级 == 2 then
          jies.介绍="击倒鬼魂目标时有10%几率将其打飞出场"
        elseif 数据.等级 == 3 then
          jies.介绍="击倒鬼魂目标时有15%几率将其打飞出场"
        elseif 数据.等级 == 4 then
          jies.介绍="击倒鬼魂目标时有20%几率将其打飞出场"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="天降大任" then
        if 数据.等级 == 1 then
          jies.介绍="无视召唤兽5%的物理防御进行攻击。(该组合全身只有一件装备起效)"
        elseif 数据.等级 == 2 then
          jies.介绍="无视召唤兽10%的物理防御进行攻击。(该组合全身只有一件装备起效)"
        elseif 数据.等级 == 3 then
          jies.介绍="无视召唤兽15%的物理防御进行攻击。(该组合全身只有一件装备起效)"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="无懈可击" then
        jies.介绍="提升自身30点防御力"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="望穿秋水" then
        jies.介绍="提升自身30点灵力"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="凤舞九天" then
        jies.介绍="提升自身30点灵力"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="君临天下" then
        jies.介绍="提升自身40点伤害"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="势如破竹" then
        jies.介绍="提升自身40点速度"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="不动明王" then
        jies.介绍="提升自身60点防御"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="万里横行" then
        jies.介绍="提升自身40点伤害"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="日落西山" then
        jies.介绍="提升自身40点速度"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="网罗乾坤" then
        if 数据.等级 == 1 then
        jies.介绍="使用天罗地网时，增加人物等级/2的伤害"
        elseif 数据.等级 == 2 then
        jies.介绍="使用天罗地网时，增加人物等级/1.5的伤害"
        elseif 数据.等级 == 3 then
        jies.介绍="使用天罗地网时，增加人物等级的伤害"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "所有"
    elseif 数据.符石组合=="石破天惊" then
        if 数据.等级 == 1 then
            jies.介绍="使用落雷符时增加人物等级/2的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 2 then
            jies.介绍="使用落雷符时增加人物等级/1.5的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 3 then
          jies.介绍="使用落雷符时增加人物等级的伤害，装备该组合时降低5%的防御"
        end
        jies.门派 = "方寸山"
        jies.部位 = "所有"
    elseif 数据.符石组合=="天雷地火" then
        if 数据.等级 == 1 then
            jies.介绍="使用天雷斩、雷霆万钧时增加人物等级/2的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 2 then
            jies.介绍="使用天雷斩、雷霆万钧时增加人物等级/1.5的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 3 then
          jies.介绍="使用天雷斩、雷霆万钧时增加人物等级的伤害，装备该组合时降低5%的防御"
        end
        jies.门派 = "天宫"
        jies.部位 = "所有"
    elseif 数据.符石组合=="烟雨飘摇" then
        if 数据.等级 == 1 then
            jies.介绍="使用烟雨剑法、飘渺式时增加人物等级/2的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 2 then
            jies.介绍="使用烟雨剑法、飘渺式时增加人物等级/1.5的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 3 then
          jies.介绍="使用烟雨剑法、飘渺式时增加人物等级的伤害，装备该组合时降低5%的防御"
        end
        jies.门派 = "五庄观"
        jies.部位 = "所有"
    elseif 数据.符石组合=="索命无常" then
        if 数据.等级 == 1 then
            jies.介绍="使用阎罗令时，增加人物等级/2的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 2 then
            jies.介绍="使用阎罗令时，增加人物等级/1.5的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 3 then
          jies.介绍="使用阎罗令时，增加人物等级的伤害，装备该组合时降低5%的防御"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "所有"
    elseif 数据.符石组合=="行云流水" then
        if 数据.等级 == 1 then
            jies.介绍="使用五行法术时，增加人物等级/2的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 2 then
            jies.介绍="使用五行法术时，增加人物等级/1.5的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 3 then
          jies.介绍="使用五行法术时，增加人物等级的伤害，装备该组合时降低5%的防御"
        end
        jies.门派 = "普陀山"
        jies.部位 = "所有"
    elseif 数据.符石组合=="福泽天下" then
        if 数据.等级 == 1 then
            jies.介绍="使用唧唧歪歪时，增加人物等级/2的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 2 then
            jies.介绍="使用唧唧歪歪时，增加人物等级/2的伤害，装备该组合时降低5%的防御"
        elseif 数据.等级 == 3 then
          jies.介绍="使用唧唧歪歪时，增加人物等级/2的伤害，装备该组合时降低5%的防御"
        end
        jies.门派 = "化生寺"
        jies.部位 = "所有"
    elseif 数据.符石组合=="暗度陈仓" then
        jies.介绍="受到物理攻击时，降低3%的所受伤害。"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="点石成金" then
        jies.介绍="防御时，遭受物理攻击所受到的伤害降低20%"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="化敌为友" then
        jies.介绍="受到法术攻击时，降低3%的所受伤害。"
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="凤舞九天" then
        jies.介绍="使用暗器时增加人物等级×1的伤害"
        jies.门派 = "女儿村"
        jies.部位 = "所有"
    elseif 数据.符石组合=="高山流水" then
        if 数据.等级 == 1 then
            jies.介绍="增加人物等级/3+30的法术伤害。(该组合全身只有一件装备起效)"
        elseif 数据.等级 == 2 then
            jies.介绍="增加人物等级/2+30的法术伤害。(该组合全身只有一件装备起效)"
        elseif 数据.等级 == 3 then
          jies.介绍="增加人物等级+30的法术伤害。(该组合全身只有一件装备起效)"
        end
        jies.门派 = "无"
        jies.部位 = "所有"
    elseif 数据.符石组合=="百无禁忌" then
        if 数据.等级 == 1 then
            jies.介绍="提高自身4%对抗封印类技能的能力"
        elseif 数据.等级 == 2 then
            jies.介绍="提高自身8%对抗封印类技能的能力"
        elseif 数据.等级 == 3 then
          jies.介绍="提高自身12%对抗封印类技能的能力"
        end
        jies.门派 = "无"
        jies.部位 = "靴"
    elseif 数据.符石组合=="为官之道符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能为官之道等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能为官之道等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能为官之道等级6级"
        end
        jies.门派 = "大唐官府"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="黄庭经符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能黄庭经等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能黄庭经等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能黄庭经等级6级"
        end
        jies.门派 = "方寸山"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="小乘佛法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能小乘佛法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能小乘佛法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能小乘佛法等级6级"
        end
        jies.门派 = "化生寺"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="毒经符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能毒经等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能毒经等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能毒经等级6级"
        end
        jies.门派 = "女儿村"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="天罡气符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能天罡气等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能天罡气等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能天罡气等级6级"
        end
        jies.门派 = "天宫"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="九龙诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能九龙诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能九龙诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能九龙诀等级6级"
        end
        jies.门派 = "龙宫"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="周易学符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能周易学等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能周易学等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能周易学等级6级"
        end
        jies.门派 = "五庄观"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="灵性符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能灵性等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能灵性等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能灵性等级6级"
        end
        jies.门派 = "普陀山"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="灵通术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能灵通术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能灵通术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能灵通术等级6级"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="牛逼神功符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能牛逼神功等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能牛逼神功等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能牛逼神功等级6级"
        end
        jies.门派 = "魔王寨"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="魔兽神功符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能魔兽神功等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能魔兽神功等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能魔兽神功等级6级"
        end
        jies.门派 = "狮驼岭"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="蛛丝阵法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能蛛丝阵法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能蛛丝阵法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能蛛丝阵法等级6级"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="文韬武略符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能文韬武略等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能文韬武略等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能文韬武略等级6级"
        end
        jies.门派 = "大唐官府"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="归元心法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能归元心法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能归元心法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能归元心法等级6级"
        end
        jies.门派 = "方寸山"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="佛光普照符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能佛光普照等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能佛光普照等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能佛光普照等级6级"
        end
        jies.门派 = "化生寺"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="倾国倾城符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能倾国倾城等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能倾国倾城等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能倾国倾城等级6级"
        end
        jies.门派 = "女儿村"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="傲世诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能傲世诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能傲世诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能傲世诀等级6级"
        end
        jies.门派 = "天宫"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="逆鳞符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能逆鳞等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能逆鳞等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能逆鳞等级6级"
        end
        jies.门派 = "龙宫"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="明性修身符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能明性修身等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能明性修身等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能明性修身等级6级"
        end
        jies.门派 = "五庄观"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="五行扭转符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能五行扭转等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能五行扭转等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能五行扭转等级6级"
        end
        jies.门派 = "普陀山"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="拘魂诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能拘魂诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能拘魂诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能拘魂诀等级6级"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="回身击符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能回身击等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能回身击等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能回身击等级6级"
        end
        jies.门派 = "魔王寨"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="魔兽反嗜符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能魔兽反噬等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能魔兽反噬等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能魔兽反噬等级6级"
        end
        jies.门派 = "狮驼岭"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="盘丝大法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能盘丝大法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能盘丝大法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能盘丝大法等级6级"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="化神以灵符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能化神以灵等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能化神以灵等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能化神以灵等级6级"
        end
        jies.门派 = "女魃墓"
        jies.部位 = "武器"
    elseif 数据.符石组合=="十方无敌符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能十方无敌等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能十方无敌等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能十方无敌等级6级"
        end
        jies.门派 = "大唐官府"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="符之术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能符之术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能符之术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能符之术等级6级"
        end
        jies.门派 = "方寸山"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="歧黄之术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能歧黄之术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能歧黄之术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能歧黄之术等级6级"
        end
        jies.门派 = "化生寺"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="闭月羞花符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能闭月羞花等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能闭月羞花等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能闭月羞花等级6级"
        end
        jies.门派 = "女儿村"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="乾坤塔符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能乾坤塔等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能乾坤塔等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能乾坤塔等级6级"
        end
        jies.门派 = "天宫"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="呼风唤雨符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能呼风唤雨等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能呼风唤雨等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能呼风唤雨等级6级"
        end
        jies.门派 = "龙宫"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="乾坤袖符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能乾坤袖等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能乾坤袖等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能乾坤袖等级6级"
        end
        jies.门派 = "五庄观"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="金刚经符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能金刚经等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能金刚经等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能金刚经等级6级"
        end
        jies.门派 = "普陀山"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="幽冥术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能幽冥术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能幽冥术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能幽冥术等级6级"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="火牛阵符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能火牛阵等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能火牛阵等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能火牛阵等级6级"
        end
        jies.门派 = "魔王寨"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="生死搏符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能生死搏等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能生死搏等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能生死搏等级6级"
        end
        jies.门派 = "狮驼岭"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="催情大法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能催情大法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能催情大法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能催情大法等级6级"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="神兵鉴赏符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能神兵鉴赏等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能神兵鉴赏等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能神兵鉴赏等级6级"
        end
        jies.门派 = "大唐官府"
        jies.部位 = "武器"
    elseif 数据.符石组合=="霹雳咒符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能霹雳咒等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能霹雳咒等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能霹雳咒等级6级"
        end
        jies.门派 = "方寸山"
        jies.部位 = "武器"
    elseif 数据.符石组合=="诵经符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能诵经等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能诵经等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能诵经等级6级"
        end
        jies.门派 = "化生寺"
        jies.部位 = "武器"
    elseif 数据.符石组合=="沉鱼落雁符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能沉鱼落雁等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能沉鱼落雁等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能沉鱼落雁等级6级"
        end
        jies.门派 = "女儿村"
        jies.部位 = "武器"
    elseif 数据.符石组合=="宁气诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能宁气诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能宁气诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能宁气诀等级6级"
        end
        jies.门派 = "天宫"
        jies.部位 = "武器"
    elseif 数据.符石组合=="破浪诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能破浪诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能破浪诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能破浪诀等级6级"
        end
        jies.门派 = "龙宫"
        jies.部位 = "武器"
    elseif 数据.符石组合=="潇湘仙雨符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能潇湘仙雨等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能潇湘仙雨等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能潇湘仙雨等级6级"
        end
        jies.门派 = "五庄观"
        jies.部位 = "武器"
    elseif 数据.符石组合=="五行学说符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能五行学说等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能五行学说等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能五行学说等级6级"
        end
        jies.门派 = "普陀山"
        jies.部位 = "武器"
    elseif 数据.符石组合=="尸腐恶符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能尸腐恶等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能尸腐恶等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能尸腐恶等级6级"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "武器"
    elseif 数据.符石组合=="牛虱阵符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能牛虱阵等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能牛虱阵等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能牛虱阵等级6级"
        end
        jies.门派 = "魔王寨"
        jies.部位 = "武器"
    elseif 数据.符石组合=="阴阳二气诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能阴阳二气诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能阴阳二气诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能阴阳二气诀等级6级"
        end
        jies.门派 = "狮驼岭"
        jies.部位 = "武器"
    elseif 数据.符石组合=="姊妹相随符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能姊妹相随等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能姊妹相随等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能姊妹相随等级6级"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "武器"
    elseif 数据.符石组合=="无双一击符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能无双一击等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能无双一击等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能无双一击等级6级"
        end
        jies.门派 = "大唐官府"
        jies.部位 = "武器"
    elseif 数据.符石组合=="磬龙灭法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能磬龙灭法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能磬龙灭法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能磬龙灭法等级6级"
        end
        jies.门派 = "方寸山"
        jies.部位 = "武器"
    elseif 数据.符石组合=="金刚伏魔符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能金刚伏魔等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能金刚伏魔等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能金刚伏魔等级6级"
        end
        jies.门派 = "化生寺"
        jies.部位 = "武器"
    elseif 数据.符石组合=="玉质冰肌符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能玉质冰肌等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能玉质冰肌等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能玉质冰肌等级6级"
        end
        jies.门派 = "女儿村"
        jies.部位 = "武器"
    elseif 数据.符石组合=="混天术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能混天术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能混天术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能混天术等级6级"
        end
        jies.门派 = "天宫"
        jies.部位 = "武器"
    elseif 数据.符石组合=="龙附符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能龙附等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能龙附等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能龙附等级6级"
        end
        jies.门派 = "龙宫"
        jies.部位 = "武器"
    elseif 数据.符石组合=="修仙术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能修仙术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能修仙术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能修仙术等级6级"
        end
        jies.门派 = "五庄观"
        jies.部位 = "武器"
    elseif 数据.符石组合=="护法金刚符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能护法金刚等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能护法金刚等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能护法金刚等级6级"
        end
        jies.门派 = "普陀山"
        jies.部位 = "武器"
    elseif 数据.符石组合=="六道轮回符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能六道轮回等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能六道轮回等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能六道轮回等级6级"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "武器"
    elseif 数据.符石组合=="震天诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能震天诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能震天诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能震天诀等级6级"
        end
        jies.门派 = "魔王寨"
        jies.部位 = "武器"
    elseif 数据.符石组合=="狂兽诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能狂兽诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能狂兽诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能狂兽诀等级6级"
        end
        jies.门派 = "狮驼岭"
        jies.部位 = "武器"
    elseif 数据.符石组合=="秋波暗送符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能秋波暗送等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能秋波暗送等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能秋波暗送等级6级"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "武器"
    elseif 数据.符石组合=="紫薇之术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能紫薇之术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能紫薇之术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能紫薇之术等级6级"
        end
        jies.门派 = "大唐官府"
        jies.部位 = "项链"
    elseif 数据.符石组合=="神道无念符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能神道无念等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能神道无念等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能神道无念等级6级"
        end
        jies.门派 = "方寸山"
        jies.部位 = "项链"
    elseif 数据.符石组合=="大慈大悲符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能大慈大悲等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能大慈大悲等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能大慈大悲等级6级"
        end
        jies.门派 = "化生寺"
        jies.部位 = "项链"
    elseif 数据.符石组合=="香飘兰麝符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能香飘兰麝等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能香飘兰麝等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能香飘兰麝等级6级"
        end
        jies.门派 = "女儿村"
        jies.部位 = "项链"
    elseif 数据.符石组合=="清明自在符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能清明自在等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能清明自在等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能清明自在等级6级"
        end
        jies.门派 = "天宫"
        jies.部位 = "项链"
    elseif 数据.符石组合=="龙腾符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能龙腾等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能龙腾等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能龙腾等级6级"
        end
        jies.门派 = "龙宫"
        jies.部位 = "项链"
    elseif 数据.符石组合=="混元道果符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能混元道果等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能混元道果等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能混元道果等级6级"
        end
        jies.门派 = "五庄观"
        jies.部位 = "项链"
    elseif 数据.符石组合=="观音咒符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能观音咒等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能观音咒等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能观音咒等级6级"
        end
        jies.门派 = "普陀山"
        jies.部位 = "项链"
    elseif 数据.符石组合=="九幽阴魂符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能九幽阴魂等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能九幽阴魂等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能九幽阴魂等级6级"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "项链"
    elseif 数据.符石组合=="火云术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能火云术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能火云术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能火云术等级6级"
        end
        jies.门派 = "魔王寨"
        jies.部位 = "项链"
    elseif 数据.符石组合=="训兽诀符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能训兽诀等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能训兽诀等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能训兽诀等级6级"
        end
        jies.门派 = "狮驼岭"
        jies.部位 = "项链"
    elseif 数据.符石组合=="天外魔音符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能天外魔音等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能天外魔音等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能天外魔音等级6级"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "项链"
    elseif 数据.符石组合=="疾风步符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能疾风步等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能疾风步等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能疾风步等级6级"
        end
        jies.门派 = "大唐官府"
        jies.部位 = "靴"
    elseif 数据.符石组合=="斜月步符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能斜月步等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能斜月步等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能斜月步等级6级"
        end
        jies.门派 = "方寸山"
        jies.部位 = "靴"
    elseif 数据.符石组合=="渡世步符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能渡世步等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能渡世步等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能渡世步等级6级"
        end
        jies.门派 = "化生寺"
        jies.部位 = "靴"
    elseif 数据.符石组合=="清歌妙舞符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能清歌妙舞等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能清歌妙舞等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能清歌妙舞等级6级"
        end
        jies.门派 = "女儿村"
        jies.部位 = "靴"
    elseif 数据.符石组合=="云霄步符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能云霄步等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能云霄步等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能云霄步等级6级"
        end
        jies.门派 = "天宫"
        jies.部位 = "靴"
    elseif 数据.符石组合=="游龙术符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能游龙术等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能游龙术等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能游龙术等级6级"
        end
        jies.门派 = "龙宫"
        jies.部位 = "靴"
    elseif 数据.符石组合=="七星遁符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能七星遁等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能七星遁等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能七星遁等级6级"
        end
        jies.门派 = "五庄观"
        jies.部位 = "靴"
    elseif 数据.符石组合=="莲花宝座符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能莲花宝座等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能莲花宝座等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能莲花宝座等级6级"
        end
        jies.门派 = "普陀山"
        jies.部位 = "靴"
    elseif 数据.符石组合=="无常步符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能无常步等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能无常步等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能无常步等级6级"
        end
        jies.门派 = "阴曹地府"
        jies.部位 = "靴"
    elseif 数据.符石组合=="裂石步符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能裂石步等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能裂石步等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能裂石步等级6级"
        end
        jies.门派 = "魔王寨"
        jies.部位 = "靴"
    elseif 数据.符石组合=="大鹏展翅符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能大鹏展翅等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能大鹏展翅等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能大鹏展翅等级6级"
        end
        jies.门派 = "狮驼岭"
        jies.部位 = "靴"
    elseif 数据.符石组合=="移形换影符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能移形换影等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能移形换影等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能移形换影等级6级"
        end
        jies.门派 = "盘丝洞"
        jies.部位 = "靴"
    --凌波城
    elseif 数据.符石组合=="天地无极符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能天地无极等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能天地无极等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能天地无极等级6级"
        end
        jies.门派 = "凌波城"
        jies.部位 = "武器"
    elseif 数据.符石组合=="啸傲符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能啸傲等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能啸傲等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能啸傲等级6级"
        end
        jies.门派 = "凌波城"
        jies.部位 = "武器"
    elseif 数据.符石组合=="法天象地符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能法天象地等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能法天象地等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能法天象地等级6级"
        end
        jies.门派 = "凌波城"
        jies.部位 = "靴"
    elseif 数据.符石组合=="气吞山河符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能气吞山河等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能气吞山河等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能气吞山河等级6级"
        end
        jies.门派 = "凌波城"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="武神显圣符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能武神显圣等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能武神显圣等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能武神显圣等级6级"
        end
        jies.门派 = "凌波城"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="诛魔符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能诛魔等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能诛魔等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能诛魔等级6级"
        end
        jies.门派 = "凌波城"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="九转玄功符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能九转玄功等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能九转玄功等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能九转玄功等级6级"
        end
        jies.门派 = "凌波城"
        jies.部位 = "项链"
    --神木林
    elseif 数据.符石组合=="天人庇护符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能天人庇护等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能天人庇护等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能天人庇护等级6级"
        end
        jies.门派 = "神木林"
        jies.部位 = "武器"
    elseif 数据.符石组合=="神木恩泽符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能神木恩泽等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能神木恩泽等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能神木恩泽等级6级"
        end
        jies.门派 = "神木林"
        jies.部位 = "武器"
    elseif 数据.符石组合=="驭灵咒符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能驭灵咒等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能驭灵咒等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能驭灵咒等级6级"
        end
        jies.门派 = "神木林"
        jies.部位 = "靴"
    elseif 数据.符石组合=="瞬息万变符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能瞬息万变等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能瞬息万变等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能瞬息万变等级6级"
        end
        jies.门派 = "神木林"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="万物轮转符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能万物轮转等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能万物轮转等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能万物轮转等级6级"
        end
        jies.门派 = "神木林"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="巫咒符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能巫咒等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能巫咒等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能巫咒等级6级"
        end
        jies.门派 = "神木林"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="万灵诸念符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能万灵诸念等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能万灵诸念等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能万灵诸念等级6级"
        end
        jies.门派 = "神木林"
        jies.部位 = "项链"
    --无底洞
    elseif 数据.符石组合=="秘影迷踪符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能秘影迷踪等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能秘影迷踪等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能秘影迷踪等级6级"
        end
        jies.门派 = "无底洞"
        jies.部位 = "武器"
    elseif 数据.符石组合=="混元神功符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能混元神功等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能混元神功等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能混元神功等级6级"
        end
        jies.门派 = "无底洞"
        jies.部位 = "武器"
    elseif 数据.符石组合=="鬼蛊灵蕴符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能鬼蛊灵蕴等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能鬼蛊灵蕴等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能鬼蛊灵蕴等级6级"
        end
        jies.门派 = "无底洞"
        jies.部位 = "靴"
    elseif 数据.符石组合=="阴风绝章符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能阴风绝章等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能阴风绝章等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能阴风绝章等级6级"
        end
        jies.门派 = "无底洞"
        jies.部位 = "铠甲/女衣"
    elseif 数据.符石组合=="地冥妙法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能地冥妙法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能地冥妙法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能地冥妙法等级6级"
        end
        jies.门派 = "无底洞"
        jies.部位 = "腰带"
    elseif 数据.符石组合=="燃灯灵宝符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能燃灯灵宝等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能燃灯灵宝等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能燃灯灵宝等级6级"
        end
        jies.门派 = "无底洞"
        jies.部位 = "头盔/发钗"
    elseif 数据.符石组合=="枯骨心法符石" then
        if 数据.等级 == 1 then
            jies.介绍="增加门派技能枯骨心法等级2级"
        elseif 数据.等级 == 2 then
            jies.介绍="增加门派技能枯骨心法等级4级"
        elseif 数据.等级 == 3 then
          jies.介绍="增加门派技能枯骨心法等级6级"
        end
        jies.门派 = "无底洞"
        jies.部位 = "项链"
   	end
  return jies
end


function 系统类_提示框:特性(x,y,ad,ac,aa)
 local xa ={}
	local x = x-80
	local y = y+15
	self.介绍文本:清空()

 if ad == "力破" and aa == 1 then
        xa ={"#G/80#Y/","#R/10#Y/"}
	elseif ad == "力破" and aa == 2 then
         xa ={"#G/120#Y/","#R/10#Y/"}
	elseif ad == "力破" and aa == 3 then
		xa ={"#G/160#Y/","#R/5%#Y/"}
	elseif ad == "力破" and aa == 4 then
		xa ={"#G/200#Y/","#R/5%#Y/"}
	elseif ad == "力破" and aa == 5 then
		xa ={"#G/240#Y/","#R/5%#Y/"}
    elseif ad == "识物" and aa == 1 then
        xa ={"#G/5%#Y/","#R/8#Y/"}
	elseif ad == "识物" and aa == 2 then
		 xa ={"#G/8%#Y/","#R/8#Y/"}
	elseif ad == "识物" and aa == 3 then
		 xa ={"#G/10%#Y/","#R/4#Y/"}
	elseif ad == "识物" and aa == 4 then
		 xa ={"#G/13%#Y/","#R/4#Y/"}
    elseif ad == "识物" and aa == 5 then
    	 xa ={"#G/16%#Y/","#R/4#Y/"}
	elseif ad == "灵刃" and aa == 1 then
		 xa ={"#G/33%#Y/","#R/10%#Y/"}
	elseif ad == "灵刃" and aa == 2 then
		 xa ={"#G/50%#Y/","#R/10%#Y/"}
	elseif ad == "灵刃" and aa == 3 then
		 xa ={"#G/66%#Y/","#R/5%#Y/"}
    elseif ad == "灵刃" and aa == 4 then
    	 xa ={"#G/83%#Y/","#R/5%#Y/"}
	elseif ad == "灵刃" and aa == 5 then
		 xa ={"#G/100%#Y/","#R/5%#Y/"}
	elseif ad == "瞬击" and aa == 1 then
		 xa ={"#G/33%#Y/","#R/10%#Y/"}
	elseif ad == "瞬击" and aa == 2 then
		 xa ={"#G/50%#Y/","#R/10%#Y/"}
    elseif ad == "瞬击" and aa == 3 then
    	 xa ={"#G/66%#Y/","#R/5%#Y/"}
	elseif ad == "瞬击" and aa == 4 then
		 xa ={"#G/83%#Y/","#R/5%#Y/"}
	elseif ad == "瞬击" and aa == 5 then
		 xa ={"#G/100%#Y/","#R/5%#Y/"}
	elseif ad == "复仇" and aa == 1 then
		 xa ={"#G/33%#Y/","#R/10%#Y/"}
	elseif ad == "复仇" and aa == 2 then
		 xa ={"#G/50%#Y/","#R/10%#Y/"}
    elseif ad == "复仇" and aa == 3 then
    	 xa ={"#G/66%#Y/","#R/5%#Y/"}
	elseif ad == "复仇" and aa == 4 then
		 xa ={"#G/83%#Y/","#R/5%#Y/"}
	elseif ad == "复仇" and aa == 5 then
		 xa ={"#G/100%#Y/","#R/5%#Y/"}
	elseif ad == "弑神" and aa == 1 then
		 xa ={"#G/60#Y/","#R/40%#Y/"}
	elseif ad == "弑神" and aa == 2 then
		 xa ={"#G/90#Y/","#R/40%#Y/"}
    elseif ad == "弑神" and aa == 3 then
    	 xa ={"#G/120#Y/","#R/20%#Y/"}
	elseif ad == "弑神" and aa == 4 then
		 xa ={"#G/150#Y/","#R/20%#Y/"}
	elseif ad == "弑神" and aa == 5 then
		 xa ={"#G/180%#Y/","#R/20%#Y/"}
	elseif ad == "吮魔" and aa == 1 then
		 xa ={"#G/1%#Y/","#R/1%#Y/"}
	elseif ad == "吮魔" and aa == 2 then
		 xa ={"#G/2%#Y/","#R/1%#Y/"}
    elseif ad == "吮魔" and aa == 3 then
    	 xa ={"#G/3%#Y/","#R/5%#Y/"}
	elseif ad == "吮魔" and aa == 4 then
		 xa ={"#G/4%#Y/","#R/5%#Y/"}
	elseif ad == "吮魔" and aa == 5 then
		 xa ={"#G/5%#Y/","#R/5%#Y/"}
	elseif ad == "自恋" and aa == 1 then
        xa ={"#G/33%#Y/","#R/8#Y/"}
    elseif ad == "自恋" and aa == 2 then
    	 xa ={"#G/50%#Y/","#R/8#Y/"}
	elseif ad == "自恋" and aa == 3 then
		 xa ={"#G/66%#Y/","#R/4#Y/"}
	elseif ad == "自恋" and aa == 4 then
		 xa ={"#G/83%#Y/","#R/4#Y/"}
	elseif ad == "自恋" and aa == 5 then
		 xa ={"#G/100%#Y/","#R/4#Y/"}
    elseif ad == "乖巧" and aa == 1 then
        xa ={"#G/6%#Y/","#R/8#Y/"}
	elseif ad == "乖巧" and aa == 2 then
		xa ={"#G/10%#Y/","#R/8#Y/"}
	elseif ad == "乖巧" and aa == 3 then
		xa ={"#G/13%#Y/","#R/4#Y/"}
	elseif ad == "乖巧" and aa == 4 then
		xa ={"#G/16%#Y/","#R/4#Y/"}
    elseif ad == "乖巧" and aa == 5 then
    	xa ={"#G/20%#Y/","#R/4#Y/"}
	elseif ad == "灵动" and aa == 1 then
	    xa ={"#G/5%#Y/","#R/8#Y/"}
	elseif ad == "灵动" and aa == 2 then
		xa ={"#G/10%#Y/","#R/8#Y/"}
	elseif ad == "灵动" and aa == 3 then
		xa ={"#G/15%#Y/","#R/4#Y/"}
    elseif ad == "灵动" and aa == 4 then
    	xa ={"#G/20%#Y/","#R/4#Y/"}
	elseif ad == "灵动" and aa == 5 then
		xa ={"#G/25%#Y/","#R/4#Y/"}
	elseif ad == "逆境" and aa == 1 then
       xa ={"#G/33%#Y/","#R/30%#Y/"}
	elseif ad == "逆境" and aa == 2 then
		xa ={"#G/50%#Y/","#R/30%#Y/"}
    elseif ad == "逆境" and aa == 3 then
    	xa ={"#G/66%#Y/","#R/15%#Y/"}
	elseif ad == "逆境" and aa == 4 then
		xa ={"#G/83%#Y/","#R/15%#Y/"}
	elseif ad == "逆境" and aa == 5 then
		xa ={"#G/100%#Y/","#R/10%#Y/"}
	elseif ad == "灵断" and aa == 1 then
        xa ={"#G/33%#Y/","#R/5%#Y/"}
    elseif ad == "灵断" and aa == 2 then
        xa ={"#G/50%#Y/","#R/10%#Y/"}
	elseif ad == "灵断" and aa == 3 then
		xa ={"#G/66%#Y/","#R/5%#Y/"}
	elseif ad == "灵断" and aa == 4 then
		xa ={"#G/83%#Y/","#R/5%#Y/"}
	elseif ad == "灵断" and aa == 5 then
		xa ={"#G/100%#Y/","#R/5%#Y/"}
    elseif ad == "争锋" and aa == 1 then
        xa ={"#G/6%#Y/","#R/90#Y/"}
	elseif ad == "争锋" and aa == 2 then
		xa ={"#G/10%#Y/","#R/90#Y/"}
	elseif ad == "争锋" and aa == 3 then
		xa ={"#G/13%#Y/","#R/90#Y/"}
	elseif ad == "争锋" and aa == 4 then
		xa ={"#G/16%#Y/","#R/180#Y/"}
    elseif ad == "争锋" and aa == 5 then
    	xa ={"#G/20%#Y/","#R/180#Y/"}
	elseif ad == "暗劲" and aa == 1 then
       xa ={"#G/6%#Y/","#R/40%#Y/"}
	elseif ad == "暗劲" and aa == 2 then
		xa ={"#G/10%#Y/","#R/20%#Y/"}
	elseif ad == "暗劲" and aa == 3 then
		xa ={"#G/13%#Y/","#R/20%#Y/"}
    elseif ad == "暗劲" and aa == 4 then
    	xa ={"#G/16%#Y/","#R/20%#Y/"}
	elseif ad == "暗劲" and aa == 5 then
		xa ={"#G/20%#Y/","#R/20%#Y/"}
	elseif ad == "顺势" and aa == 1 then
       xa ={"#G/60#Y/","#R/180#Y/"}
	elseif ad == "顺势" and aa == 2 then
		xa ={"#G/90#Y/","#R/90#Y/"}
	elseif ad == "顺势" and aa == 3 then
		xa ={"#G/120#Y/","#R/90#Y/"}
    elseif ad == "顺势" and aa == 4 then
    	xa ={"#G/150#Y/","#R/90#Y/"}
	elseif ad == "顺势" and aa == 5 then
		xa ={"#G/180#Y/","#R/90#Y/"}
	elseif ad == "阳护" and aa == 1 then
       xa ={"#G/33%#Y/","#R/30%#Y/"}
	elseif ad == "阳护" and aa == 2 then
		xa ={"#G/50%#Y/","#R/15%#Y/"}
	elseif ad == "阳护" and aa == 3 then
		xa ={"#G/66%#Y/","#R/15%#Y/"}
    elseif ad == "阳护" and aa == 4 then
    	xa ={"#G/83%#Y/","#R/15%#Y/"}
	elseif ad == "阳护" and aa == 5 then
		xa ={"#G/100%#Y/","#R/15%#Y/"}
	elseif ad == "预知" and aa == 1 then
       xa ={"#G/10%#Y/","#R/8#Y/"}
	elseif ad == "预知" and aa == 2 then
		xa ={"#G/16%#Y/","#R/4#Y/"}
	elseif ad == "预知" and aa == 3 then
		xa ={"#G/21%#Y/","#R/4#Y/"}
    elseif ad == "预知" and aa == 4 then
    	xa ={"#G/26%#Y/","#R/4#Y/"}
	elseif ad == "预知" and aa == 5 then
		xa ={"#G/32%#Y/","#R/4#Y/"}
	elseif ad == "识药" and aa == 1 then
       xa ={"#G/1.2%#Y/","#R/20%#Y/"}
	elseif ad == "识药" and aa == 2 then
		xa ={"#G/2.4%#Y/","#R/10%#Y/"}
	elseif ad == "识药" and aa == 3 then
		xa ={"#G/3.6%#Y/","#R/10%#Y/"}
    elseif ad == "识药" and aa == 4 then
    	xa ={"#G/4.8%#Y/","#R/10%#Y/"}
	elseif ad == "识药" and aa == 5 then
		xa ={"#G/6.0%#Y/","#R/10%#Y/"}
	elseif ad == "御风" and aa == 1 then
       xa ={"#G/5#Y/","#R/10%#Y/"}
	elseif ad == "御风" and aa == 2 then
		xa ={"#G/10#Y/","#R/10%#Y/"}
	elseif ad == "御风" and aa == 3 then
		xa ={"#G/15#Y/","#R/10%#Y/"}
    elseif ad == "御风" and aa == 4 then
    	xa ={"#G/20#Y/","#R/10%#Y/"}
	elseif ad == "御风" and aa == 5 then
		xa ={"#G/25#Y/","#R/10%#Y/"}
	elseif ad == "瞬法" and aa == 1 then
       xa ={"#G/33%#Y/","#R/10%#Y/"}
	elseif ad == "瞬法" and aa == 2 then
		xa ={"#G/50%#Y/","#R/10%#Y/"}
	elseif ad == "瞬法" and aa == 3 then
		xa ={"#G/66%#Y/","#R/5%#Y/"}
    elseif ad == "瞬法" and aa == 4 then
    	xa ={"#G/83%#Y/","#R/5%#Y/"}
	elseif ad == "瞬法" and aa == 5 then
		xa ={"#G/100%#Y/","#R/5%#Y/"}
	elseif ad == "灵法" and aa == 1 then
       xa ={"#G/5%#Y/","#R/10%#Y/"}
	elseif ad == "灵法" and aa == 2 then
		xa ={"#G/10%#Y/","#R/10%#Y/"}
	elseif ad == "灵法" and aa == 3 then
		xa ={"#G/15%#Y/","#R/10%#Y/"}
    elseif ad == "灵法" and aa == 4 then
    	xa ={"#G/20%#Y/","#R/10%#Y/"}
	elseif ad == "灵法" and aa == 5 then
		xa ={"#G/25%#Y/","#R/10%#Y/"}
	elseif ad == "怒吼" and aa == 1 then
       xa ={"#G/10#Y/","#R/10%#Y/"}
	elseif ad == "怒吼" and aa == 2 then
		xa ={"#G/20#Y/","#R/10%#Y/"}
	elseif ad == "怒吼" and aa == 3 then
		xa ={"#G/30#Y/","#R/10%#Y/"}
    elseif ad == "怒吼" and aa == 4 then
    	xa ={"#G/40#Y/","#R/10%#Y/"}
	elseif ad == "怒吼" and aa == 5 then
		xa ={"#G/50#Y/","#R/10%#Y/"}
	elseif ad == "抗法" and aa == 1 then
       xa ={"#G/6#Y/","#R/15%#Y/"}
	elseif ad == "抗法" and aa == 2 then
		xa ={"#G/9#Y/","#R/18%#Y/"}
	elseif ad == "抗法" and aa == 3 then
		xa ={"#G/14#Y/","#R/22%#Y/"}
    elseif ad == "抗法" and aa == 4 then
    	xa ={"#G/23#Y/","#R/26%#Y/"}
	elseif ad == "抗法" and aa == 5 then
		xa ={"#G/52#Y/","#R/30%#Y/"}
	elseif ad == "洞察" 	and aa == 1 then
       xa ={"#G/5%#Y/","#R/8#Y/"}
	elseif ad == "洞察" and aa == 2 then
		xa ={"#G/10%#Y/","#R/7#Y/"}
	elseif ad == "洞察" and aa == 3 then
		xa ={"#G/15%#Y/","#R/6#Y/"}
    elseif ad == "洞察" and aa == 4 then
    	xa ={"#G/20%#Y/","#R/5#Y/"}
	elseif ad == "洞察" and aa == 5 then
		xa ={"#G/25%#Y/","#R/4#Y/"}
	elseif ad == "抗物" and aa == 1 then
       xa ={"#G/6#Y/","#R/15%#Y/"}
	elseif ad == "抗物" and aa == 2 then
		xa ={"#G/9#Y/","#R/18%#Y/"}
	elseif ad == "抗物" and aa == 3 then
		xa ={"#G/14#Y/","#R/22%#Y/"}
    elseif ad == "抗物" and aa == 4 then
    	xa ={"#G/23#Y/","#R/26%#Y/"}
	elseif ad == "抗物" and aa == 5 then
		xa ={"#G/52#Y/","#R/30%#Y/"}
	elseif ad == "抗法" and aa == 1 then
       xa ={"#G/6#Y/","#R/15%#Y/"}
	elseif ad == "抗法" and aa == 2 then
		xa ={"#G/9#Y/","#R/18%#Y/"}
	elseif ad == "抗法" and aa == 3 then
		xa ={"#G/14#Y/","#R/22%#Y/"}
    elseif ad == "抗法" and aa == 4 then
    	xa ={"#G/23#Y/","#R/26%#Y/"}
	elseif ad == "抗法" and aa == 5 then
		xa ={"#G/52#Y/","#R/30%#Y/"}
	elseif ad == "护佑" and aa == 1 then
       xa ={"#G/10#Y/","#R/10%#Y/"}
	elseif ad == "护佑" and aa == 2 then
		xa ={"#G/20#Y/","#R/10%#Y/"}
	elseif ad == "护佑" and aa == 3 then
		xa ={"#G/30#Y/","#R/10%#Y/"}
    elseif ad == "护佑" and aa == 4 then
    	xa ={"#G/40#Y/","#R/10%#Y/"}
	elseif ad == "护佑" and aa == 5 then
		xa ={"#G/50#Y/","#R/10%#Y/"}
	elseif ad == "巧劲" and aa == 1 then
       xa ={"#G/2#Y/","#R/23%#Y/"}
	elseif ad == "巧劲" and aa == 2 then
		xa ={"#G/5#Y/","#R/20%#Y/"}
	elseif ad == "巧劲" and aa == 3 then
		xa ={"#G/8#Y/","#R/17%#Y/"}
    elseif ad == "巧劲" and aa == 4 then
    	xa ={"#G/12#Y/","#R/15%#Y/"}
	elseif ad == "巧劲" and aa == 5 then
		xa ={"#G/25#Y/","#R/12%#Y/"}
	end
	local a
	if ad == "灵刃" then
	  a ="#Y/第二回合以后进场时，"..xa[1].."概率对自身造成#R/30%#Y/气血上限的伤害并且物理伤害结果提高#R/50%#Y/，持续4回合，防御力，法术防御力降低"..xa[2].."(带有鬼混和神佑类技能，伤害结果只提高10%)"
	elseif ad == "预知" then
	　a = "#Y/感受到危险时有"..xa[1].."概率喊话,每场战斗最多3次,全属性降低"..xa[2]
	elseif ad == "灵动" then
		a= "#Y/行动时有"..xa[1].."概率与队友进行交流，每场战斗最多3次，全属性降低"..xa[2]
	elseif ad == "瞬击" then
		a= "#Y/第二回合以后进场时，"..xa[1].."概率对气血百分比最低的单位发动一次攻击，防御降低"..xa[2]
	elseif ad == "抗法" then
		a="#Y/在场时，我方所有单位法术防御增加"..xa[1].."，自身受到物理伤害增加"..xa[2]
	elseif ad == "阳护" then
	    a="#Y/第二回合以后进场时，"..xa[1].."减少所有我方单位身上“死亡召唤”状态2回合，防御力下降"..xa[2]
	   elseif ad == "识物" then
	   a="#Y/召唤兽套装附带的技能为法术技能时，触发概率提高"..xa[1].."全属性降低"..xa[2]
	elseif ad == "洞察" then
	a="#Y/PVP战斗中行动时有"..xa[1].."概率发现什么，全属性降低"..xa[2]
	elseif ad == "弑神" then
	a="#Y/对已经神佑过的召唤兽法术伤害增加"..xa[1].."，普通攻击命中率下降"..xa[2]
	elseif ad == "御风" then
		a="#Y/进场时提高主人的速度"..xa[1].."，倒地或者死亡后无效，持续3回合，受到所有伤害增加"..xa[2]
	elseif ad == "顺势" then
		a="#Y/对气血百分低于#G/70%#Y/的单位法术伤害增加"..xa[1].."，对其余单位法术伤害力降低"..xa[2]
	elseif ad == "复仇" then
		a="#Y/主人被击倒时，有"..xa[1].."概率向敌方单位发动一次攻击，最多生效3次。减少所有防御力"..xa[2]
	elseif ad == "自恋" then
		a="#Y/普通物理攻击击杀任意单位时有"..xa[1].."概率进行炫耀，每场战斗最多1次，全属性降低"..xa[2]
	elseif ad == "怒吼" then
		a="#Y/第二回合以后进场时，"..xa[1].."%概率我方伤害最高的单位提高50%伤害，持续2回合，法术伤害力降低"..xa[2].."自身防御降低10%持续到战斗结束。"
	elseif ad == "暗劲" then
		　a="#Y/属性法术被吸收时，有"..xa[1].."概率使恢复量不超过1,普通物理攻击命中率下降"..xa[2]
	elseif ad == "逆境" then
		a="#Y/进场时，若已方四个以上单位处于被封印状态，则"..xa[1].."解除我方所有单位异常状态，防御力下降"..xa[2]
	elseif ad == "瞬法" then
		a="#Y/第2回合以后进场时，"..xa[1].."概率对血量百分比最低的单位使用随机法术，气血上限降低"..xa[2]
	elseif ad == "乖巧" then
		a="#Y/使用超级巫医时，耗费的银两降低"..xa[1].."，全属性降低"..xa[2]
	elseif ad == "抗物" then
		a="#Y/在场时，我方所有单位物理防御增加"..xa[1].."，自身受到法术伤害增加"..xa[2]
	elseif ad == "护佑" then
		a="#Y/第2回合进场，"..xa[1].."%概率使我方气血百分比最低的单位受到的伤害降低50%持续2回合，法术伤害力降低#R/"..xa[2]
	elseif ad == "识药" then
		a="#Y/药物效果提高"..xa[1].."受到的所有伤害增加"..xa[2]
	elseif ad == "吮魔" then
		a="#Y/普通物理攻击时吸取"..xa[1].."的魔法，对当前魔法高于#R/50%#Y/的单位伤害结果少"..xa[2]
	elseif ad == "灵断" then
		a="#Y/第二回合以后进场是，"..xa[1].."的几率队自身造成#R/30%#Y/气血上限的伤害并且无视地方神佑鬼魂类技能，持续#R/4#Y/回合，气血上限降低#G/5%#Y/(带有鬼魂类或者神佑技能时，进场对自己造成"..xa[2].."气血上限伤害)"
	elseif ad == "争锋" then
		a="#Y/对召唤兽物理伤害结果增加"..xa[1].."对人物伤害结果减少"..xa[2]
	elseif ad == "力破" then
		a="#Y/忽略人物角色#R/"..xa[1].."#Y/防御力".."减少对召唤兽的伤害结果"..xa[2]
	elseif ad == "灵法" then
		a="#Y/第二回合进场后，提高"..xa[1].."自身气血法术伤害，并提高"..xa[1].."法术伤害结果。持续#R/4#Y/回合,减少防御力"..xa[2]
	elseif ad == "巧劲" then
	　　a="#Y/普通攻击增加伤害结果"..xa[1].."受到的所有伤害增加"..xa[2]
 end

	self.介绍文本:添加文本(a)
	local w = self.介绍文本.显示表.宽度
	local h = self.介绍文本.显示表.高度
	if x + w >= 780 then
		x = 780 - w
	end
	if y + h >= 580 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 =self.介绍文本
	self.寄存内容[1].x = x + 10
	self.寄存内容[1].y = y + 10
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true

end

function 系统类_提示框:商城提示(x,y,名称,介绍,动画,备注,神兽)
	local x = x + 30
	local y = y
	local w = 300
	local h = 18
    self.道具文本:清空()
    self.道具文本:添加文本(介绍)
    if 备注~=nil then
     	self.道具文本:添加文本("#Y/"..备注)
    end

    self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = 动画
	self.寄存内容[1].x = x+3
	self.寄存内容[1].y = y+5
	--print(神兽)
	if 神兽 then
      	self.寄存内容[1].y =self.寄存内容[1].y +110
      	self.寄存内容[1].x =self.寄存内容[1].x +50
	end
	self.寄存内容[2] = {}
	self.寄存内容[2].内容 = self.道具文本
	self.寄存内容[2].x = x + 128
	self.寄存内容[2].y = y + 35

	self.寄存内容[3] = {}
	self.寄存内容[3].文字 = tp.字体表.道具字体
	self.寄存内容[3].颜色 = -256
	self.寄存内容[3].文本 = 名称
	self.寄存内容[3].坐标 = {[1]=x+128.8,[2] =y+4}

	h = self.道具文本.显示表.高度+30
	if h < 130 then
		h = 130
	end
	if x + w >= 980 then
		x = 980 - w
	end
	if y + h > 600 then
		y = y-h-- - h +100
		self.寄存内容[2].y=y+35
		self.寄存内容[1].y=y+110
		self.寄存内容[3].坐标 = {[1]=x+128.8,[2] =y+4}
	   -- h=h-300
	end
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
 end
function 系统类_提示框:阵法(x,y,我阵型,敌阵型,显示)
	local x = x - 60
	local y = y + 30
	local w = 200
	self.介绍文本:清空()
	-- tp.提示:自定义(470,170,self.我方阵型.."(".."#G克制+"..self.克制.."%".."#W)\n".."#G"..self.加成.."#R"..self.削弱)


    if 我阵型==敌阵型 then
   	   self.克制=0
   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")
   	end
	if 我阵型=="普通" then
	   if 敌阵型=="天覆阵" or 敌阵型=="风扬阵"or 敌阵型=="龙飞阵"or 敌阵型=="鸟翔阵"or 敌阵型=="鹰啸阵" then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")
	   elseif 敌阵型=="地载阵" or 敌阵型=="云垂阵"or 敌阵型=="虎翼阵"or 敌阵型=="蛇蟠阵"or 敌阵型=="雷绝阵" then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")
	   end
	   self.介绍文本:添加文本("1号位: (#G无特效#W)")
	   self.介绍文本:添加文本("2号位: (#G无特效#W)")
	   self.介绍文本:添加文本("3号位: (#G无特效#W)")
	   self.介绍文本:添加文本("4号位: (#G无特效#W)")
	   self.介绍文本:添加文本("5号位: (#G无特效#W)")
	elseif 我阵型=="天覆阵" then
	   if 敌阵型=="普通" or 敌阵型=="鸟翔阵"or 敌阵型=="鹰啸阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")
	   elseif 敌阵型=="地载阵"or 敌阵型=="龙飞阵"  then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")

	   elseif 敌阵型=="风扬阵"or 敌阵型=="蛇蟠阵"  then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")
	   elseif 敌阵型=="云垂阵"or 敌阵型=="虎翼阵"or 敌阵型=="雷绝阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")
	   end
	   self.介绍文本:添加文本("1号位: (#G全伤+20%#W)".."(".."#R速度-10%".."#W)")
	   self.介绍文本:添加文本("2号位: (#G全伤+20%#W)".."(".."#R速度-10%".."#W)")
	   self.介绍文本:添加文本("3号位: (#G全伤+20%#W)".."(".."#R速度-10%".."#W)")
	   self.介绍文本:添加文本("4号位: (#G全伤+20%#W)".."(".."#R速度-10%".."#W)")
	   self.介绍文本:添加文本("5号位: (#G全伤+20%#W)".."(".."#R速度-10%".."#W)")
	elseif 我阵型=="地载阵" then
	   if 敌阵型=="云垂阵"or 敌阵型=="蛇蟠阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")
	   elseif 敌阵型=="风扬阵"or 敌阵型=="虎翼阵"or 敌阵型=="雷绝阵" then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")

	   elseif 敌阵型=="天覆阵"or 敌阵型=="鸟翔阵"or 敌阵型=="鹰啸阵" then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")
	   elseif 敌阵型=="普通" or 敌阵型=="龙飞阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")
	   end
	   self.介绍文本:添加文本("1号位: (#G全防+15%#W)")
	   self.介绍文本:添加文本("2号位: (#G全伤+15%#W)")
	   self.介绍文本:添加文本("3号位: (#G全防+15%#W)")
	   self.介绍文本:添加文本("4号位: (#G全防+15%#W)")
	   self.介绍文本:添加文本("5号位: (#G速度+10%#W)")
	elseif 我阵型=="风扬阵" then
	   if 敌阵型=="普通"or 敌阵型=="天覆阵"or 敌阵型=="蛇蟠阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++
	   elseif 敌阵型=="风扬阵" or 敌阵型=="鸟翔阵"or 敌阵型=="鹰啸阵" then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++

	   elseif 敌阵型=="地载阵"or 敌阵型=="虎翼阵"or 敌阵型=="雷绝阵" then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   elseif 敌阵型=="云垂阵"or 敌阵型=="龙飞阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   end
	   self.介绍文本:添加文本("1号位: (#G全伤+20%#W)")
	   self.介绍文本:添加文本("2号位: (#G全伤+10%#W)")
	   self.介绍文本:添加文本("3号位: (#G全伤+10%#W)")
	   self.介绍文本:添加文本("4号位: (#G速度+10%#W)")
	   self.介绍文本:添加文本("5号位: (#G速度+10%#W)")
	elseif 我阵型=="云垂阵" then
	   if 敌阵型=="天覆阵" or 敌阵型=="风扬阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++
	   elseif 敌阵型=="鸟翔阵"or 敌阵型=="蛇蟠阵"or 敌阵型=="鹰啸阵" then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++

	   elseif 敌阵型=="龙飞阵"or 敌阵型=="虎翼阵" or 敌阵型=="雷绝阵" then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   elseif 敌阵型=="普通" or 敌阵型=="地载阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   end
	   self.介绍文本:添加文本("1号位: (#G物防+40%#W)".."(".."#R速度-30%".."#W)")
	   self.介绍文本:添加文本("2号位: (#G全防+10%#W)")
	   self.介绍文本:添加文本("3号位: (#G全伤+20%#W)")
	   self.介绍文本:添加文本("4号位: (#G速度+15%#W)")
	   self.介绍文本:添加文本("5号位: (#G速度+15%#W)")
	elseif 我阵型=="龙飞阵" then
	   if 敌阵型=="普通"or 敌阵型=="地载阵" or 敌阵型=="风扬阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++
	   elseif 敌阵型=="云垂阵"or 敌阵型=="雷绝阵" then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++

	   elseif 敌阵型=="天覆阵"or 敌阵型=="鹰啸阵"then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   elseif 敌阵型=="虎翼阵" or 敌阵型=="鸟翔阵"or 敌阵型=="蛇蟠阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   end
	   self.介绍文本:添加文本("1号位: (#G法防+20%#W)")
	   self.介绍文本:添加文本("2号位: (#G物防+20%#W)")
	   self.介绍文本:添加文本("3号位: (#G法伤+30%#W)".."(".."#R速度-30%".."#W)")
	   self.介绍文本:添加文本("4号位: (#G速度+15%#W)")
	   self.介绍文本:添加文本("5号位: (#G全伤+20%#W)")
	elseif 我阵型=="虎翼阵" then
	   if 敌阵型=="天覆阵"or 敌阵型=="龙飞阵"or 敌阵型=="雷绝阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++
	   elseif 敌阵型=="风扬阵"or 敌阵型=="云垂阵" then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++

	   elseif 敌阵型=="地载阵"or 敌阵型=="鸟翔阵"then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   elseif 敌阵型=="普通"or 敌阵型=="蛇蟠阵"or 敌阵型=="鹰啸阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   end
	   self.介绍文本:添加文本("1号位: (#G全伤+25%#W)")
	   self.介绍文本:添加文本("2号位: (#G全防+10%#W)")
	   self.介绍文本:添加文本("3号位: (#G全防+10%#W)")
	   self.介绍文本:添加文本("4号位: (#G全伤+10%#W)")
	   self.介绍文本:添加文本("5号位: (#G全伤+10%#W)")
	elseif 我阵型=="鸟翔阵" then
	   if 敌阵型=="普通"or 敌阵型=="龙飞阵"or 敌阵型=="鹰啸阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++
	   elseif 敌阵型=="地载阵"or 敌阵型=="虎翼阵" then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++

	   elseif 敌阵型=="风扬阵"or 敌阵型=="云垂阵"then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   elseif 敌阵型=="天覆阵"or 敌阵型=="蛇蟠阵"or 敌阵型=="雷绝阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   end
	   self.介绍文本:添加文本("1号位: (#G速度+20%#W)")
	   self.介绍文本:添加文本("2号位: (#G速度+20%#W)")
	   self.介绍文本:添加文本("3号位: (#G速度+20%#W)")
	   self.介绍文本:添加文本("4号位: (#G速度+20%#W)")
	   self.介绍文本:添加文本("5号位: (#G速度+20%#W)")
	elseif 我阵型=="蛇蟠阵" then
	   if 敌阵型=="地载阵"or 敌阵型=="风扬阵"or 敌阵型=="龙飞阵"or 敌阵型=="虎翼阵"or 敌阵型=="鸟翔阵"or 敌阵型=="雷绝阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++
	   elseif 敌阵型=="天覆阵" then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++

	   elseif 敌阵型=="云垂阵"then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   elseif 敌阵型=="普通"or 敌阵型=="鹰啸阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   end
	   self.介绍文本:添加文本("1号位: (#G法防+15%#W)")
	   self.介绍文本:添加文本("2号位: (#G法防+15%#W)")
	   self.介绍文本:添加文本("3号位: (#G法防+15%#W)")
	   self.介绍文本:添加文本("4号位: (#G全伤+10%#W)")
	   self.介绍文本:添加文本("5号位: (#G全伤+10%#W)")
	elseif 我阵型=="鹰啸阵" then
	   if 敌阵型=="普通"or 敌阵型=="虎翼阵"or 敌阵型=="蛇蟠阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++
	   elseif 敌阵型=="地载阵"or 敌阵型=="龙飞阵" then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++

	   elseif 敌阵型=="风扬阵"or 敌阵型=="云垂阵"or 敌阵型=="鸟翔阵"or 敌阵型=="雷绝阵"then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   elseif 敌阵型=="天覆阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   end
	   self.介绍文本:添加文本("1号位: (#G全防+10%#W)")
	   self.介绍文本:添加文本("2号位: (#G速度+15%#W)")
	   self.介绍文本:添加文本("3号位: (#G速度+15%#W)")
	   self.介绍文本:添加文本("4号位: (#G全伤+15%#W)")
	   self.介绍文本:添加文本("5号位: (#G全伤+10%#W)")
	elseif 我阵型=="雷绝阵" then
	   if 敌阵型=="天覆阵"or 敌阵型=="鸟翔阵"or 敌阵型=="鹰啸阵"then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++
	   elseif 敌阵型=="风扬阵"or 敌阵型=="云垂阵" then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#G克制+"..self.克制.."%#W)")--+++++++++++

	   elseif 敌阵型=="地载阵"or 敌阵型=="龙飞阵" then
	   	   self.克制=10
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   elseif 敌阵型=="普通"or 敌阵型=="虎翼阵"or 敌阵型=="蛇蟠阵"  then
	   	   self.克制=5
	   	   self.介绍文本:添加文本(我阵型.."(#R克制-"..self.克制.."%#W)")---------------
	   end
	   self.介绍文本:添加文本("1号位: (#G固伤+20%#W)")
	   self.介绍文本:添加文本("2号位: (#G固伤+20%#W)")
	   self.介绍文本:添加文本("3号位: (#G固伤+20%#W)")
	   self.介绍文本:添加文本("4号位: (#G全伤+10%#W)")
	   self.介绍文本:添加文本("5号位: (#G全伤+10%#W)")

	end

	local h = self.介绍文本.显示表.高度
	if x + w >= 780 then
		x = 780 - w
	end
	if y + h >= 580 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	tp.字体表.人物字体_:置阴影颜色(nil)
	self.寄存内容[1].文字 = tp.字体表.人物字体_
	self.寄存内容[1].内容 = self.介绍文本
	self.寄存内容[1].x = x + 10
	self.寄存内容[1].y = y + 5
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end
function 系统类_提示框:道具行囊(x,y,item,jd)
	if item == nil then
		return
	end
	local x = x + 30
	local y = y
	local w = 360
	local h = 18
	local zf = "#W/"
	if jd == nil then
	 	zf = "#Y/"
	end
	tp.装备强化升星_:更新(dt)
	tp.装备强化升星蓝色_:更新(dt)
	tp.装备强化升星金色_:更新(dt)
	tp.装备强化升星钻石_:更新(dt)
	self.道具文本:清空()
	self.道具文本:添加文本("")
	if item.加星 ~= nil then
		local 临时文本1 = ""
		local 临时文本2 = ""
		local 临时文本3 = ""
		for i=1,item.加星 do
			if i<=5 then
			    临时文本1 = 临时文本1.."★"
			elseif i<=10 then
				临时文本2 = 临时文本2.."★"
			else
				临时文本3 = 临时文本3.."★"
			end

		end
		if item.加星 < 5 then
			self.道具文本:添加文本("#G"..临时文本1)
		elseif item.加星 < 10 then
		    self.道具文本:添加文本("#G"..临时文本1.."#Y"..临时文本2)
		else
			self.道具文本:添加文本("#G"..临时文本1.."#Y"..临时文本2.."#R"..临时文本3)
		end
	end
	self.道具文本:添加文本(item.介绍)
	local zls = item.总类
	--print(item.总类,item.子类,item.分类)
	if zls == 1 then
		local gs = ""
		local qgx = gxs(item.名称,item.阶品,item.食材)
		if item.分类 ~= 10 and item.分类 ~= 11 then
		  if item.子类==1 and item.分类==4 then
		  	  if item.名称=="包子" then
                 self.道具文本:添加文本("【功效】恢复气血100点")
                elseif   item.名称=="女儿红" then
                 self.道具文本:添加文本("【功效】恢复愤怒值=20")
                 self.道具文本:添加文本("附加昏睡状态")
               elseif item.名称=="臭豆腐" then
                 self.道具文本:添加文本("【功效】")
                 self.道具文本:添加文本("恢复气血=品质*20+200")
                 self.道具文本:添加文本("#Y/品质 "..item.阶品)
                elseif item.名称=="烤鸭" then
                 self.道具文本:添加文本("【功效】")
                 self.道具文本:添加文本("恢复气血=品质*10+100")
                 self.道具文本:添加文本("#Y/品质 "..item.阶品)
                 elseif item.名称=="烤肉" then
                 self.道具文本:添加文本("【功效】")
                 self.道具文本:添加文本("恢复气血=品质*10")
                 self.道具文本:添加文本("#Y/品质 "..item.阶品)
                elseif item.名称=="佛跳墙" then
                 self.道具文本:添加文本("【功效】")
                 self.道具文本:添加文本("恢复魔法=品质*10+100")
                 self.道具文本:添加文本("#Y/品质 "..item.阶品)
                elseif item.名称=="桂花丸" then
                 self.道具文本:添加文本("【功效】")
                 self.道具文本:添加文本("恢复召唤兽寿命=品质*0.5")
                 self.道具文本:添加文本("#Y/品质 "..item.阶品)
                elseif item.名称=="豆斋果" then
                 self.道具文本:添加文本("【功效】")
                 self.道具文本:添加文本("恢复召唤兽寿命=品质*3")
                 self.道具文本:添加文本("但有3%几率出现食物中毒而减少某些资质。")
                 self.道具文本:添加文本("#Y/品质 "..item.阶品)
                elseif item.名称=="长寿面" then
                 self.道具文本:添加文本("【功效】")
                 self.道具文本:添加文本("恢复召唤兽寿命=品质*2+50")
                 self.道具文本:添加文本("但有3%几率出现食物中毒而减少某些资质。")
                 self.道具文本:添加文本("#Y/品质 "..item.阶品)
                elseif item.名称=="翡翠豆腐" then
                 self.道具文本:添加文本("【功效】")
                 self.道具文本:添加文本("恢复气血=品质*15+150")
                 self.道具文本:添加文本("魔法=品质*10+100")
                 self.道具文本:添加文本("#Y/品质 "..item.阶品)
                elseif item.名称=="珍露酒" then
                 self.道具文本:添加文本("【功效】")
                 self.道具文本:添加文本("恢复愤怒值=品质*0.4+10")
                 self.道具文本:添加文本("#Y/品质 "..item.阶品)
               elseif item.名称=="梅花酒" then
                 self.道具文本:添加文本("【功效】")
                 self.道具文本:添加文本("恢复愤怒值=品质*0.6")
                 self.道具文本:添加文本("昏睡2~3回合")
                 self.道具文本:添加文本("#Y/品质 "..item.阶品)
                elseif item.名称=="百味酒" then
                 self.道具文本:添加文本("【功效】")
                 self.道具文本:添加文本("恢复愤怒值=品质*0.7")
                 self.道具文本:添加文本("昏睡2~3回合或附加中毒状态")
                 self.道具文本:添加文本("#Y/品质 "..item.阶品)
                elseif item.名称=="蛇胆酒" then
                 self.道具文本:添加文本("【功效】")
                 self.道具文本:添加文本("恢复愤怒值=品质*1")
                 self.道具文本:添加文本("减少防御=品质*1.5")
                 self.道具文本:添加文本("#Y/品质 "..item.阶品)
                elseif item.名称=="醉生梦死" then
                 self.道具文本:添加文本("【功效】")
                 self.道具文本:添加文本("恢复愤怒值=品质*1")
                 self.道具文本:添加文本("附加疯狂状态3~4回合")
                 self.道具文本:添加文本("#Y/品质 "..item.阶品)
                elseif item.名称=="虎骨酒" then
                 self.道具文本:添加文本("【功效】")
                 self.道具文本:添加文本("恢复愤怒值=20")
                 self.道具文本:添加文本("附加疯狂状态")
                 self.道具文本:添加文本("#Y/品质 "..item.阶品)
		  	  	 end
            else
             --self.道具文本:添加文本("#Y/品质:"..item.阶品)
		  	 end
           if item.名称=="金创药" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复气血400点")
              self.道具文本:添加文本("#Y/恢复气血400,等级：3")
              --self.道具文本:添加文本("#Y/品质 "..item.阶品)
           elseif item.名称=="金香玉" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复气血=品质*12+150")
              self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复气血="..(item.阶品*12+150)..",等级: 3")
            elseif item.名称=="小还丹" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复气血=品质*8+100")
              self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复气血="..(item.阶品*8+100)..",等级: 3")
            elseif item.名称=="千年保心丹" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复气血=品质*4+200")
              self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复气血="..(item.阶品*4+200)..",等级: 3")
            elseif item.名称=="风水混元丹" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复魔法=品质*3+50")
              self.道具文本:添加文本("恢复灵力=品质*0.3")
              self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复魔法="..(item.阶品*3+50)..",等级: 3")
            elseif item.名称=="定神香" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("解除奇经八脉技能产生的异常状态，恢复魔法=品质*5+50")
              self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复魔法="..(item.阶品*5+50)..",等级: 3")
             elseif item.名称=="蛇蝎美人" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复魔法=品质*5+100")
              self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复魔法="..(item.阶品*5+100)..",等级: 3")
            elseif item.名称=="九转回魂丹" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("复活、恢复气血=品质*5+100")
              self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复气血="..(item.阶品*5+100)..",等级: 3")
           elseif item.名称=="佛光舍利子" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("复活、恢复气血=品质*3")
              self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复气血="..(item.阶品*3)..",等级: 3")
           elseif item.名称=="五龙丹" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("解除封类异常状态")
              self.道具文本:添加文本("恢复气血=品质*3")
              self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复气血="..(item.阶品*3)..",等级: 3")
            elseif item.名称=="十香返生丸" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("解除酒类异常状态")
              self.道具文本:添加文本("恢复魔法=品质*3+50")
              self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复魔法="..(item.阶品*3+50)..",等级: 3")
            elseif item.名称=="天不老" or item.名称=="紫石英" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复气血100点")
              self.道具文本:添加文本("#Y/恢复气血100, 等级:2")
           elseif item.名称=="血色茶花" or item.名称=="鹿茸" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复气血150点")
              self.道具文本:添加文本("#Y/恢复气血150, 等级:2")
           elseif item.名称=="六道轮回" or item.名称=="熊胆" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复气血200点")
              self.道具文本:添加文本("#Y/恢复气血200, 等级:2")
            elseif item.名称=="凤凰尾" or item.名称=="硫磺草" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复气血250点")
              self.道具文本:添加文本("#Y/恢复气血250, 等级:2")
            elseif item.名称=="龙之心屑" or item.名称=="火凤之睛" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复气血300点")
              self.道具文本:添加文本("#Y/恢复气血300, 等级:2")
            elseif item.名称=="四叶花" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复气血40点")
              self.道具文本:添加文本("#Y/恢复气血40, 等级:1")
            elseif item.名称=="天青地白"  then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复气血80点")
              self.道具文本:添加文本("#Y/恢复气血80, 等级:1")
           elseif item.名称=="七叶莲"  then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复气血60点")
              self.道具文本:添加文本("#Y/恢复气血60, 等级:1")
            elseif item.名称=="丁香水" or item.名称=="月星子" then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复魔法75点")
              self.道具文本:添加文本("#Y/恢复魔法75, 等级:2")
            elseif item.名称=="仙狐涎" or item.名称=="地狱灵芝" or item.名称=="麝香" or item.名称=="血珊瑚" or item.名称=="餐风饮露" or item.名称=="白露为霜"   then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复魔法100点")
              self.道具文本:添加文本("#Y/恢复魔法100, 等级:2")
            elseif item.名称=="天龙水" or item.名称=="孔雀红"    then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复魔法150点")
              self.道具文本:添加文本("#Y/恢复魔法150, 等级:2")
             elseif item.名称=="紫丹罗" or item.名称=="佛手" or item.名称=="旋复花"   then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复魔法20点")
              self.道具文本:添加文本("#Y/恢复魔法20, 等级:1")
            elseif item.名称=="龙须草" or item.名称=="百色花" or item.名称=="香叶"   then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复魔法30点")
              self.道具文本:添加文本("#Y/恢复魔法30, 等级:1")
            elseif item.名称=="白玉骨头" or item.名称=="鬼切草" or item.名称=="灵脂"   then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复气魔法40点")
              self.道具文本:添加文本("#Y/恢复魔法40, 等级:1")
            elseif item.名称=="曼陀罗花"   then
              self.道具文本:添加文本("【功效】")
              self.道具文本:添加文本("恢复魔法50点")
              self.道具文本:添加文本("#Y/恢复魔法50, 等级:1")
             elseif item.名称=="秘制红罗羹"   then
              self.道具文本:添加文本("【功效】战斗结束后自动恢复人物气血")
              self.道具文本:添加文本("#Y/剩余恢复量：10000000")
            elseif item.名称=="秘制绿罗羹"   then
              self.道具文本:添加文本("【功效】战斗结束后自动恢复人物魔法")
              self.道具文本:添加文本("#Y/剩余恢复量：5000000")
		    end
			if qgx == nil and item.子类~=1 and item.子类~=2 and item.分类~=4  then
				if item.分类 == 4 and item.子类 >= 2 then
					if item.气血 ~= 0 and item.气血 ~= nil  then
						gs = gs..zf.."\n"..zf.."增加储备气血 "..item.气血
					end
					if item.魔法 ~= 0 and item.魔法 ~= nil then
						gs = gs..zf.."\n"..zf.."增加储备魔法 "..item.魔法
					end
					if item.子类 == 2 then
						gs = gs..zf.."\n"..zf.."恢复寿命 5".."+".."品质*5"
					end
                 elseif item.分类 == 11 then --月华露
        	           gs=gs..zf.."\n"..zf.."增加召唤兽经验=品质*2*服用召唤兽等级"
        	           self.道具文本:添加文本("#Y/品质:"..item.阶品)
				else
				 if item.子类~=4 then
					if item.气血 ~= 0 and item.气血 ~= nil  then
						--gs = gs..zf.."\n"..zf.."恢复气血 "..item.气血.."点"
					end
					if item.魔法 ~= 0 and item.魔法 ~= nil then
						--gs = gs..zf.."\n"..zf.."恢复魔法 "..item.魔法.."点"
					end
					if item.子类 == 2 then
						--gs = gs..zf.."\n"..zf.."恢复寿命 5".."+".."品质*5"
					end
				  end
				end
			elseif item.子类~=1 and item.子类~=2 and item.分类~=4  then
				if qgx.复活 ~= nil then
					--gs = gs..zf.."\n"..zf.."复活"
				end
			  	if qgx.气血 ~= nil then
					--gs = gs..zf.."\n"..zf.."恢复气血 "..qgx.气血
				end
				if qgx.魔法 ~= nil then
					--gs = gs..zf.."\n"..zf.."恢复魔法 "..qgx.魔法
				end
				if qgx.功效 ~= nil then
					--gs = gs..zf.."\n"..zf..qgx.功效
				end
			end
         if item.子类~=1 and item.子类~=2 and item.分类~=4  then
             -- self.道具文本:添加文本(zf.."【功效】"..gs)
             end
        elseif item.分类 == 11 then --月华露
          if item.名称=="月华露" then
        	  gs=gs..zf.."#W/【功效】增加召唤兽经验=品质*2*服用召唤兽等级"
        	  self.道具文本:添加文本(gs)
        	  self.道具文本:添加文本("#Y/品质:"..item.阶品)
        	elseif item.名称=="九转金丹" then
        	 self.道具文本:添加文本("【功效】增加人物修炼经验=品质*0.5")
        	 self.道具文本:添加文本("#Y/品质:"..item.阶品)
           elseif item.名称=="修炼果" then
        	 self.道具文本:添加文本("【功能】提高某种修炼经验，经验达到要求后可提高修炼等级，从而控制召唤兽发挥出更强的潜力。")
        	 elseif item.名称=="VIP月卡" then
             self.道具文本:添加文本(item.说明)
        	 self.道具文本:添加文本("#G剩余次数：#R"..item.次数)
        	elseif item.名称=="超级VIP月卡" then
             self.道具文本:添加文本(item.说明)
        	 self.道具文本:添加文本("#G剩余次数：#R"..item.次数)
        	 end
       elseif item.子类 == 4 then
		else
			if item.名称=="元宵" then
              self.道具文本:添加文本("【食材】"..item.食材)
            end
			if qgx.功效 ~= nil then
				gs = gs..qgx.功效
			end
			self.道具文本:添加文本(zf.."【功效】"..gs)
		end
		elseif zls == 67 then
    	self.道具文本:添加文本("#Y/等级 "..item.级别限制)
    elseif zls == 65 then
    	self.道具文本:添加文本("#Y/右键直接打开幻化界面")
    elseif zls == 66 then
    	self.道具文本:添加文本(" ")
 		self.道具文本:添加文本("#Y/等级 "..item.级别限制)
 		local sx = ""
		local 气血 = item.幻化元身属性.气血
		local 魔法 = item.幻化元身属性.魔法
		local 命中 = item.幻化元身属性.命中
		local 伤害 = item.幻化元身属性.伤害
		local 防御 = item.幻化元身属性.防御
		local 速度 = item.幻化元身属性.速度
		local 躲避 = item.幻化元身属性.躲避
		local 灵力 = item.幻化元身属性.灵力
		local 体质 = item.幻化元身属性.体质
		local 魔力 = item.幻化元身属性.魔力
		local 力量 = item.幻化元身属性.力量
		local 耐力 = item.幻化元身属性.耐力
		local 敏捷 = item.幻化元身属性.敏捷
		if 气血 ~= 0 and 气血 ~= nil then
			sx = sx.."气血 +"..气血.." "
		end
		if 魔法 ~= 0 and 魔法 ~= nil then
			sx = sx.."魔法 +"..魔法.." "
		end
		if 命中 ~= 0  and 命中 ~= nil then
			sx = sx.."命中 +"..命中.." "
		end
		if 伤害 ~= 0 and 伤害 ~= nil then
			sx = sx.."伤害 +"..伤害.." "
		end
		if 防御 ~= 0 and 防御 ~= nil  then
			sx = sx.."防御 +"..防御.." "
		end
		if 速度 ~= 0 and 速度 ~= nil  then
			sx = sx.."速度 +"..速度.." "
		end
		if 灵力 ~= 0 and 灵力 ~= nil  then
			sx = sx.."灵力 +"..灵力.." "
		end
		if 敏捷 ~= 0 and 敏捷~=nil and item.元身序列 == 25 then
			sx = sx.."敏捷 +"..敏捷.." "
		end
		if sx ~= "" then
			self.道具文本:添加文本("#Y/"..sx)
		end

		local ds = ""
		if 体质 ~= nil and 体质 ~= 0 then
			ds = ds..体质.." "
		end
		if 魔力 ~= nil and 魔力 ~= 0  then
			ds = ds..魔力.." "
		end
		if 力量 ~= nil and 力量 ~= 0 then
			ds = ds..力量.." "
		end
		if 耐力 ~= nil and 耐力 ~= 0 then
			ds = ds..耐力.." "
		end
		if 敏捷 ~= nil and 敏捷 ~= 0 and item.元身序列 ~= 25 then
			ds = ds..敏捷.." "
		end
		if ds ~= "" then
			self.道具文本:添加文本("#G/"..ds)
		end
		if item.幻化元身属性.特技 ~= nil then
			self.道具文本:添加文本("#S/"..item.幻化元身属性.特技)
		end
		if item.幻化元身属性.特效 ~= nil then
			self.道具文本:添加文本("#S/"..item.幻化元身属性.特效)
		end
		if item.幻化次数 ~= nil then
			self.道具文本:添加文本("#Y/幻化次数："..item.幻化次数)
		end
		self.道具文本:添加文本(" ")
 elseif zls == 2 and  item.分类 == 14 then
	    self.道具文本:添加文本("【装备条件】等级"..item.级别限制.."级")
        self.道具文本:添加文本("【装备类型】魂环")
        if item.幻化属性==nil then
			self.道具文本:添加文本(format("#S/特效：%s",item.特效))
			self.道具文本:添加文本(format("#Y%s",item.介绍1))
			self.道具文本:添加文本(format("#Y%s",item.介绍2))
        else
        	self.道具文本:添加文本("#Y/等级 "..item.等级)
            self.道具文本:添加文本("#Y/"..item.幻化属性.基础.类型.." +"..item.幻化属性.基础.数值)
	        if item.耐久 ~= nil then
	      		item.耐久=math.floor(item.耐久)
	      		if item.修理失败~=nil and item.修理失败~=0 then
	      		    self.道具文本:添加文本(format("#Y/耐久度：%s  修理失败 %s次",item.耐久,item.修理失败))
	      		else
	      			self.道具文本:添加文本(format("#Y/耐久度 "..item.耐久))
	      		end
	        end
	        if item.特效 ~= nil then
			    self.道具文本:添加文本(format("#S/特效：%s",item.特效))
		    end
	        if item.幻化等级>0 then
	        	self.道具文本:添加文本("#Y/精炼等级 "..item.幻化等级)
	        end
	        for n=1,#item.幻化属性.附加 do
	            if item.幻化等级==0 then
	                self.道具文本:添加文本("#G/"..item.幻化属性.附加[n].类型.." +"..item.幻化属性.附加[n].数值)
	            else
	                self.道具文本:添加文本("#G/"..item.幻化属性.附加[n].类型.." +"..item.幻化属性.附加[n].数值.." #X/[+"..item.幻化属性.附加[n].强化.."]")
	          	end
	      	end
	    end
    elseif zls == 2 and item.灵饰 then
      	self.道具文本:添加文本("【装备条件】等级"..item.级别限制)
      	self.道具文本:添加文本("【灵饰类型】"..item.部位类型)
      	self.道具文本:添加文本("#Y/等级 "..item.级别限制)
       	self.道具文本:添加文本("#Y/"..item.幻化属性.基础.类型.." +"..item.幻化属性.基础.数值)
      	if item.耐久 ~= nil then
      		item.耐久=math.floor(item.耐久)
      		if item.修理失败~=nil and item.修理失败~=0 then
      		    self.道具文本:添加文本(format("#Y/耐久度：%s  修理失败 %s次",item.耐久,item.修理失败))
      		else
      			self.道具文本:添加文本(format("#Y/耐久度 "..item.耐久))
      		end
      	end
      	if item.特效 ~= nil then
		  self.道具文本:添加文本(format("#S/特效：%s",item.特效))
	  	end
      	if item.幻化等级>0 then   self.道具文本:添加文本("#Y/精炼等级 "..item.幻化等级) end
      	for n=1,#item.幻化属性.附加 do
          if item.幻化等级==0 then
             self.道具文本:添加文本("#G/"..item.幻化属性.附加[n].类型.." +"..item.幻化属性.附加[n].数值)
            else
             self.道具文本:添加文本("#G/"..item.幻化属性.附加[n].类型.." +"..item.幻化属性.附加[n].数值.." #X/[+"..item.幻化属性.附加[n].强化.."]")
          	 end
      	 end
     	if item.制造者~=nil then
           self.道具文本:添加文本("制造者："..item.制造者)
     	 end
     	if item.附加特性 ~= nil and item.附加特性.幻化等级 ~= nil then
     		self.道具文本:添加文本("#S特效："..item.附加特性.幻化类型)
     		if item.附加特性.幻化类型 == "心源" then
     			self.道具文本:添加文本("#S"..item.附加特性.幻化等级.."%提升3倍伤害结果")
     		elseif item.附加特性.幻化类型 == "狂浪滔天" then
     			self.道具文本:添加文本("#S提升人物灵力"..item.附加特性.幻化等级.."%")
     		elseif item.附加特性.幻化类型 == "固若金汤" then
     			self.道具文本:添加文本("#S提升人物防御"..item.附加特性.幻化等级.."%")
     		elseif item.附加特性.幻化类型 == "锐不可当" then
     			self.道具文本:添加文本("#S提升人物伤害"..item.附加特性.幻化等级.."%")
     		elseif item.附加特性.幻化类型 == "通真达灵" then
     			self.道具文本:添加文本("#S提升人物法术防御"..item.附加特性.幻化等级.."%")
     		elseif item.附加特性.幻化类型 == "血气方刚" then
     			self.道具文本:添加文本("#S提升人物气血上限"..item.附加特性.幻化等级.."%")
     		elseif item.附加特性.幻化类型 == "健步如飞" then
     			self.道具文本:添加文本("#S提升人物速度"..item.附加特性.幻化等级.."%")
     		end
     	end
     	 elseif zls == 2 and  item.分类 == 10 then
	    self.道具文本:添加文本("【装备条件】等级"..item.级别限制.."级")
        self.道具文本:添加文本("【装备类型】魂环")
        if item.幻化属性==nil then
			self.道具文本:添加文本(format("#S/特效：%s",item.特效))
			self.道具文本:添加文本(format("#Y%s",item.介绍1))
			self.道具文本:添加文本(format("#Y%s",item.介绍2))
        else
        	self.道具文本:添加文本("#Y/等级 "..item.等级)
            self.道具文本:添加文本("#Y/"..item.幻化属性.基础.类型.." +"..item.幻化属性.基础.数值)
	        if item.耐久 ~= nil then
	      		item.耐久=math.floor(item.耐久)
	      		if item.修理失败~=nil and item.修理失败~=0 then
	      		    self.道具文本:添加文本(format("#Y/耐久度：%s  修理失败 %s次",item.耐久,item.修理失败))
	      		else
	      			self.道具文本:添加文本(format("#Y/耐久度 "..item.耐久))
	      		end
	        end
	        if item.特效 ~= nil then
			    self.道具文本:添加文本(format("#S/特效：%s",item.特效))
		    end
	        if item.幻化等级>0 then
	        	self.道具文本:添加文本("#Y/精炼等级 "..item.幻化等级)
	        end
	        for n=1,#item.幻化属性.附加 do
	            if item.幻化等级==0 then
	                self.道具文本:添加文本("#G/"..item.幻化属性.附加[n].类型.." +"..item.幻化属性.附加[n].数值)
	            else
	                self.道具文本:添加文本("#G/"..item.幻化属性.附加[n].类型.." +"..item.幻化属性.附加[n].数值.." #X/[+"..item.幻化属性.附加[n].强化.."]")
	          	end
	      	end
	    end
	elseif zls == 2 and item.灵饰==nil   then -- 判断装备药品
		if item.鉴定  then
			if item.分类 == 3 then
				self.道具文本:添加文本("#W/【装备条件】等级"..item.级别限制)
				if item.角色限制[2] == nil then
					self.道具文本:添加文本("#W/【装备角色】"..item.角色限制[1])
				else
					self.道具文本:添加文本("#W/【装备角色】"..item.角色限制[1].."、"..item.角色限制[2])
				end
			elseif item.分类 == 1 or item.分类 == 4 then
				self.道具文本:添加文本("#W/【装备条件】等级"..item.级别限制)
				self.道具文本:添加文本("#W/【装备角色】"..item.性别限制)
			elseif item.分类 > 6 and  item.分类 < 10 then
				self.道具文本:添加文本("#W/【角色限制】召唤兽")
			elseif item.分类 >= 10  then
				self.道具文本:添加文本("#W/【装备等级】"..item.级别限制)
			else
				self.道具文本:添加文本("#W/【装备条件】等级"..item.级别限制)
				self.道具文本:添加文本("#W/【装备角色】无")
			end
			self.道具文本:添加文本("#Y/等级 "..item.级别限制.." 五行 "..item.五行)
			local sx = ""
			local 气血 = item.气血
			local 魔法 = item.魔法
			local 命中 = item.命中
			local 伤害 = item.伤害
			local 防御 = item.防御
			local 速度 = item.速度
			local 躲避 = item.躲避
			local 灵力 = item.灵力
			local 体质 = item.体质
			local 魔力 = item.魔力
			local 力量 = item.力量
			local 耐力 = item.耐力
			local 敏捷 = item.敏捷
			if 气血 ~= 0 and 气血 ~= nil and item.分类~=4 then
				sx = sx.."气血 +"..气血.." "
			end
			if 魔法 ~= 0 and 魔法 ~= nil  then
				sx = sx.."魔法 +"..魔法.." "
			end
			if 命中 ~= 0  and 命中 ~= nil and item.分类 ~=1 then
				sx = sx.."命中 +"..命中.." "
			end
			if 伤害 ~= 0 and 伤害 ~= nil  and item.分类 ~=1  then
				sx = sx.."伤害 +"..伤害.." "
			end
			if 防御 ~= 0 and 防御 ~= nil  then
				sx = sx.."防御 +"..防御.." "
			end
			if item.分类 > 6 and  item.分类 < 10 then
				if 速度 ~= 0 and 速度 ~= nil  then
					sx = sx.."速度 +"..速度.." "
				end
				if 躲避 ~= 0 and 躲避 ~= nil  then
					sx = sx.."躲避 +"..躲避.." "
				end
			end
			if 灵力 ~= 0 and 灵力 ~= nil  then
				sx = sx.."灵力 +"..灵力.." "
			end
			if 敏捷 ~= 0 and 敏捷~=nil and item.分类 == 6  then
				sx = sx.."敏捷 +"..敏捷.." "
			end
			if sx ~= "" then
				self.道具文本:添加文本("#Y/"..sx)
			end
			local ds = ""
			local fh = "+"
			if 体质 ~= nil and 体质 ~= 0 then
				if 体质+0 < 0 then
					fh = ""
				end
				ds = ds.."体质 "..fh..体质.." "
			end
			fh = "+"
			if 魔力 ~= nil and 魔力 ~= 0  then
				if 魔力+0 < 0 then
					fh = ""
				end
				ds = ds.."魔力 "..fh..魔力.." "
			end
			fh = "+"
			if 力量 ~= nil and 力量 ~= 0 then
				if 力量+0 < 0 then
					fh = ""
				end
				ds = ds.."力量 "..fh..力量.." "
			end
			fh = "+"
			if 耐力 ~= nil and 耐力 ~= 0 then
				if 耐力+0 < 0 then
					fh = ""
				end
				ds = ds.."耐力 "..fh..耐力.." "
			end
			fh = "+"
			if 敏捷 ~= nil and 敏捷 ~= 0 then
				if item.敏捷+0 < 0 then
					fh = ""
				end
				ds = ds.."敏捷 "..fh..敏捷.." "
			end
			if ds ~= "" and item.分类~=6 then --显示鞋子敏捷
				self.道具文本:添加文本("#G/"..ds)
			end
			if item.耐久 ~= nil then
				item.耐久=math.floor(item.耐久)
	      		if item.修理失败~=nil and item.修理失败~=0 then
	      		    self.道具文本:添加文本(format("#Y/耐久度：%s  修理失败 %s次",item.耐久,item.修理失败))
	      		else
	      			self.道具文本:添加文本(format("#Y/耐久度 "..item.耐久))
	      		end
      		end
      		if item.强化附加属性 ~= nil then
			    	if item.强化附加属性.命中.数值 ~= 0 then
			            self.道具文本:添加文本(format("#F/钻石强化命中 #Y+ #R"..item.强化附加属性.命中.数值))
			        end
			    	if item.强化附加属性.伤害.数值 ~= 0 then
			            self.道具文本:添加文本(format("#F/钻石强化伤害 #Y+ #R"..item.强化附加属性.伤害.数值))
			        end
			        if item.强化附加属性.气血.数值 ~= 0 then
			            self.道具文本:添加文本(format("#F/钻石强化气血 #Y+ #R"..item.强化附加属性.气血.数值))
			        end
			        if item.强化附加属性.魔法.数值 ~= 0 then
			            self.道具文本:添加文本(format("#F/钻石强化魔法 #Y+ #R"..item.强化附加属性.魔法.数值))
			        end
			        if item.强化附加属性.防御.数值 ~= 0 then
			            self.道具文本:添加文本(format("#F/钻石强化防御 #Y+ #R"..item.强化附加属性.防御.数值))
			        end
			        if item.强化附加属性.灵力.数值 ~= 0 then
			            self.道具文本:添加文本(format("#F/钻石强化灵力 #Y+ #R"..item.强化附加属性.灵力.数值))
			        end
			        if item.强化附加属性.速度.数值 ~= 0 then
			            self.道具文本:添加文本(format("#F/钻石强化速度 #Y+ #R"..item.强化附加属性.速度.数值))
			        end
			end
			if item.锻炼等级 ~= nil then
				local bsz = ""
				for i=1,#item.镶嵌宝石 do
					local sw = "、"
					if i == #item.镶嵌宝石 then
						sw = ""
					end
					bsz = bsz..item.镶嵌宝石[i]..sw
				end
				if item.分类==1 then
                  	sx=""
                 	if 命中 ~= 0  and 命中 ~= nil  then
				       sx = sx.."命中 +"..命中.." "
			       	end
			       	if 伤害 ~= 0 and 伤害 ~= nil   then
				       sx = sx.."伤害 +"..伤害.." "
			       	end
			       	self.道具文本:添加文本("#G/"..sx)
			   	elseif item.分类==3  then
                 	sx=""
                 	if 躲避 ~= 0 and 躲避 ~= nil   then
				       sx = sx.."躲避 +"..躲避.." "
			       	end
			       	self.道具文本:添加文本("#G/"..sx)
			    elseif item.分类==4 then
                  	sx=""
			       	if 气血 ~= 0 and 气血 ~= nil   then
				       sx = sx.."气血 +"..气血.." "
			       	end
			       	self.道具文本:添加文本("#G/"..sx)
                elseif item.分类==5 or item.分类==6 then
                 	sx=""
                 	if 躲避 ~= 0 and 躲避 ~= nil   then
				       sx = sx.."躲避 +"..躲避.." "
			       	end
                 	if 速度 ~= 0 and 速度 ~= nil   then
				       sx = sx.."速度 +"..速度.." "
			       	end
			       	self.道具文本:添加文本("#G/"..sx)
				end
                sx=""
			  	self.道具文本:添加文本(format("#Y/锻炼等级 %s 镶嵌宝石 %s",item.锻炼等级,bsz))
			end
			if item.临时附魔 ~= nil then
				if item.分类 == 1 then
			    	if item.临时附魔.命中.数值 ~= 0 then
			            self.道具文本:添加文本(format("#G/临时命中 "..item.临时附魔.命中.数值.." "..item.临时附魔.命中.时间))
			        end
			        if item.临时附魔.耐力.数值 ~= 0 then
			            self.道具文本:添加文本(format("#G/临时耐力 "..item.临时附魔.耐力.数值.." "..item.临时附魔.耐力.时间))
			        end
			    elseif item.分类 == 2 then
			        if item.临时附魔.体质.数值 ~= 0 then
			            self.道具文本:添加文本(format("#G/临时体质 "..item.临时附魔.体质.数值.." "..item.临时附魔.体质.时间))
			        end
			        if item.临时附魔.法术伤害.数值 ~= 0 then
			            self.道具文本:添加文本(format("#G/临时法伤 "..item.临时附魔.法术伤害.数值.." "..item.临时附魔.法术伤害.时间))
			        end
			    elseif item.分类 == 3 then
			    	if item.临时附魔.伤害.数值 ~= 0 then
			            self.道具文本:添加文本(format("#G/临时伤害 "..item.临时附魔.伤害.数值.." "..item.临时附魔.伤害.时间))
			        end
			        if item.临时附魔.气血.数值 ~= 0 then
			            self.道具文本:添加文本(format("#G/临时气血 "..item.临时附魔.气血.数值.." "..item.临时附魔.气血.时间))
			        end
			        if item.临时附魔.魔法.数值 ~= 0 then
			            self.道具文本:添加文本(format("#G/临时魔法上限 "..item.临时附魔.魔法.数值.." "..item.临时附魔.魔法.时间))
			        end
			        if item.临时附魔.防御.数值 ~= 0 then
			            self.道具文本:添加文本(format("#G/临时防御 "..item.临时附魔.防御.数值.." "..item.临时附魔.防御.时间))
			        end
			    elseif item.分类 == 4 then
			        if item.临时附魔.法术防御.数值 ~= 0 then
			            self.道具文本:添加文本(format("#G/临时法防 "..item.临时附魔.法术防御.数值.." "..item.临时附魔.法术防御.时间))
			        end
			        if item.临时附魔.魔力.数值 ~= 0 then
			            self.道具文本:添加文本(format("#G/临时魔力 "..item.临时附魔.魔力.数值.." "..item.临时附魔.魔力.时间))
			        end

			    elseif item.分类 == 5 then
			        if item.临时附魔.愤怒.数值 ~= 0 then
			            self.道具文本:添加文本(format("#G/临时愤怒 "..item.临时附魔.愤怒.数值.." "..item.临时附魔.愤怒.时间))
			        end
			    elseif item.分类 == 6 then
			        if item.临时附魔.速度.数值 ~= 0 then
			            self.道具文本:添加文本(format("#G/临时速度 "..item.临时附魔.速度.数值.." "..item.临时附魔.速度.时间))
			        end
			    end
			end
			if item.特技 ~= nil then
				self.道具文本:添加文本(format("#S/特技：%s",item.特技))
			end
			if item.特效 ~= nil then
				self.道具文本:添加文本(format("#S/特效：%s",item.特效))
			end
			if item.第二特效 ~= nil then--"龙宫
			  	self.道具文本:添加文本(format("#S/特效：%s",item.第二特效))
			end
			if item.变身套~=nil then
				self.道具文本:添加文本("#S/动物造型:"..item.变身套)
				self.道具文本:添加文本("#S/动物属性:"..item.变身套属性.."("..item.变身套属性数值..")")
			end
			if item.套装效果 ~= nil then
				self.道具文本:添加文本(format("#S/套装效果：%s",item.套装效果[1]..item.套装效果[2]))
			end
			if item.镶嵌四相 ~= nil then
				self.道具文本:添加文本(format("#S/四相 %s",item.镶嵌四相))
			end
			if item.开运孔数 ~= nil and item.开运孔数.当前 ~= nil and item.开运孔数.当前  ~= 0 then
				self.道具文本:添加文本(format("#G/开运孔数：%s",item.开运孔数.当前 .."孔/"..item.开运孔数.上限 .."孔"))
				for i=1,item.开运孔数.当前 do
				    if item.符石~=nil and item.符石[i]~=nil then
				    	local sx = ""
	                    local 气血 = item.符石[i].气血
	                    local 魔法 = item.符石[i].魔法
	                    local 命中 = item.符石[i].命中
	                    local 伤害 = item.符石[i].伤害
	                    local 防御 = item.符石[i].防御
	                    local 速度 = item.符石[i].速度
	                    local 躲避 = item.符石[i].躲避
	                    local 灵力 = item.符石[i].灵力
	                    local 体质 = item.符石[i].体质
	                    local 魔力 = item.符石[i].魔力
	                    local 力量 = item.符石[i].力量
	                    local 耐力 = item.符石[i].耐力
	                    local 敏捷 = item.符石[i].敏捷
	                    local 法术伤害 = item.符石[i].法术伤害
	                    local 法术防御 = item.符石[i].法术防御
	                    local 固定伤害 = item.符石[i].固定伤害
	                    if 气血 ~= 0 and 气血 ~= nil then
	                        sx = sx.."气血 +"..气血.." "
	                    end
	                    if 魔法 ~= 0 and 魔法 ~= nil  then
	                        sx = sx.."魔法 +"..魔法.." "
	                    end
	                    if 命中 ~= 0  and 命中 ~= nil then
	                        sx = sx.."命中 +"..命中.." "
	                    end
	                    if 伤害 ~= 0 and 伤害 ~= nil  then
	                        sx = sx.."伤害 +"..伤害.." "
	                    end
	                    if 防御 ~= 0 and 防御 ~= nil  then
	                        sx = sx.."防御 +"..防御.." "
	                    end
	                    if 速度 ~= 0 and 速度 ~= nil  then
	                        sx = sx.."速度 +"..速度.." "
	                    end
	                    if 躲避 ~= 0 and 躲避 ~= nil  then
	                        sx = sx.."躲避 +"..躲避.." "
	                    end
	                    if 灵力 ~= 0 and 灵力 ~= nil  then
	                        sx = sx.."灵力 +"..灵力.." "
	                    end
	                    if 体质 ~= 0 and 体质 ~= nil  then
	                        sx = sx.."体质 +"..体质.." "
	                    end
	                    if 魔力 ~= 0 and 魔力 ~= nil  then
	                        sx = sx.."魔力 +"..魔力.." "
	                    end
	                    if 力量 ~= 0 and 力量 ~= nil  then
	                        sx = sx.."力量 +"..力量.." "
	                    end
	                    if 耐力 ~= 0 and 耐力 ~= nil  then
	                        sx = sx.."耐力 +"..耐力.." "
	                    end
	                    if 敏捷 ~= 0 and 敏捷 ~= nil  then
	                        sx = sx.."敏捷 +"..敏捷.." "
	                    end
	                    if 法术伤害 ~= 0 and 法术伤害 ~= nil  then
	                        sx = sx.."法术伤害 +"..法术伤害.." "
	                    end
	                    if 法术防御 ~= 0 and 法术防御 ~= nil  then
	                        sx = sx.."法术防御 +"..法术防御.." "
	                    end
	                    if 固定伤害 ~= 0 and 固定伤害 ~= nil  then
	                        sx = sx.."固定伤害 +"..固定伤害.." "
	                    end
				    	if sx ~= "" then
				        	self.道具文本:添加文本("#G/符石："..sx)
				    	end
				    end
				end
			    if item.星位~=nil and item.星位[i]~=nil then
			        self.道具文本:添加文本("#G/星位："..1)
			    end
				if item.符石组合~=nil and item.符石组合.符石组合~=nil and #item.符石组合.符石组合~=0 and item.开运孔数.当前 > 0 then
					self.符石组合信息 = self:取符石组合介绍(item.符石组合)
					self.道具文本:添加文本("#f/符石组合："..item.符石组合.符石组合)
					self.道具文本:添加文本("#f/门派条件："..self.符石组合信息.门派)
					self.道具文本:添加文本("#f/部位条件："..self.符石组合信息.部位)
					self.道具文本:添加文本("#f/"..self.符石组合信息.介绍)
				end
			end
			if item.专用 ~= nil then
				self.道具文本:添加文本(format("#Y/玩家%s专用",item.专用))
			end
			if item.制造者 ~= nil then
				self.道具文本:添加文本(format("#W/制造者：%s",item.制造者))
			end
			if item.熔炼属性 ~= nil then
				self.道具文本:添加文本(format("#Y/熔炼效果："))
				if item.熔炼属性[4] ~= nil then
					self.道具文本:添加文本(format("#Y/%s%s%s %s%s%s",item.熔炼属性[3][3],math.abs(item.熔炼属性[3][2]),item.熔炼属性[3][1],item.熔炼属性[4][3],math.abs(item.熔炼属性[4][2]),item.熔炼属性[4][1]))
					self.道具文本:添加文本(format("#Y/%s%s%s %s%s%s",item.熔炼属性[1][3],math.abs(item.熔炼属性[1][2]),item.熔炼属性[1][1],item.熔炼属性[2][3],math.abs(item.熔炼属性[2][2]),item.熔炼属性[2][1]))
				elseif item.熔炼属性[3] ~= nil then
					self.道具文本:添加文本(format("#Y/%s%s%s %s%s%s",item.熔炼属性[3][3],math.abs(item.熔炼属性[3][2]),item.熔炼属性[3][1],item.熔炼属性[1][3],math.abs(item.熔炼属性[1][2]),item.熔炼属性[1][1]))
					self.道具文本:添加文本(format("#Y/%s%s%s",item.熔炼属性[2][3],math.abs(item.熔炼属性[2][2]),item.熔炼属性[2][1]))
				elseif item.熔炼属性[2] ~= nil then
					self.道具文本:添加文本(format("#Y/%s%s%s %s%s%s",item.熔炼属性[1][3],math.abs(item.熔炼属性[1][2]),item.熔炼属性[1][1],item.熔炼属性[2][3],math.abs(item.熔炼属性[2][2]),item.熔炼属性[2][1]))
				else
					self.道具文本:添加文本(format("#Y/%s%s%s",item.熔炼属性[1][3],math.abs(item.熔炼属性[1][2]),item.熔炼属性[1][1]))
				end
			end
			if item.幻化特性 ~= nil then
     			self.道具文本:添加文本("#Y特性："..item.幻化特性.名称.."+"..item.幻化特性.数额.."%")
     		end
		else
			if item.分类 == 3 then
				if #item.角色限制==1 then
				    self.道具文本:添加文本("#W/【装备角色】"..item.角色限制[1])
				else
					self.道具文本:添加文本("#W/【装备角色】"..item.角色限制[1].."、"..item.角色限制[2])
				end

			elseif item.分类 == 1 or item.分类 == 4 then
				self.道具文本:添加文本("#W/【装备角色】"..item.性别限制)
			elseif item.分类 > 6 then
				self.道具文本:添加文本("#W/【角色限制】召唤兽")
			else
				self.道具文本:添加文本("#W/【角色限制】无角色限制")
			end
			if jd == nil  then
				self.道具文本:添加文本("#Y/等级 "..item.级别限制)
				self.道具文本:添加文本("#R/未鉴定物品")
			end
		end
	elseif zls == 3 then
		if item.分类 == 1 then
		  	if item.附带技能==nil then
             	item.附带技能="获得后随机生成"
		  	end
			self.道具文本:添加文本("#Y/所带技能: "..item.附带技能)
		elseif item.分类 == 3 then
			if item.子类==0 then
			    if item.附带技能 == nil then
					self.道具文本:添加文本("#Y/随机生成内丹")
				else
					self.道具文本:添加文本("#Y/所带内丹技能:"..item.附带技能)
			    end
			else
				self.道具文本:添加文本("#Y/等级 "..item.级别限制)
			end
	   	elseif item.分类 == 10 then
		   self.道具文本:添加文本("#Y/种类 "..item.种类..",等级 "..item.级别限制)
	   	elseif item.分类 == 11 then
		   self.道具文本:添加文本("#Y/等级 "..item.级别限制..",灵气 "..item.灵气)
		end
    elseif zls == 4 then
    	if item.名称 == "神兵图鉴" then
    		self.道具文本:添加文本("#W/【功效】 使用可以鉴定等级≤图鉴等级的衣服和武器")
    		self.道具文本:添加文本(format("#Y/等级: %d",item.子类))
    	elseif item.名称 == "灵宝图鉴" then
    		self.道具文本:添加文本("#W/【功效】 使用可以鉴定等级≤图鉴等级的头盔、腰带、饰品和鞋子")
    		self.道具文本:添加文本(format("#Y/等级: %d",item.子类))
    	elseif item.名称 == "附魔宝珠-动物套" then
    		if item.参数== nil then
	    		self.道具文本:添加文本("#Y/【动物模型】："..item.动物)
	    		self.道具文本:添加文本("#Y/【附魔属性】："..item.属性)
	    		self.道具文本:添加文本("#Y/【属性数值】："..item.数值)
	    	end
	    	if item.参数~= nil then
	    		self.道具文本:添加文本("#Y/【动物模型】：随机")
	    		self.道具文本:添加文本("#Y/【附魔属性】：随机")
	    		self.道具文本:添加文本("#Y/【属性数值】：满属性100")
	    	end

    	end
	elseif zls == 5 then
		if item.分类 == 1 then
			local it = tp:取武器子类(item.特效)
			self.道具文本:添加文本("#Y/种类 "..it..", 等级 "..item.子类)
		elseif item.分类 == 2 or item.分类 == 21 then
		  if item.名称=="元灵晶石" and item.子类==nil then
             self.道具文本:添加文本("#Y/获得后随机生成60-140级的元灵晶石")
          else
			 self.道具文本:添加文本(format("#Y/等级 %d",item.子类))
          end
           elseif item.名称=="点化石" then
			self.道具文本:添加文本("#Y/右键使用")
		    self.道具文本:添加文本("#Y/点化技能: "..item.技能)
		elseif item.分类 == 3 then
			self.道具文本:添加文本("#Y/功效 用于分解装备获得宝石")
		elseif item.分类 == 4 then
			--self.道具文本:添加文本(format("#Y/功效 %s",item.特效))
		elseif item.分类 == 5 then
			  self.道具文本:添加文本(format("#Y/【附加技能】%s",item.附带技能))
		elseif item.分类 == 6 then
		   	if item.名称~="星辉石" and item.名称 ~= "钟灵石" and item.名称 ~= "融合石" and item.名称 ~= "强化石"  then
			  self.道具文本:添加文本(format("#W/【镶嵌装备】%s",item.角色限制))
			  self.道具文本:添加文本(format("#W/【镶嵌效果】%s",item.特效))
			elseif item.名称=="钟灵石" then
			  self.道具文本:添加文本(format("#Y/附加特性：%s#G(等级%s)",item.附加特性,item.级别限制))
			  if item.附加特性=="心源" then
				self.道具文本:添加文本("#S/战斗中有"..item.级别限制.."%的几率触发3倍伤害结果")
			  elseif item.附加特性=="狂浪滔天" then
			  	self.道具文本:添加文本("#S/提高人物"..item.级别限制.."%的灵力值")
			  elseif item.附加特性=="固若金汤" then
			  	self.道具文本:添加文本("#S/提高人物"..item.级别限制.."%的防御")
			  elseif item.附加特性=="锐不可当" then
			  	self.道具文本:添加文本("#S/提高人物"..item.级别限制.."%的伤害")
			  elseif item.附加特性=="通真达灵" then
			  	self.道具文本:添加文本("#S/提高人物"..item.级别限制.."%的法术防御")
			  elseif item.附加特性=="血气方刚" then
			  	self.道具文本:添加文本("#S/提高人物"..item.级别限制.."%的气血")
			  elseif item.附加特性=="健步如飞" then
			  	self.道具文本:添加文本("#S/提高人物"..item.级别限制.."%的速度")
			  end
			end
			if  item.名称~="钟灵石"  and item.名称 ~= "融合石" then
				self.道具文本:添加文本(format("#Y/等级 %s",item.级别限制))
			end
		elseif item.分类 == 7 then
			self.道具文本:添加文本("#Y/获得后随机生成"..item.名称)
		elseif item.分类 == 8 then
			self.道具文本:添加文本("#Y/获得后随机生成100级到130级"..item.名称)
     	elseif item.分类 == 20 then
         	if item.特效~=nil and item.子类~=nil then
	          	self.道具文本:添加文本("#Y/种类 "..item.特效..", 等级 "..item.子类)
	        else
	           	self.道具文本:添加文本("#Y/获得后随机生成60-140级的灵饰指南书")
	       	end
		end
	elseif zls == 7 then
		if item.分类 == 1 then
			if item.名称=="藏宝图" then
             self.道具文本:添加文本("#Y/【类型】普通藏宝图")
            else
             self.道具文本:添加文本("#Y/【类型】高级藏宝图")
			end
			self.道具文本:添加文本(format("#Y/【坐标】#G/%s(%s,%s)",item.地图名称,item.x,item.y))
			--self.道具文本:添加文本(format("#Y/坐标 X：%d Y：%d",item.气血,item.魔法))
		end
	elseif zls == 9 then
		if item.分类 == 1 and item.名称 ~= "魔兽残卷" then
			self.道具文本:添加文本("#Y/右键使用")
		end
	elseif zls == 10 then
		if item.分类 == 4 then
			self.道具文本:添加文本("#Y/右键使用")
		elseif item.分类 == 3 then
			self.道具文本:添加文本("#Y/右键使用可增加150点的体力和活力")
		end
	elseif zls == 11 then
		--print(item.分类)
     	if item.分类==1 then
	         if item.地图==nil then
	            self.道具文本:添加文本("#Y/武魂界面使用")
	          else
	           local map = 取地图名称(item.地图)
	           self.道具文本:添加文本(format("#Y/%s(%d,%d)",map,item.x,item.y))
		       self.道具文本:添加文本(format("#Y/还可使用%s次",item.次数))
	         end
        elseif item.分类==2 then
         	self.道具文本:添加文本(format("#Y/场景:%s,还能使用%s次",取地图名称(item.地图),item.次数))
        end

	elseif zls == 12 then
		self.道具文本:添加文本(format("#Y/变化对象：%s",item.子类))
	elseif zls == 13 then
		self.道具文本:添加文本(format("#Y/阵型:%s",item.子类))
	elseif zls == 21 and item.特效 ~= nil then
		self.道具文本:添加文本(format("#Y/说明：%s",item.特效))
	elseif zls == 30 then
		self.道具文本:添加文本(format("#W/卡片类型：%s",item.造型))
		self.道具文本:添加文本(format("#W/技能要求：%s",数字转大写(item.等级).."级变化之术"))
		local 变身卡技能=item.技能
		if 变身卡技能=="" then 变身卡技能="无" end
		self.道具文本:添加文本(format("#W/【附加技能】%s",变身卡技能))
		local 组合语句=""
		if item.属性==0 then
          组合语句="无"
        elseif item.单独==1 then
        	if item.正负==1 then
             组合语句=item.类型.."+"..item.属性
            else
             组合语句=item.类型.."-"..item.属性
        		end
       else
         if item.正负==1 then
             组合语句=item.类型.."+"..item.属性.."%"
            else
             组合语句=item.类型.."-"..item.属性.."%"
        		end
			end
		self.道具文本:添加文本(format("#W/【属性影响】%s",组合语句))
		self.道具文本:添加文本(format("#Y/等级：%s  剩余使用次数：%s",item.等级,item.次数))
		self.道具文本:添加文本(format("#Y/持续时间：%s分钟","15分钟*(1+变化之术等级)"))
	elseif zls == 55 then --
		local fssx = qwp(item.名称)
		self.属性1 = fssx[18]
		self.属性值1 = fssx[19]
		self.属性2 = fssx[21]
		self.属性值2 = fssx[22]
		self.等级=fssx[16]
		self.颜色=fssx[20]
		if item.耐久度 ~=nil then
		    self.耐久=math.floor(item.耐久度)
		end
		self.道具文本:添加文本("#W/【用途】 可镶嵌在有开运孔数的装备上")
		self.道具文本:添加文本(format("#Y/等级：%s  %s",self.等级,self.颜色))
		if fssx[16] == 1 or fssx[16] == 2 then
			self.道具文本:添加文本(format("#Y/"..self.属性1.." +%s",self.属性值1))
		else
			self.道具文本:添加文本(format("#Y/"..self.属性1.." +%s "..self.属性2.." +%s ",self.属性值1,self.属性值2))
		end
		if item.耐久度~=nil then
      		self.道具文本:添加文本(format("#Y/耐久度 "..item.耐久度))
		end
	elseif zls == 56 then
		self.道具文本:添加文本("#W/【激活方式】 鼠标右键点击使用激活")
    elseif zls == 57 then
    	if item.分类~=1 then
			self.道具文本:添加文本(format("\n#Y/玄天灵力:%s",item.玄天灵力))
		end



	elseif zls == 101 then
		self.道具文本:添加文本("#W/【期限】 强化符在下线10分钟后自动消失")
		if item.类型=="龙附" or item.类型=="轻如鸿毛" or item.类型=="魔王护持" or item.类型=="盘丝舞" or item.类型=="元阳护体" then
		    self.道具文本:添加文本(format("#Y/以"..item.等级.."级的"..item.类型.."法术效果在一定时间内强化一件武器"))
		elseif item.类型=="嗜血" or item.类型=="莲华妙法" then
			self.道具文本:添加文本(format("#Y/以"..item.等级.."级的"..item.类型.."法术效果在一定时间内强化一件项链"))
		elseif item.类型=="神兵护法" or item.类型=="尸气漫天" then
			self.道具文本:添加文本(format("#Y/以"..item.等级.."级的"..item.类型.."法术效果在一定时间内强化一件帽子"))
		elseif item.类型=="拈花妙指" or item.类型=="神木呓语" then
			self.道具文本:添加文本(format("#Y/以"..item.等级.."级的"..item.类型.."法术效果在一定时间内强化一件鞋子"))
		elseif item.类型=="浩然正气" or item.类型=="一气化三清" then
			self.道具文本:添加文本(format("#Y/以"..item.等级.."级的"..item.类型.."法术效果在一定时间内强化一件衣服"))
		elseif item.类型=="穿云破空" or item.类型=="神力无穷" then
			self.道具文本:添加文本(format("#Y/以"..item.等级.."级的"..item.类型.."法术效果在一定时间内强化一件腰带"))
		end
	elseif zls == "召唤兽道具" then
		if item.名称 == "清灵净瓶" then
		    self.道具文本:添加文本("#Y/使用后随机开出初级,中级,高级清灵仙露")
		end
		if item.名称 == "初级清灵仙露" or item.名称 == "中级清灵仙露" or item.名称 == "高级清灵仙露" then
		    self.道具文本:添加文本("#Y/灵气: "..item.灵气)
		end
	elseif zls == "装备礼包" then
		if item.装有数量 ~= nil then
		    self.道具文本:添加文本("#Y/内有数量: "..item.装有数量)
		end

	elseif zls == 1000 then
	--	self.道具文本:添加文本(format("【法宝等级】%s级法宝",item.分类))
		self.道具文本:添加文本(string.format("#G/%d#Y/级法宝,修炼境界：第#G/%d#Y/层 %s",item.分类,item.气血,取境界(item.气血,item.分类)))
		self.道具文本:添加文本(string.format("#Y/灵气:#G/%d #Y/五行:#G/%s",item.魔法,item.五行))
		local xz=""
		if item.名称=="月光宝盒" and  item.地图~=nil then
             xz=format("#Y传送至%s(%s,%s),",取地图名称(item.地图),item.x,item.y)
			 end
		if item.使用 == 0 then
			xz =xz.."需要佩戴才可在战斗中发挥效用"
	   	elseif item.使用 ==2 then
			xz = xz.."无需佩戴,非战斗中选择使用"
		else
		    xz = xz..format("无需佩戴，在战斗中选择使用，使用回合限制：#G/%d#Y/",item.角色限制)
		end
		self.道具文本:添加文本(format("#Y/%s",xz))
		self.道具文本:添加文本(format("#Y/使用装备限制：#G/人物等级≥%d",item.特技))
	elseif zls == 2000 then
		self.道具文本:添加文本("【基本伤害】"..item.分类)
		self.道具文本:添加文本(" #Y/耐久度 "..math.floor(item.耐久))
	elseif zls == "坐骑饰品" then
		self.道具文本:添加文本(format("【类    型】 %s",item.总类))
		self.道具文本:添加文本(format("【装备坐骑】 %s",item.子类))
	end
	h = self.道具文本.显示表.高度+10
	if h < 130 then
		h = 130
	end
	if x + w >= 全局游戏宽度-20 then
		x = 全局游戏宽度-20 - w
	end
	if y + h > 600 then
		y = y - h - 30
	end
	if item.强化附加属性 ~= nil then
	  self.寄存内容 = {}
	  self.寄存内容[1] = {}
	  self.寄存内容[1].内容 = item.大模型
	  self.寄存内容[1].x = x+3
	  self.寄存内容[1].y = y+5
	  if item.强化附加属性.强化等级 >= 1 then
	     self.寄存内容[4] = {}
	     self.寄存内容[4].内容 = tp.装备强化升星_
	     self.寄存内容[4].x = x+10
	     self.寄存内容[4].y = y-122
	 end
	  if item.强化附加属性.强化等级 >= 2 then
	     self.寄存内容[5] = {}
	     self.寄存内容[5].内容 = tp.装备强化升星_
	     self.寄存内容[5].x = x+30
	     self.寄存内容[5].y = y-122
	 end
	  if item.强化附加属性.强化等级 >= 3 then
	     self.寄存内容[6] = {}
	     self.寄存内容[6].内容 = tp.装备强化升星_
	     self.寄存内容[6].x = x+50
	     self.寄存内容[6].y = y-122
	 end
	  if item.强化附加属性.强化等级 >= 4 then
	     self.寄存内容[7] = {}
	     self.寄存内容[7].内容 = tp.装备强化升星蓝色_
	     self.寄存内容[7].x = x+200
	     self.寄存内容[7].y = y+15
	 end
	  if item.强化附加属性.强化等级 >= 5 then
	     self.寄存内容[8] = {}
	     self.寄存内容[8].内容 = tp.装备强化升星蓝色_
	     self.寄存内容[8].x = x+220
	     self.寄存内容[8].y = y+15
	 end
	  if item.强化附加属性.强化等级 >= 6 then
	     self.寄存内容[9] = {}
	     self.寄存内容[9].内容 = tp.装备强化升星蓝色_
	     self.寄存内容[9].x = x+240
	     self.寄存内容[9].y = y+15
	 end
	  if item.强化附加属性.强化等级 >= 7 then
	     self.寄存内容[10] = {}
	     self.寄存内容[10].内容 = tp.装备强化升星金色_
	     self.寄存内容[10].x = x+260
	     self.寄存内容[10].y = y+15
	 end
	  if item.强化附加属性.强化等级 >= 8 then
	     self.寄存内容[11] = {}
	     self.寄存内容[11].内容 = tp.装备强化升星金色_
	     self.寄存内容[11].x = x+280
	     self.寄存内容[11].y = y+15
	 end
	  if item.强化附加属性.强化等级 >= 9 then
	     self.寄存内容[12] = {}
	     self.寄存内容[12].内容 = tp.装备强化升星金色_
	     self.寄存内容[12].x = x+300
	     self.寄存内容[12].y = y+15
	 end
	 if item.强化附加属性.强化等级 >= 10 then
	     self.寄存内容[13] = {}
	     self.寄存内容[13].内容 = tp.装备强化升星钻石_
	     self.寄存内容[13].x = x+340
	     self.寄存内容[13].y = y+15
	 end
	 	self.寄存内容[2] = {}
	    self.寄存内容[2].内容 = self.道具文本
	    self.寄存内容[2].x = x + 128
	    self.寄存内容[2].y = y + 35
	    self.寄存内容[3] = {}
	    self.寄存内容[3].文字 = tp.字体表.道具字体
	    self.寄存内容[3].颜色 = -256
	    self.寄存内容[3].文本 = item.名称.." +"..item.强化附加属性.强化等级
	    self.寄存内容[3].坐标 = {[1]=x+128.8,[2]=y+24}
	 if item.物品加锁 == 1 then
	     self.寄存内容[4] = {}
	     self.寄存内容[4].内容 = tp.物品加锁_
	     self.寄存内容[4].x = x+290
	     self.寄存内容[4].y = y+5
	   end
        self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h+20}
	    self.寄存内容.开启提示 = true

  else
	  self.寄存内容 = {}
	  self.寄存内容[1] = {}
	  self.寄存内容[1].内容 = item.大模型
	  self.寄存内容[1].x = x+3
	  self.寄存内容[1].y = y+5
	  self.寄存内容[2] = {}
	  self.寄存内容[2].内容 = self.道具文本
	  self.寄存内容[2].x = x + 128
	  self.寄存内容[2].y = y + 15
	  self.寄存内容[3] = {}
	  self.寄存内容[3].文字 = tp.字体表.道具字体
	  self.寄存内容[3].颜色 = -256
	  self.寄存内容[3].文本 = item.名称
	  self.寄存内容[3].坐标 = {[1]=x+128.8,[2] =y+4}
	  if item.物品加锁 == 1 then
	     self.寄存内容[4] = {}
	     self.寄存内容[4].内容 = tp.物品加锁_
	     self.寄存内容[4].x = x+290
	     self.寄存内容[4].y = y+5
	   end
	   self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	   self.寄存内容.开启提示 = true
end
end

function 系统类_提示框:取经脉介绍(jn)
-- 奇经八脉
	-- 方寸山
	local jns = {}
	if jn == "苦缠" then
		jns[1] = "失魂符、失心符、定身符降低属性的效果增加3%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xE99E9C96
		jns[8] = 0xE99E9C96
	elseif jn == "雷动" then
		jns[1] = "使用落雷符时增加100点伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD2180C25
		jns[8] = 0xD2180C25
	elseif jn == "奔雷" then
		jns[1] = "使用五雷咒时，额外攻击另一个敌方目标。自身封印命中率下降15%。霹雳咒等级≥125时，首目标额外提高10%伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB490BD29
		jns[8] = 0xB490BD29
	elseif jn == "黄粱" then
		jns[1] = "敌方目标被自己催眠时。必须受到100点以上的伤害才会苏醒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD3CF1A9E
		jns[8] = 0xD3CF1A9E
	elseif jn == "不舍" then
		jns[1] = "每受到大于气血上限20%的物理伤害后，会自动使用归元咒，被封印时无法触发。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB60A561A
		jns[8] = 0xB60A561A
	elseif jn == "鬼怮" then
		jns[1] = "五雷咒提升对含有鬼魂术的敌人伤害提高30%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB44BA05E
		jns[8] = 0xB44BA05E
	elseif jn == "补缺" then
		jns[1] = "回合开始时，若自身魔法小于魔法上限30%时，有35%几率回复乾天罡气同等量的魔法"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x3A33F2CD
		jns[8] = 0x3A33F2CD
	elseif jn == "不倦" then
		jns[1] = "催眠符命中效果增加20%"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA2F9E185
		jns[8] = 0xA2F9E185
	elseif jn == "集中" then
		jns[1] = "提升(武器伤害/命中)*24的灵力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA2F9E185
		jns[8] = 0xA2F9E185
	elseif jn == "不灭" then
		jns[1] = "每次使用完封印类法术时，有15%的几率自动使用技能归元咒并在一定回合内提高自身10%的防御和灵力"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAE728B11
		jns[8] = 0xAE728B11
	elseif jn == "化身" then
		jns[1] = "分身术持续回合数提高1回合"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xE950182D
		jns[8] = 0xE950182D
	--[[elseif jn == "调息" then
		jns[1] = "带有分身术状态时，回合结束恢复气血上限*4%的气血与魔法上限*3%的魔法"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2ACC6068
		jns[8] = 0x2ACC6068 --]]
	elseif jn == "批亢" then
		jns[1] = "带有分身术状态时，所受伤害降低15%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x200F0880
		jns[8] = 0x200F0880
	elseif jn == "斗法" then
		jns[1] = "增加10%的封印命中率。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x1EEA41F8
		jns[8] = 0x1EEA41F8
	elseif jn == "吐纳" then
		jns[1] = "主动使用的归元咒将额外恢复气血上限*20%的气血，但额外消耗对应值*25%的魔法值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x47BCA30B
		jns[8] = 0x47BCA30B
	elseif jn == "飞符炼魂" then
		jns[1] = "一道法力强大的符咒，能在攻击敌人的同时附加封印效果，由于效果惊人，菩提祖师禁止弟子随意使用。使用法术攻击目标后70%几率追加使用法术落魄符，并额外造成300点伤害。"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x4C6405CB
		jns[8] = 0x4C6405CB
		jns[12] = '5回合'
	elseif jn == "鬼念" then
		jns[1] = "含有鬼魂术(包括高级鬼魂术)类的敌人降低对自身造成伤害的15%"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x173015AE
		jns[8] = 0x173015AE
	elseif jn == "碎甲" then
		jns[1] = "使碎甲符作用人数提高3人，持续回合数增加1回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF701C5B5
		jns[8] = 0xF701C5B5
	elseif jn == "摧心" then
		jns[1] = "当自身对目标造成物理伤害之后，目标概率会在之后的3回合内进入虚弱状态，降低10%的伤害力、灵力和物理防御。该效果的持续回合可以被刷新。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF2BAFEF2
		jns[8] = 0xF2BAFEF2
	elseif jn == "顺势而为" then
		jns[1] = "精于封印的方寸弟子可以耗费一定的愤怒值对目标施加强大的法力，在下一次使用封系符咒时100%封印目标，封印效果持续3回合。"
		jns[3] = 4
		jns[4] = "60点愤怒"
		jns[6] = "wzife.wd2"
		jns[7] = 0x9E6FFF66
		jns[8] = 0x9E6FFF66
		jns[12] = "5回合"
	elseif jn == "钟馗论道" then
		jns[1] = "方寸弟子乃鬼魂生物的噩梦，他们甚至能够临时将自己善于对付鬼魂生物的能力赋予其队友。给己方指定成员（包括召唤兽）附加驱鬼技能状态"
		jns[3] = 3
		jns[4] = "40点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xB7CDB6AA
		jns[8] = 0xB7CDB6AA
	-- 女儿
	elseif jn == "自矜" then
		jns[1] = "每次使用单体封印技能失败时，使得下次单体封印时成功率提高30%。到下一次命中时清空该效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x22A77A43
		jns[8] = 0x22A77A43
	elseif jn == "暗伤" then
		jns[1] = "雨落寒沙增加武器伤害*18%的固定伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x50E3D938
		jns[8] = 0x50E3D938
	elseif jn == "杏花" then
		jns[1] = "使用雨落寒沙技能攻击时对方中毒几率增加4%。并且能对带有“高级毒”的单位起效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x30B186DD
		jns[8] = 0x30B186DD
	elseif jn == "花舞" then
		jns[1] = "每回合开始时提升自身6%的初始速度,持续到战斗结束。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD5669AE4
		jns[8] = 0xD5669AE4
	elseif jn == "倩影" then
		jns[1] = "提升自己50点速度。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x86C6B8EF
		jns[8] = 0x86C6B8EF
	elseif jn == "淬芒" then
		jns[1] = "每一次你使对方中毒，都可以为自己增加4%的封印命中率，封印对方时，封印命中率将重置"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x20661796
		jns[8] = 0x20661796
	elseif jn == "傲娇" then
		jns[1] = "使用特技时，愤怒消耗减少5点。使用笑里藏刀时，愤怒消耗额外减少6点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x53DABF54
		jns[8] = 0x53DABF54
	elseif jn == "花护" then
		jns[1] = "使用水清诀、冰清诀、晶清诀、玉清诀时，愤怒消耗减少8点，并且可以使目标100%抵抗封类法术，持续一回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC412A4C0
		jns[8] = 0xC412A4C0
	elseif jn == "天香" then
		jns[1] = "每次使对方中毒，你回复5点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2AD7F908
		jns[8] = 0x2AD7F908
	elseif jn == "国色" then
		jns[1] = "召唤兽进入战斗时速度增加12%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0D719443
		jns[8] = 0x0D719443
	elseif jn == "鸿影" then
		jns[1] = "若处于被封印状态，仍然可以使用雨落寒沙技能。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x25260F44
		jns[8] = 0x25260F44
	elseif jn == "轻霜" then
		jns[1] = "任何企图攻击你的对手都有30%在攻击时受到毒的影响，每回合损失毒经技能等级*3的气血，持续4回合，该状态不可叠加。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x848E3B4F
		jns[8] = 0x848E3B4F
	elseif jn == "机巧" then
		jns[1] = "每次你的封印成功时，敌方会受到毒的影响，每回合损失毒经技能等级*3的气血，持续4回合，该状态不可叠加。（仅封印回合有效）"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xE6EF1BBC
		jns[8] = 0xE6EF1BBC
	elseif jn == "毒引" then
		jns[1] = "对手主动解除由女儿村弟子产生的毒效果时，会额外受到600点气血损失，但最低将对手气血降为1点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x57BD8D19
		jns[8] = 0x57BD8D19
	elseif jn == "毒雾" then
		jns[1] = "使用封印技能时，有30%几率使目标中毒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA3E0CA7F
		jns[8] = 0xA3E0CA7F
	elseif jn == "嫣然" then
		jns[1] = "一笑倾城和似玉生香的命中率提高12%，对每个目标的持续回合有60%的几率提升1回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x463DBA13
		jns[8] = 0x463DBA13
	elseif jn == "磐石" then
		jns[1] = "一个回合中，受到一个目标的伤害后，之后每次所受其他目标的伤害会递减50点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4F264E2A
		jns[8] = 0x4F264E2A
	elseif jn == "花殇" then
		jns[1] = "飞花摘叶目标人数提高3人，持续回合提高一回合，且命中几率提高5%"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x3590A7E4
		jns[8] = 0x3590A7E4
	elseif jn == "碎玉弄影" then
		jns[1] = "“宁为玉碎，不为瓦全”，又有多少对手可以从女儿村弟子曼妙的舞姿身影中体味那一份决绝呢？以牺牲4%的封印命中率对目标使用似玉生香，若第一次不中，则可以触发第二次，第二次也牺牲4%的封印命中率。"
		jns[3] = 4
		jns[4] = "40点愤怒"
		jns[6] = "wzife.wd2"
		jns[7] = 0x347D755D
		jns[8] = 0x347D755D
		jns[12] = "5回合"
	elseif jn == "额外能力" then
		jns[1] = "学习“碎玉弄影”以后，每个额外乾元丹会增加40点封印命中等级，学习“鸿渐于陆”以后，每个额外的乾元丹会增加80点抵抗封妖等级。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA209C3C2
		jns[8] = 0xA209C3C2
	elseif jn == "鸿渐于陆" then
		jns[1] = "伤其十指，不如断其一指。必要的时刻可以将伤害凝聚起来，给予对手一次致命的攻击。附加武器伤害*130%的伤害对对手单体进行攻击，使目标有100%率中毒。"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x18D93692
		jns[8] = 0x18D93692
		jns[12] = "4回合"
	-- 神木林
	elseif jn == "风灵" then
		jns[1] = "每次使用落叶萧萧攻击时，每命中一个目标都有48%的几率使施法者获得风灵效果，风灵效果持续到战斗结束，最高可叠加10层；施法者进行法术攻击时额外增加风灵层数*瞬息万变技能等级*0.1的法术攻击伤害力。"
		jns[6] = "wzife.wd4"
		jns[7] = 0x4BB78E6D
		jns[8] = 0x4BB78E6D
	elseif jn == "法身" then
		jns[1] = "你的落叶萧萧在对目标施放时会额外作用一个单位。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xC3E2C628
		jns[8] = 0xC3E2C628
	elseif jn == "咒术" then
		jns[1] = "同时被落叶萧萧命中的目标有25%几率获得“雾杀”效果。如果目标带有雾杀效果，且目标雾杀效果消失时会为施法者附加一层“雾痕”的效果，雾痕会使施法者增加雾痕层数*0.1*巫咒技能等级的法术伤害，但雾痕效果最高叠加6层"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xDBFE0302
		jns[8] = 0xDBFE0302
	elseif jn == "灵压" then
		jns[1] = "法术攻击类技能伤害结果提高8%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x8BE68718
		jns[8] = 0x8BE68718
	elseif jn == "咒法" then
		jns[1] = "巫咒等级≥人物等级时，增加60点法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xE17F1C2E
		jns[8] = 0xE17F1C2E
	elseif jn == "蔓延" then
		jns[1] = "使用荆棘舞时会消耗自身所有的雾痕，每层雾痕额外增加30点伤害效果"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xDA21274D
		jns[8] = 0xDA21274D
	elseif jn == "鞭挞" then
		jns[1] = "荆棘舞会额外增加“万灵诸念”等级*风灵层数*0.3的法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x2AAB3A47
		jns[8] = 0x2AAB3A47
	elseif jn == "月影" then
		jns[1] = "星月之惠效果增加20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x95F03B6B
		jns[8] = 0x95F03B6B
	elseif jn == "不侵" then
		jns[1] = "带有“炎护”时，攻击你的目标有50%的几率被附加“雾杀”效果。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x51C241BE
		jns[8] = 0x51C241BE
	elseif jn == "风魂" then
		jns[1] = "战斗中提升自身风灵层数*10的防御。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xD53A237C
		jns[8] = 0xD53A237C
	elseif jn == "冰锥" then
		jns[1] = "当使用冰川怒成功冰冻目标时有几率将是施法者身上的雾痕层数提高一倍；当冰川怒对触发过“高级神佑复生”或“神佑复生”的目标时将附加风灵层数*15的伤害值。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x83D1EA06
		jns[8] = 0x83D1EA06
	elseif jn == "血契" then
		jns[1] = "使用血雨时会消耗自身全部的雾痕印记，但会额外对目标使用一次血雨，且使用血雨时无需休息并且会附加200点的固定伤害，但同时自身会再次消耗200点魔法。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x1A899ACD
		jns[8] = 0x1A899ACD
	elseif jn == "滋养" then
		jns[1] = "使用蜜润时，会为目标额外回复自身一定的魔法"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x82DE1BB0
		jns[8] = 0x82DE1BB0
	elseif jn == "纯净" then
		jns[1] = "进入战斗时临时提高万物轮转等级*2的气血上限"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x8E6B4692
		jns[8] = 0x8E6B4692
	elseif jn == "破杀" then
		jns[1] = "“雾杀”在消失时会发生爆炸，爆炸产生的伤害为最后回合本应造成伤害的150%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xE567BAAB
		jns[8] = 0xE567BAAB
	elseif jn == "追击" then
		jns[1] = "当使用尘土刃时有风灵层数*5%的几率对额外的一个目标造成50%的伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xCE2EEB29
		jns[8] = 0xCE2EEB29
	elseif jn == "灵能" then
		jns[1] = "使用落叶萧萧将有30%的几率对目标额外造成(施法者灵力#W//瞬息万变技能等级)*5的伤害"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xF316F196
		jns[8] = 0xF316F196
	elseif jn == "寄生" then
		jns[1] = "使用尘土刃时将会引爆目标身上的所有雾痕印记，每层印记造成75点的固定伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x92FE057C
		jns[8] = 0x92FE057C
	elseif jn == "风卷残云" then
		jns[1] = "神木林在觉醒，风在咆哮！大风带着神木林弟子的怒意无情的打击面前的敌人。对目标使用一次落叶萧萧技能，并且对目标附加风灵印记层数*50点的固定伤害。"
		jns[3] = 4
		jns[4] = "150点魔法"
		jns[6] = "wzife.wd4"
		jns[7] = 0x3778487D
		jns[8] = 0x3778487D
		jns[12] = "5回合"
	elseif jn == "凋零之歌" then
		jns[1] = "歌声飘进敌人的耳中，颤动着敌人心窝，在无形中侵袭着敌阵的斗志，埋下毁灭之种。目标接下来2回合受到的法术伤害增加16%，若目标带有雾杀效果，则引爆雾杀效果，否则只能造成100点伤害；并使对手随机3个未带雾杀效果的目标获得雾杀效果。"
		jns[3] = 4
		jns[4] = "100点魔法"
		jns[6] = "wzife.wd4"
		jns[7] = 0x281E732A
		jns[8] = 0x281E732A
		jns[12] = "8回合"
	-- 化生寺
	elseif jn == "止戈" then
		jns[1] = "在原恢复技能的治疗量上再增加自身武器伤害*18%的治疗量。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x96670F08
		jns[8] = 0x96670F08
	elseif jn == "销武" then
		jns[1] = "唧唧歪歪所造成的伤害将提高与人物等级同等的伤害量"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9A717CB4
		jns[8] = 0x9A717CB4
	elseif jn == "佛屠" then
		jns[1] = "金刚护法的的增益效果将在原始效果上再次增加武器伤害的9%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x32BE260B
		jns[8] = 0x32BE260B
	elseif jn == "佛誉" then
		jns[1] = "活血效果提高20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF28C8F12
		jns[8] = 0xF28C8F12
	elseif jn == "仁心" then
		jns[1] = "使用活血时有20%的几率使活血的功效增加100%，但会额外消耗100点魔法。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x265842A6
		jns[8] = 0x265842A6
	elseif jn == "聚气" then
		jns[1] = "每次使用恢复类门派技能时，都将会获得一层聚气印记，每层聚气印记将额外提高辅助类门派技能的功效9%"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x86873B99
		jns[8] = 0x86873B99
	elseif jn == "佛显" then
		jns[1] = "推气过宫治疗效果提升10%"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8D52FE90
		jns[8] = 0x8D52FE90
	elseif jn == "心韧" then
		jns[1] = "在使用推气过宫时有15%的几率使治疗效果增加100%，但同时也将额外消耗150点魔法。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x823DD991
		jns[8] = 0x823DD991
	elseif jn == "归气" then
		jns[1] = "自身所有的治疗类技能都将额外增加10%的消耗，但是治疗效果将增加8%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x369BD94B
		jns[8] = 0x369BD94B
	elseif jn == "天照" then
		jns[1] = "每次使用舍身取义时都将有20%的几率恢复75点魔法，但将额外扣除75点气血。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xE1910A2F
		jns[8] = 0xE1910A2F
	elseif jn == "舍利" then
		jns[1] = "自身死亡后，己方队员随机一名队员将增加自身与自身愤怒同等的愤怒量，但是最高不会超过120点，一场战斗最多触发3次此效果."
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEE1C323A
		jns[8] = 0xEE1C323A
	elseif jn == "感念" then
		jns[1] = "使用舍身取义时，临时提升目标物理防御及法术防御10%，持续3回合，不可叠加。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xDC31E128
		jns[8] = 0xDC31E128
	elseif jn == "慈针" then
		jns[1] = "使用我佛慈悲可以使自身获得30点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xFD3253DA
		jns[8] = 0xFD3253DA
	elseif jn == "佛性" then
		jns[1] = "我佛慈悲可以增加目标80点物理防御及法术防御，持续5回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5D47F1F4
		jns[8] = 0x5D47F1F4
	elseif jn == "妙悟" then
		jns[1] = "恢复目标人物等级*3的气血及等级*2的魔法。同时自身会触发一次一苇渡江效果"
		jns[3] = 3
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x2F3B9A81
		jns[8] = 0x2F3B9A81
		jns[12] = "5回合"
	elseif jn == "慈心" then
		jns[1] = "使用慈航普度时消耗的愤怒减少40点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5816C756
		jns[8] = 0x5816C756
	elseif jn == "映法" then
		jns[1] = "金刚护法、金刚护体、一苇渡江有50%几率对所有单位起效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC8D9EE20
		jns[8] = 0xC8D9EE20
	elseif jn == "流刚" then
		jns[1] = "金刚护法、金刚护体、一苇渡江的效果增加20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x067D652B
		jns[8] = 0x067D652B
	elseif jn == "渡劫金身" then
		jns[1] = "每次使用治疗类技能有10%的几率实现双倍恢复；且治疗效果将增加15%，但治疗类技能每作用一个目标，会额外消耗40点魔法。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x3819B112
		jns[8] = 0x3819B112
	elseif jn == "额外能力" then
		jns[1] = "学习“渡劫金身”以后，每个额外能力的乾元丹会增加30点治疗能力，学习“诸天看护”以后，每个额外的乾元丹会增加80点法术防御。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA209C3C2
		jns[8] = 0xA209C3C2
	elseif jn == "诸天看护" then
		jns[1] = "给目标附加一个状态，该状态使目标将所受到的所有伤害减少50%，持续1个回合，并为目标附加反震状态，持续5回合。"
		jns[3] = 3
		jns[4] = "100点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xED073209
		jns[8] = 0xED073209
		jns[12] = "5回合"
	-- 大唐官府
	elseif jn == "目空" then
		jns[1] = "大唐官府，使用特技翩鸿一击、后发制人时无视对手10%的防御"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x72ED61A1
		jns[8] = 0x72ED61A1
	elseif jn == "风刃" then
		jns[1] = "大唐官府，普通攻击时可以对其他任意三个单位造成等级*3的伤害"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF97A7093
		jns[8] = 0xF97A7093
	elseif jn == "扶阵" then
		jns[1] = "大唐官府，使队伍每个人的阵法加成效果在原数值提升3%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD5131E6F
		jns[8] = 0xD5131E6F
	elseif jn == "翩鸿一击" then
		jns[1] = "兵贵神速，对敌人造成135%的伤害，并且提高下回合15%的速度。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x30E001D4
		jns[8] = 0x30E001D4
		jns[12] = "5回合"
	elseif jn == "勇武" then
		jns[1] = "后发制人将获得以下额外效果：额外增加防御值40%的伤害结果；使用时不消耗气血，转而使自己增加气血上限*15%的气血（最高为人物等级*8）；使用时增加自身10点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x265842A6
		jns[8] = 0x265842A6
	elseif jn == "长驱直入" then
		jns[1] = "以迅雷不及掩耳之势切入战场，给敌军最薄弱的环节予以致命一击，电光火石之间令对手甚至来不及做出反应，无法施展保护，造成110%伤害并有60%几率降低敌人10%的防御。"
		jns[3] = 4
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xAB6EA7B4
		jns[8] = 0xAB6EA7B4
		jns[12] = "4回合"
	elseif jn == "杀意" then
		jns[1] = "触发物理必杀时。必杀伤害增加20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBB962DBE
		jns[8] = 0xBB962DBE
	elseif jn == "念心" then
		jns[1] = "攻击目标且自身召唤兽为在场时，额外增加10%必杀率。（鬼魂倒地视为未在场）"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAB64E8CF
		jns[8] = 0xAB64E8CF
	elseif jn == "静岳" then
		jns[1] = "处于后发制人或者横扫千军，破釜沉舟的休息状态时，所受伤害减少150点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB363459E
		jns[8] = 0xB363459E
	elseif jn == "干将" then
		jns[1] = "使用破斧沉舟技能时有20%的几率额外增加一个伤害目标。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x01C779BC
		jns[8] = 0x01C779BC
	elseif jn == "勇念" then
		jns[1] = "使用横扫千军时，忽略目标10%防御。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2EF39CEC
		jns[8] = 0x2EF39CEC
	elseif jn == "神凝" then
		jns[1] = "自身提高10%抗封印率。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9640C6B0
		jns[8] = 0x9640C6B0
	elseif jn == "狂狷" then
		jns[1] = "将自身（力量属性/耐力属性）*16转化为伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAFA63BA0
		jns[8] = 0xAFA63BA0
	elseif jn == "不惊" then
		jns[1] = "额外忽视目标自身武器宝石锻造等级*5的防御。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8F6C13D3
		jns[8] = 0x8F6C13D3
	elseif jn == "突进" then
		jns[1] = "每回合开始时有45%的几率触发，提升自身防御值8%的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA839BBD0
		jns[8] = 0xA839BBD0
	elseif jn == "破空" then
		jns[1] = "使用破釜沉舟时，对目标造成目标防御*0.3的额外伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0821ADC7
		jns[8] = 0x0821ADC7
	elseif jn == "历战" then
		jns[1] = "带有“安神决”时，受到的法术伤害降低50%。安神诀有70%几率抵抗驱散效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x438B3BD1
		jns[8] = 0x438B3BD1
	elseif jn == "连破" then
		jns[1] = "横扫千军有18%几率不进入休息状态。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8E319047
		jns[8] = 0x8E319047
	elseif jn == "无敌" then
		jns[1] = "横扫千军变为4次攻击，气血消耗额外增加10%"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4640D75C
		jns[8] = 0x4640D75C
	elseif jn == "破军" then
		jns[1] = "使用横扫千军时每次攻击时额外增加受击目标气血最大上限的1%*攻击次序+200的伤害结果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xDC241728
		jns[8] = 0xDC241728
	-- 阴曹地府
	elseif jn == "判官" then
		jns[1] = "判官令造成的伤害增加10%、魔法损耗增加50%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC4A24497
		jns[8] = 0xC4A24497
	elseif jn == "回旋" then
		jns[1] = "受到包括固定伤害在内的所有法术伤害减少60点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x299CC362
		jns[8] = 0x299CC362
	elseif jn == "夜行" then
		jns[1] = "夜间增加人物40点速度、40点伤害、50点阎罗令伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x6CB4C5F1
		jns[8] = 0x6CB4C5F1
	elseif jn == "入骨" then
		jns[1] = "尸腐毒被解除时，使目标减少5%当前气血。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB9D06801
		jns[8] = 0xB9D06801
	elseif jn == "聚魂" then
		jns[1] = "摄魂的所有基础效果增加4%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0EF6D102
		jns[8] = 0x0EF6D102
	elseif jn == "六道无量" then
		jns[1] = "地府弟子将六道轮回之力附着在单体的物理攻击之上，令敌人避无可避。攻击时附带六道轮回技能等级×60%的伤害结果。该技能攻击玩家时，双方防御下降双方防御差*0.5（最高为自身等级*2），持续2回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBC2DD56E
		jns[8] = 0xBC2DD56E
	elseif jn == "索魂" then
		jns[1] = "锢魂术命中目标后，如果目标在此锢魂术状态下死亡，都可以增加施法者锢魂术2%的命中率，上限为10%，持续到战斗结束。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF259DD30
		jns[8] = 0xF259DD30
	elseif jn == "伤魂" then
		jns[1] = "你对带有尸腐毒的单位提高100点封印命中等级、80点物理伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEDAB40CF
		jns[8] = 0xEDAB40CF
	elseif jn == "百炼" then
		jns[1] = "武器耐久度消耗降低50%。使用百爪狂杀时临时增加武器命中*30%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2197928B
		jns[8] = 0x2197928B
	elseif jn == "黄泉" then
		jns[1] = "黄泉之息的减速效果增加50%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x11A0C1AE
		jns[8] = 0x11A0C1AE
	elseif jn == "毒印" then
		jns[1] = "你的六道无量和判官令将额外对一个带有尸腐毒的单位起效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x49D3C846
		jns[8] = 0x49D3C846
	elseif jn == "百爪狂杀" then
		jns[1] = "地府弟子吸收冥界阴气，进而激发自身的暴戾之气，将对敌方进行疯狂的连击。法术驱动的物理攻击，可以攻击4个目标，每个目标单独判断命中。每增加1个攻击目标，对所有目标的伤害结果降低10%。消耗：作用人数×35MP。"
		jns[3] = 4
		jns[6] = "wzife.wd2"
		jns[7] = 0x8FCE05BE
		jns[8] = 0x8FCE05BE
	elseif jn == "幽光" then
		jns[1] = "九幽的每回合回复当前气血值的上限增加120点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x337664F3
		jns[8] = 0x337664F3
	elseif jn == "泉爆" then
		jns[1] = "队伍中只有一个阴曹地府弟子时：每场战斗的第一次黄泉之息将造成400%的伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x14AB7311
		jns[8] = 0x14AB7311
	elseif jn == "鬼火" then
		jns[1] = "每次使用特技后回复10点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x93AE3E78
		jns[8] = 0x93AE3E78
	elseif jn == "魂飞" then
		jns[1] = "你的魂飞魄散首目标若为玩家且当回合死亡，则附加锢魂术，持续2回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC415DB52
		jns[8] = 0xC415DB52
	elseif jn == "汲魂" then
		jns[1] = "每次对方玩家单位死亡，恢复自身等级*2的气血并且增加10点伤害力，持续到战斗结束。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x808E00C5
		jns[8] = 0x808E00C5
	elseif jn == "击破" then
		jns[1] = "攻击防御的目标额外增加50%伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB79CC34C
		jns[8] = 0xB79CC34C
	elseif jn == "魑魅缠身" then
		jns[1] = "地府弟子可以招来地狱深处的魑魅魍魉，被他们附身的敌人将具备鬼魂精魄的特质，在擅于驱鬼的对手面前无所遁形。为对方任意成员（单目标）附加“冤魂”状态，持续5回合，冤魂状态的效果为：1.若冤魂状态的目标为召唤兽，则被携带驱鬼技能的目标攻击时伤害增加50%，被携带高级驱鬼技能的目标攻击时伤害增加100%；2.若冤魂状态的目标为人物或者NPC时，则被携带驱鬼技能的目标攻击时伤害增加15%，被携带高级驱鬼技能的目标攻击时伤害增加30%。消耗：40点愤怒值。冷却：4回合。该技能为法术技能，受封印法术限制。该技能不能对拥有鬼魂及高级鬼魂技能的目标使用。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2B37D923
		jns[8] = 0x2B37D923
	elseif jn == "夜之王者" then
		jns[1] = "黑夜是属于我的！技能“百爪狂杀”附加六道轮回技能等级*60%的伤害结果。夜晚的必杀几率增加10%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5192EAE6
		jns[8] = 0x5192EAE6
	-- 盘丝洞
	elseif jn == "鼓乐" then
		jns[1] = "魔音摄魂的命中率增加20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC17A7A56
		jns[8] = 0xC17A7A56
	elseif jn == "妖气" then
		jns[1] = "增加武器伤害*12%的封印命中等级。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB3956495
		jns[8] = 0xB3956495
	elseif jn == "怜心" then
		jns[1] = "姐妹同心的命中率增加12%。队伍中只有一个盘丝洞弟子时：每场战斗的第一次姐妹同心必中。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x38D87BEB
		jns[8] = 0x38D87BEB
	elseif jn == "迷瘴" then
		jns[1] = "使用含情脉脉命中目标后，吸取目标5项属性中最高项所对应的主能力4%给自己，持续5回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x661970E1
		jns[8] = 0x661970E1
	elseif jn == "粘附" then
		jns[1] = "增加武器伤害*18%的天罗地网伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD2180C25
		jns[8] = 0xD2180C25
	elseif jn == "意乱" then
		jns[1] = "使用魔音摄魂命中目标时，目标不能回复魔法值。（当与其他封印效果叠加时，回魔效果变为40%。）"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0B95DA6D
		jns[8] = 0x0B95DA6D
	elseif jn == "绝殇" then
		jns[1] = "被自己封印的目标在解除封印时获得的气血回复降低100%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x72B48AE0
		jns[8] = 0x72B48AE0
	elseif jn == "安抚" then
		jns[1] = "战斗中使用药品的效果增加15%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x756CE723
		jns[8] = 0x756CE723
	elseif jn == "忘忧" then
		jns[1] = "封印住目标后，每回合开始时目标损失60点魔法值，直到封印解除。若因此效果导致魔法值为0，则额外受到目标等级*3的气血伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x59ED800F
		jns[8] = 0x59ED800F
	elseif jn == "忘川" then
		jns[1] = "当目标力量点大于等级*4或者魔力点大于等级*4时，含情脉脉额外增加8%的命中几率。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBAA9AF30
		jns[8] = 0xBAA9AF30
	elseif jn == "迷梦" then
		jns[1] = "幻镜术可以将法术反弹两次给敌方任意目标，并且减少2个冷却回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD713CFD8
		jns[8] = 0xD713CFD8
	elseif jn == "倾情" then
		jns[1] = "使用姐妹同心成功后，如果目标的魔法值为0，则有45%的几率额外施放一次含情脉脉技能。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF28C8F12
		jns[8] = 0xF28C8F12
	elseif jn == "情劫" then
		jns[1] = "瘴气持续回合数增加3。同时带有瘴气的目标在解除瘴气时获得的气血恢复受瘴气影响。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x949B1634
		jns[8] = 0x949B1634
	elseif jn == "脱壳" then
		jns[1] = "自身所受到敌方任意持续回合≥5的负面持续性法术时，持续回合变为5回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xFF0081A3
		jns[8] = 0xFF0081A3
	elseif jn == "迷意" then
		jns[1] = "带有瘴气的目标受到的回魔效果降低30%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x1A6D023E
		jns[8] = 0x1A6D023E
	elseif jn == "结阵" then
		jns[1] = "你的盘丝阵效果增加200%，但持续回合数减少3。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x93AE3E78
		jns[8] = 0x93AE3E78
	elseif jn == "媚态" then
		jns[1] = "你的勾魂、摄魄必定命中；你使用瘴气时，清除目标身上的寡欲令。"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x26A40C6E
		jns[8] = 0x26A40C6E
	elseif jn == "利刃" then
		jns[1] = "对方阵营所有目标每回合结束时损失30点魔法值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8282C7D1
		jns[8] = 0x8282C7D1
	elseif jn == "落花成泥" then
		jns[1] = "靡靡之音进入敌人耳际，使目标下回合彷徨不知所措、额外受到15%伤害，同时80%几率无法行动。（不受化生寺门派特色影响）。消耗：40点愤怒值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4D94B673
		jns[8] = 0x4D94B673
	elseif jn == "偷龙转凤" then
		jns[1] = "这是集天地玄妙的大成之技，修习此技，不仅要有绝代风华的女儿身，更要有一颗玲珑剔透的七窍心。对目标施法后（只能是队友或自己），目标立刻损失所有魔法值，但在回合结束时会获得损失魔法值的10%，持续8回合。消耗：80点愤怒。冷却回合：8回合。（该技能为法术技能，受封印法术限制。）"
		jns[3] = 3
		jns[4] = "80点愤怒"
		jns[6] = "wzife.wd2"
		jns[7] = 0xC3BF2DE7
		jns[8] = 0xC3BF2DE7
		jns[9] = "8回合"
	-- 无底洞
	elseif jn == "金莲" then
		jns[1] = "地涌金莲额外作用一个目标。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x33470573
		jns[8] = 0x33470573
	elseif jn == "追魂" then
		jns[1] = "敏捷点数≥人物等级*2.2时，对目标使用的夺命咒伤害结果增加“枯骨心法”等级100%。你的夺魄令会封印目标的物理攻击。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x4345B564
		jns[8] = 0x4345B564
	elseif jn == "回敬" then
		jns[1] = "当前气血≤气血上限*50%时，封印命中率增加15%*（1-当前HP/最大HP）。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x8E2CB1FA
		jns[8] = 0x8E2CB1FA
	elseif jn == "由己渡人" then
		jns[1] = "复活一名队友，同时附加一个持续一回合的护盾。复活后恢复“地冥妙法”等级*6气血恢复“地冥妙法”等级*12的临时气血附加一个可以吸收（消耗气血+“地冥妙法”等级*4）的护盾消耗：10%的当前气血自身气血少于最大气血10%时无法使用。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xDE58924A
		jns[8] = 0xDE58924A
	elseif jn == "自愈" then
		jns[1] = "地涌金莲的恢复自身的气血量增加50%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x4F57FF06
		jns[8] = 0x4F57FF06
	elseif jn == "陷阱" then
		jns[1] = "夺魄令被解除时，自身回复自身等级*1点气血。当前气血≤气血上限*50%时，该效果额外增加200%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x3E7BB1D9
		jns[8] = 0x3E7BB1D9
	elseif jn == "化莲" then
		jns[1] = "地涌金莲增加武器伤害*30%点治疗能力。队伍中只有1个无底洞弟子时，地涌金莲首目标额外恢复地冥妙法*6点气血。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x40FB7647
		jns[8] = 0x40FB7647
	elseif jn == "风墙" then
		jns[1] = "受到攻击时，额外抵挡人物等级*16的伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xA35299B7
		jns[8] = 0xA35299B7
	elseif jn == "御兽" then
		jns[1] = "自身携带的召唤兽（及孩子）进入战斗时，如果速度≥召唤兽等级*3，则增加召唤兽等级*1.6的速度。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x4972C591
		jns[8] = 0x4972C591
	elseif jn == "精进" then
		jns[1] = "明光宝烛、金身舍利效果增加200%，每回合减少40%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x3AC8DBC2
		jns[8] = 0x3AC8DBC2
	elseif jn == "救人" then
		jns[1] = "煞气决对队友使用必定命中，且会额外回复地冥妙法等级*5的气血。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xFD01D3AD
		jns[8] = 0xFD01D3AD
	elseif jn == "灵身" then
		jns[1] = "当前气血≤气血上限*50%时，自身获得的金身舍利和明光宝烛持续回合数增加4、效果增加200%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x90622900
		jns[8] = 0x90622900
	elseif jn == "持戒" then
		jns[1] = "惊魂掌命中率变为原先的300%（无视命中率上限），但持续回合数上限变为2回合，目标将无法受好友保护。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x7B3ACA53
		jns[8] = 0x7B3ACA53
	elseif jn == "内伤" then
		jns[1] = "夺命咒攻击目标时，对目标额外造成50+枯骨心法技能等级*150%的伤害。每场战斗的第一次夺命咒会作用多个单位，数量和攻击目标时相同。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x70FDB194
		jns[8] = 0x70FDB194
	elseif jn == "反先" then
		jns[1] = "摧心术的目标额外减少阴风绝章*40%点速度，同时减少8%封印命中率、物理暴击率、法术暴击率。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xFB48D5CC
		jns[8] = 0xFB48D5CC
	elseif jn == "忍辱" then
		jns[1] = "每当你被对方封印时，无论是否成功，都有100%概率获得6点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xB1254F74
		jns[8] = 0xB1254F74
	elseif jn == "暗潮" then
		jns[1] = "愤怒在90以下时，每回合结束获得4点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x26A40C6E
		jns[8] = 0x26A40C6E
	elseif jn == "噬魂" then
		jns[1] = "你的“移魂化骨”吸取生命值的40%会转化为你的生命值。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x173015AE
		jns[8] = 0x173015AE
	elseif jn == "同舟共济" then
		jns[1] = "为目标队友分担伤害，持续3回合。目标队友承受30%伤害，你承受30%伤害。消耗：最大气血的10%当前气血需≥最大气血50%才能使用冷却回合：5。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x57365436
		jns[8] = 0x57365436
	elseif jn == "妖风四起" then
		jns[1] = "驱动妖风封印敌人，使其不能使用法术。成功率与成功率上限=夺魄令成功率+10%。该封印不能被水清、冰清、玉清、晶清解除。（可封印处于休息状态的单位）持续2回合。消耗：40点愤怒。冷却回合：6。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x8295E360
		jns[8] = 0x8295E360
	-- 魔王寨
	elseif jn == "充沛" then
		jns[1] = "战斗内临时提高10%的气血和气血上限"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8A07409C
		jns[8] = 0x8A07409C
	elseif jn == "炙烤" then
		jns[1] = "你的牛劲附加感知效果,且效果提升3%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBAA64557
		jns[8] = 0xBAA64557
	elseif jn == "震怒" then
		jns[1] = "飞砂走石在对目标使用时有10%的几率会额外作用一个单位。。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x403FE10F
		jns[8] = 0x403FE10F
	elseif jn == "蚀天" then
		jns[1] = "受到大于等于气血上限20%的伤害则进入激怒状态，法术伤害增加150点，持续3回合。效果不能叠加。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAC17A1D4
		jns[8] = 0xAC17A1D4
	elseif jn == "敛恨" then
		jns[1] = "受到物理暴击、法术暴击伤害后，本次所受与后面所受到的所有伤害减少20%。当回合有效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x6F367EF0
		jns[8] = 0x6F367EF0
	elseif jn == "赤暖" then
		jns[1] = "使用三味真火将恢复气血，恢复效果为本次造成伤害#W//50。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x36BEA656
		jns[8] = 0x36BEA656
	elseif jn == "火神" then
		jns[1] = "飞砂走石造成的伤害将额外增加火云术等级*1.5的伤害"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBF44D568
		jns[8] = 0xBF44D568
	elseif jn == "震天" then
		jns[1] = "震天诀等级≥人物等级时，增加60点法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x06B6105D
		jns[8] = 0x06B6105D
	elseif jn == "神焰" then
		jns[1] = "飞砂走石造成的伤害将受自身气血影响，气血越低，附加伤害将越高"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9D84EC63
		jns[8] = 0x9D84EC63
	elseif jn == "神炎" then
		jns[1] = "三味真火造成的伤害将受自身气血影响，气血越低，附加的伤害将越高"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBF44D568
		jns[8] = 0xBF44D568
	elseif jn == "返火" then
		jns[1] = "火甲术反馈的伤害效果增加70%。"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x013D6355
		jns[8] = 0x013D6355
	elseif jn == "崩摧" then
		jns[1] = "每次使用三昧真火与飞砂走石，有5%的几率降低目标10%的法术防御力，持续4回合。不能叠加。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4935E53B
		jns[8] = 0x4935E53B
	elseif jn == "魔冥" then
		jns[1] = "每次使用完飞沙走石或三味真火后，可以恢复自身魔法上限*5%的魔法量。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8BF70190
		jns[8] = 0x8BF70190
	elseif jn == "燃魂" then
		jns[1] = "#W/增加当前魔法/魔法上限*50的法术伤害力、抗封等级。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x79602FB7
		jns[8] = 0x79602FB7
	elseif jn == "狂月" then
		jns[1] = "战斗内额增加10%的魔法值"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0A9E4158
		jns[8] = 0x0A9E4158
	elseif jn == "威吓" then
		jns[1] = "自身处于牛劲状态时，对目标的伤害增加12%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x3816E2FC
		jns[8] = 0x3816E2FC
	elseif jn == "连营" then
		jns[1] = "牛劲技能持续回合数加一。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x90EEA1F5
		jns[8] = 0x90EEA1F5
	elseif jn == "魔心" then
		jns[1] = "使用三昧真火或飞砂走石时10概率使伤害翻倍"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xDAA0F7D4
		jns[8] = 0xDAA0F7D4
	elseif jn == "魔焰滔天" then
		jns[1] = "为了能给敌人造成更大的伤害，魔王寨的弟子是不怕赌上自己运气的。每回合开始时,临时附加20%法术暴击的状态，持续到战斗结束，每回合额外消耗的魔法100"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x525B9DB0
		jns[8] = 0x525B9DB0
	elseif jn == "烈焰真诀" then
		jns[1] = "烈焰缠身，此时他们不再是普通的魔王寨弟子，他们具有更强大的法术暴击能力。使用后增加10%的魔法暴击率。持续4回合。"
		jns[3] = 8
		jns[4] = "50点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x1299A579
		jns[8] = 0x1299A579
		jns[12] = "5回合"
	-- 狮驼岭
	elseif jn == "爪印" then
		jns[1] = "每次攻击敌人或被敌人攻击后，在敌人身上留下爪印，每个印记使得自己在下次攻击对手时增加人物等级*0.5伤害结果。印记只有在每回合的第一次攻击中有效，印记持续5回合或至对手死亡后消失，印记可叠加，最多叠加10个。持续回合效果可被刷新。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x6E34D2AA
		jns[8] = 0x6E34D2AA
	elseif jn == "翼展" then
		jns[1] = "你的鹰击攻击伤害增加生死薄技能等级*1.2"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x35A96711
		jns[8] = 0x35A96711
	elseif jn == "驭兽" then
		jns[1] = "提升全队伍所有在场召唤兽的能力：你的训兽诀等级*0.4的伤害，你的训兽诀等级*0.4的防御，你的训兽诀等级*0.2的灵力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x97EF1BE4
		jns[8] = 0x97EF1BE4
	elseif jn == "化血" then
		jns[1] = "在攻击中有30%几率吸收造成伤害的16%的气血。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBE24B04C
		jns[8] = 0xBE24B04C
	elseif jn == "宁息" then
		jns[1] = "变身的持续回合数加2，且效果提升3%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF0B320B8
		jns[8] = 0xF0B320B8
	elseif jn == "兽王" then
		jns[1] = "使用完变身技能后，所有攻击类技能对目标造成变身技能等级*2的额外伤害(无变身状态无效)。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x287A0188
		jns[8] = 0x287A0188
	elseif jn == "狮吼" then
		jns[1] = "狮搏伤害提高15%；狮搏击倒目标时，额外触发一次狮搏。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xD10DF1DF
		jns[8] = 0xD10DF1DF
	elseif jn == "怒象" then
		jns[1] = "当气血少于上限的30%时，有70%的几率在使用象形时保留变身状态并延长变身1回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x7CDE78AD
		jns[8] = 0x7CDE78AD
	elseif jn == "鹰啸" then
		jns[1] = "鹰击可以使目标造成的伤害降低15%，持续2回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x1D7F1771
		jns[8] = 0x1D7F1771
	elseif jn == "乱破" then
		jns[1] = "使用连环击时，每次击打有45%几率附加狂兽决技能等级×100%的伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x6D372C69
		jns[8] = 0x6D372C69
	elseif jn == "魔息" then
		jns[1] = "魔息术效果提升50%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC84857CA
		jns[8] = 0xC84857CA
	elseif jn == "威慑" then
		jns[1] = "你对目标使用的狮搏有30%几率附带持续2回合的“威慑”效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9D1ABD9E
		jns[8] = 0x9D1ABD9E
	elseif jn == "狂袭" then
		jns[1] = "攻击时减少被反震的概率20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5154ED66
		jns[8] = 0x5154ED66
	elseif jn == "失心" then
		jns[1] = "使用狮搏或鹰击有15%的几率让目标1回合无法行动。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x43CEF766
		jns[8] = 0x43CEF766
	elseif jn == "羁绊" then
		jns[1] = "你每次回复生命值，你的召唤兽也会回复该数值的10%。你的召唤兽每次回复生命值，你也会回复该数值的10%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x5C170F92
		jns[8] = 0x5C170F92
	elseif jn == "死地" then
		jns[1] = "死亡时将提升你下一次鹰击（100+损失愤怒*3）的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x143A6B82
		jns[8] = 0x143A6B82
	elseif jn == "乱击" then
		jns[1] = "你的连环击额外增加一次特殊的攻击。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x28EFDCA8
		jns[8] = 0x28EFDCA8
	elseif jn == "悲恸" then
		jns[1] = "人物死亡时，你的召唤兽受到的伤害降低15%，造成的伤害提高15%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x1D0F8066
		jns[8] = 0x1D0F8066
	elseif jn == "背水" then
		jns[1] = "虽千万人吾亦往矣，不胜则死！牺牲自身20%的当前气血，对目标造成(当前气血24%+普通攻击物理伤害+爪印个数*200)的伤害，并清除目标爪印效果。对方所受伤害最高不超过使用者自身力量点×600%的气血。消耗：20%的当前气血。自身气血少于气血上限20%时无法使用。（需要有变身状态，使用后休息1回合）"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x0B171EFB
		jns[8] = 0x0B171EFB
	elseif jn == "肝胆" then
		jns[1] = "人与幻兽之间的情感，你们这些俗人又怎能了解？肝胆相照、形影相随，四海为家、浪迹天涯。命令自己的召唤兽忠诚的保护己方任意目标（除了自己的召唤兽），该技能选择目标释放后，自己的召唤兽将在3回合内无限保护目标，直至目标或者召唤兽自己死亡。保护时召唤兽承担所受伤害的40%，被保护目标承受40%的伤害。消耗：80点MP。技能冷却回合：3。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x04600746
		jns[8] = 0x04600746
	-- 天宫
	elseif jn == "威吓" then
		jns[1] = "五雷轰顶成功时造成的伤害比例在基础上增加8%并且目标本回合内不再增加愤怒值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4E4ECD7C
		jns[8] = 0x4E4ECD7C
	elseif jn == "疾雷" then
		jns[1] = "使用天雷斩攻击NPC时，额外增加0.6*(敏捷点数-人物等级)的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x67324D63
		jns[8] = 0x67324D63
	elseif jn == "轰鸣" then
		jns[1] = "使用五雷轰顶技能成功时使目标减少240点物理防御，效果持续3回合，效果不能叠加，不能刷新。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x11DBB164
		jns[8] = 0x11DBB164
	elseif jn == "趁虚" then
		jns[1] = "每次使用特技之后，在接下来两个回合的封印成功率提高8%，效果不可叠加，可以被刷新。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x54E910DB
		jns[8] = 0x54E910DB
	elseif jn == "余韵" then
		jns[1] = "“魔兽之印”“河东狮吼”“圣灵之甲”“碎甲术”“停陷术”“啸风诀”的效果增加50%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8009DFB1
		jns[8] = 0x8009DFB1
	elseif jn == "驭意" then
		jns[1] = "增加自身魔力属性点5%的速度；自身封印命中率降低5%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2CBA65C0
		jns[8] = 0x2CBA65C0
	elseif jn == "震慑" then
		jns[1] = "使用错乱成功封印对手后，使目标同时附有掌心雷的封印效果；自身法术伤害力降低10%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC5CB9BBB
		jns[8] = 0xC5CB9BBB
	elseif jn == "神念" then
		jns[1] = "使用法宝时，额外获得10点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA79CD890
		jns[8] = 0xA79CD890
	elseif jn == "伏魔" then
		jns[1] = "附魔天书的效果增加50%；自身封印命中率降低5%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x7D54F95D
		jns[8] = 0x7D54F95D
	elseif jn == "苏醒" then
		jns[1] = "在一回合内掉血量达到自身气血上限的40%，回合结束时自动移除自身封印类异常状态，人物死亡时则失效。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC8EF7B06
		jns[8] = 0xC8EF7B06
	elseif jn == "护佑" then
		jns[1] = "增加50点防御力及法术防御力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xFEAD9161
		jns[8] = 0xFEAD9161
	elseif jn == "电芒" then
		jns[1] = "被雷霆万钧击中的目标，身上将缠绕着电流。带有此电流的目标再次受到雷霆万钧打击时额外承受5%的伤害，持续3回合，不可叠加，可以被刷新。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x7B970F69
		jns[8] = 0x7B970F69
	elseif jn == "月桂" then
		jns[1] = "增加武器伤害*12%的封印命中等级，但不再增加法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x71D17EEA
		jns[8] = 0x71D17EEA
	elseif jn == "怒火" then
		jns[1] = "当因气血损失而增加＞10的愤怒时，可以额外增加5点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x58B7E9CB
		jns[8] = 0x58B7E9CB
	elseif jn == "灵光" then
		jns[1] = "装备上的宝石舍利子效果增加25%；自身封印命中率降低5%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9571F0A2
		jns[8] = 0x9571F0A2
	elseif jn == "神律" then
		jns[1] = "天神护体法防效果增加100%，额外增加云霄步等级*0.3的速度，但不再增加法伤。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEA46BD71
		jns[8] = 0xEA46BD71
	elseif jn == "洞察" then
		jns[1] = "你的知己知彼额外提高自身等级*2的伤害、防御、法伤、法防、封印等级、抗封等级，持续3回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8660A7C9
		jns[8] = 0x8660A7C9
	elseif jn == "雷波" then
		jns[1] = "雷霆万钧对首目标造成的伤害提高8%，“电芒”产生的电流增加1持续回合数。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA7603CC9
		jns[8] = 0xA7603CC9
	elseif jn == "画地为牢" then
		jns[1] = "天宫弟子随手布下的囚牢，却是无数穷凶极恶之徒的饮恨之所。对敌方使用后，降低敌方1个单位16%的对封印法术抵抗能力以及16%的封印能力，持续回合为5回合。消耗：50点魔法；冷却时间：5回合。"
		jns[3] = 4
		jns[6] = "wzife.wd2"
		jns[7] = 0xBAF731FA
		jns[8] = 0xBAF731FA
	elseif jn == "风雷韵动" then
		jns[1] = "以风为弦、以雷为钟，其鸣如黄钟大吕般的攻击不仅能击溃对方的躯体，也能摧毁抵抗的意志。该技能本身伤害不会给目标增加愤怒值并降低目标8点愤怒，不受佛法无边影响。消耗：60点魔法。"
		jns[3] = 4
		jns[6] = "wzife.wd2"
		jns[7] = 0x169010C9
		jns[8] = 0x169010C9
	-- 普陀山
	elseif jn == "化戈" then
		jns[1] = "增加武器伤害*18%的治疗量。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8FE4B9FF
		jns[8] = 0x8FE4B9FF
	elseif jn == "推衍" then
		jns[1] = "自身敏捷≥等级*2.2时，五行法术对目标伤害增加21%，。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x7D712683
		jns[8] = 0x7D712683
	elseif jn == "借灵" then
		jns[1] = "武器伤害的24%转化为五行法术伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9C0D1C5B
		jns[8] = 0x9C0D1C5B
	elseif jn == "莲花心音" then
		jns[1] = "普陀弟子以莲花苞为躯，引魂入体，则可以复活在战斗中死亡的鬼魂幻兽。复活场上一个处于死亡状态的鬼魂宠，被复活目标获得60%的气血上限与当前36%的魔法值。"
		jns[3] = 8
		jns[4] = "60点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x07DEBF4F
		jns[8] = 0x07DEBF4F
	elseif jn == "生克" then
		jns[1] = "队伍内成员的五行克制能力增加4%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x1C454D91
		jns[8] = 0x1C454D91
	elseif jn == "默诵" then
	    jns[1] = "紧箍咒造成的伤害增加100%，同时如果目标处于紧箍咒时每回合结束时增加自身6点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x6AB318F7
		jns[8] = 0x6AB318F7
	elseif jn == "劳心" then
		jns[1] = "当前气血≤气血上限*30%时，使用普渡众生或者杨柳甘露技能带来的气血恢复效果额外增加100%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x00B8064E
		jns[8] = 0x00B8064E
	elseif jn == "普渡" then
		jns[1] = "普渡众生的气血恢复效果增加12%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x9110FB84
		jns[8] = 0x9110FB84
	elseif jn == "化怨" then
		jns[1] = "当前气血≤气血上限*30%时，受到的所有伤害减少25%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBBC8F2A2
		jns[8] = 0xBBC8F2A2
	elseif jn == "甘露" then
		jns[1] = "对目标使用杨柳甘露法术成功时，有50%的几率附带普渡众生效果4回合。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAF6FDE97
		jns[8] = 0xAF6FDE97
	elseif jn == "法印" then
		jns[1] = "颠倒五行法术吸收几率与上限增加10%、躲避率增加8%，持续回合数增加3。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4B145B23
		jns[8] = 0x4B145B23
	elseif jn == "秘术" then
		jns[1] = "使用五行法术时，将波动150点伤害"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF109AB4C
		jns[8] = 0xF109AB4C
	elseif jn == "灵动" then
		jns[1] = "灵动九天效果增加30点，持续回合数增加3。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4DCD5F44
		jns[8] = 0x4DCD5F44
	elseif jn == "雨润" then
		jns[1] = "当队伍中成员的普渡众生效果消失时，目标会额外恢复灵性等级*0.7的气血"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4290BCBB
		jns[8] = 0x4290BCBB
	elseif jn == "莲心剑意" then
		jns[1] = "普陀山的弟子情系众生、虔心不染，如一朵莲花绽放在凡尘中。但江湖险恶、妖风魔雨，为了护佑苍生，她们也不得不常怀剑意，惩恶除奸。使用此技能后进入进攻状态，增加法术修炼等级*3%的固定伤害最终效果（只对首目标有效），降低12%的回复效果。"
		jns[3] = 3
		jns[4] = "30点MP"
		jns[6] = "wzife.wd2"
		jns[7] = 0xC2D6BBD3
		jns[8] = 0xC2D6BBD3
	elseif jn == "玉帛" then
		jns[1] = "护法金刚技能所为人物增加伤害的8%转化为普渡众生气血恢复效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA96E7A76
		jns[8] = 0xA96E7A76
	elseif jn == "道衍" then
		jns[1] = "普渡众生的作用对象额外增加2个。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xCE18F021
		jns[8] = 0xCE18F021
	elseif jn == "法咒" then
		jns[1] = "五行法术有20%的几率使伤害增加50%"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x2A398778
		jns[8] = 0x2A398778
	elseif jn == "波澜不惊" then
		jns[1] = "普陀山弟子由于精通五行造化，方可布下这吸收一切伤害的结界阵法。颠倒五行增加20%的法术连击效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xAED0F931
		jns[8] = 0xAED0F931
	elseif jn == "五行制化" then
		jns[1] = "随机使用五行法术中的任意一个，但将目标提升为10，且伤害增加30%"
		jns[3] = 4
		jns[4] = "70点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xF46EB09D
		jns[8] = 0xF46EB09D
		jns[12] = "6回合"
	-- 凌波城
	elseif jn == "山破" then
		jns[1] = "使用天崩地裂后，自身恢复气血上限5%的血量。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x673833C4
		jns[8] = 0x673833C4
	elseif jn == "战诀" then
		jns[1] = "使用碎星诀和镇魂诀时，额外提高10%的必杀率，不可叠加，持续到战斗结束。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xB97A5577
		jns[8] = 0xB97A5577
	elseif jn == "抗击" then
		jns[1] = "不动如山增加100%反击效果。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x37FCB484
		jns[8] = 0x37FCB484
	elseif jn == "聚气" then
		jns[1] = "使用消耗愤怒≥60的特技时，有20%的几率触发不动如山的效果。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x6009D906
		jns[8] = 0x6009D906
	elseif jn == "神诀" then
		jns[1] = "使用天崩地裂与翻江倒海的技能时，刷新自身碎星诀或镇魂诀状态的回合数到初始值，并增加25%的效果，最多增加100%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x7D0D0DAB
		jns[8] = 0x7D0D0DAB
	elseif jn == "魂聚" then
		jns[1] = "每次使用攻击类技能，增加6点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xB7BD0013
		jns[8] = 0xB7BD0013
	elseif jn == "神躯" then
		jns[1] = "受到大于等于气血上限20%的伤害时，超过20%的部分会降低30%。。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xCF5AD689
		jns[8] = 0xCF5AD689
	elseif jn == "斩魔" then
		jns[1] = "碎星诀和镇魂诀效果提升12%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xE2910606
		jns[8] = 0xE2910606
	elseif jn == "不动" then
		jns[1] = "若在不动如山的状态下死亡，会额外保留80点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x9769021C
		jns[8] = 0x9769021C
	elseif jn == "力战" then
		jns[1] = "天崩地裂最后一击额外造成360点伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x0E10688C
		jns[8] = 0x0E10688C
	elseif jn == "破击" then
		jns[1] = "裂石，断岳势，天崩地裂出现必杀的几率翻倍，但产生必杀时只会造成1.6倍的伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x6E010D11
		jns[8] = 0x6E010D11
	elseif jn == "怒涛" then
		jns[1] = "浪涌，惊涛怒，翻江搅海的每一次攻击有70%几率降低目标人物自身等级/2的防御，持续2回合。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xE971301E
		jns[8] = 0xE971301E
	elseif jn == "海沸" then
		jns[1] = "增加人物力量*8%的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xBCE3BB39
		jns[8] = 0xBCE3BB39
	elseif jn == "怒火" then
		jns[1] = "每次使用攻击类技能后，如果当前回合受到20%气血上限的伤害时，下回合自身伤害提升10%，防御降低10%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xDEECD728
		jns[8] = 0xDEECD728
	elseif jn == "煞气" then
		jns[1] = "使用攻击类技能时附加100点伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x338B3040
		jns[8] = 0x338B3040
	elseif jn == "强袭" then
		jns[1] = "每次使用不动如山后，都会使攻击类技能伤害提升12%，持续3回合。状态不可刷新，不叠加。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xC6AD7685
		jns[8] = 0xC6AD7685
	elseif jn == "雷附" then
		jns[1] = "提升腾雷的命中率10%，被腾雷附上致死状态的单位若在2回合内死亡，有50%的概率回复人物气血上限5%的血量。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x7F38C97C
		jns[8] = 0x7F38C97C
	elseif jn == "再战" then
		jns[1] = "每次使用断岳势造成一个单位的死亡都会使下回合的断岳势伤害结果提高10%。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x606669C9
		jns[8] = 0x606669C9
	elseif jn == "天神怒斩" then
		jns[1] = "天神盛怒，以开天辟地之势，挥刀怒斩，天崩地裂的攻击次数变为4次，但气血消耗将加倍。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0xA8AF3DC0
		jns[8] = 0xA8AF3DC0
	elseif jn == "真君显灵" then
		jns[1] = "敲动战鼓，一鼓作气拿下敌人。进入“真君显灵”状态，持续3回合，提升自身10%物理伤害，降低自身10%物理防御。消耗：100点魔法。冷却回合：5。"
		jns[3] = 8
		jns[6] = "wzife.wd4"
		jns[7] = 0x4017404F
		jns[8] = 0x4017404F
	-- 五庄观
	elseif jn == "体恤" then
		jns[1] = "当生命之泉的作用目标气血≤30%时，生命之泉恢复效果增加150点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF19C2D33
		jns[8] = 0xF19C2D33
	elseif jn == "锤炼" then
		jns[1] = "武器耐久损失速度降低40%，增加3%武器伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x18172D37
		jns[8] = 0x18172D37
	elseif jn == "神附" then
		jns[1] = "增加人物力量*8%的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x43F66789
		jns[8] = 0x43F66789
	elseif jn == "心浪" then
		jns[1] = "回合结束时，若你愤怒少于50点，随机增加1~15点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x284FBFEC
		jns[8] = 0x284FBFEC
	elseif jn == "养生" then
		jns[1] = "当你气血降低到50%以下，且没有生命之泉时，获得生命之泉效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xCF2DA86F
		jns[8] = 0xCF2DA86F
	elseif jn == "强击" then
		jns[1] = "攻击时忽视召唤兽10%的防御值；自身封印命中率降低5%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA88BC46C
		jns[8] = 0xA88BC46C
	elseif jn == "归本" then
		jns[1] = "日月乾坤命中时，60%取消对方主动法宝增加的持续效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x736BD2FA
		jns[8] = 0x736BD2FA
	elseif jn == "修心" then
		jns[1] = "使用除“慈航普度”以外的特技时，若愤怒不足将使用（所需愤怒*20）点魔法代替。每场战斗限一次。"
		jns[3] = 8
		jns[6] = "wzife.wd3"
		jns[7] = 0x151405E2
		jns[8] = 0x151405E2
	elseif jn == "混元" then
		jns[1] = "当你气血≥70%时，临时提升5%的伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x03636ACD
		jns[8] = 0x03636ACD
	elseif jn == "修身" then
		jns[1] = "力量、体质、魔力、耐力、敏捷均增加14点。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x47BCA30B
		jns[8] = 0x47BCA30B
	elseif jn == "同辉" then
		jns[1] = "天地同寿状态下的目标防御值降低变为35%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBF6B4C8C
		jns[8] = 0xBF6B4C8C
	elseif jn == "雨杀" then
		jns[1] = "使用烟雨剑法需要的气血要求降低5%。烟雨剑法第二次攻击的必杀率提高20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA88BC46C
		jns[8] = 0xB6C48838
	elseif jn == "乾坤" then
		jns[1] = "如果你连续2回合及以上没有使用日月乾坤，则你下一次使用日月乾坤成功率提高12%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x86543FA8
		jns[8] = 0x86543FA8
	elseif jn == "意境" then
		jns[1] = "本方所有目标每回合结束时回复24点魔法值、1点愤怒。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xC5AFBFE0
		jns[8] = 0xC5AFBFE0
	elseif jn == "傲视" then
		jns[1] = "当攻击出现必杀时，下一次使用日月乾坤的成功率提高20%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xB6C48838
		jns[8] = 0xB6C48838
	elseif jn == "陌宝" then
		jns[1] = "日月乾坤将附加无法使用道具的效果。自身物理伤害结果降低15%，封印命中率提升2%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA88BC46C
		jns[8] = 0xA88BC46C
	elseif jn == "心随意动" then
		jns[1] = "这是五庄弟子的最高心境，于此心法下施展“日月乾坤”，令人陶陶乎直入另一个世界。激活后（再次使用关闭此状态），持续8回合后自动关闭。持续回合内：1.提升七星遁等级*1.5的封印命中等级、伤害力；2.使用日月乾坤封印成功后自己下回合不能使用日月乾坤；消耗：30点MP。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xFD5AC0B0
		jns[8] = 0xFD5AC0B0
	elseif jn == "致命" then
		jns[1] = "被你攻击的目标在回合结束时，若目标的气血小于气血上限的10%则直接暴毙。（对NPC最多造成等级*10点伤害）"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8C44F88C
		jns[8] = 0x8C44F88C
	elseif jn == "清风望月" then
		jns[1] = "五庄观的弟子可以于乾坤腾挪之中领悟妙法，吸收2个队友身上的封印效果，使自己进入疯狂状态2回合。消耗：40点愤怒。冷却回合：4。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8FE977C4
		jns[8] = 0x8FE977C4
	elseif jn == "天命剑法" then
		jns[1] = "率意而行、道法自然，在五庄弟子出手之际，他自身也道不出这一招之中蕴含了多少剑意。或许，只有冥冥之中的三清可知吧？以无人能够预知的剑术攻击目标，对其随机发动1~7次物理攻击。使用后下回合不能行动。使用需要气血≥气血上限的70%；消耗：消耗最大气血的2%*实际攻击次数。冷却回合：5回合。"
		jns[3] = 4
		jns[4] = "消耗最大气血的2%*实际攻击次数"
		jns[6] = "wzife.wd2"
		jns[7] = 0x30EA31AF
		jns[8] = 0x30EA31AF
		jns[12] = "5回合"
	-- 龙宫
	elseif jn == "波涛" then
		jns[1] = "龙腾造成的伤害将额外增加破浪诀等级*1.5的固定伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4714CA13
		jns[8] = 0x4714CA13
	elseif jn == "破浪" then
		jns[1] = "每次使用技能时有概率额外提高100点临时法伤（只用于本次出手）"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA5F354BA
		jns[8] = 0xA5F354BA
	elseif jn == "云霄" then
		jns[1] = "龙卷雨击造成伤害的时候，将概率额外增加100点临时伤害"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x8A3EF0F0
		jns[8] = 0x8A3EF0F0
	elseif jn == "逐浪" then
		jns[1] = "龙卷雨击造成的伤害将额外增加破浪诀等级*0.5的固定伤害。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x890B8397
		jns[8] = 0x890B8397
	elseif jn == "踏涛" then
		jns[1] = "破浪诀等级≥人物等级时，增加60点法伤。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x45238FC3
		jns[8] = 0x45238FC3
	elseif jn == "清吟" then
		jns[1] = "龙吟技能额外将减少目标50-100点的气血值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA135A426
		jns[8] = 0xA135A426
	elseif jn == "天龙" then
		jns[1] = "每3次使用技能都能激发龙宫弟子的潜力，使得下一次法术攻击时临时提升150法术伤害力。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4DEF4B05
		jns[8] = 0x4DEF4B05
	elseif jn == "龙珠" then
		jns[1] = "每次使用二龙戏珠时，有8%的几率额外增加一个目标。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xF4F33841
		jns[8] = 0xF4F33841
	elseif jn == "龙骇" then
		jns[1] = "任何门派伤害法术造成的伤害增加40点伤害结果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xDFF0E26B
		jns[8] = 0xDFF0E26B
	elseif jn == "龙慑" then
		jns[1] = "对敌人额外增加100点法术伤害结果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA9FDF759
		jns[8] = 0xA9FDF759
	elseif jn == "傲翔" then
		jns[1] = "神龙摆尾持续回合增加1回合，效果增加10%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xA925D675
		jns[8] = 0xA925D675
	elseif jn == "飞龙" then
		jns[1] = "受到大于等于气血上限25%的伤害都有70%的几率触发神龙摆尾技能。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x45A7F519
		jns[8] = 0x45A7F519
	elseif jn == "戏珠" then
		jns[1] = "增加二龙戏珠伤害，数值为目标(1-当前气血#W//目标气血上限)*1000。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x4B2FA59C
		jns[8] = 0x4B2FA59C
	elseif jn == "回魔" then
		jns[1] = "每回合回复魔法上限与当前灵力的差值的5%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xEE1C323A
		jns[8] = 0xEE1C323A
	elseif jn == "月魂" then
		jns[1] = "装备上的月亮石效果增加40%。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0xBF6B4C8C
		jns[8] = 0xBF6B4C8C
	elseif jn == "汹涌" then
		jns[1] = "当目标处于法术减免状态下，忽视8%的减免效果。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x773514B8
		jns[8] = 0x773514B8
	elseif jn == "龙魄" then
		jns[1] = "龙卷雨击有10%几率额外作用3人。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x97C568AA
		jns[8] = 0x97C568AA
	elseif jn == "摧意" then
		jns[1] = "龙腾造成的伤害≥目标气血上限*20%时，减少目标300点魔法值。"
		jns[3] = 8
		jns[6] = "wzife.wd2"
		jns[7] = 0x13DFE838
		jns[8] = 0x13DFE838
	elseif jn == "亢龙归海" then
		jns[1] = "矫健的神龙翻腾四海的英姿很少有人目睹，而之后更无人能够道出其中的神威。使用法术连续两次攻击敌人，造成的伤害为龙腾的90%。使用后需要休息一回合。"
		jns[3] = 4
		jns[4] = "200点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0xCE07792D
		jns[8] = 0xCE07792D
		jns[12] = "6回合"
	elseif jn == "雷浪穿云" then
		jns[1] = "当那天地间卷起的白浪与电闪中的云彩揉成一片，任谁都无力承当神龙见首不见尾的后续打击。对目标使用后，目标在5回合内遭受的所有法术伤害增加30%，使用法术技能消耗魔法增加100%+30点。消耗：60点MP。"
		jns[3] = 4
		jns[4] = "60点魔法"
		jns[6] = "wzife.wd2"
		jns[7] = 0x77EC444B
		jns[8] = 0x77EC444B
	end
	return jns
end

function 系统类_提示框:清空寄存()
	if #self.寄存内容 ~= 0 then
		self.寄存内容 = {}
	end
end
return 系统类_提示框