--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-04-10 16:23:19
--======================================================================--
local 场景类_显示开关 = class()

local floor = math.floor
local tp,zts1
local insert = table.insert


function 场景类_显示开关:初始化(根)
	self.ID = 41
	self.xx = 0
	self.yy = 0
	self.注释 = "显示开关"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	zts1 = tp.字体表.描边字体
	self.窗口时间 = 0
end

function 场景类_显示开关:打开(x,y)
 	if self.可视 then
		self.可视 = false
		self.资源组 = nil
		return
	else

		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.资源组 = {
			[1] = 自适应.创建(0,1,129,200,3,9),
			[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
			[3] = 按钮(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
			[4] = 按钮(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
			[5] = 按钮(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
			[6] = 按钮(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
			[7] = 按钮(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),
			[8] = 按钮(资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true),

		}
		self.资源组[3]:置打勾框(tp.称谓特效)
		self.资源组[4]:置打勾框(tp.足迹特效)
		self.资源组[5]:置打勾框(tp.光环特效)
		self.资源组[6]:置打勾框(tp.锦衣特效)
		self.资源组[7]:置打勾框(tp.坐骑特效)
		--self.资源组[8]:置打勾框(tp.魂兽特效)
		self.资源组[2]:绑定窗口_(41)
		self.x = x
		self.y = y
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间

	   self.可视 = true

	end
end

function 场景类_显示开关:刷新()

end

function 场景类_显示开关:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y)
	self.资源组[7]:更新(x,y)
	self.资源组[8]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+106,self.y+6)
	-- tp.窗口标题背景_:置区域(0,0,40,16)
	-- tp.窗口标题背景_:显示(self.x+37,self.y+3)
	zts1:置字间距(3)
	zts1:显示(self.x+41,self.y+3,"屏蔽")
	zts1:显示(self.x+20,self.y+93,"称谓")
	zts1:显示(self.x+20,self.y+37,"脚印")
	zts1:显示(self.x+20,self.y+65,"足迹")
	--zts1:显示(self.x+20,self.y+93,"魂骨")
	zts1:显示(self.x+20,self.y+123,"锦衣")
	zts1:显示(self.x+20,self.y+153,"坐骑")
	self.资源组[3]:显示(self.x+70,self.y+93)
	self.资源组[4]:显示(self.x+70,self.y+33)
	self.资源组[5]:显示(self.x+70,self.y+61)
	self.资源组[6]:显示(self.x+70,self.y+120)
	self.资源组[7]:显示(self.x+70,self.y+150)
	--self.资源组[8]:显示(self.x+70,self.y+145)
	if self.资源组[3]:事件判断() then

		 tp.称谓特效 = not self.资源组[3].打勾框                                  --  --锦衣
		if not tp.称谓特效 then
			self.资源组[3]:置打勾框(tp.称谓特效)
	        tp.场景.人物.称谓特效 = false
			--tp.场景.玩家.锦衣特效 = false
			tp.提示:写入("#Y您已关闭称谓特效！")
		else
			self.资源组[3]:置打勾框(tp.称谓特效)
			tp.场景.人物.称谓特效 = true
			--tp.场景.玩家.锦衣特效 = true
			tp.提示:写入("#Y您已开启称谓特效")
		end
	elseif self.资源组[4]:事件判断() then
		 tp.足迹特效 = not self.资源组[4].打勾框                                  -- 足迹特效
		if not tp.足迹特效 then
			self.资源组[4]:置打勾框(tp.足迹特效)
            tp.场景.人物.足迹特效 = false
            --tp.场景.玩家.足迹特效 = false
			tp.提示:写入("#Y您已关闭足迹特效！")
		else
			self.资源组[4]:置打勾框(tp.足迹特效)
			tp.场景.人物.足迹特效 = true
			--tp.场景.玩家.足迹特效 = true
			tp.提示:写入("#Y您已开启足迹特效")
		end


	elseif self.资源组[5]:事件判断() then
	     tp.光环特效 = not self.资源组[5].打勾框
		if not tp.光环特效 then                                                   -- 光环特效
			self.资源组[5]:置打勾框(tp.光环特效)
            tp.场景.人物.光环特效 = false
			 --tp.场景.玩家.光环特效 = false
			tp.提示:写入("#Y您已关闭光环特效！")
		else
			self.资源组[5]:置打勾框(tp.光环特效)
            tp.场景.人物.光环特效 = true
			--tp.场景.玩家.光环特效 = true
			tp.提示:写入("#Y您已开启光环特效")
		end
	elseif self.资源组[6]:事件判断() then
		     tp.锦衣特效 = not self.资源组[6].打勾框
		if not tp.锦衣特效 then
			self.资源组[6]:置打勾框(tp.锦衣特效)                                  -- 坐骑特效
		  		local 开关 = false
			tp.场景.人物:置模型4()
            tp.场景.人物:置染色(tp.队伍[1].染色方案,tp.队伍[1].染色组[1],tp.队伍[1].染色组[2],tp.队伍[1].染色组[3])
		  --tp.场景.玩家.锦衣特效 = false
			tp.提示:写入("#Y您已关闭锦衣特效！")
		else
			self.资源组[6]:置打勾框(tp.锦衣特效)
			local 开关 = true
			tp.场景.人物:置模型2(开关)
			--tp.场景.玩家.锦衣特效 = true
			tp.提示:写入("#Y您已开启锦衣特效")
		end
	elseif self.资源组[7]:事件判断() then
		tp.坐骑特效 = not self.资源组[7].打勾框
		if not tp.坐骑特效 then
			self.资源组[7]:置打勾框(tp.坐骑特效)                                  -- 坐骑特效
		   tp.场景.人物:置模型3()
		   --tp.场景.人物.坐骑特效 = false
		   --tp.场景.玩家.坐骑特效 = false
			tp.提示:写入("#Y您已关闭坐骑特效！")
		else
			self.资源组[7]:置打勾框(tp.坐骑特效)
			tp.场景.人物:坐骑改变(tp.队伍[1].模型,tp.坐骑)
			--tp.场景.人物.坐骑特效 = true
			--tp.场景.玩家.坐骑特效 = true
			tp.提示:写入("#Y您已开启坐骑特效")
		end
	elseif self.资源组[8]:事件判断() then
		     tp.魂兽特效 = not self.资源组[8].打勾框
		if not tp.魂兽特效 then
			self.资源组[8]:置打勾框(tp.魂兽特效)                                  -- 坐骑特效
		   tp.场景.人物.魂兽特效 = false
		   --tp.场景.玩家.坐骑特效 = false
			tp.提示:写入("#Y您已关闭魂兽特效！")
		else
			self.资源组[8]:置打勾框(tp.魂兽特效)
			tp.场景.人物.魂兽特效 = true
			--tp.场景.玩家.坐骑特效 = true
			tp.提示:写入("#Y您已开启魂兽特效")
		end
	end






	zts1:置字间距(0)
	local xx = 0
	local yy = 1

end



function 场景类_显示开关:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_显示开关:初始移动(x,y)
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

function 场景类_显示开关:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_显示开关