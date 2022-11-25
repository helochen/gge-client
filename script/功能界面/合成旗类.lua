--======================================================================--
-- @作者: GGE研究群: 684484316
-- @创建时间:   2019-09-03 02:34:19
-- @Last Modified time: 2020-08-20 23:16:59
-- 梦幻西游游戏资源破解  老毕   和 C++PrimerPlus  这俩位大神破解所以资源
--======================================================================--
local 合成旗类 = class()

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

function 合成旗类:初始化(根)
	self.ID = 250
	--宽高 640 310
	self.x = 100
	self.y = 120
	self.xx = 0
	self.yy = 0
	self.注释 = "合成旗"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	self.资源组 = {

	}
	tp = 根
	self.背景窗口 = tp._自适应.创建(0,1,0,0,3,9)
	self.窗口时间 = 0

	self.地图大小={
		[1092]={z=4480,y=3020},
		[1001]={z=11000,y=5600},
		[1070]={z=3200,y=4200},
		[1208]={z=3840,y=2400},
	}
end

function 合成旗类:打开(数据)
	if self.可视 or 数据==nil or 数据.地图==nil then
		self.可视 = false
		self.圆圈={}
	else
		insert(tp.窗口_,self)
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	    local Smap,Smapa = 小地图资源加载(数据.地图)
	    self.坐标点=数据.xy
	    self.小地图 = tp.资源:载入(Smap,"网易WDF动画",Smapa)
		self.宽度 = self.小地图:取宽度()
  	    self.高度 = self.小地图:取高度()
		self.x = self.x or floor((全局游戏宽度 - self.宽度) /2)
		self.y = self.y or floor((全局游戏高度 - self.高度) /2)
    	local fg = {}
		fgz(string(self.高度),fg)
		fg = number(fg[3])
		local v = 27
		if fg == 1 or fg == 3 or fg == 5 or fg == 7 or fg == 9 then
			v = 26
		end
		self.qx = nil self.qy = nil
		self.背景窗口:置宽高(self.宽度+26,self.高度+v)
		self.偏移X = (self.宽度 - 20) / self.地图大小[数据.地图].z
	    self.偏移Y = (self.高度 - 20)/  self.地图大小[数据.地图].y
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		self.圆圈={}
		for i=1,#self.坐标点 do
				self.圆圈[i] =	按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x146bb550),0,0,4,true,true)
		end


	end
end

function 合成旗类:显示(dt,x,y)

		--self.圆圈[n]:显示(x1*20 * self.偏移X + 13 + self.x,y1*20 * self.偏移Y + 13 + self.y)
	self.焦点 = false
	self.背景窗口:显示(self.x-16,self.y-17)
	self.小地图:显示(self.x,self.y)

	for n=1,#self.坐标点 do
		self.圆圈[n]:更新(x,y)
		--local x1,y1=self.坐标点[n].x,self.坐标点[n].y
		self.圆圈[n]:显示(self.坐标点[n].x*20 * self.偏移X + 13 + self.x,self.坐标点[n].y*20 * self.偏移Y + 13+ self.y)
		if self.圆圈[n]:事件判断(x,y)  then
			发送数据(3737,{序列=n})
			self.可视 = false
		end
	end
end

function 合成旗类:检查点(x,y)
	if self.可视 and self.小地图:是否选中(x,y)  then
		return true
	end
end

function 合成旗类:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 合成旗类:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 合成旗类

