--======================================================================--
--	☆ 作者：飞蛾扑火 QQ：1415559882
--======================================================================--
local 场景类_标题 = class()
local tp
local ceil = math.ceil
local min = math.min
local max = math.max
local mouseb = 引擎.鼠标弹起
local box = 引擎.画矩形
local insert = table.insert
local remove = table.remove
require("script/初系统/游戏更新说明")
function 场景类_标题:初始化(根)
	local xx = {{"1989C5FC",0xEB3FD8C3,0xEC1A0419},{"66279210",0x16E9D48F,0x79560528},{"07B8C541",0x7BBB735E,nil}}
	local sj = 引擎.取随机整数(1,1)
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 滑块 = 根._滑块
	local 自适应 = 根._自适应
	if xx[sj][3] ~= nil then
		self.特效覆盖 = 资源:载入('wzife.wd4',"网易WDF动画",xx[sj][3])
		self.特效计次 = self.特效覆盖.宽度/2+450
		self.特效覆盖:置区域(self.特效计次,0,全局游戏宽度,全局游戏高度)
	end
	local dh = {0xDC739617,0x22E6E35C,0x16CC1B46,0xD8632D20}
	  self.标题背景 = 资源:载入("pic/背景.jpg","图片")
	  self.标题背景公告 = 资源:载入("pic/公告背景1.png","图片")
	  self.场景覆盖 = 资源:载入('wzife.wd4',"网易WDF动画",xx[sj][2])
	  self.场景计次 = self.场景覆盖.宽度
	  self.场景覆盖:置区域(self.场景计次,0,全局游戏宽度,全局游戏高度)
	  self.梦幻西游 = 资源:载入("pic/mhxy.png","图片")
	  self.公告榜 = 根._按钮(资源:载入('other.wdf',"网易WDF动画",0x10006),0,0,3,true,true)
	  self.注册账号 = 根._按钮(资源:载入('other.wdf',"网易WDF动画",0x10001),0,0,3,true,true)
	  self.制作团队 = 根._按钮(资源:载入('other.wdf',"网易WDF动画",0x10004),0,0,3,true,true)
	  self.退出游戏 = 根._按钮(资源:载入('other.wdf',"网易WDF动画",0x10002),0,0,3,true,true)
	  self.进入游戏 = 根._按钮(资源:载入('other.wdf',"网易WDF动画",0x10014),0,0,3,true,true)
	  self.游戏建议 = 根._按钮(资源:载入('other.wdf',"网易WDF动画",0x10007),0,0,3,true,true)
	  self.服务条款 = 根._按钮(资源:载入('other.wdf',"网易WDF动画",0x10008),0,0,3,true,true)



	tp = 根
	self.丰富文本说明 = 根._丰富文本(480,380)
	self.msg系统公告内容 = 场景类_标题说明
	self.丰富文本说明:添加文本(self.msg系统公告内容)
	self.丰富文本说明.滚动值 = self.丰富文本说明.行数量
	self.丰富文本说明:滚动(self.丰富文本说明.滚动值)
	self.丰富文本说明:滚动(-21)
	self.介绍加入 = 0
	客户端:连接处理(系统参数.服务器.ip,系统参数.服务器.端口)
end

function 场景类_标题:显示(dt,x,y)
    self.标题背景:置区域(self.特效计次,0,全局游戏宽度,全局游戏高度)
    self.标题背景:显示(0,0)
	self.场景计次 = self.场景计次 - 0.3
	self.场景覆盖:置区域(self.场景计次,0,全局游戏宽度,全局游戏高度)
	self.场景覆盖:显示(0,全局游戏高度)
	if self.特效覆盖 ~= nil then
		self.特效计次 = self.特效计次 - 0.7
		self.特效覆盖:置区域(self.特效计次,0,全局游戏宽度,全局游戏高度)
		self.特效覆盖:显示(0,全局游戏高度)
	end
	if tp.进程 == 1 then
        local msg宽度 =全局游戏宽度/2-250--200
        local msg高度 =全局游戏高度/2-200--200
		-- 引擎.置标题(全局游戏标题)
  self.进入游戏:更新(x,y)
  self.注册账号:更新(x,y)
  self.制作团队:更新(x,y)
  self.退出游戏:更新(x,y)
  self.服务条款:更新(x,y)
  self.公告榜:更新(x,y)
  self.游戏建议:更新(x,y)
  self.标题背景公告:显示(30,130)
  self.梦幻西游:显示(300-90,0)
  self.注册账号:显示(800-160,600-200)
  self.制作团队:显示(800-160,600-145)
  self.进入游戏:显示(800-160,600-255)
  self.退出游戏:显示(800-160,600-90)
  self.公告榜:显示(775-680-23,600-440)
  self.游戏建议:显示(785-500-23,600-440)
  self.服务条款:显示(795-320-23,600-440)
	if self.制作团队:事件判断() then
	  --  引擎.运行("http://www.baidu.com")
	  					tp.提示:写入(tostring(全局msg制作团队))	---tp.提示:写入("游戏官方: WWW.163.COM")
	  end
	if(self.标题背景公告:是否选中(x,y) ) and 引擎.取鼠标滚轮() >0 then--鼠标上滚动
	if self.丰富文本说明.滚动值 < #self.丰富文本说明.显示表 -21 then
	  self.丰富文本说明:滚动(1)
	  self.介绍加入=self.介绍加入-1
	      end
	elseif (self.标题背景公告:是否选中(x,y)) and 引擎.取鼠标滚轮() <0  then--鼠标下滚动

	if self.丰富文本说明.滚动值 > 0 then
	  self.丰富文本说明:滚动(-1)
	  self.介绍加入=self.介绍加入+1
	    end
	  end
	  self.丰富文本说明:显示(55,220)
	if self.进入游戏:事件判断() then
	  tp.进程=8
	elseif self.注册账号:事件判断() then
	  -- tp.提示:写入("#G/直接输入账号密码进入游戏即可自动注册！")
	  tp.进程 = 5
	elseif self.退出游戏:事件判断() then
	        引擎.关闭()
	-- elseif self.注册账号:事件判断() then
	-- tp.提示:写入("#R/本版本现为内部测试阶段,暂未对外开放账号注册！")
	  end
		tp.鼠标.还原鼠标()
	end
end

return 场景类_标题