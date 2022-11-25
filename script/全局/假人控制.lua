--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-06-22 20:13:07
--======================================================================--
local 数据库  	 = class()
local floor   	 = math.floor
local insert  	 = table.insert
local remove 	 = table.remove
local pairs   	 = pairs
local random  	 = 引擎.取随机整数
local random1 	 = 引擎.取随机小数
local dszb    	 = 引擎.取点
local djg    	 = 引擎.取等级怪
local drs     	 = 引擎.取敌人信息
local 假人最终库 = require("script/全局/假人")
local tp 		 = nil
local os 		 = os

function 数据库:初始化(根)
	tp = 根
end

function 数据库:添加地图单位(数据)
	if 数据.变异 ~= nil and 数据.变异 and 染色信息[数据.模型]~=nil  then
		数据.染色方案 = 染色信息[数据.模型].id
		数据.染色组 = 染色信息[数据.模型].方案
	end
	local jr = {行走开关=数据.行走开关,锦衣=数据.锦衣,染色组=数据.染色组,染色方案=数据.染色方案,方向1=数据.方向,武器=数据.武器,武器染色方案=数据.武器染色方案,武器染色组=数据.武器染色组,称谓=数据.称谓,名称=数据.名称,X=数据.x,Y=数据.y,编号=数据.编号,真实编号=数据.编号,id=数据.id,模型=数据.模型,方向=数据.方向 or random(0,3),事件ID=等级,执行事件=数据.事件,显示饰品=数据.显示饰品,领取人id=数据.领取人id or 0,喊话=数据.喊话}
	local jr = 假人最终库(jr)
	-- insert(tp.场景.假人,jr)
	insert(tp.场景.场景人物,jr)
end

function 数据库:更改地图单位(数据)
	for i=1,#tp.场景.场景人物 do
		local v = tp.场景.场景人物[i]
		if v.名称 == 数据.名称 and v.编号 == 数据.编号 then
			remove(tp.场景.场景人物,i)
			break
		end
	end
	if 数据.变异 ~= nil and 数据.变异 and 染色信息[数据.模型]~=nil  then
		数据.染色方案 = 染色信息[数据.模型].id
		数据.染色组 = 染色信息[数据.模型].方案
	end
	local jr = {行走开关=数据.行走开关,锦衣=数据.锦衣,染色组=数据.染色组,染色方案=数据.染色方案,方向1=数据.方向,武器=数据.武器,武器染色方案=数据.武器染色方案,武器染色组=数据.武器染色组,称谓=数据.称谓,名称=数据.名称,X=数据.x,Y=数据.y,编号=数据.编号,真实编号=数据.编号,id=数据.id,模型=数据.模型,方向=数据.方向 or random(0,3),事件ID=等级,执行事件=数据.事件,显示饰品=数据.显示饰品,领取人id=数据.领取人id or 0,喊话=数据.喊话}
	local jr = 假人最终库(jr)
	-- insert(tp.场景.假人,jr)
	insert(tp.场景.场景人物,jr)
end

function 数据库:删除指定Npc(地图,名称,模型,事件ID,编号,执行事件)
	local xx
	local yy
	-- for i=1,#tp.场景.假人 do
	-- 	local v = tp.场景.假人[i]
	-- 	if (名称 == nil or v.名称 == 名称) and (模型 == nil or v.模型 == 模型) and (事件ID == nil or v.事件ID == 事件ID) and (编号 == nil or v.真实编号 == 编号) and (执行事件 == nil or v.执行事件 == 执行事件) then
	-- 		xx = v.坐标.x
	-- 		yy = v.坐标.y
	-- 		remove(tp.场景.假人,i)
	-- 		break
	-- 	end
	-- end
	for i=1,#tp.场景.场景人物 do
		local v = tp.场景.场景人物[i]
		if (名称 == nil or v.名称 == 名称) and (模型 == nil or v.模型 == 模型) and (事件ID == nil or v.事件ID == 事件ID) and (编号 == nil or v.真实编号 == 编号) and (执行事件 == nil or v.执行事件 == 执行事件) then
			remove(tp.场景.场景人物,i)
			break
		end
	end
	-- if 地图 ~= nil and tp.全局Npc[地图] ~= nil then
	-- 	for i=1,#tp.全局Npc[地图] do
	-- 		local v = tp.全局Npc[地图][i]
	-- 		if (名称 == nil or v.名称 == 名称) and (模型 == nil or v.模型 == 模型) and (事件ID == nil or v.事件ID == 事件ID) and (编号 == nil or v.真实编号 == 编号) and (执行事件 == nil or v.执行事件 == 执行事件) then
	-- 			remove(tp.全局Npc[tp.当前地图],i)
	-- 			break
	-- 		end
	-- 	end
	-- end
	return {xx,yy}
end

function 数据库:删除副本Npc()
	for s=1,5 do
		for i,v in pairs(tp.场景.假人) do
			if v.执行事件 == "副本" then
				remove(tp.场景.假人,i)
			end
		end
		for i,v in pairs(tp.场景.场景人物) do
			if v.执行事件 == "副本" then
				remove(tp.场景.场景人物,i)
			end
		end
	end
end

function 数据库:第三类假人()
	local n = {}
	n[1205] = {}
	n[1205][1] = {名称="蚩尤",模型="蚩尤_旧",X=64,Y=46,真实编号=1,编号=1,方向=0,事件ID="蚩尤",执行事件="世界BOOS"}
	return n
end

