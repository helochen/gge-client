--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-04-29 18:50:50
--======================================================================--
local 系统类_时辰 = class()

local floor = math.floor
local ARGB = ARGB
local require = require
local 矩阵 = require("gge包围盒")(0,0,115,95)
local tp
local zt
local format = string.format
local keytq = 引擎.按键弹起

function 系统类_时辰:初始化(根)
	self.序列=1
	--self.七 = 按钮.创建(资源:载入('自用',"网易WDF动画",0xefbaba40),0,0,1,true)

	--self.八 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x59db6522),0,0,1,true)
	--self.商城 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x59db6522),0,0,1,true,true,"商",nil,-4,0)
	self.地图 = nil
	self.偏移 = nil
	self.计时 = 0
	self.计次 = 150
	self.偏移坐标 = 0
	self.偏移时间 = 0
	tp = 根
	zt = tp.字体表.描边字体
	sj = tp.字体表.时间字体
end
function 系统类_时辰:加载()
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	local 资源 = tp.资源
	self.背景 = 资源:载入(tp.时辰背景,"网易WDF动画",0xF6A5602D)
	self.白昼 = 资源:载入('wzife.wd4',"网易WDF动画",0xAA23B98F)
	self.黑昼 = 资源:载入('wzife.wd4',"网易WDF动画",0x82DB3814)
	self.小人跑步 = 资源:载入('wzife.wdf',"网易WDF动画",0xAC307575)
	self.小人走路 = 资源:载入('wzife.wdf',"网易WDF动画",0xC7BEBF45)
	self.排行 = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0x30712485),0,0,4)
	self.收缩 = 按钮.创建(资源:载入(tp.时辰收缩,"网易WDF动画",0x6C566DEA),0,0,4)
	self.缩放 = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xD5E6B287),0,0,4)
	self.世界 = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCA5242C2),0,0,4)
	self.日历 = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xAD514E92),0,0,4)
	self.查询 = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0x6ECBCED7),0,0,4)
	self.VIP = 按钮.创建(资源:载入('自用',"网易WDF动画",0xefbaba20),0,0,1,true)
	self.图鉴 = 按钮.创建(资源:载入('自用',"网易WDF动画",0xefbaba10),0,0,1,true)
	self.三 = 按钮.创建(资源:载入('幕神.rpk',"网易WDF动画",0x00023757),0,0,1,true)
	self.四 = 按钮.创建(资源:载入('自用',"网易WDF动画",0xefbaba40),0,0,1,true)
	self.五 = 按钮.创建(资源:载入('自用',"网易WDF动画",0xefbaba60),0,0,1,true)
	self.六 = 按钮.创建(资源:载入('自用',"网易WDF动画",0xefbaba50),0,0,1,true)
	self.抽奖 = 按钮.创建(资源:载入('幕神.rpk',"网易WDF动画",0x00023756),0,0,4,true)
	self.武魂 = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0x0000bb36),0,0,3)
	self.取经 = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0x000bbb79),0,0,4,true)
	self.元神 = 按钮.创建(资源:载入('npk/xtb.npk',"网易WDF动画",0x10001000),0,0,4,true)
	self.天梯 = 按钮.创建(资源:载入('npk/xtb.npk',"网易WDF动画",0x10000000),0,0,4,true)
	self.助战 = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0x00BBB149),0,0,4,true)
	self.SVIP = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0x00BBB152),0,0,4,true)
	self.内充抽奖 = 按钮.创建(资源:载入('wpal/121.wpal',"网易WDF动画",0x00BBB151),0,0,1,true)
	local g = {0xB9FD3C98,0xFE026DC3,0xCDB4C444,0xDFE4105D,0xA66B9C4,0x5A94EB4C,0xD2A6E5EC,0xEEADB7F5,0x399E1F40,0x6FFBDFD8,0xDEBA9F52,0x49D3DE80}
	self.时辰={}
	for n=1,12 do
      self.时辰[n]=资源:载入('wzife.wd4',"网易WDF动画",g[n])
	end

