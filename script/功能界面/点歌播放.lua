
--======================================================================--
-- @作者: 幕神
-- @QQ：303343650
-- @创建时间: 2021-01-13 02:34:19
-- @Last Modified time: 2021-01-13 21:33:23
--======================================================================--
local 场景类_点歌播放 = class()
local tx = 引擎.取头像
local bw = require("gge包围盒")(0,0,223,28)
local box = 引擎.画矩形
local ani = 引擎.取战斗模型
local format = string.format
local floor = math.floor
local min = math.min
local max = math.max
local tp,zts,zts1,zts2,ztstt3
local ceil = math.ceil
local tostring = tostring
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local insert = table.insert
local fmod = require "Fmod类"
function 场景类_点歌播放:初始化(根)
	self.ID = 320
	self.x = 506
	self.y = 489
	self.xx = self.x
	self.yy = self.y
	self.注释 = "点歌台"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 资源:载入('wzife.wd1',"网易WDF动画",1408403822), -- 横条
		[2] = 按钮.创建( 资源:载入('wzife.wd1',"网易WDF动画",4266056165),0,0,4,true,true),
	}
	self.资源组[2]:绑定窗口_(320)
    --self.提示 = 根.提示框
	self.加入 = 0
	self.选中 = 0
	self.窗口时间 = 0
	self.祝福 = ""
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.普通字体__
	zts2 = tp.字体表.描边字体
	ztstt3 = tp.字体表.描边字体
	self.祝福音乐 = nil
end

function 场景类_点歌播放:打开(dz,zf)
	if self.可视 then
		self.加入 = 0
		self.选中 = 0
		self.窗口时间 = 0
		self.可视 = false
	else
		-- self.数据组[#self.数据组+1]="#Y".."#G美好的一天从这一秒开始，游戏对应的活动任务数据已经刷新，大家可以前去领取任务或参加活动了"
	 --    if self.显示开关==false then
	 --        self.显示开关=true
	 --        self.丰富文本:清空()
	 --        self.丰富文本:添加文本(self.数据组[1])
	 --    end
		 if tp.音乐~=nil then
	      tp.音乐:置音量(0)
	    end
	    if 战斗音乐~=nil then
	      战斗音乐:置音量(0)
	    end
	 	self.祝福音乐=tp.资源:载入(wdf配置.."/audio/"..dz..".mp3","音乐",nil)
		self.祝福音乐:置音量(游戏音量)
      	self.祝福音乐:播放()
      	self.祝福 = zf
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end


function 场景类_点歌播放:显示(dt,x,y)
	if not self.可视 then return end
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self.祝福音乐:停止()
		self.祝福音乐 = nil
		if 战斗音乐~=nil then
			战斗音乐:置音量(游戏音量)
		end
		if tp.音乐~=nil then
	      tp.音乐:置音量(游戏音量)
	    end
		self:打开()
		return false
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+47,self.y+24)
	zts:置颜色(0xFFFF0000)
	zts:显示(self.x+106,self.y+42,self.祝福)
	if self.祝福音乐 ~= nil and self.祝福音乐:是否播放() == false then
		--
		if 战斗音乐~=nil then
			战斗音乐:置音量(游戏音量)
		end
		if tp.音乐~=nil and tp.战斗中==false then
	     tp.音乐:置音量(游戏音量)
	 	end
	 	self.祝福音乐:停止()
	    self.祝福音乐 = nil
	    self:打开()
	end

end


function 场景类_点歌播放:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_点歌播放:初始移动(x,y)
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

function 场景类_点歌播放:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_点歌播放
