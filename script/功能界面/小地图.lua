--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-03-05 07:42:29
--======================================================================--
local 场景类_小地图 = class()
local tp
local xys = 生成XY
local floor = math.floor
local format = string.format
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local wns = 引擎.文件是否存在
local insert = table.insert
local fgz = 分割字符
local number = tonumber
local string = tostring
local zts1
local pt
local bw = require("gge包围盒")(0,0,0,16)

function 场景类_小地图:初始化(根)
	self.ID = 1
	self.注释 = "小地图"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.记忆地图 = 0
	self.窗口时间 = 0
	self.目标格子 = xys()
	tp = 根
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	self.标记 = 资源:载入('wzife.wdf',"网易WDF动画",0x393947EB)
	self.终点 = 资源:载入('wzife.wdf',"网易WDF动画",0xDEE57252)
	-- self.路点 = 资源:载入('wzife.wdf',"网易WDF动画",0x49D32437)
	self.迷你传送阵 = 资源:载入('wzife.wd1',"网易WDF动画",0x558897FF)
	self.NPC查找Q = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x0BC4D521),0,0,4,true,true,"")
	self.普通 = 根._按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true)
	self.普通:置根(根)
	self.普通:置偏移(-3,2)
	self.传送 = 资源:载入('wzife.wd1',"网易WDF动画",0x558897FF)
	self.普通显示 = false
	self.偏移X = 0
	self.偏移Y = 0
	self.背景窗口 = tp._自适应.创建(0,1,0,0,3,9)
	self.窗口时间 = 0
	self.目标格子 = nil
	self.xx = 0
	self.yy = 0
	self.my = 0
	zts1 = 根.字体表.描边字体
	pt = zts1--根.字体表.普通字体__
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] =  按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true," 世界"),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭按钮
	}
	self.普通显示 = false
	self.选择框显示 = {false,false,false,false,false,false}
	self.选择框组 = {
		[1] = 根._按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[2] = 根._按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[3] = 根._按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[4] = 根._按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[5] = 根._按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
		[6] = 根._按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
	}
	for i=1,#self.选择框组 do
		self.选择框组[i]:置根(根)
		self.选择框组[i]:置偏移(-3,2)
		self.选择框组[i]:绑定窗口_(1)
	end
	文字 = require("gge文字类")(wdf配置.."/font/hkyt.ttf",16,0,true)--(文件,大小,粗体,可描边,抗锯齿)
	文字:置字间距(1)
	文字:置描边颜色(0xFFFFFFFF)--白色 置描边颜色  置阴影颜色
	文字:置颜色(ARGB(255,45,74,220))--0,40,247
	小地图等级 = 根.字体表.描边字体
	self.路点=资源:载入('wzife.wdf',"网易WDF动画",0X355035D3)
	self.小旗子 =资源:载入('wzife.wdf',"网易WDF动画",0xDEE57252)
end

