--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2021-04-29 17:55:46
--======================================================================--
local 场景类_战斗召唤栏 = class()
local tp
function 场景类_战斗召唤栏:初始化(根)
	self.ID = 107
	self.x = 400
	self.y = 140
	self.xx = 0
	self.yy = 0
	self.注释 = "战斗召唤栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = require("script/系统类/按钮")
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 根.资源:载入('wpal/121.wpal',"网易WDF动画",0xE87F26E1),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFD3D61F2),0,0,4),
		[4] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x09217E13),0,0,4),
		[5] =  按钮.创建(pwd("11"),0,0,2,nil,nil,"召唤宝宝"),
	}
	self.窗口时间 = 0
	self.选中召唤兽 = 0
	self.加入 = 0
	self.人物 = ""
	tp = 根
end

function 场景类_战斗召唤栏:打开(人物,数量)
	self.召唤数量=数量
	if self.可视 then
		self.加入 = 0
		self.选中召唤兽 = 0
		self.可视 = false
		战斗类.战斗指令.召唤开关=false

	else
		self.加入 = 0
		self.选中召唤兽 = 0
		self.人物 = 人物
		for i=1,#self.人物.子女列表 do
			 table. insert(self.人物.宝宝列表, self.人物.子女列表[i])
		end
		self.可视 = true
		tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	  	战斗类.战斗指令.召唤开关=true

	end
end

function 场景类_战斗召唤栏:更新(dt,mx,my)
	self:检查点(mx,my)
	if self.可视 then
		self.焦点 = false
		if self.鼠标 then
			if self.资源组[2]:事件判断()  then
				self:打开()
			end
			if self.资源组[3]:事件判断() then
				if self.加入<=0 then return  end
				self.加入 = self.加入 - 1
			end
			if self.资源组[4]:事件判断() then
				if self.加入+10>=#self.人物.宝宝列表 then return  end
				self.加入 = self.加入 + 1
				--print(加入)
			end
			if self.资源组[5]:事件判断() then
				if self:取是否召唤(self.选中召唤兽) then
                 	tp.提示:写入("#Y/该召唤兽已经参加过战斗了")
                 	return
                elseif self.选中召唤兽 == 0 then
                 	return
                else
                 	战斗类.战斗指令:设置召唤(self.选中召唤兽)
                 	self:打开()
                 	return
				 end
			end
			if 引擎.鼠标弹起(1) and not tp.禁止关闭 then
				self:打开()
			end
			if tp.按钮焦点 then
				self.焦点 = true
			end
		end
	end
end

