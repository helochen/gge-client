--======================================================================--
--	☆ 作者：飞蛾扑火 QQ：1415559882
--======================================================================--
local 场景类_退出 = class()
local tp,zts,zts1

function 场景类_退出:初始化(根)
	self.x = 335
	self.y = 全局游戏高度-500
	self.xx = 0
	self.yy = 0
	self.注释 = "退出"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	tp = 根
	self.资源组 = {
		[1] = 资源:载入('wzife.wdf',"网易WDF动画",0x1732C1EF),
		[2] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x86D66B9A),0,0,4,true,true,"退出游戏"),
		[3] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x86D66B9A),0,0,4,true,true,"到主界面"),
		[4] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x86D66B9A),0,0,4,true,true,"游戏团队"),
		[5] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x86D66B9A),0,0,4,true,true,"继续游戏"),
		-- [5] = tp._滑块.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8D4BBC26),1,199,16,1),
	}
	-- for i=2,5 do
	-- 	self.资源组[i]:置偏移(0,2)-- -3
	-- end
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.普通字体
	self.窗口时间 = 0
end

function 场景类_退出:打开()
	if self.可视 then
		self.可视 = false
	else
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_退出:显示(dt,x,y)
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	if self.资源组[2]:事件判断() then--退出
		引擎关闭开始()
	elseif self.资源组[3]:事件判断() then--到主界面
		tp.进程2 = 0
		self:打开()
		local a = {wdf配置.."/Audio/1091.mp3",wdf配置.."/Audio/1070.mp3"}
		tp.音乐:停止()
		tp.音乐 = nil
		tp.音乐 = tp.资源:载入(a[引擎.取随机整数(1,2)],"音乐")
		tp.音乐:播放()
		-- tp.标题 = require("script/初系统/标题").创建(tp)
		-- tp.读取 = require("script/初系统/选择角色").创建(tp)
		-- tp.创建 = require("script/初系统/创建").创建(tp)
		tp.进程 = 1
		系统退出=true
		客户端:断开()
	elseif self.资源组[4]:事件判断() then--游戏团队
		tp.提示:写入(tostring(全局msg制作团队))
		-- __gge.messagebox(tostring(全局msg制作团队),"游戏团队",16)
	elseif self.资源组[5]:事件判断() then--继续游戏
		tp.进程2 = 0
		self.可视 = false
	end
	self.焦点 = false
	local 临时宽度 = 全局游戏宽度/2-150
	local 临时高度 = 全局游戏高度/2-200
	self.资源组[1]:显示(临时宽度,临时高度)
	self.资源组[2]:显示(临时宽度+10,临时高度+100,true)
	self.资源组[3]:显示(临时宽度+86,临时高度+100,true)
	self.资源组[4]:显示(临时宽度+240,临时高度+100,true)
	self.资源组[5]:显示(临时宽度+164,临时高度+100,true)
	zts:置颜色(-256)
	zts:显示(临时宽度+10,临时高度+55,"期待您的下次登录")
	zts1:置颜色(0xFFFFFFFF)
	zts1:显示(临时宽度+130,临时高度+5,"梦幻西游")

end

return 场景类_退出