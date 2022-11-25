--======================================================================--

--======================================================================--
local 场景类_武器染色 = class()
local floor = math.floor
local tp,zts,zts1,方向
local format = string.format
local insert = table.insert

function 场景类_武器染色:初始化(根)
	self.ID = 35
	self.x = 130
	self.y = 95
	self.xx = 0
	self.yy = 0
	self.注释 = " 武 器 染 色"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
	self.选中染色=0
	self.原来颜色=0
	self.染色组1=0
	self.染色组2=0
	zts = 根.字体表.普通字体
	zts1 = 根.字体表.描边字体
	方向 = 7
end

function 场景类_武器染色:打开()
	if tp.队伍[1]~=nil and self.可视 then  self.可视=false return end
	if self.可视 then
		if tp.队伍[1] ~= nil then
			self:置形象(方向)
			tp.运行时间 = tp.运行时间 + 1
		    self.窗口时间 = tp.运行时间
		    return false
		end
		self.可视 = false
		self.资源组=nil
		self.染色组=nil
		return
	else
		insert(tp.窗口_,self)
		self:加载数据()
		self:置形象(方向)
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    if tp.队伍[1].装备[3] and tp.队伍[1].装备[3].染色方案~=nil then
	        self.原来颜色=tp.队伍[1].装备[3].染色方案
	    	self.染色组1=tp.队伍[1].装备[3].染色组[1]
	    	self.染色组2=tp.队伍[1].装备[3].染色组[2]
	    end
	    self.可视 = true
	end
end

function 场景类_武器染色:加载数据()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 资源:载入('wzife.wd5',"网易WDF动画",0x01000024),
		[2] = 按钮.创建(tp.资源:载入('wzife.wd5',"网易WDF动画",0x01000025),0,0,4,true,true),
		[3] = 资源:载入(tp.头像背景,"网易WDF动画",0x5B52CB27),
		[4] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"还原"),
		[5] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"染色"),
		[8] = 自适应.创建(1,1,420,18,1,3,nil,18),
		[9] = 按钮.创建(tp.资源:载入('wzife.wd5',"网易WDF动画",0x01000026),0,0,4,true,true),
	}
	self.染色组={}
	for n=1,80 do
		self.染色组[n]=按钮.创建(自适应.创建(10,4,28,20,1,3),0,0,4,true,true,n)
	end
end

function 场景类_武器染色:置形象(方向)
	if tp.队伍[1].装备[3]~=nil then
	    self.资源组[6] = nil
		self.资源组[7] = nil
		local m = tp:取武器附加名称(tp.队伍[1].装备[3].子类,tp.队伍[1].装备[3].级别限制,tp.队伍[1].装备[3].名称)
		local n = 引擎.取模型(m.."_"..tp.队伍[1].模型)
		local k = 引擎.取模型(tp.队伍[1].模型)
		self.资源组[7] = tp.资源:载入(k[3],"网易WDF动画",k[1])
		self.资源组[7]:置染色(tp.队伍[1].染色方案,tp.队伍[1].染色组[1],tp.队伍[1].染色组[2],tp.队伍[1].染色组[3])
		self.资源组[7]:置方向(方向)
		if tp.队伍[1].装备[3].染色方案 ~= nil then
			if tp.队伍[1].装备[3].染色方案 == "黑白" then
				self.资源组[6] = tp.资源:载入(n[3],"网易WDF动画",n[1])
				self.资源组[6]:置染色(tp.队伍[1].装备[3].染色方案,tp.队伍[1].装备[3].染色组[1],tp.队伍[1].装备[3].染色组[2],tp.队伍[1].装备[3].染色组[3])
				-- self.资源组[6]["武器_行走"] = tp.资源:载入(n[3],"网易WDF动画",n[2])
				self.资源组[6]:置方向(方向)

			else
				if self.选中染色~=0 then
				    tp.队伍[1].装备[3].染色方案=染色方案[self.选中染色].id
				    tp.队伍[1].装备[3].染色组[1]=染色方案[self.选中染色].方案[1]
				    tp.队伍[1].装备[3].染色组[2]=染色方案[self.选中染色].方案[2]
				    self.资源组[6] = tp.资源:载入(n[3],"网易WDF动画",n[1])
				    self.资源组[6]:置染色(tp.队伍[1].装备[3].染色方案,tp.队伍[1].装备[3].染色组[1],tp.队伍[1].装备[3].染色组[2],tp.队伍[1].装备[3].染色组[3])
					self.资源组[6]:置方向(方向)
				else
					tp.队伍[1].装备[3].染色方案=self.原来颜色
					tp.队伍[1].装备[3].染色组[1]=tp.队伍[1].装备[3].染色组1
					tp.队伍[1].装备[3].染色组[2]=tp.队伍[1].装备[3].染色组2
					self.资源组[6] = tp.资源:载入(n[3],"网易WDF动画",n[1])
					self.资源组[6]:置染色(tp.队伍[1].装备[3].染色方案,tp.队伍[1].装备[3].染色组[1],tp.队伍[1].装备[3].染色组[2],tp.队伍[1].装备[3].染色组[3])
					self.资源组[6]:置方向(方向)
				end
			end
		else
			if tp.队伍[1].装备[3].染色方案==nil then
				tp.队伍[1].装备[3].染色组={}
			    tp.队伍[1].装备[3].染色方案=0
			 	tp.队伍[1].装备[3].染色组[1]=0
			 	tp.队伍[1].装备[3].染色组[2]=0
			end
			 tp.队伍[1].装备[3].染色方案=0
			 tp.队伍[1].装备[3].染色组[1]=0
			 tp.队伍[1].装备[3].染色组[2]=0
			if self.选中染色~=0 then
			    tp.队伍[1].装备[3].染色方案=染色方案[self.选中染色].id
			    tp.队伍[1].装备[3].染色组[1]=染色方案[self.选中染色].方案[1]
			    tp.队伍[1].装备[3].染色组[2]=染色方案[self.选中染色].方案[2]
			    self.资源组[6] = tp.资源:载入(n[3],"网易WDF动画",n[1])
			    self.资源组[6]:置染色(tp.队伍[1].装备[3].染色方案,tp.队伍[1].装备[3].染色组[1],tp.队伍[1].装备[3].染色组[2],tp.队伍[1].装备[3].染色组[3])
			    self.资源组[6]:置方向(方向)
			end
		end
	end