function 数据库:取宝图坐标()
	local 地图范围 = {1091}
	local 最终地图 = 地图范围[random(1,#地图范围)]
	local 点 = dszb(最终地图)
	local 位置 = 点[random(1,#点)]
	local xx = 位置[1]
	local yy = 位置[2]
	return {最终地图,xx,yy}
end

function 数据库:生成临时假人(地图,模型组,名称组,数量,执行事件1)
	local b = {}
	local xx,yy
	local mmx,mmy = floor(tp.场景.地图.宽度/20),floor(tp.场景.地图.高度/20)
	for i=1,数量 do
		while true do
			xx = random(3,mmx)
			yy = random(3,mmy)
			if tp.场景.地图.寻路:检查点(xx,yy) then
				break
			end
		end
		local vs = random(1,#模型组)
		local mx = 模型组[vs]
		local mc;
		if 名称组 ~= nil then
			mc = 名称组[vs]
		end
		if mc == nil then
			mc = mx
		end
		local jr = {名称=mc,X=xx,Y=yy,编号=i,真实编号=i,模型=mx,方向=random(0,3),事件ID=地图,执行事件=执行事件1}
		insert(b,jr)
	end
	return b
end

function 数据库:生成鬼()
	local 地图范围 = {1501,1208}
	local 时辰库 = {"子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥"}
	local 时刻库 = {"一","二","三","四","五","六"}
	local 鬼名库 = {"诌鬼","假鬼","奸鬼","捣蛋鬼","冒失鬼","烟沙鬼","挖渣鬼","仔细鬼","讨吃鬼","醉死鬼","抠掏鬼","伶俐鬼","急突鬼","丢谎鬼","乜斜鬼","撩桥鬼","饿鬼","色鬼","穷鬼","刻山鬼","吸血鬼","惊鸿鬼","清明鬼"}
	local 模型库 = {"僵尸","牛头","马面","骷髅怪","野鬼"}
	local 鬼名 = 时辰库[random(1,#时辰库)].."时"..时刻库[random(1,#时刻库)].."刻"..鬼名库[random(1,#鬼名库)]
	local 最终地图 = 地图范围[random(1,#地图范围)]
	local 点 = dszb(最终地图)
	local 位置 = 点[random(1,#点)]
	local xx = 位置[1]
	local yy = 位置[2]
	if tp.全局Npc[最终地图] == nil then
	    tp.全局Npc[最终地图] = {}
	end
	local jr = {名称=鬼名,X=xx,Y=yy-0.15,编号=-9997,真实编号=0,模型=模型库[random(1,#模型库)],方向=random(0,3),事件ID=nil,执行事件="抓鬼"}
	insert(tp.全局Npc[最终地图],jr)
	tp.剧情开关.抓鬼 = true
	return {编号=最终地图,名称=鬼名,坐标={x=xx,y=yy}}
end

function 数据库:生成强盗(贼王)
	local 姓 = {"赵","钱","孙","李","周","王","薛","时","傅","皮","范","彭","毛","滕","滕","方","谢","岑","诸葛","苏","黄","曹","刘","杨"}
	local 名 = {"泽","西","力","宏","汉","煜","忠","阳修","游","强","大郎","郎","胤","酆","潘","甫","七","明","尚"}
	local 组合 = 姓[random(1,#姓)]..名[random(1,#名)]
	local 地图 = 1501
	local 点 = dszb(地图)
	local 位置 = 点[random(1,#点)]
	local xx = 位置[1]
	local yy = 位置[2]
	if tp.全局Npc[地图] == nil then
	    tp.全局Npc[地图] = {}
	end
	local jr = {名称="强盗"..组合,X=xx,Y=yy+0.1,编号=-9998,真实编号=-9998,模型="强盗",方向=random(0,3),事件ID=nil,执行事件="宝图强盗"}
	insert(tp.全局Npc[地图],jr)
	return {maps=地图,x=xx,y=yy,name=jr.名称,maps=地图}
end

function 数据库:生成闯关使者(开启)
	if tp.剧情开关.十五门 == false then
		return false
	end
	local 最终门派 = tp.剧情开关.十五门[1]
	remove(tp.剧情开关.十五门,1)
	local 模型
	local 模型武器
	local xx = 0
	local yy = 0
	local fx = 0
	if 最终门派 == 1002 then
		xx = 43
		yy = 26
		模型 = "逍遥生"
		模型武器 = {"魏武青虹","画龙点睛"}
		fx = 1
	elseif 最终门派 == 1135 then
		模型 = "飞燕女"
		模型武器 = {"别情离恨","金龙双剪"}
		xx = 62
		yy = 84
		fx = 0
	elseif 最终门派 == 1122 then
		模型 = "骨精灵"
		模型武器 = {"降魔玉杵","九阴勾魂"}
		xx = 101
		yy = 26
		fx = 4
	elseif 最终门派 == 1140 then
		模型 = "玄彩娥"
		模型武器 = {"降魔玉杵","秋水落霞"}
		xx = 70
		yy = 51
		fx = 0
	elseif 最终门派 == 1139 then
		模型 = "杀破狼"
		模型武器 = {"冥火薄天","回风舞雪"}
		xx = 81
		yy = 55
		fx = 6
	elseif 最终门派 == 1198 then
		模型 = "剑侠客"
		模型武器 = {"魏武青虹","偃月青龙"}
		xx = 143
		yy = 88
		fx = 0
	elseif 最终门派 == 1150 then
		模型 = "羽灵神"
		模型武器 = {"冥火薄天"}
		xx = 30
		yy = 75
		fx = 1
	elseif 最终门派 == 1131 then
		模型 = "虎头怪"
		模型武器 = {"九瓣莲花","五丁开山"}
		xx = 64
		yy = 66
		fx = 3
	elseif 最终门派 == 1512 then
		模型 = "巨魔王"
		模型武器 = {"偃月青龙","五丁开山"}
		xx = 34
		yy = 47
		fx = 1
	elseif 最终门派 == 1138 then
		模型 = "巫蛮儿"
		模型武器 = {"庄周梦蝶","回风舞雪"}
		xx = 60
		yy = 107
		fx = 1
	elseif 最终门派 == 1116 then
		模型 = "龙太子"
		模型武器 = {"刑天之逆","画龙点睛"}
		xx = 71
		yy = 78
		fx = 1
	elseif 最终门派 == 1146 then
		模型 = "神天兵"
		模型武器 = {"刑天之逆","九瓣莲花"}
		xx = 25.8
		yy = 16.8
		fx = 0
	elseif 最终门派 == 1111 then
		模型 = "舞天姬"
		模型武器 = {"秋水落霞","别情离恨"}
		xx = 192
		yy = 130
		fx = 0
	elseif 最终门派 == 1513 then
		模型 = "狐美人"
		模型武器 = {"九阴勾魂","游龙惊鸿"}
		xx = 174
		yy = 45
		fx = 0
	elseif 最终门派 == 1142 then
		模型 = "英女侠"
		模型武器 = {"游龙惊鸿","金龙双剪"}
		xx = 67
		yy = 83
		fx = 4
	end
	local 假名 = 取地图名称(最终门派)
	local 名称 = 假名.."护法"
	if tp.全局Npc[最终门派] == nil then
	    tp.全局Npc[最终门派] = {}
	end
	local jr = {名称=名称,X=xx,Y=yy,编号=-9999,真实编号=-9999,模型=模型,武器=模型武器[random(1,#模型武器)],方向=fx,事件ID=假名,执行事件="十五门派大闯关"}
	insert(tp.全局Npc[最终门派],jr)
	return 名称
end

function 数据库:清空四季()
	for s=1,5 do
		for i,v in pairs(tp.场景.假人) do
			if v.执行事件 == "四季轮转" then
				remove(tp.场景.假人,i)
			end
		end
		for i,v in pairs(tp.场景.场景人物) do
			if v.执行事件 == "四季轮转" then
				remove(tp.场景.场景人物,i)
			end
		end
		for i,v in pairs(tp.全局Npc) do
			for n=1,#v do
				if v ~= nil and v[n] ~= nil and v[n].执行事件 == "四季轮转" then
					remove(v,n)
				end
			end
		end
	end
end

function 数据库:四季活动生成(刷新)
	if tp.剧情开关.四季 == false then
		return false
	end
	if tp.剧情开关.四季[1] == "知了王" then
		local 姓 = "知了"
		local 图 = 1193
		local 点 = dszb(图)
		if tp.剧情开关.四季[2] == 0 then
			local 名 = {"甲","乙","丙","丁","戊","己","庚"}
			for n=1,7 do
				local 选择 = random(1,#点)
				local 位置 = 点[选择]
				local xx = 位置[1]
				local yy = 位置[2]
				if tp.全局Npc[图] == nil then
				    tp.全局Npc[图] = {}
				end
				local jr = {名称=姓..名[1],X=xx,Y=yy-0.1,编号=-9997,真实编号=-9997,模型="知了王",方向=random(0,3),事件ID="知了王",执行事件="四季轮转"}
				insert(tp.全局Npc[图],jr)
				remove(名,1)
				for i=1,4 do
					remove(点,选择)
				end
			end
		elseif tp.剧情开关.四季[2] == 1 then
			local 名 = {"王"}
			local 选择 = random(1,#点)
			local 位置 = 点[选择]
			local xx = 位置[1]
			local yy = 位置[2]
			if tp.全局Npc[图] == nil then
			    tp.全局Npc[图] = {}
			end
			local jr = {名称=姓..名[1],X=xx,Y=yy-0.1,编号=-9997,真实编号=-9997,模型="知了王",方向=random(0,3),事件ID="知了王",执行事件="四季轮转"}
			insert(tp.全局Npc[图],jr)
			local 假人 = 假人最终库(jr)
			insert(tp.场景.假人,假人)
			insert(tp.场景.场景人物, 假人)
		end
	elseif tp.剧情开关.四季[1] == "天狗食月" then
		local 图 = 1114
		local 点 = dszb(图)
		if tp.剧情开关.四季[2] == 0 then
			for n=1,5 do
				local 选择 = random(1,#点)
				local 位置 = 点[选择]
				local xx = 位置[1]
				local yy = 位置[2]
				if tp.全局Npc[图] == nil then
				    tp.全局Npc[图] = {}
				end
				local jr = {名称="食月天狗",X=xx,Y=yy,编号=-9996,真实编号=n,模型="狼",方向=random(0,3),染色方案=68,染色组={1},事件ID="天狗食月",执行事件="四季轮转"}
				insert(tp.全局Npc[图],jr)
				for i=1,10 do
					remove(点,选择)
				end
			end
		elseif tp.剧情开关.四季[2] == 1 then
			local 选择 = random(1,#点)
			local 位置 = 点[选择]
			local xx = 位置[1]
			local yy = 位置[2]
			if tp.全局Npc[图] == nil then
			    tp.全局Npc[图] = {}
			end
			local jr = {名称="噬月天狗",X=xx,Y=yy,编号=-9996,真实编号=n,模型="哮天犬",方向=random(0,3),事件ID="天狗食月",执行事件="四季轮转"}
			insert(tp.全局Npc[图],jr)
			local 假人 = 假人最终库(jr)
			insert(tp.场景.假人,假人)
			insert(tp.场景.场景人物, 假人)
		end
	elseif tp.剧情开关.四季[1] == "堆雪人" then
		local 图 = 1174
		local 点 = dszb(图)
		local xx = 81
		local yy = 84
		if tp.全局Npc[图] == nil then
			tp.全局Npc[图] = {}
		end
		local jr
		if (刷新 == true or 刷新 == 1) and 刷新 == false then
			tp.剧情开关.四季[3] = 1
			for n=1,10 do
				local xy = 点[random(1,#点)]
				jr = {名称="融雪怪",X=xy[1],Y=xy[2],编号=-9994,真实编号=n,模型="炎魔神",染色方案=105,染色组={1,0},方向=random(0,3),事件ID="堆雪人",执行事件="四季轮转"}
				insert(tp.全局Npc[图],jr)
				if 图 == tp.当前地图 then
					local 假人 = 假人最终库(jr)
					insert(tp.场景.假人,假人)
					insert(tp.场景.场景人物, 假人)
				end
				for n=1,20 do
					remove(点,1)
				end
			end
		end
		if 刷新 ~= 1 then
			local mx
			if tp.剧情开关.四季[2] == 0 then
				mx = "雪人1"
			elseif tp.剧情开关.四季[2] == 1 then
				mx = "雪人2"
			elseif tp.剧情开关.四季[2] == 2 then
				mx = "雪人3"
			elseif tp.剧情开关.四季[2] == 3 then
				mx = "雪人4"
			elseif tp.剧情开关.四季[2] == 4 then
				mx = "雪人5"
			end
			jr = {名称="想念你的雪人",X=xx,Y=yy,编号=-9995,真实编号=-9995,模型=mx,方向=0,事件ID="堆雪人",执行事件="四季轮转"}
			insert(tp.全局Npc[图],jr)
			if 图 == tp.当前地图 then
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			end
		end
	elseif tp.剧情开关.四季[1] == "科举" then
		local xy = {{1501,141,64},{1501,94,96},{1501,44,123}}
		local ac = {"一","二","三","四","五","六","七","八","九"}
		local mx = {"考官1","考官2"}
		if tp.全局Npc[xy[n][1]] == nil then
		    tp.全局Npc[xy[n][1]] = {}
		end
		for n=1,#xy do
			local jr = {名称=ac[1].."号考官",X=xy[n][2],Y=xy[n][3],编号=-9995,真实编号=n,模型=mx[random(1,#mx)],方向=random(0,3),事件ID="科举",执行事件="四季轮转"}
			insert(tp.全局Npc[xy[n][1]],jr)
			remove(ac,1)
		end
	end
end

function 数据库:生成副本Npc(xxx,yyy,刷新)
	if tp.剧情开关.副本 == false then
		return false
	end
	if tp.场景.传送区 ~= nil then
		tp.场景.当前刷新 = {"副本",xxx,yyy,刷新}
		return false
	end
	local kds = floor(tp.场景.地图.宽度/20)-10
	local gds = floor(tp.场景.地图.高度/20)-10
	local xx = 0
	local yy = 0
	if tp.剧情开关.副本[1] == "乌鸡国" then
		if tp.剧情开关.副本[2] == 1 then -- 芭蕉木妖
			for n=1,15 do
				while true do
					xx = random(4,kds)
					yy = random(4,gds)
					if tp.场景.地图.寻路:检查点(xx,yy) then
						break
					end
				end
				local jr = {名称="芭蕉木妖",X=xx,Y=yy,编号=-8000,染色组=={1,0},真实编号=n,模型="树怪",方向=random(0,3),事件ID="乌鸡国",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			end
		elseif tp.剧情开关.副本[2] == 2 then -- 热心的仙人
			for n=1,15 do
				while true do
					xx = random(4,kds)
					yy = random(4,gds)
					if tp.场景.地图.寻路:检查点(xx,yy) then
						break
					end
				end
				local jr = {名称="热心仙人",X=xx,Y=yy,编号=-8000,真实编号=n,模型="和尚3",方向=random(0,3),事件ID="乌鸡国",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			end
		elseif tp.剧情开关.副本[2] == 3 then -- 荆棘丛
			local jr = {名称="乌鸡国王",X=xxx,Y=yyy,编号=-8000,真实编号=-8000,模型="男人_老伯",方向=random(0,3),事件ID="乌鸡国",执行事件="副本"}
			local 假人 = 假人最终库(jr)
			insert(tp.场景.假人,假人)
			insert(tp.场景.场景人物, 假人)
			for n=1,5 do
				while true do
					xx = random(4,kds)
					yy = random(4,gds)
					if tp.场景.地图.寻路:检查点(xx,yy) then
						break
					end
				end
				local jr = {名称="荆棘丛",X=xx,Y=yy,编号=-8000,真实编号=n,模型="花妖",方向=random(0,3),事件ID="乌鸡国",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			end
		elseif tp.剧情开关.副本[2] == 4 then -- 妖怪
			local xz = {{"拘灵妖怪",62,65.5},{"缚仙妖怪",68.3,62.8},{"囚神妖怪",77,56}}
			for n=1,3 do
				local jr = {名称=xz[1][1],X=xz[1][2],Y=xz[1][3],编号=-8000,真实编号=1,模型="树怪",方向=random(0,3),事件ID="乌鸡国",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
				remove(xz,1)
			end
		elseif tp.剧情开关.副本[2] == 5 then -- 玲珑及之后
			local xz = {{"乌鸡国王",47,49,"男人_老伯",3},{"乌鸡国王",57,43,"男人_老伯",1},{"观音大士",47,42,"观音姐姐",0}}
			for n=1,3 do
				local jr = {名称=xz[1][1],X=xz[1][2],Y=xz[1][3],编号=-8000,真实编号=0,模型=xz[1][4],方向=xz[1][5],事件ID="乌鸡国",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
				remove(xz,1)
			end
			local mx = {"羊头怪","狐狸精","蛤蟆精","黑熊精","牛妖"}
			for n=1,8 do
				while true do
					xx = random(4,kds)
					yy = random(4,gds)
					if tp.场景.地图.寻路:检查点(xx,yy) and random(1,3) == 1 then
						break
					end
				end
				local jr = {名称="鬼祟小妖",X=xx,Y=yy+0.1,编号=-8000,真实编号=n,模型=mx[random(1,#mx)],方向=random(0,3),事件ID="乌鸡国",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			end
		elseif tp.剧情开关.副本[2] == 6 then -- 玲珑及之后
			local xz = {{"乌鸡国王",47,49,"男人_老伯",3},{"乌鸡国王",57,43,"男人_老伯",1},{"观音大士",47,42,"观音姐姐",0}}
			local sj = random(1,2)
			xz[sj][1] = "假乌鸡国王"
			xz[sj][4] = "大力金刚"
			for n=1,3 do
				local jr = {名称=xz[1][1],X=xz[1][2],Y=xz[1][3],编号=-8000,真实编号=0,模型=xz[1][4],方向=xz[1][5],事件ID="乌鸡国",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
				remove(xz,1)
			end
		end
	elseif tp.剧情开关.副本[1] == "车迟斗法" then
		if tp.剧情开关.副本[2] == 1 then -- 建设道观
			local jr = {名称="有个和尚",X=52,Y=113,编号=-7999,真实编号=-1,模型="和尚2",方向=1,事件ID="车迟斗法",执行事件="副本"}
			local 假人 = 假人最终库(jr)
			insert(tp.场景.假人,假人)
			insert(tp.场景.场景人物, 假人)
			jr = {名称="道观",X=88,Y=28,编号=-7999,真实编号=-1,模型="道观",方向=0,事件ID="车迟斗法",执行事件="副本"}
			local 假人 = 假人最终库(jr)
			insert(tp.场景.假人,假人)
			insert(tp.场景.场景人物, 假人)
			for n=1,20 do
				while true do
					xx = random(4,kds)
					yy = random(4,gds)
					if tp.场景.地图.寻路:检查点(xx,yy) then
						break
					end
				end
				jr = {名称="有个道士",X=xx,Y=yy,编号=-8000,真实编号=n,模型="男人_道士",方向=random(0,3),事件ID="车迟斗法",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			end
		elseif tp.剧情开关.副本[2] == 2 or tp.剧情开关.副本[2] == 4 then -- 道观建设完毕过度
			local jr = {名称="有个和尚",X=52,Y=113,编号=-7999,真实编号=-1,模型="和尚2",方向=1,事件ID="车迟斗法",执行事件="副本"}
			local 假人 = 假人最终库(jr)
			insert(tp.场景.假人,假人)
			insert(tp.场景.场景人物, 假人)
		elseif tp.剧情开关.副本[2] == 3 then -- 吃贡品
			local jr = {名称="有个和尚",X=52,Y=113,编号=-7999,真实编号=-1,模型="和尚2",方向=1,事件ID="车迟斗法",执行事件="副本"}
			local 假人 = 假人最终库(jr)
			insert(tp.场景.假人,假人)
			insert(tp.场景.场景人物, 假人)
			local c = {"寿桃","苹果","烧饼","香梨"}
			for n=1,10 do
				while true do
					xx = random(4,kds)
					yy = random(4,gds)
					if tp.场景.地图.寻路:检查点(xx,yy) then
						break
					end
				end
				jr = {名称="供品"..c[引擎.取随机整数(1,#c)],X=xx,Y=yy,编号=-7999,真实编号=n,模型="泡泡",方向=random(0,3),事件ID="车迟斗法",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			end
		elseif tp.剧情开关.副本[2] == 5 then -- 推三清
			if tp.剧情开关.副本[4][4] == 0 then
				local jr = {名称="元始天尊",X=18.5,Y=42,编号=-7999,真实编号=-1,染色方案=101,染色组={1,0},显示饰品=true,模型="大力金刚",方向=2,事件ID="车迟斗法",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			elseif tp.剧情开关.副本[4][4] == 1 then
				local jr = {名称="灵宝道君",X=43,Y=31,编号=-7999,真实编号=-1,染色方案=101,染色组={1,0},显示饰品=true,模型="大力金刚",方向=1,事件ID="车迟斗法",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			elseif tp.剧情开关.副本[4][4] == 2 then
				local jr = {名称="太上老君",X=66,Y=31,编号=-7999,真实编号=-1,染色方案=101,染色组={1,0},显示饰品=true,模型="大力金刚",方向=0,事件ID="车迟斗法",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			elseif tp.剧情开关.副本[4][4] == 3 then
				local jr = {名称="道童",X=24,Y=40.5,编号=-7999,真实编号=-1,模型="男人_道童",方向=0,事件ID="车迟斗法",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			end
		elseif tp.剧情开关.副本[2] == 6 then -- 打风伯雨师
			local jr = {名称="有个神仙",X=47.7,Y=151.7,编号=-7999,真实编号=-1,模型="南极仙翁",方向=0,事件ID="车迟斗法",执行事件="副本"}
			local 假人 = 假人最终库(jr)
			insert(tp.场景.假人,假人)
			insert(tp.场景.场景人物, 假人)
			if tp.剧情开关.副本[4][5] == 1 then
				local abs = {{"雨神",114,{1,0},"雨师"},{"雷公",71,{1,0},"天将"},{"风婆",89,{1,0},"风伯"}}
				for n=1,3 do
					while true do
						xx = random(4,kds)
						yy = random(4,gds)
						if tp.场景.地图.寻路:检查点(xx,yy) then
							break
						end
					end
					jr = {名称=abs[1][1],X=xx,Y=yy,编号=-7999,真实编号=n,染色方案=abs[1][2],染色组=abs[1][3],模型=abs[1][4],方向=random(0,3),事件ID="车迟斗法",执行事件="副本"}
					假人 = 假人最终库(jr)
					insert(tp.场景.假人,假人)
					insert(tp.场景.场景人物, 假人)
					remove(abs,1)
				end
			elseif tp.剧情开关.副本[4][5] == 2 then
				while true do
					xx = random(4,kds)
					yy = random(4,gds)
					if tp.场景.地图.寻路:检查点(xx,yy) then
						break
					end
				end
				jr = {名称="鹿力",X=xx,Y=yy,编号=-7999,真实编号=n,模型="炎魔神",方向=random(0,3),事件ID="车迟斗法",执行事件="副本"}
				假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			elseif tp.剧情开关.副本[4][5] == 3 then
				for n=1,5 do
					while true do
						xx = random(4,kds)
						yy = random(4,gds)
						if tp.场景.地图.寻路:检查点(xx,yy) then
							break
						end
					end
					jr = {名称=tp.队伍[1].名称.."的宝箱",X=xx,Y=yy,编号=-7999,真实编号=n,模型="宝箱",方向=0,事件ID="车迟斗法",执行事件="副本"}
					假人 = 假人最终库(jr)
					insert(tp.场景.假人,假人)
					insert(tp.场景.场景人物, 假人)
				end
				jr = {名称="有个和尚",X=17,Y=144,编号=-7999,真实编号=-1,模型="和尚2",方向=0,事件ID="车迟斗法",执行事件="副本"}
				假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			end
		end
	elseif tp.剧情开关.副本[1] == "水陆大会" then
		if tp.剧情开关.副本[2] == 1 or tp.剧情开关.副本[2] == 2 then
			local vs = {{"御林军",3.2,84.8,"男人_马副将",1},{"御林军",12,89.5,"男人_马副将",1},{"道场督僧",38,61,"男人_方丈",1},{"小沙弥",58,66,"男人_胖和尚",1}}
			local jr
			for n=1,#vs do
				local jr = {名称=vs[1][1],X=vs[1][2],Y=vs[1][3],编号=-7998,真实编号=-1,模型=vs[1][4],方向=vs[1][5],事件ID="水陆大会",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
				remove(vs, 1)
			end
			if tp.剧情开关.副本[2] == 2 then
				vs = {{"桃树",116,11,"桃树",0}}
				for n=1,#vs do
					local jr = {名称=vs[1][1],X=vs[1][2],Y=vs[1][3],编号=-7998,真实编号=1,模型=vs[1][4],方向=vs[1][5],事件ID="水陆大会",执行事件="副本"}
					local 假人 = 假人最终库(jr)
					insert(tp.场景.假人,假人)
					insert(tp.场景.场景人物, 假人)
					remove(vs, 1)
				end
			end
		elseif tp.剧情开关.副本[2] == 3 then
			local vs = {{"御林军",3.2,84.8,"男人_马副将",1},{"御林军",12,89.5,"男人_马副将",1},{"道场督僧",38,61,"男人_方丈",1},{"小沙弥",58,66,"男人_胖和尚",1},{"杜如晦",35,70,"考官2",0},{"殷丞相",39,68.3,"考官2",0},{"魏征",42,65.5,"考官2",0},{"秦琼",45,72,"秦琼",2},{"程咬金",49,70,"程咬金",2},{"尉迟敬德",52,68,"秦琼",2},{"唐太宗",48,64,"皇帝",3},{"玄奘法师",57,57.6,"唐僧",1}}
			for n=1,#vs do
				local jr = {名称=vs[1][1],X=vs[1][2],Y=vs[1][3],编号=-7998,真实编号=1,模型=vs[1][4],方向=vs[1][5],事件ID="水陆大会",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
				remove(vs, 1)
			end
			tp.场景.计时器 = 30
		elseif tp.剧情开关.副本[2] == 4 then
			local vs = {{"受伤的程咬金",50,67,"程咬金",1}}
			for n=1,#vs do
				local jr = {名称=vs[1][1],X=vs[1][2],Y=vs[1][3],编号=-7998,真实编号=1,模型=vs[1][4],方向=vs[1][5],事件ID="水陆大会",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
				remove(vs, 1)
			end
		elseif tp.剧情开关.副本[2] == 5 then
			local vs = {{"受伤的程咬金",50,67,"程咬金",1},{"翼虎将军",114,9,"噬天虎",1},{"翼蛇将军",118,11,"律法女娲",1}}
			for n=1,#vs do
				local jr = {名称=vs[1][1],X=vs[1][2],Y=vs[1][3],编号=-7998,真实编号=1,模型=vs[1][4],方向=vs[1][5],事件ID="水陆大会",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
				remove(vs, 1)
			end
		elseif tp.剧情开关.副本[2] == 6 then
			local vs = {{"受伤的程咬金",50,67,"程咬金",1},{"土地公公",117,11,"男人_土地",1}}
			for n=1,#vs do
				local jr = {名称=vs[1][1],X=vs[1][2],Y=vs[1][3],编号=-7998,真实编号=1,模型=vs[1][4],方向=vs[1][5],事件ID="水陆大会",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
				remove(vs, 1)
			end
		elseif tp.剧情开关.副本[2] == 7 then
			-- 1-4.巡山小妖 4-6.上古妖兽首领 7-9.妖将军 10.魍魉
			local xxs = {{42,85},{32,82},{23,79},{19,63},{51,67},{47,53},{13,42},{7,18},{30,14}}
			local name = {}
			local jc = 1
			for n=1,#xxs do
				if jc >= 1 and jc <= 4 then
					name = {"巡山小妖","鼠先锋"}
				elseif jc > 4 and jc <= 6 then
					name = {"上古妖兽首领","地狱战神"}
				elseif jc > 6 and jc <= 9 then
					name = {"妖将军","野猪精"}
				end
				local jr = {名称=name[1],X=xxs[1][1],Y=xxs[1][2],编号=-7997,真实编号=jc,模型=name[2],方向=random(0,3),触发事件=true,事件ID="水陆大会",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
				remove(xxs, 1)
				jc = jc + 1
			end
		elseif tp.剧情开关.副本[2] == 8 then
			local vs = {{"魍魉",41,18,"帮派妖兽",1}}
			for n=1,#vs do
				local jr = {名称=vs[1][1],X=vs[1][2],Y=vs[1][3],编号=-7998,真实编号=1,模型=vs[1][4],方向=vs[1][5],事件ID="水陆大会",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
				remove(vs, 1)
			end
		elseif tp.剧情开关.副本[2] == 9 then
			local vs = {{"唐太宗",37,17,"皇帝",0},{"玄奘法师",42,20,"唐僧",2}}
			for n=1,#vs do
				local jr = {名称=vs[1][1],X=vs[1][2],Y=vs[1][3],编号=-7998,真实编号=1,模型=vs[1][4],方向=vs[1][5],事件ID="水陆大会",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
				remove(vs, 1)
			end
		end
	elseif tp.剧情开关.副本[1] == "通天河" then
		if tp.剧情开关.副本[2] == 1 then
			tp.场景.人物.隐藏 = true
			tp.剧情处理:开始剧情(2,"通天河",1,1)
			local vs = {{"祭台",103,90,"道观",0},{"陈庄主",100,99,"男人_村长",0},{"唐僧",108,99,"唐僧",1},{"者释和尚",100,103.8,"男人_胖和尚",0},{"业释和尚",108,103.8,"男人_胖和尚",1},{"海释和尚",100,108.6,"男人_胖和尚",0},{"劝释和尚",108,108.6,"男人_胖和尚",1}}
			local jr
			for n=1,#vs do
				jr = {名称=vs[1][1],X=vs[1][2],Y=vs[1][3]-2,编号=-7998,真实编号=-1,模型=vs[1][4],方向=vs[1][5],事件ID="通天河",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
				remove(vs, 1)
			end
		end
	elseif tp.剧情开关.副本[1] == "黑风山" then
		if tp.剧情开关.副本[2] == 1 then
			local vs = {{"玄奘",55.2,15,"唐僧",1},{"镇山太保刘伯钦",62.2,18,"男人_镖头",1},{"婆婆",70.5,20,"女人_孟婆",1}}
			local jr
			for n=1,#vs do
				jr = {名称=vs[1][1],X=vs[1][2],Y=vs[1][3]-2,编号=-7998,真实编号=-1,模型=vs[1][4],方向=vs[1][5],事件ID="通天河",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
				remove(vs, 1)
			end
		end
	elseif tp.剧情开关.副本[1] == "大闹天宫" then
		if tp.剧情开关.副本[2] == 1 then
			tp.场景.人物.隐藏 = true
			tp.剧情处理:开始剧情(2,"大闹天宫",1,1)
			local vs = {{"运水力士",50,58,"鲁班",0},{"锄树力士",59,51,"至尊宝",1},{"修桃力士",59,67,"吴刚",0}}
			local jr
			for n=1,#vs do
				jr = {名称=vs[1][1],X=vs[1][2],Y=vs[1][3]-2,编号=-7998,真实编号=-1,模型=vs[1][4],方向=vs[1][5],事件ID="通天河",执行事件="副本"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
				remove(vs, 1)
			end
		end

	end
end

function 数据库:生成保卫长安()
	if tp.剧情开关.保卫长安 == false then
		return false
	end
	if tp.剧情开关.保卫长安[1] == "鬼王密信" then
		if tp.全局Npc[1001] == nil then
			tp.全局Npc[1001] = {}
		end
		local xs = {{"吸血鬼",41,218,3,96,{1,1},true},{"幽灵",91,205,2,97,{1,0},true},{"画魂",168,146,2,20113,{4,0},true},{"幽萤娃娃",290,87,2,20113,{4,0},true},{"鬼将",118,62,2,95,{1,0},true}}
		local js = tp.剧情开关.保卫长安[2]
		local jr = {名称="六道"..xs[js][1],X=xs[js][2],Y=xs[js][3],编号=-8000,真实编号=0,染色方案=xs[js][5],染色组=xs[js][6],模型=xs[js][1],方向=xs[js][4],事件ID="鬼王密信",显示饰品=xs[js][7],执行事件="保卫长安"}
		insert(tp.全局Npc[1001],jr)
		if tp.当前地图 == 1001 then
			local 假人 = 假人最终库(jr)
			insert(tp.场景.假人,假人)
			insert(tp.场景.场景人物, 假人)
		end
		remove(xs,1)
	elseif tp.剧情开关.保卫长安[1] == "无尽梦魇" then
		local dj = tp:取进制等级(tp.队伍[1].等级)
		if dj >= 160 then
			dj = 160
		end
		local fc = 引擎.取等级怪(dj)
		dj = {}
		for n=1,#fc do
			local c = 引擎.取敌人信息(fc[n])[2]
			if c[2] ~= "蜃气妖" then
				insert(dj,c)
				c = nil
			end
		end
		fc = nil
		if tp.剧情开关.保卫长安[2] <= 3 then
			local kds = floor(tp.场景.地图.宽度/20)-10
			local gds = floor(tp.场景.地图.高度/20)-10
			for n=1,8 do
				while true do
					xx = random(2,kds)
					yy = random(2,gds)
					if tp.场景.地图.寻路:检查点(xx,yy) then
						break
					end
				end
				local ab = dj[random(1,#dj)]
				local cb = false
				if ab == "金身罗汉" then
					cb = true
				end
				local jr = {名称="梦魇"..ab,X=xx,Y=yy,编号=-8999,真实编号=n,模型=ab,组合=dj,显示饰品=cb,行走开关=true,方向=random(0,3),事件ID="无尽梦魇",执行事件="保卫长安"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			end
			for n=1,2 do
				while true do
					xx = random(2,kds)
					yy = random(2,gds)
					if tp.场景.地图.寻路:检查点(xx,yy) then
						break
					end
				end
				local jr = {名称="无尽梦魇",X=xx,Y=yy,编号=-8999,真实编号=n+8,模型="蜃气妖",组合=dj,特殊BOSS=true,显示饰品=true,行走开关=true,方向=引擎.取随机整数(0,3),事件ID="无尽梦魇",执行事件="保卫长安"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			end
		elseif tp.剧情开关.保卫长安[2] > 3  and tp.剧情开关.保卫长安[2] < 7 then
			local kds = floor(tp.场景.地图.宽度/20)-10
			local gds = floor(tp.场景.地图.高度/20)-10
			for n=1,7 do
				while true do
					xx = random(2,kds)
					yy = random(2,gds)
					if tp.场景.地图.寻路:检查点(xx,yy) then
						break
					end
				end
				local ab = dj[random(1,#dj)]
				local cb = false
				if ab == "金身罗汉" then
					cb = true
				end
				local jr = {名称="梦魇"..ab,X=xx,Y=yy,编号=-8999,真实编号=n,模型=ab,组合=dj,显示饰品=cb,行走开关=true,方向=random(0,3),事件ID="无尽梦魇",执行事件="保卫长安"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			end
			for n=1,3 do
				while true do
					xx = random(2,kds)
					yy = random(2,gds)
					if tp.场景.地图.寻路:检查点(xx,yy) then
						break
					end
				end
				local jr = {名称="无尽梦魇",X=xx,Y=yy,编号=-8999,真实编号=n+7,模型="蜃气妖",组合=dj,特殊BOSS=true,显示饰品=true,行走开关=true,方向=引擎.取随机整数(0,3),事件ID="无尽梦魇",执行事件="保卫长安"}
				local 假人 = 假人最终库(jr)
				insert(tp.场景.假人,假人)
				insert(tp.场景.场景人物, 假人)
			end
		elseif tp.剧情开关.保卫长安[2] == 7 then
			local jr = {名称="幻境接引人",X=17,Y=20,编号=-8999,真实编号=1,模型="将军1",方向=0,事件ID="无尽梦魇",执行事件="保卫长安"}
			local 假人 = 假人最终库(jr)
			insert(tp.场景.假人,假人)
			insert(tp.场景.场景人物, 假人)
		end
	end
end

-- 十二生肖
function 数据库:生成十二生肖()
	if aaaaaa ~= nil then
		local sj = os.time()
		local sc = os.date("%H",sj)
		local sx = nil
		sc = 9
		if sc == 23 or sc == 0 then
			sx = {"子鼠","鼠先锋",109,{1,0}}
		elseif sc == 1 or sc == 2 then
			sx = {"丑牛","踏云兽",110,{1,1}}
		elseif sc == 3 or sc == 4 then
			sx = {"寅虎","噬天虎",106,{1,0}}
		elseif sc == 5 or sc == 6 then
			sx = {"卯兔","兔子怪",51,{1,0}}
		elseif sc == 7 or sc == 8 then
			sx = {"辰龙","蛟龙",90,{1,1}}
		elseif sc == 9 or sc == 10 then
			sx = {"巳蛇","千年蛇魅",20104,{5,0}}
		elseif sc == 11 or sc == 12 then
			sx = {"午马","马面",78,{1,0}}
		elseif sc == 13 or sc == 14 then
			sx = {"未羊","羊头怪",54,{1,0}}
		elseif sc == 15 or sc == 16 then
			sx = {"申猴","长眉灵猴",2051,{1,0}}
		elseif sc == 17 or sc == 18 then
			sx = {"酉鸡","雷鸟人",62,{1,0}}
		elseif sc == 19 or sc == 20 then
			sx = {"戌狗","哮天犬"}
		elseif sc == 21 or sc == 22 then
			sx = {"亥猪","野猪",52,{1}}
		end
		local 地图 = {1111,1110}
		local 地图 = 地图[1]
		if tp.全局Npc[地图] == nil then
		    tp.全局Npc[地图] = {}
		end
		-- 生成
		local xx = 162
		local yy = 105
		local jr = {名称=sx[1],X=xx,Y=yy,编号=-8900,真实编号=1,模型=sx[2],方向=random(0,3),染色方案=sx[3],染色组=sx[4],事件ID=sx[1],执行事件="十二生肖"}
		insert(tp.全局Npc[地图],jr)
		if 地图 == tp.当前地图 then
			local jr = 假人最终库(jr)
			insert(tp.场景.假人,jr)
			insert(tp.场景.场景人物, jr)
		end
		-- 生成
		return {sx[1],取地图名称(地图)}
	end
end


function 数据库:刷新远古(map) -- 不存在地图刷新全局，存在地图刷新当前
	if 1==1 then return  end
	if map == nil then
		self.远古地图 = {1193,1501,1070,1040,1226,1208,1092,1110}
	else
		local a
		for i=1,#self.远古地图 do
			if self.远古地图[i] == map then
				remove(self.远古地图,i)
				a = true
				break
			end
		end
		if a == nil then
			return
		end
		tp.全局Npc[map] = tp.全局Npc[map] or {}
		local 等级     = tp:取进制等级(random(0,tp.队伍[1].等级+10))
		local 取等级怪 = djg(等级)
		local mx = floor(tp.场景.地图.宽度/20)
		local my = floor(tp.场景.地图.高度/20)
		for i=1,10 do
			local s = drs(取等级怪[random(1,#取等级怪)])
			while true do
				xx = random(1,mx-6)
				yy = random(1,my-6)
				if tp.场景.地图.寻路:检查点(xx,yy) then
					break
				end
			end
			local jr = {名称="远古"..s[2],X=xx,Y=yy-0.25-(i/15),编号=-8800,真实编号=i,模型=s[2],方向=random(0,3),事件ID=等级,执行事件="远古"}
			insert(tp.全局Npc[map],jr)
			local jr = 假人最终库(jr)
			insert(tp.场景.假人,jr)
			insert(tp.场景.场景人物, jr)
		end
	end
end

return 数据库