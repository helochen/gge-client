--======================================================================--
-- @作者: GGE研究群：688742892
-- @创建时间:   2020-04-01 08:30:00
-- @Last Modified time: 2021-04-07 10:13:34
-- @特别声明：本版由优秀跟鱼总合力优化与修复漏洞，添加了各种功能。
--======================================================================--
local 系统类_物品格子 = class()
local zt
local mouse = 引擎.鼠标弹起
local wps = 引擎.取物品
function 系统类_物品格子:初始化(x,y,ID,注释,遮挡)
	self.ID = ID
	self.注释 = 注释
	self.物品 = nil
	self.事件 = false
	self.焦点 = false
	self.右键 = false
	self.遮挡 = 遮挡
	self.确定 = false
end

function 系统类_物品格子:置根(根)
	引擎.场景 = 根
	zt = 引擎.场景.字体表.描边字体
end

function 系统类_物品格子:置物品(物品)
	self.选中=nil
	if 物品 ~= nil then
		self.名称=物品.名称
		if 物品.名称 ~= 0 then
			--self.物品 = 物品
			 local item = 引擎.场景._物品.创建()
			  item:置对象(物品.名称)
			  self.物品= item
			 -- print(物品.名称)
			  for n, v in pairs(物品) do
                --  print(n,v)
                  self.物品[n]=v

			  	 end
             local 物品类型="网易WDF动画"
		end
	else
		self.物品 = nil
	end
 if self.物品~=nil then
     if self.物品.回合~=nil then
          self:置灰色()
     	 end
 	 end
end
function 系统类_物品格子:置灰色()
 if self.物品~=nil and self.物品.小模型~=nil then
     self.物品.小模型:灰度级()
 	 end
 end
function 系统类_物品格子:显示(dt,x,y,条件,总类,xx,yy,abs)
	if self.确定 or self.选中 then
		引擎.场景.物品格子确定_:显示(self.x+1,self.y+2)
	end
	self.事件 = false
	self.焦点 = false
	self.右键 = false
	if self.物品 ~= nil then
		if self.遮挡 ~= nil then
			self.遮挡:显示(self.x-1+(xx or 0),self.y+4+(yy or 0))
		end
		if self.物品.回合~=nil then
		 local 数量=string.len(tostring(self.物品.回合))
         for i=1,数量 do
         	 local 序列=string.sub(self.物品.回合,i,i)-1
         	 if 战斗类.法宝图片[序列]~=nil then
                   战斗类.法宝图片[序列]:显示(self.x-数量*2-数量*1.5+20,self.y+20)
         	 	 end
         	 end
		 end
		 if not self.物品.可叠加 and 总类 == nil then

			--zt:显示(self.x + 0,self.y + 37,self.物品.级别限制)
            zts1:置颜色(0xFFFFFF00)

			zts1:显示(self.x -2 ,self.y + 33,self.物品.附带技能)

			end
		if ((总类 and 总类 ~= false) and self.物品.总类 ~= 总类[1] and self.物品.总类 ~= 总类[2] and (总类[3]==nil or 总类[3]==false)) then
			引擎.场景.物品格子禁止_:显示(self.x + 5,self.y + 6)
		end
	end
	if not 引擎.场景.消息栏焦点 then
		if x>=self.x and x<=self.x+50 and y>=self.y and y<=self.y+50 and 条件 then
			引擎.场景.按钮焦点 = true
			引擎.场景.禁止关闭 = true
			if mouse(0) then
				self.事件 = true
			elseif mouse(1) then
				self.右键 = true
			end
			if self.格子显示 == nil then
				if self.物品 and self.物品.大模型 == nil then
					self.物品.大模型 = 引擎.场景.资源:载入(self.物品.资源,"网易WDF动画",self.物品.大模型资源)
				end
				-- if abs == nil then
				-- 	引擎.场景.物品格子焦点_:显示(self.x+1,self.y+1)
				-- end
			end
			self.焦点 = true
		end
	end
end

function 系统类_物品格子:置坐标(x,y)

 if self.名称=="" then
       x=x+25
       y=y+25

     end
	self.x,self.y = x,y
end

return 系统类_物品格子