end

function 场景类_武器染色:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[9]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[4]:显示(self.x + 120,self.y + 300)
	self.资源组[5]:显示(self.x + 185,self.y + 300)
	zts1:显示(self.x+245,self.y+3,self.注释)
	zts1:显示(self.x+90,self.y+370,"选中颜色为："..self.选中染色)
	self.资源组[2]:显示(self.x + 557,self.y )
	self.资源组[9]:显示(self.x + 110,self.y +250)
	local xx = 0
	local xx = 0
	local yy = 0
	for n=1,80 do
		self.染色组[n]:更新(x,y,self.选中染色~=n)
		self.染色组[n]:显示(self.x+300+32*xx,self.y+85+yy*25)
		xx = xx + 1
		if xx > 7 then
			xx = 0
			yy = yy + 1
		end
		if self.鼠标 then
		    if self.染色组[n]:事件判断() then
		    	self.选中染色=n
		    	self:置形象(方向)
		    end
		end
	end
	if self.鼠标 then
		if self.资源组[2]:事件判断() then
			self:打开()
			return false
		elseif self.资源组[4]:事件判断() then
			self.选中染色=0
			self:置形象(方向)
		elseif self.资源组[5]:事件判断() then
			if tp.队伍[1].装备[3]==nil or tp.队伍[1].装备[3]==0 then
			    tp.提示:写入("#y/你要染色的武器呢？")
			    return
			end
			if tp.队伍[1].装备[3].染色方案==nil then
				tp.队伍[1].装备[3].染色组={}
			    tp.队伍[1].装备[3].染色方案=0
			 	tp.队伍[1].装备[3].染色组[1]=0
			 	tp.队伍[1].装备[3].染色组[2]=0
			end
			 tp.队伍[1].装备[3].染色方案=0
			 tp.队伍[1].装备[3].染色组[1]=0
			 tp.队伍[1].装备[3].染色组[2]=0
			if self.选中染色~=0 then
			    tp.队伍[1].装备[3].染色方案=染色方案[self.选中染色].id
			    tp.队伍[1].装备[3].染色组[1]=染色方案[self.选中染色].方案[1]
			    tp.队伍[1].装备[3].染色组[2]=染色方案[self.选中染色].方案[2]
			 --    self.资源组[6]:置染色(tp.队伍[1].装备[3].染色方案,tp.队伍[1].装备[3].染色组[1],tp.队伍[1].装备[3].染色组[2],tp.队伍[1].装备[3].染色组[3])
				-- self.资源组[6]:置方向(方向)
			end
			发送数据(3745,{序列=tp.队伍[1].装备[3].染色方案,序列1=tp.队伍[1].装备[3].染色组[1],序列2=tp.队伍[1].装备[3].染色组[2],序列3=tp.队伍[1].装备[3].染色组[3]})
		elseif self.资源组[9]:事件判断() then
			方向 = 方向 - 1
			if 方向<0 then
			    方向=7
			end
			self:置形象(方向)
		end
	end
	if self.资源组[7] ~= nil then
		self.资源组[7]:更新(dt)
		self.资源组[7]:显示(self.x + 175,self.y+240)
	end
	if self.资源组[6] ~= nil then
		tp.影子:显示(self.x + 175,self.y+240)
		self.资源组[6]:更新(dt)
		self.资源组[6]:显示(self.x + 175,self.y+240)
	end
	local 字体 = tp.字体表.普通字体
	字体:置颜色(黑色)
	-- 字体:显示(self.x + 25,self.y + 38,bb.模型)


end

function 场景类_武器染色:检查点(x,y)
	if self.资源组~=nil and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_武器染色:初始移动(x,y)
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

function 场景类_武器染色:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_武器染色