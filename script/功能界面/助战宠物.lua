
local 场景类_助战宠物 = class()
local bw = require("gge包围盒")(0,0,140,34)
local box = 引擎.画矩形
local format = string.format
local floor = math.floor
local min = math.min
local max = math.max
local tp,zts,zts1,zts2,ztstt3
local ceil = math.ceil
local keyaz = 引擎.按键按住
local tostring = tostring
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local insert = table.insert

function 场景类_助战宠物:初始化(根)
	self.ID = 9000
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "助战宠物"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	tp = 根
	self.资源组 = {
		[0] = 自适应.创建(1,1,130,18,1,3,nil,18),
		[1] = 自适应.创建(0,1,160,285,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),--上滚动
		[4] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下滚动
		[5] = 按钮.创建(自适应.创建(12,4,57,22,1,3),0,0,4,true,true,"参 战"),
		[6] = 按钮.创建(自适应.创建(12,4,57,22,1,3),0,0,4,true,true,"休 息"),
		[7] = 自适应.创建(2,1,145,225,3,9),--召唤兽选择框
	}
	for i=3,6 do
		self.资源组[i]:绑定窗口_(9000)
	end
	self.选中 = 0
	self.加入 = 0
	zts = tp.字体表.普通字体
end

function 场景类_助战宠物:打开(数据,助战编号,助战名称)
	if self.可视 then
		self.选中 = 0
		self.加入 = 0
		self.可视 = false
		return
	else
		self.选中 = 0
		self.加入 = 0
		self.数据 = 数据
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.助战编号=助战编号
	end
end

function 场景类_助战宠物:刷新(数据)
	self.数据 = 数据

end

function 场景类_助战宠物:显示(dt,x,y)
	self.助战编号 = tp.窗口.助战界面.选中
	self.资源组[3]:更新(x,y,self.加入 ~= 0)
	self.资源组[4]:更新(x,y,self.数据[5+self.加入+1] ~= nil)

	if self.资源组[3]:事件判断() and self.加入 ~= 0 then
		self.加入 = self.加入-1
	elseif self.资源组[4]:事件判断() then
		self.加入 = self.加入+1
	elseif self.资源组[5]:事件判断() then
		发送数据(87.2,{宠物编号=self.选中,助战编号=self.助战编号})
	elseif self.资源组[6]:事件判断() then
		发送数据(87.1,{宠物编号=self.选中,助战编号=self.助战编号})
	end
	self.资源组[1]:显示(self.x,self.y)
	if 暖风界面==false then
	self.资源组[0]:显示(self.x+6,self.y+3)
    end
	self.资源组[7]:显示(self.x+5,self.y+25)
	self.资源组[3]:显示(self.x+130,self.y+25)
	self.资源组[4]:显示(self.x+130,self.y+230)

	if self.选中 ~= 0 then
		if self.数据[self.选中].参战信息 == nil then
			if self.数据[self.选中].助战参战~=nil and self.数据[self.选中].助战参战 == self.助战编号 then
				self.资源组[6]:更新(x,y,self.选中~= 0)
				self.资源组[6]:显示(self.x+55,self.y+255)
			else
				self.资源组[5]:更新(x,y,self.选中~= 0)
				self.资源组[5]:显示(self.x+55,self.y+255)
			end
		end
	end

	for i=1,5 do
		if self.数据[i+self.加入] ~= nil then
			local jx = self.x+18
			local jy = self.y+(i*43)-16
			bw:置坐标(jx,jy+1)
			local xz = bw:检查点(x,y)
			if self.选中 ~= i+self.加入 then
				if xz and not tp.消息栏焦点 and self.鼠标 then
					if mouseb(0) then
						self.选中 = i+self.加入
					end
					self.焦点 = true
				end
			else
			   if  xz and not tp.消息栏焦点 and self.鼠标 then
					self.焦点 = true
				end
				box(jx-6,jy-3,jx+110,jy+41,-10790181)
			end
			if self.数据[i+self.加入].参战信息 ~= nil then
				zts:置颜色(0xFFFF0000)
			else
				zts:置颜色(-16777216)
			end
			if tp.助战列表[self.助战编号].宠物认证码 ~= nil and tp.助战列表[self.助战编号].宠物认证码 == self.数据[i+self.加入].认证码 then
				zts:置颜色(0xFFFFFF00)
			else
				if self.数据[i+self.加入].助战参战~=nil then
					zts:置颜色(0xFF800040)
				end
			end
			zts:显示(jx+10,jy+8,self.数据[i+self.加入].名称)
			zts:显示(jx+10,jy+26,self.数据[i+self.加入].等级.."级")
			--zts:显示(jx+60,jy+17,self.助战编号)
		end
	end
end

function 场景类_助战宠物:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_助战宠物:初始移动(x,y)
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

function 场景类_助战宠物:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_助战宠物