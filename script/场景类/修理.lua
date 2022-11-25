--======================================================================--
local 场景类_打造 = class()
local floor = math.floor
local insert = table.insert
local random = 引擎.取随机整数
local mouseb = 引擎.鼠标弹起
local zts,tp
local remove = table.remove
local qjq = 引擎.取金钱颜色
local sts = {"所需资金：","现有资金：","所需体力：","现有体力："}
function 场景类_打造:初始化(根)
	self.ID = 18
	self.x = 234
	self.y = 156
	self.xx = 0
	self.yy = 0
	self.注释 = "制造"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.开始 = 1
	self.结束 = 20
	self.总价 = 0
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	self.体力消耗=0
	self.分类="打造"
end

function 场景类_打造:打开(ss)
	if self.可视 then
		self.随身 = nil
		self.开始 = 1
		self.结束 = 20
		self.可视 = false
		self.资源组=nil
		self.物品=nil
		self.材料=nil
		return
	else
		insert(tp.窗口_,self)
		self:加载数据()
		self.刷新数据=ss
		--self.随身 = ss
		self.分类="打造"
		self.开始 = 1
		self.结束 = 20
		for i=self.开始,self.结束 do
			self.物品[i]:置物品(ss[i])
		end
		for i=1,3 do
			self.材料[i]:置物品(nil)
		end
	    tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.消耗体力=0
	    zj=0
	end
end
function 场景类_打造:加载数据()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,458,328,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"打造"),
		[4] = 按钮.创建(自适应.创建(22,4,27,20,4,3),0,0,4,true,true),
		[5] = 按钮.创建(自适应.创建(23,4,27,20,4,3),0,0,4,true,true),
		[6] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"镶嵌"),
		[7] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取消"),
		[8] = 自适应.创建(1,1,422,18,1,3,nil,18),
		[9] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"打造"),
		[10] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"镶嵌"),
		[11] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"合成"),
		[12] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"修理"),
		[13] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"熔炼"),
		[14] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"熔合"),
		[15] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"转换"),
		[16] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"合成"),
		[17] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"修理"),
		[18] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"熔炼"),
		[19] = 自适应.创建(3,1,94,19,1,3),
		[20] = 资源:载入('wzife.wd1',"网易WDF动画",0xB17505CF),
		[21] = 资源:载入('wzife.wd1',"网易WDF动画",0xB17505CF),
		[22] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"熔合"),
		[23] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"转换"),
	}
	local 格子 = tp._物品格子
	self.物品 = {}
	for i=1,20 do
		self.物品[i] = 格子(0,0,i1,"打造")
	end
	for n=2,6 do
		self.资源组[n]:绑定窗口_(18)
	end
	self.材料 = {}
	self.材料[1] = 格子(self.x+4,self.y,1,"打造材料")
	self.材料[2] = 格子(self.x+4,self.y,2,"打造材料")
	self.材料[3] = 格子(self.x+4,self.y,2,"打造材料")
end
function 场景类_打造:刷新道具(ss)
    self.开始 = 1
	self.结束 = 20
	for i=self.开始,self.结束 do
		self.物品[i]:置物品(ss[i])
	end
	for i=1,3 do
		self.材料[i]:置物品(nil)
	end
 	self.消耗体力=0
 	zj=0
end

function 场景类_打造:内部刷新道具(ss)
    self.开始 = 1
	self.结束 = 20
	for i=self.开始,self.结束 do
		self.物品[i]:置物品(ss[i])
	end
	for i=1,3 do
		if self.材料[i].物品 ~= nil then
			self.物品[self.材料[i].道具序列]:置物品(self.材料[i].物品)
			tp.道具列表[self.材料[i].道具序列] = self.材料[i].物品
		end
		self.材料[i]:置物品(nil)
	end
 	self.消耗体力=0
 	zj=0
end