function 场景类_小地图:打开(map)
	local Smap,Smapa = 小地图资源加载(map)
	if Smap == nil then
		if self.可视 then
			self.qx = nil
			self.qy = nil
			self.可视 = false
			self.普通显示 = false
			self.普通:置打勾框(self.普通显示)
		else
			tp.窗口.消息框:添加文本("此场景无法查看小地图")
		end
	else
		if self.记忆地图 ~= map then
			self.普通显示 = false
			self.普通:置打勾框(false)
			local ids = format("./img/%d.png",tp.当前地图)
			if wns(ids) and Smap == nil then
				self.小地图 = tp.资源:载入(ids,"图片")
				self.my = 2
			else
			    self.小地图 = tp.资源:载入(Smap,"网易WDF动画",Smapa)
			end
			self.宽度 = self.小地图:取宽度()

			self.高度 = self.小地图:取高度()
			local fg = {}
			fgz(string(self.高度),fg)
			fg = number(fg[3])
			local v = 27
			if fg == 1 or fg == 3 or fg == 5 or fg == 7 or fg == 9 then
				v = 26
			end
			self.x = self.x or floor((全局游戏宽度 - self.宽度) /2)
			self.y = self.y or floor((全局游戏高度 - self.高度) /2)
			self.qx = nil
			self.qy = nil
			if self.宽度>= 500 then
				self.背景窗口:置宽高(self.宽度+v+2,self.高度+v+28)
			else
			    self.背景窗口:置宽高(self.宽度+84,self.高度+v)
			end
			self.偏移X = (self.宽度 - 20) / tp.场景.地图.宽度
			self.偏移Y = (self.高度 - 20)/ tp.场景.地图.高度
			self.记忆地图 = map
			self.地图名称 = 取地图名称(self.记忆地图)
			self.可视 = true
			tp.运行时间 = tp.运行时间 + 1
			self.窗口时间 = tp.运行时间
			insert(tp.窗口_,self)
		elseif self.记忆地图 == map and self.可视 then
			self.qx = nil
			self.qy = nil
		    self.可视 = false
		    self.普通显示 = false
			self.普通:置打勾框(self.普通显示)
		elseif self.可视 == false and self.记忆地图 == map then
			self.qx = nil
			self.qy = nil
			self.可视 = true
			insert(tp.窗口_,self)
			tp.运行时间 = tp.运行时间 + 1
			self.窗口时间 = tp.运行时间
		end
	end
	self.普通显示 = false
	self.普通:置打勾框(false)
	for i=1,#self.选择框组 do
		self.选择框显示[i] = false
		self.选择框组[i]:置打勾框(false)
	end
	return false
end

function 场景类_小地图:清空()
	self.目标格子 = nil
end

