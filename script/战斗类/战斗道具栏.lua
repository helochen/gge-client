--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2020-08-23 04:07:31
--======================================================================--
local 场景类_战斗道具栏 = class()
local require = require
local tp

function 场景类_战斗道具栏:初始化(根)
	self.ID = 104
	self.x = 376
	self.y = 179
	self.xx = 0
	self.yy = 0
	self.注释 = "战斗"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 根.资源:载入('wzife.wdf',"网易WDF动画",0xC6D8094C),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮(根.资源:载入('wzife.wdf',"网易WDF动画",0xFD3D61F2),0,0,4),
		[4] = 按钮(根.资源:载入('wzife.wdf',"网易WDF动画",0x09217E13),0,0,4),
	}
	self.物品 = {}
	local 格子 = require("script/显示类/物品_格子")
	for n=1,8 do -- 创建十八页
		for h=1,4 do
			for l=1,5 do
				self.物品[#self.物品 + 1] = 格子(l*51-37+self.x+4,h*51+self.y-16,#self.物品 + 1,"战斗道具_物品")
			end
		end
	end
	self.开始 = 1
	self.结束 = 20
	self.窗口时间 = 0
	tp = 根
end

function 场景类_战斗道具栏:打开(人物)
	if self.可视 then
		self.可视 = false
	else
		for n=self.开始,self.结束 do
			self.物品[n]:置物品(tp.道具列表[n])

		end
		self.可视 = true
		tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	end
end

function 场景类_战斗道具栏:更新(dt,x,y)

 self.鼠标=self:检查点(x,y)
end
function 场景类_战斗道具栏:取可用道具(名称,物品,总类)
 	local 加血道具={"金创药","小还丹","千年保心丹","金香玉","五龙丹","翡翠豆腐","佛跳墙","蛇蝎美人","风水混元丹","定神香","十香返生丸","佛光舍利子","九转回魂丹","珍露酒","虎骨酒","女儿红","蛇胆酒","醉生梦死","梅花酒","百味酒","天不老","紫石英","血色茶花","熊胆","鹿茸","六道轮回","凤凰尾","硫磺草","龙之心屑","火凤之睛","四叶花","天青地白","七叶莲","丁香水","月星子","仙狐涎","地狱灵芝","麝香","血珊瑚","餐风饮露","白露为霜","天龙水","孔雀红","紫丹罗","佛手","旋复花","龙须草","百色花","香叶","白玉骨头","鬼切草","灵脂","曼陀罗花"}
 	for n=1,#加血道具 do
     	if 加血道具[n]==名称 then return 5 end
 	end
 	if 名称=="乾坤袋" then
     	return 4
 	end
 	if 总类~=nil and 总类==2000 then
 		return 4
 	end
  	if 名称=="清心咒" or 名称=="乾坤玄火塔" or 名称=="混元伞"  or 名称=="五彩娃娃" or 名称=="苍白纸人" or 名称=="干将莫邪"  then
      	return 5
   	elseif 名称=="惊魂铃" or 名称=="发瘟匣" or 名称=="断线木偶"  or 名称=="摄魂" or 名称=="无魂傀儡" or 名称=="无尘扇"  then
      	return 4
  	end
  	return 0
end
function 场景类_战斗道具栏:显示(dt,x,y)
	if not self.可视 then
		return false
	end
	self.焦点 = false

  -- print(self.鼠标 )
		if self.鼠标 then
		self.资源组[2]:更新(x,y)
		--self.资源组[3]:更新(x,y)
		--self.资源组[4]:更新(x,y)
		if self.资源组[2]:事件判断() then
			self:打开()
		elseif self.资源组[3]:事件判断() then
			--[[self.开始 = self.开始 - 20
			self.结束 = self.结束 - 20
			for n=self.开始,self.结束 do
				self.物品[n]:置物品(tp.道具列表[n])
			end --]]
		elseif self.资源组[4]:事件判断() then
			--[[self.开始 = self.开始 + 20
			self.结束 = self.结束 + 20
			for n=self.开始,self.结束 do
				self.物品[n]:置物品(tp.道具列表[n])
			end--]]
		end
	else
		self.资源组[2].焦点 = 0
		if self.开始 ~= 1 then
			self.资源组[3].焦点 = 0
		else
			self.资源组[3].焦点 = 3
		end
		if self.结束 ~= 160 then
			self.资源组[4].焦点 = 0
		else
			self.资源组[4].焦点 = 3
		end
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x + 286,self.y + 6,true)
	--self.资源组[3]:显示(self.x + 275,self.y + 38,true)
	----self.资源组[4]:显示(self.x + 275,self.y + 221,true)
	local n = self.开始-1
	local c =  false
	for h=1,4 do
		for l=1,5 do
			n = n + 1
			self.物品[n]:置坐标(l*51-37+self.x+4,h*51+self.y-16)
			self.物品[n]:显示(dt,x,y,self.鼠标)--,{1,100} or self.物品[n].物品.名称=="乾坤袋" )
			if self.物品[n].物品~=nil then
			--print(self.物品[n].物品.总类,self.物品[n].物品.使用,self.物品[n].物品.名称)
			 end
			if self.物品[n].物品~=nil and self.物品[n].物品.名称=="乾坤袋"  then

              self.物品[n]:显示(dt,x,y,self.鼠标)
            elseif self.物品[n].物品~=nil and   self.物品[n].物品.总类==1000 and self.物品[n].物品.使用==1 then
              self.物品[n]:显示(dt,x,y,self.鼠标)
            elseif self.物品[n].物品~=nil and self.物品[n].物品.总类==2000 then
             	self.物品[n]:显示(dt,x,y,self.鼠标)
            else
            	 self.物品[n]:显示(dt,x,y,self.鼠标,{1,100})

				end
			if self.物品[n].物品 ~= nil and self.物品[n].物品.总类 == 100   then
				if tp.场景.战斗.战斗方式 ~= self.物品[n].物品.分类  then
					--tp.物品格子禁止_:显示(self.物品[n].x + 5,self.物品[n].y + 6)
				c = true
				end
			end
			if self.物品[n].物品 ~= nil and self.物品[n].焦点 and self.鼠标 then
				tp.提示:道具行囊(x,y,self.物品[n].物品)
				if 引擎.鼠标弹起(左键) and self:取可用道具(self.物品[n].物品.名称,self.物品[n].物品,self.物品[n].物品.总类)~=0 and self.鼠标 then
				 if 1==2 then


                   else
                   	 战斗类.战斗指令:设置道具参数(n,self:取可用道具(self.物品[n].物品.名称,self.物品[n].物品,self.物品[n].物品.总类))

				 	 end



					--[[tp.场景.战斗.窗口.指令栏.物品对象 = 0
					if self.物品[n].物品.总类 == 100 then
						if self.物品[n].物品.名称 == "打狗棒" then
							tp.场景.战斗.窗口.指令栏.物品对象 = 1
						end
					end
					tp.场景.战斗.窗口.指令栏.指令 = 5
					tp.场景.战斗.窗口.指令栏.物品 = self.物品[n].物品
					tp.场景.战斗.提示 = self.物品[n].物品.名称
					tp.场景.战斗.窗口.指令栏.格子 = n
					tp.道具列表[n].数量 = tp.道具列表[n].数量 - 1
					if tp.道具列表[n].数量 <= 0 then
						tp.道具列表[n] = nil
					end
					刷新道具逻辑(tp.道具列表[n],n,true)
					self.可视 = false --]]
				end
			end
		end
	end
	if tp.按钮焦点 then
		self.焦点 = true
	end
	if 引擎.鼠标弹起(1)  and not tp.禁止关闭 and self.鼠标 then
		self:打开()
	end
end

function 场景类_战斗道具栏:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
	return false
end

function 场景类_战斗道具栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not 引擎.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.场景.战斗.移动窗口 = true
	end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_战斗道具栏:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_战斗道具栏