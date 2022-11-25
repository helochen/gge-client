
local 场景类_开运 = class()
local tp,zts,zts1
local insert = table.insert
local xxx = 0
local yyy = 0
local sts = {"单价","数量","总额","现金"}
local tos = 引擎.取金钱颜色
local mouseb = 引擎.鼠标弹起
function 场景类_开运:初始化(根)
	tp= 根
	self.ID = 59
	self.x = 224
	self.y = 80
	self.xx = 0
	self.yy = 0
	self.注释 = "商店"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
	zts = 根.字体表.普通字体
	zts1 = 根.字体表.描边字体
	self.选中 =0
	self.材料数量 = 0
	self.选中材料= {}
end

function 场景类_开运:打开(数据)
	self.数据 = 数据
	if self.可视 then
		self.可视 = false
		self.选中 =0
		self.材料数量 = 0
		self.开始 = nil
		self.结束 = nil
		self.资源组 = nil
		self.物品 = nil
		self.材料 = nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		local 格子 = tp._物品格子
		self.资源组 = {
			[1] = 资源:载入('wzife.wd1',"网易WDF动画",0xC885F689),
			[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
			[3] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x2BD1DEF7),0,0,4,true,true,"合成"),
		}
		self.物品 = {}
		for i=1,20 do
	        self.物品[i] = 格子.创建(0,0,i,"道具行囊_物品")
	    end
		for n=2,3 do
		   self.资源组[n]:绑定窗口_(59)
		end
		self.材料 = {}
		for i=1,4 do
			self.材料[i]=格子(0,0,i,"符石合成")
		end

		self.材料数量 = 0
	 	self.开始 = 1
		self.结束 = 20
		for q=self.开始,self.结束 do
            self.物品[q]:置物品(self.数据.道具[q])
        end
        for i=1,4 do
			self.材料[i]:置物品(nil)
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_开运:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
    self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,self.材料数量 >= 4)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[3]:事件判断() then
		发送数据(3748,{序列=self.选中材料[1],序列1=self.选中材料[2],序列2=self.选中材料[3],序列3=self.选中材料[4]})
		self.可视 = false
   	end
	self.资源组[2]:显示(self.x+288,self.y+12)
	self.资源组[3]:显示(self.x+190,self.y+152,true,nil,nil,self.材料数量 < 4,3)
    zts:置颜色(引擎.取金钱颜色(self.数据.银子))
    zts:显示(self.x+230,self.y+72,self.数据.银子)
    zts:置颜色(0xFFFFFF00)
    zts:显示(self.x+230,self.y+129,self.数据.体力)
    zts:置颜色(0xFFFFFFFF)
    local is = 0
	for h=1,4 do
		for l=1,5 do
			is = is + 1
			self.物品[is]:置坐标(l * 51 - 14 + self.x,h * 51 + self.y + 131)
            self.物品[is]:显示(dt,x,y,self.鼠标,{55,"符石卷轴"})
			if self.物品[is].物品 ~= nil and self.物品[is].焦点 then
                tp.提示:道具行囊(x,y,self.物品[is].物品)
                	if (self.物品[is].物品.总类 == 55 or self.物品[is].物品.总类 == "符石卷轴") and mouseb(0) and self.鼠标 then
						if self.物品[is].物品.总类 == 55 or self.物品[is].物品.总类 == "符石卷轴" then
							if self.材料数量 < 4 then
								for i=1,4 do
									if self.材料[i].物品 == nil then
										self.选中 =is
				               			self.材料[i]:置物品(self.数据.道具[self.选中])
										self.物品[is]:置物品(nil)
										self.材料数量 = self.材料数量 + 1
										self.选中材料[i]=is
										break
									end
								end
							else
				                tp.提示:写入("#r/放入的物品太多了，不允许再放入了！")
				            end
			            else
			               	tp.提示:写入("#r/只有符石和符石卷轴才能合成！")
			            end
			        end
			end
		end
	end
	is = 0
	for h=1,2 do
		for l=1,2 do
			is = is + 1
			self.材料[is]:置坐标(l * 58 - 23 + self.x,h * 55 + self.y + 8)
			self.材料[is]:显示(dt,x,y,self.鼠标)
            if self.材料[is].物品 ~= nil and self.材料[is].焦点 then
            	tp.提示:道具行囊(x,y,self.材料[is].物品)
				if mouseb(0) and self.鼠标 then
					if 取物品数量() < 20 then
                        -- self.物品[is]:置物品(self.数据.道具[is])
                        tp.窗口.道具行囊.物品[is]:置物品(self.物品[is])
						self.材料数量 = self.材料数量 - 1
						刷新道具逻辑(self.数据.道具[self.选中材料[is]],self.选中材料[is],true)
                        self.材料[is]:置物品(nil)
	                else
	                    tp.提示:写入("#Y/包裹已满。请及时清理")
	                end
				end
		    end
       	end
   	end
	if #self.材料 >= 4 then
		zts:置颜色(引擎.取金钱颜色(500000))
		zts:显示(self.x + 230,self.y + 43,500000)
		zts:置颜色(0xFFFFFF00)
		zts:显示(self.x + 230,self.y + 99,30)
		zts:置颜色(0xFFFFFFFF)
	end
end

function 场景类_开运:检查点(x,y)
    if self.可视 and self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
        return true
    end
end

function 场景类_开运:初始移动(x,y)
    tp.运行时间 = tp.运行时间 + 1
    if not tp.消息栏焦点 then
        self.窗口时间 = tp.运行时间
    end
    if not self.焦点 then
        tp.移动窗口 = false
    end
    if self.可视 and self.鼠标 and  not self.焦点 then
        self.xx = x - self.x
        self.yy = y - self.y
    end
end

function 场景类_开运:开始移动(x,y)
    if self.可视 and self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy
    end
end
return 场景类_开运