function 场景类_打造:取消耗体力()
  	if self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil then
      	if self.材料[1].物品.总类==5 and self.材料[2].物品.总类==5 and self.材料[2].物品.名称==self.材料[1].物品.名称 then
           return self.材料[1].物品.级别限制*10
        end
  	end
 	return 0
end

function 场景类_打造:打造金钱公式(a)
	if self.分类 == "熔合" then
		if a<=120 then return 0 end
		if a<160 then
			return 10000000
		else
		    return 30000000
		end
	elseif self.分类 == "修理" then
		if self.材料[1] ~= nil and self.材料[1].物品 ~= nil then
			a = self.材料[1].物品.级别限制
			return floor(a/500*15000*300)
		end
		return floor(a/500*15000*300)
	else
	    if a<=7 then return 0 end
		if a <= 40 then
			return floor((a*4500+2000))
		elseif a > 40 and a <= 90 then
			return floor(((a-50)*45000+300000))
		elseif a >= 100 then
			return floor(((a-100)*450000+3000000))
		end
	end
end

function 场景类_打造:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[7]:更新(x,y)
	self.资源组[9]:更新(x,y,self.分类~="打造")
	self.资源组[10]:更新(x,y,self.分类~="镶嵌")
	self.资源组[11]:更新(x,y,self.分类~="合成")
	self.资源组[12]:更新(x,y,self.分类~="修理")
	self.资源组[13]:更新(x,y,self.分类~="熔炼")
	self.资源组[14]:更新(x,y,self.分类~="熔合")
	self.资源组[15]:更新(x,y,self.分类~="转换")

	self.资源组[3]:更新(x,y,self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil)
	self.资源组[4]:更新(x,y,self.开始 ~= 1)
	self.资源组[5]:更新(x,y,self.结束 ~= 160)
	self.资源组[6]:更新(x,y,self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil)
	self.资源组[16]:更新(x,y,self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil)
	self.资源组[17]:更新(x,y,self.材料[1].物品 ~= nil)
	self.资源组[18]:更新(x,y,self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil)
	self.资源组[22]:更新(x,y,self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil)
	self.资源组[23]:更新(x,y,self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil)
	if self.鼠标 then
    	if self.资源组[2]:事件判断() or self.资源组[7]:事件判断() then
        	self:打开()
        	return
        elseif self.资源组[9]:事件判断() then
			self.分类="打造"
			self:内部刷新道具(tp.道具列表)
		elseif self.资源组[10]:事件判断() then
			self.分类="镶嵌"
			self:内部刷新道具(tp.道具列表)
		elseif self.资源组[11]:事件判断() then
			self.分类="合成"
			self:内部刷新道具(tp.道具列表)
		elseif self.资源组[12]:事件判断() then
			self.分类="修理"
			self:内部刷新道具(tp.道具列表)
		elseif self.资源组[13]:事件判断() then
			self.分类="熔炼"
			self:内部刷新道具(tp.道具列表)
		elseif self.资源组[14]:事件判断() then
		 	self.分类="熔合"
			self:内部刷新道具(tp.道具列表)
		elseif self.资源组[15]:事件判断() then
			 self.分类="转换"
			 self:内部刷新道具(tp.道具列表)
		elseif self.资源组[3]:事件判断() and self.分类=="打造" then
         	if self.材料[1].物品 ~= nil and self.材料[2].物品~=nil then
              	发送数据(4501,{序列=self.材料[1].道具序列,序列1=self.材料[2].道具序列})
          	end
        elseif self.资源组[6]:事件判断() and self.分类=="镶嵌" then
        	if self.材料[1].物品 ~= nil and self.材料[2].物品~=nil then
              	发送数据(4503,{序列=self.材料[1].道具序列,序列1=self.材料[2].道具序列})
          	end
        elseif self.资源组[16]:事件判断() and self.分类=="合成" then
        	if self.材料[1].物品 ~= nil and self.材料[2].物品~=nil then
              	发送数据(4504,{序列=self.材料[1].道具序列,序列1=self.材料[2].道具序列})
          	end
        elseif self.资源组[17]:事件判断() and self.分类=="修理" then
        	if self.材料[1].物品 ~= nil then
              	发送数据(4505,{序列=self.材料[1].道具序列,序列1=self.材料[2].道具序列})
          	end
        elseif self.资源组[18]:事件判断() and self.分类=="熔炼" then
        	if self.材料[1].物品 ~= nil and self.材料[2].物品~=nil then
              	发送数据(4506,{序列=self.材料[1].道具序列,序列1=self.材料[2].道具序列})
          	end
         elseif self.资源组[23]:事件判断() and self.分类=="转换" then
            发送数据(4521,{序列=self.材料[1].道具序列,序列1=self.材料[2].道具序列})
        elseif self.资源组[22]:事件判断() and self.分类=="熔合" then
        	if self.材料[1].物品 ~= nil and self.材料[2].物品~=nil then
              	发送数据(4508,{序列=self.材料[1].道具序列,序列1=self.材料[2].道具序列,序列2=self.材料[3].道具序列})
          	end
        end
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x + 269+165,self.y + 6,true)
	for i=1,7 do
		self.资源组[8+i]:显示(self.x+15+(i-1)*62,self.y+35)
	end
	tp.物品界面背景_:显示(self.x+193,self.y+102)
	self.资源组[8]:显示(self.x+8,self.y+5)
	tp.窗口标题背景_:置区域(0,0,70,16)
	tp.窗口标题背景_:显示(self.x+188,self.y+5)
	zts:显示(self.x+194,self.y+5," 制  造 ")
    zts:置颜色(白色)
	for i=0,3 do
		self.资源组[19]:显示(self.x+85,self.y+185+i*24)
		zts:显示(self.x+15,self.y+188+i*24,sts[i+1])
	end
	self.资源组[19]:显示(self.x+55,self.y+75)
	zts:显示(self.x+190,self.y+72,"所需材料：")
	if self.分类=="打造" then
	    --self.资源组[3]:显示(self.x + 32,self.y + 290,true)
	    zts:置颜色(-16777216)
	    zts:显示(self.x+64,self.y+78,"装 备 打 造")
	    zts:置颜色(白色)
	    zts:显示(self.x+255,self.y+72,"书铁、炼妖石、元身等")
	elseif self.分类=="镶嵌" then
		self.资源组[6]:显示(self.x + 32,self.y + 290,true)
		zts:置颜色(-16777216)
		zts:显示(self.x+64,self.y+78,"宝 石 镶 嵌")
		zts:置颜色(白色)
		zts:显示(self.x+255,self.y+72,"装备、宝石")
	elseif self.分类=="合成" then
		self.资源组[16]:显示(self.x + 32,self.y + 290,true)
		zts:置颜色(-16777216)
		zts:显示(self.x+64,self.y+78,"宝 石 合 成")
		zts:置颜色(白色)
		zts:显示(self.x+255,self.y+72,"宝石")
	elseif self.分类=="修理" then
		self.资源组[17]:显示(self.x + 32,self.y + 290,true)
		zts:置颜色(-16777216)
		zts:显示(self.x+64,self.y+78,"装 备 修 理")
		zts:置颜色(黄色)
		zts:显示(self.x+255,self.y+72,"需修理的装备")
	elseif self.分类=="熔炼" then
		self.资源组[18]:显示(self.x + 32,self.y + 290,true)
		zts:置颜色(-16777216)
		zts:显示(self.x+64,self.y+78,"装 备 熔 炼")
		zts:置颜色(白色)
		zts:显示(self.x+255,self.y+72,"人物装备、钨金")
	elseif self.分类=="熔合" then
		self.资源组[22]:显示(self.x + 32,self.y + 290,true)
		zts:置颜色(-16777216)
		zts:显示(self.x+64,self.y+78,"装 备 熔 合")
		zts:置颜色(白色)
		zts:显示(self.x+255,self.y+72,"120级以上2件同部位装备！")
	elseif self.分类=="转换" then
	 	self.资源组[23]:显示(self.x + 32,self.y + 290,true)
	 	zts:置颜色(-16777216)
	 	zts:显示(self.x+64,self.y+78,"武 器 转 换")
	 	zts:置颜色(红色)
	 	zts:显示(self.x+255,self.y+72,"放入两件的武器，转换造型")
	end
	self.资源组[7]:显示(self.x + 110,self.y + 290,true)
	local is = self.开始 - 1
	for h=1,4 do
		for l=1,5 do
			is = is + 1
			self.物品[is]:置坐标(l * 51 - 32 + self.x + 176,h * 51 + self.y + 102-51)
		   if self.物品[is].物品~=nil then
			self.物品[is]:显示(dt,x,y,self.鼠标,{5,2,(self.物品[is].物品.总类 == 3 and (self.物品[is].物品.分类 == 10 or self.物品[is].物品.分类 == 11)) or self.物品[is].物品.名称=="钨金"})
			 end
			if self.物品[is].物品 ~= nil and self.物品[is].焦点 then
				tp.提示:道具行囊(x,y,self.物品[is].物品)
				if self.物品[is].事件 and ((self.物品[is].物品.总类 == 3 and (self.物品[is].物品.分类 == 10 or self.物品[is].物品.分类 == 11)) or (self.物品[is].物品.总类 == 5 and self.物品[is].物品.分类 ~= 3) or self.物品[is].物品.总类 == 2 or self.物品[is].物品.名称=="钨金" )  and self.鼠标 then
					local zl = self.物品[is].物品.子类
					if self.物品[is].物品.总类 == 5 and self.物品[is].物品.分类 == 4 then
						zl = nil
					end
					if self.物品[is].物品.总类 == 2 then
						zl = self.物品[is].物品.级别限制
					end
					if self.材料[1].物品 == nil and self.材料[2].物品 == nil then
						self.材料[1]:置物品(self.物品[is].物品)
						self.材料[1].道具序列=is
						if zl ~= nil then
							self.总价 = self:打造金钱公式(zl)
						end
						self.物品[is]:置物品(nil)
					elseif self.材料[1].物品 ~= nil and self.材料[2].物品 == nil then
						self.材料[2]:置物品(self.物品[is].物品)
						self.材料[2].道具序列=is
						if zl ~= nil then
							self.总价 = self:打造金钱公式(zl)
						end
						self.物品[is]:置物品(nil)
					elseif self.材料[1].物品 == nil and self.材料[2].物品 ~= nil then
						self.材料[1]:置物品(self.物品[is].物品)
						self.材料[1].道具序列=is
						if zl ~= nil then
							self.总价 = self:打造金钱公式(zl)
						end
						self.物品[is]:置物品(nil)
					elseif self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil then
						if self.分类 == "熔合" then
							if self.物品[is].物品.名称 == "融合石" then
								self.材料[3]:置物品(self.物品[is].物品)
								self.材料[3].道具序列=is
								self.物品[is]:置物品(nil)
							else
							    tp.提示:写入("#Y/只能使用融合石进行保护！")
							end
						elseif self.分类 == "熔炼" then
							if self.物品[is].物品.名称 == "钨金" then
								self.材料[3]:置物品(self.物品[is].物品)
								self.材料[3].道具序列=is
								self.物品[is]:置物品(nil)
							else
							    tp.提示:写入("#Y/只能使用钨金熔炼！")
							end
						else
							if self.材料[1].物品.分类 == self.物品[is].物品.分类 and self.材料[1].物品.子类 == self.物品[is].物品.子类 then
								local cl1 = self.材料[1].物品
								self.材料[1]:置物品(self.物品[is].物品)
								self.材料[1].道具序列=is
								if zl ~= nil then
									self.总价 = self:打造金钱公式(zl)
									self.消耗体力=self:取消耗体力()
								end
								self.物品[is]:置物品(cl1)
							end
							if self.材料[2].物品.分类 == self.物品[is].物品.分类 and self.材料[2].物品.子类 == self.物品[is].物品.子类 then
								local cl2 = self.材料[2].物品
								self.材料[2]:置物品(self.物品[is].物品)
								self.材料[2].道具序列=is
								if zl ~= nil then
															print(zl)
									self.总价 = self:打造金钱公式(zl)
									self.消耗体力=self:取消耗体力()
								end
								self.物品[is]:置物品(cl2)
							end
						end
					end
					刷新道具逻辑(self.物品[is].物品,is,true)
				end
			end
			if self.物品[is].焦点 then
				self.焦点 = true
			end
		end
	end
	if self.分类 == "熔合" then
		self.资源组[20]:显示(self.x + 11,self.y + 108)
		self.资源组[21]:显示(self.x + 73,self.y + 108)
		self.资源组[21]:显示(self.x + 135,self.y + 108)
		for ns=1,3 do
			self.材料[ns]:置坐标(self.x-46 + (ns * 61),self.y+108)
			self.材料[ns]:显示(dt,x,y,self.鼠标,false)
			if self.材料[ns].物品 ~= nil and self.材料[ns].焦点 then
				tp.提示:道具行囊(x,y,self.材料[ns].物品)
				if mouseb(0) and self.鼠标 then
					if 取物品数量() < 160 then
						增加物品(self.材料[ns].物品)
						if ns == 1 then
							self.材料1总价 = 0
						else
							self.材料2总价 = 0
						end
						self.材料[ns]:置物品(nil)
					else
						tp.提示:写入("#Y/包裹已满。请及时清理")
					end
					break
				end
			end
			if self.材料[ns].焦点 then
				self.焦点 = true
			end
		end
	else
		self.资源组[20]:显示(self.x + 35,self.y + 108)
		self.资源组[21]:显示(self.x + 115,self.y + 108)
		for ns=1,2 do
			self.材料[ns]:置坐标(self.x-45 + (ns * 82),self.y+108)
			self.材料[ns]:显示(dt,x,y,self.鼠标,false)
			if self.材料[ns].物品 ~= nil and self.材料[ns].焦点 then
				tp.提示:道具行囊(x,y,self.材料[ns].物品)
				if mouseb(0) and self.鼠标 then
					if 取物品数量() < 160 then
						增加物品(self.材料[ns].物品)
						if ns == 1 then
							self.材料1总价 = 0
						else
							self.材料2总价 = 0
						end
						self.材料[ns]:置物品(nil)
					else
						tp.提示:写入("#Y/包裹已满。请及时清理")
					end
					break
				end
			end
			if self.材料[ns].焦点 then
				self.焦点 = true
			end
		end
	end
	if self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil or (self.分类 == "修理" and self.材料[1].物品 ~= nil) then
		local zj = self.总价
		zts:置颜色(qjq(zj))
		zts:显示(self.x + 95,self.y + 187,zj)
		zts:置颜色(-16777216)
		zts:显示(self.x + 95,self.y + 236,self.消耗体力)
	end
	zts:置颜色(qjq(tp.金钱))
	zts:显示(self.x + 95,self.y + 212,tp.金钱)
	zts:置颜色(-16777216)
	zts:显示(self.x + 95,self.y + 261,tp.队伍[1].体力)
end

function 场景类_打造:检查点(x,y)
	local n = false
	if self.可视 and self.资源组~=nil and self.资源组[1]:是否选中(x,y)  then
		n  = true
	end
	return n
end

function 场景类_打造:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
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

function 场景类_打造:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end
return 场景类_打造