end
function 系统类_时辰:刷新()
	self.地图 = 取地图名称(tp.当前地图)
	if tp.剧情开关.副本 ~= false then
		if tp.剧情开关.副本[1] == "乌鸡国" then
			if self.地图 == "狮驼岭" then
				self.地图 = "废弃的御花园"
			elseif self.地图 == "朱紫国皇宫" then
				self.地图 = "乌鸡国皇宫厢房"
			end
		elseif tp.剧情开关.副本[1] == "车迟斗法" then
			if self.地图 == "小雷音寺" then
				self.地图 = "三清道观"
			elseif self.地图 == "灵台宫" then
				self.地图 = "道观大殿"
			elseif self.地图 == "天宫" then
				self.地图 = "九霄云外"
			end
		elseif tp.剧情开关.副本[1] == "水陆大会" then
			if self.地图 == "化生寺" then
				self.地图 = "水陆道场"
			elseif self.地图 == "太岁府" then
				self.地图 = "妖魔巢穴"
			end
		elseif tp.剧情开关.副本[1] == "通天河" then
			if self.地图 == "长寿村" then
				self.地图 = "陈家庄"
			end
		elseif tp.剧情开关.副本[1] == "黑风山" then
			if self.地图 == "解阳山" then
				self.地图 = "双叉岭"
			end
		elseif tp.剧情开关.副本[1] == "秘境降妖" then
			if self.地图 == "比武场" then
				self.地图 = "秘境0层"
			end
		end
	end
	self.偏移 = 60 - #self.地图*3.72
end

function 系统类_时辰:显示(dt,x,y)
	if 矩阵:检查点(x,y) then
		tp.选中UI = true
	end
	self.背景:显示(0,0 + self.偏移坐标)
	self.VIP:更新(x,y)

	--self.二:更新(x,y)

	--self.三:更新(x,y)
	--self.三:显示(88,72+self.偏移坐标)
	self.四:更新(x,y)

	self.五:更新(x,y)

	self.六:更新(x,y)

	--self.点歌:更新(x,y)
	--self.点歌:显示(130,85+self.偏移坐标)
	self.武魂:更新(x,y)
	--self.武魂:显示(10,130 + self.偏移坐标)
   self.取经:更新(x,y)
	--self.取经:显示(45,125 + self.偏移坐标)
	self.元神:更新(x,y)
     self.图鉴:更新(x,y)
	self.天梯:更新(x,y)
    self.抽奖:更新(x,y)
	self.助战:更新(x,y)
	--self.助战:显示(140,150+self.偏移坐标)
	self.SVIP:更新(x,y)

      self.内充抽奖:更新(x,y)

	if 鼠标.x<115 and 鼠标.y >70  and 鼠标.y <220 and  not tp.战斗中 then

     self.内充抽奖:显示(70,100 + self.偏移坐标)
	self.助战:显示(100,70+self.偏移坐标)
	self.取经:显示(70,160 + self.偏移坐标)
	self.武魂:显示(70,70 + self.偏移坐标)
	--self.点歌:显示(130,85+self.偏移坐标)
	--self.三:显示(88,72+self.偏移坐标)
     self.SVIP:显示(10,68+self.偏移坐标)--(120,130+self.偏移坐标)
     self.天梯:显示(40,73+self.偏移坐标)--(80,135+self.偏移坐标)
     self.元神:显示(40,100 + self.偏移坐标)
     self.六:显示(10,130+self.偏移坐标) --开元
     self.五:显示(45,130+self.偏移坐标) --排行
     self.四:显示(10,170+self.偏移坐标)  --指引
     --self.二:显示(40,170+self.偏移坐标) --商城
     self.VIP:显示(10,100+self.偏移坐标)
     self.抽奖:显示(80,140 + self.偏移坐标)
     self.图鉴:显示(40,170 + self.偏移坐标)

		end


	-- self.八:更新(x,y)
	-- self.八:显示(90,72+self.偏移坐标)
	self.收缩:更新(x,y)
	self.收缩:显示(10,49 + self.偏移坐标)
	if self.收缩:事件判断() then
		if self.偏移坐标 == 0 then
			self.偏移坐标 = -49
			self.偏移时间 = -6.5
			矩阵:置坐标(0,-49)
		else
		    self.偏移坐标 = 0
		    self.偏移时间 = 0
		    矩阵:置坐标(0,0)
		end
	end

	if self.偏移坐标 == 0 then
		self.排行:更新(x,y)
		self.世界:更新(x,y)
		self.日历:更新(x,y)
		self.查询:更新(x,y)
		if self.日历:事件判断() and not tp.战斗中 then
			发送数据(43)
		end
		self.世界:显示(30,42 + self.偏移坐标)
		self.查询:显示(65,42 + self.偏移坐标)
		self.排行:显示(95,42 + self.偏移坐标)
		self.日历:显示(120,42 + self.偏移坐标)
	end
	if self.武魂:是否选中(x,y) then
			tp.提示:自定义(x,y,"点击打开武魂界面")
		end
		if self.武魂:事件判断() and not tp.战斗中 then
			 if tp.队伍[1].等级>68 then
			tp.窗口.武魂界面:打开()
			else
		tp.提示:写入("#R你等级不够,现在不能使用此功能")
			发送数据(77.9)
		end
