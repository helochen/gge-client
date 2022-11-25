--======================================================================--
--	☆ 作者：飞蛾扑火 QQ：1415559882
--======================================================================--
local 场景类_点歌台 = class()
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
local 歌曲列表 = {}
function 场景类_点歌台:初始化(根)
	self.ID = 319
	self.x = 450
	self.y = 300
	self.xx = 0
	self.yy = 0
	self.注释 = "点歌台"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[0] = 按钮.创建(pwd("11"),0,0,4,true,true,"歌曲目录"),
		[1] = 资源:载入('wpal/121.wpal',"网易WDF动画",0xCFBF4EA8), -- 背景图片
		[2] = 按钮.创建(资源:载入('wzife.wd5',"网易WDF动画",0x01000025),0,0,4,true,true),-- 关闭
		[3] = 按钮.创建(pwd("1"),0,0,4,true,true,"			酷 狗 点 歌"),
		[4] = 按钮.创建(pwd("11"),0,0,4,true,true,"上一页"),--上滚动
		[5] = 按钮.创建(pwd("11"),0,0,4,true,true,"下一页"),--下滚动
		[6] =  根._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),4,14,160,2),
		[7] = 自适应.创建(2,1,300,200,3,9), -- 白色底子
		[8] = 自适应.创建(2,1,183,90,3,9), -- 白色底子
		[9] = 资源:载入('wzife.wd2',"网易WDF动画",0x15B369C0), -- 背景图片

	}
	for i=2,6 do
		self.资源组[i]:绑定窗口_(319)
	end
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('点歌台')
	总控件:置可视(true,true)
	self.祝福语输入 = 总控件:创建输入("名称输入",0,0,175,20)
	self.祝福语输入:置可视(false,false)
	self.祝福语输入:置限制字数(50)
	--self.祝福语输入:置多行(true)
	self.祝福语输入:屏蔽快捷键(true)
	self.祝福语输入:置光标颜色(-16777216)
	self.祝福语输入:置文字颜色(-16777216)
	self.加入 = 0
	self.选中 = 0
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.普通字体__
	zts2 = tp.字体表.描边字体
	ztstt3 = tp.字体表.描边字体
	self.资源组[6]:置起始点(0)
end

function 场景类_点歌台:打开(sj)
	if self.可视 then
		self.加入 = 0
		self.选中 = 0
		self.窗口时间 = 0
		self.可视 = false
		self.资源组[6]:置起始点(0)
		self.祝福语输入:置可视(false,false)
		self.祝福语输入:置文本("")
		歌曲列表={}
	else
		歌曲列表=sj
		insert(tp.窗口_,self)
		self.祝福语输入:置可视(true,true)
  		self.祝福语输入:置文本("")
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end


function 场景类_点歌台:显示(dt,x,y)
	if not self.可视 then return end
	local bbs = 歌曲列表
	local bbsa = #歌曲列表
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[0]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[9]:更新(dt)
	self.资源组[4]:更新(x,y,self.加入 > 0)
	self.资源组[5]:更新(x,y,self.加入 < bbsa - 7)
	if bbsa > 10 then
		self.资源组[6]:置高度(min(floor(93/(bbsa-10)),104))--竖条长度
		self.加入 = min(ceil((bbsa-10)*self.资源组[6]:取百分比()),bbsa-4)
	end
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[3]:事件判断() then
		if self.选中 ~= 0 then
			发送数据(104.1,{歌曲=bbs[self.选中]})
			self:打开()
		end
	elseif self.资源组[4]:事件判断() then--上滚动
		self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.加入-1,10,bbsa))
	elseif self.资源组[5]:事件判断() then--下滚动
		self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.加入+1,10,bbsa))
	elseif(self.资源组[7]:是否选中(x,y) or self.资源组[4]:是否选中(x,y) or self.资源组[6]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then--鼠标上滚动
		self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.加入-1,10,bbsa))
	elseif (self.资源组[7]:是否选中(x,y) or self.资源组[5]:是否选中(x,y) or self.资源组[6]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==-1 and self.加入 < bbsa - 4 then--鼠标下滚动
		self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.加入+1,10,bbsa))
	end
	self.资源组[1]:显示(self.x,self.y)
	--self.资源组[0]:显示(self.x-200,self.y-200)
	self.资源组[2]:显示(self.x+275,self.y-215)
	--self.资源组[7]:显示(self.x-240,self.y-30)
	--self.资源组[8]:显示(self.x+70,self.y-30)
	self.资源组[4]:显示(self.x-150,self.y+175)
	self.资源组[5]:显示(self.x-80,self.y+175)
	self.资源组[3]:显示(self.x+100,self.y+66)
	--self.资源组[9]:显示(self.x+220,self.y+50)
	-- if bbsa > 7 then
	-- 	self.资源组[6]:显示(self.x+422,self.y+167,x,y,self.鼠标)
	-- end
	-- tp.窗口标题背景_:置区域(0,0,92,16)
	-- tp.窗口标题背景_:显示(self.x+112,self.y+3)
	zts2:置字间距(2)
	-- zts2:显示(self.x+10,self.y+3,"点歌台")
	zts2:置字间距(0)
	for i=1,7 do
		if bbs[i+self.加入] ~= nil then
			local jx = self.x-270
			local jy = self.y+(i*28)-65
			bw:置坐标(jx,jy+1)
			local xz = bw:检查点(x,y)
			if self.选中 ~= i+self.加入 then
				if not self.资源组[6].接触 and xz and not tp.消息栏焦点 and self.鼠标 then
					if mouseb(0) then
						self.选中 = i+self.加入
					end
					self.焦点 = true
				end
			else
				if not self.资源组[6].接触 and xz and not tp.消息栏焦点 and self.鼠标 then
					self.焦点 = true
				end
				box(jx+40,jy+13,jx+270,jy+42,-10790181)
			end
			zts:置颜色(黑色)
			zts:显示(jx+41,jy+21,bbs[i+self.加入])
		end
	end
	self.祝福语输入:置坐标(self.x+80,self.y-20)
	self.控件类:更新(dt,x,y)
	self.控件类:显示(dt,x,y)
	if self.祝福语输入._已碰撞 then
		self.焦点 = true
	end
	if self.资源组[6].接触 then
		self.焦点 = true
	end
end


function 场景类_点歌台:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_点歌台:初始移动(x,y)
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

function 场景类_点歌台:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_点歌台