function 场景类_小地图:显示(dt,x,y)
	if self.记忆地图==nil then
	    return
	end
	if self.记忆地图 ~= tp.当前地图 then
		local Smap,Smapa = 小地图资源加载(self.记忆地图)
		if Smap == nil then
			self.qx = nil
			self.qy = nil
			self.可视 = false
			self.普通显示 = false
			self.普通:置打勾框(self.普通显示)
			return false
		end
		self.普通显示 = false
		self.普通:置打勾框(false)
		local ids = format("./img/%d.png",tp.当前地图)
		if  wns(ids) then
			self.小地图 = tp.资源:载入(ids,"图片")
			self.my = 2
		else
			self.小地图 = tp.资源:载入(Smap,"网易WDF动画",Smapa)
		end
		self.宽度 = self.小地图:取宽度()
		self.高度 = self.小地图:取高度()
		local fg = {}
		fgz(string(self.高度),fg)
		fg = number(fg[3])
		local v = 27
		if fg == 1 or fg == 3 or fg == 5 or fg == 7 or fg == 9 then
			v = 26
		end
		self.qx = nil self.qy = nil
		if self.宽度>= 500 then
			self.背景窗口:置宽高(self.宽度+v+2,self.高度+v+28)
		else
			self.背景窗口:置宽高(self.宽度+84,self.高度+v)
		end
		self.偏移X = (self.宽度 - 20) / tp.场景.地图.宽度
		self.偏移Y = (self.高度 - 20)/ tp.场景.地图.高度
		self.记忆地图 = tp.当前地图
		self.地图名称 = 取地图名称(self.记忆地图)
	end
	for i=1,#self.资源组 do
	   self.资源组[i]:更新(x,y)
	end
	self.NPC查找Q:更新(x,y)
	if self.鼠标 then
		if self.资源组[1]:事件判断() then
			self:打开()
			tp.窗口.世界大地图:打开()
		elseif self.资源组[2]:事件判断() then
			self:打开()
		-- 	tp.窗口.世界地图分类小地图:打开(1135)
		end
	end
	if self.NPC查找Q:事件判断() then
	    tp.窗口.小地图NPC:打开()
	end
	self.选中人物 = false
	self.焦点 = false
	for i=1,#self.选择框组 do
		self.选择框组[i]:更新(x,y)
		if self.选择框组[i]:事件判断() then
			self.选择框组[i]:置打勾框(not self.选择框显示[i])
			self.选择框显示[i] = not self.选择框显示[i]
		end
	end
	self.普通:更新(x,y)
	if self.普通:事件判断() then
		self.普通:置打勾框(not self.普通显示)
		self.普通显示 = not self.普通显示
		for i=1,#self.选择框组 do
			self.选择框组[i]:置打勾框(not self.选择框显示[i])
			self.选择框显示[i] = not self.选择框显示[i]
		end
	end
	self.背景窗口:显示(self.x-16,self.y-17)
	self.NPC查找Q:显示(self.x-16,self.y-43)
	if self.普通显示 or self.选择框显示[1] or self.选择框显示[2] or self.选择框显示[3] or self.选择框显示[4] or self.选择框显示[5] or self.选择框显示[6] then
		self.小地图:置颜色(-6579301)
	else
		self.小地图:置颜色(4294967295)
	end
	self.小地图:显示(self.x,self.y-self.my)
	local jyjr = tp.场景.假人[tp.当前地图]
	local rwjr = {}
	local csdz = tp.场景.传送
	for i=1,#tp.任务Npc do
		if tp.任务Npc[i][1] == self.地图名称 then
			insert(rwjr,tp.任务Npc[i])
		end
	end
	--=======地图传送文字名称
   local csdz名称 = 场景取名称(tp.当前地图)
   if csdz名称~=nil and csdz名称 ~=false then
	    for i=1,#csdz名称 do
	    	if not csdz名称[i].等级字体 then
	    		if csdz名称[i].是否红字体 then
	    			文字:置颜色(ARGB(255,255,0,0))--红色
	    			文字:显示(floor(csdz名称[i].x * 2 + self.x),floor(csdz名称[i].y * 2 + self.y),csdz名称[i].名称)
	    		else
	    			文字:置颜色(ARGB(255,45,74,220))--蓝色
	    			文字:显示(floor(csdz名称[i].x * 2 + self.x),floor(csdz名称[i].y * 2 + self.y),csdz名称[i].名称)
	    		end
	    	else
	    		zts1:置颜色(0xFFFFFFFF)--白色文字
	    		zts1:显示(floor(csdz名称[i].x * 2 + self.x),floor(csdz名称[i].y * 2 + self.y),csdz名称[i].名称)
	    	end
		end
   end
	pt:置颜色(4294967295)
	if self.选择框显示[6] then
	    self.迷你传送阵:更新(dt)
	    for i=1,#csdz do
			self.迷你传送阵:显示(floor(csdz[i].坐标.x * self.偏移X-11 + self.x),floor(csdz[i].坐标.y * self.偏移Y+11 + self.y))
		end
	end
	for n=1,#jyjr do
		if jyjr[n].执行事件 ~= nil then
			jyjr[n].地图不显示 = nil
			jyjr[n].地图坐标 = {x=(floor(jyjr[n].坐标.x * self.偏移X + self.x-(pt:取宽度(jyjr[n].名称)/2)+6)),y=floor(jyjr[n].坐标.y * self.偏移Y + 4 + self.y)}
			for m=1,#rwjr do
				if rwjr[m][2] == jyjr[n].名称 then
					rwjr[m][5] = jyjr[n]
					rwjr[m][6] = jyjr[n].地图坐标.x
					rwjr[m][7] = jyjr[n].地图坐标.y
					jyjr[n].地图不显示 = 1
				end
			end
			if (self.普通显示 or self.选择框显示[1] or self.选择框显示[2] or self.选择框显示[3] or self.选择框显示[4] or self.选择框显示[5] or self.选择框显示[6] ) and jyjr[n].地图不显示 == nil and tp.场景.假人.执行事件 == nil then
                if (jyjr[n].小地图名称颜色 == 0 or jyjr[n].小地图名称颜色 == 1 ) and self.选择框显示[1] then--普通
                	pt:置颜色(0xFFFFFFFF)--白色文字
                	pt:显示(jyjr[n].地图坐标.x ,jyjr[n].地图坐标.y ,jyjr[n].名称)
                elseif jyjr[n].小地图名称颜色 == 2 and self.选择框显示[2] then--商业
                	pt:置颜色(-256)
                	pt:显示(jyjr[n].地图坐标.x ,jyjr[n].地图坐标.y ,jyjr[n].名称)
                elseif jyjr[n].小地图名称颜色 == 3 and self.选择框显示[3] then--特殊
                	pt:置颜色(0xFF00FF00)
                	pt:显示(jyjr[n].地图坐标.x ,jyjr[n].地图坐标.y ,jyjr[n].名称)
                elseif jyjr[n].小地图名称颜色 == 4 and self.选择框显示[4] then--传送
                	pt:置颜色(0xFFFF0000)--红色文字
                	pt:显示(jyjr[n].地图坐标.x ,jyjr[n].地图坐标.y ,jyjr[n].名称)
                elseif jyjr[n].小地图名称颜色 == 5 and self.选择框显示[5] then--任务
                	pt:置颜色(0xFF03A89E)
                	pt:显示(jyjr[n].地图坐标.x ,jyjr[n].地图坐标.y ,jyjr[n].名称)
                end
			end
		end
	end
	--=====================
	for i=1,#rwjr do
		local jr =  nil
		if rwjr[i][3] ~= nil then
			for Q=1,#csdz do
				if csdz[Q].切换 == rwjr[i][4] then
					jr = csdz[Q]
					break
				end
			end
		end
		local 颜色 = -13434881
		local pyx,pyy
		if jr == nil then
			pyx = rwjr[i][6]
			pyy = rwjr[i][7]
			jr  = rwjr[i][5]
		else
			pyx = floor(jr.坐标.x * self.偏移X + self.x-(pt:取宽度(rwjr[i][2])/2)-6)
			pyy = floor(jr.坐标.y * self.偏移Y + self.y - 4)
		end
		zts1:置字间距(3)
		bw:置宽高(zts1:取宽度(rwjr[i][2]),16)
		bw:置坐标(pyx,pyy)
		if bw:检查点(x,y) then
			颜色 = -16737381
			self.选中人物 = true
			self.焦点 = true
			if mousea(0) then
				pyx = pyx + 1
				pyy = pyy + 1
				tp.运行时间 = tp.运行时间 + 1
				self.窗口时间 = tp.运行时间
				local a = xys(floor(tp.角色坐标.x / 20),floor(tp.角色坐标.y / 20))
				local b = xys(floor(jr.坐标.x / 20),floor(jr.坐标.y / 20))
				local wb = tp.场景.地图.寻路:寻路(a,b,true)
				local bts = {x,y}
				self.目标格子 = {x=bts[1]-self.x,y=bts[2]-self.y}
				tp.场景.人物.目标格子 = wb
				tp.场景.人物.移动 = true
				tp.场景.人物:取目标(tp.场景.人物.目标格子[1])
				tp.场景.跟随坐标 = {wb}
			end
		end
		zts1:置颜色(颜色)
		zts1:显示(pyx,pyy,rwjr[i][2])
		zts1:置颜色(4294967295)
		zts1:置字间距(0)
		rwjr[i][5] = nil
		rwjr[i][6] = nil
		rwjr[i][7] = nil
	end
	local v = self.x + self.背景窗口.宽度 - 48
	local v2 = self.y + self.背景窗口.高度 - 48
	self.资源组[2]:显示(v+16,self.y-16)--关闭按钮
	if self.宽度>= 500 then
		self.普通:显示(self.x-5,v2-3,true)--全部选择框
		for i=1,#self.选择框组 do
			self.选择框组[i]:显示(self.x-5+i*60,v2-3,true)
		end
		tp.字体表.普通字体:置颜色(0xFF03A89E):显示(self.x +23,v2+2 ,"全部")
		tp.字体表.普通字体:置颜色(0xFFFFFFFF):显示(self.x +60+23,v2 +2,"普通")
		tp.字体表.普通字体:置颜色(-256):显示(self.x +120+23,v2+2 ,"商业")
		tp.字体表.普通字体:置颜色(0xFF00FF00):显示(self.x +180+23,v2 +2,"特殊")
		tp.字体表.普通字体:置颜色(0xFFFF0000):显示(self.x +240+23,v2 +2,"传送")
		tp.字体表.普通字体:置颜色(0xFF03A89E):显示(self.x +300+23,v2 +2,"任务")
		tp.字体表.普通字体:置颜色(0xFFFF00FF):显示(self.x +360+23,v2 +2,"出口")
		self.资源组[1]:显示(v-34,v2)--世界按钮
	else
		self.普通:显示(v-32,self.y + 13,true)--全部选择框
		for i=1,#self.选择框组 do
			self.选择框组[i]:显示(v-32,self.y + 15+i*30,true)
		end
		tp.字体表.普通字体:置颜色(0xFF03A89E):显示(v-5,self.y + 20,"全部")
		tp.字体表.普通字体:置颜色(0xFFFFFFFF):显示(v-5,self.y + 52,"普通")
		tp.字体表.普通字体:置颜色(-256):显示(v-5,self.y + 82,"商业")
		tp.字体表.普通字体:置颜色(0xFF00FF00):显示(v-5,self.y + 112,"特殊")
		tp.字体表.普通字体:置颜色(0xFFFF0000):显示(v-5,self.y + 142,"传送")
		tp.字体表.普通字体:置颜色(0xFF03A89E):显示(v-5,self.y + 172,"任务")
		tp.字体表.普通字体:置颜色(0xFFFF00FF):显示(v-5,self.y + 202,"出口")
		self.资源组[1]:显示(v-34,v2)
	end
	if mouseb(0) and tp.场景.人物~=nil and (tp.场景.人物.队长开关==nil and #tp.队伍数据 >= 1) then

	else
		if self.目标格子 ~= nil then
			self.终点:显示(self.x + self.目标格子.x,self.y + self.目标格子.y)
		end
		local 角色坐标x = floor(tp.角色坐标.x * self.偏移X + self.x)-- + 13 + self.x)
		local 角色坐标y = floor(tp.角色坐标.y * self.偏移Y + self.y)--8 + self.y)
		local 鼠标坐标 = xys(floor((x - self.x)/(self.宽度/(tp.场景.地图.宽度/20))),floor((y - self.y)/(self.高度/(tp.场景.地图.高度/20))))
		self.间隔计次=0
		if tp.场景~=nil and tp.场景.人物~=nil and #tp.场景.人物~=nil then
			for n=1,#tp.场景.人物.目标格子 do
				self.间隔计次=self.间隔计次+1
				if self.间隔计次>=15 and n~=#tp.场景.人物.目标格子 then
					self.临时坐标x=floor(tp.场景.人物.目标格子[n].x*20 * self.偏移X  + self.x)-- + 13 + self.x)
					self.临时坐标y=floor(tp.场景.人物.目标格子[n].y*20 * self.偏移Y  + self.y)--8 + self.y)
					self.路点:显示(self.临时坐标x,self.临时坐标y)
				self.间隔计次=0
				elseif n==#tp.场景.人物.目标格子 then
					self.临时坐标x=floor(tp.场景.人物.目标格子[n].x*20 * self.偏移X  + self.x)-- + 13 + self.x)
					self.临时坐标y=floor(tp.场景.人物.目标格子[n].y*20 * self.偏移Y + self.y)--8 + self.y)
					self.小旗子:显示(self.临时坐标x,self.临时坐标y)
				end
			end
			self.标记:显示(角色坐标x,角色坐标y)
			if  self.小地图:是否选中(x,y) and self.鼠标 and not tp.消息栏焦点 and (self.目标格子 == nil or (self.目标格子.x ~= x-self.x and self.目标格子.y ~= y-self.y))  then
				tp.提示:自定义(x+6,y+6,format("#Y/%d，%d", 鼠标坐标.x,鼠标坐标.y))
				if mouseb(0) and not tp.战斗中 and self.鼠标 and not self.选中人物 then
					tp.运行时间 = tp.运行时间 + 1
					self.窗口时间 = tp.运行时间
					local a = xys(floor(tp.角色坐标.x / 20),floor(tp.角色坐标.y / 20))
					local 内容={x=鼠标坐标.x,y=鼠标坐标.y,距离=0}
					tp.场景.人物:设置路径(内容)
					客户端:发送数据(1001,鼠标坐标,1)
				end
			end
		end
	end
end

function 场景类_小地图:检查点(x,y)
	if self.背景窗口:是否选中(x,y) or self.NPC查找Q:是否选中(x,y) then
		return true
	end
end

function 场景类_小地图:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_小地图:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_小地图