end

	if self.排行:事件判断() and not tp.战斗中 then
		tp.窗口.小地图:打开(tp.当前地图)
		tp.窗口.小地图NPC:打开()
	elseif self.世界:事件判断() and not tp.战斗中 then
		tp.窗口.世界大地图:打开()
	elseif (self.查询:事件判断() or keytq(KEY.TAB)) and not tp.战斗中 and not tp.消息栏焦点  then
		tp.窗口.小地图:打开(tp.当前地图)
	elseif self.VIP:事件判断() and not tp.战斗中 then
			发送数据(103)
	-- elseif self.二:事件判断() and not tp.战斗中 then
	-- 		if tp.窗口.商城类.可视 then
	-- 		    tp.窗口.商城类:打开()
	-- 		else
	-- 			发送数据(29)
	-- 		end

elseif self.取经:事件判断() and not tp.战斗中 then
		if tp.窗口.取经之路.可视== false then
			tp.窗口.取经之路:打开()
		else
			tp.窗口.取经之路:打开()
		end

	elseif self.三:事件判断() and not tp.战斗中 then
			发送数据(47)
	elseif self.SVIP:事件判断() and not tp.战斗中 then
			发送数据(117.7)

	-- elseif self.点歌:事件判断() and not tp.战斗中 then
	-- 	发送数据(103.1)
	elseif self.四:事件判断() and not tp.战斗中 then
			发送数据(40)
    elseif	self.元神:事件判断() and not tp.战斗中 then
           if tp.窗口.元神.可视 then
			tp.窗口.元神:打开()
		else
		    发送数据(100.15)
		end
	elseif self.五:事件判断() and not tp.战斗中 then

		if tp.窗口.排行榜.可视==false then
			tp.窗口.排行榜:打开()
			发送数据(39,{"赞助排行"})
		else
			tp.窗口.排行榜:打开()
		end
		elseif self.助战:事件判断() and not tp.战斗中 then
		if tp.窗口.助战界面.可视 then
			tp.窗口.助战界面.可视 =false
		else
			发送数据(88)
		end
	elseif	self.天梯:事件判断() and not tp.战斗中 then
           if tp.窗口.天梯.可视 then
			tp.窗口.天梯:打开()
		else
		    发送数据(100.14)
		end
		elseif  self.图鉴:事件判断() and not tp.战斗中 then
            发送数据(200)
		elseif	self.抽奖:事件判断() and not tp.战斗中 then
        if tp.窗口.抽奖系统.可视 then
			tp.窗口.抽奖系统:打开()
		else
		    发送数据(112.1)
		end
		elseif  self.内充抽奖:事件判断() and not tp.战斗中 then
	     	if tp.窗口.内充抽奖.可视 then
	     		tp.窗口.内充抽奖:打开()
		    else
			 	发送数据(3766)
			end
	elseif self.六:事件判断() and not tp.战斗中 then

		发送数据(8002)




	end
	if self.序列>=5 and self.序列<=10 then
	    日夜="白天"
	else
		日夜="黑夜"
	end
	self.时辰[self.序列]:显示(39,7.5 + self.偏移时间)
	sj:显示(75,5.5+self.偏移时间,os.date("%X", os.time()))
	local xy = "["..floor(tp.角色坐标.x/20)..","..floor(tp.角色坐标.y/20).."]"
	if self.偏移~=nil then
	   zt:显示(self.偏移-19,23.5 + self.偏移坐标,self.地图..xy)
	end
	if self.排行:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"NPC导航")
	end
	if self.日历:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"签到")
	end
	if self.世界:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"快捷键:ALT+M")
	end
	if self.查询:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"快捷键:Tab")
	end
	if self.VIP:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"游戏藏宝阁")
	end
	if self.SVIP:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"SVIP")
	end
	if self.三:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"充值点卡")
	end

	-- if self.二:是否选中(x,y) then
	-- 	tp.提示:自定义(x-42,y+27,"游戏商城")
	-- end
	if self.四:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"梦幻指引")
	end
	if self.五:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"排行榜")
	end
	-- if self.点歌:是否选中(x,y) then
	-- 	tp.提示:自定义(x+0,y+0,"无聊点首歌")
	-- end
	if self.六:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"开元棋牌")
	end
	if self.取经:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"取经之路")
	end
	if self.元神:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"元神突破")
	end
	if self.天梯:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"PK")
	end
	if self.助战:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"助战")
	end

	if 日夜=="黑夜" then
		self.黑昼:显示(18,7.5 + self.偏移坐标)
		return
	else
		self.白昼:显示(18,7.5 + self.偏移坐标)
		return
	end
end

function 系统类_时辰:检查点(x,y)
	return 矩阵:检查点(x,y)
end

return 系统类_时辰