function 场景类_战斗召唤栏:显示(dt,mx,my)
	if self.可视 then
		self.资源组[1]:显示(self.x,self.y)
		self.资源组[2]:更新(mx,my)
		self.资源组[3]:更新(mx,my,self.加入 > 0)
		self.资源组[4]:更新(mx,my)--,self.加入 < #self.人物.宝宝列表 - 4)
		self.资源组[5]:更新(mx,my,self.选中召唤兽 ~= 0 and self.人物.参战宝宝 ~= self.人物.宝宝列表[self.选中召唤兽])
		if not self.鼠标 then
			self.资源组[2].焦点 = 0
			if self.加入 > 0 then
				self.资源组[3].焦点 = 0
			else
				self.资源组[3].焦点 = 3
			end
			if self.加入 < #self.人物.宝宝列表 - 5 then
				self.资源组[4].焦点 = 0
			else
				self.资源组[4].焦点 = 3
			end
			if self.选中召唤兽 ~= 0 then
				self.资源组[5].焦点 = 0
			else
				self.资源组[5].焦点 = 3
			end
		end
		--self.资源组[2]:显示(self.x + 150,self.y + 15)
		--self.资源组[3]:显示(self.x + 136,self.y + 35)
		--self.资源组[4]:显示(self.x + 132,self.y + 249)
		--self.资源组[5]:显示(self.x + 53,self.y + 408,true)
		self.资源组[5]:显示(self.x + 53,self.y - 10,true)
		local 偏移x = 35
		local 偏移y = 30
		for m=1,10 do
			if self.人物.宝宝列表[m] ~= nil then
				if((m + self.加入) <= (10 + self.加入)) then
					if(mx - self.x > 10 and my - self.y+4 > 偏移y + 20*m and mx - self.x < 130 and my - self.y + 4 < 偏移y + 20*(m+1) ) and self.鼠标 and not 文本栏焦点 then
						if mx - self.x+12 > 0 and my - self.y-35 > 0 + 20 * m and mx - self.x < 130 and my - self.y+7 < 42 + 20*(m+1) and self.人物.宝宝列表[m] ~= nil and not 文本栏焦点 then
							if 引擎.鼠标弹起(0) then
								self.选中召唤兽 = m + self.加入
							end
							for n=1,19 do
								引擎.画线(self.x-3 + 偏移x,self.y + 偏移y + 20 * m - 3 + n,self.x + 130,self.y + 偏移y + 20 * m - 3 + n,ARGB(255,201,207,109))
							end
							self.焦点 = true
						end
					end
				end
			end
		end
		if (self.选中召唤兽 - self.加入) > 0  and (self.选中召唤兽 - self.加入 <= 5) then
			for n=1,19 do
				引擎.画线(self.x-3 + 偏移x,self.y + 偏移y + 20 * (self.选中召唤兽 - self.加入) - 3 + n,self.x + 130,self.y + 偏移y + 20 * (self.选中召唤兽 - self.加入) - 3 + n,ARGB(255,91,90,219))
			end
		end
		for n=1,10	do
			if((n + self.加入) <= (10 + self.加入)) and self.人物.宝宝列表[n + self.加入]~=nil then
				local 颜色 = ARGB(255,0,0,0)
				if self.人物.宝宝列表[n + self.加入] ==  self.人物.参战宝宝 then
					颜色 = ARGB(255,255,255,0)
				end
			  if self:取是否召唤(n + self.加入)==false then
				  tp.字体表.普通字体:置颜色(颜色):显示(self.x + 偏移x,self.y + 偏移y + n * 20,self.人物.宝宝列表[n + self.加入].名称)
				else
				 tp.字体表.普通字体:置颜色(红色):显示(self.x + 偏移x,self.y + 偏移y + n * 20,self.人物.宝宝列表[n + self.加入].名称)
				 end
			end
		end
		if self.选中召唤兽 ~= 0 then
			tp.字体表.普通字体:置颜色(ARGB(255,0,0,0))
			tp.字体表.普通字体:显示(self.x + 73,self.y+276,self.人物.宝宝列表[self.选中召唤兽].名称)
			tp.字体表.普通字体:显示(self.x + 73,self.y+311,self.人物.宝宝列表[self.选中召唤兽].等级)
			tp.字体表.普通字体:显示(self.x + 73,self.y+346,self.人物.宝宝列表[self.选中召唤兽].忠诚)
			tp.字体表.普通字体:显示(self.x + 73,self.y+375,self.人物.宝宝列表[self.选中召唤兽].气血.."/"..self.人物.宝宝列表[self.选中召唤兽].最大气血)
			tp.字体表.普通字体:显示(self.x + 73,self.y+405,self.人物.宝宝列表[self.选中召唤兽].魔法.."/"..self.人物.宝宝列表[self.选中召唤兽].最大魔法)
		end
	end
end
function 场景类_战斗召唤栏:取是否召唤(id)
 	for n=1,#self.召唤数量 do
     	if self.召唤数量[n]==id then
           return true
     	end
 	end
 	return false
end

function 场景类_战斗召唤栏:检查点(x,y)
	local n = false
	self.鼠标=false
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		n  = true
		self.鼠标=true
	end
	return n
end

function 场景类_战斗召唤栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not 引擎.消息栏焦点 then
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

function 场景类_战斗召唤栏:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_战斗召唤栏